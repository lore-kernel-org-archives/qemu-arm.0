Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143820njb;
        Sat, 1 Feb 2025 08:44:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVryvhppUjW+dgL3AkYhWr28vn10Ewtti1/GZ7VC+5pMF+BrATqRmwpRCnLZT56T+NuwcNwG+RBWlJT3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFbyJ32zAjCnGUeppaZrtEd4tZ695LtwSCP7LikaWgw30tK5bdDX4zXc33Te8K/FlN6gd2l
X-Received: by 2002:a05:620a:244e:b0:7b7:106a:19b0 with SMTP id af79cd13be357-7bffccc4a3fmr2006665185a.12.1738428289004;
        Sat, 01 Feb 2025 08:44:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428288; cv=none;
        d=google.com; s=arc-20240605;
        b=jXoABvVP77oYQ31hCNVXIhVZnm0ecZlpc2zMDNoHkjLcOWN76rU/y4qpZ1LOiZgEAR
         h+uB5OHnD0kthES6pkEPJa2suChq0A58dK0Ljktx90g2NCHT03HTGqaSbwXX1D+CTSAR
         Iapt8PXDh+LgO5lOTBJ5MozppVFIWuUVjcZtEvju8Tn4z9OXq+9anPNefDalWebVzGvV
         JEU95Jj8+3btbeVOYW/HYIOGntIvqmXzZ8bN/4hP+gaYOs9xXwPs3XYZk3UeV/0VSPwv
         torHbB4qjBmWmWnniaWbPx9yuVt9UOPkLuz3dC6y9d+yuP8SE4y2JrP5NBzMt+hO7G/A
         oILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oHCiuj4JVKpkS58JWQkdgF532nZyU3vTNz6sMG44ioQ=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=cio/EUGV3yal0CoyXpEWm6ukce+VqTs06+aq9cudR8OxQswaYTEK8GAmTXk/JxSzgk
         quwGZI0fSkc299gX4lwKDcqwiHXwLJrRYmeSchYT8Bc48La+HDsqwOfTtS3Fg8nH6ccP
         7Dl94K3la7+9f3VrJCd2EP85bZ2UiZHK4BwCWwqQYjsC4gLhTY7FXlG6nJx69kO275uK
         0eFkeLaO0Tkso2gy9A4eJUYGCmJFMSGULXv14SI0Fy4bKzzn+vsXScWyR0bXOIxLO6F/
         9XPdyJalRaujfCQ2xxYAbGVrGU24THFmJwEliCJVTAFj0DU2md+hH9hx2/en72zI/YbK
         H+BA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jC1uLzTi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a93c4ebsi617974985a.633.2025.02.01.08.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:44:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jC1uLzTi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGXz-00067K-OH; Sat, 01 Feb 2025 11:40:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXk-00060c-Kh
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:28 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXi-00013x-Ti
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:28 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-437a92d7b96so29994235e9.2
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428025; x=1739032825; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oHCiuj4JVKpkS58JWQkdgF532nZyU3vTNz6sMG44ioQ=;
 b=jC1uLzTi5nY8CQ9aAYShjn+1855uTel7O/C5avNtckpwu2X49UGAKcCxuZgUpUyhEs
 SszdxF8M7BSaJnIk31JOBnzaHh5KW0NhGrl6fT/hb4uw+Opep5jlw0QH528D/4vu7Yp1
 iWxluC1sAh1gVVAa23ZWklJePpaG68NJFF9A6wgr9GH+sE3Nd5IrYoZdckTlMeZcDV6t
 f44m0hIEZE4v1YshXedVzSoxszLVPD5hhJz57XUAseSUG4TA9t8HM9Vvly/g/2RUsAo0
 j08x4iTHm9JoKwn7auLHvBCtVss7vfLt33EpSyN3KBbjyW4b8AUXHKvwCwX59z9AtvJA
 rsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428025; x=1739032825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oHCiuj4JVKpkS58JWQkdgF532nZyU3vTNz6sMG44ioQ=;
 b=B1PZS+npvC1DeqTck8Qr2VsNhJAQUXpQvRRg1QYzQvblvqClGkFPBtLj6hT2vZ843C
 6AJuTnTUqxHxIzl4XQKzpYHH9gWVxxeTdYvntmKpDXIgU2SkXN7tyL/CWy+0PfGPAoPx
 JhSziAf7htClacYDRsaabqrnLF9fjR8tZEYMrHGfQ7t4+ICIxf1ZO45QlHhSztiBY8cS
 Gy5/yZOmt8AWDS2uDAwli7NumfVYiAi35Lq0ZhJDYhUqHKwyc9jwQfhHUfxTjimr2T1U
 LTN9nPRLrgZfOWKVldw9qoLsKvZhIWUADqxRYJNBnrg492lt8ZXdunxfmQeMScQfZDEv
 h9kQ==
X-Gm-Message-State: AOJu0YxmR1/ZlQNg8mQ+Tvzv23iDn/hW0CEfB9EareIlt4Fr19Pdtvms
 VTKMBMl2v9ON1bt3S0F8TsnpSPy3NZGwhHM2FyZwweUmeVCM9C6UnawML9I+ViE9V3O48z9lOXC
 s
X-Gm-Gg: ASbGncs2WQ81cXVBLgn55oyL2K9fBl1xYkZiYOgzMIup0N6C8VxzQV+MxDmXGbhWX4n
 mXkbLndc4t/ED05yEGCKPDi0shuVPwvNOFA8w++uOALIiTrMafu5LRsmRTAhG2YpxYp31gUMr0d
 2vTgm7YXroJlAn2qJsIrCkDoawY0ArMig6aB0PikSp/jzaW+lol1bmpz+hkeMEqyqpYYdO/QH6X
 pC59KMOPKwNYXAqKnNIR+Yx0t2CqJDCPit3VUFqmyYkPAc337hQsCrgrM4GE7kJWccHQFWvldn+
 WDkf52hLlIgAnrx1cjHG
X-Received: by 2002:a05:600c:501e:b0:434:f297:8e78 with SMTP id
 5b1f17b1804b1-438dc3be859mr141987755e9.7.1738428025400; 
 Sat, 01 Feb 2025 08:40:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/69] target/arm: Implement FPCR.FIZ handling
Date: Sat,  1 Feb 2025 16:39:10 +0000
Message-Id: <20250201164012.1660228-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sbiHE2SCBndz

Part of FEAT_AFP is the new control bit FPCR.FIZ.  This bit affects
flushing of single and double precision denormal inputs to zero for
AArch64 floating point instructions.  (For half-precision, the
existing FPCR.FZ16 control remains the only one.)

FPCR.FIZ differs from FPCR.FZ in that if we flush an input denormal
only because of FPCR.FIZ then we should *not* set the cumulative
exception bit FPSR.IDC.

FEAT_AFP also defines that in AArch64 the existing FPCR.FZ only
applies when FPCR.AH is 0.

We can implement this by setting the "flush inputs to zero" state
appropriately when FPCR is written, and by not reflecting the
float_flag_input_denormal status flag into FPSR reads when it is the
result only of FPSR.FIZ.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp_helper.c | 60 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 8c79ab4fc8a..30c170ecee5 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -61,19 +61,31 @@ static inline uint32_t vfp_exceptbits_from_host(int host_bits)
 
 static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
 {
-    uint32_t i = 0;
+    uint32_t a32_flags = 0, a64_flags = 0;
 
-    i |= get_float_exception_flags(&env->vfp.fp_status_a32);
-    i |= get_float_exception_flags(&env->vfp.fp_status_a64);
-    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
+    a32_flags |= get_float_exception_flags(&env->vfp.fp_status_a32);
+    a32_flags |= get_float_exception_flags(&env->vfp.standard_fp_status);
     /* FZ16 does not generate an input denormal exception.  */
-    i |= (get_float_exception_flags(&env->vfp.fp_status_f16_a32)
+    a32_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a32)
           & ~float_flag_input_denormal_flushed);
-    i |= (get_float_exception_flags(&env->vfp.fp_status_f16_a64)
+    a32_flags |= (get_float_exception_flags(&env->vfp.standard_fp_status_f16)
           & ~float_flag_input_denormal_flushed);
-    i |= (get_float_exception_flags(&env->vfp.standard_fp_status_f16)
+
+    a64_flags |= get_float_exception_flags(&env->vfp.fp_status_a64);
+    a64_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a64)
           & ~float_flag_input_denormal_flushed);
-    return vfp_exceptbits_from_host(i);
+    /*
+     * Flushing an input denormal *only* because FPCR.FIZ == 1 does
+     * not set FPSR.IDC; if FPCR.FZ is also set then this takes
+     * precedence and IDC is set (see the FPUnpackBase pseudocode).
+     * So squash it unless (FPCR.AH == 0 && FPCR.FZ == 1).
+     * We only do this for the a64 flags because FIZ has no effect
+     * on AArch32 even if it is set.
+     */
+    if ((env->vfp.fpcr & (FPCR_FZ | FPCR_AH)) != FPCR_FZ) {
+        a64_flags &= ~float_flag_input_denormal_flushed;
+    }
+    return vfp_exceptbits_from_host(a32_flags | a64_flags);
 }
 
 static void vfp_clear_float_status_exc_flags(CPUARMState *env)
@@ -91,6 +103,17 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
     set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
 }
 
+static void vfp_sync_and_clear_float_status_exc_flags(CPUARMState *env)
+{
+    /*
+     * Synchronize any pending exception-flag information in the
+     * float_status values into env->vfp.fpsr, and then clear out
+     * the float_status data.
+     */
+    env->vfp.fpsr |= vfp_get_fpsr_from_host(env);
+    vfp_clear_float_status_exc_flags(env);
+}
+
 static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     uint64_t changed = env->vfp.fpcr;
@@ -130,9 +153,18 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
     if (changed & FPCR_FZ) {
         bool ftz_enabled = val & FPCR_FZ;
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
-        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_a64);
-        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_a64);
+        /* FIZ is A64 only so FZ always makes A32 code flush inputs to zero */
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
+    }
+    if (changed & (FPCR_FZ | FPCR_AH | FPCR_FIZ)) {
+        /*
+         * A64: Flush denormalized inputs to zero if FPCR.FIZ = 1, or
+         * both FPCR.AH = 0 and FPCR.FZ = 1.
+         */
+        bool fitz_enabled = (val & FPCR_FIZ) ||
+            (val & (FPCR_FZ | FPCR_AH)) == FPCR_FZ;
+        set_flush_inputs_to_zero(fitz_enabled, &env->vfp.fp_status_a64);
     }
     if (changed & FPCR_DN) {
         bool dnan_enabled = val & FPCR_DN;
@@ -141,6 +173,14 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a32);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a64);
     }
+    /*
+     * If any bits changed that we look at in vfp_get_fpsr_from_host(),
+     * we must sync the float_status flags into vfp.fpsr now (under the
+     * old regime) before we update vfp.fpcr.
+     */
+    if (changed & (FPCR_FZ | FPCR_AH | FPCR_FIZ)) {
+        vfp_sync_and_clear_float_status_exc_flags(env);
+    }
 }
 
 #else
-- 
2.34.1

