import allure
from robot.libraries.BuiltIn import BuiltIn

class AppiumLibraryHelper(object):
    ROBOT_LIBRARY_SCOPE = "TEST SUITE"
    ROBOT_LISTENER_API_VERSION = 2

    def __init__(self):
        self.ROBOT_LIBRARY_LISTENER = self

    def _start_suite(self, name, attrs):
         BuiltIn().set_library_search_order('AppiumLibraryHelper')

    def capture_page_screenshot(self):
        ul = BuiltIn().get_library_instance('AppiumLibrary')
        path = ul.capture_page_screenshot()
        allure.attach.file(path, name="screenshot", attachment_type=allure.attachment_type.JPG)
        return path

