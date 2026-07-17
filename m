Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAA7C44516
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:24:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkrtv-0001Zx-W6; Fri, 17 Jul 2026 19:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtu-0001Y5-2i
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:26 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrts-00070R-Fm
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:25 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-38e08baf860so5941944a91.2
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330603; x=1784935403; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w27FmDXuFalab8HQ6vxOQFZ2EK3lrOZoQbI54mzAq/A=;
 b=mUDP58AIIi+9DdvqcfsIHB53V46mXMV/DnLiUSGK3wEH5Y15BqBtiHvGR7GwB7HHai
 vaMJHXOM9rYFyONLnf2xutqrR/AxG4iBuF+EIkYXlnHGhnPizIkZr+UZgqBBSgtB3dL1
 ghsn9V1IVZa7rE0LbPaQqDRXPKrJHp0bMKH388ykZjFDGbIaTaragPmiGkYl23ufu8pr
 Mu9kNUT1mulwI9ouRZpLTP+XEV1A+m6JJQD5bT31dPr2yOWLMyhjdizFGlfjRjCUE23z
 cNjSeu/ugWzqN0Ot5Mogs7JUf9SB40q8urU3+zoFxx0Hyqw5HcgezLYehynmPbpbePGM
 AZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330603; x=1784935403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w27FmDXuFalab8HQ6vxOQFZ2EK3lrOZoQbI54mzAq/A=;
 b=SFjOXH8nPKBCuH1AYzUeQJnuSpU6Axts7034YHjTcOmS8in4Ne6ct2iV6ZuQ5AVmBV
 4OsRbjTSCaVn+McNzRID+ChzZTIw2P4S5AP0tO1JfQOJIuJFFN6MVxv76L2zMKUOGsfu
 MCpSUxPnIJ/XSoE2W1L7emeJLyG8IS51Ksvj5FXnHfhvT9u+zYz0cCgQC/GTGDRuF5Iq
 7R4bFVpzZTTjUj3DuRn/32XE50CLe3IDMyOzjJ58rjcDSncqEfOVxudbEx1nBuG3WOkK
 W+fgolR73JqCBrZ61urSlyu0pF0aMRGOHTqhJxT3U0MQxMCFWN508lDz4+YV7uXZtT4C
 x0CQ==
X-Gm-Message-State: AOJu0Yzx40K99Wk71EAyPw7ac0fVxg5ky4r/4iTzHSSP3jCscvBNF5y4
 9nIlWsdby3lHg4gHDiKUiGTdbDYQXLtv8rTx5EMxkb0EPWH7RIkJOdMiO1ogTLPw7++n3d2v9Ry
 4S2ub
X-Gm-Gg: AfdE7cmCjRYfer+U2lEGwXyBLZFeJUWXkifgqUoEYKWADklZWm3c4uB5Dcr3zRYF44f
 ruEt6Cask7kuoZFW7hal6qXBn/5zurRJhbX2N7Q0t14c5D2ws3+C4i9kTb29Azxq97gUvBve9zk
 JPKOkM/v3yJNi3YxzH+udMTocOT51qteB/+UNmC+89x+ey8bhCoh3w2NKOlVc/gymbvL0fCv4GC
 n1ClQUljSwYPpdevofafGpohIMsQWlwAju/ye82Ln0/v0FgI6MC2f7pd0FL9p8eEaRO3GmIeUjD
 6YT7ynpQAcXrssYOwL29bZNI0acXQhxKrrhczAfNkhlPGeg9y3FGL0MQ5mDWfpijpEnDnwcrOe8
 NLTdFh7b++w8fkBGBuE86/+ARPzkwf6at6ZVC60o+Xp561qec5JbNctAtU5XZPB2r6CkmEt7Fo1
 3jqieyGFM=
X-Received: by 2002:a17:90b:3cce:b0:37f:db06:229c with SMTP id
 98e67ed59e1d1-38e4b534228mr5178982a91.22.1784330603069; 
 Fri, 17 Jul 2026 16:23:23 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/17] target/arm: Expand dczid_bs in DisasContext
Date: Fri, 17 Jul 2026 16:22:59 -0700
Message-ID: <20260717232306.378988-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717232306.378988-1-richard.henderson@linaro.org>
References: <20260717232306.378988-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Store the true blocksize, not the encoding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     | 4 ++--
 target/arm/tcg/translate-a64.c | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index a3d03159ad..bab91eea22 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -197,14 +197,14 @@ typedef struct DisasContext {
      *  < 0, set by the current instruction.
      */
     int8_t btype;
-    /* A copy of DCZID_EL0.BS. */
-    uint8_t dcz_blocksize;
     /* A copy of cpu->gm_blocksize. */
     uint8_t gm_blocksize;
     /* True if the current insn_start has been updated. */
     bool insn_start_updated;
     /* FPMR access exception EL or 0 if enabled. */
     uint8_t fpmr_el;
+    /* An expansion of DCZID_EL0.BS. */
+    int dcz_blocksize;
     /* Offset from VNCR_EL2 when FEAT_NV2 redirects this reg to memory */
     uint32_t nv2_redirect_offset;
 } DisasContext;
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1780490065..3d838a4cc1 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4752,7 +4752,6 @@ static bool trans_LD_single_repl(DisasContext *s, arg_LD_single_repl *a)
 static bool trans_STZGM(DisasContext *s, arg_ldst_tag *a)
 {
     TCGv_i64 addr, clean_addr, tcg_rt;
-    int size = 4 << s->dcz_blocksize;
 
     if (!dc_isar_feature(aa64_mte, s)) {
         return false;
@@ -4777,7 +4776,7 @@ static bool trans_STZGM(DisasContext *s, arg_ldst_tag *a)
      * except the alignment happens before the access.
      */
     clean_addr = clean_data_tbi(s, addr);
-    tcg_gen_andi_i64(clean_addr, clean_addr, -size);
+    tcg_gen_andi_i64(clean_addr, clean_addr, -s->dcz_blocksize);
     gen_helper_dc_zva(tcg_env, clean_addr);
     return true;
 }
@@ -11055,7 +11054,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
     dc->features = env->features;
-    dc->dcz_blocksize = get_dczid_bs(arm_cpu);
+    dc->dcz_blocksize = 4 << get_dczid_bs(arm_cpu);
     dc->gm_blocksize = arm_cpu->gm_blocksize;
 
 #ifdef CONFIG_USER_ONLY
-- 
2.43.0


