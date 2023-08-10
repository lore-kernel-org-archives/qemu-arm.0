Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z15-20020a05600c114f00b003fe2bea77ccsm2504470wmz.5.2023.08.10.08.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 08:36:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6F52C1FFC1;
	Thu, 10 Aug 2023 16:36:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 6/8] tests/tcg: ensure system-mode gdb tests start stopped
Date: Thu, 10 Aug 2023 16:36:38 +0100
Message-Id: <20230810153640.1879717-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230810153640.1879717-1-alex.bennee@linaro.org>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5cJyeUCzTJ+1

Without -S we run into potential races with tests starting before the
gdbstub attaches. We don't need to worry about user-mode as enabling
the gdbstub implies we wait for the initial connection.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/guest-debug/run-test.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index c0d0075e2e..b13b27d4b1 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -69,13 +69,10 @@ def log(output, msg):
 
     # Launch QEMU with binary
     if "system" in args.qemu:
-        cmd = "%s %s %s -gdb unix:path=%s,server=on" % (args.qemu,
-                                                        args.qargs,
-                                                        args.binary,
-                                                        socket_name)
+        cmd = f'{args.qemu} {args.qargs} {args.binary}' \
+            f' -S -gdb unix:path={socket_name},server=on'
     else:
-        cmd = "%s %s -g %s %s" % (args.qemu, args.qargs, socket_name,
-                                  args.binary)
+        cmd = f'{args.qemu} {args.qargs} -g {socket_name} {args.binary}'
 
     log(output, "QEMU CMD: %s" % (cmd))
     inferior = subprocess.Popen(shlex.split(cmd))
-- 
2.39.2
