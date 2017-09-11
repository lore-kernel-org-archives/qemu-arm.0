Received: by 10.223.172.38 with SMTP id v35csp5601809wrc;
        Mon, 11 Sep 2017 07:21:24 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC6oaEfJ/uGAXM9kTWJSa5Hf8bqih/rJAvvWaCqvMQyBrihjU+uAcNf56OJpmZ7zifoR/r3
X-Received: by 10.237.39.219 with SMTP id m27mr8321976qtg.34.1505139681357;
        Mon, 11 Sep 2017 07:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505139681; cv=none;
        d=google.com; s=arc-20160816;
        b=VqaTKF+funoumSDbvfctEdu4Xn5ohaSmpU1xduinJovy7Nt7cP30SHTkUoFHA/B/C1
         VAm5sFsIXGadFx/7Pfhjhy8PX3ix9e2LM9PmiXrX9YZogM83Z7qQ+IZeE28Yq94YUGhl
         3s15AFAv/JoZD3QgOm9LzFlTv4YhpjC76phwCTVObcHOjGZl07M8CYPtFj+MGMHvL1mH
         qOkdNZ4yCPzIwUeHzRgR1j17V4L6uIg93VmlVtxKFCokxDYqnKgvugMeN392YQZn9+GR
         SKS20ubVYuxi0MtZhrMQzSPROQpZxaK/I/NhdtGAuDvJM28iHz3OyvUfP8FbJ0itdvD/
         exDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=J1YJy4juW3OCeO+Y96At6aBkKpuPbKMbsnndo8aiTsg=;
        b=rwgDpYpe5TbfmCICpOVyBgH4JjFYKwvg4ugdJ7ra3FToU0SqstfTjeljn/MMPJo141
         gIeM9CVuhhhTj+s5lZWWsEmDhndC9CuOqFRzyW5xp06+L6f9VppF3Buw/VNp8rDKKWed
         YDVc+kGdF7MehFbSl6g8PKAuuT1eN5P+ULpkwuX/KoSfboWFfvbHMDjGoccQ8NrAymJd
         sj+M3eLE4U1saaBS5HHIADkffDbTCCPc0J3OKjjVyDECACI7EPRCZUqmMlsICXP4wAOp
         rjnNxnuGiXMjpx0Z2ZiSSUyqsmoyNdAe0bCJD8/KtYrSkE8fnXp4nwPWvJ1IUXtbQLBD
         IqNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t34si3205279qtj.1.2017.09.11.07.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 07:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drPaR-0007Z9-8F
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 10:21:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drPaH-0007VM-H6
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:21:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drPaG-0001lu-Dp
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:21:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51192)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1drPaG-0001lO-4z; Mon, 11 Sep 2017 10:21:08 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25367113204;
	Mon, 11 Sep 2017 14:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 25367113204
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-239.ams2.redhat.com
	[10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 651D2649CC;
	Mon, 11 Sep 2017 14:21:04 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 16:20:55 +0200
Message-Id: <20170911142056.15643-3-lvivier@redhat.com>
In-Reply-To: <20170911142056.15643-1-lvivier@redhat.com>
References: <20170911142056.15643-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 11 Sep 2017 14:21:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/3] hmp: fix "dump-quest-memory" segfault
 (arm)
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v7iiP6RlO2nP

Commit fd5d23babf (hmp: fix "dump-quest-memory" segfault)
fixes the problem for i386, do the same for arm.

Running QEMU with
    qemu-system-aarch64 -M none -nographic -m 256
and executing
    dump-guest-memory /dev/null 0 8192
results in segfault

Fix by checking if we have CPU.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 target/arm/arch_dump.c | 52 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 1a9861f69b..1f58cff256 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -273,8 +273,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 int cpu_get_dump_info(ArchDumpInfo *info,
                       const GuestPhysBlockList *guest_phys_blocks)
 {
-    ARMCPU *cpu = ARM_CPU(first_cpu);
-    CPUARMState *env = &cpu->env;
     GuestPhysBlock *block;
     hwaddr lowest_addr = ULLONG_MAX;
 
@@ -290,13 +288,32 @@ int cpu_get_dump_info(ArchDumpInfo *info,
         }
     }
 
-    if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-        info->d_machine = EM_AARCH64;
-        info->d_class = ELFCLASS64;
-        info->page_size = (1 << 16); /* aarch64 max pagesize */
-        if (lowest_addr != ULLONG_MAX) {
-            info->phys_base = lowest_addr;
+    if (first_cpu) {
+        ARMCPU *cpu = ARM_CPU(first_cpu);
+        CPUARMState *env = &cpu->env;
+        if (arm_feature(env, ARM_FEATURE_AARCH64)) {
+            info->d_machine = EM_AARCH64;
+            info->d_class = ELFCLASS64;
+            info->page_size = (1 << 16); /* aarch64 max pagesize */
+            if (lowest_addr != ULLONG_MAX) {
+                info->phys_base = lowest_addr;
+            }
+        } else {
+            info->d_machine = EM_ARM;
+            info->d_class = ELFCLASS32;
+            info->page_size = (1 << 12);
+            if (lowest_addr < UINT_MAX) {
+                info->phys_base = lowest_addr;
+            }
         }
+
+        /* We assume the relevant endianness is that of EL1; this is right
+         * for kernels, but might give the wrong answer if you're trying to
+         * dump a hypervisor that happens to be running an opposite-endian
+         * kernel.
+         */
+        info->d_endian = (env->cp15.sctlr_el[1] & SCTLR_EE) != 0
+                         ? ELFDATA2MSB : ELFDATA2LSB;
     } else {
         info->d_machine = EM_ARM;
         info->d_class = ELFCLASS32;
@@ -304,25 +321,24 @@ int cpu_get_dump_info(ArchDumpInfo *info,
         if (lowest_addr < UINT_MAX) {
             info->phys_base = lowest_addr;
         }
+        info->d_endian = ELFDATA2LSB;
     }
 
-    /* We assume the relevant endianness is that of EL1; this is right
-     * for kernels, but might give the wrong answer if you're trying to
-     * dump a hypervisor that happens to be running an opposite-endian
-     * kernel.
-     */
-    info->d_endian = (env->cp15.sctlr_el[1] & SCTLR_EE) != 0
-                     ? ELFDATA2MSB : ELFDATA2LSB;
-
     return 0;
 }
 
 ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
 {
-    ARMCPU *cpu = ARM_CPU(first_cpu);
-    CPUARMState *env = &cpu->env;
+    ARMCPU *cpu;
+    CPUARMState *env;
     size_t note_size;
 
+    if (first_cpu == NULL) {
+        return 0;
+    }
+
+    cpu = ARM_CPU(first_cpu);
+    env = &cpu->env;
     if (class == ELFCLASS64) {
         note_size = AARCH64_PRSTATUS_NOTE_SIZE;
         note_size += AARCH64_PRFPREG_NOTE_SIZE;
-- 
2.13.5

