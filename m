Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f130sm29479wme.41.2019.02.07.10.37.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:37:53 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0A04A1FF89;
	Thu,  7 Feb 2019 18:37:45 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 09/16] tests: make docker.py check for persistent configs
Date: Thu,  7 Feb 2019 18:37:37 +0000
Message-Id: <20190207183744.5054-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: i2UY+rSKDrBY

binfmt_misc configured with the "F" flag opens the interpreter at
config time. This means it can use an already open file-descriptor to
run QEMU so there is no point trying to copy the binary into a
container.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 30f463af9f..768728785f 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -127,6 +127,11 @@ def _check_binfmt_misc(executable):
 
     with open(binfmt_entry) as x: entry = x.read()
 
+    if re.search("flags:.*F.*\n", entry):
+        print("binfmt_misc for %s uses persistent(F) mapping to host binary\n" %
+              (binary))
+        return None
+
     m = re.search("interpreter (\S+)\n", entry)
     interp = m.group(1)
     if interp and interp != executable:
-- 
2.20.1
