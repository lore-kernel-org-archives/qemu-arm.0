Received: by 10.28.71.27 with SMTP id u27csp3197352wma;
        Mon, 22 Jan 2018 11:48:45 -0800 (PST)
X-Google-Smtp-Source: AH8x225o0rJKsunlyzHkBDfuLA4qZVBCLgBfnub2MOTr0GqWHmf3ZCWIQTQLPCn8kTUz2n2pU7ig
X-Received: by 10.129.134.134 with SMTP id w128mr12590ywf.14.1516650525375;
        Mon, 22 Jan 2018 11:48:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516650525; cv=none;
        d=google.com; s=arc-20160816;
        b=IleeO9s1sG6EsGbJgczHBC5wsvFCnyt6Oi/Q2nfSSjmmiIRA4Vq1CxvK/kHcaRO7K0
         Cl+BPIeCA3WdEYNG5/tkGjt9nXU8+EXl1LNlV9C9SCXMDk3kc5wfhrryqrD1bnuUT07p
         QFawtuKTwCoyMDMtKWZz34QQhZwe5jbb1yTRD+L73Z4FclPNcAyccwwp9SXlfYm6lXxG
         R5Be83saLRV3hQGlzhQN38HGf90sDBcDk2s4iuKBqIu/SH+h68a4mPxCYmg76QTn+kay
         ELekj+HBq1WZM9sZnslgSp1zU2BOiTX8qlZ2burgR2x0oLC6B+bDeH5KuE0UkQRxKsB7
         5LXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=k0KmNmMODx5Ym5kXsMD6qEv83KQfi2d6Ux1hffjiIqM=;
        b=j/tlFrpgQeD0Z85AAdcPKV4sTYPiXNLhWfsoPjuQ7+MuSFoitL2dbgO77DmLRmq4SE
         0m/Y1J5Cs4yfD9riE24FIKSLzYQHRhA8LEousq8dj7x8Rkk7FY48LMRcwYeZyE4pbd5m
         OTS3TqtW3ChssnEvoQB3YnFHVnscJSU5XiahHsCHb1mR8W5W61W6672/cI4f6BiSqNeJ
         0cgR3AWNRnXE9xA+MgglrNRqqjcjtr35z3jpQAnMfJotiBPIrSK4Rv+zTy1OrdX4cVzC
         YiGvEsvUnB5iym87BgBhBIsk7U9JPCpApNx4PqjM9xgvuIVbHa/sqcH1mpFhf85oV3lN
         YYIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fxhsj373;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r12si3706996ywc.14.2018.01.22.11.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 11:48:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fxhsj373;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33693 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edi5E-00075p-Mw
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 14:48:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4b-00073O-LU
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:48:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4a-00064k-PL
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:48:05 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:36489)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1edi4a-00064S-Iv; Mon, 22 Jan 2018 14:48:04 -0500
Received: by mail-pf0-x242.google.com with SMTP id 23so7885369pfp.3;
	Mon, 22 Jan 2018 11:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=k0KmNmMODx5Ym5kXsMD6qEv83KQfi2d6Ux1hffjiIqM=;
	b=fxhsj3730G3yTgvLACETPixumJmZCpfeB7YhznhToRjcR5zZ75bYPb+eEIOcQuN2yn
	iENdyJzvJupa2FrpFj7/C9vj2voMuzOuwgiD3L3NXtpxB9uY9KoBwXq3uV50k24PQNFY
	hLRw4zXq4MjvyfOy6pZryzQrsNpRV3SGxNxfmMFWL831pw7pqR/D2IHDNLDPs0QnxD5X
	Z7fPGKm8uHOqgVA3184xIW0PoUSRK/9CiKPIV7LOtKNcSoN/wo8LILxsA/gHcUHheaXX
	SjF9hX7uGM65Iu1+gUqdOAiZMCvdWOkwfGFdrajRo47FqPOhJmo7chSmyUFClIzYjrWs
	C/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=k0KmNmMODx5Ym5kXsMD6qEv83KQfi2d6Ux1hffjiIqM=;
	b=Poimv4aUuRfQaw1o3Uf0ElJBEXzni4QU85qoRSiGYRoRdZAVLFjboffFvHDOecBKmL
	1pUs/uenBJbb+q5FCLY31EHZvxaOGXsQafIYrJA/wA4J1Xgdits3T16QItnFKajzwDnj
	uxWgsACD/efiWTVBz4F1Xnq4A8jk6xeZRdM9EasLrQVbKaqL91hgtJQFrkc1xAc+z1dd
	ZuxHws27P54XWolhVJunU5yFU3QUTqbCxa8O1xGBXCsPLKriS8QlnWsfbFPIlkP6byd8
	CB3yjbwJJgWLRd8if4/+FgYPT1fAc2ZOoe7GwZOn8/EIIn1Os7UUklFya8l+/+dKPeba
	Wm8Q==
X-Gm-Message-State: AKwxyteNf+QOXn3IEPl5ZgF/6B+4bahRsJMB6hZAxCiTP1HLEHZNqWme
	lHnVqiVUZhxX4dCOjjRmAAwsFhcr
X-Received: by 10.98.228.5 with SMTP id r5mr9154922pfh.193.1516650483306;
	Mon, 22 Jan 2018 11:48:03 -0800 (PST)
Received: from localhost ([149.199.62.254])
	by smtp.gmail.com with ESMTPSA id b6sm1726868pfe.85.2018.01.22.11.48.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Jan 2018 11:48:02 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Mon, 22 Jan 2018 11:43:38 -0800
Message-Id: <3bea46b94313557c66c45b2400ca10cec0480fec.1516650109.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516650109.git.alistair.francis@xilinx.com>
References: <cover.1516650109.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [PATCH v7 6/9] xlnx-zynqmp-pmu: Connect the PMU
 interrupt controller
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0kHA3T+8zv2k

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

 hw/microblaze/xlnx-zynqmp-pmu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 145837b372..7312bfe23e 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -24,6 +24,8 @@
 #include "cpu.h"
 #include "boot.h"
 
+#include "hw/intc/xlnx-pmu-iomod-intc.h"
+
 /* Define the PMU device */
 
 #define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
@@ -34,14 +36,18 @@
 #define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
 #define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
 
+#define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
+
 typedef struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
     MicroBlazeCPU cpu;
+    XlnxPMUIOIntc intc;
 }  XlnxZynqMPPMUSoCState;
 
+
 static void xlnx_zynqmp_pmu_soc_init(Object *obj)
 {
     XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(obj);
@@ -50,6 +56,9 @@ static void xlnx_zynqmp_pmu_soc_init(Object *obj)
                       TYPE_MICROBLAZE_CPU);
     object_property_add_child(obj, "pmu-cpu", OBJECT(&s->cpu),
                               &error_abort);
+
+    object_initialize(&s->intc, sizeof(s->intc), TYPE_XLNX_PMU_IO_INTC);
+    qdev_set_parent_bus(DEVICE(&s->intc), sysbus_get_default());
 }
 
 static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
@@ -80,6 +89,21 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
+
+    object_property_set_uint(OBJECT(&s->intc), 0x10, "intc-intr-size",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->intc), 0x0, "intc-level-edge",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->intc), 0xffff, "intc-positive",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->intc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->intc), 0, XLNX_ZYNQMP_PMU_INTC_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->intc), 0,
+                       qdev_get_gpio_in(DEVICE(&s->cpu), MB_CPU_IRQ));
 }
 
 static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
-- 
2.14.1

