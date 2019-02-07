Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g123sm144421wmd.1.2019.02.07.10.37.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:37:48 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F23FD1FF88;
	Thu,  7 Feb 2019 18:37:44 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 08/16] tests: make docker.py update use configured binfmt path
Date: Thu,  7 Feb 2019 18:37:36 +0000
Message-Id: <20190207183744.5054-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rbM8YlEslGXp

When copying a QEMU binary into a linux-user docker image we should
check what the current configured binfmt_misc path is rather than
just assuming "/usr/bin/qemu-bin". Obviously if the user changes the
configuration afterwards they will break their images again.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 02d8a83847..30f463af9f 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -123,17 +123,17 @@ def _check_binfmt_misc(executable):
 
     if not os.path.exists(binfmt_entry):
         print ("No binfmt_misc entry for %s" % (binary))
-        return False
+        return None
 
     with open(binfmt_entry) as x: entry = x.read()
 
-    qpath = "/usr/bin/%s" % (binary)
-    if not re.search("interpreter %s\n" % (qpath), entry):
-        print ("binfmt_misc for %s does not point to %s" % (binary, qpath))
-        return False
-
-    return True
+    m = re.search("interpreter (\S+)\n", entry)
+    interp = m.group(1)
+    if interp and interp != executable:
+        print("binfmt_misc for %s does not point to %s, using %s" %
+              (binary, executable, interp))
 
+    return interp
 
 def _read_qemu_dockerfile(img_name):
     # special case for Debian linux-user images
@@ -394,9 +394,14 @@ class UpdateCommand(SubCommand):
         tmp = tempfile.NamedTemporaryFile(suffix="dckr.tar.gz")
         tmp_tar = TarFile(fileobj=tmp, mode='w')
 
-        # Add the executable to the tarball
-        bn = os.path.basename(args.executable)
-        ff = "/usr/bin/%s" % bn
+        # Add the executable to the tarball, using the current
+        # configured binfmt_misc path.
+        ff = _check_binfmt_misc(args.executable)
+        if not ff:
+            bn = os.path.basename(args.executable)
+            ff = "/usr/bin/%s" % bn
+            print ("No binfmt_misc configured: copied to %s" % (ff))
+
         tmp_tar.add(args.executable, arcname=ff)
 
         # Add any associated libraries
-- 
2.20.1
