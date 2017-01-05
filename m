Received: by 10.25.205.13 with SMTP id d13csp9581148lfg;
        Wed, 4 Jan 2017 20:37:52 -0800 (PST)
X-Received: by 10.233.235.72 with SMTP id b69mr75281881qkg.144.1483591072494;
        Wed, 04 Jan 2017 20:37:52 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c33si46768865qte.33.2017.01.04.20.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jan 2017 20:37:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cOzoD-0002mN-SY
	for alex.bennee@linaro.org; Wed, 04 Jan 2017 23:37:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cOzmH-0001gM-AN
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cOzmE-0001PD-2a
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33539
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cOzmD-0001Ob-OD
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:45 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	v054XmNQ022160
	for <qemu-devel@nongnu.org>; Wed, 4 Jan 2017 23:35:45 -0500
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
	by mx0b-001b2d01.pphosted.com with ESMTP id 27s8d0xhu9-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Wed, 04 Jan 2017 23:35:44 -0500
Received: from localhost
	by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <alastair@au1.ibm.com>;
	Thu, 5 Jan 2017 14:35:42 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 5 Jan 2017 14:35:39 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id C01903578065;
	Thu,  5 Jan 2017 15:35:38 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
	by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	v054ZeKm43384944; Thu, 5 Jan 2017 15:35:40 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
	by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	v054Zb01008961; Thu, 5 Jan 2017 15:35:38 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	v054Zb2r008955; Thu, 5 Jan 2017 15:35:37 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7FFEEA039B;
	Thu,  5 Jan 2017 15:35:37 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Date: Thu,  5 Jan 2017 15:34:27 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170105043430.3176-1-alastair@au1.ibm.com>
References: <20170105043430.3176-1-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17010504-0052-0000-0000-000002064922
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17010504-0053-0000-0000-0000078B76EC
Message-Id: <20170105043430.3176-5-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-01-05_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1701050074
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH v5 4/7] qtest: Fix whitespace
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R3Iaip+9SR2O

From: Alastair D'Silva <alastair@d-silva.org>

Fix 2 cases of incorrect indentation

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 qtest.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qtest.c b/qtest.c
index a947892..143077e 100644
--- a/qtest.c
+++ b/qtest.c
@@ -309,7 +309,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         if (!dev) {
             qtest_send_prefix(chr);
             qtest_send(chr, "FAIL Unknown device\n");
-	    return;
+            return;
         }
 
         if (irq_intercept_dev) {
@@ -319,7 +319,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             } else {
                 qtest_send(chr, "OK\n");
             }
-	    return;
+            return;
         }
 
         QLIST_FOREACH(ngl, &dev->gpios, node) {
-- 
2.9.3

