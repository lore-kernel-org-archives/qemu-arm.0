Received: by 10.80.163.71 with SMTP id 65csp436267edn;
        Fri, 23 Sep 2016 07:43:32 -0700 (PDT)
X-Received: by 10.55.99.202 with SMTP id x193mr7610291qkb.199.1474641812462;
        Fri, 23 Sep 2016 07:43:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si5353752qkb.120.2016.09.23.07.43.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 07:43:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnRhL-00040m-UO
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 10:43:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bnRfL-0002Wg-R6
	for qemu-devel@nongnu.org; Fri, 23 Sep 2016 10:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bnRfK-0001vB-UN
	for qemu-devel@nongnu.org; Fri, 23 Sep 2016 10:41:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bnRfF-0001tL-Ab; Fri, 23 Sep 2016 10:41:21 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32E9D9E63E;
	Fri, 23 Sep 2016 14:41:20 +0000 (UTC)
Received: from kamzik.brq.redhat.com ([10.34.248.91])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8NEfHLI017227; Fri, 23 Sep 2016 10:41:18 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 23 Sep 2016 16:41:16 +0200
Message-Id: <1474641676-25017-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 23 Sep 2016 14:41:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/arm/virt: add 2.8 machine type
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
Cc: wei@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3HtcMQHsU7NC

Signed-off-by: Andrew Jones <drjones@redhat.com>

---

This will conflict with Wei's PMU property series (which is why I
asked him to add it to that series...), but anyway, it'll be a minor
resolution to make.
---
 hw/arm/virt.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a193b5a95b3f..2ead58db8ff9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1479,7 +1479,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_7_instance_init(Object *obj)
+static void virt_2_8_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
@@ -1512,10 +1512,25 @@ static void virt_2_7_instance_init(Object *obj)
                                     "Valid values are 2, 3 and host", NULL);
 }
 
+static void virt_machine_2_8_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 8)
+
+#define VIRT_COMPAT_2_7 \
+    HW_COMPAT_2_7
+
+static void virt_2_7_instance_init(Object *obj)
+{
+    virt_2_8_instance_init(obj);
+}
+
 static void virt_machine_2_7_options(MachineClass *mc)
 {
+    virt_machine_2_8_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_7);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 7)
+DEFINE_VIRT_MACHINE(2, 7)
 
 #define VIRT_COMPAT_2_6 \
     HW_COMPAT_2_6
-- 
2.7.4

