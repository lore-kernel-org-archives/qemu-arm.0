Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1968872wrt;
        Thu, 24 Jan 2019 06:09:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4AsPj/mJDIbRcbBqEgs5MvIJXd+dzl7TAgB2tN8tk0FLM5WaLzSCa4v4Ad1Q75Hi4phFfS
X-Received: by 2002:a1c:8548:: with SMTP id h69mr2684635wmd.11.1548338946037;
        Thu, 24 Jan 2019 06:09:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548338946; cv=none;
        d=google.com; s=arc-20160816;
        b=KKQlMzqvu6rCRQjbtxhQAAGVVxyiudhUIV5IuXC6zXyie1oCYS5l/cHlxWTMk++9QQ
         LzNr+bHjo325GrNxw6+rnYtohfBg7zsdWoO5/0XUdxo3GKuOSGhWjR5YwasFtOLsyvrI
         7upynbuybgH+58SsVZTG5/Ri5yHt/qS9lIQLeTAIvXsYlK32j4R/23jM9744XzhK6yiN
         HZS8LoKi2NaVlotkN4Z/XsnSGvu4uQfUNJnpiNHiTPsYM/7+xeMBlrhcX+O7OhZI20v0
         DOo2V1VHy+i9ZEuy/khpVc/epm5wx+zoizTZX+weuT+LGMGp8rM13bKp9+cjrZ13dubj
         y6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:message-id:mime-version:references
         :in-reply-to:date:to:from;
        bh=mW0aQK1cbTgmCIUslb7K4QNg665tK84Ak8cx/dhDdXQ=;
        b=knGsC5rxsV4AT34eTsVckFwS/kBncdnzn68NwwwV8laL+WK6R6z81SGv86v/yDZeF4
         tx35/5dqRk5S+vCLLg7xDUPpmFx4KzqrnlN1iduvZJYjs6swl3d9oeySqVl6Jp2/Zebm
         N7H3Yykl+5uAixK/2TvXjWLXwOpEiGJ0TXhDCoW4/ZCISU04gOMqMtPAdU5Rt7DYIVEJ
         KNvBXYIe7xzFSvXnIkpATFqajK+pKbzyzlKllR02xlA37qjKtBG3xVLgQVoDEQND3VSM
         0om4EdZSYAWP8YFWcgPHKlDR8MqtacMKcerOS4+dT5w57YWaaHJF+6a9cTNwXWPhr1ju
         u6ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 59si82216114wrs.90.2019.01.24.06.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 06:09:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:54518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfgm-0008Rl-VE
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 09:09:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmfdZ-0006Ny-Ue
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 09:05:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmfdY-0000UP-Eq
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 09:05:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50012
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1gmfdY-0000ON-7s
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 09:05:44 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x0OE4tuK106283
	for <qemu-devel@nongnu.org>; Thu, 24 Jan 2019 09:05:35 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2q7e5g2egj-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Thu, 24 Jan 2019 09:05:34 -0500
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <clg@kaod.org>;
	Thu, 24 Jan 2019 14:05:31 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 24 Jan 2019 14:05:27 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x0OE5QQO54198456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 24 Jan 2019 14:05:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE2584C058;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB4A74C052;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from smtp.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.1])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from zorba.lab.toulouse-stg.fr.ibm.com
	(zorba.lab.toulouse-stg.fr.ibm.com [9.101.4.32])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 839A8220387;
	Thu, 24 Jan 2019 15:05:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Thu, 24 Jan 2019 15:05:19 +0100
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124140519.13838-1-clg@kaod.org>
References: <20190124140519.13838-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19012414-0016-0000-0000-00000249D955
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012414-0017-0000-0000-000032A41E80
Message-Id: <20190124140519.13838-5-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-01-24_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=722 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1901240102
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id x0OE4tuK106283
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH 4/4] aspeed/smc: snoop SPI transfers to fake
 dummy cycles
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +mUHUH0AuVc2

The m25p80 models dummy cycles using byte transfers. This works well
when the transfers are initiated by the QEMU model of a SPI controller
but when these are initiated by the OS, it breaks emulation.

Snoop the SPI transfer to catch commands requiring dummy cycles and
replace them with byte transfers compatible with the m25p80 model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
---
 include/hw/ssi/aspeed_smc.h |   3 +
 hw/ssi/aspeed_smc.c         | 115 +++++++++++++++++++++++++++++++++++-
 2 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 1f557313fa93..3b1e7fce6c86 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -98,6 +98,9 @@ typedef struct AspeedSMCState {
     uint8_t conf_enable_w0;
=20
     AspeedSMCFlash *flashes;
+
+    uint8_t snoop_index;
+    uint8_t snoop_dummies;
 } AspeedSMCState;
=20
 #endif /* ASPEED_SMC_H */
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 9f3b6f4b4501..f1e66870d71f 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -145,6 +145,9 @@
 /* Flash opcodes. */
 #define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
=20
+#define SNOOP_OFF         0xFF
+#define SNOOP_START       0x0
+
 /*
  * Default segments mapping addresses and size for each slave per
  * controller. These can be changed when board is initialized with the
@@ -566,6 +569,101 @@ static uint64_t aspeed_smc_flash_read(void *opaque,=
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
@@ -581,6 +679,10 @@ static void aspeed_smc_flash_write(void *opaque, hwa=
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
@@ -613,7 +715,9 @@ static const MemoryRegionOps aspeed_smc_flash_ops =3D=
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
@@ -652,6 +756,9 @@ static void aspeed_smc_reset(DeviceState *d)
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
@@ -793,10 +900,12 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
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

