Received: by 10.28.71.27 with SMTP id u27csp1305273wma;
        Thu, 1 Feb 2018 09:29:22 -0800 (PST)
X-Google-Smtp-Source: AH8x224TRCoUEW3Y2fAtJp8i+mRCcPOVALvvd6EcYuqQ3YNUdzNe38CTECPWSJYy5xdyD/WBlv07
X-Received: by 10.129.155.87 with SMTP id s84mr25218420ywg.140.1517506162231;
        Thu, 01 Feb 2018 09:29:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517506162; cv=none;
        d=google.com; s=arc-20160816;
        b=u52fIzcBNEueStEKfEE/7BR26Z2ZUn4Odw/sud4NpG9v83qbMJ+Iydvu+Bac3dmKhl
         S8GHsUzft5tXckftR2BFoIbMhUt+ro3lUI2LZuiCsIDLKRZmD52UZgF/u32DBzuJUAhj
         ay927Kqg8YgXhNd8grklP8XfwutvkCjAIaXS4FoHUIX53qIsNf4m1JN6GJzZHmq1j4rd
         +X32Dl8nCEC9lthOZ/wYAhw2BVejTuFvlz+6G+OwQijJnkjob8d/H4g4sHHgUn3Hs6sg
         HhlabF3MWkxeZA0FHCtsHlZV/t96p+8c04+IN7W4bDXJm1YLQZG15ztUTw8TJXAjGxzK
         UH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=9LCsMehqVHswscMXh+Rx98on+LDcFXBAx9owCniVTzs=;
        b=n/IzqwZ0fuUYkBNd9MQTEYXJ3heh/bMxbpiP5jnGEdv1DxaeYzFVZUG9qh8gzaZ4MG
         HJtqQEgMAMIbJdDM3wCf0wycAU2297CGCIfzD4VUTtHMaWOUKwoLHKjvIDA/QYrfFaJD
         m0mkw3e1G/R3n0jpZ8I7Jr4KKCjjRtSPUzNf1C3VMfIY/suMtd8WrTKvYirkUxxbGyl8
         x89x2zKGr/kptLUJ1uc3HLKM8PC8AFuERAvFx+Re59ktqjyvpYN9OZzm3l5SWnajxM5q
         SGZeV+8vsi7RMFW+HikixWYAIMbW3F971835pa+mNDIt+Cl4LWuW4pk35jEHlKgxchQQ
         RGwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r6si19802ywa.26.2018.02.01.09.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Feb 2018 09:29:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehIfp-00035r-I2
	for alex.bennee@linaro.org; Thu, 01 Feb 2018 12:29:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ehIfa-00032Y-5A
	for qemu-arm@nongnu.org; Thu, 01 Feb 2018 12:29:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ehIfY-0005NF-Nt
	for qemu-arm@nongnu.org; Thu, 01 Feb 2018 12:29:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48238)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1ehIfY-0005Jd-IK; Thu, 01 Feb 2018 12:29:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E367C07991B;
	Thu,  1 Feb 2018 17:28:58 +0000 (UTC)
Received: from amd-seattle-09.khw.lab.eng.bos.redhat.com
	(amd-seattle-09.khw.lab.eng.bos.redhat.com [10.16.184.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B55A7E09D;
	Thu,  1 Feb 2018 17:28:21 +0000 (UTC)
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Feb 2018 12:28:08 -0500
Message-Id: <1517506091-10396-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 01 Feb 2018 17:28:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/4] hw/arm/virt: Set default machine and CPU
 types for mach-virt
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rzIuXbGjkxfv

Unlike most other QEMU architectures, the default machine type for
mach-virt is not set. This causes problems in situations where the
default machine types are not provided (e.g. qtest_start() function
in many QEMU tests). This patch designates the latest mach-virt
machine type (alias of "virt") as the default machine type. It also
changes the default CPU depending on the target.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b334c82..f6b1408 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -68,6 +68,7 @@
         mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
         if (latest) { \
             mc->alias = "virt"; \
+            mc->is_default = 1; \
         } \
     } \
     static const TypeInfo machvirt_##major##_##minor##_info = { \
@@ -1603,7 +1604,12 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
+#ifdef TARGET_AARCH64
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
+#else
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
+#endif
+
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
 }
 
-- 
1.8.3.1

