Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5055411lfp;
        Mon, 17 Feb 2020 05:10:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxhLTl20tXVgFCz6eglkkkaXIjwJyB+vPX9JMSddaMEx59FHQv04Bz628hXv+5bTq874jMb
X-Received: by 2002:aca:2b04:: with SMTP id i4mr9976177oik.21.1581945046522;
        Mon, 17 Feb 2020 05:10:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581945046; cv=none;
        d=google.com; s=arc-20160816;
        b=nR1DoHynV0unEUw+kgLNKoMooOYp7QWR5KAWFawbvg+DyoDo5w3nrdjw3z3WmHbY4k
         eRylCIAJrc3f777kObN+ON70KlpTpf84RZQBqJnsmFhTlee48XpBqkQpSQEt/oYGO3lu
         N8Kc6EudB3NiE+5PDOjKrJzTcc+oMJ/y5F8LKy/RbKqfC2B7LTz0xwiGAFEpU+NV/MQV
         DpjhfN4KvTRj9kxG1Ov2ZSrai/1Ekep4NYxV6VwsuA/ycjx5eeFsDcY4vpU4vhb7flcP
         DQyKDtuFQuUaVhrZQ99fuH4MTQBSHIQ/ZEHxmg5IXQbrRsiMFv441jRlzFw/4G3yovOi
         E/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/OikOW2EZBy/rpbBvfVUxHKDoAAwHL/Awty2oz4GFaU=;
        b=JgqTSQZ2VW2VRUyR689+BRJCt56VloKjGSjcHBYlADl8J1IQ+So9JffsICfS6c/cKd
         T5EQjaNxKxQK0MpFdwboXYvDYIkx0bzNPBs+H+eBGYOtR9mE6QW2VHbwPc7ZgF9usB4P
         vws2yFsSLjFCmCqUYi3q5siGdjX2LHijpCm1iFEVnl4jodixhNvou0GoLnnsWu/viiAl
         vUK5Z/780CY46YKlSTRh1rPhtmw9MQ78XFJ9BlWvRYfmpECw5UbRbveTIc93s3nMfWjK
         iMNJmYk5qNzpx6dvzvNtR2dN1ua3WNd2GkvLkP8EDhAqj+YfZBQntw8ie18yo1s+FZmS
         cTpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b10si5923172oic.153.2020.02.17.05.10.45;
        Mon, 17 Feb 2020 05:10:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgBQNKp (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 17 Feb 2020 08:10:45 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10190 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728115AbgBQNKo (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 17 Feb 2020 08:10:44 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 3EF6B9E96DA157B9BC9A;
        Mon, 17 Feb 2020 21:10:41 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 21:10:34 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <mst@redhat.com>, <imammedo@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <shannon.zhaosl@gmail.com>,
        <peter.maydell@linaro.org>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>,
        <james.morse@arm.com>, <lersek@redhat.com>,
        <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>
Subject: [PATCH v24 07/10] KVM: Move hwpoison page related functions into kvm-all.c
Date:   Mon, 17 Feb 2020 21:12:45 +0800
Message-ID: <20200217131248.28273-8-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200217131248.28273-1-gengdongjiu@huawei.com>
References: <20200217131248.28273-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: j7YXZ2jYgeH8

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
index c111312..fc4285e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -44,6 +44,7 @@
 #include "qapi/visitor.h"
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-visit-common.h"
+#include "sysemu/reset.h"
 
 #include "hw/boards.h"
 
@@ -873,6 +874,39 @@ int kvm_vm_check_extension(KVMState *s, unsigned int extension)
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
@@ -2075,6 +2109,8 @@ static int kvm_init(MachineState *ms)
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
index 69eb43d..b8bd979 100644
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
@@ -525,40 +524,6 @@ uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
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
@@ -2169,7 +2134,6 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         fprintf(stderr, "e820_add_entry() table is full\n");
         return ret;
     }
-    qemu_register_reset(kvm_unpoison_all, NULL);
 
     shadow_mem = object_property_get_int(OBJECT(s), "kvm-shadow-mem", &error_abort);
     if (shadow_mem != -1) {
-- 
1.8.3.1
