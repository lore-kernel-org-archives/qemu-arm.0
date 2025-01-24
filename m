Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp927704njk;
        Fri, 24 Jan 2025 08:31:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJ3/6ObCBX0u3TMJxvjqAc8TuCfA9vRYOs7jPpvV7X5BbuYNfxfKYdFMX0rwSnhS/LQGS6iZJaY0MXNA==@linaro.org
X-Google-Smtp-Source: AGHT+IEDBThats5AH1VK5RlxOcT3o4FCMJEyWqtBvl1Lx+r2QwxeTlZNKU94qTyDCHMJmiYTP2qk
X-Received: by 2002:a05:620a:440a:b0:7b6:672d:7fc7 with SMTP id af79cd13be357-7be6325fb8amr4967178285a.46.1737736260853;
        Fri, 24 Jan 2025 08:31:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736260; cv=none;
        d=google.com; s=arc-20240605;
        b=dMsjHowHCdstzoVYyrXle24cHXS+/KQenVZdOu9tAA1lZkbXfi+skGGWkfcX560Ajq
         CoYwJJYKAJRs5Xw7+o09tBuF6uFve7il4GBG/0qi43DqBZHVVjW4gIKTBboPh/c3JYM0
         5cHwM0A8bsbCFT/M1eMIU/YPbB2P5OvqT/CEbTY7oBazgZ9K6ws9Jtkmz7fUs+DA5vZ7
         nwSvA/hH3JfIvMtEv72l7oNoOgPvwdW6T9mgNNPzlND1ksi0zngLjGAbtuV9aSFUvrH0
         YRzgHxu124lpV2RdgJBH++zh6zfciTyem2voZpMGZ1iqausQpTcu8IZQn5Foip4RGi6b
         jhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4jWmHkLkE0PYmSdvm4vatXKXqnaGihoCx12P90WWE9A=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=NCHjY/pbsH7setlXwYZbxGakleE2+6eaZFr7p4Kwo2uSXrOAObnfnky6bad55MfadY
         3wsftGoUfky50auMs4/sZM0rKqhvjJRPIVjMhRU0fod9V42M1tvy+Dw9Cky9b83/T1xJ
         PzO9g6uw9DozzDLGcTRPQI3jS/tq904a3rihxAy9Hx77QTzs1Bvrj8FbwiyObwi8ytzZ
         VRl41HFCWWZalnHHvtFBkpBEuRT46/nLbCEVX1JSR5I432Wrig5Z8fKbo3FuTrIsJ7AM
         PHbPDiuoGLeXqe0IsyLUwcqyJQQ3W1/6XlqvaVQ1K/dQlF+u8mICYSQiIdsHo1uaCijh
         NBYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dF002bzs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af1176esi253325285a.488.2025.01.24.08.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:31:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dF002bzs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMYa-00042U-UL; Fri, 24 Jan 2025 11:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYB-0003bw-BD
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:28:55 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMY7-0005Nk-8S
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:28:54 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so25814275e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736127; x=1738340927; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4jWmHkLkE0PYmSdvm4vatXKXqnaGihoCx12P90WWE9A=;
 b=dF002bzsfqv2LkDtcFRWO5X806u1sptlVisz2GLzFEliJ3YFXH83JRC0mLt67tNa9B
 5x3Ag+ReoWVzr1uuAvAxD2v097JE8p5CJ0xvuiFgH+/wzYhsjz8pwhLbSSIeQ/ZbpRbm
 g3luSMxy5kzAVkE5hev6v2QFDfLdy/OoF0psaw4T2DBttmNi6jBPkxcI8iVNkf6T/jSP
 MQLubhupNVK6PTaW1S/3sHF/d+nIaTrXdnIiLw4SIZoba5mDOTDAo19CvuZ2dCysJkvy
 5TFNPBTp0Vaq/gD4bCxNzSt6vsognTi41a58plMLcMqUfM+iwfp5QXBOALGRFpTRsX7k
 D34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736127; x=1738340927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4jWmHkLkE0PYmSdvm4vatXKXqnaGihoCx12P90WWE9A=;
 b=V77GxnN28zE6G2C+q4z8yUQrMII0UdSOPKcHORr+auX47rYC1NA+ygbOwi2hUuRj3n
 3cEVtcawEFhZB6OnO0atoC++7/JAEf58J03qjftAndZNnlX8m+wTt8s/t9KuL84szuAn
 Y38Mfs0E7Vp/xKkykntAvb0FetYQtRakrXWPNiH1XourBZr4qT8vC66pBtHjJmQzFTF5
 xttDDSGXJ0OFddtoYIfDZp66y/n7+/XbkX8OMkqIEfYljqpG8tCwotTRLts55RvykRtd
 6JqaRGK/lqobJazRhtlqPMiaCi5jyDbeCe4vRcbnDST/Kph4+BCY7wbzFfktPOmsi5w+
 SHjQ==
X-Gm-Message-State: AOJu0YzTuvHHQQjsgNhVDQ0C8PZLZrYCsRy/GOqoLk3QgA1fuD3WMkR2
 GnN132wSHCv8Qr+rq389F7AKsh4XCY8gRdVRVBYRsQOnwLu6jT3DzeIdChVsegmugOwqiGfW+vZ
 P
X-Gm-Gg: ASbGncsc42hyLb9uUfwUTCifjSKoK10Truw547jwrShdAS+BRm95noVaH9s3NC8AKot
 qPF8EkZCm2HSJIH0IF9iyBROg4mVJDtl4kGFXTQqV+EVX6IitMAXD/vaSHDmKscEcKHv2GByXo6
 bTtggSULbuDlVP43QkHIyVJbMTNscB6HtMcFwLVX43EfQ4NFQzZ5yJlcGogKD/2ITkiyE5I6P7M
 9PSXp1y0VWrOW9cYtCGwU+Y0+oym+X6xhDr2W+7TibgHwIfi8faDoCCUWZAkHoIvWUk9VjW13n+
 emdfye2LrXQ=
X-Received: by 2002:a05:600c:1d1d:b0:434:a815:2b5d with SMTP id
 5b1f17b1804b1-4389141c211mr253290065e9.24.1737736127353; 
 Fri, 24 Jan 2025 08:28:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:28:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/76] target/arm: Use vfp.fp_status_a64 in A64-only helper
 functions
Date: Fri, 24 Jan 2025 16:27:27 +0000
Message-Id: <20250124162836.2332150-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: p4KMBwbVmfkl

Switch from vfp.fp_status to vfp.fp_status_a64 for helpers which:
 * directly reference an fp_status field
 * are called only from the A64 decoder
 * are not called inside a set_rmode/restore_rmode sequence

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/sme_helper.c |  2 +-
 target/arm/tcg/vec_helper.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index a0e6b4a41ea..2aad00d3ad9 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1044,7 +1044,7 @@ void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
      * round-to-odd -- see above.
      */
     fpst_f16 = env->vfp.fp_status_f16;
-    fpst_std = env->vfp.fp_status;
+    fpst_std = env->vfp.fp_status_a64;
     set_default_nan_mode(true, &fpst_std);
     set_default_nan_mode(true, &fpst_f16);
     fpst_odd = fpst_std;
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index e3083c6e84e..44ee2c81fad 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2066,7 +2066,7 @@ void HELPER(gvec_fmlal_a32)(void *vd, void *vn, void *vm,
 void HELPER(gvec_fmlal_a64)(void *vd, void *vn, void *vm,
                             CPUARMState *env, uint32_t desc)
 {
-    do_fmlal(vd, vn, vm, &env->vfp.fp_status, desc,
+    do_fmlal(vd, vn, vm, &env->vfp.fp_status_a64, desc,
              get_flush_inputs_to_zero(&env->vfp.fp_status_f16));
 }
 
@@ -2076,7 +2076,7 @@ void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
     intptr_t i, oprsz = simd_oprsz(desc);
     uint16_t negn = extract32(desc, SIMD_DATA_SHIFT, 1) << 15;
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
-    float_status *status = &env->vfp.fp_status;
+    float_status *status = &env->vfp.fp_status_a64;
     bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16);
 
     for (i = 0; i < oprsz; i += sizeof(float32)) {
@@ -2128,7 +2128,7 @@ void HELPER(gvec_fmlal_idx_a32)(void *vd, void *vn, void *vm,
 void HELPER(gvec_fmlal_idx_a64)(void *vd, void *vn, void *vm,
                                 CPUARMState *env, uint32_t desc)
 {
-    do_fmlal_idx(vd, vn, vm, &env->vfp.fp_status, desc,
+    do_fmlal_idx(vd, vn, vm, &env->vfp.fp_status_a64, desc,
                  get_flush_inputs_to_zero(&env->vfp.fp_status_f16));
 }
 
@@ -2139,7 +2139,7 @@ void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
     uint16_t negn = extract32(desc, SIMD_DATA_SHIFT, 1) << 15;
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
     intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 2, 3) * sizeof(float16);
-    float_status *status = &env->vfp.fp_status;
+    float_status *status = &env->vfp.fp_status_a64;
     bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16);
 
     for (i = 0; i < oprsz; i += 16) {
@@ -2808,7 +2808,7 @@ bool is_ebf(CPUARMState *env, float_status *statusp, float_status *oddstatusp)
      */
     bool ebf = is_a64(env) && env->vfp.fpcr & FPCR_EBF;
 
-    *statusp = env->vfp.fp_status;
+    *statusp = env->vfp.fp_status_a64;
     set_default_nan_mode(true, statusp);
 
     if (ebf) {
-- 
2.34.1

