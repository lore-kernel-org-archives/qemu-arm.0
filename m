Received: by 10.25.27.66 with SMTP id b63csp271012lfb;
        Wed, 1 Jun 2016 09:38:36 -0700 (PDT)
X-Received: by 10.55.198.196 with SMTP id s65mr29252176qkl.119.1464799116316;
        Wed, 01 Jun 2016 09:38:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92si1504681qgk.13.2016.06.01.09.38.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 09:38:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b89AB-000699-N9
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 12:38:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899P-0005K3-JE
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899I-0007ra-EY
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b899I-0007rU-8o; Wed, 01 Jun 2016 12:37:40 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB1578DFF1;
	Wed,  1 Jun 2016 16:37:39 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51GbXqe025067; Wed, 1 Jun 2016 12:37:38 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Jun 2016 18:37:24 +0200
Message-Id: <1464799050-11002-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 01 Jun 2016 16:37:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 2/8] target-i386: cpu: move xcc->kvm_required
 check to reaize time
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
X-TUID: OwkwA7Tx9VU0

it will allow to drop custom cpu_x86_init() and use
cpu_generic_init() instead reducing cpu_x86_create()
to a simple 3-liner.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 target-i386/cpu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 6159a7f..c31afc7 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -2200,7 +2200,6 @@ static void x86_cpu_load_def(X86CPU *cpu, X86CPUDefinition *def, Error **errp)
 X86CPU *cpu_x86_create(const char *cpu_model, Error **errp)
 {
     X86CPU *cpu = NULL;
-    X86CPUClass *xcc;
     ObjectClass *oc;
     gchar **model_pieces;
     char *name, *features;
@@ -2219,12 +2218,6 @@ X86CPU *cpu_x86_create(const char *cpu_model, Error **errp)
         error_setg(&error, "Unable to find CPU definition: %s", name);
         goto out;
     }
-    xcc = X86_CPU_CLASS(oc);
-
-    if (xcc->kvm_required && !kvm_enabled()) {
-        error_setg(&error, "CPU model '%s' requires KVM", name);
-        goto out;
-    }
 
     cpu = X86_CPU(object_new(object_class_get_name(oc)));
 
@@ -2901,6 +2894,13 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     static bool ht_warned;
     FeatureWord w;
 
+    if (xcc->kvm_required && !kvm_enabled()) {
+        char *name = g_strdup(object_get_typename(OBJECT(dev)));
+        *strstr(name, X86_CPU_TYPE_SUFFIX) = 0;
+        error_setg(&local_err, "CPU model '%s' requires KVM", name);
+        goto out;
+    }
+
     if (cpu->apic_id < 0) {
         error_setg(errp, "apic-id property was not initialized properly");
         return;
-- 
1.8.3.1

