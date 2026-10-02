Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56897CA5FE6
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:24:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjkX-0007Mr-Fb; Fri, 02 Oct 2026 16:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkD-000799-Q8
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:39 -0400
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkB-0005kN-P0
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:37 -0400
Received: by mail-pj2-x0d.google.com with SMTP id
 d9443c01a7336-2e4ba830297so4382805ad.3
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972434; x=1791577234; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PrymrVjLi9fRSqjPY1QcYorJ41+LlkOVk9x92OsHKf4=;
 b=pFzcESY7tmLaMRv6y9ZI9oTHJ6/IMFeMfHSgqBDDuG89LcK7ktIH8ysHzeJyTvGdfb
 M0NrPW5keNjH+2UVQEaLX4Cp1BoktaHYp+bQvn2HNzqLWVgdlHB1og4I1xw3jyvQTfqq
 VBgnVZfKlrknUj9H1FNU/pVieUzt+VG+R5Jl8pjf+awbKe1dX6e/7DYVPPhfoZecEL4g
 IvH5bwL8au/Ygh54+SF8HQavxoi/XsWZmMyeNA5M3VaL86s+zFfZARFwJMZL7xS5bSZo
 AuQjnXApjHcJf74J96MM5HpnSRQZdWUaXQMWxU2e+FSUr+zJkb7PCie6HV9ailIZHn+N
 y/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972434; x=1791577234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PrymrVjLi9fRSqjPY1QcYorJ41+LlkOVk9x92OsHKf4=;
 b=tdPOuCeun0awhtBcuJ8M44H+UXuTHdHK7bhqhMlid8WV7q5or2mzVRnGPctFyMDR/M
 JI2jAPmft7JGFjMnOkyH45sw2dQBgxD7WzEbuAY6EOpg82BidnNWbtUmoNQ719Jy9ecx
 JT9bGwg5cOXlHhm3en0de4x9Mt8xiOltk/9TWa+l0mMr/D35rqYsaYsypY/0KRpg0FlT
 iWeasjGql9qy841/SskJG3JfPXu8kFdcDWSIgMZZhioxnO3XTcuQewFc3lCit6fACURs
 p6FmXqcXkry8/bt/TIpFoDNDFUMsyZiahgQazO+k2IDa0umocS3l7pL2BW/t4yFylZBD
 Gptw==
X-Forwarded-Encrypted: i=1;
 AKwUvByDtace48OG3tGdc89zEZ+HvbYx9izE8W+Q5UO0KnplSwNlUSRvcP0r8cPz33GZYYOuOfVkU+dxeA==@nongnu.org
X-Gm-Message-State: AFq9FYKQoZ+8DWiNf3tS/s7Sz11et0czv1wA/YI40ufRaHfyY1NwEU8X
 CsGDBEJ9sAsdhjsxvbMeOvTOQ2dWS/o7W7nKFm4YVYi6zOUE8hzqarbCg92O06yEYZw=
X-Gm-Gg: AYBFou1eymqu6jcacFUkaiDDHW08E481x0cA5ZoYDmcQdaexRE6shwt9MYlsDfheiPv
 +3YKL+bNgJz3YN+3NWffgsdMyCPH5omDa/pIuiEuzTm/L2itJDVQDQUxR+ALqO2TWjGeJ45TRFB
 7EOhov89EufqembcncP1LCo0RtXNJFTwPlAY5j7KxDOlmNR8vsbKub9D6mfLuXGvyLfpkwANLcv
 ns9RaMWRPJ1nmxoQaEBOLhMnlJO0ndteDoFW6/YI+DqEynQlxVCBgQMdqgoIPuwkr1Gkh8S5KDM
 AfuUfH9tfNA7dV6AR2YM+6znOYEWvXMbqfw2L78Ch+W/wWsJ773cPT8JUaIX0Q8i3Mc9tyJ2zEe
 tz0f7I6DUQotUmRBXNWZUY3rB9jc36ax543I9kSGyIHc0bMjSA9ZVMI5ALfupICMhUYmNev8MNb
 GYvaU7iFSq4RHc6yl0eWAvt7uPXME94lEu+x9yz4rxQOtiLHGIpgC994ttx1ZOGCCeSLq29K//d
 SocNeBaCKPO8tO2V/qbYQgWlNNQvG7AJ6c8
X-Received: by 2002:a17:902:ec8c:b0:2dd:ad74:ac7f with SMTP id
 d9443c01a7336-2e49b6808d3mr33171375ad.26.1790972434068; 
 Fri, 02 Oct 2026 13:20:34 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:20:33 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 03/22] target/arm/kvm-rme: Add mechanic to initialize realms
Date: Fri,  2 Oct 2026 14:20:07 -0600
Message-ID: <20261002202026.1204110-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::d;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj2-x0d.google.com
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
index 3d905f8565de..8b6f602ebe77 100644
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
@@ -639,7 +640,8 @@ int kvm_arch_get_default_type(MachineState *ms)
 
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
-    int ret;
+    Error *local_err = NULL;
+    int ret = 0;
     /* For ARM interrupt delivery is always asynchronous,
      * whether we are using an in-kernel VGIC or not.
      */
@@ -653,6 +655,15 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
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
@@ -703,7 +714,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
 
-    return 0;
+    return ret;
 }
 
 unsigned long kvm_arch_vcpu_id(CPUState *cpu)
-- 
2.43.0


