Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t124-v6sm1888164wmt.29.2018.06.13.05.56.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 05:56:01 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 3F4D03E107F;
	Wed, 13 Jun 2018 13:56:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 01/22] risu_reginfo_aarch64: include signal.h for FPSIMD_MAGIC
Date: Wed, 13 Jun 2018 13:55:40 +0100
Message-Id: <20180613125601.14371-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: q5fOVmsY0ekz

Building with the Bionic Beaver cross compilers fails which probably
means we were getting this as a side effect before. Include the
correct header to get at these bits.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risu_reginfo_aarch64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index e3fadde..3bb4339 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -13,6 +13,7 @@
 #include <stdio.h>
 #include <ucontext.h>
 #include <string.h>
+#include <signal.h> /* for FPSIMD_MAGIC */
 
 #include "risu.h"
 #include "risu_reginfo_aarch64.h"
-- 
2.17.1
