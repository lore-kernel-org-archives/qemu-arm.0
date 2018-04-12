Received: by 10.28.71.155 with SMTP id m27csp2119932wmi;
        Thu, 12 Apr 2018 09:41:58 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+tz0WhAgsrZazgzGa0alWoCBgKAw8nAYCt3QhgFBvoWyjGaCtXgEoy0GPXYMcQpCk/goDT
X-Received: by 10.55.104.79 with SMTP id d76mr2144518qkc.118.1523551318206;
        Thu, 12 Apr 2018 09:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523551318; cv=none;
        d=google.com; s=arc-20160816;
        b=QV9t2AiblGcseyyi7JX/P5raQsFqH8ITvo0RifOwR1onZv6N7G638/DnRaclnVdpqN
         VwjyMy3Q5YvM1RbVLv9ix1JmiI6Xqs5Z0WDSA/meCOQ6XtH+IS8X6D9c8epVvEY2MbEE
         YoJWN0h1V6pF9mH165CnQQEUV2ume7K0oX3zVtgzgHlwiCnM/FNAAMBO9uBrRBpNxVkG
         tSw53HyplHhHtJhrk9B051Ou3GamLLJXMtZnOX2XcIpxkqhEjQAMq0iViKIEKUrUVnS4
         cpODhGr374qLnBsI4GwDGxQwMvJzhlPXfiPAgSM6ZlacGXFgNJkOeYTMXARkD0AXzDJQ
         1vuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=mnYB32fSMcbrAOLzKnFiYeYCu9ptYUvmZRGH+G/6tLg=;
        b=Q+PzcsJTEzBuYHeS3lwzsnjzjQ+dCQuN1dUFqZhMX5nBmvOKYy2veqoyZl51s31Aka
         dSa2YBdknNgrEwqKJzWMVCjRST4NVunYqxgDGeTpIjt+/urf7UqzdSG1yL9PZGCzshHC
         EZhQj93k8DXj6+7qKYmJ9GZe1vNuSUEMSpPLAKWksHkpIizoCmV4StQqhG5zcVmJNNJF
         0ii8w26fO8UTYRBXISGJ/WzWE9fg3wGs3JkV0ZlF1JCTXio7YKhVRvzBlN4Fzl8CfMZa
         ttcjt0C/hjvQsI5nDGVveXCqIdWZ+VjVTKnXfc+pKCAwFmfoPiyNtEWl0N8T4vp3Fjok
         xMaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 142si3715495qkf.454.2018.04.12.09.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:41:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53483 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fIL-000499-IT
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:41:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f6fI5-00043m-0Q
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f6fI1-00014h-1n
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:41:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52856 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f6fI0-00013s-Si; Thu, 12 Apr 2018 12:41:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E50F8DC38;
	Thu, 12 Apr 2018 16:41:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B026810B00B2;
	Thu, 12 Apr 2018 16:41:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Apr 2018 18:40:18 +0200
Message-Id: <1523551221-11612-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
References: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 12 Apr 2018 16:41:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 12 Apr 2018 16:41:31 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH for-2.13 1/4] arm: reuse arm_boot_address_space()
 in armv7m_load_kernel()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sqY600CY1LGI

reduce code duplication by resusing arm_boot_address_space()

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/arm/arm.h |  2 ++
 hw/arm/armv7m.c      | 10 +---------
 hw/arm/boot.c        | 16 ++++++++--------
 3 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index ce769bd..188d18b 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -143,6 +143,8 @@ struct arm_boot_info {
  */
 void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info);
 
+AddressSpace *arm_boot_address_space(ARMCPU *cpu, bool secure_boot);
+
 /* Write a secure board setup routine with a dummy handler for SMCs */
 void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
                                             const struct arm_boot_info *info,
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index f123cc7..d372d9c 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -289,8 +289,6 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
     uint64_t lowaddr;
     int big_endian;
     AddressSpace *as;
-    int asidx;
-    CPUState *cs = CPU(cpu);
 
 #ifdef TARGET_WORDS_BIGENDIAN
     big_endian = 1;
@@ -303,13 +301,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
         exit(1);
     }
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
-        asidx = ARMASIdx_S;
-    } else {
-        asidx = ARMASIdx_NS;
-    }
-    as = cpu_get_address_space(cs, asidx);
-
+    as = arm_boot_address_space(cpu, true);
     if (kernel_filename) {
         image_size = load_elf_as(kernel_filename, NULL, NULL, &entry, &lowaddr,
                                  NULL, big_endian, EM_ARM, 1, 0, as);
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 26184bc..2f464ca 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -36,8 +36,7 @@
 #define ARM64_TEXT_OFFSET_OFFSET    8
 #define ARM64_MAGIC_OFFSET          56
 
-static AddressSpace *arm_boot_address_space(ARMCPU *cpu,
-                                            const struct arm_boot_info *info)
+AddressSpace *arm_boot_address_space(ARMCPU *cpu, bool secure_boot)
 {
     /* Return the address space to use for bootloader reads and writes.
      * We prefer the secure address space if the CPU has it and we're
@@ -46,7 +45,7 @@ static AddressSpace *arm_boot_address_space(ARMCPU *cpu,
     int asidx;
     CPUState *cs = CPU(cpu);
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_EL3) && info->secure_boot) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL3) && secure_boot) {
         asidx = ARMASIdx_S;
     } else {
         asidx = ARMASIdx_NS;
@@ -193,7 +192,7 @@ static void default_write_secondary(ARMCPU *cpu,
                                     const struct arm_boot_info *info)
 {
     uint32_t fixupcontext[FIXUP_MAX];
-    AddressSpace *as = arm_boot_address_space(cpu, info);
+    AddressSpace *as = arm_boot_address_space(cpu, info->secure_boot);
 
     fixupcontext[FIXUP_GIC_CPU_IF] = info->gic_cpu_if_addr;
     fixupcontext[FIXUP_BOOTREG] = info->smp_bootreg_addr;
@@ -211,7 +210,7 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
                                             const struct arm_boot_info *info,
                                             hwaddr mvbar_addr)
 {
-    AddressSpace *as = arm_boot_address_space(cpu, info);
+    AddressSpace *as = arm_boot_address_space(cpu, info->secure_boot);
     int n;
     uint32_t mvbar_blob[] = {
         /* mvbar_addr: secure monitor vectors
@@ -262,7 +261,7 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
 static void default_reset_secondary(ARMCPU *cpu,
                                     const struct arm_boot_info *info)
 {
-    AddressSpace *as = arm_boot_address_space(cpu, info);
+    AddressSpace *as = arm_boot_address_space(cpu, info->secure_boot);
     CPUState *cs = CPU(cpu);
 
     address_space_stl_notdirty(as, info->smp_bootreg_addr,
@@ -753,7 +752,8 @@ static void do_cpu_reset(void *opaque)
             }
 
             if (cs == first_cpu) {
-                AddressSpace *as = arm_boot_address_space(cpu, info);
+                AddressSpace *as =
+                    arm_boot_address_space(cpu, info->secure_boot);
 
                 cpu_set_pc(cs, info->loader_start);
 
@@ -950,7 +950,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
     ARMCPU *cpu = n->cpu;
     struct arm_boot_info *info =
         container_of(n, struct arm_boot_info, load_kernel_notifier);
-    AddressSpace *as = arm_boot_address_space(cpu, info);
+    AddressSpace *as = arm_boot_address_space(cpu, info->secure_boot);
 
     /* The board code is not supposed to set secure_board_setup unless
      * running its code in secure mode is actually possible, and KVM
-- 
2.7.4

