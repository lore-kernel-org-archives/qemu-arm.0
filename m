Received: by 10.80.166.35 with SMTP id d32csp3088347edc;
        Tue, 25 Oct 2016 02:37:30 -0700 (PDT)
X-Received: by 10.55.72.11 with SMTP id v11mr16903981qka.50.1477388250538;
        Tue, 25 Oct 2016 02:37:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j125si12947803qkc.327.2016.10.25.02.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 02:37:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byyAj-0003v7-JJ
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 05:37:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1byyAf-0003uz-Rf
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 05:37:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1byyAc-0003xb-Oo
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 05:37:25 -0400
Received: from relay6-d.mail.gandi.net ([2001:4b98:c:538::198]:51541)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcd@tribudubois.net>)
	id 1byyAc-0003wP-IO; Tue, 25 Oct 2016 05:37:22 -0400
Received: from mfilter43-d.gandi.net (mfilter43-d.gandi.net [217.70.178.174])
	by relay6-d.mail.gandi.net (Postfix) with ESMTP id 7E56BFB8F4;
	Tue, 25 Oct 2016 11:37:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter43-d.gandi.net
Received: from relay6-d.mail.gandi.net ([IPv6:::ffff:217.70.183.198])
	by mfilter43-d.gandi.net (mfilter43-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id uR6s5XHIBLUl; Tue, 25 Oct 2016 11:37:18 +0200 (CEST)
X-Originating-IP: 78.235.240.156
Received: from localhost.localdomain (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156]) (Authenticated sender: jcd@tribudubois.net)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 80E17FB91B;
	Tue, 25 Oct 2016 11:37:16 +0200 (CEST)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Tue, 25 Oct 2016 11:37:11 +0200
Message-Id: <20161025093711.17407-1-jcd@tribudubois.net>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:4b98:c:538::198
Subject: [Qemu-arm] [PATCH] Versatile memory should not exceed 256MB.
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4R70kytrmQnz

For now Qemu accpet a memory size greater than 256 MB but it would
crash afterward.

Versatile devices are starting at 256 MB bondary.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/arm/versatilepb.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 8ae5392..7f11651 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -198,6 +198,14 @@ static void versatile_init(MachineState *machine, int board_id)
     int done_smc = 0;
     DriveInfo *dinfo;
 
+    if (machine->ram_size > 0x10000000) {
+        /* devices are starting at address 0x10000000,
+         * Memory cannot overlap with devices.
+         */ 
+        fprintf(stderr, "Memory size cannot exceed 256MB\n");
+        exit(1);
+    }
+
     if (!machine->cpu_model) {
         machine->cpu_model = "arm926";
     }
-- 
2.9.3

