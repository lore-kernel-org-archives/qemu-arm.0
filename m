Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n64sm1303927wmd.36.2017.10.31.07.54.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Oct 2017 07:54:58 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id A9E993E0CA1;
	Tue, 31 Oct 2017 14:54:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 1/7] aarch64.risu: document naming conventions
Date: Tue, 31 Oct 2017 14:54:38 +0000
Message-Id: <20171031145444.13766-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171031145444.13766-1-alex.bennee@linaro.org>
References: <20171031145444.13766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1SVo3E+V9+Yx

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 aarch64.risu | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/aarch64.risu b/aarch64.risu
index 2f3341c..5e7ec59 100644
--- a/aarch64.risu
+++ b/aarch64.risu
@@ -19,6 +19,14 @@
 # XXX NIY: SP-related instructions
 # XXX NIY: floating point and SIMD specific insns
 
+# Instruction suffixes to identify variants
+#   m - memory (loads/stores)
+#   s - scalar
+#   v - vector
+#   z - zero (e.g. compare to zero)
+#   f - fixed point
+#
+
 # - - - - 1 - 0 - - - - - - - - - - - - - - - Loads and stores
 # C3.3 Loads and stores
 
-- 
2.14.2
