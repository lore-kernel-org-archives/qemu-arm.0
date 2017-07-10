Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r200sm5501975wmd.20.2017.07.10.12.21.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 12:21:32 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id A317F3E0641;
	Mon, 10 Jul 2017 20:21:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v2 3/5] target/arm/translate.h: expand comment on DISAS_EXIT
Date: Mon, 10 Jul 2017 20:21:26 +0100
Message-Id: <20170710192128.9048-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170710192128.9048-1-alex.bennee@linaro.org>
References: <20170710192128.9048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RvT4frvRSH8Z

We already have an exit condition, DISAS_UPDATE which will exit the
run-loop. Expand on the difference with DISAS_EXIT in the comments.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
