Received: by 10.25.208.211 with SMTP id h202csp31127lfg;
        Fri, 19 Feb 2016 12:05:07 -0800 (PST)
X-Received: by 10.98.64.4 with SMTP id n4mr20653632pfa.58.1455912307716;
        Fri, 19 Feb 2016 12:05:07 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x234.google.com (mail-pa0-x234.google.com. [2607:f8b0:400e:c03::234])
        by mx.google.com with ESMTPS id e68si18356968pfj.170.2016.02.19.12.05.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 12:05:07 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::234 as permitted sender) client-ip=2607:f8b0:400e:c03::234;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::234 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x234.google.com with SMTP id fy10so55456048pac.1;
        Fri, 19 Feb 2016 12:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9zHW8MdnBap+PWGIIZRvMIc3FR2lIZ7K0NVWqwaDLNg=;
        b=aVjLW3wNzPkmw279qZ2yZ4l3Tx/MMPLS4+cvzxjLh1Fy96+0T+vsuzdTxY9CQyw1RB
         G7sRuajAfOijis0+r2vKjTXJXPYvm1Gr6RC8+IW6w/s+W7o4MR/1OuknonDM1kd7fWZ1
         THaVVxLpcgNhob9vC4eu8JALhil7McoYz2W41/1+0MyisIMlgDO64aY0KzAi7hPFvVZz
         qWr8VSASKocFkTPP28qnuk1bxuwa3eCFoX0JLqZqRJprwCyLp6tXIpFLirU3LmV0kNnX
         lzmSZebiJsShVsUAI3e5QP9jY1italxemwOxZmY1Z9QGYCeT9suk7ImgLfjDoPntuTXh
         Lerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9zHW8MdnBap+PWGIIZRvMIc3FR2lIZ7K0NVWqwaDLNg=;
        b=foRuuB5bNcW084lq/jk00qKqDsbLXwtNkZTvpHQ7dVTluDij8eq6hxg7NGh3/K3LUj
         S+bUbbXZJCnkWZ5INEKlCBBDCiHSxIL9gxfCmciKzky+MTgSj6OR+QDw3e4s+g+lyxM4
         riexrXWoTNCirlc5XrLyCfMUZdVWdxgY3RrbMX/qR4v5icy1Dx0r3xPizOrgNhDHjCpZ
         LRTWhAM43wQbrihkpwcDDOnuN012FL5129GgW+4+evcPx31kPstQzlsbhzqZAb7Ivd7e
         Ao6G4/Fdp6u5zCDriPTdE5OZ3WjnkcDtFCOMVInQ4S+JB5bvhUvNPsmboRz3s3PAooD3
         rwyQ==
X-Gm-Message-State: AG10YOQW3YiLRo5ipt7pUX2Vzj8nxiq+caiO3p57TXZGRlR358KTpUshjyRk0TuTV/Ju3g==
X-Received: by 10.66.187.36 with SMTP id fp4mr20691889pac.47.1455912307394;
        Fri, 19 Feb 2016 12:05:07 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id x12sm19564114pfi.88.2016.02.19.12.05.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 12:05:06 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 2/8] gen-icount: Use tcg_set_insn_param
Date: Fri, 19 Feb 2016 21:04:46 +0100
Message-Id: <1455912292-23807-3-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: XG2xoqZZQVcS

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
