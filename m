Received: by 10.28.173.206 with SMTP id w197csp6801559wme;
        Thu, 18 Jan 2018 09:36:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBouW/kF3h1ThtSf0Bh7pt7kIHbPsvNW7nwoWxs7t4uhUxpsMiddCZiephsLX7v/L/2jznaol
X-Received: by 10.129.57.10 with SMTP id g10mr1295645ywa.179.1516296970653;
        Thu, 18 Jan 2018 09:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516296970; cv=none;
        d=google.com; s=arc-20160816;
        b=aA51qkjiiNw2zbCVADmQKx94uVHnJ2qaQlcn3fxdpv3K/srPmEH2534D8+6J/awwwD
         DdkDi38SzHUQu26TYqZEygqw/n4JRUBsncb4f7aW1iMV3lgF5YLO8Jyq8VcEobrfP3L1
         MxzEGRkmf5Q0/cgLgo+crJBSaR8CclrGFHdnAJ1OgqIitCEqB0Uo5pGo5o6+Q9ozuznI
         RTzjnKh8NkITfTX4oztKlsNMytc5BtD5bGyKrtzZmHgFAUSZsRnq6QV3rV8x4FobIdom
         HBybb0eFdgGHMAkYhzJovZWFjZL4d9cr9lxYq3Jbpvoirw8eoRAxKAekoyWijKgLE5PI
         5VoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6Dme+jeTwX8y94FhGeMgRvdmeQu1MoesAftTMpeNGA0=;
        b=sQbi/YRhz8LdXsSKXN0Tl3ZNdvFh0bVaxr9M06DaBjPsj49dIzy8D10TYMo3Dw6WDA
         pSoz02s2Oe1d0xYq1cUoBIo+zvI4qty9e3kK3OjlA7chVXWjyJYAD/w70JljSPCtxTux
         q+sErnD6X9K9PNzLI8zA7LR1VIfnmNDQ2FtC4FvjR/nDaEZKAcpOzHm0tNLXmXCX1uDx
         ohncesPoR6eLiZYe0+P1ZJ+T2V/0QtUVMZIpPEjZPVjzhZzlyxtfL9DD+UoFu2hd/xX+
         D90WCgEsWS+DGcG7g9zWxyUbI0VI93zgCZfi9a58DpLz9Sq8sWL5MivE259qxSL2Fj4D
         b/iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 1si1730945ywx.525.2018.01.18.09.36.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 09:36:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecE6k-0004MS-1d
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 12:36:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6S-0004L8-Hr
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 12:35:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6R-0007tu-Mr
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 12:35:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45168)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ecE6R-0007sz-Fw; Thu, 18 Jan 2018 12:35:51 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9424B83F44;
	Thu, 18 Jan 2018 17:35:50 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3942414C;
	Thu, 18 Jan 2018 17:35:47 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jan 2018 18:33:59 +0100
Message-Id: <1516296842-136976-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
References: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 18 Jan 2018 17:35:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 2/5] machine: prepare machine 'none' to
 gradually switch to cpu_create() API
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X27kdUbpHBi2

temporarily add #ifdef CPU_RESOLVING_TYPE in null-machine.c,
so that each target could gradually switch to cpu_create() and
not converted yet could continue to use cpu_init().

Once all targets are converted
   temporary ifdefs, MachineState::cpu_model and cpu_init() API
will be removed

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/core/null-machine.c | 13 ++++++++++++-
 vl.c                   |  8 +++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index 864832d..3cc6a49 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -23,10 +23,18 @@
 static void machine_none_init(MachineState *mch)
 {
     CPUState *cpu = NULL;
+#ifdef CPU_RESOLVING_TYPE
+    MachineClass *mc = MACHINE_GET_CLASS(mch);
 
-    /* Initialize CPU (if a model has been specified) */
+    /* Initialize CPU if cpu_type pointer is user provided
+     * (i.e. != to pointer tot static default cpu type string)
+     */
+    if (mch->cpu_type != mc->default_cpu_type) {
+        cpu = cpu_create(mch->cpu_type);
+#else
     if (mch->cpu_model) {
         cpu = cpu_init(mch->cpu_model);
+#endif
         if (!cpu) {
             error_report("Unable to initialize CPU");
             exit(1);
@@ -54,6 +62,9 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->init = machine_none_init;
     mc->max_cpus = 1;
     mc->default_ram_size = 0;
+#ifdef CPU_RESOLVING_TYPE
+    mc->default_cpu_type = CPU_RESOLVING_TYPE;
+#endif
 }
 
 DEFINE_MACHINE("none", machine_none_machine_init)
diff --git a/vl.c b/vl.c
index 2586f25..8aa0131 100644
--- a/vl.c
+++ b/vl.c
@@ -4609,7 +4609,6 @@ int main(int argc, char **argv, char **envp)
     current_machine->maxram_size = maxram_size;
     current_machine->ram_slots = ram_slots;
     current_machine->boot_order = boot_order;
-    current_machine->cpu_model = cpu_model;
 
     parse_numa_opts(current_machine);
 
@@ -4619,6 +4618,13 @@ int main(int argc, char **argv, char **envp)
         if (cpu_model) {
             current_machine->cpu_type =
                 cpu_parse_cpu_model(machine_class->default_cpu_type, cpu_model);
+
+            /* machine 'none' depends on default cpu type pointer not being
+             * equal to resolved type name pointer to fugure out if type was
+             * user provided, make sure that if it becomes not true in future
+             * it won't beark silently */
+            g_assert(
+                current_machine->cpu_type != machine_class->default_cpu_type);
         }
     }
 
-- 
2.7.4

