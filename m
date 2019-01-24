Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1965345wrt;
        Thu, 24 Jan 2019 06:06:10 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4tVuYiBESX54Ieqtt5Jy+rW9QKxAPNwDwWA1m+JDuw8xwLiCz07cXKHy/vkk1t2OMfwM3z
X-Received: by 2002:a1c:d082:: with SMTP id h124mr2647525wmg.21.1548338770066;
        Thu, 24 Jan 2019 06:06:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548338770; cv=none;
        d=google.com; s=arc-20160816;
        b=ITy7rWdZ3ky/aCDIS4B5a5YQRckdsSrwf6/PxIi7F3gH+SpCyth1X4kuGoP/WhI4SZ
         RmDR+CiEcf1cMeAIi49pNTbl8SuZAYFHSGlHD8hzLyNoQfkc8VOcH4RpBgcr+PyLpG42
         sqsVGkPbPQsLhBWmxSuTGLWxCaVKAuba8WJ2/ysKPkzgEQGIqbL7E2IQcahs4L7Ezcc+
         5ZJN5RUN3sgg6uEsytfSS0tkqCPpahXyPTROffo/Z/WNRoI55CVD6x+34mnXHbCjJQO3
         3Cws4R/Xu+NU/gxXpde1EKKizB2gXGhYi8rup8ZR4qvDIRJ7BcCdeLF2yGmeH/wffE19
         n0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:message-id:mime-version:references
         :in-reply-to:date:to:from;
        bh=fIdm+3ofzeZAIOmvk0ek/n6Jy4LmUK0SocPOpMu+wHw=;
        b=CTOEy/WugTm87mrQbgAFmZtTs/RbqRJlKo/kALlBacpRYl78oxECB9O/Flv8SaLv4j
         AeYAyncuafFo1cYYBwpseN0U1VHhtUKSmjO4nUbWIti+Nq1O+i5PiIVz+RBTrpFIXYnG
         aNHiIx+V5xSPlmcZ7RM4p/FAk4cF/74PP0dM4HOOtYn13xbW9RuzDf9SHWYEscFOdm0H
         jifejQ6MqLG+6pmlMXrdRP4BSqtpgBzCGUdBPaa9wpzQuJk4u92kMaspT6R6km1aanQI
         n4GifnLhhHL9YVCo2YbMF3RA9IME73fipyM/+WEjNq+tTF5VFqQD7Cp7XML9fVu80mOW
         UpVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si36274730wrm.253.2019.01.24.06.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 06:06:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:54497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfdx-0006Q1-4S
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 09:06:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmfdZ-0006Nb-CO
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 09:05:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmfdY-0000Ug-GU
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 09:05:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34366
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1gmfdY-0000Nk-AJ
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 09:05:44 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x0OE53ib102826
	for <qemu-devel@nongnu.org>; Thu, 24 Jan 2019 09:05:34 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2q7dx535ap-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Thu, 24 Jan 2019 09:05:33 -0500
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <clg@kaod.org>;
	Thu, 24 Jan 2019 14:05:32 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 24 Jan 2019 14:05:27 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x0OE5QsH27918538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 24 Jan 2019 14:05:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C226BAE053;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE3BDAE056;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from smtp.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.1])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 24 Jan 2019 14:05:26 +0000 (GMT)
Received: from zorba.lab.toulouse-stg.fr.ibm.com
	(zorba.lab.toulouse-stg.fr.ibm.com [9.101.4.32])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 71E57220372;
	Thu, 24 Jan 2019 15:05:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Thu, 24 Jan 2019 15:05:18 +0100
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124140519.13838-1-clg@kaod.org>
References: <20190124140519.13838-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19012414-0016-0000-0000-00000249D954
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012414-0017-0000-0000-000032A41E7F
Message-Id: <20190124140519.13838-4-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-01-24_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=971 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1901240102
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id x0OE53ib102826
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH 3/4] aspeed/smc: Add dummy data register
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
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ge4Q8fWyZLkB

The SMC controllers have a register containing the byte that will be
used as dummy output. It can be modified by software.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/ssi/aspeed_smc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6045ca11b969..9f3b6f4b4501 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -98,8 +98,8 @@
 /* Misc Control Register #1 */
 #define R_MISC_CTRL1      (0x50 / 4)
=20
-/* Misc Control Register #2 */
-#define R_MISC_CTRL2      (0x54 / 4)
+/* SPI dummy cycle data */
+#define R_DUMMY_DATA      (0x54 / 4)
=20
 /* DMA Control/Status Register */
 #define R_DMA_CTRL        (0x80 / 4)
@@ -529,7 +529,7 @@ static void aspeed_smc_flash_setup(AspeedSMCFlash *fl=
, uint32_t addr)
      */
     if (aspeed_smc_flash_mode(fl) =3D=3D CTRL_FREADMODE) {
         for (i =3D 0; i < aspeed_smc_flash_dummies(fl); i++) {
-            ssi_transfer(fl->controller->spi, 0xFF);
+            ssi_transfer(fl->controller->spi, s->regs[R_DUMMY_DATA] & 0x=
ff);
         }
     }
 }
@@ -664,6 +664,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
         addr =3D=3D s->r_timings ||
         addr =3D=3D s->r_ce_ctrl ||
         addr =3D=3D R_INTR_CTRL ||
+        addr =3D=3D R_DUMMY_DATA ||
         (addr >=3D R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slav=
es) ||
         (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_slaves=
)) {
         return s->regs[addr];
@@ -697,6 +698,8 @@ static void aspeed_smc_write(void *opaque, hwaddr add=
r, uint64_t data,
         if (value !=3D s->regs[R_SEG_ADDR0 + cs]) {
             aspeed_smc_flash_set_segment(s, cs, value);
         }
+    } else if (addr =3D=3D R_DUMMY_DATA) {
+        s->regs[addr] =3D value & 0xff;
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
                       __func__, addr);
--=20
2.20.1

