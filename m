Received: by 10.223.150.237 with SMTP id u100csp3629381wrb;
        Fri, 10 Nov 2017 03:14:55 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RvG9eldicuYMFihzhTm+C0WXT2L3b0QbUuHozM2lTXVO4+p7PZ0/SZNhepiGSJUgmyvm5S
X-Received: by 10.98.85.71 with SMTP id j68mr3598441pfb.222.1510312495682;
        Fri, 10 Nov 2017 03:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510312495; cv=none;
        d=google.com; s=arc-20160816;
        b=zeY3fR0LHvP9FdvEKDv5Nhspw6QR/7YSRd3tfeUcMXuO0mD6LkvLLV/7R5xwj01fus
         2fcbLHeJK2AVvCTfy5YVFmnQuTrQQuYHfkwMDYjdCa9VSkHxSh5nnpzOzCZNQgB/EaAD
         lFb/8uoo8Vw+/Mj+gzW688mMripUOf7uQoSmpcr3AQLmbl0fOSrlgZwcz/yZEBpNJAXT
         9i+KZwFASKujhump2IfsfzKfnisolbBSULGIuGp4tf4sgEaI47U9VnoBtGgwpDk9NjXk
         JsJkHzAiRgIa7yIbllSgUFduDZ8wG4Po/pJ01gyJPDi4OjrVKrqm7fjeOQqD2D/NTx1K
         64NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=Tom5IfsX5kSoM7JYLcTBeebZOr+LUDNlW25eTPUjFiw=;
        b=e7zZo9WjrBHSSTYxb/CL985t8u7oAJwl3kh1LBn8UEWUMdJlHKGwUbHjhrYDkxaH1S
         x2h5XISX+4R00yLRaJ2gLT6W7e0/Yu8kIvhjR/veAfoddcd3xz/ZzJYZ45MIY1stkQBg
         WqrUEeZ40ok5j7QbWd4nZUQNQB+g19+Bg9fL2wqLxOkluqLOi+XHT3R0BMZlu1ZRvY+M
         85fU7xeGt6LxBdvW9ETBwv/cLQw/26JrCPnIvQwb++BeFYyhb2/qv5pTZkAkxbAsWSRN
         6VWQHyJ5C53Wch7IiN1qT/PTdAjR4LOTHH/ZgoxzZLb8iRYLiA9wO7XamKsV8FuB23HB
         6IbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s15si8697707plp.268.2017.11.10.03.14.55;
        Fri, 10 Nov 2017 03:14:55 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753008AbdKJLOu (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 10 Nov 2017 06:14:50 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10509 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751456AbdKJLOd (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Nov 2017 06:14:33 -0500
Received: from 172.30.72.60 (EHLO DGGEMS403-HUB.china.huawei.com) ([172.30.72.60])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKR46789;
        Fri, 10 Nov 2017 19:14:16 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.361.1; Fri, 10 Nov 2017 19:14:06 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v12 09/12] Move related hwpoison page function to accel/kvm/ folder
Date:   Sat, 11 Nov 2017 03:19:48 +0800
Message-ID: <1510341591-22817-10-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090206.5A058A08.0288,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 76d605c08465bd9afdc89af2c2540451
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: R9Xcb9OlE5V/

kvm_hwpoison_page_add() and kvm_unpoison_all() will be used
by both X86 and ARM platforms, so move them to a common accel/kvm/
folder to avoid duplicate code.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

---
Moving related hwpoison page function to accel/kvm folder is suggested here:
https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00077.html
https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00152.html
---
 accel/kvm/kvm-all.c     | 29 +++++++++++++++++++++++++++++
 include/exec/ram_addr.h | 10 ++++++++++
 target/i386/kvm.c       | 33 ---------------------------------
 3 files changed, 39 insertions(+), 33 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 46ce479..72ab615 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -564,6 +564,34 @@ int kvm_vm_check_extension(KVMState *s, unsigned int extension)
     return ret;
 }
 
+static QLIST_HEAD(, HWPoisonPage) hwpoison_page_list =
+    QLIST_HEAD_INITIALIZER(hwpoison_page_list);
+
+void kvm_unpoison_all(void *param)
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
@@ -2279,6 +2307,7 @@ bool kvm_arm_supports_user_irq(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_USER_IRQ);
 }
 
+
 #ifdef KVM_CAP_SET_GUEST_DEBUG
 struct kvm_sw_breakpoint *kvm_find_sw_breakpoint(CPUState *cpu,
                                                  target_ulong pc)
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index d017639..afe34b1 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -49,6 +49,11 @@ struct RAMBlock {
     unsigned long *unsentmap;
 };
 
+typedef struct HWPoisonPage {
+    ram_addr_t ram_addr;
+    QLIST_ENTRY(HWPoisonPage) list;
+} HWPoisonPage;
+
 static inline bool offset_in_ramblock(RAMBlock *b, ram_addr_t offset)
 {
     return (b && b->host && offset < b->used_length) ? true : false;
@@ -80,6 +85,11 @@ void qemu_ram_free(RAMBlock *block);
 
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
 
+/* Free and remove all the poisoned pages in the list */
+void kvm_unpoison_all(void *param);
+/* Add a poisoned page to the list */
+void kvm_hwpoison_page_add(ram_addr_t ram_addr);
+
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 6db7783..3e1afb6 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -390,39 +390,6 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
     return ret;
 }
 
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
-- 
1.8.3.1
