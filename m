Received: by 10.223.134.117 with SMTP id 50csp5137307wrw;
        Wed, 27 Dec 2017 21:28:18 -0800 (PST)
X-Google-Smtp-Source: ACJfBotz9VQCrMRIk7nvhm5+pPSLx4nYKyQqL2n0U4ayEw6w5+ejGEpPNel/c+ey7HIR6PDHwD/K
X-Received: by 10.84.235.11 with SMTP id o11mr30773429plk.5.1514438897988;
        Wed, 27 Dec 2017 21:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514438897; cv=none;
        d=google.com; s=arc-20160816;
        b=hEkDDmKfdu48SpvPZCLF5G8lcxQevXqx3U+e6y98r5YzgvBfI/C1B7BotfBykWKPdM
         3KU9pYwLUAKn3p9nj/Hm0dHCrw9kMEIfUjM4ck4jJJ8xgk60e7ftN9CjRd3VxEi7HOzJ
         AMLro9s/9LKZo18bHM0NuXcS5gKZbgyRNArrHSXLcrhDGEP+YRf+d3h9HlDDjDWXTpY2
         vsfnopJHeATcL+fveXdN1Id65FE1pcTUkV1fwpZCL92jXLW87bNs5z5ccq/rb9K1WceU
         lA+GMTm8XltR2PvfmqFX3/jLZXrvCaHr48kJcEttxQEDIJ3TDTRCdZjMNOYxyyohoQrj
         BwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=hPmlNZfuRrdLGcJ9mtG6jSq6Fxd9gWBl1328VQsXKxo=;
        b=C7oi2na1BpVBnACsHiTYG72jPQzyUh3bDPgziVy6M7D2TY/5rVwVQHvmnmG2uxIB5Y
         HDfDo6Fy6Bvl0p7C/i0OZGOu0wXu/Z5lCpEWIcWHcv4WVRsNV21LOrRCIwe3PYTBogEF
         GSFMZb9NhCSV4DxDJGMpx9KTMEg4bp/kS5pcDLJajl93ku9pdVhlR80+lZjgHk8lY7l6
         aPAxdgVtfQXQJ/evSMDM+aVVbhilh5FygAfPZVg5L8a9hr4x65lTw/+Oltwsb+JARHgn
         j3UnSMrO4Lg2wm4VZMNODM0kPSInvPlVXszDImvqfPPIAU/El0X/UPKYlGfxaRL2oZwV
         tEWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d17si23639783pge.93.2017.12.27.21.28.17;
        Wed, 27 Dec 2017 21:28:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751167AbdL1F2P (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 28 Dec 2017 00:28:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3183 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751351AbdL1F1v (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 00:27:51 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 2CB0C5C1DB1EA;
        Thu, 28 Dec 2017 13:27:38 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.361.1; Thu, 28 Dec 2017 13:27:33 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>,
        <zhengqiang10@huawei.com>, <xuwei5@hisilicon.com>
Subject: [PATCH v14 9/9] target-arm: kvm64: handle SIGBUS signal from kernel or KVM
Date:   Thu, 28 Dec 2017 13:54:18 +0800
Message-ID: <1514440458-10515-10-git-send-email-gengdongjiu@huawei.com>
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
X-TUID: yMUcrHp3wGJo

Add SIGBUS signal handler. In this handler, it checks the SIGBUS type,
translates the host VA which is delivered by host to guest PA, then fill
this PA to CPER and fill the CPER to guest APEI GHES memory, finally
notify guest according to the SIGBUS type. There are two kinds of SIGBUS
that QEMU needs to handle, which are BUS_MCEERR_AO and BUS_MCEERR_AR.

If guest accesses the poisoned memory, it generates Synchronous External
Abort(SEA). Then host kernel gets an APEI notification and call memory_failure()
to unmapped the affected page from the guest's stage2, and SIGBUS_MCEERR_AO
is delivered to Qemu's main thread. If Qemu receives this SIGBUS, it will
create a new CPER and add it to guest APEI GHES memory, then notify the
guest with a GPIO-Signal notification.

When guest hits a PG_hwpoison page, it will trap to KVM as stage2 fault, then a
SIGBUS_MCEERR_AR synchronous signal is delivered to Qemu, Qemu record this error
into guest APEI GHES memory and notify guest using Synchronous-External-Abort(SEA).

Suggested-by: James Morse <james.morse@arm.com>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
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
index 7c17f0d..9d25f51 100644
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
index c00450d..6955d85 100644
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
 
@@ -944,6 +947,37 @@ int kvm_arch_get_registers(CPUState *cs)
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
+                ghes_record_errors(ACPI_HEST_NOTIFY_SEA, paddr);
+                kvm_inject_arm_sea(c);
+            } else if (code == BUS_MCEERR_AO) {
+                ghes_record_errors(ACPI_HEST_NOTIFY_GPIO, paddr);
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
