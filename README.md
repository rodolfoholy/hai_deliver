<h1>Project Architecture</h1>

Allure report link: https://rodolfoholy.github.io/hai_deliver/

Setting Up Your Machine
-------------------------
Required installations:
-----------------------

*	Robot Framework: Robot Framework is an open-source generic automation framework. It can be used for test automation (Web, Mobile, and API) and robotic process automation (RPA).
*	Python 3: The programming language used in the tests.
*   JDK: The Java Development Kit (JDK) is one of the three main technology packages used in Java programming, along with the JVM (Java Virtual Machine) and the JRE (Java Runtime Environment).
*   Appium: Appium is an open-source tool for automating native, web, and hybrid applications on iOS, Android, and Windows mobile platforms.
*   Node.js is an open-source, cross-platform JavaScript runtime environment that allows developers to execute JavaScript code server-side. It is built on Chrome's V8 JavaScript engine and is designed to build scalable network applications efficiently.

Setting Up the Test Automation Environment
------------------------------------------------------------

To perform your automation, it is necessary to install some resources, as described below:

Windows
--------

<h3>1. Installing the Python 3</h3>

*	Download from: <https://www.python.org/downloads/>.
*	Run the downloaded file and follow the instructions by clicking ‘next’.
* 	Select the 3 displayed checkboxes and continue clicking ‘next’ until ‘finish’.
*	In the prompt Console, type the command `python --version`; if the installation is correct, the installed version will appear.

<h3>2. Installing the JDK</h3>

*	Download from: <https://www.oracle.com/br/java/technologies/javase/javase-jdk8-downloads.html>.
*	Run the downloaded file and follow the instructions by clicking 'next'.
*	In the Cmder console, type the command `java -version`. If the installation is correct, the installed version will be displayed.

<h3>3. Installing Robot Framework</h3>

*	After installing Python, inside Cmder type: `pip install robotframework`.
*	In the Cmder console, type the command `robot --version`. If the installation is correct, the installed version will be displayed.

<h3>4. Installing Appium</h3>

*	Download Node JS from: <https://nodejs.org/en/download/>.
*	After installing Node JS, inside Cmder type: `npm install appium -g`.
*	In the Cmder console, type the command `java -version`. If the installation is correct, the installed version will be displayed.

<h3>5. Installing the Allure Report</h3>

*	Open the Windows PowerShell and type: 
`bash
irm get.scoop.sh | iex
`
*	In the prompt Console, type the command `allure --version`; if the installation is correct, the installed version will appear.
If you had any problem during installation, follow this documentation: <https://github.com/ScoopInstaller/Install#readme>

And that's it, your environment is set up.


Test Automation
--------------------

For test automation, we will use the Robot Framework.

<h3>Learning to Use the Resources Folder</h3>

*	The resources folder contains the methods used and paths followed based on each keyword utilized.
*	The main.robot file is where most configurations are kept.
*	Codes and workflows are allocated according to the screen that the flow is using (if it is a Order and Returns screen, the keywords will go inside the order_and_returns_keywords.robot)
*   The Gherkin-written test cases will be located within the tests folder, according to the screen that the flow is using (if it is a Order and Returns screen, the keywords will go inside the order_and_returns.robot)

<h3>Using Tags</h3>

We use tags to differentiate scenarios by groups, functionalities, or testing phases. Tags are inserted on the line below the keyword name.
In the terminal, when we want to run scenarios that are named with tags, we simply use the following command:

`bash
robot -d -i tag
`

This command will run all scenarios that have the tag.

Executing Automated Tests
-----------------------------------

To execute the automated tests, we will use some commands from the root folder of our project.

*	To execute all implemented scenarios, we use the following code:
`bash
robot ./tests/
`

*	To execute all scenarios and generate a report with screenshots, we use the following code:
`bash
robot -d ./logs ./tests/
`
*   In the ./logs folder of the project, an HTML file with the test scenarios report is generated.

*	To execute all scenarios and generate a report with Allure Report, we use the following code:
`bash
robot --listener 'allure_robotframework;./allure-results/' ./tests
`
*   After the execution, with Windows PowerShell, you can go to the project folder and execute:
`bash
allure serve
`

Just open it in your browser to view the results.