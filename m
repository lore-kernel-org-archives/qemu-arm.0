Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp931421njk;
        Fri, 24 Jan 2025 08:36:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbBEcLkODYWQXWhmwDPjVioqLIlF/TAA/SaEV5b/3ldpkLs6NmsgJrM130eSL/ldq0PkiDjxKwnAuBKw==@linaro.org
X-Google-Smtp-Source: AGHT+IHqrYr0YR1VdcjJF2ZTOoCBY9czMRiJtgxCn8GvvUBuWW6Py4vSHG5gfGL42zqGb31ixwX7
X-Received: by 2002:a05:620a:29c4:b0:7b6:c473:4ec3 with SMTP id af79cd13be357-7be631e6c5cmr5232220185a.8.1737736610258;
        Fri, 24 Jan 2025 08:36:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736610; cv=none;
        d=google.com; s=arc-20240605;
        b=E5fhaedJMFzMnL8mN44goSWQ4CKMUoR50QWbLMyaBB5cQS+yMD9T9F8yYQX0jhTCYJ
         BZkahpYfAo1wXgZ/jW/hh0H3bsyuY36wM+DbUKOGPy+eYRvapE0fHAms5iLZHavBzgo/
         YO74JsOFW6fpafzoifJdYdD4IK+rzqAfnezKY+cYvipJAteZ1sVrvxesmUIJE71Vr4j8
         uxX3hhRAMZBkpur9LuM+jrv273Uupi+aGCFvq7NAtsT11zxOnUyEyXUS0yTgMM8f6Jbx
         DglvS21tXR+kQmz288Wfm0MsGHHr4z1cJpciMJ2IDt7y/TK1nCND8TJpf9EurChTE7hW
         4MIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6JkebY7aHBt5+Ow5GGAKlfmA8fph3Hd4QWwYFSpEozU=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Xyw1TsY4rhwefaSXWYKuOQWIoqniTElw99xmivWo1QWHb8/3G0lv2/Hv9rZ2hHlTXr
         t4loOzgoHJfVzOlwouz1cs//slyXD6N2f2IUAPfJLai6F7y+fMzYEGxS1c4azHhSIXrh
         f/WzL0uga2hVH54Dc8PdK4pnrVumnSFU+03g3wt0bTXUj8fQRcuMkVCSGTg1dcbc7qJs
         28u7jjoUJ6K8Kf26w9FrZyCe98oUQVP3Il9gvzZsfOOrFXNiHEtKpey8buFgsj4ZjmN3
         Y/a2lSsm2c0VmxWV6oOoB6NEfbACU8iHXDsSmbJwwIcmLh4DenuGVT3q1qgF9MKV3fiS
         vMTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFVAX6je;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af2b867si303230985a.609.2025.01.24.08.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:36:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFVAX6je;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMYq-00055E-Cx; Fri, 24 Jan 2025 11:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYH-0003nQ-1P
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:01 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYE-0005R4-Di
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:00 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43626213fffso22178525e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736136; x=1738340936; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6JkebY7aHBt5+Ow5GGAKlfmA8fph3Hd4QWwYFSpEozU=;
 b=CFVAX6je7XhjM1owNryTwHLqfHcDeCl01qto9TvhLfavMY0lyOiWrZ6HadogQhf11r
 V+69BMooARVcib4x3+temzoDTuYTkk0EHHeGTrPcu0G+q70zteKrNKsoxPTsHOaCWdjP
 rnffCQZVL1X/Q+kruQMkA46Gsy7y7eewHwijqsN0XgQBueRdN8ta0CCV7O8o4WxlMjg4
 1kOVP+f4WCiwCfl98duN+zHqL5zR48WOk3dV1bdIn6Q4SYs8PefUaC3eYmzwfO9RG8/z
 dQViVV9g7XQhfp0d/F0lfGEgCA5Kb1udFLa1fhoNTV0NP/9xnREQF7d2yaaFbripwcMO
 FBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736136; x=1738340936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JkebY7aHBt5+Ow5GGAKlfmA8fph3Hd4QWwYFSpEozU=;
 b=ui8JxdWTAY/u9LcSJUa/Fv4uBET6Z8ZUT34ijUOsL16NLTxvOl2Njn5cQfgRnSQOGP
 U3hhiePyU2O/WE2rPWx4Pr17nU8enS+QP0fIRixG61Fz9G04UtJ5ZVSwmgtuqr41mz9u
 gJmLe101yhBJFXZu7A+I+d7hxf6eaP0ZNqB6mtoJeFWgJ6Lb7s5G1xlj8sUuoGw8CZlj
 qQpIFJCOZlsvZkQ0pf+1/km6w4CmpNMl+SWWAm2mXNBxZnNGEumB/UVlmFMbn1cEyrzT
 1M5QJvuyHuhCPeY6iduKjp1IzXKrpR6ZqyBPDaToHMI3YFso1mX7CScpHCBnnNcgRv56
 wKwg==
X-Gm-Message-State: AOJu0YzBn/3pcWngOLtGLaZtFlK9e2G9v0nlnNgsZUhyuL4lbkPnC4PF
 Bcw78rCFxmrpf4/aTOvpmXCFqrGlhLVr5wDgixpYSwtcALJNPTatgNxUczo9+ELefB0E752jFnF
 m
X-Gm-Gg: ASbGnculioWfmVwe53VL3A9/q1FB0A05Rb+pVK+aV91AcbCKWVan5ynQgc1LEgJ+1sf
 nKZaY0B4OKgrFuM3UtuLBqrBuDg4kV4tBkQ3vgKiX3tn8gEZAXXdRIGUDZOMQZfFARADFKd5I2L
 +4SOlPKwEbI/mxjSItDqVJx5B84p/Lad4dpYt4dI72pqkaCrgiiwF6IJ1elaC2aKLeIitOkKVvn
 WCxvSMA82CNnr6LDzTGYEcYVzcpPTSrb2LhK2kEK7LK9dBpX1+IibBH+82M23By+fNH6m4UVoIw
 alSFCo1R2Dw=
X-Received: by 2002:a05:600c:3153:b0:436:76bf:51cc with SMTP id
 5b1f17b1804b1-438bd0a875emr36686715e9.12.1737736136189; 
 Fri, 24 Jan 2025 08:28:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:28:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/76] target/arm: Use fp_status_f16_a64 in AArch64-only
 helpers
Date: Fri, 24 Jan 2025 16:27:35 +0000
Message-Id: <20250124162836.2332150-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: BQmfcDyzrLjM

We directly use fp_status_f16 in a handful of helpers that are
AArch64-specific; switch to fp_status_f16_a64 for these.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/sme_helper.c | 4 ++--
 target/arm/tcg/vec_helper.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 2aad00d3ad9..727c085f374 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1038,12 +1038,12 @@ void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
     float_status fpst_odd, fpst_std, fpst_f16;
 
     /*
-     * Make copies of fp_status and fp_status_f16, because this operation
+     * Make copies of the fp status fields we use, because this operation
      * does not update the cumulative fp exception status.  It also
      * produces default NaNs. We also need a second copy of fp_status with
      * round-to-odd -- see above.
      */
-    fpst_f16 = env->vfp.fp_status_f16;
+    fpst_f16 = env->vfp.fp_status_f16_a64;
     fpst_std = env->vfp.fp_status_a64;
     set_default_nan_mode(true, &fpst_std);
     set_default_nan_mode(true, &fpst_f16);
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index aaad947e506..3fbca8bc8bf 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2067,7 +2067,7 @@ void HELPER(gvec_fmlal_a64)(void *vd, void *vn, void *vm,
                             CPUARMState *env, uint32_t desc)
 {
     do_fmlal(vd, vn, vm, &env->vfp.fp_status_a64, desc,
-             get_flush_inputs_to_zero(&env->vfp.fp_status_f16));
+             get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a64));
 }
 
 void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
@@ -2077,7 +2077,7 @@ void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
     uint16_t negn = extract32(desc, SIMD_DATA_SHIFT, 1) << 15;
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
     float_status *status = &env->vfp.fp_status_a64;
-    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16);
+    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a64);
 
     for (i = 0; i < oprsz; i += sizeof(float32)) {
         float16 nn_16 = *(float16 *)(vn + H1_2(i + sel)) ^ negn;
@@ -2129,7 +2129,7 @@ void HELPER(gvec_fmlal_idx_a64)(void *vd, void *vn, void *vm,
                                 CPUARMState *env, uint32_t desc)
 {
     do_fmlal_idx(vd, vn, vm, &env->vfp.fp_status_a64, desc,
-                 get_flush_inputs_to_zero(&env->vfp.fp_status_f16));
+                 get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a64));
 }
 
 void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
@@ -2140,7 +2140,7 @@ void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
     intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 2, 3) * sizeof(float16);
     float_status *status = &env->vfp.fp_status_a64;
-    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16);
+    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a64);
 
     for (i = 0; i < oprsz; i += 16) {
         float16 mm_16 = *(float16 *)(vm + i + idx);
-- 
2.34.1

