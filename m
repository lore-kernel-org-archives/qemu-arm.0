Received: by 10.223.134.117 with SMTP id 50csp5137192wrw;
        Wed, 27 Dec 2017 21:28:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBotQ4clvgcpQqkb9CtpbErTaBixvCHDIMzKrSuPTZmlTKnDad3Iz8uBXYaBLg3L2SUJ2T/Tz
X-Received: by 10.99.39.1 with SMTP id n1mr15043163pgn.373.1514438890800;
        Wed, 27 Dec 2017 21:28:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514438890; cv=none;
        d=google.com; s=arc-20160816;
        b=wvbN3zUXg+e9ahT5egmOgBUixU6o1YqJPWDtIV/5EH8fY1T4JPNnm4CBc8S3uOJgGn
         btjlP0x4TUdLRPF0wOe0qeDzcbkqK9QoAYfW0+/XqFVZXAgtFMrr6HrCvuiTMitIt9mC
         WbRbP3n5ZI7ZQbewKvxe5ax/Nm2b3fHiP4A2Ro64x+RlfeTED3dRa/cmidMj7IzNalap
         6Pu8VgHI98BI7EPr3kaETmkfXq8GNMgMIO/4k4UvieRBv/3RLXlKYeDZ7z7jyG/hh2X8
         1bAJpvjx2pQOHqN9H7tXmz/LL6W6wvafhz5kyp3UNlEJGGqF/7lfcmEM/SImZft8Z2Ea
         JhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=29XCnIr5PGIemVx5GiLtC6QNTdXRcPNTyhy4v4ssFh8=;
        b=yveNjMK4a2rIYPEIoVcYWVo8C58t6MhPoKdBMYeCV1g4C8++RealcPiFrJHkiufqUp
         jt02n18IOky1bS4UzVpCa81JFlVPo7Anyy8pDhVBxXBkllUxqrthtAW/ky26ndQb+rUs
         GcWFuHqAPDbbHacTzASJ2tmPlwUIWKgs/7KX5VMIy0ZbvZ4SqRKN90bEqhOvquZfNj2s
         tz3WSbaT8DUxC5+7j2Ls4AaMLe9M5HgVqtACGef99L7ExHUiO0As/+p5qBFgUHIgOOLK
         DiANMEoK4RvvzhAGPit2yr1K038s9hhig+1TZEHcdycHz/a4UwdiBY6e1Xc40CCX9YBe
         dMsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d17si23639783pge.93.2017.12.27.21.28.10;
        Wed, 27 Dec 2017 21:28:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751365AbdL1F1w (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 28 Dec 2017 00:27:52 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3182 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751353AbdL1F1v (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 00:27:51 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 1AA0BC9C8AF3A;
        Thu, 28 Dec 2017 13:27:38 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.361.1; Thu, 28 Dec 2017 13:27:31 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>,
        <zhengqiang10@huawei.com>, <xuwei5@hisilicon.com>
Subject: [PATCH v14 6/9] Move related hwpoison page functions to accel/kvm/ folder
Date:   Thu, 28 Dec 2017 13:54:15 +0800
Message-ID: <1514440458-10515-7-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: JA4lsg/e8nmE

kvm_hwpoison_page_add() and kvm_unpoison_all() will be used both
by X86 and ARM platforms, so move these functions to a common
accel/kvm/ folder to avoid duplicate code.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Address Peter's comments to move related hwpoison page function to accel/kvm folder in [1]
Address Paolo's comments to move HWPoisonPage definition back to accel/kvm/kvm-all.c

[1]:
https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00077.html
https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00152.html
---
 accel/kvm/kvm-all.c     | 33 +++++++++++++++++++++++++++++++++
 include/exec/ram_addr.h |  5 +++++
 target/i386/kvm.c       | 33 ---------------------------------
 3 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 46ce479..2412ea6 100644
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
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index d017639..41d9c37 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -80,6 +80,11 @@ void qemu_ram_free(RAMBlock *block);
 
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
 
+/* Add a poisoned page to the list */
+void kvm_hwpoison_page_add(ram_addr_t ram_addr);
+/* Free and remove all the poisoned pages in the list */
+void kvm_unpoison_all(void *param);
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
