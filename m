Received: by 10.25.159.19 with SMTP id i19csp857754lfe;
        Fri, 12 Feb 2016 06:36:41 -0800 (PST)
X-Received: by 10.98.40.200 with SMTP id o191mr2593625pfo.83.1455287801256;
        Fri, 12 Feb 2016 06:36:41 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com. [2607:f8b0:400e:c00::241])
        by mx.google.com with ESMTPS id bf9si20357010pac.163.2016.02.12.06.36.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2016 06:36:41 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::241 as permitted sender) client-ip=2607:f8b0:400e:c00::241;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::241 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x241.google.com with SMTP id e127so4059789pfe.3;
        Fri, 12 Feb 2016 06:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9zHW8MdnBap+PWGIIZRvMIc3FR2lIZ7K0NVWqwaDLNg=;
        b=TGRKBg0n9luRafbj/tDQZ1aELREVGp8P/29q7b0CGPIB3h3B+gz1qckCfNoNLPV+YT
         imx7PrO2KPJn4Knyw341QGQmNaJ4Eds5yt8ugOkNyYnVZgSn+aXo1gecKnCnTAhuyj53
         AC5wPGsCLM4KM2MEJtIk81PNXpVMaw9MlGtLlT28P9H3N8pt13zInFTaA6aVInI8FEsx
         mFjCWNAkSPiVUUoDFvDJZfckL/Spuc3oDpL46753OMGaIc/02dSQzAoOzG0XWDDtgYF1
         OaFrnfoswHJ0eqnqu8+L7QvrLwTn/Ps0zzRnRUY9oiGdUydJOBG9BsqCBzssftL3m522
         kuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9zHW8MdnBap+PWGIIZRvMIc3FR2lIZ7K0NVWqwaDLNg=;
        b=KFawJqMVR4SBNBYP4tedAHGh8rMYZ+zKxxu1Y6DSL5f0T1dZ7lgl55GqVfuuPdjZYd
         YiOTW974IWGL3ujo1ZZhGOIrIQ7rezLz4MrmQeiegUPwMcq35b2wLTdBzoWiV50GRhn5
         qfWV/A0wF/672w0M3jReZ0iu/6KeaPDw8tsHpHdoCbRyYBVEpw2hDmeIJIIcQ44fXc1h
         BTbLPHBtl53lOBXiVbr6Vem8Fns1iKBsqfgGbohK5+Khs7v1/q+gMCrlnhPGm7hHTayJ
         CXg6YdXid8zUcYi5nBbM1K4oo3wEBlcr8vzbOnoY5Ca7ZyyZiiPC8926n57idoF2S1o+
         hIFg==
X-Gm-Message-State: AG10YOS38vRvRHNvf4Riwsmy+bdFS3Y61B/EnxQi7roVNdvi7L6tSkX9oxq6Js4DgZICNQ==
X-Received: by 10.98.40.5 with SMTP id o5mr2651791pfo.76.1455287800928;
        Fri, 12 Feb 2016 06:36:40 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id 82sm19965622pfn.89.2016.02.12.06.36.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:36:40 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 2/9] gen-icount: Use tcg_set_insn_param
Date: Fri, 12 Feb 2016 15:33:55 +0100
Message-Id: <1455287642-28166-3-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: jJAkesiuORhF

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
1.9.1
