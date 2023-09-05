Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1863872ejb;
        Tue, 5 Sep 2023 02:13:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjFZfAmzfOkVUvheQwpQJfyKFOdtgrrVH3PUKfUg3yR6HKVh/LYgAUibMXhpCCYGNtsPJI
X-Received: by 2002:a05:620a:1a0d:b0:767:dd02:e908 with SMTP id bk13-20020a05620a1a0d00b00767dd02e908mr13879281qkb.64.1693905231887;
        Tue, 05 Sep 2023 02:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693905231; cv=none;
        d=google.com; s=arc-20160816;
        b=pFC6wGgtJMoSjG+OOAdwRfgoPyJ0kkqOEqd18nt+SischDkpB5qa/Pot1QUem7kxyS
         C2+amHV86m0dqNrNbM/J4lB1nza5iNLmAm766tr0Mk9puYqy52kcsfdYsSpNqayvL6uM
         r30aCMZ7LR2oto2B2kjD36BhckRIr71MhR+A2XL7fYOVmUSNfM/bYSDtzrDVM9VpLy/x
         8EflVbDjrCLRU51PRP+71wnFshadd28gP/6qDGrX5r5eMF5a/guZ/yp01NKvqlzMZcDc
         zXZf/Ay9lyt13pJhfJWy9xtpaj+/sYHLR5/7g1ieCFAQ1nPpVTREm9mMTkQJvvkTe6Fy
         UJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:subject:cc:to;
        bh=WXZlu4c/41I4Egc5HxrkBr2W+PgYgrbGSqLZOwsuFXk=;
        fh=9b190+TVKlRAUWo3m9Xzhy2uD5wr0Q5Frn8i7qoKqbw=;
        b=TuVwPfXPl6CY03Eg2foFAYZ8ASVy6b/USHGQOSmR7nsf8M4H7QBg/md6kUOmHhTR0A
         9UX1fgod5olxqVEqyPRiAh8V3mR7PUAvrnOu43iNsA114r6OI5WkFNjKweSIULArdtcG
         Ne2l8WjnXELr0yCB6LpVIBn4jl9fA1Pjmh9RAppATOk2g2OLymyNy0x54w08/ImSBRTT
         1/vUrQG3j42Q1k2Gu6u4HfdnxYlHH7x5Rkvei06FpcBKwcXNh58CeXAWgZekPI1amkDJ
         nnK9th0l65d26zCgfdHgHNa0NLuAq2MMsTB6BMLQdtOkFWgbqyE7v13nabVnbCr52FcB
         c3pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm17-20020a05622a251100b00414c2dd4241si2802084qtb.518.2023.09.05.02.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 02:13:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdS7d-000262-Rw; Tue, 05 Sep 2023 05:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1qdS7c-00024e-7z; Tue, 05 Sep 2023 05:13:20 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1qdS7V-0003xN-E1; Tue, 05 Sep 2023 05:13:19 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rg0Cd50gpz689yQ;
 Tue,  5 Sep 2023 17:13:01 +0800 (CST)
Received: from A2006125610.china.huawei.com (10.202.227.178) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 5 Sep 2023 10:13:03 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <peter.maydell@linaro.org>, <gshan@redhat.com>, <ricarkol@google.com>,
 <jonathan.cameron@huawei.com>, <kvm@vger.kernel.org>, <linuxarm@huawei.com>
Subject: [PATCH v4] arm/kvm: Enable support for
 KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE
Date: Tue, 5 Sep 2023 10:12:46 +0100
Message-ID: <20230905091246.1931-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.178]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) AC_FROM_MANY_DOTS=0.001, BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: klTowy1sR9jK

Now that we have Eager Page Split support added for ARM in the kernel,
enable it in Qemu. This adds,
 -eager-split-size to -accel sub-options to set the eager page split chunk size.
 -enable KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE.

The chunk size specifies how many pages to break at a time, using a
single allocation. Bigger the chunk size, more pages need to be
allocated ahead of time.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
Changes:
v3: https://lore.kernel.org/qemu-devel/20230830114818.641-1-shameerali.kolothum.thodi@huawei.com/
   -Added R-by by Gavin and replaced kvm_arm_eager_split_size_valid()
    with a direct check.
v2: https://lore.kernel.org/qemu-devel/20230815092709.1290-1-shameerali.kolothum.thodi@huawei.com/
   -Addressed commenst from Gavin.
RFC v1: https://lore.kernel.org/qemu-devel/20230725150002.621-1-shameerali.kolothum.thodi@huawei.com/
  -Updated qemu-options.hx with description
  -Addressed review comments from Peter and Gavin(Thanks).
---
 accel/kvm/kvm-all.c      |  1 +
 include/sysemu/kvm_int.h |  1 +
 qemu-options.hx          | 15 ++++++++++
 target/arm/kvm.c         | 61 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 2ba7521695..ff1578bb32 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3763,6 +3763,7 @@ static void kvm_accel_instance_init(Object *obj)
     /* KVM dirty ring is by default off */
     s->kvm_dirty_ring_size = 0;
     s->kvm_dirty_ring_with_bitmap = false;
+    s->kvm_eager_split_size = 0;
     s->notify_vmexit = NOTIFY_VMEXIT_OPTION_RUN;
     s->notify_window = 0;
     s->xen_version = 0;
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 511b42bde5..a5b9122cb8 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -116,6 +116,7 @@ struct KVMState
     uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
     uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
     bool kvm_dirty_ring_with_bitmap;
+    uint64_t kvm_eager_split_size;  /* Eager Page Splitting chunk size */
     struct KVMDirtyRingReaper reaper;
     NotifyVmexitOption notify_vmexit;
     uint32_t notify_window;
diff --git a/qemu-options.hx b/qemu-options.hx
index 29b98c3d4c..2e70704ee8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -186,6 +186,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "                split-wx=on|off (enable TCG split w^x mapping)\n"
     "                tb-size=n (TCG translation block cache size)\n"
     "                dirty-ring-size=n (KVM dirty ring GFN count, default 0)\n"
+    "                eager-split-size=n (KVM Eager Page Split chunk size, default 0, disabled. ARM only)\n"
     "                notify-vmexit=run|internal-error|disable,notify-window=n (enable notify VM exit and set notify window, x86 only)\n"
     "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 SRST
@@ -244,6 +245,20 @@ SRST
         is disabled (dirty-ring-size=0).  When enabled, KVM will instead
         record dirty pages in a bitmap.
 
+    ``eager-split-size=n``
+        KVM implements dirty page logging at the PAGE_SIZE granularity and
+        enabling dirty-logging on a huge-page requires breaking it into
+        PAGE_SIZE pages in the first place. KVM on ARM does this splitting
+        lazily by default. There are performance benefits in doing huge-page
+        split eagerly, especially in situations where TLBI costs associated
+        with break-before-make sequences are considerable and also if guest
+        workloads are read intensive. The size here specifies how many pages
+        to break at a time and needs to be a valid block size which is
+        1GB/2MB/4KB, 32MB/16KB and 512MB/64KB for 4KB/16KB/64KB PAGE_SIZE
+        respectively. Be wary of specifying a higher size as it will have an
+        impact on the memory. By default, this feature is disabled
+        (eager-split-size=0).
+
     ``notify-vmexit=run|internal-error|disable,notify-window=n``
         Enables or disables notify VM exit support on x86 host and specify
         the corresponding notify window to trigger the VM exit if enabled.
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 23aeb09949..b66b936a95 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -30,6 +30,7 @@
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
+#include "qapi/visitor.h"
 #include "qemu/log.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
@@ -287,6 +288,26 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    if (s->kvm_eager_split_size) {
+        uint32_t sizes;
+
+        sizes = kvm_vm_check_extension(s, KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES);
+        if (!sizes) {
+            s->kvm_eager_split_size = 0;
+            warn_report("Eager Page Split support not available");
+        } else if (!(s->kvm_eager_split_size & sizes)) {
+            error_report("Eager Page Split requested chunk size not valid");
+            ret = -EINVAL;
+        } else {
+            ret = kvm_vm_enable_cap(s, KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE, 0,
+                                    s->kvm_eager_split_size);
+            if (ret < 0) {
+                error_report("Enabling of Eager Page Split failed: %s",
+                             strerror(-ret));
+            }
+        }
+    }
+
     kvm_arm_init_debug(s);
 
     return ret;
@@ -1069,6 +1090,46 @@ bool kvm_arch_cpu_check_are_resettable(void)
     return true;
 }
 
+static void kvm_arch_get_eager_split_size(Object *obj, Visitor *v,
+                                          const char *name, void *opaque,
+                                          Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    uint64_t value = s->kvm_eager_split_size;
+
+    visit_type_size(v, name, &value, errp);
+}
+
+static void kvm_arch_set_eager_split_size(Object *obj, Visitor *v,
+                                          const char *name, void *opaque,
+                                          Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    uint64_t value;
+
+    if (s->fd != -1) {
+        error_setg(errp, "Unable to set early-split-size after KVM has been initialized");
+        return;
+    }
+
+    if (!visit_type_size(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value && !is_power_of_2(value)) {
+        error_setg(errp, "early-split-size must be a power of two");
+        return;
+    }
+
+    s->kvm_eager_split_size = value;
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
+    object_class_property_add(oc, "eager-split-size", "size",
+                              kvm_arch_get_eager_split_size,
+                              kvm_arch_set_eager_split_size, NULL, NULL);
+
+    object_class_property_set_description(oc, "eager-split-size",
+        "Eager Page Split chunk size for hugepages. (default: 0, disabled)");
 }
-- 
2.34.1

