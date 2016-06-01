Received: by 10.25.27.66 with SMTP id b63csp273962lfb;
        Wed, 1 Jun 2016 09:44:58 -0700 (PDT)
X-Received: by 10.237.51.196 with SMTP id v62mr4656219qtd.101.1464799498730;
        Wed, 01 Jun 2016 09:44:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 108si6956169qgg.89.2016.06.01.09.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 09:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b89GM-00031b-3V
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 12:44:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899M-0005Gc-MJ
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899K-0007ry-Ah
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42983)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b899K-0007rq-4w; Wed, 01 Jun 2016 12:37:42 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B181963176;
	Wed,  1 Jun 2016 16:37:41 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51GbXqf025067; Wed, 1 Jun 2016 12:37:40 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Jun 2016 18:37:25 +0200
Message-Id: <1464799050-11002-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 01 Jun 2016 16:37:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 3/8] target-i386: cpu: use cpu_generic_init()
 in cpu_x86_init()
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
X-TUID: dbmO26g+aSxx

now cpu_x86_init() does nothing more or less
than duplicating cpu_generic_init() logic.
So simplify it by using cpu_generic_init().

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 target-i386/cpu.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index c31afc7..238f69d 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -2240,25 +2240,7 @@ out:
 
 X86CPU *cpu_x86_init(const char *cpu_model)
 {
-    Error *error = NULL;
-    X86CPU *cpu;
-
-    cpu = cpu_x86_create(cpu_model, &error);
-    if (error) {
-        goto out;
-    }
-
-    object_property_set_bool(OBJECT(cpu), true, "realized", &error);
-
-out:
-    if (error) {
-        error_report_err(error);
-        if (cpu != NULL) {
-            object_unref(OBJECT(cpu));
-            cpu = NULL;
-        }
-    }
-    return cpu;
+    return X86_CPU(cpu_generic_init(TYPE_X86_CPU, cpu_model));
 }
 
 static void x86_cpu_cpudef_class_init(ObjectClass *oc, void *data)
-- 
1.8.3.1

