Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2806986lfg;
        Tue, 9 Mar 2021 05:26:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwM8UaNWWtowWBThKG7iagJYqllPOPq3VbRT74ZrhSrkF8o6QGkOPGl7dAwZ1QJ+EETOsuP
X-Received: by 2002:a05:6602:2018:: with SMTP id y24mr15119762iod.74.1615296411049;
        Tue, 09 Mar 2021 05:26:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615296411; cv=none;
        d=google.com; s=arc-20160816;
        b=YupPqc+z9/R6oTgg9J7ee6MefLBLgzaM6NF9qYXhFvCs+4U38JgOcZq2U/rJDihp7r
         Nd0zY7yoXPpnheTnJ7I08ZxxgBZsJUcHe9TIhIbghF7A/whbUHaMbdy1kyx2EgxipRX+
         J8meueBEZmyxh0Z4HUnDzc7hvjp/oZSiX2kCFdIScp2G5/22+Kz3fi/tHySTvBgUOR0h
         KCAINA7Ix/do1giDMSLR+H0RX/UoyIVMhwmR0+dLeb1ghK26ENOxQWLzePeh4pQdb9zx
         UuswQNCTgaVJ78F/A4w6cD77nAqMu93LikZcI3nyeY7+IXfS+xfzv7C98rgQQQYmfJsf
         LCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=fHCxmJtQHvkTgTp2iyXU04T5luc0fbSW5c1V58D6FRM=;
        b=Ml6Bmw1P5puZyBCyyKsgX1mgId6irzqLRKP7W/9nFYOru1QnZW5Ya1pDegGxDFpq+B
         kk3i3rPJBe8iCxGQbuOboiZaE/ar970bSRzj965xTt//bdL6vc1mUFncW9IBc56OqdZB
         Me01mnwGAvTmjIoG4ZHv9JiltXWsz7ZBnyenWn+uOsG1MmsH7aDUewvV5wM4ooAUZE6B
         cm4vfh4hdZ4f+JboAbHgLECPhbyC8HTL0KreY8K9xkRU1f3nTmtH3+N71507ZB5Feggb
         ahfOlnl49+f0lDTs24JqKUohbn+Cvm2N5VH4Mc4QuoYqogiHHYywjWRcFI9rhIsVL+cX
         ouAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si14139539iom.30.2021.03.09.05.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 05:26:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJcNu-0000uK-C2
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 08:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEe-00027x-IG; Tue, 09 Mar 2021 08:17:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEZ-0007DB-6L; Tue, 09 Mar 2021 08:17:15 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129D2nbR098669; Tue, 9 Mar 2021 08:16:50 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37640j2dra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 08:16:50 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129DBJUG029946;
 Tue, 9 Mar 2021 13:16:48 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3768mv81a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 13:16:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 129DGjxE39321936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 13:16:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84D6011C04A;
 Tue,  9 Mar 2021 13:16:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42A9E11C04C;
 Tue,  9 Mar 2021 13:16:45 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Mar 2021 13:16:45 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.251])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8BBB722025C;
 Tue,  9 Mar 2021 14:16:44 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/7] hw/arm: ast2600: Set AST2600_MAX_IRQ to value from
 datasheet
Date: Tue,  9 Mar 2021 14:16:38 +0100
Message-Id: <20210309131641.2709380-5-clg@kaod.org>
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
 mlxlogscore=391 clxscore=1034 spamscore=0 impostorscore=0 mlxscore=0
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
X-TUID: EBAWXSSrPqJX

From: Andrew Jeffery <andrew@aj.id.au>

The datasheet says we have 197 IRQs allocated, and we need more than 128
to describe IRQs from LPC devices. Raise the value now to allow
modelling of the LPC devices.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210302014317.915120-3-andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 3d9e78fcc6b7..1dc56ce4781c 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -65,7 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
=20
 #define ASPEED_A7MPCORE_ADDR 0x40460000
=20
-#define AST2600_MAX_IRQ 128
+#define AST2600_MAX_IRQ 197
=20
 /* Shared Peripheral Interrupt values below are offset by -32 from datas=
heet */
 static const int aspeed_soc_ast2600_irqmap[] =3D {
--=20
2.26.2

