from locust import HttpUser, TaskSet, task, between

class UserBehavior(TaskSet):
    @task
    def load_test(self):
        # Replace with an actual endpoint of your application
        self.client.get("/api/v1/resource")

class WebsiteUser(HttpUser):
    tasks = [UserBehavior]
    wait_time = between(1, 5)  # Simulate user behavior with wait times
