Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F747C624DE
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:38:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DEa-0001Ko-7C; Thu, 03 Sep 2026 15:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEY-0001IX-Af
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:26 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEV-00047K-7Z
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:26 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c9aea40d799so230004a12.0
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464181; x=1789068981; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=i3s4/uL2nCcl6R6HIOwHPfPYar75XVk8sVrkSd1EszE=;
 b=DtdzK2jkSczjW0h5u1Qt1SKduMQQ/zuDeGEsHvny3ve4Dk/gn9w64gZuu/0ZC3VDFA
 vMixcHtebpUyTkPOJfNpE0AaHGEX5gI4wWA4cD5dTfbWX5kx81b9BAjKk4mS68/tv7Yw
 lzTCowlewyvzyc4xxMwxdCS83bttr/4N0H7+/R4JR2IsfS041A9080iSMPzxaZYwwn7F
 zAL2IgxeyBApGiYCkr2t2puzOrBfCm/i+Fzi5mKkUh/OX+N5pmC9ivQ7TfFr6IwZlrlx
 UOP2FHchI94YRRvJlaxUJEG51lcrd6NKa0HRzJ1sfv3IV9n0jKZty6rTmNf1BfDfZHDG
 b5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464181; x=1789068981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=i3s4/uL2nCcl6R6HIOwHPfPYar75XVk8sVrkSd1EszE=;
 b=gCV4y9ao9ylrj/g17pXyMqcIRf0vKv0bcNe8GkBKxCNi7NVkw3I4gOLK2C00+3RfB5
 N/da0FdvVQZwrTJfbv+l8Zq16E3c4O3gFF+6POYSpYSUgQJhheq3ArMtGOrBLfHSlbFP
 6UmG8vSnoST423SgOi9iMpIKJOO7fp0hZwmZ5QgKvyEmNy63JTrX8A9Trqs8rRnkrOFD
 a9Xg3tFaToXM70Ajud5TGwgtwhYr9ab+FwIq93LTGvy7bETZz6HpeCrDm/JrkCQjHWj8
 PBxOqED2banOlK7stGTdelnc3NaM6EX56zc5ZR21nP4XKMIyaC+ZTI3zClG+3qu1ymy/
 7J2g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzoPs/PULvunaVfqfDvIVmxX+gtUhq0AM6dX8gRYaL5L4yWX2voNIqrrvh/OVtThpt2xfFr/QCwIg==@nongnu.org
X-Gm-Message-State: AFuF++nVx3WA+jzonpMlkPxVpZnPG3ztZQa+B1itYGWzQFFOg2Nh+NQs
 TQUJ2spFrAnXj/Bd3QTBycxuc7q9zlg68aQtTvNcyyBDNx9yd6OT33em8p8b+Dn3i3I=
X-Gm-Gg: AYBFou1Dlj2pEXrojUNIgrxUoC+E/7xvcYJ42pPbUtL9jmNFDpTVuv2jGFOUjZuXE6Q
 ABrLNSQQm5Z1yNebrtVoxIlzC3oR40G9n2RzyfyLcE7RzJKzHU3SJRTqy5spCpqE1fUcC8f+eBs
 tsdqOR6qAkGKgkGBvWf7WAw8yw3f8p2wbkpZYmvMnGIs4WvhTs5cT8APZgrbbrQI9Lnmtosvxkd
 By+BY1wBsOqIvhtoOuZx62aCgDWnIrH9mM+4bY0RryZuqoocdjb9vlIf8M35MRdYVzFvowNIY95
 fuc5WdW+1RvpCUxnWhhwxtNKNfdPGz45WyJmfhOhPPj/9O6H7s1iX6VWyFAULd+U6U1vYQa98f1
 rl6QWv48RMm34CfwoZQdLcT+hNA359GZXU90sWzYG9IoYKAr0ITa75XLwlnnQ4BQ7AbQ3C5APrc
 grmBnEG0fssEPOLFZYLEJGB+URDcRZdPLv+6brVCIrCGtptKOLcvZ79cH5Q8HQPuOEgPhPZ35cY
 Yh4w8Bg1+9oBCM=
X-Received: by 2002:a17:90b:264e:b0:398:9bd1:3215 with SMTP id
 98e67ed59e1d1-39b262e28cdmr1126889a91.22.1788464180505; 
 Thu, 03 Sep 2026 12:36:20 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:20 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 04/24] target/arm/kvm-rme: Add mechanic to initialize realms
Date: Thu,  3 Sep 2026 13:35:51 -0600
Message-ID: <20260903193611.1058589-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pg1-x533.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Initialise an @rme_guest object and install a handler to get notified
when the Realm is ready to start.  That way we can finish reading the
Realm once we know everything is in place.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm-rme.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm.c     | 15 +++++++++++--
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 42e1d1e7b859..a4a5e195c196 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -13,6 +13,7 @@
 #include "kvm_arm.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qom/object_interfaces.h"
 #include "system/confidential-guest-support.h"
 #include "system/kvm.h"
@@ -29,12 +30,62 @@ OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
                                           CONFIDENTIAL_GUEST_SUPPORT,
                                           { TYPE_USER_CREATABLE }, { })
 
+static RmeGuest *rme_guest;
+
+static void rme_vm_state_change(void *opaque, bool running, RunState state)
+{
+    if (!running) {
+        return;
+    }
+
+    kvm_mark_guest_state_protected();
+}
+
+static int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
+{
+    KVMState *s = KVM_STATE(current_accel());
+    static Error *rme_mig_blocker;
+
+    if (!rme_guest) {
+        return 0;
+    }
+
+    if (!kvm_vm_check_extension(s, KVM_CAP_ARM_RMI)) {
+        error_setg(errp, "VM doesn't support Realms");
+        return -ENODEV;
+    }
+
+    error_setg(&rme_mig_blocker, "RME: migration is not implemented");
+    migrate_add_blocker(&rme_mig_blocker, &error_fatal);
+
+    /*
+     * The realm activation is done last, when the VM starts, after all images
+     * have been loaded and all vcpus finalized.
+     */
+    qemu_add_vm_change_state_handler(rme_vm_state_change, NULL);
+
+    cgs->require_guest_memfd = true;
+    cgs->ready = true;
+    return 0;
+}
+
 static void rme_guest_class_init(ObjectClass *oc, const void *data)
 {
+    ConfidentialGuestSupportClass *klass = CONFIDENTIAL_GUEST_SUPPORT_CLASS(oc);
+
+    klass->kvm_init = kvm_arm_rme_init;
 }
 
 static void rme_guest_init(Object *obj)
 {
+    ConfidentialGuestSupport *cgs = CONFIDENTIAL_GUEST_SUPPORT(obj);
+
+    if (rme_guest) {
+        error_report("a single instance of RmeGuest is supported");
+        exit(1);
+    }
+    rme_guest = RME_GUEST(obj);
+    cgs->allow_convert_in_place = true;
 }
 
 static void rme_guest_finalize(Object *obj)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ed99be7fd80c..401a6f669cbb 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -33,6 +33,7 @@
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "system/address-spaces.h"
+#include "system/confidential-guest-support.h"
 #include "gdbstub/enums.h"
 #include "hw/core/boards.h"
 #include "hw/core/irq.h"
@@ -596,7 +597,8 @@ int kvm_arch_get_default_type(MachineState *ms)
 
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
-    int ret;
+    Error *local_err = NULL;
+    int ret = 0;
     /* For ARM interrupt delivery is always asynchronous,
      * whether we are using an in-kernel VGIC or not.
      */
@@ -610,6 +612,15 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
     cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
 
+    /* Initialize confidential guest (Realm) if needed */
+    if (ms->cgs) {
+        ret = confidential_guest_kvm_init(ms->cgs, &local_err);
+            if (ret < 0) {
+                error_report_err(local_err);
+                return ret;
+        }
+    }
+
     /* Check whether user space can specify guest syndrome value */
     cap_has_inject_serror_esr =
         kvm_check_extension(s, KVM_CAP_ARM_INJECT_SERROR_ESR);
@@ -660,7 +671,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
 
-    return 0;
+    return ret;
 }
 
 unsigned long kvm_arch_vcpu_id(CPUState *cpu)
-- 
2.43.0


