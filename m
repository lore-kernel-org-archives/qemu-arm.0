Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t12sm7119424wmd.32.2017.07.13.07.19.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jul 2017 07:19:31 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 1C08F3E07A0;
	Thu, 13 Jul 2017 15:19:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 3/6] target/arm/translate.h: expand comment on DISAS_EXIT
Date: Thu, 13 Jul 2017 15:19:25 +0100
Message-Id: <20170713141928.25419-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170713141928.25419-1-alex.bennee@linaro.org>
References: <20170713141928.25419-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8EXZ57LbvlVs

We already have an exit condition, DISAS_UPDATE which will exit the
run-loop. Expand on the difference with DISAS_EXIT in the comments.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 15d383d9af..12fd79ba8e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -140,7 +140,10 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
  */
 #define DISAS_BX_EXCRET 11
 /* For instructions which want an immediate exit to the main loop,
- * as opposed to attempting to use lookup_and_goto_ptr.
+ * as opposed to attempting to use lookup_and_goto_ptr. Unlike
+ * DISAS_UPDATE this doesn't write the PC on exiting the translation
+ * loop so you need to ensure something (gen_a64_set_pc_im or runtime
+ * helper) has done so before we reach return from cpu_tb_exec.
  */
 #define DISAS_EXIT 12
 
-- 
2.13.0
