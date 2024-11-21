Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbee043sm33245f8f.104.2024.11.21.09.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:06:28 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CB893603DB;
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
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 15/39] tests/functional: rewrite console handling to be bytewise
Date: Thu, 21 Nov 2024 16:57:42 +0000
Message-Id: <20241121165806.476008-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: m0PvREy/BeVF

From: Daniel P. Berrangé <berrange@redhat.com>

The console interaction that waits for predicted strings uses
readline(), and thus is only capable of waiting for strings
that are followed by a newline.

This is inconvenient when needing to match on some things,
particularly login prompts, or shell prompts, causing tests
to use time.sleep(...) instead, which is unreliable.

Switch to reading the console 1 byte at a time, comparing
against the success/failure messages until we see a match,
regardless of whether a newline is encountered.

The success/failure comparisons are done with the python bytes
type, rather than strings, to avoid the problem of needing to
decode partially received multibyte utf8 characters.

Heavily inspired by a patch proposed by Cédric, but written
again to work in bytes, rather than strings.

Co-developed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-16-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/cmd.py | 79 +++++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 15 deletions(-)

diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
index f6c4e4dda1..11c8334a7c 100644
--- a/tests/functional/qemu_test/cmd.py
+++ b/tests/functional/qemu_test/cmd.py
@@ -78,6 +78,54 @@ def run_cmd(args):
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
+# @test: functional test to fail if @failure is seen
+# @vm: the VM whose console to process
+# @success: a non-None string to look for
+# @failure: a string to look for that triggers test failure, or None
+#
+# Read up to 1 line of text from @vm, looking for @success
+# and optionally @failure.
+#
+# If @success or @failure are seen, immediately return True,
+# even if end of line is not yet seen. ie remainder of the
+# line is left unread.
+#
+# If end of line is seen, with neither @success or @failure
+# return False
+#
+# If @failure is seen, then mark @test as failed
+def _console_read_line_until_match(test, vm, success, failure):
+    msg = bytes([])
+    done = False
+    while True:
+        c = vm.console_socket.recv(1)
+        if c is None:
+            done = True
+            test.fail(
+                f"EOF in console, expected '{success}'")
+            break
+        msg += c
+
+        if success in msg:
+            done = True
+            break
+        if failure and failure in msg:
+            done = True
+            vm.console_socket.close()
+            test.fail(
+                f"'{failure}' found in console, expected '{success}'")
+
+        if c == b'\n':
+            break
+
+    console_logger = logging.getLogger('console')
+    try:
+        console_logger.debug(msg.decode().strip())
+    except:
+        console_logger.debug(msg)
+
+    return done
+
 def _console_interaction(test, success_message, failure_message,
                          send_string, keep_sending=False, vm=None):
     assert not keep_sending or send_string
@@ -85,11 +133,22 @@ def _console_interaction(test, success_message, failure_message,
 
     if vm is None:
         vm = test.vm
-    console = vm.console_file
-    console_logger = logging.getLogger('console')
+
     test.log.debug(
         f"Console interaction: success_msg='{success_message}' " +
         f"failure_msg='{failure_message}' send_string='{send_string}'")
+
+    # We'll process console in bytes, to avoid having to
+    # deal with unicode decode errors from receiving
+    # partial utf8 byte sequences
+    success_message_b = None
+    if success_message is not None:
+        success_message_b = success_message.encode()
+
+    failure_message_b = None
+    if failure_message is not None:
+        failure_message_b = failure_message.encode()
+
     while True:
         if send_string:
             vm.console_socket.sendall(send_string.encode())
@@ -102,20 +161,10 @@ def _console_interaction(test, success_message, failure_message,
                 break
             continue
 
-        try:
-            msg = console.readline().decode().strip()
-        except UnicodeDecodeError:
-            msg = None
-        if not msg:
-            continue
-        console_logger.debug(msg)
-        if success_message in msg:
+        if _console_read_line_until_match(test, vm,
+                                          success_message_b,
+                                          failure_message_b):
             break
-        if failure_message and failure_message in msg:
-            console.close()
-            fail = 'Failure message found in console: "%s". Expected: "%s"' % \
-                    (failure_message, success_message)
-            test.fail(fail)
 
 def interrupt_interactive_console_until_pattern(test, success_message,
                                                 failure_message=None,
-- 
2.39.5
