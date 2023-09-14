Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s23-20020a7bc397000000b00403bbe69629sm2299139wmj.31.2023.09.14.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 08:54:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4F3A11FFC3;
	Thu, 14 Sep 2023 16:54:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 8/9] tests/avocado: Fix console data loss
Date: Thu, 14 Sep 2023 16:54:21 +0100
Message-Id: <20230914155422.426639-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914155422.426639-1-alex.bennee@linaro.org>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ft/gPhhIffMF

From: Nicholas Piggin <npiggin@gmail.com>

Occasionally some avocado tests will fail waiting for console line
despite the machine running correctly. Console data goes missing, as can
be seen in the console log. This is due to _console_interaction calling
makefile() on the console socket each time it is invoked, which must be
losing old buffer contents when going out of scope.

It is not enough to makefile() with buffered=0. That helps significantly
but data loss is still possible. My guess is that readline() has a line
buffer even when the file is in unbuffered mode, that can eat data.

Fix this by providing a console file that persists for the life of the
console.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: "Daniel P. Berrangé" <berrange@redhat.com>
Message-Id: <20230912131340.405619-1-npiggin@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 python/qemu/machine/machine.py         | 19 +++++++++++++++++++
 tests/avocado/avocado_qemu/__init__.py |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index c16a0b6fed..35d5a672db 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -191,6 +191,7 @@ def __init__(self,
             self.sock_dir, f"{self._name}.con"
         )
         self._console_socket: Optional[socket.socket] = None
+        self._console_file: Optional[socket.SocketIO] = None
         self._remove_files: List[str] = []
         self._user_killed = False
         self._quit_issued = False
@@ -509,6 +510,11 @@ def _early_cleanup(self) -> None:
         # If we keep the console socket open, we may deadlock waiting
         # for QEMU to exit, while QEMU is waiting for the socket to
         # become writable.
+        if self._console_file is not None:
+            LOG.debug("Closing console file")
+            self._console_file.close()
+            self._console_file = None
+
         if self._console_socket is not None:
             LOG.debug("Closing console socket")
             self._console_socket.close()
@@ -874,12 +880,25 @@ def console_socket(self) -> socket.socket:
         Returns a socket connected to the console
         """
         if self._console_socket is None:
+            LOG.debug("Opening console socket")
             self._console_socket = console_socket.ConsoleSocket(
                 self._console_address,
                 file=self._console_log_path,
                 drain=self._drain_console)
         return self._console_socket
 
+    @property
+    def console_file(self) -> socket.SocketIO:
+        """
+        Returns a file associated with the console socket
+        """
+        if self._console_file is None:
+            LOG.debug("Opening console file")
+            self._console_file = self.console_socket.makefile(mode='rb',
+                                                              buffering=0,
+                                                              encoding='utf-8')
+        return self._console_file
+
     @property
     def temp_dir(self) -> str:
         """
diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 33090903f1..0172a359b7 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -137,7 +137,7 @@ def _console_interaction(test, success_message, failure_message,
     assert not keep_sending or send_string
     if vm is None:
         vm = test.vm
-    console = vm.console_socket.makefile(mode='rb', encoding='utf-8')
+    console = vm.console_file
     console_logger = logging.getLogger('console')
     while True:
         if send_string:
-- 
2.39.2
