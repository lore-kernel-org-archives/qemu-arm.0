Received: by 10.80.166.35 with SMTP id d32csp102333edc;
        Tue, 11 Oct 2016 10:08:49 -0700 (PDT)
X-Received: by 10.237.58.161 with SMTP id o30mr1537429qte.3.1476205729386;
        Tue, 11 Oct 2016 10:08:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o42si1881460qta.146.2016.10.11.10.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 10:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu0Xo-0001Py-LF
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 13:08:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bu0Xa-0001CE-1P
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bu0XZ-00044a-4y
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:08:33 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bu0XY-00043i-Uo; Tue, 11 Oct 2016 13:08:33 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bu0XQ-00017Y-Oi; Tue, 11 Oct 2016 18:08:24 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Oct 2016 18:08:19 +0100
Message-Id: <1476205699-28857-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
References: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v3 7/7] hw/arm/virt: Set minimum_page_bits to 12
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
Cc: patches@linaro.org, Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, paolo@archaic.org.uk,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zps78aeDaxQn

Since the virt board model will never create a CPU which is
pre-ARMv7, we know that our minimum page size is 4K and can
set minimum_page_bits accordingly, for improved performance.

Note that this is a migration compatibility break, so
we introduce it only for the virt-2.8 machine and onward;
virt-2.7 continues using the old 1K pages.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 795740d..abef00c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1496,6 +1496,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
+    /* We know we will never create a pre-ARMv7 CPU which needs 1K pages */
+    mc->minimum_page_bits = 12;
 }
 
 static const TypeInfo virt_machine_info = {
@@ -1563,6 +1565,8 @@ static void virt_machine_2_7_options(MachineClass *mc)
 {
     virt_machine_2_8_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_7);
+    /* Stick with 1K pages for migration compatibility */
+    mc->minimum_page_bits = 0;
 }
 DEFINE_VIRT_MACHINE(2, 7)
 
-- 
2.7.4

