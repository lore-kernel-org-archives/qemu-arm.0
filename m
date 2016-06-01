Received: by 10.25.27.66 with SMTP id b63csp270943lfb;
        Wed, 1 Jun 2016 09:38:28 -0700 (PDT)
X-Received: by 10.200.54.227 with SMTP id b32mr4519772qtc.15.1464799108465;
        Wed, 01 Jun 2016 09:38:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c18si26256849qge.73.2016.06.01.09.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 09:38:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b89A3-0005yx-Uu
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 12:38:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899Q-0005L7-EZ
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899O-0007tC-BU
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b899O-0007t7-5p; Wed, 01 Jun 2016 12:37:46 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B47C6811D2;
	Wed,  1 Jun 2016 16:37:45 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51GbXqh025067; Wed, 1 Jun 2016 12:37:43 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Jun 2016 18:37:27 +0200
Message-Id: <1464799050-11002-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 01 Jun 2016 16:37:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 5/8] target-sparc: cpu: use
 sparc_cpu_parse_features() directly
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
X-TUID: srYqzdQgT0oZ

make SPARC target use sparc_cpu_parse_features() directly
so it won't get in the way of switching other propertified
targets to handling features as global properties.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
SPARC target could be switched to features properties
later but that would need quite a bit of refactoring
in generating necessary CPU types and adding appropriate
properties.
---
 target-sparc/cpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target-sparc/cpu.c b/target-sparc/cpu.c
index 5b74cfc..e4089f2 100644
--- a/target-sparc/cpu.c
+++ b/target-sparc/cpu.c
@@ -101,9 +101,11 @@ static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info *info)
 #endif
 }
 
+static void sparc_cpu_parse_features(CPUState *cs, char *features,
+                                     Error **errp);
+
 static int cpu_sparc_register(SPARCCPU *cpu, const char *cpu_model)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUSPARCState *env = &cpu->env;
     char *s = g_strdup(cpu_model);
     char *featurestr, *name = strtok(s, ",");
@@ -119,7 +121,7 @@ static int cpu_sparc_register(SPARCCPU *cpu, const char *cpu_model)
     memcpy(env->def, def, sizeof(*def));
 
     featurestr = strtok(NULL, ",");
-    cc->parse_features(CPU(cpu), featurestr, &err);
+    sparc_cpu_parse_features(CPU(cpu), featurestr, &err);
     g_free(s);
     if (err) {
         error_report_err(err);
@@ -840,7 +842,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     scc->parent_reset = cc->reset;
     cc->reset = sparc_cpu_reset;
 
-    cc->parse_features = sparc_cpu_parse_features;
     cc->has_work = sparc_cpu_has_work;
     cc->do_interrupt = sparc_cpu_do_interrupt;
     cc->cpu_exec_interrupt = sparc_cpu_exec_interrupt;
-- 
1.8.3.1

