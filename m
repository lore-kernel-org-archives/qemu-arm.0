Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r123-v6sm2344178wmb.21.2018.06.22.07.22.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jun 2018 07:22:00 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 122D13E0BF4;
	Fri, 22 Jun 2018 15:12:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 15/22] risu_reginfo_aarch64: drop stray ;
Date: Fri, 22 Jun 2018 15:11:58 +0100
Message-Id: <20180622141205.16306-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180622141205.16306-1-alex.bennee@linaro.org>
References: <20180622141205.16306-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IrpOpPG8KajB

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu_reginfo_aarch64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index c270e0b..34dd9af 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -66,7 +66,7 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
     for (i = 0; i < 32; i++) {
         ri->vregs[i] = fp->vregs[i];
     }
-};
+}
 
 /* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
 int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2)
-- 
2.17.1
