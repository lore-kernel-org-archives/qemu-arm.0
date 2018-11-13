Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4623704wrw;
        Tue, 13 Nov 2018 09:14:24 -0800 (PST)
X-Google-Smtp-Source: AJdET5eIRWlTNROAxbJzJ+sZQLTdcdmkDwXEcA6Zk+ctNJ20ldmaA7NOSAR5hPKeMs55S2emW7xy
X-Received: by 2002:a37:291:: with SMTP id v17mr5729744qkg.208.1542129264207;
        Tue, 13 Nov 2018 09:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542129264; cv=none;
        d=google.com; s=arc-20160816;
        b=rJPN872fdQTTYxToa9wGu9HIt3U/2nB++wDBKfMC+pn6jw2HQrrLL6bMoSYz9uTlhR
         ooXFhEcIATklH4cQnIU1yjyhJVntmaHJtUGrz3SpXDRTIAsA8vcqfEWhtM9my7u2BUJh
         7rjWedo8PFY8mZ/UAuQ+fpWJV9pD1sTFGdfAmCNTr9/RxeKDSI9NMqf+xCUcgKWRfOC5
         j3PN1+chE20FEK39/kl9tolHQEs4Z5NR6JgfgWUQZha81EO7H9RncmQxSLniuk7N15Yx
         wQIlAXIBIMcMrmivxN00OgZxKqH76etGfxp0EXMc8+CjJMYohafdYofNMl1e0uZcPUwC
         sHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=bk11FJ6Y6pPKIHFtT49XB0tITVV7sb2I6OOLhLp4sOc=;
        b=IgtrvYSwyEsEYhBrZ6l7DneYipPaFcjC/eDktWyMPXddD0NF6L7hyDuDMqIbW6P9N9
         hOD1iSDqNvpXG5xCuumsv5WaV5bHh7cXmE1hf78PKtucCD4AzkfgUoIkvTypnerN+amA
         22wAVnsS+I3rVFyIXWQZiQQ4ijDYcTtNhaDV5llJC0oGstFLmiwk3bUR2ZX9b/lA3m1e
         hkZZIg2QCijVHJnsTfC4IV2Jbuvp7qWAGwkd547pYY1ukw4iY2MjmZmyjQMN/YLDeKIh
         +n/kbaIdrg4zSGMgJJ1jM171H387ksYTjO2P6VzXH5VAJ4ghSRaXh0F7vhI8V7CUEHaY
         wXuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s44si10860446qtc.107.2018.11.13.09.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:14:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:55208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMcGd-0006AI-Ju
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:14:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMcAU-0006P5-DQ
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 12:08:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMbwo-00040t-4G
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 11:53:54 -0500
Received: from mga06.intel.com ([134.134.136.31]:62850)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gMbwl-0003nD-WB; Tue, 13 Nov 2018 11:53:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 08:53:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,228,1539673200"; d="scan'208";a="107922124"
Received: from qingbai-mobl.ger.corp.intel.com (HELO
	caravaggio.ger.corp.intel.com) ([10.249.41.239])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2018 08:53:46 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 17:52:45 +0100
Message-Id: <20181113165247.4806-12-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181113165247.4806-1-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH 11/13] target: arm: Define TCG dependent
 functions when TCG is enabled
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	richard.henderson@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /EQHgCJ8pTca

do_interrupt, do_unaligned_access, do_transaction_failed and debug_excp
are only relevant in the TCG context, so we should not define them
when TCG is disabled.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
---
 target/arm/cpu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 60411f6bfe..fb2e5d430e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1444,7 +1444,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
 
-#ifndef CONFIG_USER_ONLY
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
     cc->do_interrupt = arm_v7m_cpu_do_interrupt;
 #endif
 
@@ -2061,9 +2061,14 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_USER_ONLY
     cc->handle_mmu_fault = arm_cpu_handle_mmu_fault;
 #else
+
+#ifdef CONFIG_TCG
     cc->do_interrupt = arm_cpu_do_interrupt;
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
     cc->do_transaction_failed = arm_cpu_do_transaction_failed;
+    cc->debug_excp_handler = arm_debug_excp_handler;
+#endif
+
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
@@ -2076,7 +2081,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
-    cc->debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
 #if !defined(CONFIG_USER_ONLY)
     cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
-- 
2.19.1

