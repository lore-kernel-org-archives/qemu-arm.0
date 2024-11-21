Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedfccsm14917f8f.101.2024.11.21.08.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:58:14 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B718F603D3;
	Thu, 21 Nov 2024 16:58:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-riscv@nongnu.org,
	Thomas Huth <huth@tuxfamily.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-s390x@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-rust@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ani Sinha <anisinha@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 14/39] tests/functional: require non-NULL success_message for console wait
Date: Thu, 21 Nov 2024 16:57:41 +0000
Message-Id: <20241121165806.476008-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vtXunpbr4F/1

From: Daniel P. Berrangé <berrange@redhat.com>

When waiting for expected output, the 'success_message' is a mandatory
parameter, with 'failure_message' defaulting to None.

The code has logic which indicates it was trying to cope with
'success_message' being None and 'failure_message' being non-None but
it does not appear able to actually do anything useful. The check for
'success_message is None' will break out of the loop before any check
for 'failure_message' has been performed.

IOW, for practcal purposes 'success_message' must be non-None unless
'send_string' is set. Assert this expectation and simplify the loop
logic.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-15-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/cmd.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
index 98722a9cf6..f6c4e4dda1 100644
--- a/tests/functional/qemu_test/cmd.py
+++ b/tests/functional/qemu_test/cmd.py
@@ -81,6 +81,8 @@ def is_readable_executable_file(path):
 def _console_interaction(test, success_message, failure_message,
                          send_string, keep_sending=False, vm=None):
     assert not keep_sending or send_string
+    assert success_message or send_string
+
     if vm is None:
         vm = test.vm
     console = vm.console_file
@@ -95,7 +97,7 @@ def _console_interaction(test, success_message, failure_message,
                 send_string = None # send only once
 
         # Only consume console output if waiting for something
-        if success_message is None and failure_message is None:
+        if success_message is None:
             if send_string is None:
                 break
             continue
@@ -107,7 +109,7 @@ def _console_interaction(test, success_message, failure_message,
         if not msg:
             continue
         console_logger.debug(msg)
-        if success_message is None or success_message in msg:
+        if success_message in msg:
             break
         if failure_message and failure_message in msg:
             console.close()
@@ -138,6 +140,7 @@ def interrupt_interactive_console_until_pattern(test, success_message,
     :param interrupt_string: a string to send to the console before trying
                              to read a new line
     """
+    assert success_message
     _console_interaction(test, success_message, failure_message,
                          interrupt_string, True)
 
@@ -152,6 +155,7 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
     """
+    assert success_message
     _console_interaction(test, success_message, failure_message, None, vm=vm)
 
 def exec_command(test, command):
@@ -180,6 +184,7 @@ def exec_command_and_wait_for_pattern(test, command,
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
     """
+    assert success_message
     _console_interaction(test, success_message, failure_message, command + '\r')
 
 def get_qemu_img(test):
-- 
2.39.5
