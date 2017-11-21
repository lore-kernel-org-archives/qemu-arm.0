Received: by 10.223.159.82 with SMTP id f18csp507241wrg;
        Tue, 21 Nov 2017 02:32:10 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ1zuL4KcsqbqZkpN55hKB90/FBiT6bEbXJVUzFK4q6H8L5ImkhI5mjgB0FjhUZgRz73M7d
X-Received: by 10.101.102.66 with SMTP id z2mr5214340pgv.352.1511260330307;
        Tue, 21 Nov 2017 02:32:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511260330; cv=none;
        d=google.com; s=arc-20160816;
        b=UAeJEAsshgKyqMkiYa4MvjWkShGvmuWLDvEFZVGVR8dWl5VgnoEiyGuMA8SmqwLBZt
         4iA6MY8rXNl/yvmhZu5L5zffjk1Xm1CUIZO+mtmQI0k/y1GzRzuGpJDmjVTO797Pvqm2
         CowrhuICid+XHRePUtaKlJX9lm21CC/RmLBqu6v3+B1yQKe9pN/kB6bnQ200d0wfgUYn
         KVB4jvAaHi6RIHPoZBqQOgI0JhhpV+UpWu2p0sg1b2XOW2oGUvQDWS+OhDC+D6OKnPJT
         t83Vlv8OD6OfgSmrql4L6XFFCEFrdSRB0vcKFX75dMe00qm7uSyWrNf4Ba+/vfuZwDP2
         vawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=2Hx7vQzokTGeS9+sQ0cILZ8JVx1MEVkZiS5cRlLCqWQ=;
        b=TYFfQ6z9FTAaaKmkh8ltenaTi+JGPBEu9tGbTm4EUKBjXT+pBhb4HKLzb8oZaNa9vY
         OT7V6Rznn9CZtJALamLq7jzYDP9AePd+KRICoxrcq+lFQ2PCgTKslwy9WLg0Acraz+xN
         fzNHQVpMx47ubjvQABS1N1LbyQyUmhUTb+nHPUexcryFwJK0/QwGHubIK8eJ0Zu3+CEl
         UblZ0IoLyrPZuk52x78vD8rpO9qUlP5nOtUlvM4NYz2tHCnm3jeyr6amrjI8bTRJqUc7
         Z5j505w5cD0uHvE8SZSHNdJsIQgXNjAJHwIkhJWMqrJKTjT01Wu0yBir819F4UPlY1s7
         DcZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 1si10611141pla.339.2017.11.21.02.32.10;
        Tue, 21 Nov 2017 02:32:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751941AbdKUKcI (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 21 Nov 2017 05:32:08 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10974 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751988AbdKUKcC (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 21 Nov 2017 05:32:02 -0500
Received: from 172.30.72.58 (EHLO DGGEMS402-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLG39805;
        Tue, 21 Nov 2017 18:31:50 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.361.1; Tue, 21 Nov 2017 18:31:41 +0800
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
Subject: [PATCH RESEND v12 12/12] target-arm: kvm64: handle SIGBUS signal from kernel or KVM
Date:   Wed, 22 Nov 2017 02:37:14 +0800
Message-ID: <1511289434-1551-13-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
References: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090204.5A140096.00ED,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f11f068945190996499beb981d1d6fed
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 2yBYS19izq0c

Add SIGBUS signal handler. In this handler, it checks the SIGBUS type,
translate the host VA which is delivered by host to guest PA, then fill
this PA to CPER and fill the CPER to guest APEI GHES memory, finally
notify guest according the SIGBUS type. There are two kinds of SIGBUS
that QEMU need to handle, which are BUS_MCEERR_AO and BUS_MCEERR_AR.

Guest access device type poisoned memory, generate SError interrupt,
so it reports it to host firmware. Host kernel gets an APEI notification
and memory_failure() causes the affected page to be unmapped from the
guest's stage2, and SIGBUS_MCEERR_AO is sent to user-space. Here Qemu
will create a new CPER and add it to guest APEI GHES memory, and notify the
guest with a GPIO-Signal notification.

When guest hit a PG_hwpoison page, it will trap to KVM as stage2 fault,
here a SIGBUS_MCEERR_AR synchronous signal is delivered to user-space,
Qemu record this error into guest APEI GHES memory and notify guest using
Synchronous-External-Abort(SEA).

Suggested-by: James Morse <james.morse@arm.com>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Quanming Wu <wuquanming@huawei.com>
---
Address James's comments to record CPER and notify guest for SIGBUS signal handling.
Shown some discussion in [1].

[1]:
https://lkml.org/lkml/2017/2/27/246
https://lkml.org/lkml/2017/9/14/241
https://lkml.org/lkml/2017/9/22/499
---
 include/sysemu/kvm.h |  2 +-
 target/arm/kvm.c     |  2 ++
 target/arm/kvm64.c   | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 3a458f5..90c1605 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -361,7 +361,7 @@ bool kvm_vcpu_id_is_valid(int vcpu_id);
 /* Returns VCPU ID to be used on KVM_CREATE_VCPU ioctl() */
 unsigned long kvm_arch_vcpu_id(CPUState *cpu);
 
-#ifdef TARGET_I386
+#if defined(TARGET_I386) || defined(TARGET_AARCH64)
 #define KVM_HAVE_MCE_INJECTION 1
 void kvm_arch_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d85e36a..8523158 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -26,6 +26,7 @@
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
+#include "exec/ram_addr.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
@@ -182,6 +183,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
     cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
 
+    qemu_register_reset(kvm_unpoison_all, NULL);
     type_register_static(&host_arm_cpu_type_info);
 
     return 0;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 7f662e9..d83863d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -27,6 +27,9 @@
 #include "kvm_arm.h"
 #include "internals.h"
 #include "hw/arm/arm.h"
+#include "exec/ram_addr.h"
+#include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/hest_ghes.h"
 
 static bool have_guest_debug;
 
@@ -943,6 +946,37 @@ int kvm_arch_get_registers(CPUState *cs)
     return ret;
 }
 
+void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
+{
+    ram_addr_t ram_addr;
+    hwaddr paddr;
+
+    assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
+    if (addr) {
+        ram_addr = qemu_ram_addr_from_host(addr);
+        if (ram_addr != RAM_ADDR_INVALID &&
+            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
+            kvm_hwpoison_page_add(ram_addr);
+            if (code == BUS_MCEERR_AR) {
+                kvm_cpu_synchronize_state(c);
+                ghes_update_guest(ACPI_HEST_NOTIFY_SEA, paddr);
+                kvm_inject_arm_sea(c);
+            } else if (code == BUS_MCEERR_AO) {
+                ghes_update_guest(ACPI_HEST_NOTIFY_GPIO, paddr);
+                qemu_hardware_error_notify();
+            }
+            return;
+        }
+        fprintf(stderr, "Hardware memory error for memory used by "
+                "QEMU itself instead of guest system!\n");
+    }
+
+    if (code == BUS_MCEERR_AR) {
+        fprintf(stderr, "Hardware memory error!\n");
+        exit(1);
+    }
+}
+
 /* C6.6.29 BRK instruction */
 static const uint32_t brk_insn = 0xd4200000;
 
-- 
1.8.3.1
