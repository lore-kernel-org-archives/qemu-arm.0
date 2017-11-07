Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x185sm1709108wmx.12.2017.11.07.07.06.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Nov 2017 07:06:16 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id DE2693E0521;
	Tue,  7 Nov 2017 15:06:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: Dave.Martin@arm.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 08/10] aarch64.risu: initial SVE instruction
Date: Tue,  7 Nov 2017 15:05:56 +0000
Message-Id: <20171107150558.22131-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171107150558.22131-1-alex.bennee@linaro.org>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
X-TUID: 6qx8KLX6AY3q

---
 aarch64.risu | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/aarch64.risu b/aarch64.risu
index 838bded..bfa4ff8 100644
--- a/aarch64.risu
+++ b/aarch64.risu
@@ -2937,3 +2937,27 @@ FCVTZUsi_RES A64_V sf:1 0011110 1 type:1 1 11 001 000000 rn:5 rd:5
 # End of:
 # Data processing - SIMD and floating point
 # Data processing - Scalar Floating-Point and Advanced SIMD
+
+# SVE Instructions
+# Top-level Encodings
+#
+# 31            24 | 23 22 | 21      17 | 16 | 15    10 | 9                 0
+#  y y y y y y y m |  -  - |  m m m m m |  - |          | - - - - - - - - - -
+#
+@SVE
+
+# SVE Integer Arithmetic - Binary Predicated Group
+# 31            24 | 23  22 | 21 | 20  19 | 18 16 | 15  13 | 12           0
+#  0 0 0 0 0 1 0 0 |  size  |  0 |   op   |  ---  |  0 0 0 | ------------- |
+
+SVE_INTA_PRED_UNALL A64_V 00000100 ig:2 010 001 000 ignore2:13
+
+# - SVE integer add/subtract vectors (predicated)
+# 31            24 | 23 22 | 21  19 | 18 16 | 15  13 | 12  10 | 9  5 | 4  0 |
+#  0 0 0 0 0 1 0 0 |  size |  0 0 0 |  opc  |  0 0 0 |   Pg   |  Zm  |  Zn  |
+# opc 010/1xx are UNALLOCATED
+
+SVE_INT_ADDSUB_PRED A64_V 00000100 sz:2 000 opc:3 000 pg:3 zm:5 zn:5
+
+@
+# End of SVE instructions
-- 
2.14.2
