Received: by 10.25.150.194 with SMTP id y185csp2496832lfd;
        Tue, 29 Nov 2016 10:38:12 -0800 (PST)
X-Received: by 10.200.34.5 with SMTP id o5mr24532911qto.32.1480444692502;
        Tue, 29 Nov 2016 10:38:12 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r6si35561319qkr.318.2016.11.29.10.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 10:38:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBnIB-0003u9-B6
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 13:38:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBnHU-0003sX-N6
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 13:37:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBnHR-0007w9-JW
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 13:37:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52834)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBnHR-0007vN-9n
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 13:37:25 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uATIYOk2060046
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 13:37:24 -0500
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
	by mx0a-001b2d01.pphosted.com with ESMTP id 271b7e03m2-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 13:37:24 -0500
Received: from localhost
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <clg@kaod.org>;
	Tue, 29 Nov 2016 18:25:44 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 29 Nov 2016 18:23:37 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id C2FC92190144; 
	Tue, 29 Nov 2016 16:12:03 +0000 (GMT)
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id uATGCqIP33358022; Tue, 29 Nov 2016 16:12:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC28E520CC;
	Tue, 29 Nov 2016 15:11:36 +0000 (GMT)
Received: from smtp.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.1])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 89067520A3;
	Tue, 29 Nov 2016 15:11:36 +0000 (GMT)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(hermes.lab.toulouse-stg.fr.ibm.com [9.101.4.42])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 01C14220668;
	Tue, 29 Nov 2016 17:07:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 29 Nov 2016 17:07:35 +0100
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112918-0008-0000-0000-000003B3E729
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112918-0009-0000-0000-00001B992857
Message-Id: <1480435656-28497-1-git-send-email-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-29_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611290308
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id uATIYOk2060046
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH for-2.9 29/30] aspeed/scu: add a
 aspeed_scu_get_clk() helper
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
	Marcin Krzeminski <marcin.krzeminski@nokia.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Xx0fhYdELEt

The clock frequency is defined in the HW STRAP1 register of the SCU
device.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_scu.c         | 12 ++++++++++++
 include/hw/misc/aspeed_scu.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 95022d3607ad..351b8f79aca0 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -268,6 +268,18 @@ bool is_supported_silicon_rev(uint32_t silicon_rev)
     return false;
 }
=20
+#define ASPEED_PLL_25MHZ    25000000
+#define ASPEED_PLL_24MHZ    24000000
+#define ASPEED_PLL_12MHZ    12000000
+
+uint32_t aspeed_scu_get_clk(AspeedSCUState *scu)
+{
+    if (scu->hw_strap1 & AST2400_CLK_25M_IN)
+        return ASPEED_PLL_25MHZ;
+    else
+        return ASPEED_PLL_24MHZ;
+}
+
 static void aspeed_scu_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index bd4ac013f997..067f9f01819d 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -37,6 +37,7 @@ typedef struct AspeedSCUState {
 #define AST2500_A1_SILICON_REV   0x04010303U
=20
 extern bool is_supported_silicon_rev(uint32_t silicon_rev);
+extern uint32_t aspeed_scu_get_clk(AspeedSCUState *scu);
=20
 /*
  * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
--=20
2.7.4

