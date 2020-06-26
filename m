Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp50928lfm;
        Thu, 25 Jun 2020 20:38:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3ZBaelsxmP9kAoPVnfVfR18uMRHtXXJbzjQb+sjdhGRZNAFfUtp8RTeM1KqJz3BYjrCEA
X-Received: by 2002:a25:21d6:: with SMTP id h205mr1621208ybh.460.1593142694412;
        Thu, 25 Jun 2020 20:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142694; cv=none;
        d=google.com; s=arc-20160816;
        b=snaU2jJV2TZt9pd1mwfSAOHZL+sO2birSLnps1TfsGc2Tm72Eor7GkEVvh4aapjIAy
         OUsX9vtpYFGXX/N3oV3BuLwT3goJr+cJun/lSpLUW/WHFeNjUuZ+9FjXNO1JKG172ZMF
         dhy5inaZZR69ubDOoLYx0wmvoSbAdXLVlu03sZoqnDoDnifC4ZUPcdTR7vC4s+9i9516
         KudUSqbtYbdG/kyFP5OgqWNrvuphpX+RnsXq+2UOmmXRGhh8j4zmNW/2cc4gqLTEWilY
         Co1XJKbozEn6ZkhQt2hkgp8SLeUNlFLTbUrTVJajMWh7aloIQN4W/ebWlgAk5U+EvaQ9
         OVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5fYUL4cX+4WQxHc/ZTnx0EOBl/xdpMrdsWF0Wif8Mkw=;
        b=OL8GjoeFG00Ek61nbemVstiZrqsynxQePZx7kuzN1G0HVtFpCZsZfab2s08kuqu6Z9
         LaUN2HED0aGLmyl6PUmtUeBlI34vSO5Otnnwmuz8gd8ALCCD65CmG1sGtBQYLywoJip0
         Vna0oHTrFVyolr8yXHlIBl/hCGJ0qZlU+y3cUFqEmHAeo31c+7qccmqACMFwwTfYNhXa
         vOxsRRysW0YZZV/5BZv1SdjQvrwdJYiMxhLUOBPJ5PqRq2sjORF0ja2HaxdxSSvHWq2i
         Ey5mpjf9QguiFRasfksPMG/OoqhRq6gYFKPDOKN88TeuRoOlIIFcdIP0ZqUfiGVzSK9l
         KYGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YDVefVrM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s107si23433698ybi.314.2020.06.25.20.38.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:38:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YDVefVrM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofBt-00037n-Pe
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof63-0008QB-K6
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:11 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:35410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof60-0001rp-Uh
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:11 -0400
Received: by mail-pg1-x544.google.com with SMTP id f3so4366848pgr.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5fYUL4cX+4WQxHc/ZTnx0EOBl/xdpMrdsWF0Wif8Mkw=;
 b=YDVefVrMdDT1pGi50VSX9yT8iQ9bF6PoGPvX21DX+b3Yw16uvEnJc6iYjX6t2/ffGn
 ntnejWW8V7Pgf9EhBok1E740eP/Gxgce9YjTKdZE0WAe4VZbUwG/4EIsjsiJhuiYGAJa
 CJcW1KXpyaLuA+rbYCT/42+vymmNwUIUxJTgSJ7Dkr58qpIJ8MlKDdB62a3SQj5Jq3us
 xtfEfnTssqRBfddVLLDRmYTA465jLLiDENgwPeg+fEe8vZK3dQVoafRptw0sPZsfKptN
 077rycjuP4836/P6tEO+ky18Gpg0J52YsbD5XOO7y1VagezV02noE623eUW67oGxh7rQ
 quIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5fYUL4cX+4WQxHc/ZTnx0EOBl/xdpMrdsWF0Wif8Mkw=;
 b=LJ9rxWhqEo8OG+22iRhEpFh8BzHyBoAS2shv0o0lkMTTHtwlWEy3SC4tW88afvn1gG
 be2+VMn7SekY6suE+zBvbCMxz522q7YQMc7Xzhn9yCKwlvs4KAk7EGmgdrfUN+vFnPIt
 hVNMhan55Jo4oWJR2HgboG7duM7CKJrIJeEg52Go5r9IjlGoeMIt0JpvsEm9IvrINnSY
 BIhX/ilFCWf3IQWF254myVKWxgvXJe35s22t/V629Ezt2FLfbjLAXLIQOkHxNW5mREaL
 PBR+rvf1sY3Qgkhl8tM7PGJ8HJdJr0hh5U7SesEOSvE0fGXoXtKq3bOUwSXLbygCg/+x
 nlBA==
X-Gm-Message-State: AOAM531XtC/QfQ0pHPn7UNnjcgCIx2nm1TX6V9QK+/bau5UxrBlx/WV1
 vHG3onbSqcaZfW2jgqS+Wo7URQ==
X-Received: by 2002:a62:1c8a:: with SMTP id c132mr860339pfc.69.1593142327662; 
 Thu, 25 Jun 2020 20:32:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 16/46] target/arm: Implement the STGP instruction
Date: Thu, 25 Jun 2020 20:31:14 -0700
Message-Id: <20200626033144.790098-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JvdN1Av6b3aJ

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Handle atomicity, require pre-cleaned address.
v6: Fix constant offset shift, non-checked address, use pre-computed ata.
---
 target/arm/translate-a64.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 436191c15c..e2295a371b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2690,7 +2690,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
  * +-----+-------+---+---+-------+---+-------+-------+------+------+
  *
  * opc: LDP/STP/LDNP/STNP        00 -> 32 bit, 10 -> 64 bit
- *      LDPSW                    01
+ *      LDPSW/STGP               01
  *      LDP/STP/LDNP/STNP (SIMD) 00 -> 32 bit, 01 -> 64 bit, 10 -> 128 bit
  *   V: 0 -> GPR, 1 -> Vector
  * idx: 00 -> signed offset with non-temporal hint, 01 -> post-index,
@@ -2715,6 +2715,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     bool is_signed = false;
     bool postindex = false;
     bool wback = false;
+    bool set_tag = false;
 
     TCGv_i64 clean_addr, dirty_addr;
 
@@ -2727,6 +2728,14 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
 
     if (is_vector) {
         size = 2 + opc;
+    } else if (opc == 1 && !is_load) {
+        /* STGP */
+        if (!dc_isar_feature(aa64_mte_insn_reg, s) || index == 0) {
+            unallocated_encoding(s);
+            return;
+        }
+        size = 3;
+        set_tag = true;
     } else {
         size = 2 + extract32(opc, 1, 1);
         is_signed = extract32(opc, 0, 1);
@@ -2767,7 +2776,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
         return;
     }
 
-    offset <<= size;
+    offset <<= (set_tag ? LOG2_TAG_GRANULE : size);
 
     if (rn == 31) {
         gen_check_sp_alignment(s);
@@ -2777,8 +2786,22 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     if (!postindex) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
 
+    if (set_tag) {
+        if (!s->ata) {
+            /*
+             * TODO: We could rely on the stores below, at least for
+             * system mode, if we arrange to add MO_ALIGN_16.
+             */
+            gen_helper_stg_stub(cpu_env, dirty_addr);
+        } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
+            gen_helper_stg_parallel(cpu_env, dirty_addr, dirty_addr);
+        } else {
+            gen_helper_stg(cpu_env, dirty_addr, dirty_addr);
+        }
+    }
+
+    clean_addr = clean_data_tbi(s, dirty_addr);
     if (is_vector) {
         if (is_load) {
             do_fp_ld(s, rt, clean_addr, size);
-- 
2.25.1

