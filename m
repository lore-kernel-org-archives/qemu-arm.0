Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2429953lfb;
        Tue, 7 Jun 2022 14:36:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1HMf97CKO7OVcRx6Db/vYngNUgv/8FGOWRDRUb+6LwrYYRhi1pdn3QteCO8CqxaGVDj6K
X-Received: by 2002:a05:6214:2b08:b0:464:6201:f795 with SMTP id jx8-20020a0562142b0800b004646201f795mr30064304qvb.51.1654637771548;
        Tue, 07 Jun 2022 14:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654637771; cv=none;
        d=google.com; s=arc-20160816;
        b=JPMmNDAIZYqT89rgAV7oPK4rFC5FASNOfNEF86zDME31E7SQjKfH2Hr7J4SwmiLUGR
         L+ToG2Pd1igejDWaYYF/BM5GgRjje8ZdJ1LTOXB+VaurnCVRp/olSiYvwHnhmIIzxAWS
         v+5HnY5jXvSWQZCmaLX9XBC3/mBZ3l2Rg+DegsxeNJ5pMbr57dc02dZjKKNDRmeVQBL3
         AvOwrEXrXZ9xh3KN2CENS8Z2jpHwgHoLPm+BqQ1tPXguiRAhiVzeBbNoFYKIOVuXU6Pl
         jZWd3tmt9NUXwQY9Ndevfqh/DEjClP5Nmfoql393cG5afnx2ha+N1/OmP4PBWpeohZT+
         Wk1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NiB9V9EV1LP0rfQ3iNUj/Y5UvVHOZ8S0mDKCyW2xkxg=;
        b=zw5k7IY1qzq35AMoh1xRBmtZthix2/bjvWNJtoToI0NQAgmeMRcMUQi+s2ei1RR3GO
         oQCfg4U7nY/h7wK6p5mjR6mECNM/02E5n3CagGiVGRoet8Oxut5XWegyTfPHDMPo1onD
         /q7MOqYEpq+SXsJykjcYNcqbf9HHezR3LIShVpugXcAP0OSmKYv60GzvVxBsPb7Fn3Qu
         3BABlBu6ivBFN8g6+gLEEBMePdXwvq9jOSzXR4EdedfxgqUVS3TItIltf7tIwUfg9t1T
         LIFEMls9AqMM4ii3uyNOhvIn6hD8QTwEM+2sribk0gIzPN+c+NfQODSz8NmfL0+xLHBr
         yrJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mWXmm6th;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ed15-20020ad44eaf000000b0046b9d0b749bsi3955906qvb.340.2022.06.07.14.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mWXmm6th;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygry-0006QL-Tn
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwo-0006tO-1b
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:06 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwg-0008IQ-VL
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:05 -0400
Received: by mail-pl1-x62e.google.com with SMTP id h1so15783303plf.11
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NiB9V9EV1LP0rfQ3iNUj/Y5UvVHOZ8S0mDKCyW2xkxg=;
 b=mWXmm6thmZSuNRUAJQAKQoZJ/B5VwZ+J/t3fvTRUeDOxCoCtbvlomefM7d1FtsLF3m
 OqBGtKLLPv8ToJyT/QjfaBZPTN1Pq3maMgN2SoGeoBexdvDhgQZHwNMOektZTRrfdVXR
 Un7P9z2GxpvKD/Akx2jQKfE9LigpWWGnplqh2cLv6Zb1FZjc1yHWCtA/mrppl4WxY1A+
 6MweLQPYDUW2oOaberRv3EzN2GerwlrI7g5iF0gzcS3YZ1KT/AR7WDgd/P+mJiIao0Ar
 GPoPWObwuU5C/QW2NMg5vYjKSKe1QvgC6OiYZ3tXkwhZ8uyak1yojmCQPM3B+tnP9ciV
 172g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NiB9V9EV1LP0rfQ3iNUj/Y5UvVHOZ8S0mDKCyW2xkxg=;
 b=AYpuH37Ee2D7kv9vLJZaWbRWLF0JXCakgKmJU1s4j7BSm+boGa574O+/ybbEBPrku0
 dpe5n5GJyexeL80JCjzrInipkte3ervY4nfRMDZomrZcjsha8QlO9/1yUKWZNAD3hEYC
 v4C/mq4q6UaUX6fYGShkc0Vp28dwRYh/VLd/1tbrJH5NcO1Anhn0XHCBpPbVERvDJkVj
 +blL8pz74OgCXQ1vqZeKYLKGENCAIelSbhzGGEvnFq3Zf1JdE46y+nf2x6huFOxrsGaR
 DuIOmp49XsG6Oaj+rJRShxBCh1AtfhDnj6Qf1YwPcBnmJS6PNADKbRt5p/2LFZHlNbZp
 PtIw==
X-Gm-Message-State: AOAM532jJaZkWnyB67u+hGu7G87vtGaB+qpXX8yIi91NxHrY1+CyOkmY
 CPagBMoP3YCr3jI5JMLGY03Lwu0xFTMYQg==
X-Received: by 2002:a17:902:d48d:b0:167:53e2:3dc5 with SMTP id
 c13-20020a170902d48d00b0016753e23dc5mr21320583plg.105.1654634217703; 
 Tue, 07 Jun 2022 13:36:57 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 54/71] target/arm: Implement PSEL
Date: Tue,  7 Jun 2022 13:32:49 -0700
Message-Id: <20220607203306.657998-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Zjd+DGwa4CDB

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 57 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 20 +++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index adf0cd3e68..58d0894e15 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7379,3 +7379,60 @@ static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
 
 TRANS_FEAT(BFMLALB_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, false)
 TRANS_FEAT(BFMLALT_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, true)
+
+static bool trans_PSEL(DisasContext *s, arg_psel *a)
+{
+    int vl = vec_full_reg_size(s);
+    int pl = pred_gvec_reg_size(s);
+    int elements = vl >> a->esz;
+    TCGv_i64 tmp, didx, dbit;
+    TCGv_ptr ptr;
+
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i64();
+    dbit = tcg_temp_new_i64();
+    didx = tcg_temp_new_i64();
+    ptr = tcg_temp_new_ptr();
+
+    /* Compute the predicate element. */
+    tcg_gen_addi_i64(tmp, cpu_reg(s, a->rv), a->imm);
+    if (is_power_of_2(elements)) {
+        tcg_gen_andi_i64(tmp, tmp, elements - 1);
+    } else {
+        tcg_gen_remu_i64(tmp, tmp, tcg_constant_i64(elements));
+    }
+
+    /* Extract the predicate byte and bit indices. */
+    tcg_gen_shli_i64(tmp, tmp, a->esz);
+    tcg_gen_andi_i64(dbit, tmp, 7);
+    tcg_gen_shri_i64(didx, tmp, 3);
+    if (HOST_BIG_ENDIAN) {
+        tcg_gen_xori_i64(didx, didx, 7);
+    }
+
+    /* Load the predicate word. */
+    tcg_gen_trunc_i64_ptr(ptr, didx);
+    tcg_gen_add_ptr(ptr, ptr, cpu_env);
+    tcg_gen_ld8u_i64(tmp, ptr, pred_full_reg_offset(s, a->pm));
+
+    /* Extract the predicate bit and replicate to MO_64. */
+    tcg_gen_shr_i64(tmp, tmp, dbit);
+    tcg_gen_andi_i64(tmp, tmp, 1);
+    tcg_gen_neg_i64(tmp, tmp);
+
+    /* Apply to either copy the source, or write zeros. */
+    tcg_gen_gvec_ands(MO_64, pred_full_reg_offset(s, a->pd),
+                      pred_full_reg_offset(s, a->pn), tmp, pl, pl);
+
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(dbit);
+    tcg_temp_free_i64(didx);
+    tcg_temp_free_ptr(ptr);
+    return true;
+}
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index bbdaac6ac7..bf561c270a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1674,3 +1674,23 @@ BFMLALT_zzxw    01100100 11 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 
 ### SVE2 floating-point bfloat16 dot-product (indexed)
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
+
+### SVE broadcast predicate element
+
+&psel           esz pd pn pm rv imm
+%psel_rv        16:2 !function=plus_12
+%psel_imm_b     22:2 19:2
+%psel_imm_h     22:2 20:1
+%psel_imm_s     22:2
+%psel_imm_d     23:1
+@psel           ........ .. . ... .. .. pn:4 . pm:4 . pd:4  \
+                &psel rv=%psel_rv
+
+PSEL            00100101 .. 1 ..1 .. 01 .... 0 .... 0 ....  \
+                @psel esz=0 imm=%psel_imm_b
+PSEL            00100101 .. 1 .10 .. 01 .... 0 .... 0 ....  \
+                @psel esz=1 imm=%psel_imm_h
+PSEL            00100101 .. 1 100 .. 01 .... 0 .... 0 ....  \
+                @psel esz=2 imm=%psel_imm_s
+PSEL            00100101 .1 1 000 .. 01 .... 0 .... 0 ....  \
+                @psel esz=3 imm=%psel_imm_d
-- 
2.34.1

