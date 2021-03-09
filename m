Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2811712lfg;
        Tue, 9 Mar 2021 05:33:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXy53FdLNYBVRD1NdhgDJO/i4z+eECx5KnFKiZqHWKmcjmcaHqa7FvAKOsK2cw+N0Oo8oM
X-Received: by 2002:a6b:7e02:: with SMTP id i2mr22383664iom.120.1615296790907;
        Tue, 09 Mar 2021 05:33:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615296790; cv=none;
        d=google.com; s=arc-20160816;
        b=sgNeXZJlAb3zTxdFKM9NYc//v78XmCtl/Q7Q/mjCIAajtu8EqrJlRVUKd59Lp1zs0t
         ktf59rqf0RRVJ/icf0KCmCtju12zZ41bu50Av6vAtUQUj9K+NRlAZx7V6k8i0BZxTbGg
         0r0bWXVrVWsv5zaAWrDWvbwJ+Dqch6Ybb0GQz8XvdTmbAyUKzeJYkYaunTGNaxYgrxdU
         GZyaMTU6xcCWwxv/aTraQbcvOhtIh6ti+14AreCN9wEXZDt6kkvBdzr2uStsfqgwGymq
         YcXfmCK+iWqWewA/4STJd+4iWArFqiM/Q+3PQ0Q9Xkp8xKZEM8O6URH5lh6aoPyTC+/V
         GnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=a/EomKl5QhAdgZW+JQ/w4ti663V7vNUdTgU9TqBqEVw=;
        b=lnrM6uwEMCl2fVoaw5XISI8LUHaX+YGR93S55nq52E9Pm6PdckzGXvh8dtAHhfVyVo
         bM/dMZuHBvVBg/PnyHPZTWwB8Gm124f78m6azHRVY0YEalSGYEjT0YSDWGMxUcvT1wDZ
         GYVsrzm3tr/NXlHY6zYU//SfbVl04oc0cCPTyZZQMyLiHPysfCqdnAjJ13IITSAef3og
         Qd+OJA5X5egX879VbQhK6QVPM9SY0S/uPkwAHeLd3lV2CMHRpzI5HlqLOiIW4VE6KY4d
         MRSCfZUHBuV9rZNC21yRAkDqGWkBNREWSRFaJiTBeyL8pm0m9LKwUg07wkHlobrbI09l
         oeIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si13436548jab.56.2021.03.09.05.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 05:33:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJcU2-0000OU-5Q
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 08:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEV-00025n-Nj; Tue, 09 Mar 2021 08:17:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEQ-000762-DH; Tue, 09 Mar 2021 08:17:07 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129D3lJE087316; Tue, 9 Mar 2021 08:16:49 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375wet2v5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 08:16:49 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129D7v8i029541;
 Tue, 9 Mar 2021 13:16:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3768mpr130-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 13:16:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 129DGiEH33096066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 13:16:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55688A4054;
 Tue,  9 Mar 2021 13:16:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 195B0A405B;
 Tue,  9 Mar 2021 13:16:44 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Mar 2021 13:16:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.251])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 76D9922025C;
 Tue,  9 Mar 2021 14:16:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/7] hw/arm/aspeed: Fix location of firmware images in
 documentation
Date: Tue,  9 Mar 2021 14:16:36 +0100
Message-Id: <20210309131641.2709380-3-clg@kaod.org>
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
 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1034 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090064
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, PDS_OTHER_BAD_TLD=1.999,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZppH8AilZsJ1

Firmware images can be found on the OpenBMC jenkins site and on the
OpenBMC GitHub release page.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20210303072743.1551329-1-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 690bada7842b..8972aa3f7bbe 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -72,18 +72,22 @@ Missing devices
 Boot options
 ------------
=20
-The Aspeed machines can be started using the -kernel option to load a
-Linux kernel or from a firmware image which can be downloaded from the
-OpenPOWER jenkins :
+The Aspeed machines can be started using the ``-kernel`` option to
+load a Linux kernel or from a firmware. Images can be downloaded from
+the OpenBMC jenkins :
=20
-   https://openpower.xyz/
+   https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/distro=
=3Dubuntu,label=3Ddocker-builder
+
+or directly from the OpenBMC GitHub release repository :
+
+   https://github.com/openbmc/openbmc/releases
=20
 The image should be attached as an MTD drive. Run :
=20
 .. code-block:: bash
=20
   $ qemu-system-arm -M romulus-bmc -nic user \
-	-drive file=3Dflash-romulus,format=3Draw,if=3Dmtd -nographic
+	-drive file=3Dobmc-phosphor-image-romulus.static.mtd,format=3Draw,if=3D=
mtd -nographic
=20
 Options specific to Aspeed machines are :
=20
--=20
2.26.2

