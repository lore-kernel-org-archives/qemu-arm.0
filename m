Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569305njc;
        Mon, 25 Nov 2024 11:59:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVQJMnYpF3oyKmwmaLFfvx7HuOBWvog19Y8upKvV1pse+WiQO+i7i0d8ugT3PGF6pK0wUxIjMvgJ0sBJg==@linaro.org
X-Received: by 2002:a7b:cd05:0:b0:434:9936:c823 with SMTP id 5b1f17b1804b1-4349936c8b9mr72694415e9.18.1732564770852;
        Mon, 25 Nov 2024 11:59:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564770; cv=none;
        d=google.com; s=arc-20240605;
        b=Vwcxl580dc9536prxIa/achl492QkuVt7y75I448NepHPf9Ydkc+VogtIsC1wtTzP2
         rnQeNfezhb6twLFl8/OjwI3r/ic6BaqAv+iTCvGw3yJ7zV9+y04rZfbKiiEsHZlCjQCv
         OiLbEtWYsgMLf00V6o5jSeIWCCCJTAPt/JGYPBNwd+BXj4rIWtTO18uiLL17b1+i1hEW
         Haeg8gOe0JDKuy7yNgmgeHsyuPzpZz+ApRdKlXRBRfylEUD+gARxOwgBks6QvxNPIkan
         vsNacYupDT24wqZz0Dd+50cSnmoTWhO3xbqwhLGKfsp+GxDHud+p70Qv6nQMVFeVTVWq
         +N1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Oo1EgfoyArPx0QyjZUVlmbBpOKVgCXNN/Sfqm4FiXXo=;
        fh=5qqLR9Lj3Gi9uzv9HYI7s3ZJOaUeMR0m1P6OyliTsu0=;
        b=Z9Cj5fSzVoA/eXq8e8pTaT5D2TTcHj1mynUWqTZBvkzjrQMTf0wYttANo/Gz+8xczc
         Yyqdw2N8TyF5XK0IVGy/u9a17IGOfXg0/hJPFYdg6N00zNu9KN2BRAG/cXvJLwFwyH2k
         gwEKIHsh7pCJ9dKQEC+NuE+MH0rY4UTJ2vQmEVqpTXLbeukjsjb60lrGNJBxQJ0yoPtJ
         wsnv7wg1KhqtT4vGwKpcJDu7m+jxVIgSSodh6yRs3y7AbO86SRjT/s9ewZwXrshONktI
         DlyI+/Ym8DEIayN8nuou8HL8Tsi2riDFwD/4o53HzuOlhWUsjyoUYIgHfQNMQstw+rkh
         UTig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vaQxA4TG;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434a04f2808sor10239675e9.5.2024.11.25.11.59.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:30 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vaQxA4TG;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564770; x=1733169570; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oo1EgfoyArPx0QyjZUVlmbBpOKVgCXNN/Sfqm4FiXXo=;
        b=vaQxA4TGth6SEJJntzlA9+eD0gYo08aEWwKRCxs6HWkCzkGp0igJHcEG7TO7mkSV6T
         Zu8pbuxS49M3F5Nzj7hTm3LEJmGdzCn3cWAzY+Cl47+WPV6irTrZ+vUp4+k+VoLsyhdA
         CtGeKioU9fuNb92YX0HrmLJYxH9LtVbQy+L1KQjmyB38QLEAsxf9KooYxnfIFe9rG3pl
         rfYAjVjP0MlGnMNKXlQxG3uKprygsBJ76uW/4HvhEQ1Yi3wSPfO0N6d798183F2iM2Xr
         lVGCGYfE4KIj27i1rGDS1/sRyqqlAmGhTKl+YQxE7AVBdZ2OS4gzKGK1fPtPf+6UFyUQ
         HnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564770; x=1733169570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oo1EgfoyArPx0QyjZUVlmbBpOKVgCXNN/Sfqm4FiXXo=;
        b=aJgmftGtFZcotpEcPVhm7hWspb0KQTpJqsFDWBpxYGpSU1fhGbpgKhOOxhizZ38gnM
         tl1jjy9RR7Ui5BGwWCLUvmo/KL4WVFWJm2iQahX7kSuy2dIM5Vtwt1eXEz+hNaZ5PIND
         h/coLTIatYqbOApU+I1135cRgbmdpI9RYIPk3BeEipjN6+St6xEgIZ1glsHVul/DzAY5
         Zh1t5fnF174U5PNOKAB3uOsB3OQS8lGvnZTKSKMugeZUGVXut337VtFxtfUU8J1ziUcf
         ZgnHbJsAlMq17hxJq2XcaZUASIvloAFS2tOih+hfQGP3qDtREyB6e77vzUm7lKJvJDoG
         RY7w==
X-Forwarded-Encrypted: i=1; AJvYcCVdKMOveDV0sVkbtDHBgL65I0tlEyFf3HRxwoFA0QvPbGwRU2Gr5QeWq+wLC3zDc0TVCYtqVyAfcYURsw==@linaro.org
X-Gm-Message-State: AOJu0YzAS6ZvDmVDXPO0D9SuLTk8VlvGRNs6atyuAw8ipooaRcqHR735
	cuz+rXng6Vni3MH5y7KBC25YigoNg4lSRTgzLmxdOYTU+LXn7zpXxf5wEf9III/tEQ==
X-Gm-Gg: ASbGncsOI0HMpO0w6u3s29TzQC0HJcggruImZFGmJtwJHoTMPuEEw2KBQBh2AVzcg1A
	lcjKfovjLyLhWJmj1OiihglL+wkDeAi5JrVikotDHXZVfQERvbJQnYjq099uGwBZ5c2E0KE47as
	sBrQe6a+XuhPZs+hUY49CReUpzG2xvnSw/GXs71HK3L3NitnpuDfuuj0WnknXGr8TuQ1aTg92mp
	hQFDlJjbWlbdkuzul6AQOAJiq871Z2KwsjxlPXnonxU4LiYUDlODaHnjy0KwMHFeOC3
X-Google-Smtp-Source: AGHT+IGEuG55nfDajrGEaz7M/kGNc1ktpiuJCiuV/narivEo/mrkiiTEuTAGFHtr+tUvMIFwJ0tt4A==
X-Received: by 2002:a05:600c:1f85:b0:431:5ce4:bcf0 with SMTP id 5b1f17b1804b1-433ce428100mr134775805e9.15.1732564769711;
        Mon, 25 Nov 2024 11:59:29 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:29 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 09/26] target/arm/kvm-rme: Initialize Realm memory
Date: Mon, 25 Nov 2024 19:56:08 +0000
Message-ID: <20241125195626.856992-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KSfJUj3o/qlk

Initialize the IPA state of RAM. Collect the images copied into guest
RAM into a sorted list, and issue POPULATE_REALM KVM ioctls once we've
created the Realm Descriptor. The images are part of the Realm Initial
Measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3: RIPAS is now initialized separately
---
 target/arm/kvm_arm.h |  14 +++++
 target/arm/kvm-rme.c | 128 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 8b52a881b0..67db09a424 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -255,6 +255,16 @@ int kvm_arm_rme_vm_type(MachineState *ms);
  */
 int kvm_arm_rme_vcpu_init(CPUState *cs);
 
+/*
+ * kvm_arm_rme_init_guest_ram
+ * @base: base address of RAM
+ * @size: size of RAM
+ *
+ * If the user requested a Realm, set the base and size of guest RAM, in order
+ * to initialize the Realm IPA space.
+ */
+void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size);
+
 #else
 
 /*
@@ -281,6 +291,10 @@ static inline bool kvm_arm_mte_supported(void)
     return false;
 }
 
+static inline void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
+{
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index e3cc37538a..83a29421df 100644
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
@@ -20,16 +21,85 @@
 #define TYPE_RME_GUEST "rme-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
+#define RME_PAGE_SIZE qemu_real_host_page_size()
+
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
+    Notifier rom_load_notifier;
+    GSList *ram_regions;
+
+    hwaddr ram_base;
+    size_t ram_size;
 };
 
 OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
                                           CONFIDENTIAL_GUEST_SUPPORT,
                                           { TYPE_USER_CREATABLE }, { })
 
+typedef struct {
+    hwaddr base;
+    hwaddr size;
+} RmeRamRegion;
+
 static RmeGuest *rme_guest;
 
+static int rme_init_ram(hwaddr base, size_t size, Error **errp)
+{
+    int ret;
+    uint64_t start = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
+    uint64_t end = QEMU_ALIGN_UP(base + size, RME_PAGE_SIZE);
+    struct kvm_cap_arm_rme_init_ipa_args init_args = {
+        .init_ipa_base = start,
+        .init_ipa_size = end - start,
+    };
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_INIT_IPA_REALM,
+                            (intptr_t)&init_args);
+    if (ret) {
+        error_setg_errno(errp, -ret,
+                         "failed to init RAM [0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
+                         start, end);
+    }
+
+    return ret;
+}
+
+static int rme_populate_range(hwaddr base, size_t size, bool measure,
+                              Error **errp)
+{
+    int ret;
+    uint64_t start = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
+    uint64_t end = QEMU_ALIGN_UP(base + size, RME_PAGE_SIZE);
+    struct kvm_cap_arm_rme_populate_realm_args populate_args = {
+        .populate_ipa_base = start,
+        .populate_ipa_size = end - start,
+        .flags = measure ? KVM_ARM_RME_POPULATE_FLAGS_MEASURE : 0,
+    };
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_POPULATE_REALM,
+                            (intptr_t)&populate_args);
+    if (ret) {
+        error_setg_errno(errp, -ret,
+                   "failed to populate realm [0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
+                   start, end);
+    }
+    return ret;
+}
+
+static void rme_populate_ram_region(gpointer data, gpointer err)
+{
+    Error **errp = err;
+    const RmeRamRegion *region = data;
+
+    if (*errp) {
+        return;
+    }
+
+    rme_populate_range(region->base, region->size, /* measure */ true, errp);
+}
+
 static int rme_init_cpus(Error **errp)
 {
     int ret;
@@ -60,6 +130,16 @@ static int rme_create_realm(Error **errp)
         return -1;
     }
 
+    if (rme_init_ram(rme_guest->ram_base, rme_guest->ram_size, errp)) {
+        return -1;
+    }
+
+    g_slist_foreach(rme_guest->ram_regions, rme_populate_ram_region, errp);
+    g_slist_free_full(g_steal_pointer(&rme_guest->ram_regions), g_free);
+    if (*errp) {
+        return -1;
+    }
+
     if (rme_init_cpus(errp)) {
         return -1;
     }
@@ -105,6 +185,43 @@ static void rme_guest_finalize(Object *obj)
 {
 }
 
+static gint rme_compare_ram_regions(gconstpointer a, gconstpointer b)
+{
+        const RmeRamRegion *ra = a;
+        const RmeRamRegion *rb = b;
+
+        g_assert(ra->base != rb->base);
+        return ra->base < rb->base ? -1 : 1;
+}
+
+static void rme_rom_load_notify(Notifier *notifier, void *data)
+{
+    RmeRamRegion *region;
+    RomLoaderNotify *rom = data;
+
+    if (rom->addr == -1) {
+        /*
+         * These blobs (ACPI tables) are not loaded into guest RAM at reset.
+         * Instead the firmware will load them via fw_cfg and measure them
+         * itself.
+         */
+        return;
+    }
+
+    region = g_new0(RmeRamRegion, 1);
+    region->base = rom->addr;
+    region->size = rom->len;
+
+    /*
+     * The Realm Initial Measurement (RIM) depends on the order in which we
+     * initialize and populate the RAM regions. To help a verifier
+     * independently calculate the RIM, sort regions by GPA.
+     */
+    rme_guest->ram_regions = g_slist_insert_sorted(rme_guest->ram_regions,
+                                                   region,
+                                                   rme_compare_ram_regions);
+}
+
 int kvm_arm_rme_init(MachineState *ms)
 {
     static Error *rme_mig_blocker;
@@ -132,11 +249,22 @@ int kvm_arm_rme_init(MachineState *ms)
      */
     qemu_add_vm_change_state_handler(rme_vm_state_change, NULL);
 
+    rme_guest->rom_load_notifier.notify = rme_rom_load_notify;
+    rom_add_load_notifier(&rme_guest->rom_load_notifier);
+
     cgs->require_guest_memfd = true;
     cgs->ready = true;
     return 0;
 }
 
+void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
+{
+    if (rme_guest) {
+        rme_guest->ram_base = base;
+        rme_guest->ram_size = size;
+    }
+}
+
 int kvm_arm_rme_vcpu_init(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.47.0
