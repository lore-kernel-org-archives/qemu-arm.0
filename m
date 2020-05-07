Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1976630lfb;
        Thu, 7 May 2020 06:40:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypIoy2bG3PBJVFhp4wCmfXzw3WNFxhN/SQUkT6atvVotoHG4PneemZltoocAHdw0VAXZsoXx
X-Received: by 2002:a05:6402:1297:: with SMTP id w23mr11684805edv.151.1588858838110;
        Thu, 07 May 2020 06:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588858838; cv=none;
        d=google.com; s=arc-20160816;
        b=k8GM526zcIA0l1MCqigJlIhW84A8iSQWj/yG2BeWe07hk7Cqp26e7MdHiSneBPYKfV
         PUpVw+zNQ03mUBk7DABWXTEhl/okL4HDcnbXGYj4Izq1bv6dxu9dA+brkAz454ILBhan
         UEsr2NHAhis/xrLsMMKb5LTjzTfwEv0KR0kNeZtjE0Go+M6UFtCI9wGnA+cu5yySvV8s
         /siqFzixNfCcJM+xb9y5mYMbKjLUqLU070Rk2MWGS2qu0y14THH5+amazSec6+M9FQY4
         DIIjXeDDUKbtTWsYUoQvMeCU2qIP3TA5Rb1KAuiiOlPfZ/mDuGIaFADXP0MZaM07r8EC
         DVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=GB05fazCB/9re57lDYE7Px9yYzZk+yj2wHmrPhX/0Yw=;
        b=xipJYms3nQ6CT59bAyCVPsL5zJnVwh40rNlgglLJNmVd8WWB/Ea/ndG8sgXI/K9fN4
         31GCjECLPIAg8fKs+6ahWhdZo0ENjZO/lZh6QSjyuozUMzMBH1kCzCD5ZMN39G/tvMoQ
         uLIe/AEGFdvaYdgKrbvL1MJAQ29tZN1FTia12lziEE6by7lIGAi7Ua3+YhjjKFoF/8RT
         fPJmiVFTgZxwxJyfFj5U5qWYgn8ZBIX2351i4dCP3+v9fb9X71u8AEYGLcDypzfeVOH4
         PV1YvMhyUMjidkDgBagXcX3+t3mjRIHk3MuGgGq623W0xAVtnoKOakuZE57BgJ6NC2wU
         xZOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id dg6si768577edb.15.2020.05.07.06.40.37;
        Thu, 07 May 2020 06:40:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgEGNk2 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 7 May 2020 09:40:28 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:39046 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726268AbgEGNk0 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 7 May 2020 09:40:26 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C8144298E5D23D3D8D96;
        Thu,  7 May 2020 21:40:22 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 21:40:13 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v26 07/10] KVM: Move hwpoison page related functions into kvm-all.c
Date:   Thu, 7 May 2020 21:42:02 +0800
Message-ID: <20200507134205.7559-8-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507134205.7559-1-gengdongjiu@huawei.com>
References: <20200507134205.7559-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ykTvQm3ascSe

kvm_hwpoison_page_add() and kvm_unpoison_all() will both
be used by X86 and ARM platforms, so moving them into
"accel/kvm/kvm-all.c" to avoid duplicate code.

For architectures that don't use the poison-list functionality
the reset handler will harmlessly do nothing, so let's register
the kvm_unpoison_all() function in the generic kvm_init() function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Acked-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 accel/kvm/kvm-all.c      | 36 ++++++++++++++++++++++++++++++++++++
 include/sysemu/kvm_int.h | 12 ++++++++++++
 target/i386/kvm.c        | 36 ------------------------------------
 3 files changed, 48 insertions(+), 36 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 439a4ef..36be117 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -44,6 +44,7 @@
 #include "qapi/visitor.h"
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-visit-common.h"
+#include "sysemu/reset.h"
 
 #include "hw/boards.h"
 
@@ -883,6 +884,39 @@ int kvm_vm_check_extension(KVMState *s, unsigned int extension)
     return ret;
 }
 
+typedef struct HWPoisonPage {
+    ram_addr_t ram_addr;
+    QLIST_ENTRY(HWPoisonPage) list;
+} HWPoisonPage;
+
+static QLIST_HEAD(, HWPoisonPage) hwpoison_page_list =
+    QLIST_HEAD_INITIALIZER(hwpoison_page_list);
+
+static void kvm_unpoison_all(void *param)
+{
+    HWPoisonPage *page, *next_page;
+
+    QLIST_FOREACH_SAFE(page, &hwpoison_page_list, list, next_page) {
+        QLIST_REMOVE(page, list);
+        qemu_ram_remap(page->ram_addr, TARGET_PAGE_SIZE);
+        g_free(page);
+    }
+}
+
+void kvm_hwpoison_page_add(ram_addr_t ram_addr)
+{
+    HWPoisonPage *page;
+
+    QLIST_FOREACH(page, &hwpoison_page_list, list) {
+        if (page->ram_addr == ram_addr) {
+            return;
+        }
+    }
+    page = g_new(HWPoisonPage, 1);
+    page->ram_addr = ram_addr;
+    QLIST_INSERT_HEAD(&hwpoison_page_list, page, list);
+}
+
 static uint32_t adjust_ioeventfd_endianness(uint32_t val, uint32_t size)
 {
 #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
@@ -2085,6 +2119,8 @@ static int kvm_init(MachineState *ms)
         s->kernel_irqchip_split = mc->default_kernel_irqchip_split ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
     }
 
+    qemu_register_reset(kvm_unpoison_all, NULL);
+
     if (s->kernel_irqchip_allowed) {
         kvm_irqchip_create(s);
     }
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index ac2d1f8..c660a70 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -42,4 +42,16 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
                                   AddressSpace *as, int as_id);
 
 void kvm_set_max_memslot_size(hwaddr max_slot_size);
+
+/**
+ * kvm_hwpoison_page_add:
+ *
+ * Parameters:
+ *  @ram_addr: the address in the RAM for the poisoned page
+ *
+ * Add a poisoned page to the list
+ *
+ * Return: None.
+ */
+void kvm_hwpoison_page_add(ram_addr_t ram_addr);
 #endif
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 4901c6d..34f8387 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -24,7 +24,6 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm_int.h"
-#include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "kvm_i386.h"
 #include "hyperv.h"
@@ -533,40 +532,6 @@ uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
     }
 }
 
-
-typedef struct HWPoisonPage {
-    ram_addr_t ram_addr;
-    QLIST_ENTRY(HWPoisonPage) list;
-} HWPoisonPage;
-
-static QLIST_HEAD(, HWPoisonPage) hwpoison_page_list =
-    QLIST_HEAD_INITIALIZER(hwpoison_page_list);
-
-static void kvm_unpoison_all(void *param)
-{
-    HWPoisonPage *page, *next_page;
-
-    QLIST_FOREACH_SAFE(page, &hwpoison_page_list, list, next_page) {
-        QLIST_REMOVE(page, list);
-        qemu_ram_remap(page->ram_addr, TARGET_PAGE_SIZE);
-        g_free(page);
-    }
-}
-
-static void kvm_hwpoison_page_add(ram_addr_t ram_addr)
-{
-    HWPoisonPage *page;
-
-    QLIST_FOREACH(page, &hwpoison_page_list, list) {
-        if (page->ram_addr == ram_addr) {
-            return;
-        }
-    }
-    page = g_new(HWPoisonPage, 1);
-    page->ram_addr = ram_addr;
-    QLIST_INSERT_HEAD(&hwpoison_page_list, page, list);
-}
-
 static int kvm_get_mce_cap_supported(KVMState *s, uint64_t *mce_cap,
                                      int *max_banks)
 {
@@ -2180,7 +2145,6 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         fprintf(stderr, "e820_add_entry() table is full\n");
         return ret;
     }
-    qemu_register_reset(kvm_unpoison_all, NULL);
 
     shadow_mem = object_property_get_int(OBJECT(s), "kvm-shadow-mem", &error_abort);
     if (shadow_mem != -1) {
-- 
1.8.3.1
