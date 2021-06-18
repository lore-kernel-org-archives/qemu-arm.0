Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1599156lff;
        Fri, 18 Jun 2021 07:12:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTT8imcFs3/Y9Sjhd+n3bhE8OL95VPoBlixdbV9aU8filRJyc9isbF009c0ZaiaNQxxpto
X-Received: by 2002:a17:906:28d5:: with SMTP id p21mr11174812ejd.358.1624025552714;
        Fri, 18 Jun 2021 07:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624025552; cv=none;
        d=google.com; s=arc-20160816;
        b=pGdv1sJaOMRcy8CMZ0i0X7Z/tBXxnQq0HMweXtE0qqKbmX12+96TWNEsufdz8Ph1Vp
         UJQYR0HzoZEYcJhzmUmjPqlb342by57aYjXxjCd2mP47cvGYL46APKS20WtoZUhnZlzE
         1eIpPoBtgBYv5wqW+KB7QBJIJHS1xzUitqPDK1gzyh5aXnbOn0Hl3/UhM617rSEhffSW
         lZcYcn0Qt/FkM/czTEYK7Ys1jT75fal0DyxQ9OUX6bIdvAPmfKUwQhj++WOsSedQGj6Y
         n7B0TKwDbSr4Wa8A3nnNXKs3dUJZH53PqL4UyhAGayM+ubGPEa9pWccSPyf5hZsB1rrW
         tJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+molS8q3eWVbDwFlz/CHxm2K6ekh34kuREu48aIPmN0=;
        b=CrB+7BoPYfIXpbjMyjdF8Y5Rv3Z0EvLATyL1BLUEfJtlt0V33apQJ5FPA02hOEESjz
         LTc6UvPDU4S+EzbjnePwaA7h5C6kQgGLuVcvg8XLTkK7YpzmbsoprS0HFXHVps7frnQS
         aLYV/MLJ9j1VC1DheZh0tCYbebWw49P+HX4ZqzCuyK9NI++05DyGYLLUljlp48WW4xKN
         bNwH7odajZpal5/bfCnLWGoRCmEkvCj97+UiOeuEskpXGS+0Xf1+DFy8i2h8DHQAtE+h
         YZh9YZHfsS6ots8xpRA5GZ/o/pNsVt0Q0ewcRhFWEK84kb/HoILuuJ2bAf6bdF+xQPgv
         8r0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnQY7VSO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si2506734edc.244.2021.06.18.07.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 07:12:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnQY7VSO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luFEV-0001PE-Jc
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 10:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCs-0007hA-EJ
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 10:10:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCX-00022G-08
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 10:10:50 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i94so10930935wri.4
 for <qemu-arm@nongnu.org>; Fri, 18 Jun 2021 07:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+molS8q3eWVbDwFlz/CHxm2K6ekh34kuREu48aIPmN0=;
 b=hnQY7VSOol020/lQfDwncAEBW8biMqYG6KM8/euk+rR+bRtjsTTPQEieb2+jXGfhG0
 XAFEX8E+ftqkm0CaiEePoPwuFkjCU5W23wmbpttzSIo+I/6slAvL4xPLZOTqh0kl8io0
 zFMTHPK+QC1rJj+CH4ucizdai4D0GiDl8ZGbI2JEVkGLAGv4v2PFoYGX9GIe+2eYZlxK
 1Mr9MbVOWuVvPBHF5JeKEY9wLttUjy/86r7xF4pt6FiSQtrAF+ZJdXODm8M2JIyQD0O7
 Z7KeAqeWNu0tqbfeEdHjwpQJyGvZkZ8grhdFbxKcthSVv2qPhWm8brUeFXnbXvpD4+94
 aELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+molS8q3eWVbDwFlz/CHxm2K6ekh34kuREu48aIPmN0=;
 b=t/gmncPztZnCVOjeaEuC7QdAm2t/qMmNupb8sBMX4ebEHa7eBx8hXOztTz+4SJEE7j
 MSzAzEb2/CdikA2jaBxEN0QOncf5+WB8NUSmUQ64nfr5wwF6GEZs70nRBgdt1Ypug7a0
 uE2DTB0sV1tSwlhB/t+0lPuL98GKMubgqj0AUjYjWIcdmQwDUO+8osInY014hQXCAOb3
 3wgdACMn98BKoSMGFV7T2qxUxaxNuRqvDAwjamuwKaMxee8DTzR4R9DCAVa1eRPpIv0x
 Z/ZVIpBoggTnRPh62/iHaF0+QGjepuwhmNIqt4TycfLCSOt0svVVYNSfcoLZYkvbBKo9
 pd3g==
X-Gm-Message-State: AOAM530He/Qn74vrQ9o1hVGaHceKatc081JBe5rT6cNrpVL5HUnl/Pge
 MIxURF1ryIR2Dm3WAQl8AEa2gQxfMet3LxRh
X-Received: by 2002:adf:c3d4:: with SMTP id d20mr12690820wrg.183.1624025427481; 
 Fri, 18 Jun 2021 07:10:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j11sm7751661wmq.4.2021.06.18.07.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:10:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 7/7] target/arm: Handle FPU check for FPCXT_NS insns via
 vfp_access_check_m()
Date: Fri, 18 Jun 2021 15:10:19 +0100
Message-Id: <20210618141019.10671-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141019.10671-1-peter.maydell@linaro.org>
References: <20210618141019.10671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cOvYAVP6AXAX

Instead of open-coding the "take NOCP exception if FPU disabled,
otherwise call gen_preserve_fp_state()" code in the accessors for
FPCXT_NS, add an argument to vfp_access_check_m() which tells it to
skip the gen_update_fp_context() call, so we can use it for the
FPCXT_NS case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h    |  2 +-
 target/arm/translate-m-nocp.c | 10 ++--------
 target/arm/translate-vfp.c    | 13 ++++++++-----
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index abb3ecb6bc9..23264053006 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -32,7 +32,7 @@ bool disas_neon_shared(DisasContext *s, uint32_t insn);
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg);
 void arm_gen_condlabel(DisasContext *s);
 bool vfp_access_check(DisasContext *s);
-void gen_preserve_fp_state(DisasContext *s);
+bool vfp_access_check_m(DisasContext *s, bool skip_context_update);
 void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop);
 void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop);
 void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop);
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 312a25f0589..5eab04832cd 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -371,9 +371,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
          * otherwise PreserveFPState(), and then FPCXT_NS writes
          * behave the same as FPCXT_S writes.
          */
-        if (s->fp_excp_el) {
-            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                               syn_uncategorized(), s->fp_excp_el);
+        if (!vfp_access_check_m(s, true)) {
             /*
              * This was only a conditional exception, so override
              * gen_exception_insn()'s default to DISAS_NORETURN
@@ -381,7 +379,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
             s->base.is_jmp = DISAS_NEXT;
             break;
         }
-        gen_preserve_fp_state(s);
     }
     /* fall through */
     case ARM_VFP_FPCXT_S:
@@ -527,9 +524,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
          * otherwise PreserveFPState(), and then FPCXT_NS
          * reads the same as FPCXT_S.
          */
-        if (s->fp_excp_el) {
-            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                               syn_uncategorized(), s->fp_excp_el);
+        if (!vfp_access_check_m(s, true)) {
             /*
              * This was only a conditional exception, so override
              * gen_exception_insn()'s default to DISAS_NORETURN
@@ -537,7 +532,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
             s->base.is_jmp = DISAS_NEXT;
             break;
         }
-        gen_preserve_fp_state(s);
         tmp = tcg_temp_new_i32();
         sfpa = tcg_temp_new_i32();
         fpscr = tcg_temp_new_i32();
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index d89c7834faa..86e43c02dcd 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -109,7 +109,7 @@ static inline long vfp_f16_offset(unsigned reg, bool top)
  * Generate code for M-profile lazy FP state preservation if needed;
  * this corresponds to the pseudocode PreserveFPState() function.
  */
-void gen_preserve_fp_state(DisasContext *s)
+static void gen_preserve_fp_state(DisasContext *s)
 {
     if (s->v7m_lspact) {
         /*
@@ -218,8 +218,9 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
  * If VFP is enabled, do the necessary M-profile lazy-FP handling and then
  * return true. If not, emit code to generate an appropriate exception and
  * return false.
+ * skip_context_update is true to skip the "update FP context" part of this.
  */
-static bool vfp_access_check_m(DisasContext *s)
+bool vfp_access_check_m(DisasContext *s, bool skip_context_update)
 {
     if (s->fp_excp_el) {
         /*
@@ -239,8 +240,10 @@ static bool vfp_access_check_m(DisasContext *s)
     /* Trigger lazy-state preservation if necessary */
     gen_preserve_fp_state(s);
 
-    /* Update ownership of FP context and create new FP context if needed */
-    gen_update_fp_context(s);
+    if (!skip_context_update) {
+        /* Update ownership of FP context and create new FP context if needed */
+        gen_update_fp_context(s);
+    }
 
     return true;
 }
@@ -252,7 +255,7 @@ static bool vfp_access_check_m(DisasContext *s)
 bool vfp_access_check(DisasContext *s)
 {
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        return vfp_access_check_m(s);
+        return vfp_access_check_m(s, false);
     } else {
         return vfp_access_check_a(s, false);
     }
-- 
2.20.1

