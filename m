Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1456585wrd;
        Thu, 23 Aug 2018 11:08:36 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyaqmsGJlxtB5IYdOdYC9ggQnu8/4fo0LANaN17Wo6KTNpUE2/FNOHUSoOyAJ7qzNgd8rlh
X-Received: by 2002:a0c:83c4:: with SMTP id k62-v6mr57020323qva.88.1535047716265;
        Thu, 23 Aug 2018 11:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535047716; cv=none;
        d=google.com; s=arc-20160816;
        b=u3ZjYWGQVfmuRwTz9SxNyCdnyJUceSkEz9V75fguquwob7gd1UkYC0oZvVY/3C3dCk
         bCzR1pfwaKvneNNnTIl7se9l8b/ju1X3hCdtHgpgAcUlvwBDWTJkDsfPLICAHkhWXOFe
         9KrgxrvNJSUCHKlRUZXOpD2DdYILtJRIN9F8U5v5B/rZrKarJWLmhVvluypwJZXkoWLj
         e5zEkm4z8/RMWSgn6QpJ4uVDfMigHdPMZL7RzgjWLXq6YHJi2ylCw0ACm3EyMmIMJjAS
         Ce1xc6vs7t6NQP/rXHaE8jU9NKFt6B31WePsysYoIlJ5TsYcSqpDn+BLftbcmmceQAp6
         udjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=TlNBuU2OcCl6ZbKdAzJ6u7bN41nG5IG34Hgs7vCGnq0=;
        b=nFxtAkE6G7NYMd6uXitRGHNA4lGB09zJUx56faULv7F9H25aEVeJSZSUwXhHkdbFZ2
         38SXfd+6s7LYmb4NfBxcbkfpI3Npxx7Te3ogGOwVihzqumFU3GTAld+M9kl96LxzyRcb
         Mtah60OVi/oJh2EQvXIo1DVgD+s+wDqP2hZH81F0u8O0juqh1rUMHHAscGtGRzxxLcLH
         Y2ZXODjdv3Pxw4cNAPnAAWFKzpWUepUauTkbtxnIZK1U4LL5by5OQ6Zl53vsrf1wEaRS
         ofmf3hRYhVkVMK7io/PxwMm1LkDSUpTqpDnh0GFBuRwTRvvWrvkyNigDuVVEI4J1jSqk
         ++jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14-v6si5244662qtk.203.2018.08.23.11.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 11:08:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsu27-0003JV-QW
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 14:08:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fstma-0004B6-9Y
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:52:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fstmZ-0003gA-HS
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:52:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44848)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fstmZ-0003eT-A7; Thu, 23 Aug 2018 13:52:31 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fstmW-0005xu-6K; Thu, 23 Aug 2018 18:52:28 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 23 Aug 2018 18:52:25 +0100
Message-Id: <20180823175225.22612-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] hw/arm/mps2: Fix ID register errors on AN511 and
 AN385
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E4cn9+gOjRlC

Fix MPS2 SCC config register values for the mps2-an511
and mps2-an385 boards:
 * the SCC_AID bits [23:20] specify the FPGA build target board revision,
   and the SCC_CFG4 register specifies the actual board revision, so
   these should have matching values. Claim to be board revision C,
   consistently -- we had the revision in the wrong part of SCC_AID.
 * SCC_ID bits [15:4] should be the board number in hex, not decimal

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This fixes a bug that I noticed for the AN505 model and fixed there,
but forgot to also fix on our other MPS image models.

 hw/arm/mps2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 0a0ae867d9b..26934ecb31c 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -301,7 +301,7 @@ static void mps2_common_init(MachineState *machine)
     sccdev = DEVICE(&mms->scc);
     qdev_set_parent_bus(sccdev, sysbus_get_default());
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
-    qdev_prop_set_uint32(sccdev, "scc-aid", 0x02000008);
+    qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
     object_property_set_bool(OBJECT(&mms->scc), true, "realized",
                              &error_fatal);
@@ -336,7 +336,7 @@ static void mps2_an385_class_init(ObjectClass *oc, void *data)
     mc->desc = "ARM MPS2 with AN385 FPGA image for Cortex-M3";
     mmc->fpga_type = FPGA_AN385;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
-    mmc->scc_id = 0x41040000 | (385 << 4);
+    mmc->scc_id = 0x41043850;
 }
 
 static void mps2_an511_class_init(ObjectClass *oc, void *data)
@@ -347,7 +347,7 @@ static void mps2_an511_class_init(ObjectClass *oc, void *data)
     mc->desc = "ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3";
     mmc->fpga_type = FPGA_AN511;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
-    mmc->scc_id = 0x4104000 | (511 << 4);
+    mmc->scc_id = 0x41045110;
 }
 
 static const TypeInfo mps2_info = {
-- 
2.18.0

