Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l11sm1555999wrg.71.2018.02.23.07.46.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 07:46:14 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 1FFB93E0402;
	Fri, 23 Feb 2018 15:46:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 3/8] aarch64.risu: add cryptographic extensions for v8.2
Date: Fri, 23 Feb 2018 15:46:08 +0000
Message-Id: <20180223154613.2096-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180223154613.2096-1-alex.bennee@linaro.org>
References: <20180223154613.2096-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UNhLh5PHkjQ2

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 aarch64.risu | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/aarch64.risu b/aarch64.risu
index 838bded..06a9f3c 100644
--- a/aarch64.risu
+++ b/aarch64.risu
@@ -2937,3 +2937,35 @@ FCVTZUsi_RES A64_V sf:1 0011110 1 type:1 1 11 001 000000 rn:5 rd:5
 # End of:
 # Data processing - SIMD and floating point
 # Data processing - Scalar Floating-Point and Advanced SIMD
+
+# These are optional ARMv8.2 cryptographic extensions
+@v8.2,Cryptographic,CryptographicSHA
+
+# Cryptographic three-register SHA 512
+# 31       21 20  16 15 14 13 12 11    10 9  5 4  0
+# 11001110011   Rm    1  O  0 0   opcode   Rn   Rd
+
+SHA512H   A64_V 1100 1110 011 rm:5 1 0 00 00 rn:5 rd:5
+SHA512H2  A64_V 1100 1110 011 rm:5 1 0 00 01 rn:5 rd:5
+SHA512SUI A64_V 1100 1110 011 rm:5 1 0 00 10 rn:5 rd:5
+RAX1      A64_V 1100 1110 011 rm:5 1 0 00 11 rn:5 rd:5
+SM3PARTW1 A64_V 1100 1110 011 rm:5 1 1 00 00 rn:5 rd:5
+SM3PARTW2 A64_V 1100 1110 011 rm:5 1 1 00 01 rn:5 rd:5
+SM4       A64_V 1100 1110 011 rm:5 1 1 00 10 rn:5 rd:5
+
+# Cryptographic four-register
+# 31       23 22 21 20  16 15 14  10 9  5 4  0
+# 1100 1110 0  Op0    Rm    0   Ra    Rn   Rd
+
+EOR3      A64_V 1110 1110 0 00 rm:5 0 ra:5 rn:5 rd:5
+BCAX      A64_V 1110 1110 0 01 rm:5 0 ra:5 rn:5 rd:5
+SM3SS1    A64_V 1110 1110 0 10 rm:5 0 ra:5 rn:5 rd:5
+
+# Cryptographic two-register SHA 512
+# 31                    12 11  10 9  5 4  0
+# 1100 1110 1100 0000 1000   op    Rn   Rd
+
+SHA512SU0 A64_V 1100 1110 1100 0000 1000 00 rn:5 rd:5
+SM4E      A64_V 1100 1110 1100 0000 1000 01 rn:5 rd:5
+
+@
-- 
2.15.1
