Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1234350lfh;
        Fri, 27 May 2022 12:14:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc5nt/1CYCBWnhUGrJ9lQDybO8IRQShq0CD+vJ3QL+mtoa4sZuSAJUBwNAUtqHR9W7M9ia
X-Received: by 2002:a05:620a:24d1:b0:6a5:99e2:6247 with SMTP id m17-20020a05620a24d100b006a599e26247mr9985659qkn.691.1653678899198;
        Fri, 27 May 2022 12:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678899; cv=none;
        d=google.com; s=arc-20160816;
        b=BlQi8zcMKgLWsqY6FpAQBSyZ/oeR7b4WdVMgsljNvQge8QpzjXIMsxPQO2mhGcwCCK
         ARMOJO7O6hXnvU0nH7KdKs4N845OpqwAWcgizWekP/IoUG07PbE9+gOiW+pqobHvNqfe
         OWDS4TT8tyvmBUHmetQRQNcbMF3M4CbxmVeQc57YunlWggtpSKLdYXos0OULPa1syOkT
         nB/skgq0OxhDRdjqufcqvvch9360A+r7ruwpk33lXcJYN8+1NxDgrQujsbzsPQzqAnfU
         Mltx7qguq6tvB55RScU4FRAaaMviech1HsfJ+Drx5jcS6nzoSK8JbGHJ6sxl86gZxY4m
         eTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mktqF+6+9OzFitmHetNE5lmss8+JO7DHg/zzVi0naO4=;
        b=sdYO6A9CXqOvALV1HvaeY9019137Yw9eKZZ99gzYsydsNJwH3zmiLnOd/FNBg86YGM
         vknPjiBS/XDsgecet8pINV7bokioQTCP0uxk3vV7vJ/OlhLw4QN/sEJLVTQmvEPTDIA1
         GoOrQxpoHu7W6WE3W1rbyQCrawq/fLcNG6FyUZkj5UCMMIoDLRPsPzflRgGtYPv1IlS1
         G8PsXTZgiq2lwlbOXGugPProSJpH3v7SDQYIuo+yh965+7iMnWRFc2A3wHUjUI/cVcCB
         DzZOcxSW+piMHMoAIMbbM3HYAwnFUBD8uO3v6ps/7uCaFy5aFAyKQWRLhl90bJd9Xluj
         0PEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QX7/F/vV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi27-20020a05620a319b00b0069f23ff9055si3639746qkb.14.2022.05.27.12.14.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:14:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QX7/F/vV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufQI-0001g8-LT
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec6-0003P9-DB
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:09 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004L3-1a
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:05 -0400
Received: by mail-pj1-x1033.google.com with SMTP id d20so1165196pjr.0
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mktqF+6+9OzFitmHetNE5lmss8+JO7DHg/zzVi0naO4=;
 b=QX7/F/vV4GEMTnUrFJ+l/ReOlQhPDJiGyx8aDG8+VeLMLJLTLfRtmqLN7aC55P+Q3I
 sMBfTcLqBScJCB3RCmK9IdfybAX1r1prWpiROfQwR/XvD/N/jPfvYItPoNoXoWt34RIa
 KD6jPG6Wm0hA4yJvzh7sP+ppo/EeSyE2VD68Z84rb6/jBQclEh2OIUMYvVIZ1m9KcSk8
 2oAV2F5zcanHhhJCj7cwDw5LD7FPd8lJ+GZcMb7NItxeik8fPLwZ8XLubicT2stG2MOT
 asSisL9hz1pZDR7bhcXJd5k5MQo/IYfRohVsrwI1U6YCVdKPf/s7AxR57cWBEWF1hsWJ
 yoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mktqF+6+9OzFitmHetNE5lmss8+JO7DHg/zzVi0naO4=;
 b=8LCRtEg7Rmj2MGRUhbdFrcG4RhkawwnXGfMfYofmOc898sr47OMuvrd9H7wKt8SKTt
 GZpo1f52iwobshEKPz+MOUzpIp4UybtdJ5WMx5v9i3cewdo5fisWrnKGDe6wIOKyG77z
 TxDqHkbcDSbs6qEIqrPtNG6a9IiIBX7io2vc0O13nplsAuafEuZdRmqE01YhTiZWAv+K
 6NljUFHgnMrKC0Z5n25cZqEQ3nC2NhNzqP8U0BsDu19OmMMRr1Zuv4/AEXZq5EaKfioA
 pyG1Mnyy7t2z4MRAqiA13eKj64gpii4SaP2HRXC7MXJAanYIEYXoRc5TWmHdosLDfvPF
 VQcA==
X-Gm-Message-State: AOAM5328RDcQxzh2zR8bRdgtDXHKtimkUEFcaJpVoQQIIeJJmQtx9sTZ
 +RVSUN4fcrI3wxcvtxXsFouABHJoGZQXnQ==
X-Received: by 2002:a17:90a:4f0a:b0:1df:b37b:75b1 with SMTP id
 p10-20020a17090a4f0a00b001dfb37b75b1mr9687078pjh.199.1653675770888; 
 Fri, 27 May 2022 11:22:50 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 045/114] target/arm: Introduce do_shift_zpzi
Date: Fri, 27 May 2022 11:17:58 -0700
Message-Id: <20220527181907.189259-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g7eFOF2biXEL

Share code between the various shifts using arg_rpri_esz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 68 +++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f15e9a30b3..c7c16863c0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -900,20 +900,39 @@ static bool do_movz_zpz(DisasContext *s, int rd, int rn, int pg,
     return gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
 }
 
+static bool do_shift_zpzi(DisasContext *s, arg_rpri_esz *a, bool asr,
+                          gen_helper_gvec_3 * const fns[4])
+{
+    int max;
+
+    if (a->esz < 0) {
+        /* Invalid tsz encoding -- see tszimm_esz. */
+        return false;
+    }
+
+    /*
+     * Shift by element size is architecturally valid.
+     * For arithmetic right-shift, it's the same as by one less.
+     * For logical shifts and ASRD, it is a zeroing operation.
+     */
+    max = 8 << a->esz;
+    if (a->imm >= max) {
+        if (asr) {
+            a->imm = max - 1;
+        } else {
+            return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
+        }
+    }
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
+}
+
 static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
 {
     static gen_helper_gvec_3 * const fns[4] = {
         gen_helper_sve_asr_zpzi_b, gen_helper_sve_asr_zpzi_h,
         gen_helper_sve_asr_zpzi_s, gen_helper_sve_asr_zpzi_d,
     };
-    if (a->esz < 0) {
-        /* Invalid tsz encoding -- see tszimm_esz. */
-        return false;
-    }
-    /* Shift by element size is architecturally valid.  For
-       arithmetic right-shift, it's the same as by one less. */
-    a->imm = MIN(a->imm, (8 << a->esz) - 1);
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
+    return do_shift_zpzi(s, a, true, fns);
 }
 
 static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
@@ -922,16 +941,7 @@ static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
         gen_helper_sve_lsr_zpzi_b, gen_helper_sve_lsr_zpzi_h,
         gen_helper_sve_lsr_zpzi_s, gen_helper_sve_lsr_zpzi_d,
     };
-    if (a->esz < 0) {
-        return false;
-    }
-    /* Shift by element size is architecturally valid.
-       For logical shifts, it is a zeroing operation.  */
-    if (a->imm >= (8 << a->esz)) {
-        return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
-    } else {
-        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-    }
+    return do_shift_zpzi(s, a, false, fns);
 }
 
 static bool trans_LSL_zpzi(DisasContext *s, arg_rpri_esz *a)
@@ -940,16 +950,7 @@ static bool trans_LSL_zpzi(DisasContext *s, arg_rpri_esz *a)
         gen_helper_sve_lsl_zpzi_b, gen_helper_sve_lsl_zpzi_h,
         gen_helper_sve_lsl_zpzi_s, gen_helper_sve_lsl_zpzi_d,
     };
-    if (a->esz < 0) {
-        return false;
-    }
-    /* Shift by element size is architecturally valid.
-       For logical shifts, it is a zeroing operation.  */
-    if (a->imm >= (8 << a->esz)) {
-        return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
-    } else {
-        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-    }
+    return do_shift_zpzi(s, a, false, fns);
 }
 
 static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
@@ -958,16 +959,7 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
         gen_helper_sve_asrd_b, gen_helper_sve_asrd_h,
         gen_helper_sve_asrd_s, gen_helper_sve_asrd_d,
     };
-    if (a->esz < 0) {
-        return false;
-    }
-    /* Shift by element size is architecturally valid.  For arithmetic
-       right shift for division, it is a zeroing operation.  */
-    if (a->imm >= (8 << a->esz)) {
-        return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
-    } else {
-        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-    }
+    return do_shift_zpzi(s, a, false, fns);
 }
 
 static gen_helper_gvec_3 * const sqshl_zpzi_fns[4] = {
-- 
2.34.1

