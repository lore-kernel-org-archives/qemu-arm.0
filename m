Received: by 10.25.21.96 with SMTP id l93csp2096516lfi;
        Tue, 21 Jun 2016 11:58:50 -0700 (PDT)
X-Received: by 10.55.16.39 with SMTP id a39mr113025qkh.111.1466535530228;
        Tue, 21 Jun 2016 11:58:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d20si1128848qke.214.2016.06.21.11.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 11:58:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFQsq-00048O-J7
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 14:58:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bFQsn-00048G-Ho
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 14:58:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bFQsj-0008Ug-DK
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 14:58:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59209)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bFQsj-0008Ua-7P; Tue, 21 Jun 2016 14:58:41 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92FFAC04B313;
	Tue, 21 Jun 2016 18:58:40 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5LIwdTo008136; Tue, 21 Jun 2016 14:58:39 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Tue, 21 Jun 2016 20:58:35 +0200
Message-Id: <1466535515-18092-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 21 Jun 2016 18:58:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/virt: gicv3: use all target-list bits
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WM/xStww8Mq2

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c5c125e9204a0..53f545921003c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1271,6 +1271,16 @@ static void machvirt_init(MachineState *machine)
         }
         cpuobj = object_new(object_class_get_name(oc));
 
+        /* Adjust MPIDR per the GIC's target-list size. */
+        if (gic_version == 3) {
+            CPUState *cs = CPU(cpuobj);
+            uint8_t Aff1 = cs->cpu_index / 16;
+            uint8_t Aff0 = cs->cpu_index % 16;
+
+            object_property_set_int(cpuobj, (Aff1 << ARM_AFF1_SHIFT) | Aff0,
+                                    "mp-affinity", NULL);
+        }
+
         /* Handle any CPU options specified by the user */
         cc->parse_features(CPU(cpuobj), cpuopts, &err);
         g_free(cpuopts);
-- 
2.4.11

