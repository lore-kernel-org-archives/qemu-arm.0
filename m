Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b4616636sm61146695e9.19.2024.11.21.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:06:25 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F412A603F4;
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
Subject: [PATCH 17/39] tests/functional: add a QMP backdoor for debugging stalled tests
Date: Thu, 21 Nov 2024 16:57:44 +0000
Message-Id: <20241121165806.476008-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9BYD0c496JgD

From: Daniel P. Berrangé <berrange@redhat.com>

Support the QEMU_TEST_QMP_BACKDOOR=backdoor.sock env variable as a
way to get a QMP backdoor for debugging a stalled QEMU test. Most
typically this would be used if running the tests directly:

 $ QEMU_TEST_QMP_BACKDOOR=backdoor.sock \
   QEMU_TEST_QEMU_BINARY=./build/qemu-system-arm \
   PYTHONPATH=./python \
   ./tests/functional/test_arm_tuxrun.py

And then, when the test stalls, in a second shell run:

 $ ./scripts/qmp/qmp-shell backdoor.sock

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-18-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing/functional.rst      | 10 ++++++++++
 tests/functional/qemu_test/testcase.py |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/docs/devel/testing/functional.rst b/docs/devel/testing/functional.rst
index 6b5d0c5b98..b8ad7b0bf7 100644
--- a/docs/devel/testing/functional.rst
+++ b/docs/devel/testing/functional.rst
@@ -176,6 +176,16 @@ primarily depend on the value of the ``qemu_bin`` class attribute.
 If it is not explicitly set by the test code, its default value will
 be the result the QEMU_TEST_QEMU_BINARY environment variable.
 
+Debugging hung QEMU
+^^^^^^^^^^^^^^^^^^^
+
+When test cases go wrong it may be helpful to debug a stalled QEMU
+process. While the QEMUMachine class owns the primary QMP monitor
+socket, it is possible to request a second QMP monitor be created
+by setting the ``QEMU_TEST_QMP_BACKDOOR`` env variable to refer
+to a UNIX socket name. The ``qmp-shell`` command can then be
+attached to the stalled QEMU to examine its live state.
+
 Attribute reference
 -------------------
 
diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index e2a329c3e5..fceafb32b0 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -175,6 +175,13 @@ def _new_vm(self, name, *args):
                          log_dir=self.logdir)
         self.log.debug('QEMUMachine "%s" created', name)
         self.log.debug('QEMUMachine "%s" temp_dir: %s', name, vm.temp_dir)
+
+        sockpath = os.environ.get("QEMU_TEST_QMP_BACKDOOR", None)
+        if sockpath is not None:
+            vm.add_args("-chardev",
+                        f"socket,id=backdoor,path={sockpath},server=on,wait=off",
+                        "-mon", "chardev=backdoor,mode=control")
+
         if args:
             vm.add_args(*args)
         return vm
-- 
2.39.5
