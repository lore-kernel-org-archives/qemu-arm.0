Received: by 10.25.21.96 with SMTP id l93csp2054030lfi;
        Tue, 21 Jun 2016 10:11:15 -0700 (PDT)
X-Received: by 10.55.8.2 with SMTP id 2mr29837748qki.200.1466529075032;
        Tue, 21 Jun 2016 10:11:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11si54999279qte.13.2016.06.21.10.11.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 10:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFPCk-0005M7-F1
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 13:11:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBK-00046j-4C
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBI-00045H-7e
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:45 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBI-00044f-0j; Tue, 21 Jun 2016 13:09:44 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBC-00025q-Bh; Tue, 21 Jun 2016 18:09:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Jun 2016 18:09:34 +0100
Message-Id: <1466528974-12183-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 6/6] hw/arm/virt: Set minimum_page_bits to 12
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SXyoFuaEP8AX

Since the virt board model will never create a CPU which is
pre-ARMv7, we know that our minimum page size is 4K and can
set minimum_page_bits accordingly, for improved performance.

Note that this is a migration compatibility break.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c5c125e..f9b51aa 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1440,6 +1440,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
+    /* We know we will never create a pre-ARMv7 CPU which needs 1K pages */
+    mc->minimum_page_bits = 12;
 }
 
 static const TypeInfo virt_machine_info = {
-- 
1.9.1

