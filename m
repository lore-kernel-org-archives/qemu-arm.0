Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp3904158wri;
        Mon, 4 Nov 2019 04:16:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqzuCyVIdfoJOZohIw7WPjJZRBy2hVtnL8jd4NmiuNWFlU81ptCoBPGK35cI71JxmPDwJzb/
X-Received: by 2002:a17:906:1812:: with SMTP id v18mr23695541eje.86.1572869799116;
        Mon, 04 Nov 2019 04:16:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572869799; cv=none;
        d=google.com; s=arc-20160816;
        b=e/ceuWcQWjlo2QUuyBn5Ohdk029ErsyaHAl43ttTYnTzpFWl1K0kbFqJbFR80iN/a/
         WqlrkFPQEJafBmHN834C4eDKSwHu6ytLWXWGF8Yf7A6WUTF2O00I8n/F+e1fDllrpQ3+
         fo/t37u7cO+OrI1prExL8y6uuW9AvkBahEupdRhWCBCJIQ1b4aawMT6nadpbh1xTs5+v
         DgKzG71pXV+KrIn+gdz/piCXYOGNp5XgFjw1D5e3Ucjikk213sQQTVI0gMKFUb8YtzxD
         g3ayys5l0Bt6RIjbOMtMBz2JbsojMqrPPdYMnkGdgLQNx4La1JSuXlk2/C3gTWrVEEXZ
         2q/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=O4xDY6KOmtrmng7As9h8BYK+ybHuKJltzy/8bEkaKG8=;
        b=wSBCmYF7qxluXflKg2aDVcEvEvG03PiRypT8kqj2Vqkdsxo+GVfUkzy9lskylu0Io8
         x4WyaMw/zQOMRVuhxK/vBSF1gCK9GJCGADntrfbs7gejVymsHSpkRyPrSpDKILlcskP8
         XmhS4upFXlMdh0U8l1NxFNvjIOi4NjxnfMk92T8z6W5uPB4Y4rR4vXLB7d1/1bE9NELB
         wJSVC6OWuy1UnwdbBanFpqqxC/5NGgpSyq4R8rbYIvN1eL7ajxnn358RKRsezFvM/cRq
         A+2WMMM5zV3H/0KTj7kUyPENOWinwwtgAFeOV6Lg9/yRXPJe56Ow0P0sFpNdqo/T4jMs
         3vlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j13si7513159ede.324.2019.11.04.04.16.38;
        Mon, 04 Nov 2019 04:16:39 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbfKDMQi (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 4 Nov 2019 07:16:38 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:5258 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728923AbfKDMQh (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 4 Nov 2019 07:16:37 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A17A11B8C0C441E7636B;
        Mon,  4 Nov 2019 20:16:35 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Mon, 4 Nov 2019 20:16:25 +0800
From:   Xiang Zheng <zhengxiang9@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <jonathan.cameron@huawei.com>,
        <xuwei5@huawei.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <linuxarm@huawei.com>
CC:     <zhengxiang9@huawei.com>, <wanghaibin.wang@huawei.com>
Subject: [PATCH v21 4/6] KVM: Move hwpoison page related functions into kvm-all.c
Date:   Mon, 4 Nov 2019 20:14:56 +0800
Message-ID: <20191104121458.29208-5-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191104121458.29208-1-zhengxiang9@huawei.com>
References: <20191104121458.29208-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: JWl/SiF/87tt

From: Dongjiu Geng <gengdongjiu@huawei.com>

kvm_hwpoison_page_add() and kvm_unpoison_all() will both be used by X86
and ARM platforms, so moving them into "accel/kvm/kvm-all.c" to avoid
duplicate code.

For architectures that don't use the poison-list functionality the
reset handler will harmlessly do nothing, so let's register the
kvm_unpoison_all() function in the generic kvm_init() function.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 accel/kvm/kvm-all.c      | 36 ++++++++++++++++++++++++++++++++++++
 include/sysemu/kvm_int.h | 12 ++++++++++++
 target/i386/kvm.c        | 36 ------------------------------------
 3 files changed, 48 insertions(+), 36 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 140b0bd8f6..f45096d5a0 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -41,6 +41,7 @@
 #include "hw/irq.h"
 #include "sysemu/sev.h"
 #include "sysemu/balloon.h"
+#include "sysemu/reset.h"
 
 #include "hw/boards.h"
 
@@ -856,6 +857,39 @@ int kvm_vm_check_extension(KVMState *s, unsigned int extension)
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
@@ -2031,6 +2065,8 @@ static int kvm_init(MachineState *ms)
         goto err;
     }
 
+    qemu_register_reset(kvm_unpoison_all, NULL);
+
     if (machine_kernel_irqchip_allowed(ms)) {
         kvm_irqchip_create(ms, s);
     }
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index ac2d1f8b56..c660a70c51 100644
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
index bfd09bd441..d8f2507a8d 100644
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
@@ -521,40 +520,6 @@ uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
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
@@ -2157,7 +2122,6 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         fprintf(stderr, "e820_add_entry() table is full\n");
         return ret;
     }
-    qemu_register_reset(kvm_unpoison_all, NULL);
 
     shadow_mem = machine_kvm_shadow_mem(ms);
     if (shadow_mem != -1) {
-- 
2.19.1

