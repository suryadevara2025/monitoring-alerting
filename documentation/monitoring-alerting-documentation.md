# AWS Monitoring and Alerting

## Objective

To configure AWS CloudWatch monitoring and alerts for CPU, memory, disk usage, and application availability.

## AWS Services Used

- Amazon EC2
- Amazon CloudWatch
- CloudWatch Agent
- IAM
- Systemd

## Monitoring Configuration

The EC2 instance is monitored for CPU, memory, disk, and application availability.

## CPU Monitoring

CPU utilization is monitored using the EC2 CPUUtilization metric.

Alarm threshold:
CPU >= 90%

Period:
1 minute

Datapoints:
2 out of 2

## Memory Monitoring

Memory utilization is monitored using the CloudWatch Agent metric mem_used_percent.

Alarm threshold:
Memory >= 80%

Period:
1 minute

Datapoints:
2 out of 2

## Disk Monitoring

Disk utilization is monitored using the CloudWatch Agent metric disk_used_percent.

Alarm threshold:
Disk usage >= 80%

Period:
1 minute

Datapoints:
2 out of 2

## Application Availability

The backend application health is monitored through the application health endpoint.

The application runs on port 8080.

Health endpoint:

/health

## Testing

CPU, memory, disk, and application availability alarms were tested using controlled conditions.

Each alarm successfully changed from:

OK -> ALARM -> OK

## Conclusion

CloudWatch monitoring and alerting was successfully configured and tested for the backend application and EC2 instance.
