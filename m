Received: by 10.25.77.65 with SMTP id a62csp2496948lfb;
        Thu, 16 Feb 2017 06:32:33 -0800 (PST)
X-Received: by 10.200.58.101 with SMTP id w92mr2227484qte.160.1487255553500;
        Thu, 16 Feb 2017 06:32:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o23si5346641qkh.86.2017.02.16.06.32.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 06:32:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceN6m-0003u6-QM
	for alex.bennee@linaro.org; Thu, 16 Feb 2017 09:32:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ceMZE-00028j-NB
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 08:57:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ceMZ9-0001Ln-Sw
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 08:57:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ceMZ9-0001LL-Mv; Thu, 16 Feb 2017 08:57:47 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 010B780465;
	Thu, 16 Feb 2017 13:57:47 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1GDvjHC017380; Thu, 16 Feb 2017 08:57:45 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 16 Feb 2017 14:57:41 +0100
Message-Id: <1487253461-269218-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 16 Feb 2017 13:57:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/virt: fix cpu object reference leak
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
X-TUID: Jok2x79pkiQn

object_new(FOO) returns an object with ref_cnt == 1
and following
  object_property_set_bool(cpuobj, true, "realized", NULL)
set parent of cpuobj to '/machine/unattached' which makes
ref_cnt == 2.

Since machvirt_init() doesn't take ownership of cpuobj
returned by object_new() it should explicitly drop
reference to cpuobj when dangling pointer is about to
go out of scope like it's done pc_new_cpu() to avoid
object leak.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1f216cf..83adf3f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1376,6 +1376,7 @@ static void machvirt_init(MachineState *machine)
         }
 
         object_property_set_bool(cpuobj, true, "realized", NULL);
+        object_unref(cpuobj);
     }
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
-- 
2.7.4

