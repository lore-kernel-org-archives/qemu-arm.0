Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498017ejd;
        Fri, 19 Apr 2024 08:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlkawf7UTNBIZP6WYwQefKEPJ3bdrHfWjKPpI+gpex7WKLlr8i+MKXBuATKqj1EiQtkcyH4010qFxuW5P+3gRA8GbD2b4A
X-Received: by 2002:a2e:7006:0:b0:2d9:ee75:b020 with SMTP id l6-20020a2e7006000000b002d9ee75b020mr1655418ljc.34.1713542395275;
        Fri, 19 Apr 2024 08:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542395; cv=none;
        d=google.com; s=arc-20160816;
        b=lPLughGxdalzOd22PUMEGLVm+BGR9Q4xrQY2034ihXJL10WHmIcauhzsG7vqOcc5SU
         ggQLQjZDEI92IxeqhdpFs1FrhNgNb5buJTV+eG2969Tb5CAJ/Jp7OCvgALL98RCbzgkZ
         ogF/rgKGd+2FYvJ4GP/9zGbPhy+auB7M5m5/n4eC4wPolmGID7C87kRGxcMmcXGlAHcE
         Hbh9REdcReaOuk4IZ6WRhfKF4jzph4/yUQfK6RlAH2GhwANoZHwHgA5qwHiALfZ0hUXD
         5dMHV6t/Kkx+YE6jkaBqQm0G5Xo+X1V2CNi0fMK/yuBvoayHYHJAsfe7yT5g30t9XNy5
         3Ahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0sA7sQRj9S8478926YbMyMtx1fea3V/JVwzEIyV34Xk=;
        fh=ZG+Dlbj27BicuSKmAeQq41s6kFfsX9AXUaLk22cC7vk=;
        b=A7Fnw0Wr0ctqmRGmEbzE358U9TgYjAC77r/qBBw+ZHClW/5vDGSZyQkcnunTatcTiA
         qavvkBeujwf4i8J9rZ29hA9xD+aydqLfTwsyNZDWSfbJGQxLMftw3qtytVPA5kb+7SpX
         2Fv23pi8iD75u5C413K9Q4aIJtBTnMC0g6ghaLeQgezS6Ts1IsJNoFD3uO8TvOaHLbeS
         Tph0f77opdtk1bsULVsjOG6kAty7Whhpx34XUowQD3vo/e9UIX2FcBCQfj33BClfgsfx
         z53Dl9HS4lwP9GCLsuxh6/GtyBo848z/5D2Hbu6lqd9J2TEAjTpfjS3dV4pqPtdWPy67
         qYRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DyJPfR0o;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v9-20020a2e6109000000b002d459a17e68sor1437174ljb.10.2024.04.19.08.59.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DyJPfR0o;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542395; x=1714147195; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sA7sQRj9S8478926YbMyMtx1fea3V/JVwzEIyV34Xk=;
        b=DyJPfR0ow7NYCtEbtCOMQ20vewCCbASv/UFBcGfNcmdOJqcru7D2k4GbwudLxR69TR
         hF5fwHVCf4wGzCQXmwJY5ry9ZHq9NYhGcxdQj8m1itGU/Ld/+BwN/bx456MTPTy+12ly
         TFKWV5Q9xrJjJtFGXUNhEikORzkCD0cxrVP58KgHFvt0rJ+B5cQcxBViX9f7hdN/Z86v
         7zP5MN6VC9HL7GBe6NsXXpkJUpSlRrJoDTLU97lBDwkkKinXjTdtwolRnZhZnKWEOre7
         MFEZvqwA22s5sTscbqBOuXEQR0b4iswZJOXVNvsgz/rtbrJhIx4uDc1pORrjARhB/pid
         HY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542395; x=1714147195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sA7sQRj9S8478926YbMyMtx1fea3V/JVwzEIyV34Xk=;
        b=AkNogZOGH23Gm74kljrEpE+4mEFwf5n/Sh0Y6TgKNgnHOFGD67exHBmvAx7ie4GYj6
         OsCnEDyhH0WZuF2rvSuGTUSdHDsJfcJHyUU/s8wwFE14tuqmCEdl5FJVmba8sQbU9zFW
         1ysHGG6oGdfK43S1Ymd+4zGSK/WI1I8pdFRG+zkFpslCZFmNklSOm1xFL40ImQyJ97EM
         y6cnWtZjugTE2saZGTLhVm3ogfVuBF3+rH2ziq+bMncK4r7l5IwLsm50YmJT2kIQFygJ
         gmuFARQdKUGsn8tN1r1zE0ajxsYLXI4yszvsXAFkl1H6DIWKgw/hzlKRcIow+UOOkL9U
         y8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCV48NiNgmqK8YjiNvOz9sVHpF6klFD+ITJDgde5StWBetx+TnRTl4hk0UjV/F6EoblWvoxeUdpKWljHEuGAyIbVrBifmvJ5
X-Gm-Message-State: AOJu0Yxoz4brSxwnbYVI5FQ0AT77zMsrTOdvKVkz5+9373qsEuwddW5u
	U5t56WxGHg56GNJQq6py/IkxDjF9twgoQtZCN97fe2G8uffVxisnuih+pY6Zdyxjew==
X-Google-Smtp-Source: AGHT+IFfQi+a8Yue9CKu52ltaOyqCZ506+N2z0+WdOQedFIdKEWuv3ocq7AR6ZTSkFjbZvW+CXb+VA==
X-Received: by 2002:a2e:855a:0:b0:2da:6f19:d359 with SMTP id u26-20020a2e855a000000b002da6f19d359mr1512569ljj.2.1713542394779;
        Fri, 19 Apr 2024 08:59:54 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:54 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 12/22] target/arm/kvm-rme: Populate Realm memory
Date: Fri, 19 Apr 2024 16:57:00 +0100
Message-ID: <20240419155709.318866-14-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WBTxahvZJkKl

Collect the images copied into guest RAM into a sorted list, and issue
POPULATE_REALM KVM ioctls once we've created the Realm Descriptor. The
images are part of the Realm Initial Measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: Use a ROM loader notifier
---
 target/arm/kvm-rme.c | 97 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index aa9c3b5551..bee6694d6d 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -9,9 +9,11 @@
 #include "exec/confidential-guest-support.h"
 #include "hw/boards.h"
 #include "hw/core/cpu.h"
+#include "hw/loader.h"
 #include "kvm_arm.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qom/object_interfaces.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
@@ -19,10 +21,21 @@
 #define TYPE_RME_GUEST "rme-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
+#define RME_PAGE_SIZE qemu_real_host_page_size()
+
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
+    Notifier rom_load_notifier;
+    GSList *ram_regions;
 };
 
+typedef struct {
+    hwaddr base;
+    hwaddr len;
+    /* Populate guest RAM with data, or only initialize the IPA range */
+    bool populate;
+} RmeRamRegion;
+
 static RmeGuest *rme_guest;
 
 bool kvm_arm_rme_enabled(void)
@@ -41,6 +54,41 @@ static int rme_create_rd(Error **errp)
     return ret;
 }
 
+static void rme_populate_realm(gpointer data, gpointer unused)
+{
+    int ret;
+    const RmeRamRegion *region = data;
+
+    if (region->populate) {
+        struct kvm_cap_arm_rme_populate_realm_args populate_args = {
+            .populate_ipa_base = region->base,
+            .populate_ipa_size = region->len,
+            .flags = KVM_ARM_RME_POPULATE_FLAGS_MEASURE,
+        };
+        ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                                KVM_CAP_ARM_RME_POPULATE_REALM,
+                                (intptr_t)&populate_args);
+        if (ret) {
+            error_report("RME: failed to populate realm (0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx"): %s",
+                         region->base, region->len, strerror(-ret));
+            exit(1);
+        }
+    } else {
+        struct kvm_cap_arm_rme_init_ipa_args init_args = {
+            .init_ipa_base = region->base,
+            .init_ipa_size = region->len,
+        };
+        ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                                KVM_CAP_ARM_RME_INIT_IPA_REALM,
+                                (intptr_t)&init_args);
+        if (ret) {
+            error_report("RME: failed to initialize GPA range (0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx"): %s",
+                         region->base, region->len, strerror(-ret));
+            exit(1);
+        }
+    }
+}
+
 static void rme_vm_state_change(void *opaque, bool running, RunState state)
 {
     int ret;
@@ -55,6 +103,9 @@ static void rme_vm_state_change(void *opaque, bool running, RunState state)
         return;
     }
 
+    g_slist_foreach(rme_guest->ram_regions, rme_populate_realm, NULL);
+    g_slist_free_full(g_steal_pointer(&rme_guest->ram_regions), g_free);
+
     /*
      * Now that do_cpu_reset() initialized the boot PC and
      * kvm_cpu_synchronize_post_reset() registered it, we can finalize the REC.
@@ -75,6 +126,49 @@ static void rme_vm_state_change(void *opaque, bool running, RunState state)
     }
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
+static void rme_add_ram_region(hwaddr base, hwaddr len, bool populate)
+{
+    RmeRamRegion *region;
+
+    region = g_new0(RmeRamRegion, 1);
+    region->base = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
+    region->len = QEMU_ALIGN_UP(len, RME_PAGE_SIZE);
+    region->populate = populate;
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
+static void rme_rom_load_notify(Notifier *notifier, void *data)
+{
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
+    rme_add_ram_region(rom->addr, rom->max_len, /* populate */ true);
+}
+
 int kvm_arm_rme_init(MachineState *ms)
 {
     static Error *rme_mig_blocker;
@@ -102,6 +196,9 @@ int kvm_arm_rme_init(MachineState *ms)
      */
     qemu_add_vm_change_state_handler(rme_vm_state_change, NULL);
 
+    rme_guest->rom_load_notifier.notify = rme_rom_load_notify;
+    rom_add_load_notifier(&rme_guest->rom_load_notifier);
+
     cgs->ready = true;
     return 0;
 }
-- 
2.44.0
