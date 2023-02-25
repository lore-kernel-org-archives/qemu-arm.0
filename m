Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2641386ejc;
        Sat, 25 Feb 2023 01:27:04 -0800 (PST)
X-Google-Smtp-Source: AK7set+nfactuErZ1s6A44oBGuBdjWdwP3ENaPk60DlmTk1wWDvJPzAstSBzke5WYOAynpV5tYLL
X-Received: by 2002:ac8:5a0b:0:b0:3bf:a575:54c with SMTP id n11-20020ac85a0b000000b003bfa575054cmr27361938qta.9.1677317224591;
        Sat, 25 Feb 2023 01:27:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317224; cv=none;
        d=google.com; s=arc-20160816;
        b=qZ5qx/6jiME8Ek/RSkLr6Mw7IHWluzcfrcxrbHlUK6m1mGK6NUSz2s3bqEW1YhXz+Y
         j+3Ruksos270o0xyOuqKjxWZAC45hM6tzOEtu3VBVsfnQDRMx1NK1LaDubbNx0vb0y/p
         e3EOoRW4xAgpOA7uU92vKqnDTydGGMcHbgUXBldxW9f/VA5AoQOmoyS6MaCM7Qnx2P4h
         uhjFfV8sTr4B/G9rOB+dVwzEIlk60X8ZCFNbH2iYH2XDmtuw1T17x9VW6vwZmfI3VUJr
         8Ebip+JgsLF5/uOJbEp+l6xBzNykZyzl+SBLL2MG0GM5Q52Cm/nqHj52aD468zAyU3mR
         FvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FDr/G0N/cf+m+hkGWa1ktDxEpYaGWUpfy88lZunNdyw=;
        b=E3SiUHBHTMhqm6BQDuLk9b1p8h5uZfOOaYKlBGQOaZwVC8j8V7EeSYW42e/bjyeZF9
         +WyuM7bfMloldS9TbSE89jWc2A4m+UiEqXWukUqTPaXHOa3KKS1TqjK/FHthrsDN6+9J
         NMueN0Llceo+DTHEoJt7lljCqhMdR6KIjr/NCLsDUAkj3rrzMzZaM1L+QuxsUSlqhzVY
         1Eqkbyr4IQ4XbM6igXBVX3PwOL/9+Ov1Hi8Ec35i9Fto3/2wdagaGwU9jxAy1yHVvTjT
         FgOijsQQCnM5frbHaTRrVesU+npdH8paHA+VxqmPNA56LU9FA5J0BQbCJz0DdUg/eG00
         eZXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EOcCQbyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3-20020a05620a44c300b0073127725a87si1473936qkp.526.2023.02.25.01.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:27:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EOcCQbyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqjo-0000ST-P6; Sat, 25 Feb 2023 04:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjJ-0006S3-0G
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:36 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjE-00034b-2V
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:32 -0500
Received: by mail-pf1-x430.google.com with SMTP id u20so840990pfm.7
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDr/G0N/cf+m+hkGWa1ktDxEpYaGWUpfy88lZunNdyw=;
 b=EOcCQbyrefHbsIPR+5g4rDbR23GKpsshBvFSIO3044iD+lg07s+ttW/dAG07d7I7fV
 pErL4MmEn9DcuLUSMwyEcLTUOp0anSWgVW3p40bv2ThvEZ/z0tXvTHoz1tXOXTmoQQ7A
 bobYBXU43SjNQRHJ5/E18ZAB53lozqQz24c1lGzWGq5FiEPs4F5BBYWJEpmCsmkyA7qN
 iub4s0Hq/vbjePWQnl8OfyYayNyxYAD/Rf8dUgGboSaplaKTXUmWr9GwwaG09QsOSt5J
 PrR1Cb/DrOy3UsXTXczIpLzqPZJxyP0mwjcvLHUsuiBjUv7axmkCOm3YqEGzrm9BxXw/
 X1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDr/G0N/cf+m+hkGWa1ktDxEpYaGWUpfy88lZunNdyw=;
 b=8MGrJduWPhoVGSw2ueDnOhiks2EkP+9fkkVj2P2dzls0BRw/aDG/2uXXScytsWhlh0
 zM+HbLOba0O5SBBoakbqqaWtUt4Ph76GyQESzE+qNA8qU5uOTNsgew0yex8pwL99aQ3d
 /70DvfbCtVy2sNVLrikDwlP2zC2MhOOL488xp+go5rkuvqbErJUFJAg0SazWXow9xEmO
 RGyHTarOPZTECD/kygnAQAbdfj1CaOagEx41QtcU5kybq99/bzmb6Hzobpv/nqYCOG35
 7r4ubVCFMQiTyJpkzFTNQwuCJyhbtz/X64pxAyYsQ9mPgvQeStTpAuSm7dknY5YrD/K4
 QLZA==
X-Gm-Message-State: AO0yUKWU/IaxQilAzT+vd16pT2ugokt4J3p9QHzb2h9+X9bEkupm3Var
 0YJtrhKdovOr2X0dUy2if2E0nA==
X-Received: by 2002:a62:5105:0:b0:5b6:c62e:7d4f with SMTP id
 f5-20020a625105000000b005b6c62e7d4fmr15671817pfb.8.1677316824614; 
 Sat, 25 Feb 2023 01:20:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 66/76] target/sparc: Drop get_temp_i32
Date: Fri, 24 Feb 2023 23:14:17 -1000
Message-Id: <20230225091427.1817156-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yzDuMqmwA33N

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 2b4af692f6..bdf464f802 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -84,8 +84,6 @@ typedef struct DisasContext {
 
     uint32_t cc_op;  /* current CC operation */
     sparc_def_t *def;
-    TCGv_i32 t32[3];
-    int n_t32;
 #ifdef TARGET_SPARC64
     int fprs_dirty;
     int asi;
@@ -129,14 +127,6 @@ static int sign_extend(int x, int len)
 
 #define IS_IMM (insn & (1<<13))
 
-static inline TCGv_i32 get_temp_i32(DisasContext *dc)
-{
-    TCGv_i32 t;
-    assert(dc->n_t32 < ARRAY_SIZE(dc->t32));
-    dc->t32[dc->n_t32++] = t = tcg_temp_new_i32();
-    return t;
-}
-
 static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 {
 #if defined(TARGET_SPARC64)
@@ -153,7 +143,7 @@ static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 /* floating point registers moves */
 static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
 {
-    TCGv_i32 ret = get_temp_i32(dc);
+    TCGv_i32 ret = tcg_temp_new_i32();
     if (src & 1) {
         tcg_gen_extrl_i64_i32(ret, cpu_fpr[src / 2]);
     } else {
@@ -175,7 +165,7 @@ static void gen_store_fpr_F(DisasContext *dc, unsigned int dst, TCGv_i32 v)
 
 static TCGv_i32 gen_dest_fpr_F(DisasContext *dc)
 {
-    return get_temp_i32(dc);
+    return tcg_temp_new_i32();
 }
 
 static TCGv_i64 gen_load_fpr_D(DisasContext *dc, unsigned int src)
@@ -5516,7 +5506,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         break;
                     }
 #endif
-                    cpu_dst_32 = get_temp_i32(dc);
+                    cpu_dst_32 = tcg_temp_new_i32();
                     tcg_gen_qemu_ld_i32(cpu_dst_32, cpu_addr,
                                         dc->mem_idx, MO_TEUL);
                     gen_helper_ldfsr(cpu_fsr, cpu_env, cpu_fsr, cpu_dst_32);
@@ -5762,14 +5752,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
     gen_exception(dc, TT_NCP_INSN);
     goto egress;
 #endif
- egress:
-    if (dc->n_t32 != 0) {
-        int i;
-        for (i = dc->n_t32 - 1; i >= 0; --i) {
-            tcg_temp_free_i32(dc->t32[i]);
-        }
-        dc->n_t32 = 0;
-    }
+ egress:;
 }
 
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1

