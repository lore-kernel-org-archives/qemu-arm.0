Received: by 10.223.159.82 with SMTP id f18csp507447wrg;
        Tue, 21 Nov 2017 02:32:24 -0800 (PST)
X-Google-Smtp-Source: AGs4zMao7fyND1B2UaAi0zpogvnkGwfkHqEc5PVaSvh09tXwJSAi7ZfvLWBW7PnuN6EBCwP/iXGf
X-Received: by 10.98.58.29 with SMTP id h29mr14779965pfa.121.1511260344006;
        Tue, 21 Nov 2017 02:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511260344; cv=none;
        d=google.com; s=arc-20160816;
        b=DgwrK/lk0PVH8ODi24DwfP5yWgI/e5zZ+EtF09zW5T/BtcWHEiYOjnb0oTQU/IBxx3
         uNMAp8jXqBEkVvia9DozdVZOCys4xS06V0o3GwVPJ9nXL5F3oD5lk9ZG+unOJtPP7OKf
         C+0Gh4/4iyjAVgFVe9YzZpHVO5u/fchHrZO3CZtjbZGUuvIkgm1QvCJme/Fldxw4OObP
         Y7MQ/0z0t1zek4wYGBiY7tJ9CYTRyICW9T6Wwo7dIR3uaPktGH4ekrvq/7SAnGJxLahR
         hsUF/rN3CFsXXnSqQP3EpNBceVwKS/gaCh8ErNVhGbpmoL/hP4X4C9ywwAxYD+aZn6e1
         lFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=2cgeNLjg+8a20J0ecX+kxeHIkCHmiqL5OCo/X2bFSBc=;
        b=kk1ycIkmzJLrpP+Bi+s9zjOG0hxnhF2hDuQBkh5tTD1CSD93P57lmPGwhzdi3tTiKm
         ur+Ln6uFdOaCDxgp9obRg71iwuHvMW6LYdhH2SemvWUkhBETzyKnrQU7343AkMl+cwOg
         SCy3gdg9bu77dLW/U7zvolXEQaMsJfPfAewjAjIQfu9ph0fyvEtFRGwCi9zM1wfzIMUO
         Akh0GZJ0Ts/3LMMD/X8G91KCebzSzjMeh/EuWLt2J2cU0x0jYs9qsVJfMz3uEWj5R3JQ
         /8vWXmgYr9kokWcDJVV/4hD59tOGCusWPx+E/8VGUHvfCU9TZnxAl3CP5fSH5xKcx3y4
         Rq5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 1si10611141pla.339.2017.11.21.02.32.23;
        Tue, 21 Nov 2017 02:32:23 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752093AbdKUKcT (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 21 Nov 2017 05:32:19 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10967 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751993AbdKUKby (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 21 Nov 2017 05:31:54 -0500
Received: from 172.30.72.58 (EHLO DGGEMS402-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLG39787;
        Tue, 21 Nov 2017 18:31:45 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.361.1; Tue, 21 Nov 2017 18:31:38 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <dingtianhong@huawei.com>, <wangxiongfeng2@huawei.com>
CC:     <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v12 09/12] Move related hwpoison page function to accel/kvm/ folder
Date:   Wed, 22 Nov 2017 02:37:11 +0800
Message-ID: <1511289434-1551-10-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
References: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A020203.5A140091.00DC,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8e88f011ff6d64d98315b1a55457027d
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: NhNZcf++Lmh3

kvm_hwpoison_page_add() and kvm_unpoison_all() will be used
by both X86 and ARM platforms, so move them to a common accel/kvm/
folder to avoid duplicate code.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Address Peter's comments to move related hwpoison page function to accel/kvm folder in [1]
Address Paolo's comments to move HWPoisonPage definition back to accel/kvm/kvm-all.c

[1]:
https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00077.html
https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00152.html
---
 accel/kvm/kvm-all.c     | 34 ++++++++++++++++++++++++++++++++++
 include/exec/ram_addr.h |  5 +++++
 target/i386/kvm.c       | 33 ---------------------------------
 3 files changed, 39 insertions(+), 33 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 46ce479..98ac06c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -564,6 +564,39 @@ int kvm_vm_check_extension(KVMState *s, unsigned int extension)
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
@@ -2279,6 +2312,7 @@ bool kvm_arm_supports_user_irq(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_USER_IRQ);
 }
 
+
 #ifdef KVM_CAP_SET_GUEST_DEBUG
 struct kvm_sw_breakpoint *kvm_find_sw_breakpoint(CPUState *cpu,
                                                  target_ulong pc)
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index d017639..2a25315 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -80,6 +80,11 @@ void qemu_ram_free(RAMBlock *block);
 
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
