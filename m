Received: by 10.103.86.15 with SMTP id k15csp536864vsb;
        Wed, 14 Dec 2016 21:55:27 -0800 (PST)
X-Received: by 10.55.106.134 with SMTP id f128mr563342qkc.121.1481781326965;
        Wed, 14 Dec 2016 21:55:26 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k57si233051qtk.254.2016.12.14.21.55.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Dec 2016 21:55:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHP0m-00052T-HK
	for alex.bennee@linaro.org; Thu, 15 Dec 2016 00:55:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cHOuq-0007B7-Lj
	for qemu-devel@nongnu.org; Thu, 15 Dec 2016 00:49:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cHOun-0003Jr-4u
	for qemu-devel@nongnu.org; Thu, 15 Dec 2016 00:49:16 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40461
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cHOum-0003Jb-UJ
	for qemu-devel@nongnu.org; Thu, 15 Dec 2016 00:49:13 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uBF5mf2p142376
	for <qemu-devel@nongnu.org>; Thu, 15 Dec 2016 00:49:12 -0500
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
	by mx0a-001b2d01.pphosted.com with ESMTP id 27bdm41tp5-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Thu, 15 Dec 2016 00:49:11 -0500
Received: from localhost
	by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <alastair@au1.ibm.com>;
	Thu, 15 Dec 2016 15:49:07 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 15 Dec 2016 15:49:00 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 259823578056;
	Thu, 15 Dec 2016 16:48:59 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uBF5mxDl30605516; Thu, 15 Dec 2016 16:48:59 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uBF5mwwc001148; Thu, 15 Dec 2016 16:48:58 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uBF5mwYD001145; Thu, 15 Dec 2016 16:48:58 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B478DA039A;
	Thu, 15 Dec 2016 16:48:57 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Thu, 15 Dec 2016 16:48:09 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161215054812.12602-1-alastair@au1.ibm.com>
References: <20161215054812.12602-1-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16121505-0048-0000-0000-000001ED41E7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16121505-0049-0000-0000-0000472F116E
Message-Id: <20161215054812.12602-6-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-15_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612150093
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH v4 5/8] hw/i2c: Tidy up NULL check for i2c
 slave init callbacks
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f+kqqlZSKFSZ

From: Alastair D'Silva <alastair@d-silva.org>

Remove unnecessary syntax

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 hw/i2c/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index ae3ca94..e40781e 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -262,9 +262,9 @@ static int i2c_slave_qdev_init(DeviceState *dev)
 
     if (sc->init) {
         return sc->init(s);
-    } else {
-        return 0;
     }
+
+    return 0;
 }
 
 DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
-- 
2.9.3

