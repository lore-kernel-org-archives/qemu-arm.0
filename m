Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp746839wrd;
        Mon, 20 Aug 2018 07:24:23 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxged1+gYAOhiQC4ZqDqUylnrS04/X4v5bM0c3L/MrTGpp7iAl25YJ6lqgV2pvoqJd0Ub7L
X-Received: by 2002:a37:1b1c:: with SMTP id b28-v6mr15505780qkb.393.1534775063529;
        Mon, 20 Aug 2018 07:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534775063; cv=none;
        d=google.com; s=arc-20160816;
        b=i6UHEEIr7XmrLDMv8UTwM9/8WgewYkWUwkf4DFZre5PZ0uIebTCsWkO1ohnypTCZFJ
         xlfqQMAFu6OAaUxhiiRfy4G+VjIVQhi3rZlrBQO9OEk21ECIqIP0OyGZzdUxNlLNRkvw
         R3A44+uJ7iEK5ybuVezc17rHzX0vVcII1Rdiz5i5dPkQ56v4Pg+cSHjOdh75jHdxB2fi
         XnmY5YOwD7nDpmvoJhI1iXJZ0WuCe0BIOCJUufQd9hptuNqU69mvr+NiuSu/6fYKlM8R
         b6RyoxtLTeVu1/NIYMor/BSsdRsO2YxttXG/kZbAg7vDzvJllrbiY/lU9SXqUhDnMTcL
         yuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JplfpbECV4c278V/TM3mGm5VTe0OYlbhVMeHrrOzhxk=;
        b=NG0Twl4o1CJWmz5mlbHnfRvXDG57U/0u2YS0K8/CKUShXd6caloUKksp0FMNy8sbfk
         bYrZvZjzdw9l2lEHiRqVVNUMwP/5DKWWGubdKtDYcnr7M8kACc2XRFgv24YJrLPHgt3s
         v5PXTWEAgT7rkieBJ1iN+aZIzyjGjgldZkk0IrMymut7xphh6yRZslG5VeBkFy+6p1Fr
         DjL9oYKmjV5h+hNlPsq1Zsf5qHMLGCfe0r3P2kmdhbSRxtT+1lzTIYcpgJ+RY9/WkJX0
         br36KQAGgU6NCloVHh9/Ki0MgBniEodmDDjzYPH5LJvdl45khxOg6dMFOz5UY5qvJ0zB
         D/4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8-v6si111030qvw.194.2018.08.20.07.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:24:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frl6V-00060z-0s
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:24:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuJ-0003kx-0r
	for qemu-devel@nongnu.org; Mon, 20 Aug 2018 10:11:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuI-0007Tb-Bl
	for qemu-devel@nongnu.org; Mon, 20 Aug 2018 10:11:46 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44684)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frkuG-0007QD-Dn; Mon, 20 Aug 2018 10:11:44 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frkuF-0003W2-GQ; Mon, 20 Aug 2018 15:11:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:16 +0100
Message-Id: <20180820141116.9118-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 22/22] hw/arm/mps2-tz: Fix MPS2 SCC config
 register values
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2iCh88WqEta+

Some of the config register values we were setting for the MPS2 SCC
weren't correct:
 * the SCC_AID bits [23:20] specify the FPGA build target board revision,
   and the SCC_CFG4 register specifies the actual board revision, so
   these should have matching values. Claim to be board revision C,
   consistently -- we had the revision in the wrong part of SCC_AID.
 * SCC_ID bits [15:4] should be 0x505, not decimal 505

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index cedf605e20e..cb252d8ebcc 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -192,7 +192,7 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
     sccdev = DEVICE(scc);
     qdev_set_parent_bus(sccdev, sysbus_get_default());
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
-    qdev_prop_set_uint32(sccdev, "scc-aid", 0x02000008);
+    qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
     object_property_set_bool(OBJECT(scc), true, "realized", &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(sccdev), 0);
@@ -604,7 +604,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mc->desc = "ARM MPS2 with AN505 FPGA image for Cortex-M33";
     mmc->fpga_type = FPGA_AN505;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
-    mmc->scc_id = 0x41040000 | (505 << 4);
+    mmc->scc_id = 0x41040000 | (0x505 << 4);
 }
 
 static const TypeInfo mps2tz_info = {
-- 
2.18.0

