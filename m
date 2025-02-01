Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142520njb;
        Sat, 1 Feb 2025 08:42:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZoyDc6HYYV4vcuwuthfaCf698kMLBV0pttPJTTyqSygEAl9mQguyZjd3gdYkttqYjHuN8kv5fhv0sXg==@linaro.org
X-Google-Smtp-Source: AGHT+IF+X0d5WtwBYKYW9pKBWBi0lrpp4Siv89UBHVEr+mOY6Hn79inzwbcYwsReN4194JLaTy19
X-Received: by 2002:a05:622a:c7:b0:466:9197:b4fa with SMTP id d75a77b69052e-46fdd404385mr166981431cf.21.1738428123144;
        Sat, 01 Feb 2025 08:42:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428123; cv=none;
        d=google.com; s=arc-20240605;
        b=GVxJRy6sVkgct+ekMuMKUcJM7KyPQEejTvrLFujuYPLYdZwj2MJyCAab61rniiUMg0
         YcXJnWs1idFgQRJT/E0Ts3wtfnHjSo34mB639YzJDK/cp4HqOmtUWqCNuKUlrZmODecr
         Oh+5DRtjDvtpDKjRiTv9pI8WpGfxwihJpKad95OSVqLNTe3TlD/AbaPRqDtbjDr5Lk58
         K8uDY+yn3BDyXUF42DitLoPlwDIC7+d7umFfWL9rX+2+7UYDusXRL9O0GbSwOfgdS3i2
         aENRtw4N63kmEWGrbEXZdGFMGs2Mu32Zj1Z3GxyHc5AXFY3WhwbDwK8FtznCww2/Uq3J
         dESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4NQtpB/FauH0rtbCX6r0pw974wudG+5NfUJow/nkqw0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=eX57VQ5gvObi5VIRnZOqhdhu/BHb71oWChtExFg0jSwgsHQS9Ff90knocZHPWl9Nq7
         huH6PL/QzvFEIz7jfzJuf0/M5kuGOO0/W1+/+3flvmPmWVgXDfem04k9glaMX1C/qQ22
         CPHwcvSwfE3G2FKQdMhPuLJ9lqv346joyksBTQhxuzpnnycR49z/7tDr8Xd5U78SDA0i
         jdjHa9sT8FCrS6TRZ/8Ye0UX6Z5gM7ymuu5+a4ETRkiM9I/yxzTVhc4gG2U9oV6/WbAo
         BNqAhdZRFqGw9FO0D65RXh5tewsJ8vhuLBdWthHOHol1HYqYU/tnE2VoN58jmrtM8FwM
         0Ngg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p7EAfEVy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1d0758si62329091cf.356.2025.02.01.08.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:42:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p7EAfEVy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGY1-00068w-3b; Sat, 01 Feb 2025 11:40:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXn-00061V-St
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:32 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXm-00014f-6y
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:31 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43635796b48so18697325e9.0
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428028; x=1739032828; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4NQtpB/FauH0rtbCX6r0pw974wudG+5NfUJow/nkqw0=;
 b=p7EAfEVyymPhv9f5gIsSuL/c3uJ2d0jO4h/CRlrV9tG1dG2/UgREw7SDuQnRIMX1hv
 L+xXq7ebcMN4nzxUxSrvD6Az+T9RSlEpNFv1BayrdI6IzvfCEE029W6iu8C6PEL7VGAL
 7QcJLD229gl5rNx3BfkufMGQTsQBSPfUbqOg8LgMain4qEJaYOaiXP3Cauxdu+An1fxn
 MBZUhhm9Cw3c+oPGER+k4cNcdpHHv1a2B1YB9tDmMQW3MKO80Y0Ovzm4WkShyHW0TYbG
 K6tUXaBWyqa1TYnlEFY01aGtMyoCsyoTMzh5SXtmZUV4oNMN1TJ0heY7+vLCWVoCJxe6
 /q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428028; x=1739032828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4NQtpB/FauH0rtbCX6r0pw974wudG+5NfUJow/nkqw0=;
 b=LQwuAYsepv8MEmIVruyesocR3vwEMIRArpy7biCP71H3uKd84LQngpSyDfa4NMh0P7
 SZSvFARBC/0Y8eKfOKDUXBFyjSgUEpTCi0cuUyWVpX8sZ97gUs5ljqN+g0VIZmPL1RNr
 iL1TW6jsYK4+P65QEmWMn//V2ibZX62pTOFS/gXkhTdYmXQjxmPSRngfKfRtTwuZDPDD
 rsscL3yWjcjCYnGXX8ZV2jZAft/UJM1uNOM0du/u7YapYPE6Abiw1R2Onx/WjRZMrMnr
 qOZzZepOi9yOaSPVQPuQUoXQClIuL7/4us0JXm+3hgOzqySELFn9eU4pT3MGGzhPwgfG
 GguA==
X-Gm-Message-State: AOJu0YzuIUdslVcSNQNRJyjkOJ1ViLnIO+hnuO58v52uL4vX96oKuhyJ
 nec3052cXEKGBg/MZvBpTk1KAoc4mWf4VLsixtcbJcbdAeVYDoZXTuyGVWngunwzmeNnojfOvvA
 V
X-Gm-Gg: ASbGnctAKN3Ze5pSaLvPxOzHIUIFQOV29IKDM67KEf43y771VzsKsO4U0D9gk8kwje2
 Pr2otGNBWsFqz+8lcFDTCOxnYi+JC0xBi5w2+MXen8i/BEQ22Es9kUC6QQRpxqu3au3crvwBgaI
 M2GG6HA99a5Cq282TUvCzdSH7tDioUOAEnnhkwzM7Q6+j8a4i3igC7LeMZm/vcupzeD2NpkHs/X
 MZzfEvNCDjRNUo20AEFXtJfQs8ojQ6ke9HDxqfZhHePBzO5SiGZqmE92UoNs5t2vWggXmERgxCG
 EZgIFrOtGp3DEzRVjYCj
X-Received: by 2002:a05:600c:91c:b0:434:9e17:190c with SMTP id
 5b1f17b1804b1-438e15522bfmr91679435e9.0.1738428028045; 
 Sat, 01 Feb 2025 08:40:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/69] target/arm: Adjust exception flag handling for AH = 1
Date: Sat,  1 Feb 2025 16:39:12 +0000
Message-Id: <20250201164012.1660228-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: RD9Xj5Tafkp8

When FPCR.AH = 1, some of the cumulative exception flags in the FPSR
behave slightly differently for A64 operations:
 * IDC is set when a denormal input is used without flushing
 * IXC (Inexact) is set when an output denormal is flushed to zero

Update vfp_get_fpsr_from_host() to do this.

Note that because half-precision operations never set IDC, we now
need to add float_flag_input_denormal_used to the set we mask out of
fp_status_f16_a64.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp_helper.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 62005e19524..57100e95378 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -78,7 +78,7 @@ static void arm_set_ah_fp_behaviours(float_status *s)
 #ifdef CONFIG_TCG
 
 /* Convert host exception flags to vfp form.  */
-static inline uint32_t vfp_exceptbits_from_host(int host_bits)
+static inline uint32_t vfp_exceptbits_from_host(int host_bits, bool ah)
 {
     uint32_t target_bits = 0;
 
@@ -100,6 +100,16 @@ static inline uint32_t vfp_exceptbits_from_host(int host_bits)
     if (host_bits & float_flag_input_denormal_flushed) {
         target_bits |= FPSR_IDC;
     }
+    /*
+     * With FPCR.AH, IDC is set when an input denormal is used,
+     * and flushing an output denormal to zero sets both IXC and UFC.
+     */
+    if (ah && (host_bits & float_flag_input_denormal_used)) {
+        target_bits |= FPSR_IDC;
+    }
+    if (ah && (host_bits & float_flag_output_denormal_flushed)) {
+        target_bits |= FPSR_IXC;
+    }
     return target_bits;
 }
 
@@ -117,7 +127,7 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
 
     a64_flags |= get_float_exception_flags(&env->vfp.fp_status_a64);
     a64_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a64)
-          & ~float_flag_input_denormal_flushed);
+          & ~(float_flag_input_denormal_flushed | float_flag_input_denormal_used));
     /*
      * Flushing an input denormal *only* because FPCR.FIZ == 1 does
      * not set FPSR.IDC; if FPCR.FZ is also set then this takes
@@ -129,7 +139,8 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     if ((env->vfp.fpcr & (FPCR_FZ | FPCR_AH)) != FPCR_FZ) {
         a64_flags &= ~float_flag_input_denormal_flushed;
     }
-    return vfp_exceptbits_from_host(a32_flags | a64_flags);
+    return vfp_exceptbits_from_host(a64_flags, env->vfp.fpcr & FPCR_AH) |
+        vfp_exceptbits_from_host(a32_flags, false);
 }
 
 static void vfp_clear_float_status_exc_flags(CPUARMState *env)
-- 
2.34.1

