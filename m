Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509721dyb;
        Mon, 23 Jun 2025 05:19:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcxNi9enP3iGcyq0Me4FAw9+icLw+ImpfBl24A0Bz9W9+ttgfn0IqtoKitHYujJTN8D5R1PrPQHy753A==@linaro.org
X-Received: by 2002:a05:600c:1e8a:b0:442:f956:53f9 with SMTP id 5b1f17b1804b1-453659dde93mr131189205e9.18.1750681189806;
        Mon, 23 Jun 2025 05:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681189; cv=none;
        d=google.com; s=arc-20240605;
        b=fkmnY/1dFl1hTBengLLljT020oJ7uIiHN5baBslyETvKDHWpPHCVjssJodTYIyEqtx
         eAFR3fQtBlK/zGXl2uSpwJnaRIangVTOYpVLccj6Q6fiE733tS6VowflpECl5ShvBgQs
         8Wr6NByg6VOySRKmJ0XBgoY0+CcQG7i29722k29CEWLY5/x0z5qK94eT94pHGfnPG2/B
         gvzryJOkJ9JksvFOUGKdtfryxbhKwlsDPDSqB7gXmQKUD4LbQB0QvJOygoOVLNk2Rcuu
         GwP/7/zzqFq3yDMU1bRKbyX3X47GIVVF1dzfbkbtpfT/tGo7KYar2EapNeMExDso7PQW
         a8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MZYDDWvDMspPzhkKxydUFPlizzWHJdNmtQlGNWnBP18=;
        fh=MItJuOZGZcJTt3wJByFF0whgq8p5MX1SfztSCwOo2vc=;
        b=jNaNZ3om3/Heur4sf2Ccwr54ihvuJPHnTon7EBvwiQKGTGBE3VnzdL2kOjmLLGIuio
         DaAHvup+DUps5TzYeBS0gQj8S1Y3wmaOG4cz/LqxlswaE8SyXYuh8KftxIgyol6k3qb3
         2fjyzIruAe4a+jG+3fojdnrI1n5vzg9fOZQNTeiN63lP/gxb0rVJb4x0TtiD0rxUXMN3
         WbNeUTsZsLiiepIiWrUEvdDhFeR8jm7M52LZcqDvJGa4Nyp+2ZXmJ2cfQ0d3tyYzoEiT
         Bnz+k4Ki/nLPtN7c/HgRMcx7mm730b2xpaFQut+hcl7pXcJg79RA6g8ffvM0aHrmMuOJ
         8JDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJHYZXbU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646fe7f9sor22658265e9.7.2025.06.23.05.19.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJHYZXbU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681189; x=1751285989; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZYDDWvDMspPzhkKxydUFPlizzWHJdNmtQlGNWnBP18=;
        b=iJHYZXbUFyCarv0nm7OO/xFatfZkJsWSSSB8NmTx23a2KLzMmfO2qe6iPd0MKVx6be
         3/Vg0QQs09jAoQbuyb1ikwgD4o/+vpPKeir54fGsL/+TLdw4SKnQ+3m7E7vSXUFqcE9C
         /7Sunt9ZKfGwMkyIcwyGmSFP0W9/bBpP8grr7ALzCINk4Dv9FXicCutVbA02MrSt3VbW
         FJ+q3iIngxdU6XzWSGkKhMWT88rXN7Vf+r4j/MH8qFOxAtf8UvpMttAmjQHYE6SqbPM4
         dt1/rjG0bZ+SlFWTrQLO5gCuywbuvUZ/ja8nMQtj5CW1Q3dzSPQ9NATfBG4TfaAm3SYp
         oSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681189; x=1751285989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZYDDWvDMspPzhkKxydUFPlizzWHJdNmtQlGNWnBP18=;
        b=WNKsQ2eM0CbXM82uYcevVxod++9ODZi8/mcdbMven5maklo9oyt862ZX5/zKBPHGux
         YqhoeUlS6ZugGru62vk8OW9+4NwRA1KNGJYADFbUbAVVCRlTjETfbBqCSmQmI3HrRLHK
         QjeLGX410XVDiHsiGwngq7AIgHhq+xB4AJTEiqSHxmHErA8G3te2Qq0me7uXr2L/jJIF
         WwpXZ5Y7vEfWKXzJLqmyJjyH//J6i4iFnkGDR2DDuQXshlU0eJHP3ZSmrPwYAwOcQ6bv
         O6lTj7mSje22xVXjkOdaqQd36jS1DuFZxJG07x0WohUZtPKxqN8p9Ra6A28lS4Xo/RuH
         4rQA==
X-Forwarded-Encrypted: i=1; AJvYcCVEM/xx3wKou4KZccf4TpGrUq610G0S/z/8LEDF43fDZxD4om7LdfYnyWpEcKlkDHD4fuZKa5SrF/gOTA==@linaro.org
X-Gm-Message-State: AOJu0YyEsWKpJGKvTuFGQ9YcJkD7swn6JR9CAAG/o4wTArOwTmcdO2nd
	Jig6pidTK6m/RcYQ0yNEABhmR/BbIcTdfud+GMj2Tt+h+h2NTSyQOVHFs+n5ZPUA1TxVIQ==
X-Gm-Gg: ASbGncsme5xCnSo59c4qxYg307e9wfe3qFnKhLMmIOhUhLZk/HPGyHGkvopXUvM5Jl3
	e5xvemlIhQd3EYcD01eMLbT9YY3r3bvNaq1fE4Ey0b212Hpm2gsCG5h//AyS77ARV8lWUEw8lx6
	vNtJWeNCR5USzt2fs91L7BDzrZAoL6VCjCyZdr4PFKcffbuRWvWiRlX6v+9n0ZzLnQY6VG8tqzG
	kIA81C6LyR3Qc72zctwgx5K6duHesSNTigQqs6y01nV3E9boMsqVbFY7AwCysR+kL3CoDOOtL+y
	zYIWmVxRqj7qDk9hIZoHzVNKKmeXeiBoE4PM49WXvZvnnAcG5DjCNgTtuIR8uekOrk62TqNuCFu
	N5Qx1ev2W9xN7ZOvBB0MkhgAZ8NKSE2f73r9e
X-Google-Smtp-Source: AGHT+IGt+hN6QhdH8hKFCVkO4jTWulC9IJ1I0tIA0BlYCZoOOrf5ORdSOfgPjNgKAX8CHSeqYE/nlA==
X-Received: by 2002:a05:600c:1d14:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-4536b4be314mr77860915e9.0.1750681189099;
        Mon, 23 Jun 2025 05:19:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm110694655e9.1.2025.06.23.05.19.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 12/26] target/arm: Restrict system register properties to system binary
Date: Mon, 23 Jun 2025 14:18:31 +0200
Message-ID: <20250623121845.7214-13-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2iR33KSODpIi

Do not expose the following system-specific properties on user-mode
binaries:

 - psci-conduit
 - cntfrq (ARM_FEATURE_GENERIC_TIMER)
 - rvbar (ARM_FEATURE_V8)
 - has-mpu (ARM_FEATURE_PMSA)
 - pmsav7-dregion (ARM_FEATURE_PMSA)
 - reset-cbar (ARM_FEATURE_CBAR)
 - reset-hivecs (ARM_FEATURE_M)
 - init-nsvtor (ARM_FEATURE_M)
 - init-svtor (ARM_FEATURE_M_SECURITY)
 - idau (ARM_FEATURE_M_SECURITY)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index eb0639de719..e5b70f5de81 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1500,6 +1500,7 @@ static void arm_cpu_initfn(Object *obj)
  * 0 means "unset, use the default value". That default might vary depending
  * on the CPU type, and is set in the realize fn.
  */
+#ifndef CONFIG_USER_ONLY
 static const Property arm_cpu_gt_cntfrq_property =
             DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq_hz, 0);
 
@@ -1509,7 +1510,6 @@ static const Property arm_cpu_reset_cbar_property =
 static const Property arm_cpu_reset_hivecs_property =
             DEFINE_PROP_BOOL("reset-hivecs", ARMCPU, reset_hivecs, false);
 
-#ifndef CONFIG_USER_ONLY
 static const Property arm_cpu_has_el2_property =
             DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
 
@@ -1532,6 +1532,7 @@ static const Property arm_cpu_has_neon_property =
 static const Property arm_cpu_has_dsp_property =
             DEFINE_PROP_BOOL("dsp", ARMCPU, has_dsp, true);
 
+#ifndef CONFIG_USER_ONLY
 static const Property arm_cpu_has_mpu_property =
             DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
 
@@ -1544,6 +1545,7 @@ static const Property arm_cpu_pmsav7_dregion_property =
             DEFINE_PROP_UNSIGNED_NODEFAULT("pmsav7-dregion", ARMCPU,
                                            pmsav7_dregion,
                                            qdev_prop_uint32, uint32_t);
+#endif
 
 static bool arm_get_pmu(Object *obj, Error **errp)
 {
@@ -1731,6 +1733,7 @@ static void arm_cpu_post_init(Object *obj)
                                         "Set on/off to enable/disable aarch64 "
                                         "execution state ");
     }
+#ifndef CONFIG_USER_ONLY
     if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
         arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_cbar_property);
@@ -1746,7 +1749,6 @@ static void arm_cpu_post_init(Object *obj)
                                        OBJ_PROP_FLAG_READWRITE);
     }
 
-#ifndef CONFIG_USER_ONLY
     if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
         /* Add the has_el3 state CPU property only if EL3 is allowed.  This will
          * prevent "has_el3" from existing on CPUs which cannot support EL3.
@@ -1818,6 +1820,7 @@ static void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_dsp_property);
     }
 
+#ifndef CONFIG_USER_ONLY
     if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property);
         if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
@@ -1854,8 +1857,6 @@ static void arm_cpu_post_init(Object *obj)
                                    &cpu->psci_conduit,
                                    OBJ_PROP_FLAG_READWRITE);
 
-    qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property);
-
     if (arm_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER)) {
         qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
     }
@@ -1864,7 +1865,6 @@ static void arm_cpu_post_init(Object *obj)
         kvm_arm_add_vcpu_properties(cpu);
     }
 
-#ifndef CONFIG_USER_ONLY
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) &&
         cpu_isar_feature(aa64_mte, cpu)) {
         object_property_add_link(obj, "tag-memory",
@@ -1882,6 +1882,7 @@ static void arm_cpu_post_init(Object *obj)
         }
     }
 #endif
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property);
 }
 
 static void arm_cpu_finalizefn(Object *obj)
-- 
2.49.0
