Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209985lfo;
        Tue, 1 Mar 2022 14:00:30 -0800 (PST)
X-Received: by 2002:a63:6908:0:b0:372:d919:82ed with SMTP id e8-20020a636908000000b00372d91982edmr23730508pgc.104.1646172029872;
        Tue, 01 Mar 2022 14:00:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172029; cv=none;
        d=google.com; s=arc-20160816;
        b=fR/2rRSVNGm7O98j+lMAoV21NTB64Ml0DgKASwl4bK0EQBkcuINPSWLVXHXMoLDV0b
         yWcfRikFHonY9GXDNVwM6rEkAyRuBh5BuFk6p7ggSz3HeNtI1Sc1+QvJfQVt79N70bIu
         vc7IlkJ5lWzRyZSt+rScgJVd67zcj9mC7EHIEPrMBWa7DdONmbpqsMaKt214GFy5Jmrl
         MveAjTdo3VgU0W4FhhM4d+rPaBm3lb0Kj9uAKkX0i/GvOFlV78J5Dfx07/ASkZavLyCz
         nWEDKhc1Kd+NruIN1Zz+mfPziAq+41CTCpuakMwkKax9d+AkUOxV9/trr13VM1gL5QB/
         xOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9XzP0Qdi4Dwon2uYf1rT0B5JmvyAHM7fMnwSPwWhfEg=;
        b=LkSlK7yS9aS2Vh+3NEqY3p5EH8InmNDIasz+hKhaMLI7bkGNGzKHdpNylf2voTyD0W
         DRPQskQk97aGiyUsC+8J+pQ6sOmOszRJ0RYDcn7ekyxciOY3lU1bqNkGZ69r46haUSpu
         KCJV3D8XlTyo850CfKOvrBY+MpGN7Sx9naZ1D/iyvW+Q5xh8sRkUoJgfJ2ocrAwNgyev
         ENrw9wJ7/WTjcdiKz//cxByOCb1BT3D1+AGK/Ij4BlwRwyt/w0FZN+GkGOtRwvN9AzWd
         ZHguTthhghB8o95iWjou+rBRAkv67+NksnAp+LXvJTOWetoCVRrKHke4WSzBT6i3GH6X
         hIEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TVgPdqVn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t3-20020a170902bc4300b00151838e0eafsor1358511plz.55.2022.03.01.14.00.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:29 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TVgPdqVn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9XzP0Qdi4Dwon2uYf1rT0B5JmvyAHM7fMnwSPwWhfEg=;
        b=TVgPdqVnswIrr+3Oh4dzWDjU73hk9Cntt8I038CtNvhinGqnrIGJJnAkPM6hyCYJ0J
         CKnsH9cB3yaZSGdavfqbnegpaHteBtDECRuNpVvHydCResx76O2GJU04s4dGuMOmDUoA
         7roIXEHkhHc397/azXchYoQ84X6TZ2sNFiFEXbyzUyMj7OgWz4KoTkOln5aUiWDbTfmO
         VJ8ovXxD2cP4W7PXaKh7pjJzzjuCcZMXTL4YaK9fVArYrNdl+MP9HjIOSKBJntgxKUZ2
         /zleOYoF8Zal6hq0oYwHp4AtWpzoxmU/EFFzy2qWbZtlx9ce+ACUfTYKF1t9vA4B4IOl
         Apng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9XzP0Qdi4Dwon2uYf1rT0B5JmvyAHM7fMnwSPwWhfEg=;
        b=YZaioIml79AZhMmNDDK8Nw8BcmFlXP+6atiT4mBuYTP52dlxvvLm9EJQnWPJKaQ4oa
         XpolT1UK1lnyd1BbuQV/LFVrVJ0nsT9mDLuvtWMF0H1pyijXkLZgEh0XlKW84lWrDSlc
         m+qkNITZFEmoUPqbHOkA242p1BIfcFfWwg86pD/XgBqhnDn2BqqFaAnEIJ0V3pzFgYPe
         /TpQnP5T+DM94Gbp0X0MoVo0a6P6D7vPsvuwLDPNMtxR25rqvyf7LfLF93q5bS2hXJBp
         PwfO3sdvev0KK9CZuli3bSCEgh96aVMSYfC+Cx1LAjBgrvuFo88pYe3+R1dtq2djhaKL
         v9AA==
X-Gm-Message-State: AOAM532hz/eVUd9NEbxwsrVGAZYERapzmfM2dm3K5+2dj5FX1vmK+fo4
	NEpKFidDXyvtd8jGTYFAWWM/NYnL
X-Google-Smtp-Source: ABdhPJxyjagQLMI/MNqdlmS+2O5CP6/OBHBHGEEabdpE8VcyABDicVIiRgOsGWdGDB/8ZdHNndVdNg==
X-Received: by 2002:a17:90a:a892:b0:1be:f420:bd1e with SMTP id h18-20020a17090aa89200b001bef420bd1emr894449pjq.58.1646172029383;
        Tue, 01 Mar 2022 14:00:29 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 17/18] target/arm: Provide cpu property for controling FEAT_LPA2
Date: Tue,  1 Mar 2022 11:59:57 -1000
Message-Id: <20220301215958.157011-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qh3mlqd8V0Dw

There is a Linux kernel bug present until v5.12 that prevents
booting with FEAT_LPA2 enabled.  As a workaround for TCG, allow
the feature to be disabled from -cpu max.

Since this kernel bug is present in the Fedora 31 image that
we test in avocado, disable lpa2 on the command-line.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h            |  5 ++++-
 target/arm/cpu.c            |  6 ++++++
 target/arm/cpu64.c          | 24 ++++++++++++++++++++++++
 tests/avocado/boot_linux.py |  2 ++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 24d9fff170..4aa70ceca1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -204,10 +204,12 @@ typedef struct {
 # define ARM_MAX_VQ    16
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
 static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
 static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
+static inline void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
@@ -975,10 +977,11 @@ struct ARMCPU {
 
     /*
      * Intermediate values used during property parsing.
-     * Once finalized, the values should be read from ID_AA64ISAR1.
+     * Once finalized, the values should be read from ID_AA64*.
      */
     bool prop_pauth;
     bool prop_pauth_impdef;
+    bool prop_lpa2;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e251f0df4b..e2747e7d86 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1391,6 +1391,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             error_propagate(errp, local_err);
             return;
         }
+
+        arm_cpu_lpa2_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 
     if (kvm_enabled()) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2fdc16bf18..eb44c05822 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -688,6 +688,29 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
+static Property arm_cpu_lpa2_property =
+    DEFINE_PROP_BOOL("lpa2", ARMCPU, prop_lpa2, true);
+
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
+{
+    uint64_t t;
+
+    /*
+     * We only install the property for tcg -cpu max; this is the
+     * only situation in which the cpu field can be true.
+     */
+    if (!cpu->prop_lpa2) {
+        return;
+    }
+
+    t = cpu->isar.id_aa64mmfr0;
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 2);   /* 16k pages w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4, 1);    /*  4k pages w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 3); /* 16k stage2 w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 3);  /*  4k stage2 w/ LPA2 */
+    cpu->isar.id_aa64mmfr0 = t;
+}
+
 static void aarch64_host_initfn(Object *obj)
 {
 #if defined(CONFIG_KVM)
@@ -897,6 +920,7 @@ static void aarch64_max_initfn(Object *obj)
     aarch64_add_sve_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
 }
 
 static void aarch64_a64fx_initfn(Object *obj)
diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index ab19146d1e..ee584d2fdf 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -79,6 +79,7 @@ def test_virt_tcg_gicv2(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "max,lpa2=off")
         self.vm.add_args("-machine", "virt,gic-version=2")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
@@ -91,6 +92,7 @@ def test_virt_tcg_gicv3(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "max,lpa2=off")
         self.vm.add_args("-machine", "virt,gic-version=3")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
-- 
2.25.1
