Received: by 10.223.159.82 with SMTP id f18csp1393291wrg;
        Mon, 27 Nov 2017 02:44:46 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYNopHgzz7rQ10NJSn1tCQq08FsRzNZdLpYyAinq2bS4Plboj21rMCdb0MqvNiRSmVgQwGu
X-Received: by 10.84.252.4 with SMTP id x4mr36222242pll.99.1511779486498;
        Mon, 27 Nov 2017 02:44:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511779486; cv=none;
        d=google.com; s=arc-20160816;
        b=suWrJu+DzyJfjRZr0eigTizULFSmXGkZ4sA15A4YucE3A2u+LzQpKDQjLjM/4vSWcD
         HfiTAvQeBa6LZLp25XEpztZ4Rb4iI49pKqL4fKPKUjOuCVN+BEvlth6BlQQ9y/NK3ybA
         O5DEQ7ZgrdmBE1bS7KkBS0NFRR1xXPz4OAvP1zqMJGvtO5I0wLZ43ThCwm7/BZnITwbA
         06OVHtuhmFDMtBvjtPLIMbloG3rryDXke9sGoHx9xZYWtuVSeGYAN+lbojtZOX0IMEhQ
         JFu9N2ronsSNe6wzjUD2CXfNMmn6v+SNWLbvFZPCw0cKGfRDqKau/CnzgEeiBcFppPTA
         d4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=2cgeNLjg+8a20J0ecX+kxeHIkCHmiqL5OCo/X2bFSBc=;
        b=ylWsyRAQ327EukaG+2PkHc9GAQNw8DExu50UfydINRmy+O1LPHUuDHUMIwllcQKSSb
         +Quy6oSupUij415tYix6SOP+2I3/COCCNvhLqv84Xq8NrscfdJqDcT6j6NpP990TUTHs
         LsTDS0gvg67hY7BlIVe3YOOfwmiaSep6YVtgffSFtoqTXAJCdmUFB1h6hE3TeV4SLL98
         u23MHsSSRmJCNwe+D8B38aUJno+DyS5Y7d3A5VuAt9z1j/CDOBNblmuqb6G2VoNJjlEo
         iN00Z1flUtkCLJQVNUjpq7FV3kLXn4ChvVB4h+IMrpgBhbkORzRKnVgdb3YBGF+Sccx+
         QuHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t11si23462099plq.683.2017.11.27.02.44.46;
        Mon, 27 Nov 2017 02:44:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751749AbdK0Koo (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Mon, 27 Nov 2017 05:44:44 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11433 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751733AbdK0Kok (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 27 Nov 2017 05:44:40 -0500
Received: from 172.30.72.59 (EHLO DGGEMS411-HUB.china.huawei.com) ([172.30.72.59])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLN07708;
        Mon, 27 Nov 2017 18:44:33 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.361.1; Mon, 27 Nov 2017 18:44:23 +0800
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
Subject: [PATCH v13 09/12] Move related hwpoison page function to accel/kvm/ folder
Date:   Tue, 28 Nov 2017 02:49:52 +0800
Message-ID: <1511808595-24158-10-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
References: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A0B0203.5A1BEC92.0068,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7e42aaf8394918da22ef0f10f30b6933
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: osx50mxVpbvd

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
