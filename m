Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3199384wrw;
        Thu, 8 Nov 2018 02:18:54 -0800 (PST)
X-Google-Smtp-Source: AJdET5f6G5gfDFg0EmXKGbni6kkD2k50RysnpkwqLzm46p0fcm4DK9ljGVJBlq5sDcZrXebGRGYZ
X-Received: by 2002:aa7:828a:: with SMTP id s10-v6mr3893243pfm.63.1541672334687;
        Thu, 08 Nov 2018 02:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541672334; cv=none;
        d=google.com; s=arc-20160816;
        b=GQxk9OLuYTN3gJkqvZUEf0IuvKqgE1uN2PfdVs9er//AONwglcd7U2VBXHkYhClApG
         odOaLkUCaJGVwb/Ekbal/AvSRDh9yytJSQXj3kdZp9QX6ReFl9961QXGoOoAqN+CS2jP
         qqmjU8eEYCxfcagqg8Lq6BGW3KcB1Hs2P1qvGGWCTsqPBtRsPvLQaxx/hhzwDkf9yAUp
         LDimDIxsD01VrnqkyG2Ztxlp8YaHNYtg2+M3dbwsREvwDi9qjHR7623ZpBQYuF8nHqBI
         /g8j+OJLdhuJGo3c+npTUQvFjKfO5drUgWu/vWE6m97qchVEsITAGq78JWPqJtfjydfK
         xihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=ze/E6vpsWu53hx3/YnqiURjYsvhBvAQwyM+AHdMdWFY=;
        b=NLSwWvOjyl+M9rxhvGhY56p8CBNUzXrKk7QIskZeVl5npxcxmeOTEofK0cGgtbsx6I
         NUvj2ad3zquWguTEEctr0TcjfyNKy/P5vm7l66jnL/dpYSiFi5LXWjis3G94qwCY6tHm
         zHqgZIL6+87seoyPFV5KFIpyGwCr9NGpydryCL0oCAXinXkDqtq48xANiHbUwwO0OCCW
         gct5ZCKjfpJlMqJTZ0GwZfwdi8bBLggZbYpdc6vmRcdDdYvRIVmBf7k39unUJbREKINB
         Ua9WkF7TjjY+3ttOwogUp6IL0jrwX4dUcO9McKL6FBHxFf93Y5nienZSH1iFDcq2289a
         fiRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v26-v6si3400052pge.101.2018.11.08.02.18.54;
        Thu, 08 Nov 2018 02:18:54 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbeKHTxi (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 8 Nov 2018 14:53:38 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:14623 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727081AbeKHTxd (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 8 Nov 2018 14:53:33 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 5A4B2C76C138A;
        Thu,  8 Nov 2018 18:18:44 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.408.0; Thu, 8 Nov 2018 18:18:36 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <shannon.zhaosl@gmail.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH v15 07/10] KVM: Move related hwpoison page functions to accel/kvm/ folder
Date:   Thu, 8 Nov 2018 02:15:50 -0800
Message-ID: <1541672153-15529-8-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541672153-15529-1-git-send-email-gengdongjiu@huawei.com>
References: <1541672153-15529-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 0YS98l7QK8gp

kvm_hwpoison_page_add() and kvm_unpoison_all() will be used both
by X86 and ARM platforms, so move these functions to a common
accel/kvm/ folder to avoid duplicate code.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Address Peter's comments to move related hwpoison page function to
accel/kvm folder in [1]
Address Paolo's comments to move HWPoisonPage definition back to
accel/kvm/kvm-all.c

[1]:
https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00077.html
https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00152.html
---
 accel/kvm/kvm-all.c     | 33 +++++++++++++++++++++++++++++++++
 include/exec/ram_addr.h |  5 +++++
 target/i386/kvm.c       | 33 ---------------------------------
 3 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4880a05..003deac 100644
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
index 9ecd911..1e02fb9 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -115,6 +115,11 @@ void qemu_ram_free(RAMBlock *block);
 
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
 
+/* Add a poisoned page to the list */
+void kvm_hwpoison_page_add(ram_addr_t ram_addr);
+/* Free and remove all the poisoned pages in the list */
+void kvm_unpoison_all(void *param);
+
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 796a049..08b3feb 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -457,39 +457,6 @@ uint32_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
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
