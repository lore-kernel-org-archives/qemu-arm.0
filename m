Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1576009lfq;
        Sun, 27 Feb 2022 23:19:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoOutnxMqJVuTNbjbnbN6yN0bfSFxMsamkIOhMgbjU2Z+Ouys3CaCY6PEz4Xr4BccOYuTO
X-Received: by 2002:a05:622a:15cc:b0:2de:8dbd:8b3 with SMTP id d12-20020a05622a15cc00b002de8dbd08b3mr15402032qty.524.1646032739998;
        Sun, 27 Feb 2022 23:18:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646032739; cv=none;
        d=google.com; s=arc-20160816;
        b=KRfzsd26gZGiMQ2SMDO0fa288DRjsq/g3NCrW7WJNCNk/lzi6380f6BCuWe3hRRcd8
         pmzt4Bl7+AUgTprwoCBto+enZbx25igsm6pM+4IifVdmJu6EhEyWa0JjCcZoAWHp0Q1b
         Q09pHQ5ZE5SQD8AiFuI4dczrV7YDmOM10re0b49lNQb1FJ8R7CCEGEqa0ElbQxI6/R/A
         0q+1Xm77qoo4NlHR45Me9nwB4WvzcB6lPNmgf9Idi4UaDTotm+b4mYREm9fqOa8HAggw
         oIfSndBCL7hdi7RxqGRxqltugX0AV2AP0hksNTFsULPG1/Ijnmt7+6+/nN3JXw4flTuN
         wOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=IRVc8UrucN2KS+qj+oRxu6Qx/29ynOHMayuhDFTns10=;
        b=cTk8X41DKdyRzkEp8tSvnT7+BN9nGfGcE/FY6X86TnZsDKnxqVa+XSyyIGs6xH9CW/
         pDTt60DAw9gP5QX4fWvKkCX/KocyYnAcSV3jrm0Hh3qDF/3P0J2134BjGbO362eCiUOC
         zud537YwHVhSR4xuPagfB/AYxYEVKqv5aurc7tVpbU5wCU5IGzzP68w1n8aoFPpp0tet
         9CoQ9OMITjjRvveO95vte1AAjbja8B1oIc7sqft5CTe4PATcwU6u69dzbZbelQSJdQSq
         2P8weK/TI4rIhSt40AhwxswC4UyiQLPXrBthm54596qlE5et7Pf39LZYrj/Rlg+BWfl5
         dHCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q89-20020a0c9162000000b004325ec49312si3095127qvq.554.2022.02.27.23.18.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Feb 2022 23:18:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nOaJ9-0001tW-FW
	for alex.bennee@linaro.org; Mon, 28 Feb 2022 02:18:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOaDW-0004KF-Qj; Mon, 28 Feb 2022 02:13:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51738
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOaDU-0004HQ-RV; Mon, 28 Feb 2022 02:13:10 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S5cShh004878; 
 Mon, 28 Feb 2022 07:12:51 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3egnvjw90n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:12:51 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S77GuO029085;
 Mon, 28 Feb 2022 07:12:49 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu960ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:12:49 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7ClRr52298108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:12:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17AB64203F;
 Mon, 28 Feb 2022 07:12:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D34D742041;
 Mon, 28 Feb 2022 07:12:46 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 07:12:46 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1B2CC2201B4;
 Mon, 28 Feb 2022 08:12:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 4/7] aspeed: rainier: Add strap values taken from hardware
Date: Mon, 28 Feb 2022 08:12:36 +0100
Message-Id: <20220228071239.404171-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228071239.404171-1-clg@kaod.org>
References: <20220228071239.404171-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9AQomKxjT844uBZMcCIzfN5ATGHKtaln
X-Proofpoint-ORIG-GUID: 9AQomKxjT844uBZMcCIzfN5ATGHKtaln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=390 mlxscore=0 priorityscore=1501 clxscore=1034
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280040
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gny+glzUo/Nq

From: Joel Stanley <joel@jms.id.au>

When time permits, we should introduce defines for the HW strapping
registers to cleanly decode the values.

SCU500 =3D 0x00422016
  Disable ARM JTAG trusted world debug: 0x1
  Disable ARM JTAG debug: 0x1
  VGA Memory Size: 0x1 [16MB]
  Cortex M3: 0x1 [Disabled]
  Boot device: 0x1 [eMMC]
  Reserved: 0x1

SCU510 =3D 0x80000848
  Secure Boot Enable: 0x1
  Enable boot SPI or eMMC ABR (second boot): 0x1
  Enable LPC mode: 0x1 [LPC]
  Disable LPC SuperIO 0x2e/0x4e: 0x1

Signed-off-by: Joel Stanley <joel@jms.id.au>
[ clg: rewrote the commit log ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7590b36bb017..f71a5d87473f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -160,8 +160,8 @@ struct AspeedMachineState {
 #define TACOMA_BMC_HW_STRAP2  0x00000040
=20
 /* Rainier hardware value: (QEMU prototype) */
-#define RAINIER_BMC_HW_STRAP1 0x00000000
-#define RAINIER_BMC_HW_STRAP2 0x00000000
+#define RAINIER_BMC_HW_STRAP1 0x00422016
+#define RAINIER_BMC_HW_STRAP2 0x80000848
=20
 /* Fuji hardware value */
 #define FUJI_BMC_HW_STRAP1    0x00000000
--=20
2.34.1

