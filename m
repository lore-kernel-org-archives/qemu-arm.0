Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6200130wrt;
        Mon, 21 Jan 2019 07:50:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4nC/F2FNXRFJXQa47W8Tr7cuPbrp6LkV832t0fUJsgcJaJAJwOIVvzrBwxsCnKpzmNUl+0
X-Received: by 2002:adf:90e5:: with SMTP id i92mr27507315wri.210.1548085806357;
        Mon, 21 Jan 2019 07:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548085806; cv=none;
        d=google.com; s=arc-20160816;
        b=eNZbWMyAw9OqoL/WItYIM/OOxdjHiCLIiO/EOuterqz6Qmrv5rewP3BRFzSUQTJKX8
         sTYJP0ipUWBqTROd6RqYUvxAAX0gwcKkkuXz00S3nEbI0xj7xSn1j9wj0kR+GBR+bSO8
         Zcun+4zNH3t5sWfJVm9q/qwSzEmVxHO9aXzAFDmCT7GN0gtKgedFJocCe3HTqyEmfBeN
         V6/fDLEJMj0/ZPBxEo+vf1SMhs6ppsRY5sm5qP+bdwDRKVIIMrBxnEnFBLTCfB7Qohn3
         LI7I50LKm9ctGXma8UmSNH71upd1L8T0GRpC6GfTuy9ny6rrLzAMOf0Rab9LKzIb3q6b
         7Nag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:message-id:mime-version:date:to:from;
        bh=1U6+equNP6pleallM77mvf9cdTgwcuYj+peT3Ry5biU=;
        b=O0nj9aeI61CGv3/3pSP+TzQE57LbOfdmMH8V27PNuaZHKnezWRqJ3ZRBuU9lS4nlj9
         YYcLxR2CXe2YA0rrO+SbQNCXuduVgZ5B4k8xnRDKT7KSNLHJ9ZzoHf2K1w6p68EnLZtE
         GJkTTJo86D2PezX4xBq2NMGUhyu64GSYuGxETiz95DybHY8r5AA4pQnzOUVUShtIjkHn
         kc39+M4/2s2WMrt+hIDWjwvj9LQKXbJKKPWxIJvrG2UkOuadeYJSKKxOMT2OZfTv9uH9
         Fglu9KH6XzJUkIHpOeE0Ke4tmQjWdSt49wmCForcuhT85RHfu1fUcyVoJ+O9jlJmkJbh
         rhYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si66769038wrs.381.2019.01.21.07.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 07:50:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glbpt-0001CF-BP
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 10:50:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1glbpf-0001C4-EB
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 10:49:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1glbpe-0000LD-6s
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 10:49:51 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40294)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1glbpd-0000Cy-OI
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 10:49:50 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x0LFhVYS052106
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:49:41 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2q5fpquxq5-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:49:41 -0500
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <clg@kaod.org>;
	Mon, 21 Jan 2019 15:49:39 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 21 Jan 2019 15:49:34 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x0LFnXi962324978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 21 Jan 2019 15:49:33 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69DA3A4055;
	Mon, 21 Jan 2019 15:49:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DCD2A404D;
	Mon, 21 Jan 2019 15:49:33 +0000 (GMT)
Received: from smtp.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.1])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 21 Jan 2019 15:49:33 +0000 (GMT)
Received: from zorba.kaod.org.com (sig-9-145-190-81.de.ibm.com [9.145.190.81])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id
	4FDE022019C; Mon, 21 Jan 2019 16:49:32 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 16:49:28 +0100
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19012115-0008-0000-0000-000002B3F2F2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012115-0009-0000-0000-000022201B86
Message-Id: <20190121154928.32065-1-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-01-21_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=738 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1901210124
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id x0LFhVYS052106
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-arm] [PATCH] aspeed/smc: snoop SPI transfers to fake dummy
 cycles
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 78TlUrMurT6Y

The m25p80 models dummy cycles using byte transfers. This works well
when the transfers are initiated by the QEMU model of a SPI controller
but when these are initiated by the OS, it breaks emulation.

Snoop the SPI transfer to catch commands requiring dummy cycles and
replace them with byte transfers compatible with the m25p80 model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 I have had few hacks to work around this problem, Andrew also, but I
 think that the model for the Xilinx Zynq SPI controller has an
 elegant solution.

 Tested with on different Linux kernels (OpenBMC, 5.0.0-rcX) and
 different Linux drivers doing fast read SPI transfers in User
 mode. It would be good to give the patch a try on other proprietary
 Firmwares using the USER command mode to access the flash.

 include/hw/ssi/aspeed_smc.h |   3 +
 hw/ssi/aspeed_smc.c         | 115 +++++++++++++++++++++++++++++++++++-
 2 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index b8b2dfbec280..f3909440d53c 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -104,6 +104,9 @@ typedef struct AspeedSMCState {
     AddressSpace dma_as;
=20
     AspeedSMCFlash *flashes;
+
+    uint8_t snoop_index;
+    uint8_t snoop_dummies;
 } AspeedSMCState;
=20
 #endif /* ASPEED_SMC_H */
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 0dc22e44cfd4..69683aca61b7 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -166,6 +166,9 @@
 /* Flash opcodes. */
 #define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
=20
+#define SNOOP_OFF         0xFF
+#define SNOOP_START       0x0
+
 /*
  * Default segments mapping addresses and size for each slave per
  * controller. These can be changed when board is initialized with the
@@ -587,6 +590,101 @@ static uint64_t aspeed_smc_flash_read(void *opaque,=
 hwaddr addr, unsigned size)
     return ret;
 }
=20
+/*
+ * TODO (clg@kaod.org): stolen from xilinx_spips.c. Should move to a
+ * common include header.
+ */
+typedef enum {
+    READ =3D 0x3,         READ_4 =3D 0x13,
+    FAST_READ =3D 0xb,    FAST_READ_4 =3D 0x0c,
+    DOR =3D 0x3b,         DOR_4 =3D 0x3c,
+    QOR =3D 0x6b,         QOR_4 =3D 0x6c,
+    DIOR =3D 0xbb,        DIOR_4 =3D 0xbc,
+    QIOR =3D 0xeb,        QIOR_4 =3D 0xec,
+
+    PP =3D 0x2,           PP_4 =3D 0x12,
+    DPP =3D 0xa2,
+    QPP =3D 0x32,         QPP_4 =3D 0x34,
+} FlashCMD;
+
+static int aspeed_smc_num_dummies(uint8_t command)
+{
+    switch (command) { /* check for dummies */
+    case READ: /* no dummy bytes/cycles */
+    case PP:
+    case DPP:
+    case QPP:
+    case READ_4:
+    case PP_4:
+    case QPP_4:
+        return 0;
+    case FAST_READ:
+    case DOR:
+    case QOR:
+    case DOR_4:
+    case QOR_4:
+        return 1;
+    case DIOR:
+    case FAST_READ_4:
+    case DIOR_4:
+        return 2;
+    case QIOR:
+    case QIOR_4:
+        return 4;
+    default:
+        return -1;
+    }
+}
+
+static bool aspeed_smc_do_snoop(AspeedSMCFlash *fl,  uint64_t data,
+                                unsigned size)
+{
+    AspeedSMCState *s =3D fl->controller;
+    uint8_t addr_width =3D aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
+
+    if (s->snoop_index =3D=3D SNOOP_OFF) {
+        return false; /* Do nothing */
+
+    } else if (s->snoop_index =3D=3D SNOOP_START) {
+        uint8_t cmd =3D data & 0xff;
+        int ndummies =3D aspeed_smc_num_dummies(cmd);
+
+        /*
+         * No dummy cycles are expected with the current command. Turn
+         * off snooping and let the transfer proceed normally.
+         */
+        if (ndummies <=3D 0) {
+            s->snoop_index =3D SNOOP_OFF;
+            return false;
+        }
+
+        s->snoop_dummies =3D ndummies * 8;
+
+    } else if (s->snoop_index >=3D addr_width + 1) {
+
+        /* The SPI transfer has reached the dummy cycles sequence */
+        for (; s->snoop_dummies; s->snoop_dummies--) {
+            ssi_transfer(s->spi, s->regs[R_DUMMY_DATA] & 0xff);
+        }
+
+        /* If no more dummy cycles are expected, turn off snooping */
+        if (!s->snoop_dummies) {
+            s->snoop_index =3D SNOOP_OFF;
+        } else {
+            s->snoop_index +=3D size;
+        }
+
+        /*
+         * Dummy cycles have been faked already. Ignore the current
+         * SPI transfer
+         */
+        return true;
+    }
+
+    s->snoop_index +=3D size;
+    return false;
+}
+
 static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t d=
ata,
                                    unsigned size)
 {
@@ -602,6 +700,10 @@ static void aspeed_smc_flash_write(void *opaque, hwa=
ddr addr, uint64_t data,
=20
     switch (aspeed_smc_flash_mode(fl)) {
     case CTRL_USERMODE:
+        if (aspeed_smc_do_snoop(fl, data, size)) {
+            break;
+        }
+
         for (i =3D 0; i < size; i++) {
             ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
         }
@@ -634,7 +736,9 @@ static const MemoryRegionOps aspeed_smc_flash_ops =3D=
 {
=20
 static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
 {
-    const AspeedSMCState *s =3D fl->controller;
+    AspeedSMCState *s =3D fl->controller;
+
+    s->snoop_index =3D aspeed_smc_is_ce_stop_active(fl) ? SNOOP_OFF : SN=
OOP_START;
=20
     qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
 }
@@ -670,6 +774,9 @@ static void aspeed_smc_reset(DeviceState *d)
     if (s->ctrl->segments =3D=3D aspeed_segments_fmc) {
         s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0=
);
     }
+
+    s->snoop_index =3D SNOOP_OFF;
+    s->snoop_dummies =3D 0;
 }
=20
 static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int =
size)
@@ -1100,10 +1207,12 @@ static void aspeed_smc_realize(DeviceState *dev, =
Error **errp)
=20
 static const VMStateDescription vmstate_aspeed_smc =3D {
     .name =3D "aspeed.smc",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
+        VMSTATE_UINT8(snoop_index, AspeedSMCState),
+        VMSTATE_UINT8(snoop_dummies, AspeedSMCState),
         VMSTATE_END_OF_LIST()
     }
 };
--=20
2.20.1

