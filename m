Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2297685lfo;
        Tue, 8 Mar 2022 04:25:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8lC481pD9sNWuGz0FvTUYunsaL2U4cBmZy4KmXwh9RznAsjtenlF6wPX8o7cvWmwVBXTm
X-Received: by 2002:a81:58c2:0:b0:2dc:488a:fa4b with SMTP id m185-20020a8158c2000000b002dc488afa4bmr12781359ywb.214.1646742332048;
        Tue, 08 Mar 2022 04:25:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646742332; cv=none;
        d=google.com; s=arc-20160816;
        b=DlSaWWspfuicvyrRpljfVLJScfbvx9mjRLw9z5D0w/QYDvBGf7OkxImbKGUoDrBk8M
         +CXiUKE60RECG8jLfPkplkPC0L/UVPclBM7qYHBhkstSozYr4hg0ewqmFsS0JOq6BbkN
         Ihno5eCq1sHLvijmyTGvKn1vQXXoC860CTgo+UIh/8u0ckz7+Xmvp2jX5b4JozCv9sER
         6Iw1zcKdtTBLa4+7nSrmI/MF2EtgsJpXt1ym9iYmJa0N57XqVOfPdEtQBIBcSXiVznxD
         1nf+zLlacW6KrIfe1hi3k6mYQfRqZj2XU3nYrNV4Og6tj/8gOcL9foqFDndiISkIvni6
         aM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=aqSEk9KwtVxW9+af/+7IMVZQiHur8p6HkyHdS5E51Qc=;
        b=qFrQrz3vjTAiATkvkPC939f8HShTgrSIqIqxa2pcAHQD2OPmLlC+o6QoFm3/n1Xx0j
         RaLokjKGKSUtkDoIf2VGeiEfiNqtT2wy+P/e3VxzLWtgJZG8R2i5ECNClzolSDxjtj4M
         s6rOKtjNEreHKj43MGLZStlCxfV9GlsP82mihB/Ao25Q72+UxUmTYmpUFUEETjY5C+sY
         rch2zMeWq/+LuuOg3YYYq98XczQnnBolAcLU+IiB231V/S16V09moHQFbdfzTmDuorbB
         vMlNDD9SXXjXTGaKJSjTWsFqoXL5g18NdOZy1iFQBxkMNS6kjxZwgpZw7ssl63z8LfnP
         4bQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d65-20020a25a347000000b006157cb9a8easi12006830ybi.648.2022.03.08.04.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 04:25:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRYuB-00067K-F1
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 07:25:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYr1-0000L5-PL; Tue, 08 Mar 2022 07:22:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYr0-0006Fd-76; Tue, 08 Mar 2022 07:22:15 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2289NDd0031169; 
 Tue, 8 Mar 2022 12:22:04 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ep0bd04us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:04 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228C9UPY006670;
 Tue, 8 Mar 2022 12:22:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3ekyg96brh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 228CAp6838273478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 12:10:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71C5311C052;
 Tue,  8 Mar 2022 12:22:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37F8E11C04A;
 Tue,  8 Mar 2022 12:22:00 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Mar 2022 12:22:00 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.238])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 801E922027F;
 Tue,  8 Mar 2022 13:21:59 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 09/11] hw/arm/aspeed: allow missing spi_model
Date: Tue,  8 Mar 2022 13:21:47 +0100
Message-Id: <20220308122149.1602798-10-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308122149.1602798-1-clg@kaod.org>
References: <20220308122149.1602798-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eAhDVbJOGfg0UStdEcIhbGw7RCXkp8NV
X-Proofpoint-ORIG-GUID: eAhDVbJOGfg0UStdEcIhbGw7RCXkp8NV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=491 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203080063
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Patrick Williams <patrick@stwcx.xyz>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R9QRB/cYdjvU

From: Patrick Williams <patrick@stwcx.xyz>

Generally all BMCs will use the fmc_model to hold their own flash
and most will have a spi_model to hold the managed system's flash,
but not all systems do.  Add a simple NULL check to allow a system
to set the spi_model as NULL to indicate it should not be instantiated.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Message-Id: <20220305000656.1944589-1-patrick@stwcx.xyz>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 90504ee44408..088550ed33b2 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -274,7 +274,11 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr =
addr, size_t rom_size,
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
                                       unsigned int count, int unit0)
 {
-    int i ;
+    int i;
+
+    if (!flashtype) {
+        return;
+    }
=20
     for (i =3D 0; i < count; ++i) {
         DriveInfo *dinfo =3D drive_get(IF_MTD, 0, unit0 + i);
--=20
2.34.1

