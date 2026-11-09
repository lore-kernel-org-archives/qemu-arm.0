Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0B7606A32A
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oKyQfhr7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXu4-0005K0-M0; Mon, 09 Nov 2026 17:31:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXte-0005Bx-Vp
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:29 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtb-0003nW-2V
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:26 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-8b904d10882so606347b3a.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263479; x=1794868279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=APq0rgpfgD0cfK5j1kfRyGHVlYdjJtePZaGLkcs8ieg=;
 b=oKyQfhr78QPl2rtHsm6Cvn7Mhndydx87Z2lFt7NX4x99KpoSwak2Vcc3yNmt4+f+eO
 su3L4UcCexrciPfvhCvN6TXLDv8cS7Guk7Zei6xecuewy0u8d3vCG08IsSypd3gv3ts5
 QzhEnjIsNqmTmS9jJjTlQj3X7uUOyZRCYDpcVUi0vFststZpSLsIrZQHEL6sfiQmP9OX
 7le9G2cZgtEWg0O9uouDgCsbETeRWMxFsZZKA9lYfWS6M17akcDPxv0oAKHGXw/KkMFL
 tOs1sQE09KV9Yvo8DAAJjoSFEPkCaYUXgS5SAQRew8z4nTt37Q5LpN46aMfFCrV4eC+2
 sHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263479; x=1794868279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=APq0rgpfgD0cfK5j1kfRyGHVlYdjJtePZaGLkcs8ieg=;
 b=skZ4aeqY4+lxRQYSvb7lU2uPf0IE2rcVZhWcaetlScwsP5JXY81I+LEsQjw8264yGq
 hSv59Q3F/r3W6wXT61onkSayFn6cENtKMzywXRN0ZOrTgf9XpD8Zx5JDV4Bzq7oXB18G
 pWnEsGptsSIe/+Avl0yecZaO6fuDC7X+FLV/3KdemUxiJRVk3LFjRziBuZtMkzFk1hY0
 prOFNwQEVg1luSzBR7JNO4Lnlz4Hms9/pROZzOVl+coHL9KvwDIkmimEjvfCPU19yHV8
 XjlXB07LgFRGBi3BUjDNIAANO0lX7LfQvUW5err8sUKEt3eOzNv30VubtjJaNcfLFYmC
 YVmw==
X-Forwarded-Encrypted: i=1;
 AL+hErH8WSoEE3hKttEpXAmaP/1K/UkkGxU+gXgYaKbjtXsXUGtLWu8YvX5A2jUm90Y0xMVOR1IAG4ZcsQ==@nongnu.org
X-Gm-Message-State: APuU4Z9eVJX9ycc60oP3yka9J5Lyq5rNO5bqZ5B5wQ0WevK6CcXmlZjM
 w/g0pqI35U6KjEwgAxgPDQdxLkJ7UHh6kRi+y8qEvgTA4ZOYzyDC24m3bNUW6Suv9Rw=
X-Gm-Gg: AYBFou000iZwt8KLRdE+tM0BZ21dUpvY4wDiFvpq+K6XwV/9TLIEu8hiVcFHrjFTcAH
 qtog64NEeVTo/+sLsItBbbHFPZKvPQ/5e4Ubl65BiYCIYY8rjqDobpja63dN4ESJDzerc5CMlB4
 pHFeeoNWwnxJHBl6bQ4G4hkb7KPIII+ViG1LYdhOKi3AfRTsiiJMGxYh4hKbq/oAT9afw1ke1LT
 7TW1qHc1XQtwgH2uZgRoVwJPGMEpccWTgzAHo5DbzCRlzmJxlhEeGsQ5mj7N9f7Csvqyz8tDZgW
 I4GWDzbnbjyj1deuUVEpXbZGzv06yVr5XBo99X4mv/6quZbsf4/inG/f4YNVAM4I+OuLmxb2S56
 FIZwgCUk010vlmmDPgnpm6BWJ1cGUiGU4vf9TbGLGd1med7HboBSouTaSZ++0ads0QzFPflXlda
 A9o4DmqxPMmopQ8vtgBqVEaTGFPEK9WkWhlBsrdF8jN2vAmQvteSXPuz1MXzSnqhZfc0CiR6gU9
 6QLQ0wt6pQeuQAPl8qzm4S+CD0h+LodfLpq/hdx1nDYg74gTT1KyDLJJPIG8XHDC0rJh63Tqrdp
 tNQw/xREklCQP79veB7M+fQpR9BFeQqDeeo+b4tKSZ+4cvmRndfgHiw8W6W2S+4A65kM0Ug+uzg
 =
X-Received: by 2002:a05:6a00:4b56:b0:89d:29fb:b5e7 with SMTP id
 d2e1a72fcca58-8ba868a4e97mr1029357b3a.24.1794263479183; 
 Mon, 09 Nov 2026 14:31:19 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:17 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 03/23] target/arm/kvm-rme: Add mechanic to initialize realms
Date: Mon,  9 Nov 2026 16:30:50 -0600
Message-ID: <20261109223110.1619504-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x432.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialise an @rme_guest object and install a handler to get notified
when the Realm is ready to start.  That way we can finish readying the
Realm once we know everything is in place.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm-rme.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm.c     | 15 +++++++++++--
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 42e1d1e7b859..b3edfa8e0a95 100644
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
+    cgs->convert_in_place = true;
 }
 
 static void rme_guest_finalize(Object *obj)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index df86ad387c56..04dd85ee2776 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -34,6 +34,7 @@
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "system/address-spaces.h"
+#include "system/confidential-guest-support.h"
 #include "gdbstub/enums.h"
 #include "hw/core/boards.h"
 #include "hw/core/irq.h"
@@ -657,7 +658,8 @@ int kvm_arch_get_default_type(MachineState *ms)
 
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
-    int ret;
+    Error *local_err = NULL;
+    int ret = 0;
     /* For ARM interrupt delivery is always asynchronous,
      * whether we are using an in-kernel VGIC or not.
      */
@@ -671,6 +673,15 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
     cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
 
+    /* Initialize confidential guest (Realm) if needed */
+    if (ms->cgs) {
+        ret = confidential_guest_kvm_init(ms->cgs, &local_err);
+        if (ret < 0) {
+            error_report_err(local_err);
+            return ret;
+        }
+    }
+
     /* Check whether user space can specify guest syndrome value */
     cap_has_inject_serror_esr =
         kvm_check_extension(s, KVM_CAP_ARM_INJECT_SERROR_ESR);
@@ -721,7 +732,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
 
-    return 0;
+    return ret;
 }
 
 unsigned long kvm_arch_vcpu_id(CPUState *cpu)
-- 
2.53.0


