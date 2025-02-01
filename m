Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143433njb;
        Sat, 1 Feb 2025 08:44:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcUaLD8NueTVSEtQ3G6Tf544Prtz3PwvF8jNOYufAXWhL3XweHryVmEqrPo2dxvbLKQSWf4V8OD2qyYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFm2deLBbCUv3qz9DdjQuC694ZnMjwHyL0KLe6HGHdsf7dQbMj2Tsc5EMoPN7vhlTcaP7tW
X-Received: by 2002:a05:622a:410:b0:46c:79a4:5574 with SMTP id d75a77b69052e-46fd0a7fdb4mr214558841cf.4.1738428241333;
        Sat, 01 Feb 2025 08:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428241; cv=none;
        d=google.com; s=arc-20240605;
        b=DYev2c4hOCmX2046OcaaE6eiJnIaa8ZUKm/o+NmcnlY2m8ZnVSUinT4/seGknk2MXf
         9xONIfP9WBBmY8I14WqI2O1aeqrVWccblxcjQuXurO2M/XGx5Y1IgXcB+OM19xBWCebG
         ecILgmtu40XwPfC0Z3jplhOWLgtdImfy+ejcykFxTImwokBkssIRwi9RaVB0PZZP90s0
         Ryu2kst18NJX8wdPW6XaDzkSf07Vn5uBxhui98685G51l3I3xR0yOemYXP9Ow9cyo6uL
         dYkReM9/IDIBm7zTr7xQqbtMCd/6Ue3Bmm57kp5F9X9P3vGubRgj/XRfANMrxFz6EUgt
         NRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pJ4Llm9zmJe0iTGfKF6gDwvUK7rJ3o7BNts192kJkZI=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=cAB9fN+QnujnOETLcM9Rwg6KYVHGm77rNyK2EQnGHQqC4P3OF+NoePIZ/rvxcHcTbw
         tptWBrxM62s4pvFDrlmeC12391J8bsH/HdUgGM2I1qpxi8uN+mkV/uFQl+2Xmx7widZF
         XQXX1Q86LgTJJiG8twZC0CzMxz/9gF7JRSivrtztvCixEITrHX0E6GTN1//7sSlOv9PZ
         OTsXE0VkMM8AZy/JEErLwRWwXttOVwKpc48UOWlMNV8gKcz7MxbUsneHoTh+WkLcZwsy
         9s9KlEsfkmZgWSVotRvKpviCj4aPYOvAgDDlInzKn8lKuFQR3FmCexPYnG92sxapD3lb
         kBzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S5qUZWU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1b9fa4si69054491cf.320.2025.02.01.08.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:44:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S5qUZWU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGZD-0000sD-RT; Sat, 01 Feb 2025 11:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYq-0007Tt-Af
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:37 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYo-0001Mo-PP
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43626213fffso25751465e9.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428093; x=1739032893; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pJ4Llm9zmJe0iTGfKF6gDwvUK7rJ3o7BNts192kJkZI=;
 b=S5qUZWU7MalbRYKixVz0HgueIp9QsIZCu2V3X1Bh4DwLYH8nibZ0I7uFzvZjKsdvKT
 EFdVqz+k9tP2ZnRABcjHZxmMcskNLyMcoRVzuBWiS288v7QFEyY6vie50920O4HQUprR
 apRZgbuF73RFPfwMTu3akDQPhzI+723650B/lVJQAtxSbp/s3rkFZx8rIAXHGJFLP6vn
 FLmj4UrtHmJYuArxvF5FcUH2Y4CNEjQULqAqL9zm+c7qd8o4EAdcDYzC5cXok5y9ptSg
 CcVIyKVg/M1UsBiMzoBeexDow8I2oE+H2ig6iJzWCwjrG8TViQYtkuK8mPKuGn8Hoh3p
 UftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428093; x=1739032893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pJ4Llm9zmJe0iTGfKF6gDwvUK7rJ3o7BNts192kJkZI=;
 b=ShHCFfeTxrA7aU7J9E03wMiLCy/kYd00vHw4oOTB/8CHNjO+nWN+dZR+30mvyAa9ol
 zzqDFk60TJk7dBVOkXp9lHcagndsL5kq8UDtYJ67jx1Np/NCwwEw0RkF0vpqXpl+2rCJ
 Qnxd19cp5pKZZ3JZxZksg36TzIg/1qDWDVWan6aIMP4NdDiTFbQC2l35JrNtUzulOpXp
 mFSGe/NrTpcoUjsM/gXPYR0frzdpLTxZtkYJgPI+xxbJsy2p3MRdjtn5X3fzDjb9CSba
 hOg7oxVSDMObfObUYnwhmuGR5kRvz0/9Oqu634LvbeFmWuvAfKLvYRBo5lxJs/O5RcUI
 Datg==
X-Gm-Message-State: AOJu0YwKrcDsSOPMfbfJYPE9nqVsXDXtQ1TIW9zj9s2nuxSymNyY4ilK
 KRCMXRu1JY+vh1EQ4UuOEDWxbouZ6hWQIOrbEkjpazBqMoXayIr41q63JQ+Wbe+IW4nzg4JfJGm
 I
X-Gm-Gg: ASbGncs2mwAroRwgg0c3hNSYu3DMzi0aUWhgoxCh0VYmDUisgSQUL+Rv+LsvRKChHWZ
 Ny9naOX4zlGlqb9GWNDU7BVt8FZ7+ZMTnF6MLU9MPQb6XFlrGWXUQCpHCXUJLHLDVu4PhfeoiaV
 VKjXZbDdqKMontF3onMOpQ8t4u7fjDW2X5pCKuoFsmTXQhSZIvpU9NprZ2so3xvZFcJ9/mJJBEq
 1lCg02CrHZobqmJDV7Twxr+QYaftLBPnPw2O8hPPi9Acr0dPCzbPrEJQN/QvnJQRQyFZDdLtHFv
 9pxdNO9L8slwSGcFOsET
X-Received: by 2002:a5d:64c6:0:b0:386:4a16:dadb with SMTP id
 ffacd0b85a97d-38c60f1832amr7918473f8f.11.1738428092896; 
 Sat, 01 Feb 2025 08:41:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 61/69] target/arm: Remove ah_fp_status
Date: Sat,  1 Feb 2025 16:40:04 +0000
Message-Id: <20250201164012.1660228-62-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: gUZ1jesAMxWL

From: Richard Henderson <richard.henderson@linaro.org>

Replace with fp_status[FPST_AH].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20250129013857.135256-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h        | 3 +--
 target/arm/cpu.c        | 6 +++---
 target/arm/vfp_helper.c | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0f7d5d54305..5e3d952588a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -233,7 +233,7 @@ typedef struct NVICState NVICState;
  * the "standard FPSCR" tracks the FPSCR.FZ16 bit rather than
  * using a fixed value for it.
  *
- * The ah_fp_status is needed because some insns have different
+ * FPST_AH is needed because some insns have different
  * behaviour when FPCR.AH == 1: they don't update cumulative
  * exception flags, they act like FPCR.{FZ,FIZ} = {1,1} and
  * they ignore FPCR.RMode. But they don't ignore FPCR.FZ16,
@@ -694,7 +694,6 @@ typedef struct CPUArchState {
                 float_status fp_status_a64;
                 float_status fp_status_f16_a32;
                 float_status fp_status_f16_a64;
-                float_status ah_fp_status;
             };
         };
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ffb2151de56..01a0428c6ed 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -556,9 +556,9 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a32);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a64);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD_F16]);
-    arm_set_ah_fp_behaviours(&env->vfp.ah_fp_status);
-    set_flush_to_zero(1, &env->vfp.ah_fp_status);
-    set_flush_inputs_to_zero(1, &env->vfp.ah_fp_status);
+    arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH]);
+    set_flush_to_zero(1, &env->vfp.fp_status[FPST_AH]);
+    set_flush_inputs_to_zero(1, &env->vfp.fp_status[FPST_AH]);
     arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH_F16]);
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index b77f27d1811..09e707badeb 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -129,7 +129,7 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     a64_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a64)
           & ~(float_flag_input_denormal_flushed | float_flag_input_denormal_used));
     /*
-     * We do not merge in flags from ah_fp_status or FPST_AH_F16, because
+     * We do not merge in flags from FPST_AH or FPST_AH_F16, because
      * they are used for insns that must not set the cumulative exception bits.
      */
 
@@ -161,7 +161,7 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a64);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD_F16]);
-    set_float_exception_flags(0, &env->vfp.ah_fp_status);
+    set_float_exception_flags(0, &env->vfp.fp_status[FPST_AH]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_AH_F16]);
 }
 
@@ -236,7 +236,7 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_a64);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a32);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a64);
-        set_default_nan_mode(dnan_enabled, &env->vfp.ah_fp_status);
+        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status[FPST_AH]);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status[FPST_AH_F16]);
     }
     if (changed & FPCR_AH) {
-- 
2.34.1

