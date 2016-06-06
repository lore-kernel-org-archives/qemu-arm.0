Received: by 10.25.27.66 with SMTP id b63csp1560326lfb;
        Mon, 6 Jun 2016 08:52:09 -0700 (PDT)
X-Received: by 10.55.174.68 with SMTP id x65mr16835441qke.184.1465228328934;
        Mon, 06 Jun 2016 08:52:08 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t128si4161236qkd.216.2016.06.06.08.52.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 08:52:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9woy-0005zV-9r
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 11:52:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wHB-0000Vx-Sc
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 11:17:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wH9-0006yl-RK
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 11:17:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b9wH3-0006xE-7K; Mon, 06 Jun 2016 11:17:05 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE05419CBEF;
	Mon,  6 Jun 2016 15:17:03 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56FGtmw013155; Mon, 6 Jun 2016 11:17:02 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 Jun 2016 17:16:45 +0200
Message-Id: <1465226212-254093-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 06 Jun 2016 15:17:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 03/10] target-i386: cpu: move xcc->kvm_required
 check to realize time
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, blauwirbel@gmail.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 77w7EXwXwL7a

it will allow to drop custom cpu_x86_init() and use
cpu_generic_init() insteadi, reducing cpu_x86_create()
to a simple 3-liner.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Eduardo Habkost <ehabkost@redhat.com>
---
v1:
  - use x86_cpu_class_get_model_name() for getting cpu model name
---
 target-i386/cpu.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 79a9b61..ae67a15 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -677,6 +677,14 @@ static ObjectClass *x86_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+static char *x86_cpu_class_get_model_name(X86CPUClass *cc)
+{
+    const char *class_name = object_class_get_name(OBJECT_CLASS(cc));
+    assert(g_str_has_suffix(class_name, X86_CPU_TYPE_SUFFIX));
+    return g_strndup(class_name,
+                     strlen(class_name) - strlen(X86_CPU_TYPE_SUFFIX));
+}
+
 struct X86CPUDefinition {
     const char *name;
     uint32_t level;
@@ -2169,7 +2177,6 @@ static void x86_cpu_load_def(X86CPU *cpu, X86CPUDefinition *def, Error **errp)
 X86CPU *cpu_x86_create(const char *cpu_model, Error **errp)
 {
     X86CPU *cpu = NULL;
-    X86CPUClass *xcc;
     ObjectClass *oc;
     gchar **model_pieces;
     char *name, *features;
@@ -2188,12 +2195,6 @@ X86CPU *cpu_x86_create(const char *cpu_model, Error **errp)
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
 
@@ -2870,6 +2871,13 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     static bool ht_warned;
     FeatureWord w;
 
+    if (xcc->kvm_required && !kvm_enabled()) {
+        char *name = x86_cpu_class_get_model_name(xcc);
+        error_setg(&local_err, "CPU model '%s' requires KVM", name);
+        g_free(name);
+        goto out;
+    }
+
     if (cpu->apic_id < 0) {
         error_setg(errp, "apic-id property was not initialized properly");
         return;
-- 
1.8.3.1

