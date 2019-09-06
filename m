Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp417020wrp;
        Fri, 6 Sep 2019 01:33:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxamCVqH4cFh9L8VYkjCogv6C4/rzKSAeK/Y9OcVe4wmP+b9DLotKaO2EvMZ8bXwK8ClvfB
X-Received: by 2002:a17:90a:b88b:: with SMTP id o11mr340952pjr.42.1567758803670;
        Fri, 06 Sep 2019 01:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567758803; cv=none;
        d=google.com; s=arc-20160816;
        b=jIr5nUJ4n56HJ6h09BePaWlWtmuCSqzLRAEUuqSloBe5quOJJmR/PeaND5bCdw72SI
         Xhx78/KQiBGDUnWSrqpF1t7/JcqmdTqqpkzhFrTxjmUWmjvvCwKLjyxhm+Ho2m9aB0wk
         LwrFUR5LR7d9rNCjia/Iug2YQCB/OUccZUl3Lq80hzmiWtZC8bhAy03A0TrKDqGjkTRE
         JPQ5FDueDZOUELtU+11HFsbvf+sqiTiG2EpebVe/yH0Bpxydue8cyEM8GyOFngBVN9+F
         G91yOBy1YjAXlrlvfVCcwEWh01o1tM9htuvce5340LX9VnJUsmwTygR7Yis2M1YfgQpM
         ZmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=spTVW5Y07q9YJi1mXREDJ8rgkwJ0ETmXIUKHgob+/zA=;
        b=EeWwslC+3MN3CapG9/0nEHFX9uE8K8xEcBtrwkTpf5CRL3OMx+mR0Xmc1ZGhVJc4BX
         He3/u3S6SGYbzoOVVNz9Yf9qWEGojI2XtfzH7AXwnuanv5/c6bPFoVLt4ATvow9GAklV
         W//84TpkJ5C+ajQboZsiFUagXy9lg4X7EAswq0F2o0lk/rd43/NvcLQS79/E79+GbMq+
         zlGUDGX9Qs7frHR9czJN98Xir7TnYbqfUjCNwxwu7/DDLIzhJJAwu/zK9C6IPDdw/zn4
         BlUnMo0ZNpthmF9E4RW9uF0s7qdkE/6VEfSgM28ylPhWR971mj68A1T6LD54HB/qZweu
         4TlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id q7si4287305plr.352.2019.09.06.01.33.23;
        Fri, 06 Sep 2019 01:33:23 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388611AbfIFIdW (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 6 Sep 2019 04:33:22 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:46448 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388188AbfIFIdW (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 6 Sep 2019 04:33:22 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id AF3E2BC4DD8F5A5EE6DC;
        Fri,  6 Sep 2019 16:33:20 +0800 (CST)
Received: from HGHY1z004218071.china.huawei.com (10.177.29.32) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Fri, 6 Sep 2019 16:33:11 +0800
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
Subject: [PATCH v18 4/6] KVM: Move hwpoison page related functions into include/sysemu/kvm_int.h
Date:   Fri, 6 Sep 2019 16:31:50 +0800
Message-ID: <20190906083152.25716-5-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20190906083152.25716-1-zhengxiang9@huawei.com>
References: <20190906083152.25716-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.29.32]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: xOuQHx4h6y00

From: Dongjiu Geng <gengdongjiu@huawei.com>

kvm_hwpoison_page_add() and kvm_unpoison_all() will both be used by X86
and ARM platforms, so moving them into "include/sysemu/kvm_int.h" to
avoid duplicate code.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 accel/kvm/kvm-all.c      | 33 +++++++++++++++++++++++++++++++++
 include/sysemu/kvm_int.h | 23 +++++++++++++++++++++++
 target/arm/kvm.c         |  3 +++
 target/i386/kvm.c        | 34 ----------------------------------
 4 files changed, 59 insertions(+), 34 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b09bad0804..c6c052ba57 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -821,6 +821,39 @@ int kvm_vm_check_extension(KVMState *s, unsigned int extension)
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
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 72b2d1b3ae..3ad49f9a28 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -41,4 +41,27 @@ typedef struct KVMMemoryListener {
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
                                   AddressSpace *as, int as_id);
 
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
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b2eaa50b8d..3a110be7b8 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -20,6 +20,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_int.h"
+#include "sysemu/reset.h"
 #include "kvm_arm.h"
 #include "cpu.h"
 #include "trace.h"
@@ -195,6 +196,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
     cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
 
+    qemu_register_reset(kvm_unpoison_all, NULL);
+
     return 0;
 }
 
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 8023c679ea..4f9f3682ee 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -476,40 +476,6 @@ uint32_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
     return msr_data.entries[0].data;
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
-- 
2.19.1

