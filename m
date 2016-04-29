Received: by 10.25.208.137 with SMTP id h131csp819572lfg;
        Fri, 29 Apr 2016 05:08:11 -0700 (PDT)
X-Received: by 10.194.2.130 with SMTP id 2mr21178278wju.77.1461931688609;
        Fri, 29 Apr 2016 05:08:08 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id ko8si17043509wjc.212.2016.04.29.05.08.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x243.google.com with SMTP id w143so4514452wmw.3;
        Fri, 29 Apr 2016 05:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+QWtejpj7urMP5cQsAvn135kbQjniVxyKEehJs0yjlc=;
        b=kNwXVlvvbjrxfN5ed05mV8N8qRebB8HbOF4jAG1BYC4BcfPUbCtaSwWAVFCkWD16WY
         9Uc4oKTOoaaURoccrAkkJRIMZEF1m7wcI/GdAdwo28R65p7vlV1nux/5e21x2B5KrEe6
         SHzI3T4nULOMY5RwKLuRzGbFHk+6DUpxdDYnwJbTa2EOezphq6JtwFpZQEDMd6kuWUGq
         GjL6cUfJJUj9HAcqBuOAeTUNMAPGbvWpsjgr2GETf9r+PgGC3ds2Lfe86pOiOqMVrlLz
         1Zltyr3uGESl3dKLFPG83xHXiq/PrRXXrhqlv6Y2puFA5xAhq2WWm4pZqvka+v28ulz9
         gr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+QWtejpj7urMP5cQsAvn135kbQjniVxyKEehJs0yjlc=;
        b=hor9kDG0f5RBe4v8YJuVG5aXcZOYm9bON5RrBM5H7UaqyVeexEGvKZwQ/1BFYc5Rmf
         XXSm8UVetTAk4On/ejz6ABVywT+UA8jY5F4s84Yg2yFsP6Z1u+dZRN/0q7BK2tZagrcL
         g5C/iTkmZqQI+dIt1hdRTxpALQBA57ft8+1JmEEBTtTQb1ZK6ni+fpqJlInzToyut4JD
         rHQe8m4xqhs/ih1pcEXoepBBcZdi7QVcXHDJ7F/mYZyp79zvT+2GYMAX+J6ej9MGLelY
         vnePwQ1viP7UVqXsDwzarwmim7HgXobz/yM8TyZG68kgTj7tIqfkwJ/INP11BiEhBqwI
         GwjA==
X-Gm-Message-State: AOPr4FU7st7T4R6vTVi7PKV3M7hET2FP3zeEU2k/lmBpxnrSNsAx6BLXELqC//ixj8obzA==
X-Received: by 10.194.15.8 with SMTP id t8mr1144181wjc.177.1461931688330;
        Fri, 29 Apr 2016 05:08:08 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id n66sm3027718wmf.6.2016.04.29.05.08.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:07 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v3 2/7] gen-icount: Use tcg_set_insn_param
Date: Fri, 29 Apr 2016 14:07:59 +0200
Message-Id: <1461931684-1867-3-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
References: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: SAB/qMovKX9m

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use tcg_set_insn_param() instead of directly accessing internal
tcg data structures to update an insn param.

Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/exec/gen-icount.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 05d89d3..a011324 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -5,14 +5,13 @@
 
 /* Helpers for instruction counting code generation.  */
 
-static TCGArg *icount_arg;
+static int icount_start_insn_idx;
 static TCGLabel *icount_label;
 static TCGLabel *exitreq_label;
 
 static inline void gen_tb_start(TranslationBlock *tb)
 {
     TCGv_i32 count, flag, imm;
-    int i;
 
     exitreq_label = gen_new_label();
     flag = tcg_temp_new_i32();
@@ -31,13 +30,12 @@ static inline void gen_tb_start(TranslationBlock *tb)
                    -ENV_OFFSET + offsetof(CPUState, icount_decr.u32));
 
     imm = tcg_temp_new_i32();
+    /* We emit a movi with a dummy immediate argument. Keep the insn index
+     * of the movi so that we later (when we know the actual insn count)
+     * can update the immediate argument with the actual insn count.  */
+    icount_start_insn_idx = tcg_op_buf_count();
     tcg_gen_movi_i32(imm, 0xdeadbeef);
 
-    /* This is a horrid hack to allow fixing up the value later.  */
-    i = tcg_ctx.gen_last_op_idx;
-    i = tcg_ctx.gen_op_buf[i].args;
-    icount_arg = &tcg_ctx.gen_opparam_buf[i + 1];
-
     tcg_gen_sub_i32(count, count, imm);
     tcg_temp_free_i32(imm);
 
@@ -53,7 +51,9 @@ static void gen_tb_end(TranslationBlock *tb, int num_insns)
     tcg_gen_exit_tb((uintptr_t)tb + TB_EXIT_REQUESTED);
 
     if (tb->cflags & CF_USE_ICOUNT) {
-        *icount_arg = num_insns;
+        /* Update the num_insn immediate parameter now that we know
+         * the actual insn count.  */
+        tcg_set_insn_param(icount_start_insn_idx, 1, num_insns);
         gen_set_label(icount_label);
         tcg_gen_exit_tb((uintptr_t)tb + TB_EXIT_ICOUNT_EXPIRED);
     }
-- 
2.5.0
