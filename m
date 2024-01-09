Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp672541ejs;
        Tue, 9 Jan 2024 14:24:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqPLJO7B9Sq8FzNsLKp9OSJBh6d6xyyJoAaI7RtujtryvBWWfTV49AbsGnbpRlYSv20fk2
X-Received: by 2002:a05:6214:411:b0:680:ce23:cb45 with SMTP id z17-20020a056214041100b00680ce23cb45mr317770qvx.15.1704839085617;
        Tue, 09 Jan 2024 14:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704839085; cv=none;
        d=google.com; s=arc-20160816;
        b=bCUzL91Kn5slPlpPQIP5W9gZAvZL/RPTMCFZXpeNGN6pTILwHnU2yQ3oQzh7YVHwKY
         T50O+3DTYtPMBMbmDt1f3NyAVafphMvguZai1lsNflXCpbqEFlbPTzUiKJCb+n4hgYXm
         Ssy3E4S2Ym4t9iLiW/F6TIwdfIyLDqQrrC2KD5iuCezGgHBaek02Rj358VT9Bb6wwhm0
         jY4NYsHbFVSczCOaSZIW6vGkIwq8MVNoHqhLCQDbkMPqd45HlH8gbTZqluVIYRo52u0C
         7leNqNnteen25BZ1iUcP9IIAMDcqZHbANF7cJTYkJuwd3lbUFoJrevAwPZRAjfSs/5EG
         uL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cvlC+c4dOpXT+kTOYeYEbs72WtED7IjAYBv0dI8paTQ=;
        fh=oCcW8YgO0uPSEPLT85zmruvbAEZ25ywTEvlgBH92cAY=;
        b=PJMk146z+bkG62vxfIvTZ5br19UqdSpXlGNWHsKtZ5QBRbiJ/lAF8UQggz9Zpk4TI1
         uIwdYoB+RzRRSxgWmqeooVRQd2FysD/0pzhP69r10arbAUeLJusKQDz5MqfK0Eb44zcv
         ob047c1RRDGAnbFr3/CjQYSHQ/8BjVQimoYFP0K1dPI91qNOrBN0VH7Lo1M4gyWOYVHu
         lRY18Xb6/OvO1kN+DlxcGS+4P7n60Deh6H4dmRQ50hUSRPmtYCwZm2q1LkZyTdUoVewM
         V86ERTPlTYvitxIvjSYsMD9DsrEwVI+KBRiadIZRQLOyDWY2XNQSAirXBviVY2qCTdjd
         hkUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=HPwM39qt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22-20020a0cab56000000b006807216bc54si3194909qvb.307.2024.01.09.14.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 14:24:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=HPwM39qt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNKVv-0006Z3-Kt; Tue, 09 Jan 2024 17:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNKVu-0006Xh-FT; Tue, 09 Jan 2024 17:24:02 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNKVr-0002EC-JL; Tue, 09 Jan 2024 17:24:02 -0500
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 409Ks11d010468; Tue, 9 Jan 2024 22:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=cvlC+c4dOpXT+kTOYeYEbs72WtED7IjAYBv0dI8paTQ=;
 b=HPwM39qt6ePNnXda5kW+EdkLbrBOk/rzI/62XgdZLLvc17avoqUheRsC655h3oOoCTX5
 spK+zb3hovdID5rhZm9k3CQkm0xvCKOuumlAVuWjHdF3Rm7cNW8Q31CFRwTTxFtMgRrt
 1niQfwr11j8LJy+rsAMOhg/TCynbQrhMxyGdtHnbPPm5eKK2V1cCxCwYUkzIj/fnGN1A
 BHsVSqZKqXJRoTwiCCxh6jF46UHUq0lmVDvnAtsiry0zxi5IXBOdPFvd1ukO+Fr7P2t0
 G/gzzUiy+LztcLViQ5ZbkdKjCkyGXJV4qnQPZVg5TNTBR2j8AUC3dA/ctYUDRp7WZnTX Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhd6haevn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:42 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 409MJAE6003006;
 Tue, 9 Jan 2024 22:23:41 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhd6haeuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:41 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 409JZ72U004395; Tue, 9 Jan 2024 22:23:40 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfjpksd7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:40 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 409MNdlA63635940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jan 2024 22:23:39 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D1AD5805C;
 Tue,  9 Jan 2024 22:23:39 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E183058051;
 Tue,  9 Jan 2024 22:23:38 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jan 2024 22:23:38 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v9 07/10] hw/arm: Hook up FSI module in AST2600
Date: Tue,  9 Jan 2024 16:23:30 -0600
Message-Id: <20240109222333.1225031-8-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109222333.1225031-1-ninad@linux.ibm.com>
References: <20240109222333.1225031-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cbBfLao1WxOVCGEgl0LpXMr2XfJuOGTB
X-Proofpoint-ORIG-GUID: C0CiDQ-P6CjV_XMbJIS4hwKThxbU4JuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_11,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxlogscore=681 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401090179
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FDBXjniHaCsi

This patchset introduces IBM's Flexible Service Interface(FSI).

Time for some fun with inter-processor buses. FSI allows a service
processor access to the internal buses of a host POWER processor to
perform configuration or debugging.

FSI has long existed in POWER processes and so comes with some baggage,
including how it has been integrated into the ASPEED SoC.

Working backwards from the POWER processor, the fundamental pieces of
interest for the implementation are:

1. The Common FRU Access Macro (CFAM), an address space containing
   various "engines" that drive accesses on buses internal and external
   to the POWER chip. Examples include the SBEFIFO and I2C masters. The
   engines hang off of an internal Local Bus (LBUS) which is described
   by the CFAM configuration block.

2. The FSI slave: The slave is the terminal point of the FSI bus for
   FSI symbols addressed to it. Slaves can be cascaded off of one
   another. The slave's configuration registers appear in address space
   of the CFAM to which it is attached.

3. The FSI master: A controller in the platform service processor (e.g.
   BMC) driving CFAM engine accesses into the POWER chip. At the
   hardware level FSI is a bit-based protocol supporting synchronous and
   DMA-driven accesses of engines in a CFAM.

4. The On-Chip Peripheral Bus (OPB): A low-speed bus typically found in
   POWER processors. This now makes an appearance in the ASPEED SoC due
   to tight integration of the FSI master IP with the OPB, mainly the
   existence of an MMIO-mapping of the CFAM address straight onto a
   sub-region of the OPB address space.

5. An APB-to-OPB bridge enabling access to the OPB from the ARM core in
   the AST2600. Hardware limitations prevent the OPB from being directly
   mapped into APB, so all accesses are indirect through the bridge.

The implementation appears as following in the qemu device tree:

    (qemu) info qtree
    bus: main-system-bus
      type System
      ...
      dev: aspeed.apb2opb, id ""
        gpio-out "sysbus-irq" 1
        mmio 000000001e79b000/0000000000001000
        bus: opb.1
          type opb
          dev: fsi.master, id ""
            bus: fsi.bus.1
              type fsi.bus
              dev: cfam.config, id ""
              dev: cfam, id ""
                bus: fsi.lbus.1
                  type lbus
                  dev: scratchpad, id ""
                    address = 0 (0x0)
        bus: opb.0
          type opb
          dev: fsi.master, id ""
            bus: fsi.bus.0
              type fsi.bus
              dev: cfam.config, id ""
              dev: cfam, id ""
                bus: fsi.lbus.0
                  type lbus
                  dev: scratchpad, id ""
                    address = 0 (0x0)

The LBUS is modelled to maintain the qdev bus hierarchy and to take
advantage of the object model to automatically generate the CFAM
configuration block. The configuration block presents engines in the
order they are attached to the CFAM's LBUS. Engine implementations
should subclass the LBusDevice and set the 'config' member of
LBusDeviceClass to match the engine's type.

CFAM designs offer a lot of flexibility, for instance it is possible for
a CFAM to be simultaneously driven from multiple FSI links. The modeling
is not so complete; it's assumed that each CFAM is attached to a single
FSI slave (as a consequence the CFAM subclasses the FSI slave).

As for FSI, its symbols and wire-protocol are not modelled at all. This
is not necessary to get FSI off the ground thanks to the mapping of the
CFAM address space onto the OPB address space - the models follow this
directly and map the CFAM memory region into the OPB's memory region.
Future work includes supporting more advanced accesses that drive the
FSI master directly rather than indirectly via the CFAM mapping, which
will require implementing the FSI state machine and methods for each of
the FSI symbols on the slave. Further down the track we can also look at
supporting the bitbanged SoftFSI drivers in Linux by extending the FSI
slave model to resolve sequences of GPIO IRQs into FSI symbols, and
calling the associated symbol method on the slave to map the access onto
the CFAM.

Testing:
    Tested by reading cfam config address 0 on rainier machine type.

    root@p10bmc:~# pdbg -a getcfam 0x0
    p0: 0x0 = 0xc0022d15

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  4 ++++
 hw/arm/aspeed_ast2600.c     | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index cb832bc1ee..e452108260 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -36,6 +36,7 @@
 #include "hw/misc/aspeed_lpc.h"
 #include "hw/misc/unimp.h"
 #include "hw/misc/aspeed_peci.h"
+#include "hw/fsi/aspeed-apb2opb.h"
 #include "hw/char/serial.h"
 
 #define ASPEED_SPIS_NUM  2
@@ -90,6 +91,7 @@ struct AspeedSoCState {
     UnimplementedDeviceState udc;
     UnimplementedDeviceState sgpiom;
     UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
+    AspeedAPB2OPBState fsi[2];
 };
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -214,6 +216,8 @@ enum {
     ASPEED_DEV_SGPIOM,
     ASPEED_DEV_JTAG0,
     ASPEED_DEV_JTAG1,
+    ASPEED_DEV_FSI1,
+    ASPEED_DEV_FSI2,
 };
 
 #define ASPEED_SOC_SPI_BOOT_ADDR 0x0
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 3a9a303ab8..30da88361b 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -75,6 +75,8 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_UART12]    = 0x1E790600,
     [ASPEED_DEV_UART13]    = 0x1E790700,
     [ASPEED_DEV_VUART]     = 0x1E787000,
+    [ASPEED_DEV_FSI1]      = 0x1E79B000,
+    [ASPEED_DEV_FSI2]      = 0x1E79B100,
     [ASPEED_DEV_I3C]       = 0x1E7A0000,
     [ASPEED_DEV_SDRAM]     = 0x80000000,
 };
@@ -132,6 +134,8 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_ETH4]      = 33,
     [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
     [ASPEED_DEV_DP]        = 62,
+    [ASPEED_DEV_FSI1]      = 100,
+    [ASPEED_DEV_FSI2]      = 101,
     [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
 };
 
@@ -264,6 +268,10 @@ static void aspeed_soc_ast2600_init(Object *obj)
     object_initialize_child(obj, "emmc-boot-controller",
                             &s->emmc_boot_controller,
                             TYPE_UNIMPLEMENTED_DEVICE);
+
+    for (i = 0; i < ASPEED_FSI_NUM; i++) {
+        object_initialize_child(obj, "fsi[*]", &s->fsi[i], TYPE_ASPEED_APB2OPB);
+    }
 }
 
 /*
@@ -623,6 +631,17 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         return;
     }
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
+
+    /* FSI */
+    for (i = 0; i < ASPEED_FSI_NUM; i++) {
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->fsi[i]), errp)) {
+            return;
+        }
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fsi[i]), 0,
+                        sc->memmap[ASPEED_DEV_FSI1 + i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->fsi[i]), 0,
+                           aspeed_soc_get_irq(s, ASPEED_DEV_FSI1 + i));
+    }
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
-- 
2.39.2

