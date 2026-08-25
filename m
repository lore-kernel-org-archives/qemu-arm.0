Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED75C61DB9
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:03:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzCt-0003Js-9w; Tue, 25 Aug 2026 18:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCl-00036o-RQ
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:16 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCk-0001FY-60
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:15 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2d0407aedd6so3729055ad.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695273; x=1788300073; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zhh1+5fS76RIWmolCJw0xzFIMsNDMIy/frSA7jNg4AM=;
 b=CwlCpnTtL5Wvu88KrEDTyPDGQR5sI53OpKUxrKG4g0DDxxcgJwVZmARltf0y6kcGD7
 dZ7JlvbUpExs+spAeQDzUfYXlMqiop1V4ikyV2niSwN8DpzTiMD/DnZxuDihoxE4xeEY
 LduV9KTfRFi/bNDgFvgbHLNgaCARC09eubM6b0UbPo8/skbK6FhT0974qklgTQ/2HxEV
 /MI01VyflOzxfDegiJJoRXTs7kUAOGkL5rfzca4IGh6ws1nu/PFnnn7mYlElozlpPe3x
 XGveRVU4gVwY/oi95eOWdtNDBK3fi9BevARKVhmPUWCQ5fTIydR/aW1tUmx5n9LsaFvu
 p8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695273; x=1788300073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zhh1+5fS76RIWmolCJw0xzFIMsNDMIy/frSA7jNg4AM=;
 b=ikHryuZRRqDVr0M1IdZ2OZFxmAEraB78KdnYzpx6I5uAfAth2dGoZfjFpv/y3YACd2
 psxhECLSKW/FFgoa7zkLPCNvIJeWXsAhZvgBE29yQX1MMdNtgMdcB1Vd0EDGf1FMZq2w
 ezXaxstri7f9UocxWMlMpGLelmA4JV5fa7vVuwwualaU63CiOhGXajoXTtmpUul0gHzR
 AsmSYnPj6xKQ5IjKqTVDb1KnRalmRO2R+mIzofgIBCW1Xex/vGPcKrp7uT83nTfamtL7
 SbXgwiE3RWdtdrirVJdAbiSF5xLIkotMY2WBBTYCEJ2/++IJYzpqrcjebzOxGprB0XlD
 tc+A==
X-Forwarded-Encrypted: i=1;
 AHgh+RoP3nzLrw6uBvqS3rS0gI/vMSXFNDCrLX6tsyIss+qBaxUsaubX/G6qm6DqnaiPOwmwK04KWplTkg==@nongnu.org
X-Gm-Message-State: AFuF++mfIHnS9nDbqv/0PaLab8mVznx+bnTQGlqWap7dGwDgPU0oQ46R
 /YmtSNKVAyH5meHDD1C5oqoikoM28nYIuxXhgN8LLt31dLa1jwaCcAhQiVOLv77Z8rY=
X-Gm-Gg: AR+sD12YqUhyAqjIxo43EqDARe9d3f73xIbpjFTL+7KR8JcvnPBH/Ehixp44VwsAthH
 sE05FskYiw5WdiH3/AfpNVSIk5ajqYz3djjVDT8cD0mL0I+gUHb8rO0ycT1aDe8CDYIMSqD8qYl
 xeWb+PufalWUQqh2PKIEn8c8xYOETjCsjln0ajlFogr8AWgyUPfr+nPa9oypOcAOZ28TcLEA9eu
 emCm4um/E2gwrzDdmiXxrpKmHfENQKylUaDIrUDJXB+u8jB/7shQlekBUkJgFrm3dpeegm5M9fF
 vwE7hlj4X6qKkLoH9x823JFEJmlX9vsvaRuM826DWpp2SD+Nl4JvYI7oWeKrIKwOk7FPGNgOrxu
 y4eUFn8dhmW5ra1+xVQHUVbA7yzYrjDn9N4yr7w8aK+Wps0VLp74s6XqJP1J3fGYIExZxXJb6P6
 vYq46kA/Th5jHt1w0OFMYqjqPk3D+nc7Kit/avAu5gNDbFOu088szrpxBNUIJaJ/m33nFfKu9qM
 57RPQlwI5eUmXE=
X-Received: by 2002:a17:90a:e7ca:b0:38f:de97:b06 with SMTP id
 98e67ed59e1d1-3966d3ba166mr4266274a91.5.1787695272551; 
 Tue, 25 Aug 2026 15:01:12 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:11 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 04/24] target/arm/kvm-rme: Add mechanic to initialize realms
Date: Tue, 25 Aug 2026 16:00:41 -0600
Message-ID: <20260825220101.3443954-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 20b39d10b766..0c853d17413e 100644
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


