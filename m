Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x21sm20654642wme.24.2017.07.04.07.48.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2017 07:48:15 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 228F13E21FD;
	Tue,  4 Jul 2017 15:49:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 08/11] aarch64.risu: document naming conventions
Date: Tue,  4 Jul 2017 15:48:56 +0100
Message-Id: <20170704144859.17644-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170704144859.17644-1-alex.bennee@linaro.org>
References: <20170704144859.17644-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yNvfbyDNYDbG

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 aarch64.risu | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/aarch64.risu b/aarch64.risu
index 2f3341c..bfca45f 100644
--- a/aarch64.risu
+++ b/aarch64.risu
@@ -7,6 +7,7 @@
 #
 # Contributors:
 #     Claudio Fontana - initial implementation
+#     Alex Bennée - a number of additions including v8.2 FP16
 #     based on arm.risu by Peter Maydell
 ###############################################################################
 
@@ -19,6 +20,15 @@
 # XXX NIY: SP-related instructions
 # XXX NIY: floating point and SIMD specific insns
 
+# Instruction suffixes to identify variants
+#   m - memory (loads/stores)
+#   s - scalar
+#   v - vector
+#   z - zero (e.g. compare to zero)
+#   f - fixed point
+#
+# _FP16 for ARMv8.2 half-precision extensions
+
 # - - - - 1 - 0 - - - - - - - - - - - - - - - Loads and stores
 # C3.3 Loads and stores
 
-- 
2.13.0
