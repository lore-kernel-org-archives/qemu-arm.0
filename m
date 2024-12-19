Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1853447njk;
        Thu, 19 Dec 2024 10:32:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUaphhQdYWnat2ernX0O8z4BCAy5YFwk13v6zlZngvPB2zZzplAnQcaR2+IkeOSLmNXdLLEOZUCOtr8Iw==@linaro.org
X-Received: by 2002:a05:6a20:72a8:b0:1e1:b220:63db with SMTP id adf61e73a8af0-1e5c716f42emr6723123637.16.1734633136427;
        Thu, 19 Dec 2024 10:32:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734633136; cv=none;
        d=google.com; s=arc-20240605;
        b=lVEwkDuv6HizPSfWDqidnuOAxTqE/6o1SB51KBm2/GYXPOWjQxtUK5NUl+oV47nX+M
         Gk5VwFOmIlMHrUDBMuh5VO1C32VvdxOuWX7SBZyTfyV2qceoxAoGeaBKuB+OEMGm55x1
         Nx5g/hLj/pvcTGc+CGi+BdRsYrMamrkHLrhr+x9VzE/asSM3D+gGRcpHK7lPtHRhwlk2
         CTMSE9e1RKUxkrrDifGcLtaJJhWOagEp4E7EfOhkwYbV98y/n2y8OEKcKvEpDTZJUIwT
         Yy+29KxXuhfnVMghMbE92A3PGhTPyNQqzlJ/AxAMA6BVYbSIuHnOTHPK5Hva9oTdg3x3
         ZixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z34VbarymgQiW5Qnm/WH4E3Ova5VTGM3lSMYMRGrvZ8=;
        fh=gsEcz/VtoQXGdBcQAF8mVpbnLJUu/00C4EuYgRUdSWg=;
        b=FaxcMkL75IthgNQFKVzbkTV0c45+C5XR0sjHnuhDdDvT3ZKcUAgZWBvE0DXOmyQ/70
         TA297mr+2lW1weWyxddgP1fp+X94tFSzNEoir/qSrGWsnlw6/mYQAt3DX86jEenLUmZZ
         vkTBK0gC0gqKr4gtcHOPciX2rXxsIYeE6cCgpKd5MNomMTaFKMs9onEhH3XxFzjF9SOB
         0gGiSpqSDVsLvZCvMhsDaE9A5if9mAQPqzctb71cRUr0Pq4XbCAaocmI82VHAQ94GEjj
         XxPeRwqRfUi/RTHS6qYC9fL0TeXB5t+yUvrUvZmjQyEe26BCfKq3QptFfOWNAY65tTfb
         5L2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KK5+gNw6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72aad8ed48dsor1016207b3a.3.2024.12.19.10.32.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Dec 2024 10:32:16 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KK5+gNw6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734633136; x=1735237936; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z34VbarymgQiW5Qnm/WH4E3Ova5VTGM3lSMYMRGrvZ8=;
        b=KK5+gNw6sP/sd7+iMy76x48EcXPw7t3rMwAGn4m02MEN7RJCaGN9vBfiGUGk3RUqav
         Sbg3DSR0EjyCoJeAe5j1uGohdvQpAsGs6gos6vs9F7QGwXqmbz4H79dftTT1zSJldEZr
         fSfsfjAtSksxn0Tl/IKOMjt1j1zv3QvsE6OpNLtZRLnSLQtaoNuXasVsdeGnY/UW65Fn
         /QbtGn12XqZX6rZfR8/yqIHtf/CrU//QyCLDwZivE9INbk7gh8ejOVz5XEyX5mVrlERv
         gC8x6rbJ+V2w9ab5MDGngxlsxNJ4k92Gj6pBtHfKgzGvknlFxXTR4CcDBVbYfjGYtjHF
         32cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734633136; x=1735237936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z34VbarymgQiW5Qnm/WH4E3Ova5VTGM3lSMYMRGrvZ8=;
        b=mj5uqtWTiuAaNnwXL78tpVFkPhpDoZFFsoB7TnpEUBGGlKUfqMVTTnILscGjJO8bv0
         itGhwOhMR7scPju9RgTje/YpjFZsNuG35ivOqh8VvJoDuDzI46e8ehvTjwk/myJZbz6Z
         VpVZWVXF8qksBdDsmq/rGZkaIvop4JiyMoQluEypkhVAWXhJvDn6ZYicADvOVKNCV1xY
         cTpse2GMXJcaihy83BTntcxptJml/jX2RoNdPDZgdjYEPwzjaLfwZUO9XE9eI42OCHf6
         hiGA5JpZpW8v3rR57dPynrOngvInwJJxSe2sSjQNsx2Y0aV8IBsHjvdAz2YFNL1UxAK5
         rDbA==
X-Forwarded-Encrypted: i=1; AJvYcCUnqOlfF4TTlK1nOUir2AcKACwc+t1sLWROvldl1cmbpPFLnP7o97dCRQhpeVE9HKX+/Ent63RT3yPkrA==@linaro.org
X-Gm-Message-State: AOJu0YyFHUoZ7y7Zpt8rjdlPblQ4gRBgC08HC5qfX+lpGQV3zvwPQMkr
	ke/QZjPGxkZG14AUmyeNLGtdK9MFuiwW/QerxwCwT3YSqlQ4cM76KWF+sqjPoT4kEw==
X-Gm-Gg: ASbGncujhPW33PKuUx/3MVru3FDQQaOXlQhkcCHGN1+gpSKjbYooQNxPCkOivzaRWbn
	U5yeab0RPhJSLoIMP5+IGq+RSX1gNWyl4C9nYUwQGQpIT+1IX9VAwntdg362Ji2eU0ahFFbIkSR
	OVLT0ETyb3x4sHgGi9mh06LiXZtziwvC6g5Nl3ixQ7vrNpMFKDbQTx9wgWeBdgeCl/KMpjP5vSh
	EMBfjJxFwSLi4Ly/RIUaTcagvJh8yIg+jJKFf0WFTHLCEai+eyopHNv
X-Google-Smtp-Source: AGHT+IFoe8gDxr+alMHHQuTDU0AyJbhcDnWAM9pmiTIngaibjftJJMk+DYrmHuUZSjN3+tq20v0Xzg==
X-Received: by 2002:a05:6a00:6c88:b0:728:15fd:dabb with SMTP id d2e1a72fcca58-72aa9a43affmr6562513b3a.8.1734633135964;
        Thu, 19 Dec 2024 10:32:15 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90b302sm1624733b3a.175.2024.12.19.10.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 10:32:15 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	alex.bennee@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 2/3] target/arm: change default pauth algorithm to impdef
Date: Thu, 19 Dec 2024 10:32:10 -0800
Message-Id: <20241219183211.3493974-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: f54+BXq8F1bD

Pointer authentication on aarch64 is pretty expensive (up to 50% of
execution time) when running a virtual machine with tcg and -cpu max
(which enables pauth=on).

The advice is always: use pauth-impdef=on.
Our documentation even mentions it "by default" in
docs/system/introduction.rst.

Thus, we change the default to use impdef by default. This does not
affect kvm or hvf acceleration, since pauth algorithm used is the one
from host cpu.

This change is retro compatible, in terms of cli, with previous
versions, as the semantic of using -cpu max,pauth-impdef=on, and -cpu
max,pauth-qarma3=on is preserved.
The new option introduced in previous patch and matching old default is
-cpu max,pauth-qarma5=on.
It is retro compatible with migration as well, by defining a backcompat
property, that will use qarma5 by default for virt machine <= 9.2.
Tested by saving and restoring a vm from qemu 9.2.0 into qemu-master
(10.0) for cpus neoverse-n2 and max.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/cpu-features.rst |  2 +-
 docs/system/introduction.rst     |  2 +-
 target/arm/cpu.h                 |  3 +++
 hw/core/machine.c                |  4 +++-
 target/arm/cpu.c                 |  2 ++
 target/arm/cpu64.c               | 22 ++++++++++++++++------
 6 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index d69ebc2b852..37d5dfd15b3 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -223,7 +223,7 @@ Below is the list of TCG VCPU features and their descriptions.
   When ``pauth`` is enabled, select the architected QARMA5 algorithm.
 
 Without ``pauth-impdef``, ``pauth-qarma3`` or ``pauth-qarma5`` enabled,
-the architected QARMA5 algorithm is used.  The architected QARMA5
+the QEMU impdef algorithm is used.  The architected QARMA5
 and QARMA3 algorithms have good cryptographic properties, but can
 be quite slow to emulate.  The impdef algorithm used by QEMU is
 non-cryptographic but significantly faster.
diff --git a/docs/system/introduction.rst b/docs/system/introduction.rst
index 746707eb00e..338d3745c3c 100644
--- a/docs/system/introduction.rst
+++ b/docs/system/introduction.rst
@@ -169,7 +169,7 @@ would default to it anyway.
 
 .. code::
 
- -cpu max,pauth-impdef=on \
+ -cpu max \
  -smp 4 \
  -accel tcg \
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b7500bebd7f..276a7a557ba 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -972,6 +972,9 @@ struct ArchCPU {
     /* QOM property to indicate we should use the back-compat CNTFRQ default */
     bool backcompat_cntfrq;
 
+    /* QOM property to indicate we should use the back-compat QARMA5 default */
+    bool backcompat_pauth_default_use_qarma5;
+
     /* Specify the number of cores in this CPU cluster. Used for the L2CTLR
      * register.
      */
diff --git a/hw/core/machine.c b/hw/core/machine.c
index d970f753e37..de1547994c4 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -36,7 +36,9 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "audio/audio.h"
 
-GlobalProperty hw_compat_9_2[] = {};
+GlobalProperty hw_compat_9_2[] = {
+    {"arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
+};
 const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
 
 GlobalProperty hw_compat_9_1[] = {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1afa07511e3..68f1ab639b8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2652,6 +2652,8 @@ static const Property arm_cpu_properties[] = {
     DEFINE_PROP_INT32("core-count", ARMCPU, core_count, -1),
     /* True to default to the backward-compat old CNTFRQ rather than 1Ghz */
     DEFINE_PROP_BOOL("backcompat-cntfrq", ARMCPU, backcompat_cntfrq, false),
+    DEFINE_PROP_BOOL("backcompat-pauth-default-use-qarma5", ARMCPU,
+                      backcompat_pauth_default_use_qarma5, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9a193d2b489..045b94fcb4d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -529,15 +529,25 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
                 return;
             }
 
-            if (cpu->prop_pauth_impdef) {
-                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, API, features);
-                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPI, 1);
+            bool use_default = !cpu->prop_pauth_qarma5 &&
+                               !cpu->prop_pauth_qarma3 &&
+                               !cpu->prop_pauth_impdef;
+
+            if (cpu->prop_pauth_qarma5 ||
+                (use_default &&
+                 cpu->backcompat_pauth_default_use_qarma5)) {
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, APA, features);
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPA, 1);
             } else if (cpu->prop_pauth_qarma3) {
                 isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, APA3, features);
                 isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, GPA3, 1);
-            } else { /* default is pauth-qarma5 */
-                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, APA, features);
-                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPA, 1);
+            } else if (cpu->prop_pauth_impdef ||
+                       (use_default &&
+                        !cpu->backcompat_pauth_default_use_qarma5)) {
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, API, features);
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPI, 1);
+            } else {
+                g_assert_not_reached();
             }
         } else if (cpu->prop_pauth_impdef ||
                    cpu->prop_pauth_qarma3 ||
-- 
2.39.5
