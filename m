Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 80sm2631874wms.36.2017.07.20.08.04.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 08:04:38 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 28C5A3E0968;
	Thu, 20 Jul 2017 16:04:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: rth@twiddle.net,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH for 2.11 10/23] target/arm/translate-a64.c: handle_3same_64 comment fix
Date: Thu, 20 Jul 2017 16:04:13 +0100
Message-Id: <20170720150426.12393-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: C/8J8QMlhVrw

We do implement all the opcodes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e55547d95d..68099fdb5e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7135,8 +7135,7 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
     /* Handle 64x64->64 opcodes which are shared between the scalar
      * and vector 3-same groups. We cover every opcode where size == 3
      * is valid in either the three-reg-same (integer, not pairwise)
-     * or scalar-three-reg-same groups. (Some opcodes are not yet
-     * implemented.)
+     * or scalar-three-reg-same groups.
      */
     TCGCond cond;
 
-- 
2.13.0
