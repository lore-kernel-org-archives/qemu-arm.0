Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 132-v6sm4114638wmr.33.2018.06.13.06.04.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 06:04:49 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 3D4993E1351;
	Wed, 13 Jun 2018 13:56:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 21/22] risu_reginfo_aarch64: limit SVE_VQ_MAX to current architecture
Date: Wed, 13 Jun 2018 13:56:00 +0100
Message-Id: <20180613125601.14371-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Go/FNH7y4rDE

From: Richard Henderson <richard.henderson@linaro.org>

The kernel headers optimistically assume it's going to grow but as we
are never going to use that many on current hardware we limit
SVE_VQ_MAX to what we will.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risu_reginfo_aarch64.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/risu_reginfo_aarch64.h b/risu_reginfo_aarch64.h
index b3701b3..c33b86f 100644
--- a/risu_reginfo_aarch64.h
+++ b/risu_reginfo_aarch64.h
@@ -31,6 +31,11 @@ struct sve_reginfo {
 };
 #endif
 
+/* The kernel headers set this based on future arch extensions.
+   The current arch maximum is 16.  Save space below.  */
+#undef SVE_VQ_MAX
+#define SVE_VQ_MAX 16
+
 struct reginfo {
     uint64_t fault_address;
     uint64_t regs[31];
-- 
2.17.1
