Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp109495wrt;
        Fri, 11 Jan 2019 04:58:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4vkntYoj7b3HspLPxo3gwJWnphOfrcKQl7mnoo3YZo28OkbzwQWIJFIXzMmiQ3P97JGD7K
X-Received: by 2002:adf:efd1:: with SMTP id i17mr13104315wrp.200.1547211508968;
        Fri, 11 Jan 2019 04:58:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547211508; cv=none;
        d=google.com; s=arc-20160816;
        b=lFhSMBEUveYWb+5EnuvKHz9JghmAfLEcdce/Cd22MXPHdepi/z6ytise6pbqPrs4hU
         TnrRZCqeHFViTcAjjUp3j0X/C9Te9+7+eIj0FnUguC2bdI5zxAEgC0CP7xjzxOuVBbu/
         ORIAiuoKekNkcXnbwekqzVAxN5gI6i0ZVTAFhAs3gE85Z8EzK06b2/795iFi8urEdzTE
         bYf1ruUvgmRO0C3JxuD4LzPOf4lKQZA3MP5qm4XQr067zN2grwhTfBA04bpfpzzMwo5q
         aNanV6mQWzf9Tbkv65hYrAuy0iQ4EnZE1L3VccSJUyZr6k6uF9cRGQnnj3rTUYGiodNn
         Zi/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:message-id:mime-version:date:to:from;
        bh=QXptKaal/mZPHDwwNZDpBrQqqC8IHcOI1lp2LUjE4Uc=;
        b=oXmwi1/zOjWnrK+pXo2XzapNMzvlNcD4ck73yNl9uW0kbuWl6u4/TCl2blY4IBk5wz
         pdprU5SHx5hsdlI1opjjvtMgxsIdpcgej1lLowZantxsAhk7efGQzayNNY4LdRfsswVK
         htr6zHMr44NP6jO2DfxyFp+OjunmXc+WE4eXL+ETDQ4hAALp7m5I00kdU/VMBmahdkh4
         nvvEWBtIe83P9Db0egYz4VjKHEwqfnuFsVG2TRHD3/7H07B+k1XDmtJtiAQOChnZeRmk
         rCk8UIhJowUbWVn8PW/OeaJbsV/SawLGS1l6EMfoEZofww4Ts6HC+nhYpZKi+xkAagSD
         aUZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si13151984wmf.162.2019.01.11.04.58.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 04:58:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghwOK-0001YB-1q
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 07:58:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1ghwO5-0001WY-KM
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 07:58:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1ghwO4-0005DQ-LH
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 07:58:13 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34198
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1ghwO4-0005Cu-Gm
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 07:58:12 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	x0BCvTwu104687
	for <qemu-arm@nongnu.org>; Fri, 11 Jan 2019 07:58:11 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2pxuks010p-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Fri, 11 Jan 2019 07:58:10 -0500
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <clg@kaod.org>;
	Fri, 11 Jan 2019 12:58:09 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Fri, 11 Jan 2019 12:58:06 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x0BCw5YS55378116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 11 Jan 2019 12:58:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B70C2AE055;
	Fri, 11 Jan 2019 12:58:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C474AE045;
	Fri, 11 Jan 2019 12:58:05 +0000 (GMT)
Received: from smtp.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.1])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 11 Jan 2019 12:58:05 +0000 (GMT)
Received: from zorba.kaod.org.com (sig-9-145-183-238.de.ibm.com
	[9.145.183.238])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id C9577220234;
	Fri, 11 Jan 2019 13:58:03 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 13:57:59 +0100
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19011112-0008-0000-0000-000002AF7AEA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19011112-0009-0000-0000-0000221B84D2
Message-Id: <20190111125759.31577-1-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-01-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=509 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1901110106
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id x0BCvTwu104687
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-arm] [PATCH] ftgmac100: implement the new MDIO interface on
 Aspeed SoC
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
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2KUWFH35/n52

The PHY behind the MAC of an Aspeed SoC can be controlled using two
different MDC/MDIO interfaces. The same registers PHYCR (MAC60) and
PHYDATA (MAC64) are involved but they have a different layout.

BIT31 of the Feature Register (MAC40) controls which MDC/MDIO
interface is active.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 80 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 68 insertions(+), 12 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 909c1182eebe..790430346b51 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -89,6 +89,18 @@
 #define FTGMAC100_PHYDATA_MIIWDATA(x)       ((x) & 0xffff)
 #define FTGMAC100_PHYDATA_MIIRDATA(x)       (((x) >> 16) & 0xffff)
=20
+/*
+ * PHY control register - New MDC/MDIO interface
+ */
+#define FTGMAC100_PHYCR_NEW_DATA(x)     (((x) >> 16) & 0xffff)
+#define FTGMAC100_PHYCR_NEW_FIRE        (1 << 15)
+#define FTGMAC100_PHYCR_NEW_ST_22       (1 << 12)
+#define FTGMAC100_PHYCR_NEW_OP(x)       (((x) >> 10) & 3)
+#define   FTGMAC100_PHYCR_NEW_OP_WRITE    0x1
+#define   FTGMAC100_PHYCR_NEW_OP_READ     0x2
+#define FTGMAC100_PHYCR_NEW_DEV(x)      (((x) >> 5) & 0x1f)
+#define FTGMAC100_PHYCR_NEW_REG(x)      ((x) & 0x1f)
+
 /*
  * Feature Register
  */
@@ -269,9 +281,9 @@ static void phy_reset(FTGMAC100State *s)
     s->phy_int =3D 0;
 }
=20
-static uint32_t do_phy_read(FTGMAC100State *s, int reg)
+static uint16_t do_phy_read(FTGMAC100State *s, uint8_t reg)
 {
-    uint32_t val;
+    uint16_t val;
=20
     switch (reg) {
     case MII_BMCR: /* Basic Control */
@@ -336,7 +348,7 @@ static uint32_t do_phy_read(FTGMAC100State *s, int re=
g)
                        MII_BMCR_FD | MII_BMCR_CTST)
 #define MII_ANAR_MASK 0x2d7f
=20
-static void do_phy_write(FTGMAC100State *s, int reg, uint32_t val)
+static void do_phy_write(FTGMAC100State *s, uint8_t reg, uint16_t val)
 {
     switch (reg) {
     case MII_BMCR:     /* Basic Control */
@@ -373,6 +385,55 @@ static void do_phy_write(FTGMAC100State *s, int reg,=
 uint32_t val)
     }
 }
=20
+static void do_phy_new_ctl(FTGMAC100State *s)
+{
+    uint8_t reg;
+    uint16_t data;
+
+    if (!(s->phycr & FTGMAC100_PHYCR_NEW_ST_22)) {
+        qemu_log_mask(LOG_UNIMP, "%s: unsupported ST code\n", __func__);
+        return;
+    }
+
+    /* Nothing to do */
+    if (!(s->phycr & FTGMAC100_PHYCR_NEW_FIRE)) {
+        return;
+    }
+
+    reg =3D FTGMAC100_PHYCR_NEW_REG(s->phycr);
+    data =3D FTGMAC100_PHYCR_NEW_DATA(s->phycr);
+
+    switch (FTGMAC100_PHYCR_NEW_OP(s->phycr)) {
+    case FTGMAC100_PHYCR_NEW_OP_WRITE:
+        do_phy_write(s, reg, data);
+        break;
+    case FTGMAC100_PHYCR_NEW_OP_READ:
+        s->phydata =3D do_phy_read(s, reg) & 0xffff;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid OP code %08x\n",
+                      __func__, s->phycr);
+    }
+
+    s->phycr &=3D ~FTGMAC100_PHYCR_NEW_FIRE;
+}
+
+static void do_phy_ctl(FTGMAC100State *s)
+{
+    uint8_t reg =3D FTGMAC100_PHYCR_REG(s->phycr);
+
+    if (s->phycr & FTGMAC100_PHYCR_MIIWR) {
+        do_phy_write(s, reg, s->phydata & 0xffff);
+        s->phycr &=3D ~FTGMAC100_PHYCR_MIIWR;
+    } else if (s->phycr & FTGMAC100_PHYCR_MIIRD) {
+        s->phydata =3D do_phy_read(s, reg) << 16;
+        s->phycr &=3D ~FTGMAC100_PHYCR_MIIRD;
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no OP code %08x\n",
+                      __func__, s->phycr);
+    }
+}
+
 static int ftgmac100_read_bd(FTGMAC100Desc *bd, dma_addr_t addr)
 {
     if (dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd))) {
@@ -628,7 +689,6 @@ static void ftgmac100_write(void *opaque, hwaddr addr=
,
                           uint64_t value, unsigned size)
 {
     FTGMAC100State *s =3D FTGMAC100(opaque);
-    int reg;
=20
     switch (addr & 0xff) {
     case FTGMAC100_ISR: /* Interrupt status */
@@ -711,14 +771,11 @@ static void ftgmac100_write(void *opaque, hwaddr ad=
dr,
         break;
=20
     case FTGMAC100_PHYCR:  /* PHY Device control */
-        reg =3D FTGMAC100_PHYCR_REG(value);
         s->phycr =3D value;
-        if (value & FTGMAC100_PHYCR_MIIWR) {
-            do_phy_write(s, reg, s->phydata & 0xffff);
-            s->phycr &=3D ~FTGMAC100_PHYCR_MIIWR;
+        if (s->revr & FTGMAC100_REVR_NEW_MDIO_INTERFACE) {
+            do_phy_new_ctl(s);
         } else {
-            s->phydata =3D do_phy_read(s, reg) << 16;
-            s->phycr &=3D ~FTGMAC100_PHYCR_MIIRD;
+            do_phy_ctl(s);
         }
         break;
     case FTGMAC100_PHYDATA:
@@ -728,8 +785,7 @@ static void ftgmac100_write(void *opaque, hwaddr addr=
,
         s->dblac =3D value;
         break;
     case FTGMAC100_REVR:  /* Feature Register */
-        /* TODO: Only Old MDIO interface is supported */
-        s->revr =3D value & ~FTGMAC100_REVR_NEW_MDIO_INTERFACE;
+        s->revr =3D value;
         break;
     case FTGMAC100_FEAR1: /* Feature Register 1 */
         s->fear1 =3D value;
--=20
2.20.1

