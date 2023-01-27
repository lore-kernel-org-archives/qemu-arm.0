Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232467ejc;
        Fri, 27 Jan 2023 07:15:58 -0800 (PST)
X-Received: by 2002:a05:600c:444b:b0:3da:fd06:a6f1 with SMTP id v11-20020a05600c444b00b003dafd06a6f1mr38586373wmn.31.1674832558814;
        Fri, 27 Jan 2023 07:15:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832558; cv=none;
        d=google.com; s=arc-20160816;
        b=0pjxRti7lv+0XMH8VPoUbnRWietTU28jWCGs4RqKA5g/IhBOlJacdUM+aDjxTFuXx1
         3Yf14jueCzzJz8Kt+gip9uxlwd/dobor+epUPIbMT4xq0iYghSaxH1V6NDBnIOce/bwb
         dNgEdfRJk0ld3jVcycupPnzoLwwcghbvOAD6RxfU7sJXL5DevutUGe2bmvYiRdRY+oMs
         yGfhQa/kirNl148Gt/IwAQqLhFlMI1z121BvficF2q0Z2PojRRgwWrNYkJsiNVpe/uT9
         uCEGK1V0KG4KhcS9JwO5i4x2otGkuQgdiPWRMiMLG1vMrDKyr1crIzLPCrJqyZdE4FSQ
         PLyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jk2tLu9B17fWWaJQH7+8AxbE3Z51YlONgr1eX8RlPmA=;
        b=ejdEXV4GVrQjK2l66Y1umXkwdQMxKOXGWa2YiFKpxcc11qxdt8L0Sw6s9VgvFPIZlU
         ucUrSUpP5eWsyfzLoWEk2aLLapDxRo/+Qlsox4qfkTxg7e7AmVqeyCvsWXG9D2Dl60ht
         vkGvUTE/UybM9wiVfRS8JHvL9tNwoM7uBl00YvC7dHWgvYo3Q8maYsYsQtc6y8ONDbUE
         Fd5yEz4ArYcbF2FRfxSDXA8JJFAPHKgE4rLNBmb55WzR4kKE2tZh0ksbEonQLlPzTgVc
         nKbKyej7lNanpvmvLfK8bpaByQvbZwAbL/YRnidH18UAw5anV4uiiwVWzk2FhjyHzcfH
         hPmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YR2pHhtC;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 13-20020a05600c22cd00b003dc43445a76sor98988wmg.17.2023.01.27.07.15.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:15:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YR2pHhtC;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jk2tLu9B17fWWaJQH7+8AxbE3Z51YlONgr1eX8RlPmA=;
        b=YR2pHhtCWTabUWyx4wGPji42cH3bijA219lxLRX76etzS5d+t1Iys0bExlCBzyX/d0
         V/sDAa3LzKBOkJFr8dc0GzozxgFKKDwTp+Jq9MW4YsPD7FJFYIBdl2za2R+yALaNr8w4
         BsQw0LIqM/xrdjyE4VM5D96LMd6ZeDoBhDzgclFGcYMe3NKcNxTwIq5QXI6UogEhcBxN
         gmhXU9Z/BKIKpNnUmmmtBUZxo0lSfTUjLrw0JWZdZbtA5wvreKW2Na4sxsfCwEnwDPgC
         lDUqRiv3XM1SWHOlb53aZMTCDdQb9U6aIJC3MnQodS+03JpcS3BNvSbBavChFX8hgSWn
         bunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jk2tLu9B17fWWaJQH7+8AxbE3Z51YlONgr1eX8RlPmA=;
        b=FMRpPW1T3Kdvk3q3JGfvWg+wbTjd/6aZva/K6ovGUlA9OSqGTXn3hODCtuTktLW50M
         TI0cF4P5DHKzhohFbRfT5149XKwXnITp+eaR5d04MyFsDP6nunlpPVrPTgQfaAWfeQzW
         qq7lnORiqFY0YP3rb7G+qE8nWGwECg+ox2rpRijEbmXx9bTB4m47PQsok4vXmLy+ogWD
         Do5Q9pBjuu8tcdf6cMQNeoSedObCuGZ2mPHvrShi2LET6b47hVbO6cxht6BgNIwc7d/L
         lM5UvJJcusmz6smPQAojT2PPCIgu5vujrRkl2zRLsJgFWqmi71j2GeustO0H3Vrencau
         DBzA==
X-Gm-Message-State: AFqh2krvqMKfoiAjD7aqHJSg1rVY8MzxAubyX8JqvRUTtRkYjiIyAiHd
	PUqs40hGnFBdVeEG3wUQNGh44AcD
X-Google-Smtp-Source: AMrXdXuASuHeTvXSRwW9m0uVw498DxUoKkpkFbPvwHp6LvuduXtXzDXNCjIlbDCzKAer0RwL85iGeg==
X-Received: by 2002:a05:600c:a690:b0:3d5:64bf:ccb8 with SMTP id ip16-20020a05600ca69000b003d564bfccb8mr38582020wmb.12.1674832558525;
        Fri, 27 Jan 2023 07:15:58 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:15:58 -0800 (PST)
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
Subject: [RFC PATCH 03/16] target/arm/kvm-rme: Initialize realm
Date: Fri, 27 Jan 2023 15:07:16 +0000
Message-Id: <20230127150727.612594-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hn+JUXIxSFeB

The machine code calls kvm_arm_rme_vm_type() to get the VM flag and
kvm_arm_rme_init() to issue KVM hypercalls in the required order:

* create the realm descriptor early,
* finalize the REC (vCPU) after the registers are reset,
* load images into Realm RAM (in another patch),
* activate the realm at the end, at which point the realm is sealed.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm_arm.h |  14 ++++++
 target/arm/kvm-rme.c | 101 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635c..00d3df8cac 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -369,6 +369,11 @@ void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa);
 
 int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
+int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp);
+int kvm_arm_rme_vm_type(MachineState *ms);
+
+bool kvm_arm_rme_enabled(void);
+
 #else
 
 /*
@@ -443,6 +448,15 @@ static inline uint32_t kvm_arm_sve_get_vls(CPUState *cs)
     g_assert_not_reached();
 }
 
+static inline int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
+{
+    return 0;
+}
+
+static inline int kvm_arm_rme_vm_type(MachineState *ms)
+{
+    return 0;
+}
 #endif
 
 static inline const char *gic_class_name(void)
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 22aa3dc712..d7cdca1cbf 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -25,6 +25,107 @@ struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
 };
 
+static RmeGuest *cgs_to_rme(ConfidentialGuestSupport *cgs)
+{
+    if (!cgs) {
+        return NULL;
+    }
+    return (RmeGuest *)object_dynamic_cast(OBJECT(cgs), TYPE_RME_GUEST);
+}
+
+bool kvm_arm_rme_enabled(void)
+{
+    ConfidentialGuestSupport *cgs = MACHINE(qdev_get_machine())->cgs;
+
+    return !!cgs_to_rme(cgs);
+}
+
+static int rme_create_rd(RmeGuest *guest, Error **errp)
+{
+    int ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                                KVM_CAP_ARM_RME_CREATE_RD);
+
+    if (ret) {
+        error_setg_errno(errp, -ret, "RME: failed to create Realm Descriptor");
+    }
+    return ret;
+}
+
+static void rme_vm_state_change(void *opaque, bool running, RunState state)
+{
+    int ret;
+    CPUState *cs;
+
+    if (state != RUN_STATE_RUNNING) {
+        return;
+    }
+
+    /*
+     * Now that do_cpu_reset() initialized the boot PC and
+     * kvm_cpu_synchronize_post_reset() registered it, we can finalize the REC.
+     */
+    CPU_FOREACH(cs) {
+        ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_REC);
+        if (ret) {
+            error_setg_errno(&error_fatal, -ret,
+                             "RME: failed to finalize vCPU");
+        }
+    }
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_ACTIVATE_REALM);
+    if (ret) {
+        error_setg_errno(&error_fatal, -ret, "RME: failed to activate realm");
+    }
+}
+
+int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
+{
+    int ret;
+    static Error *rme_mig_blocker;
+    RmeGuest *guest = cgs_to_rme(cgs);
+
+    if (!guest) {
+        /* Either no cgs, or another confidential guest type */
+        return 0;
+    }
+
+    if (!kvm_enabled()) {
+        error_setg(errp, "KVM required for RME");
+        return -ENODEV;
+    }
+
+    if (!kvm_check_extension(kvm_state, KVM_CAP_ARM_RME)) {
+        error_setg(errp, "KVM does not support RME");
+        return -ENODEV;
+    }
+
+    ret = rme_create_rd(guest, errp);
+    if (ret) {
+        return ret;
+    }
+
+    error_setg(&rme_mig_blocker, "RME: migration is not implemented");
+    migrate_add_blocker(rme_mig_blocker, &error_fatal);
+
+    /*
+     * The realm activation is done last, when the VM starts, after all images
+     * have been loaded and all vcpus finalized.
+     */
+    qemu_add_vm_change_state_handler(rme_vm_state_change, guest);
+
+    cgs->ready = true;
+    return 0;
+}
+
+int kvm_arm_rme_vm_type(MachineState *ms)
+{
+    if (cgs_to_rme(ms->cgs)) {
+        return KVM_VM_TYPE_ARM_REALM;
+    }
+    return 0;
+}
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
 }
-- 
2.39.0
