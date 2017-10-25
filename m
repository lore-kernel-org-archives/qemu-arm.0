Received: by 10.223.161.27 with SMTP id o27csp130162wro;
        Wed, 25 Oct 2017 16:28:36 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SOkJoRNnk0SnIm7w1hHdfC+gKUHA6hTQvB6xqab10eRm9uAGXZQRUVlBgefu8hhiY/Na5y
X-Received: by 10.37.18.67 with SMTP id 64mr2303544ybs.411.1508974116506;
        Wed, 25 Oct 2017 16:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508974116; cv=none;
        d=google.com; s=arc-20160816;
        b=rkUdRH2x/F6V9jXU4a5fy629KF1wdZ/i6UblJKmqs+g6aTeHH7H1j96Vmhk7FXZ+Fs
         MK26dz4X2S+x0RMbpP/UvWVamG8zhxrYbvPT8DdY1IXRhJJdlPChIcLhQZodI/DPns55
         HLKkGnwocVHgrGikLXwTPgyM5C/6yE0Lze2HFU617h5BRWQrl8+Rd2Kpg1w0Yq+SH5KB
         NWyBy2TrFgORsRxGV+x7PyO5uOeibSJV1qPVOr57nLMXEd6ZJbZUIwCS9i1iM2uclrwb
         6u29cWaptlh8PVXffA5R8ZnPtQ8f/IZl6GTk1sPt1F/YZFGg5pRsB+oR6IMNXuGz6dCS
         aeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:to:from:date:dmarc-filter:arc-authentication-results;
        bh=ZqxHzGezuhttYveYRHECJgi5PCM3Rm9xo+MWxwkU+Y4=;
        b=vB/K/xQPxvS0mwo6nwBbVPlb10JRmLMSAfFhnMa6x0FKCaGzUPQuOBe9Zi5T5QMiA4
         ttq6Q6rxsMQl/UY+GT+00y2N9LSNqsTmVXTF0Yn9pwHuH3nePqDhdwhXnwJAX8wHvzXV
         jgb0LTzXVpg5VN7Qq+cTL205aXxwQjvZfOv1RxG6gHkpj4dts3m4aF4iLZOtvk9ak6bz
         sMBynM/xsa1lsMU4/onocQkz+/8Yc2eQLAcP0rUGI02zXNDZGpDeX0ZbylrA9im8w+35
         TTgpNNscoVOPO+kFv4Sx4Xhu+5fdACXzwXwfYisaFqeRUAtzgpLzuvOZZAYPI5KV2nA/
         7iJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w5si610896ywl.56.2017.10.25.16.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Oct 2017 16:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7V6C-00048j-0j
	for alex.bennee@linaro.org; Wed, 25 Oct 2017 19:28:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e7V60-00047r-M7
	for qemu-arm@nongnu.org; Wed, 25 Oct 2017 19:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e7V5q-0002IY-Nr
	for qemu-arm@nongnu.org; Wed, 25 Oct 2017 19:28:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:48282)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e7V5q-0002Gu-A1; Wed, 25 Oct 2017 19:28:14 -0400
Received: from [10.149.184.130] (162-198-228-33.lightspeed.wlfrct.sbcglobal.net
	[162.198.228.33])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CB7F421912;
	Wed, 25 Oct 2017 23:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB7F421912
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Wed, 25 Oct 2017 16:28:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: peter.maydell@linaro.org
Message-ID: <alpine.DEB.2.10.1710251623560.574@sstabellini-ThinkPad-X260>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v2] don't hardcode EL1 in
 extended_addresses_enabled
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
Cc: qemu-arm@nongnu.org, sstabellini@kernel.org, qemu-devel@nongnu.org,
	julien.grall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ShI2E1UCVaRR

extended_addresses_enabled calls arm_el_is_aa64, hardcoding exception
level 1. Instead, add an additional "el" argument to
extended_addresses_enabled.

The caller will pass the right value. In most cases, it will be
arm_current_el(env). However, arm_debug_excp_handler will
use arm_debug_target_el(env), as the target el for a debug trap can be
different from the current el.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 96113fe..2298428 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -500,7 +500,7 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = arm_env_get_cpu(env);
 
     if (raw_read(env, ri) != value && !arm_feature(env, ARM_FEATURE_PMSA)
-        && !extended_addresses_enabled(env)) {
+        && !extended_addresses_enabled(env, arm_current_el(env))) {
         /* For VMSA (when not using the LPAE long descriptor page table
          * format) this register includes the ASID, so do a TLB flush.
          * For PMSA it is purely a process ID and no action is needed.
@@ -2162,7 +2162,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
 
     ret = get_phys_addr(env, value, access_type, mmu_idx,
                         &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
-    if (extended_addresses_enabled(env)) {
+    if (extended_addresses_enabled(env, arm_current_el(env))) {
         /* fsr is a DFSR/IFSR value for the long descriptor
          * translation table format, but with WnR always clear.
          * Convert it to a 64-bit PAR.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 43106a2..6792df2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -217,10 +217,10 @@ static inline unsigned int arm_pamax(ARMCPU *cpu)
  * This is always the case if our translation regime is 64 bit,
  * but depends on TTBCR.EAE for 32 bit.
  */
-static inline bool extended_addresses_enabled(CPUARMState *env)
+static inline bool extended_addresses_enabled(CPUARMState *env, unsigned int el)
 {
-    TCR *tcr = &env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
-    return arm_el_is_aa64(env, 1) ||
+    TCR *tcr = &env->cp15.tcr_el[el];
+    return arm_el_is_aa64(env, el) ||
            (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));
 }
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 3914145..4f46eb8 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -1378,7 +1378,7 @@ void arm_debug_excp_handler(CPUState *cs)
 
             cs->watchpoint_hit = NULL;
 
-            if (extended_addresses_enabled(env)) {
+            if (extended_addresses_enabled(env, arm_debug_target_el(env))) {
                 env->exception.fsr = (1 << 9) | 0x22;
             } else {
                 env->exception.fsr = 0x2;
@@ -1402,7 +1402,7 @@ void arm_debug_excp_handler(CPUState *cs)
             return;
         }
 
-        if (extended_addresses_enabled(env)) {
+        if (extended_addresses_enabled(env, arm_debug_target_el(env))) {
             env->exception.fsr = (1 << 9) | 0x22;
         } else {
             env->exception.fsr = 0x2;
