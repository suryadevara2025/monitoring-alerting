# AWS Monitoring and Alerting

## Objective

To configure AWS CloudWatch monitoring and alerting for CPU, memory, disk usage, and application availability of an EC2-based backend application.

## Architecture

Internet
    |
    v
AWS EC2 Instance
    |
    +-- Backend Application :8080
    |
    +-- CloudWatch Agent
    |      |
    |      +-- Memory
    |      +-- Disk
    |
    +-- EC2 Monitoring
           |
           +-- CPU
           
CloudWatch
    |
    +-- CPU Alarm
    +-- Memory Alarm
    +-- Disk Alarm
    +-- Application Availability Alarm

## AWS Services Used

- Amazon EC2
- Amazon CloudWatch
- CloudWatch Agent
- IAM
- Systemd

## Monitoring Configuration

### CPU Monitoring

Metric:

CPUUtilization

Threshold:

CPU >= 90%

Period:

1 minute

Datapoints:

2 out of 2

### Memory Monitoring

Metric:

mem_used_percent

Namespace:

CWAgent

Threshold:

Memory >= 80%

Period:

1 minute

Datapoints:

2 out of 2

### Disk Monitoring

Metric:

disk_used_percent

Namespace:

CWAgent

Path:

/

Threshold:

Disk usage >= 80%

Period:

1 minute

Datapoints:

2 out of 2

### Application Availability

The backend application runs on port 8080.

Health endpoint:

http://localhost:8080/health

The application availability metric is monitored using CloudWatch.

## Alarm Testing

### CPU Test

CPU load was increased using stress-ng.

Expected result:

OK -> ALARM -> OK

### Memory Test

Memory usage was increased using stress-ng.

Expected result:

OK -> ALARM -> OK

### Disk Test

Temporary disk data was created on the root filesystem.

Expected result:

OK -> ALARM -> OK

### Application Availability Test

The backend systemd service was stopped.

Expected result:

OK -> ALARM

The backend service was then restarted.

Expected result:

ALARM -> OK

## Troubleshooting

### CPU Alarm

The CPU alarm initially remained in OK state.

Detailed EC2 monitoring was enabled and the alarm was configured with a 1-minute period.

### Memory Alarm

The memory metric was confirmed using CloudWatch Agent.

The alarm period was changed from 5 minutes to 1 minute to match the metric evaluation requirement.

### Disk Alarm

The initial disk test failed because /tmp was a separate 1.9 GB tmpfs.

The test file was created on the root filesystem instead.

### Application Availability

The backend service name was verified as:

monitoring-backend.service

The service was stopped and restarted to test application availability.

## Testing Result

All four monitoring alarms were successfully tested.

CPU:

OK -> ALARM -> OK

Memory:

OK -> ALARM -> OK

Disk:

OK -> ALARM -> OK

Application Availability:

OK -> ALARM -> OK

## Prevention and Recommendations

- Use appropriate monitoring resolution for alarm periods.
- Keep CloudWatch Agent configuration correct.
- Verify metric dimensions before creating alarms.
- Test alarms periodically.
- Monitor CloudWatch alarm history.
- Remove temporary test files after testing.
- Keep the backend service managed through systemd.

## Repository Structure

monitoring-alerting/

├── backend/

│   └── health-check.sh

├── documentation/

│   └── monitoring-alerting-documentation.md

├── scripts/

│   ├── cpu-test.sh

│   ├── memory-test.sh

│   └── disk-test.sh

└── README.md

## Conclusion

AWS CloudWatch monitoring and alerting was successfully configured and tested for CPU, memory, disk, and application availability. All four alarms successfully demonstrated the expected ALARM and recovery behavior.
