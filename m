Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id r4-20020adfdc84000000b002f598008d50sm10341053wrj.34.2023.04.24.02.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A848B1FFB8;
	Mon, 24 Apr 2023 10:22:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Markus Armbruster <armbru@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	David Hildenbrand <david@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Kautuk Consul <kconsul@linux.vnet.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH 11/18] avocado_qemu/__init__.py: factor out the qemu-img finding
Date: Mon, 24 Apr 2023 10:22:42 +0100
Message-Id: <20230424092249.58552-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KILG/ZSHdDQW

From: Kautuk Consul <kconsul@linux.vnet.ibm.com>

Factor out the code that finds the qemu-img binary in the
QemuSystemTest class and create a new get_qemu_img() function
with it. This function will get called also from the new code
in tuxrun_baselines.py avocado test-case.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230421042322.684093-2-kconsul@linux.vnet.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/avocado_qemu/__init__.py | 27 +++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 6788837e1b..33090903f1 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -330,6 +330,19 @@ def _new_vm(self, name, *args):
             vm.add_args(*args)
         return vm
 
+    def get_qemu_img(self):
+        self.log.debug('Looking for and selecting a qemu-img binary')
+
+        # If qemu-img has been built, use it, otherwise the system wide one
+        # will be used.
+        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
+        if not os.path.exists(qemu_img):
+            qemu_img = find_command('qemu-img', False)
+        if qemu_img is False:
+            self.cancel('Could not find "qemu-img"')
+
+        return qemu_img
+
     @property
     def vm(self):
         return self.get_vm(name='default')
@@ -602,17 +615,9 @@ def set_up_existing_ssh_keys(self):
         return (ssh_public_key, ssh_private_key)
 
     def download_boot(self):
-        self.log.debug('Looking for and selecting a qemu-img binary to be '
-                       'used to create the bootable snapshot image')
-        # If qemu-img has been built, use it, otherwise the system wide one
-        # will be used.  If none is available, the test will cancel.
-        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
-        if not os.path.exists(qemu_img):
-            qemu_img = find_command('qemu-img', False)
-        if qemu_img is False:
-            self.cancel('Could not find "qemu-img", which is required to '
-                        'create the bootable image')
-        vmimage.QEMU_IMG = qemu_img
+        # Set the qemu-img binary.
+        # If none is available, the test will cancel.
+        vmimage.QEMU_IMG = super().get_qemu_img()
 
         self.log.info('Downloading/preparing boot image')
         # Fedora 31 only provides ppc64le images
-- 
2.39.2
