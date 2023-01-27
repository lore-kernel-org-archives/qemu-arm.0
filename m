Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232535ejc;
        Fri, 27 Jan 2023 07:16:02 -0800 (PST)
X-Received: by 2002:a7b:c5d6:0:b0:3d9:fb89:4e3d with SMTP id n22-20020a7bc5d6000000b003d9fb894e3dmr41914888wmk.28.1674832562494;
        Fri, 27 Jan 2023 07:16:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832562; cv=none;
        d=google.com; s=arc-20160816;
        b=Px8jzch8c+2E0EC9ljrLsr0+5Ccsd+/Kp6Mc1b57QkA4no50wsXIcXGAeRAXbBliJ2
         hVrtMLpC7NgzjkdVHXmylfCspLcijcoVavE8s2uPmYwSTuke4LVDQiatWRlzt5gr4buy
         6iH0tKijRwcG4zcRpLXlHtU9AWoitsBX18bPH0e1qSAmxOkDymWBoVMjr4RbFXCT6kbu
         GnNdyxlKc3ppmYj5YYzqfvKD41Ud+hEvewMheMucGgGJkCIytb/f3r39QlteIsti8WwZ
         06m6EhVEDcLeQgkfgN+jbcUHfRw+jY1vF8UHa/9Cymwt5ye+KROjfUd8X1LuA5vBWGWA
         UfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iNHpXIOZPTIR743s4/nV/ldq35abX9mbN8ZYO5pEXmY=;
        b=l4cqXrIdNZbTd1ybEp/CktGRz6D5DHQuoLOQSs9YZIKreKyxKcW/C5M4neH87d31La
         nN5dUwlIZGWoxGpuPuFr6GiyGHqXw1hwHInzcIktapP873mKkVZyWCI1kuU6ks5Lx7lC
         TFHvyR8wa8lMy5Wy5rbbTNubMY9H6GLb/a+0HfT4Nge+A1C/8ojO+IoyeXs8H30r4xHx
         obqgia2osjLsOGf4pAPZhEsAaWX/Cc98M5hq+gvdou+K2pH3Id+Zv0eUlnFIIlzN2pdJ
         YaQ0/9JpUDpApr3HKlWPpbAJczZrqMOe7RA/AWG+wROwlmQk7oAbSpq+u9e1scex0tdP
         AwBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qx8daHeX;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c3-20020a7bc843000000b003d3506015afsor2889944wml.1.2023.01.27.07.16.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:16:02 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qx8daHeX;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNHpXIOZPTIR743s4/nV/ldq35abX9mbN8ZYO5pEXmY=;
        b=Qx8daHeXglt4t84zNhaUtZ+Pu5Sx6Ro+Sm3/MapxEJq3Vawt9leb1dPkFEwE2X3lHZ
         ahCjUP3+B4UypURa5IuCE4zkccVUFGDu3zpcEJ7VfMKjf1mvi5WkcjPi0I0LkQPTXq3s
         SXF8/VJVvmyUPEVuXT6ovMT1IYrGdurQO7K7aGh/7eqjdODHg8a1iCaSXnIo0VWLhe17
         jhTL2+yNI06IvLdT3RGhDqsPmcfhNogIinOYHOft7ux2DypHo4GYDUUYdtHDSmSAAYJd
         aru6Y6BUVoJ1m4u/Uy9816Ol2HSYRCP8VA+OsLDtxd7TvrXOKMzFfb0FVCNdrOZ8LquW
         htTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNHpXIOZPTIR743s4/nV/ldq35abX9mbN8ZYO5pEXmY=;
        b=W+BS+mXkH6p5ylTtQmPGjK++xMotnWc/yjaGxu+kxZENvXWsnL6tnh+8EYx5XTc9Fp
         7BO6UnpoyGWPYoepZ3OppKVadC4DTjyLSzh8YVz9ipPME3q796z0XDMb9P5TrWqnfQiv
         LMkM2lUXKG/lKEwosnaHiQJSdnp+73EODB/7xgCGEKfL4OI6F2Gw14b8kRKd4r1htWeS
         HoJiHCm52cVQo/OAV59GtEgJ2SlV2vpufhigdwJ8mqF6nc2v8DS0YD/8RkfDrtWL1lfj
         BZgeVgdXk2YfYP/3yQLyQjNRIpOlTkGpzSiw3+RV9V5FN9HiSI998mgPPx0OJhS5qJSe
         1b2w==
X-Gm-Message-State: AFqh2kp0ZCIimBbApFw6XKlnX5mLMsU+KS63qtYZT3JgXBXN0XJq7VJw
	u35a/67tg82Z/MXT1vrLuAj2+a37
X-Google-Smtp-Source: AMrXdXv25K5niC7lUq9pW0hiOwDCbWTGzTk+UKhoOAOIMuy+Tx2ZIx2kNFqhqa8pDHSzkIpFVStcjw==
X-Received: by 2002:a05:600c:5386:b0:3cf:9844:7b11 with SMTP id hg6-20020a05600c538600b003cf98447b11mr41938022wmb.23.1674832562206;
        Fri, 27 Jan 2023 07:16:02 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:16:01 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	eblake@redhat.com,
	armbru@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 08/16] target/arm/kvm-rme: Populate the realm with boot images
Date: Fri, 27 Jan 2023 15:07:21 +0000
Message-Id: <20230127150727.612594-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qxpjEmQR7skB

Initialize the GPA space and populate it with boot images (kernel,
initrd, firmware, etc). Populating has to be done at VM start time,
because the images are loaded during reset by rom_reset()

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm_arm.h |  6 ++++
 target/arm/kvm-rme.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index e4dc7fbb8d..cec6500603 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -371,6 +371,7 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
 int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp);
 int kvm_arm_rme_vm_type(MachineState *ms);
+void kvm_arm_rme_add_blob(hwaddr start, hwaddr src_size, hwaddr dst_size);
 
 bool kvm_arm_rme_enabled(void);
 int kvm_arm_rme_vcpu_init(CPUState *cs);
@@ -458,6 +459,11 @@ static inline int kvm_arm_rme_vm_type(MachineState *ms)
 {
     return 0;
 }
+
+static inline void kvm_arm_rme_add_blob(hwaddr start, hwaddr src_size,
+                                        hwaddr dst_size)
+{
+}
 #endif
 
 static inline const char *gic_class_name(void)
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 3833b187f9..c8c019f78a 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -9,6 +9,7 @@
 #include "exec/confidential-guest-support.h"
 #include "hw/boards.h"
 #include "hw/core/cpu.h"
+#include "hw/loader.h"
 #include "kvm_arm.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
@@ -19,12 +20,22 @@
 #define TYPE_RME_GUEST "rme-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
+#define RME_PAGE_SIZE qemu_real_host_page_size()
+
 typedef struct RmeGuest RmeGuest;
 
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
 };
 
+struct RmeImage {
+    hwaddr base;
+    hwaddr src_size;
+    hwaddr dst_size;
+};
+
+static GSList *rme_images;
+
 static RmeGuest *cgs_to_rme(ConfidentialGuestSupport *cgs)
 {
     if (!cgs) {
@@ -51,6 +62,38 @@ static int rme_create_rd(RmeGuest *guest, Error **errp)
     return ret;
 }
 
+static void rme_populate_realm(gpointer data, gpointer user_data)
+{
+    int ret;
+    struct RmeImage *image = data;
+    struct kvm_cap_arm_rme_init_ipa_args init_args = {
+        .init_ipa_base = image->base,
+        .init_ipa_size = image->dst_size,
+    };
+    struct kvm_cap_arm_rme_populate_realm_args populate_args = {
+        .populate_ipa_base = image->base,
+        .populate_ipa_size = image->src_size,
+    };
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_INIT_IPA_REALM,
+                            (intptr_t)&init_args);
+    if (ret) {
+        error_setg_errno(&error_fatal, -ret,
+                         "RME: failed to initialize GPA range (0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
+                         image->base, image->dst_size);
+    }
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_POPULATE_REALM,
+                            (intptr_t)&populate_args);
+    if (ret) {
+        error_setg_errno(&error_fatal, -ret,
+                         "RME: failed to populate realm (0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
+                         image->base, image->src_size);
+    }
+}
+
 static void rme_vm_state_change(void *opaque, bool running, RunState state)
 {
     int ret;
@@ -72,6 +115,9 @@ static void rme_vm_state_change(void *opaque, bool running, RunState state)
         }
     }
 
+    g_slist_foreach(rme_images, rme_populate_realm, NULL);
+    g_slist_free_full(g_steal_pointer(&rme_images), g_free);
+
     ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
                             KVM_CAP_ARM_RME_ACTIVATE_REALM);
     if (ret) {
@@ -118,6 +164,39 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
     return 0;
 }
 
+/*
+ * kvm_arm_rme_add_blob - Initialize the Realm IPA range and set up the image.
+ *
+ * @src_size is the number of bytes of the source image, to be populated into
+ *   Realm memory.
+ * @dst_size is the effective image size, which may be larger than @src_size.
+ *   For a kernel @dst_size may include zero-initialized regions such as the BSS
+ *   and initial page directory.
+ */
+void kvm_arm_rme_add_blob(hwaddr base, hwaddr src_size, hwaddr dst_size)
+{
+    struct RmeImage *image;
+
+    if (!kvm_arm_rme_enabled()) {
+        return;
+    }
+
+    base = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
+    src_size = QEMU_ALIGN_UP(src_size, RME_PAGE_SIZE);
+    dst_size = QEMU_ALIGN_UP(dst_size, RME_PAGE_SIZE);
+
+    image = g_malloc0(sizeof(*image));
+    image->base = base;
+    image->src_size = src_size;
+    image->dst_size = dst_size;
+
+    /*
+     * The ROM loader will only load the images during reset, so postpone the
+     * populate call until VM start.
+     */
+    rme_images = g_slist_prepend(rme_images, image);
+}
+
 int kvm_arm_rme_vcpu_init(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.39.0
