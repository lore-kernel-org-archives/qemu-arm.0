Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3879496wrg;
        Tue, 14 May 2019 04:22:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz8xh3TxGAG6iNSAj3mI50XNErQXPEC3wdjzXdobmuYvbAA5R6QMF6fXloxVd8RV0w6jhJ4
X-Received: by 2002:aa7:9f01:: with SMTP id g1mr27597782pfr.259.1557832935270;
        Tue, 14 May 2019 04:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557832935; cv=none;
        d=google.com; s=arc-20160816;
        b=g+K7MrCMiQu6E08qPymshPrOm0w8RqyQYrjqxPTYJ3KkQib0wQgVS7lF5y3HpJZW5k
         /TD7lQq7SHaWjz/2+MDnWvqrHh/1i/fEKYOXRKDPF4lGu/EzQ+dOykaPdqlnjclYLud+
         eteTRn7ItCGWpipuKlZPoYUAZ25fNde86oPaHgsnCmYnqA+86aLVtkVsoa6wivnByE2l
         Ad//al1z7xotXok7tUZzwHN9kQPwO1rrj8doOvcT27Gz1Kbf/g9NpGCi+yHL773vz8X/
         XRLcfwVOBZfudQ+39akSoZGBo8HkMWI4sDG4mW16Gj7pH/IU4nGK1ud10461au484CV0
         ruuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Gra9/SavN5KAfAYkjvBDFVh1/Coh5UNAWwWkSTbKzEw=;
        b=DNUqvy6WFeEErMY7ufNw/2AlUE8ZJGolTwztUjo9SkqHGIttKz0nhGv8Huubfhr0GS
         vvKGV8+UDNoxxEsbjslj8e0OaE/B3NISsUjTqnmofH5E0WdBArGsG38Sn7jAPhr8awe4
         Mp8xd8WDwj6OqcZ1PCmOEzFEsPHlFayld1x7TsvlkuLJ9TtGNCulv6VXhqlVtm6vULbO
         Y765geNvhQCGdthPCqQDYJGu3dvxF6BA8vUNKTr2W0xvX/C7d+xkygIAT5lTztC20u9Z
         KHpZloWNKmMPqUHDLUuOGyGqXuSPJ+M+wThaav5HlmCOgv6qKzULycqcZ/S1vXPynje2
         y/KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 202si20024040pgh.575.2019.05.14.04.22.15;
        Tue, 14 May 2019 04:22:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfENLWM (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Tue, 14 May 2019 07:22:12 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44478 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726465AbfENLWH (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 14 May 2019 07:22:07 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 56F04EF173E4AFE96C18;
        Tue, 14 May 2019 19:22:05 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Tue, 14 May 2019 19:21:56 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: [PATCH v17 08/10] KVM: Move related hwpoison page functions to accel/kvm/ folder
Date:   Tue, 14 May 2019 04:18:21 -0700
Message-ID: <1557832703-42620-9-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: NepsI85Y5A86

kvm_hwpoison_page_add() and kvm_unpoison_all() will be used both
by X86 and ARM platforms, so move these functions to a common
accel/kvm/ folder to avoid duplicate code.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 accel/kvm/kvm-all.c     | 33 +++++++++++++++++++++++++++++++++
 include/exec/ram_addr.h | 24 ++++++++++++++++++++++++
 target/arm/kvm.c        |  3 +++
 target/i386/kvm.c       | 34 +---------------------------------
 4 files changed, 61 insertions(+), 33 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 524c4dd..b9f9f29 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -625,6 +625,39 @@ int kvm_vm_check_extension(KVMState *s, unsigned int extension)
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
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 139ad79..193b0a7 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -116,6 +116,30 @@ void qemu_ram_free(RAMBlock *block);
 
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
 
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
+
+/**
+ * kvm_unpoison_all:
+ *
+ * Parameters:
+ *  @param: some data may be passed to this function
+ *
+ * Free and remove all the poisoned pages in the list
+ *
+ * Return: None.
+ */
+void kvm_unpoison_all(void *param);
+
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 5995634..6d3b25b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -29,6 +29,7 @@
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
+#include "exec/ram_addr.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
@@ -187,6 +188,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
     cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
 
+    qemu_register_reset(kvm_unpoison_all, NULL);
+
     return 0;
 }
 
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 3b29ce5..9bdb879 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -46,6 +46,7 @@
 #include "migration/blocker.h"
 #include "exec/memattrs.h"
 #include "trace.h"
+#include "exec/ram_addr.h"
 
 //#define DEBUG_KVM
 
@@ -467,39 +468,6 @@ uint32_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
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
