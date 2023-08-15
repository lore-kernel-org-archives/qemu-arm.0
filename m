Received: by 2002:a17:907:1051:b0:98d:b2f5:1316 with SMTP id oy17csp206683ejb;
        Tue, 15 Aug 2023 02:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9Jc6iPzJtrFxme7mtEEhkx4BcPAlKS1eMlC3qxVigy1jHxV/jNf0l8h2JgKSpn64oyXoy
X-Received: by 2002:ac8:598a:0:b0:40e:8dca:1d2a with SMTP id e10-20020ac8598a000000b0040e8dca1d2amr15473408qte.29.1692091713313;
        Tue, 15 Aug 2023 02:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692091713; cv=none;
        d=google.com; s=arc-20160816;
        b=vkIH2vPy88nrdnGsmY7ZnfhIm5CCH1iUIkaMA6bqsPTW3NDgK+EnwRpS1941jCFrxF
         1tzskGqkjP6b3ns0XPFsiLNRi7Y/zVA/v8WcBDQGQSkIoJzoCA8t0RYAPjsq7kbdciKf
         8kApp+le3eKhgZ1CuZqoY2mvCpG2lzBH7zpnW+QUsUQT6EjQxEtchoUW9JjnXfzinUKq
         s8AtnJt6oZruVrHFp+myHT00X4JARjrLnZOoFhdNYjeWxSdui57hOtC3uhZx/eUFoNws
         PdULeQusltXtPfKFPOpFyNXHE7FmqGvtiUC/aiGV7oTcwfiFE0r9RLRFol1PtFw0afMH
         yjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:subject:cc:to;
        bh=eN0PNq7wSqmPAwnr6pskbHbMTtwH8oTHgiUtAcAVCTc=;
        fh=WvNOj0sXHq4rNcbXUKI0ElY3pUPU+4V158atrnkmKMw=;
        b=t0Z1vCVM86jtpLCtXneWrZ1DCk7adrgUB1QzLgNs5B3aJOEbSjq0cey2ZGlgLT00u/
         +J5G4lpMIIAfayaPcnaHoDWggFHuDKtuXtJraOM7nBUFNO1FJd9F4NtvSWrO60BrQkuk
         FDAYUdxoJc1lZeYExJ2pUPuHbDo627DXukf+GMy+cqkP1nLwpjvA7a/wWofxHZ87IEVC
         ASlqF/AJm1/Wdzr9bqHXOg4GvCJWJuKgbcrfh2giag9ADGyoRfKOQmCdpF8pnfL4pBZD
         PtM+8/dH8LHdI/wp8tieQbJxlAKr9PWYmCSo5B0ZEFZyxDlo1yVSSer3Q2c45Lg7Gl1i
         DF4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11-20020ac85acb000000b0040343612a64si7042712qtd.12.2023.08.15.02.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Aug 2023 02:28:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qVqLL-00042Y-VB; Tue, 15 Aug 2023 05:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1qVqLK-00042E-QS; Tue, 15 Aug 2023 05:28:02 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1qVqLH-0002gA-4j; Tue, 15 Aug 2023 05:28:02 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RQ5Rl5DGZz6J7Xw;
 Tue, 15 Aug 2023 17:23:47 +0800 (CST)
Received: from A2006125610.china.huawei.com (10.202.227.178) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 15 Aug 2023 10:27:40 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <peter.maydell@linaro.org>, <ricarkol@google.com>, <kvm@vger.kernel.org>, 
 <gshan@redhat.com>, <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v2] arm/kvm: Enable support for
 KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE
Date: Tue, 15 Aug 2023 10:27:09 +0100
Message-ID: <20230815092709.1290-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.178]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) AC_FROM_MANY_DOTS=2.999, BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: l+80gM4RXcM+

Now that we have Eager Page Split support added for ARM in the kernel,
enable it in Qemu. This adds,
 -eager-split-size to -accel sub-options to set the eager page split chunk size.
 -enable KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE.

The chunk size specifies how many pages to break at a time, using a
single allocation. Bigger the chunk size, more pages need to be
allocated ahead of time.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
RFC v1: https://lore.kernel.org/qemu-devel/20230725150002.621-1-shameerali.kolothum.thodi@huawei.com/
  -Updated qemu-options.hx with description
  -Addressed review comments from Peter and Gavin(Thanks).
---
 include/sysemu/kvm_int.h |  1 +
 qemu-options.hx          | 14 +++++++++
 target/arm/kvm.c         | 62 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 511b42bde5..03a1660d40 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -116,6 +116,7 @@ struct KVMState
     uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
     uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
     bool kvm_dirty_ring_with_bitmap;
+    uint64_t kvm_eager_split_size; /* Eager Page Splitting chunk size */
     struct KVMDirtyRingReaper reaper;
     NotifyVmexitOption notify_vmexit;
     uint32_t notify_window;
diff --git a/qemu-options.hx b/qemu-options.hx
index 29b98c3d4c..6ef7b89013 100644
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
@@ -244,6 +245,19 @@ SRST
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
+        to break at a time and needs to be a valid block page size(eg: 4KB |
+        2M | 1G when PAGE_SIZE is 4K). Be wary of specifying a higher size as
+        it will have an impact on the memory. By default, this feature is
+        disabled (eager-split-size=0).
+
     ``notify-vmexit=run|internal-error|disable,notify-window=n``
         Enables or disables notify VM exit support on x86 host and specify
         the corresponding notify window to trigger the VM exit if enabled.
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b4c7654f49..6ceba673d9 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -30,6 +30,7 @@
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
+#include "qapi/visitor.h"
 #include "qemu/log.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
@@ -247,6 +248,11 @@ int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
     return ret > 0 ? ret : 40;
 }
 
+static bool kvm_arm_eager_split_size_valid(uint64_t req_size, uint32_t sizes)
+{
+    return req_size & sizes;
+}
+
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     int ret = 0;
@@ -280,6 +286,22 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    if (s->kvm_eager_split_size) {
+        uint32_t sizes;
+
+        sizes = kvm_vm_check_extension(s, KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES);
+        if (!sizes) {
+            s->kvm_eager_split_size = 0;
+            warn_report("Eager Page Split support not available");
+        } else if (!kvm_arm_eager_split_size_valid(s->kvm_eager_split_size,
+                                                   sizes)) {
+            error_report("Eager Page Split requested chunk size not valid");
+        } else if (kvm_vm_enable_cap(s, KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE, 0,
+                                     s->kvm_eager_split_size)) {
+            error_report("Failed to set Eager Page Split chunk size");
+        }
+    }
+
     kvm_arm_init_debug(s);
 
     return ret;
@@ -1062,6 +1084,46 @@ bool kvm_arch_cpu_check_are_resettable(void)
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
+        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
+        return;
+    }
+
+    if (!visit_type_size(v, name, &value, errp)) {
+        return;
+    }
+
+    if (is_power_of_2(value)) {
+        error_setg(errp, "early-split-size must be a power of two.");
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
+        "Configure Eager Page Split chunk size for hugepages. (default: 0, disabled)");
 }
-- 
2.17.1

