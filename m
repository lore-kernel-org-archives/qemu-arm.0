Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3210424wrw;
        Thu, 8 Nov 2018 02:32:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5f3mPkQePx7spXTb9yzwj+Dnp0UNuMISNUjDJOKKD2BvAz21tSmFN1bKeljKz48Odr+6vbw
X-Received: by 2002:a17:902:29e3:: with SMTP id h90-v6mr4058957plb.158.1541673170609;
        Thu, 08 Nov 2018 02:32:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541673170; cv=none;
        d=google.com; s=arc-20160816;
        b=u8yJKOkNIee8yqazTWN5S5G9jUQtnBDRcRdwbTqafpGTmy9fDpfsjDkgPJJ5x53WW6
         2x5fgzB/C6/1Qp7uCxNjdMHoxdO+xp/y/ja6pXcNbVo3PDaO1soTD0rY05O+esJ62kHb
         lV1pfxHIqaJrtaDuzIw/rZRJ6TriH5vrZiT5qReeV9uxyk4R36mNzV4lzOBkkb3QFUfE
         vzk1FqxLu5V2UCWMi7cIHrNP8T2sG4oKYAJqOJ6k0/K+EmUu1VTv89DJQobkRaX4Jush
         Z31HYuUdYN/n02+spnoUdeBX8h99CXhlDZGxEV7FVHLiFdwK33+1+Oj7qZs24IRE2PSo
         wlXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=KTEWe1Vex7c8TedMPilDro560EOdW2C5EHdqbNliJzU=;
        b=LusUSrn26OBJBTCYctyK1JwPs8nOMoQteUorgwnh9LmGoIvuSkVrcJ2h6yAp5YQzEn
         SB+UYxU1UbSfH3Jws1oSI4iSZj3QmP1HkSsb0RAZuVYYhBBH8NlIkQaL01MzeaG53At/
         tITbqnFgBgY4SI3lmP87CaOlWzdJ++D24FPzL++PqgxbOa93uQoHXm0mAet42Gmou2ge
         nU+MrLITtqgcNU3L1AMD+PwNGIcbu2gy3kt918qmlYX6tV+cI7bCRniy781ejTFSmNdU
         EMmlvwT4kJyjX0gOTMfgk1+E0co6JS9cnZNWRTE/64ytbh9nFNBwHa1VJeBXV5EwBosR
         rXqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a4-v6si4090403pln.67.2018.11.08.02.32.50;
        Thu, 08 Nov 2018 02:32:50 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbeKHUHh (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 8 Nov 2018 15:07:37 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:38303 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727074AbeKHUHe (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 8 Nov 2018 15:07:34 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 288591C0281A;
        Thu,  8 Nov 2018 18:32:41 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.408.0; Thu, 8 Nov 2018 18:32:33 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <peter.maydell@linaro.org>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <james.morse@arm.com>,
        <pbonzini@redhat.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <zhengxiang9@huawei.com>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <shannon.zhaosl@gmail.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v15 07/10] KVM: Move related hwpoison page functions to accel/kvm/ folder
Date:   Thu, 8 Nov 2018 02:29:46 -0800
Message-ID: <1541672989-15967-8-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com>
References: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 9hA/ErwQw3rF

kvm_hwpoison_page_add() and kvm_unpoison_all() will be used both
by X86 and ARM platforms, so move these functions to a common
accel/kvm/ folder to avoid duplicate code.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
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
