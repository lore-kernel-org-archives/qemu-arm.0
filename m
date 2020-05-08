Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2521527lfb;
        Thu, 7 May 2020 19:17:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypIgAHnNEoNlO6zL/z/cVr4AgpjAPkEdccZ8LzHRg/frxsjBITK4EMMkFqoKQbL/gn6Yfb48
X-Received: by 2002:a17:906:6a02:: with SMTP id o2mr37610ejr.223.1588904271827;
        Thu, 07 May 2020 19:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588904271; cv=none;
        d=google.com; s=arc-20160816;
        b=xOT+/W5RNJ55UWERYFecxZapoJejk1JvFzbTzh2IgzINKz6R4hFLxtFMKu4ADw11Ws
         yalOVOBao9x744A2hYyIygg+ALde3EZf3ve3oVc7/2a+bD9x9+T73qaXUcSpt/AHe9sU
         jPW5smxxfafwsIo/NCV9cQIFhdOz08rwIUBs39RAXpBZZu4azqz4KQvXEXrUNmpaBdU/
         GDmaJdwpK81PLAeIkr3a+rrCeDZze5zRMTKnm0xQ3hERkM3KZaFNj3HqI2pRUBuMBadm
         fjKgEGecQxaUsOSdo+27FeYWsJ+aL7xKYqPtjt1tEJHqBmnbjFv8dPS7ofulTKN/EF2J
         +0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=GB05fazCB/9re57lDYE7Px9yYzZk+yj2wHmrPhX/0Yw=;
        b=xntvB/K4gl8h2o21xFSW3gRP+Y1LAPc6FueP5ylRTxBRlOSlyqAwEBXjQYwNUWRlhj
         38LyAY1XPJN+94LlV/Xa9vfHC0DDomw2Q1Jj7shBOBcFKEIO3GWeHe0YLRh83EMC9n1K
         PLhI7N69ecqpAeC8IHU37JBhOQANkrWRE3IM1lIkEeRbnObXk9uqtK2n19XgsT1/t+8l
         ItcvppJkpwRqJyhh+qQv+1P+QZhaCELB+uteTso7Akzj3EhELlyT/Oun/iIu6Aw+VVYd
         QznnpIGLRfctR6hlt6dzesUGHX/l1G7aomr3g8k/y/EFovcpxPxtrK1KDAwtC3q0WMwo
         kWpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id g24si124136ejb.433.2020.05.07.19.17.51;
        Thu, 07 May 2020 19:17:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgEHCRu (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 7 May 2020 22:17:50 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4344 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726926AbgEHCRt (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 7 May 2020 22:17:49 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 538B71A5FB7D54325133;
        Fri,  8 May 2020 10:17:46 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Fri, 8 May 2020
 10:17:40 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH RESEND v26 07/10] KVM: Move hwpoison page related functions into kvm-all.c
Date:   Fri, 8 May 2020 10:19:27 +0800
Message-ID: <20200508021930.37955-8-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508021930.37955-1-gengdongjiu@huawei.com>
References: <20200508021930.37955-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: eEXCI/RLyIZo

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
