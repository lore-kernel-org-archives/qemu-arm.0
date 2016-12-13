Received: by 10.25.205.13 with SMTP id d13csp2117278lfg;
        Tue, 13 Dec 2016 02:38:05 -0800 (PST)
X-Received: by 10.200.38.39 with SMTP id u36mr92789808qtu.31.1481625485379;
        Tue, 13 Dec 2016 02:38:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o1si27842601qte.133.2016.12.13.02.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 02:38:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGkTC-0005s7-F2
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 05:38:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkSv-0005gZ-IQ
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:37:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkSu-0000Ce-QP
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:37:45 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cGkSu-000087-Jy; Tue, 13 Dec 2016 05:37:44 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cGkRf-0002Gp-Uc; Tue, 13 Dec 2016 10:36:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Dec 2016 10:36:05 +0000
Message-Id: <1481625384-15077-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 04/23] hw/arm/virt: add 2.9 machine type
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
Cc: Andrew Jones <drjones@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N89/wvUy7AMi

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 include/hw/compat.h |  3 +++
 hw/arm/virt.c       | 19 +++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/hw/compat.h b/include/hw/compat.h
index 0f06e11..f8b8354 100644
--- a/include/hw/compat.h
+++ b/include/hw/compat.h
@@ -1,6 +1,9 @@
 #ifndef HW_COMPAT_H
 #define HW_COMPAT_H
 
+#define HW_COMPAT_2_8 \
+    /* empty */
+
 #define HW_COMPAT_2_7 \
     {\
         .driver   = "virtio-pci",\
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d04e4ac..11c53a5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1525,7 +1525,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_8_instance_init(Object *obj)
+static void virt_2_9_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
@@ -1558,10 +1558,25 @@ static void virt_2_8_instance_init(Object *obj)
                                     "Valid values are 2, 3 and host", NULL);
 }
 
+static void virt_machine_2_9_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 9)
+
+#define VIRT_COMPAT_2_8 \
+    HW_COMPAT_2_8
+
+static void virt_2_8_instance_init(Object *obj)
+{
+    virt_2_9_instance_init(obj);
+}
+
 static void virt_machine_2_8_options(MachineClass *mc)
 {
+    virt_machine_2_9_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_8);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 8)
+DEFINE_VIRT_MACHINE(2, 8)
 
 #define VIRT_COMPAT_2_7 \
     HW_COMPAT_2_7
-- 
2.7.4

