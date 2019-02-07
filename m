Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f10sm27930wmb.35.2019.02.07.10.37.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:37:55 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5FC811FF90;
	Thu,  7 Feb 2019 18:37:45 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 16/16] scripts/qemu.py: allow arches use KVM for their 32bit cousins
Date: Thu,  7 Feb 2019 18:37:44 +0000
Message-Id: <20190207183744.5054-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: R1kWMjI9TqTa

A lot of architectures can run their 32 bit cousins on KVM so the
kvm_available function needs to be a little less restricting when
deciding if KVM is available.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/qemu.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/qemu.py b/scripts/qemu.py
index 0a5e02eb56..32b00af5cc 100644
--- a/scripts/qemu.py
+++ b/scripts/qemu.py
@@ -25,10 +25,18 @@ import tempfile
 
 LOG = logging.getLogger(__name__)
 
+# Mapping host architecture to any additional architectures it can
+# support which often includes its 32 bit cousin.
+ADDITIONAL_ARCHES = {
+    "x86_64" : "i386",
+    "aarch64" : "armhf"
+}
 
 def kvm_available(target_arch=None):
-    if target_arch and target_arch != os.uname()[4]:
-        return False
+    host_arch = os.uname()[4]
+    if target_arch and target_arch != host_arch:
+        if target_arch != ADDITIONAL_ARCHES.get(host_arch):
+            return False
     return os.access("/dev/kvm", os.R_OK | os.W_OK)
 
 
-- 
2.20.1
