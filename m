Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2284839njb;
        Mon, 17 Mar 2025 07:29:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWiqNjagAXAse7JT0zzxFI9XijSgru19kcU2XpXtRKfz/DoA5Wzy4Q2+pzafKR7qNx5xUbOnZU1RGziPA==@linaro.org
X-Google-Smtp-Source: AGHT+IFKxFBu204b+wJDrSDoOsghKgg/r2Eynbb/Hww0pmDRZK3zgfNvkcBEEOcAmo+H8yOTYgs0
X-Received: by 2002:a05:620a:1a0b:b0:7c5:3b3b:c9da with SMTP id af79cd13be357-7c57c8fd227mr2137719485a.40.1742221799183;
        Mon, 17 Mar 2025 07:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742221799; cv=none;
        d=google.com; s=arc-20240605;
        b=MzhvSJL8r7vETRp4fw7x7w9O1SUi/S9dM865alXsOm1FkbrdIAj1L362CahbBaugUG
         IT2Uob2343yilEUV+uDwFKuH+ONMN1hLHaLkOZO2j5vKPGM+EEjMPonC8rFNHrJ99+p9
         zWey4q50TLr0LQmkStYxa2NflMHAG7v7pojFqsp8DqQBS+ahIPdNoUMbhp65eMEps0Wu
         fPc7kQ5Iroo/OTInNSnFgtuS/6L6eY6dApVVTWsjlgZCYkiYkWa8cMDy8+1nR1fRAlOp
         azphofqxFmTcozebDb1CLE5TWS4Qk13e6zbAM9GaulRxTQILndRPn0FVGh34IqYahYLh
         S4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IGKVMeg4aDxvbEQfJftU83jMmdBHS/KLNHZo9WpIB6Q=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=NOM71B21JzYv+1zEuXuZeZiM9PJI3LwixRlr60IhwjKvl7AbA02gWajTdwRYKLzKIg
         qlHMf7VrDTHaAEPrQDJWh8Yu6nji3XvMkNGSC9iGP74t25xzj9e28W6kVLzVwQSIPOFs
         brX2LJP/F1UNInvBdf1t6895H9Mj1+tdpV6apvka/ntAC70p+28ASj+BreSM+tn1bNKV
         Vtq5YvYPZg8ofBIC1aTF+5u2Uu0dCca7RYsbbZZwnYjPSg/VGRVdVcMfDx5AWXB1q9GH
         uCbBrfXSoQ3tLo5JKUlGa5iklson4M8H9Kv2ospD9fXTYEsIaCWKVC7GakoH6Tt/FECG
         2AdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KgPl5X+v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573ce9720si963566885a.329.2025.03.17.07.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 07:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KgPl5X+v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuBSf-0000y5-Mh; Mon, 17 Mar 2025 10:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBSG-0000gF-Sy
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 10:28:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBSC-0001DY-0K
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 10:28:36 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso13660155e9.3
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742221710; x=1742826510; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IGKVMeg4aDxvbEQfJftU83jMmdBHS/KLNHZo9WpIB6Q=;
 b=KgPl5X+vBGiWG4s0QK/MBma0/dJNievroG8yTAHVEzk3Zt5NYmkFyX1i9H20fgGTa3
 2DCPfEN3tMKbQofs3wuuM2z7HUEOuld0l0JNs+xzL2u3s2XXgXEOUA9OEqK5TBV16mTZ
 dn4maArEOH2BcVQO9T0ywJAiL9K77e5gRGzkp9xiyeLKMXFbAHb7JuwO/mPUvxea3doB
 MInur6daRYUBA7axJm2mzUjd+WpbX5nJI38dXvS4s7cpZOwB6KxqmjZc8vfAhGzBgkgF
 TO6zzCj0pC3/GS4cca1FM/dP7/DjHGa+mKx3IJbAF8Dp8Ps1liUK2o4f9FWYJXqHxoeY
 BnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742221710; x=1742826510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IGKVMeg4aDxvbEQfJftU83jMmdBHS/KLNHZo9WpIB6Q=;
 b=QbPRQAkSUnhtATSs9E/SYcDSwoL9aL2GTEzXhSx1FHZzBgzosFHt1iPwX64ua2MpT4
 unhWTEeAs5fkmr3eTsD2IyLKuMW5hxtKkJWP8eRTe9no6GlzZvd+fokKJElxWjmKI99X
 egXM5wCigxyMIDyAI6mfGKY0+zpWCWTaJRyBAeO+c+5WYVIQoW66qxitN0D7khT14Uk6
 00mLwSl1jmh/XpElVycwR4vQ9k+Nd5Q1WutTvNyEcUflMgKV9VkO19m4wGuPuFeNJPM+
 Yn56cq6iB7aZ1Fz/ZtsG2nN/CAwd2OQG2dozwbZPhWQ66FeB+OhmO28SfZqwxcLtmGus
 B/qw==
X-Gm-Message-State: AOJu0Yw/3WfMz84Irv0vZ5hkpeLP+5qI7TGlB/S/9GOXyScpWbTWG9Bj
 43TSzXHWF41ZC3Aj4Q57iFFztTIlnSP5txa8zT02UokJD+knMlbUphY0NfFjLa9vrRgirC+nk1w
 Y
X-Gm-Gg: ASbGnctelAHAddi+OsmByTxayGqmmuTMMsWa6YH8qxlyUhSxzBv9f0FWQpR1PAgpU+T
 8er27gkjRFyf7A6mDtx6LBaOQYo0H93zSS7A3IvaQFQKLonkg2AyOskSllOGcfrgulP1FrxQOcw
 PSSkiB6fnUUp3aAyYxh3j524ZlITonDGvW7AUVo7pZbORwaOQWVnjumwmsd8P1ej3SC88yl/TMZ
 IYzoIC8zvjtzljbZGV2Dt63snV9jRD5eP1ats6Z/U9Yadaa6uly7ooPRQGjRBfJRAmtgflzuDr+
 1vCuldaAlXxiVCouucx82iZueSH6f1SHXHTYyxLTwRmgI9qlgG6qi0H3y0hpEw==
X-Received: by 2002:a05:600c:3c99:b0:43c:f597:d565 with SMTP id
 5b1f17b1804b1-43d3897499bmr577705e9.12.1742221710402; 
 Mon, 17 Mar 2025 07:28:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe60ad4sm107914985e9.29.2025.03.17.07.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 07:28:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-10.1 9/9] target/arm: Remove TYPE_AARCH64_CPU
Date: Mon, 17 Mar 2025 14:28:19 +0000
Message-ID: <20250317142819.900029-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317142819.900029-1-peter.maydell@linaro.org>
References: <20250317142819.900029-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: HG2MEEi/jnSm

The TYPE_AARCH64_CPU class is an abstract type that is the parent of
all the AArch64 CPUs.  It now has no special behaviour of its own, so
we can eliminate it and make the AArch64 CPUs directly inherit from
TYPE_ARM_CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-qom.h   |  5 -----
 target/arm/cpu.h       |  4 ----
 target/arm/internals.h |  1 -
 target/arm/cpu64.c     | 49 +-----------------------------------------
 target/arm/tcg/cpu64.c |  2 +-
 5 files changed, 2 insertions(+), 59 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index b497667d61e..2fcb0e12525 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -28,11 +28,6 @@ OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
 
 #define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
 
-#define TYPE_AARCH64_CPU "aarch64-cpu"
-typedef struct AArch64CPUClass AArch64CPUClass;
-DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
-                       TYPE_AARCH64_CPU)
-
 #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8f52380c88c..c9c53a6294b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1161,10 +1161,6 @@ struct ARMCPUClass {
     ResettablePhases parent_phases;
 };
 
-struct AArch64CPUClass {
-    ARMCPUClass parent_class;
-};
-
 /* Callback functions for the generic timer's timers. */
 void arm_gt_ptimer_cb(void *opaque);
 void arm_gt_vtimer_cb(void *opaque);
diff --git a/target/arm/internals.h b/target/arm/internals.h
index a18d87fa28b..0c24208f183 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -350,7 +350,6 @@ static inline int r14_bank_number(int mode)
 }
 
 void arm_cpu_register(const ARMCPUInfo *info);
-void aarch64_cpu_register(const ARMCPUInfo *info);
 
 void register_cp_regs_for_features(ARMCPU *cpu);
 void init_cpreg_list(ARMCPU *cpu);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 49cf06a7bdc..200da1c489b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,59 +781,12 @@ static const ARMCPUInfo aarch64_cpus[] = {
 #endif
 };
 
-static void aarch64_cpu_finalizefn(Object *obj)
-{
-}
-
-static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
-{
-}
-
-static void aarch64_cpu_instance_init(Object *obj)
-{
-    ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
-
-    acc->info->initfn(obj);
-    arm_cpu_post_init(obj);
-}
-
-static void cpu_register_class_init(ObjectClass *oc, void *data)
-{
-    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
-
-    acc->info = data;
-}
-
-void aarch64_cpu_register(const ARMCPUInfo *info)
-{
-    TypeInfo type_info = {
-        .parent = TYPE_AARCH64_CPU,
-        .instance_init = aarch64_cpu_instance_init,
-        .class_init = info->class_init ?: cpu_register_class_init,
-        .class_data = (void *)info,
-    };
-
-    type_info.name = g_strdup_printf("%s-" TYPE_ARM_CPU, info->name);
-    type_register_static(&type_info);
-    g_free((void *)type_info.name);
-}
-
-static const TypeInfo aarch64_cpu_type_info = {
-    .name = TYPE_AARCH64_CPU,
-    .parent = TYPE_ARM_CPU,
-    .instance_finalize = aarch64_cpu_finalizefn,
-    .abstract = true,
-    .class_init = aarch64_cpu_class_init,
-};
-
 static void aarch64_cpu_register_types(void)
 {
     size_t i;
 
-    type_register_static(&aarch64_cpu_type_info);
-
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
-        aarch64_cpu_register(&aarch64_cpus[i]);
+        arm_cpu_register(&aarch64_cpus[i]);
     }
 }
 
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 29ab0ac79da..5d8ed2794d3 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1316,7 +1316,7 @@ static void aarch64_cpu_register_types(void)
     size_t i;
 
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
-        aarch64_cpu_register(&aarch64_cpus[i]);
+        arm_cpu_register(&aarch64_cpus[i]);
     }
 }
 
-- 
2.43.0

