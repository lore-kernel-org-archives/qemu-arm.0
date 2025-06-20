Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878087njc;
        Fri, 20 Jun 2025 06:08:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/4fR9ZE7nmimoyN+zJ7uJoTo7JWSjHFrBlz3NCdaxfUHz5ETTgorbVSKmlpXzz7nkLXsu/eiTBz8XsA==@linaro.org
X-Received: by 2002:a05:600c:c08e:b0:442:e0e0:250 with SMTP id 5b1f17b1804b1-453659ec202mr21903425e9.29.1750424900693;
        Fri, 20 Jun 2025 06:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424900; cv=none;
        d=google.com; s=arc-20240605;
        b=gn8uGP5jt0b0K/UouldFiPdhmrz0dbQ+BtAd11ZHXmqjYOU0vWnH8PbcQ6MYVKoh7E
         c+b1SSzrsPl80fJLxCYQ3KKdDpaQc3JoEMlfABbQJHmeZegVc7NCCl5IqZNhZ3qYWJTz
         muxswsADuNZK04cdCmNRZOjTJsZhxNoGH47Ez7Ngr1tEb4aFOet0CX4JSi8gIf7IvzKG
         1Qjf1IxT5+AT4ER0m9ox1cyCfGG+NJmPJCbSebap955+8Be1qP63zMPA9f560DqBMj96
         EpGhzGnmt7dL0KgvYXXIJ5qVTzJQ3FXmj+dpTnUKHdCNYZEGdNG6ZkZlBGaSsBZpv8Ww
         I9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oAt1PQLrHnO21M2Y87z2Ba1KRbOWR+1s+ZX+rYgrLRA=;
        fh=s8AkELeSJIVGXuBmUCT8Xx0pkTzndzlFKLup5cjxi1Q=;
        b=MOpXZkLKwVF8n40x7waudhoeGJ9KhPE+5225+sOLAb4SfxBNczHSe42u/CTGeiBr+A
         EYLOAEEW2iQmaO8i9SB44FiNOb4ywUKhfoDPI34PpaAAP+3EzjNC0IMNasWLXHgd8Djz
         2Hnhz8kRMimZI4LaXRjFq8X1ccyZ1KXij3FM3HZ95VMKjLl2/wBqIpomgelrricrr/1b
         Jo6KOFZHV7le2W4vvGpnL21DL2aiu5zgo4c3kKUwiRgIUcsA+xojOGM66UjNZTY9L0ir
         T8sqL69iJ1nWT7AUzMAyXZ6MKNAWFnHDt1B3Hz9Z4+NCgw4Mdk1vCCdRiHQG35Ade9B0
         1OFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qm1Btzh+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45364718e9csor8340515e9.11.2025.06.20.06.08.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qm1Btzh+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424900; x=1751029700; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAt1PQLrHnO21M2Y87z2Ba1KRbOWR+1s+ZX+rYgrLRA=;
        b=qm1Btzh+7mPVJ57W5RVmbYtV7soQSern86h1NLI1uauqG9JDRVGNp7Gk+yhqScmNcV
         T0G7fBnogv6CZHqAbP52wDHJIuKKPt8hE6MgFKKk3GwsujUIU/6qmCrNQdUrsyaVO867
         iXmRvJ3G7nQ79V2GBY9xK0V3LGzyKU338DLof7ycAd5GIWr9o2z38m4343S+/s1xdBfw
         T8nzW47UOjd8O/51EJJSZcsnkE8uLk7XQL2nHqCmGGYj/wUASTnlYEx0/BRH5QFndsJc
         9OldQ1uBLYGxF0E93sIzjmgg86xjHyyibbKqKbC6iCN4QLpiSThcngBoexK+7ZbIdmDW
         QTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424900; x=1751029700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAt1PQLrHnO21M2Y87z2Ba1KRbOWR+1s+ZX+rYgrLRA=;
        b=RHKvEm0A2BKg44EjjU1Lm7RWm7svmsO2wNZ8ROTTn9dIJAkq7EsP71qiJiOylOEPWK
         vgMErFiXtE6UjgcBZUS9OVB8eFERUbiKHw2X7EW4uki6CaZWoUiA+nDBcL/n+qrmGFLc
         uH5PC1TLgSK/KxAkooe2cTVqPdaY2VeMWHwM8KKIYjEYEVK69N08WUpihcrO0Ea7dQE2
         urhcgOWJtruNS6F8uYk5UD4ke40UOt0EQIDmwb1T3WIolMB5CW9SVYPej/MW/ECR7HAE
         rKHnhdtlZ/TpdjWEWhR2gc2ka2Mxx6epEbqc43KwiBEDETsAcelxZIBF/0VqSjYHhFEq
         XQjA==
X-Forwarded-Encrypted: i=1; AJvYcCVDKVL9pEYcAx/VdAOfPpk5aQQ71A2BMDfgqRFWfBN5XQlE1bxn990PTC8nKDecrXIaX7wRjeMt+5TOCQ==@linaro.org
X-Gm-Message-State: AOJu0Yx7UQllIHVAeseQj4ZtqTFj0dQu4wYJfJT5P4IVJZRlztSH9TZb
	OofkHXrMUovKl+yXBvXDVc3FCCYAyO5soDmPIbly8hsAhqP6ED95wWdxVlyfUeO2tuXYsg==
X-Gm-Gg: ASbGncutlHEgcI3tJrzxSSc9kmx+MlHKBcsJS+V9y1jykKXwCgGtdp/bU7cd8suxP2n
	QhYFw190/5gWAKz28OAiVY5JwCwlWwwlr2n1/i4KsUIKl2JI+D4El4MCb1qZVelN+JndpuInlzD
	AP7kg3k7HnZuWac14axX7CoF0BnzdX6MQ15Ag3sWjl6TckFiMueospFv6oiGALxhyLXB1w0SDwh
	2eoEbFyU+V3bI1eMo1wLcbf6kahV3clxPzLlVCsPUORHnsCTXMJ7JDpsWVTGN2sJyBJA/O3nIl4
	AadMZv97i1Arlkaq9Rgs9R+bltxNSoSi1t0wJ3mMsKrliKRDIPuWihkIBjfMrTrKTY9m1VBI8bF
	RnrKzhanUu1QAixQEMRGI1hSHOzcjQkHZsBps
X-Google-Smtp-Source: AGHT+IEGmchw+a0k0hX0S9KobjryclE57uq2sgKFzkmMvuxn/d4B/I66wfS6mkzaJen5FMifqGqbXw==
X-Received: by 2002:a05:600c:37c5:b0:453:5c30:a1d0 with SMTP id 5b1f17b1804b1-453659dcd62mr23896155e9.21.1750424899969;
        Fri, 20 Jun 2025 06:08:19 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm25578125e9.1.2025.06.20.06.08.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:08:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 12/26] target/arm: Restrict system register properties to system binary
Date: Fri, 20 Jun 2025 15:06:55 +0200
Message-ID: <20250620130709.31073-13-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: m5+mL0eHFlLk

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
