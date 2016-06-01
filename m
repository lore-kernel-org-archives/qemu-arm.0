Received: by 10.25.27.66 with SMTP id b63csp274520lfb;
        Wed, 1 Jun 2016 09:46:14 -0700 (PDT)
X-Received: by 10.237.40.68 with SMTP id r62mr4621280qtd.66.1464799574871;
        Wed, 01 Jun 2016 09:46:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c68si26324594qga.7.2016.06.01.09.46.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 09:46:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b89Ha-000475-8y
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 12:46:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899Z-0005WE-Ea
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899S-0007uE-8C
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b899S-0007u6-0N; Wed, 01 Jun 2016 12:37:50 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A8A6710B1;
	Wed,  1 Jun 2016 16:37:49 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51GbXqj025067; Wed, 1 Jun 2016 12:37:47 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Jun 2016 18:37:29 +0200
Message-Id: <1464799050-11002-8-git-send-email-imammedo@redhat.com>
In-Reply-To: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 01 Jun 2016 16:37:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 7/8] arm: virt: parse cpu_model only once
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, blauwirbel@gmail.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V2JJF7aMCss6

considering that features are converted to
global properties and global properties are
automatically applied to every new instance
of created CPU (at object_new() time), there
is no point in parsing cpu_model string every
time a CPU created.
So move parsing outside CPU creation loop and
do it only once.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 473e439..0dbee47 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1112,6 +1112,10 @@ static void machvirt_init(MachineState *machine)
     VirtGuestInfoState *guest_info_state = g_malloc0(sizeof *guest_info_state);
     VirtGuestInfo *guest_info = &guest_info_state->info;
     char **cpustr;
+    ObjectClass *oc;
+    const char *typename;
+    CPUClass *cc;
+    Error *err = NULL;
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
 
     if (!cpu_model) {
@@ -1191,27 +1195,24 @@ static void machvirt_init(MachineState *machine)
 
     create_fdt(vbi);
 
-    for (n = 0; n < smp_cpus; n++) {
-        ObjectClass *oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
-        const char *typename = object_class_get_name(oc);
-        CPUClass *cc = CPU_CLASS(oc);
-        Object *cpuobj;
-        Error *err = NULL;
-        char *cpuopts = g_strdup(cpustr[1]);
-
-        if (!oc) {
-            error_report("Unable to find CPU definition");
-            exit(1);
-        }
-        /* convert -smp CPU options specified by the user into global props */
-        cc->parse_features(typename, cpuopts, &err);
-        cpuobj = object_new(typename);
+    oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
+    if (!oc) {
+        error_report("Unable to find CPU definition");
+        exit(1);
+    }
+    typename = object_class_get_name(oc);
 
-        g_free(cpuopts);
-        if (err) {
-            error_report_err(err);
-            exit(1);
-        }
+    /* convert -smp CPU options specified by the user into global props */
+    cc = CPU_CLASS(oc);
+    cc->parse_features(typename, cpustr[1], &err);
+    g_strfreev(cpustr);
+    if (err) {
+        error_report_err(err);
+        exit(1);
+    }
+
+    for (n = 0; n < smp_cpus; n++) {
+        Object *cpuobj = object_new(typename);
 
         if (!vms->secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
@@ -1242,7 +1243,6 @@ static void machvirt_init(MachineState *machine)
 
         object_property_set_bool(cpuobj, true, "realized", NULL);
     }
-    g_strfreev(cpustr);
     fdt_add_timer_nodes(vbi, gic_version);
     fdt_add_cpu_nodes(vbi);
     fdt_add_psci_node(vbi);
-- 
1.8.3.1

