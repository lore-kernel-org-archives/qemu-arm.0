Received: by 10.25.27.66 with SMTP id b63csp1576928lfb;
        Mon, 6 Jun 2016 09:26:02 -0700 (PDT)
X-Received: by 10.140.105.71 with SMTP id b65mr16008249qgf.66.1465230361959;
        Mon, 06 Jun 2016 09:26:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 142si3838032qke.285.2016.06.06.09.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 09:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43568 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9xLk-0003rX-Vw
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 12:26:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wH5-0000RY-Aw
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 11:17:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wH4-0006xm-CQ
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 11:17:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59715)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b9wH4-0006xU-6L; Mon, 06 Jun 2016 11:17:06 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA2D681130;
	Mon,  6 Jun 2016 15:17:05 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56FGtmx013155; Mon, 6 Jun 2016 11:17:04 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 Jun 2016 17:16:46 +0200
Message-Id: <1465226212-254093-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 06 Jun 2016 15:17:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 04/10] target-i386: cpu: use cpu_generic_init()
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
X-TUID: 8oWP4hadDiLa

now cpu_x86_init() does nothing more or less
than duplicating cpu_generic_init() logic.
So simplify it by using cpu_generic_init().

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target-i386/cpu.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index ae67a15..349b971 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -2217,25 +2217,7 @@ out:
 
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

