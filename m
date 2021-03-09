Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2809948lfg;
        Tue, 9 Mar 2021 05:30:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrTarUDBaavkPhCbhfkpP5EO8UYJxfigMHRy7pCvjoToN3Gz+xKf45SVNv9IiOBexJCN3K
X-Received: by 2002:a05:6e02:b47:: with SMTP id f7mr4230153ilu.83.1615296655574;
        Tue, 09 Mar 2021 05:30:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615296655; cv=none;
        d=google.com; s=arc-20160816;
        b=w/mEAzbUZpB0UC4PAR0MMl6QDeZyuK19YQqskoffNJQ8acXg9igXGzfOz6oIKrT6lP
         NBO9qrUeAzNxUGBy/th5xecu7lX3zbCCU6J3OoM6dKGFoZWiN/ieOeiVz4DgUbiVJoTC
         N29MyuTEIPfQ5j602h0wCBsrfQE4UtRZVngWkaYLaUnIORhEe2cx3VMOdDZvpvRJVxza
         fR0O14xHYVG8kKI6jx+68yTMRnBBUrQ6wUbXpg+aDRBZumD3dpTydIV7aGeZFhLbblSg
         57yO8v1VftEiCfbIQKa72VZcIv+QZaDcgLm18A4iLMamLMSpmrdHpCoH39I1ufx1TGkC
         WmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=9z4p8bMRH3z4zweIHhWpq5SrpEvw5xtcjhGxb/Uoulk=;
        b=gjQEyrr+dN8KlUR/MYMQ+aadVYZuRGaiXlf35UriGJB1UYAxKDLs2xmJf6MIlmZJzj
         9cK+MUZl766bHxTM19UePNNVZgCOim3dU+EVsKG6Zrx42RJb+v3nG3wvbHKnQDt1lIDj
         2CO3tKA/M4koF3ws95yHQpfBFTAYkaCkGxQjljpLRpcx42QkCZlNj2hW5mRquZquS27p
         lycPE8qnTMUHNFx8Jj+mtpajhmB3Ty65i6lYbdALp00sZ3HTc9c6ydz+hbn/DocIHfZN
         7loedu7oVinzz7NiUxfLLcI8W8o2pyJck+1INlld0QvrhlJlWqE5RAjTf2gEeNnSG0GK
         6lTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si13482511ilu.92.2021.03.09.05.30.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 05:30:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJcRq-0005hw-Tk
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 08:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEe-00027w-Gm; Tue, 09 Mar 2021 08:17:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEZ-0007D9-5v; Tue, 09 Mar 2021 08:17:15 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129D2p6B098851; Tue, 9 Mar 2021 08:16:51 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37640j2drf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 08:16:50 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129D9WRJ026686;
 Tue, 9 Mar 2021 13:16:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3768mv81a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 13:16:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 129DGUF424904158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 13:16:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A89642042;
 Tue,  9 Mar 2021 13:16:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA7D342041;
 Tue,  9 Mar 2021 13:16:45 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Mar 2021 13:16:45 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.251])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2FD13220270;
 Tue,  9 Mar 2021 14:16:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/7] hw/arm: ast2600: Correct the iBT interrupt ID
Date: Tue,  9 Mar 2021 14:16:39 +0100
Message-Id: <20210309131641.2709380-6-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309131641.2709380-1-clg@kaod.org>
References: <20210309131641.2709380-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=556 clxscore=1034 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103090064
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xng1yxc5PtAj

From: Andrew Jeffery <andrew@aj.id.au>

The AST2600 allocates distinct GIC IRQs for the LPC subdevices such as
the iBT device. Previously on the AST2400 and AST2500 the LPC subdevices
shared a single LPC IRQ.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210302014317.915120-4-andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 1dc56ce4781c..7635d4bae9d0 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -98,7 +98,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
     [ASPEED_DEV_WDT]       =3D 24,
     [ASPEED_DEV_PWM]       =3D 44,
     [ASPEED_DEV_LPC]       =3D 35,
-    [ASPEED_DEV_IBT]       =3D 35,    /* LPC */
+    [ASPEED_DEV_IBT]       =3D 143,
     [ASPEED_DEV_I2C]       =3D 110,   /* 110 -> 125 */
     [ASPEED_DEV_ETH1]      =3D 2,
     [ASPEED_DEV_ETH2]      =3D 3,
--=20
2.26.2

