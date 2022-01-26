Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3197186lfk;
        Wed, 26 Jan 2022 00:36:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhXiJQCctVqzj0zfjpYs/DDsYesgwZJgm7kLGE+ZttF5nfTPK8PnFqqsHwuM71QK90CEHu
X-Received: by 2002:a05:6214:268d:: with SMTP id gm13mr14701983qvb.75.1643186162048;
        Wed, 26 Jan 2022 00:36:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643186162; cv=none;
        d=google.com; s=arc-20160816;
        b=wMeFLsgRPv0CR903yDV7LKKVMpxqPizEUuwlM0qD1ct+sii7qBXgxO7IcNUwv2bx/0
         rpcDE40hxdVfV/wiX6M5j45THUqMH5JCTqUToP+K/zhWz38rRdk3lDuJ275gSyTzk9US
         2oSnCsZRIn0EBU4VfvPQxbR86zylC5JLkSh9wxS0vid/LmALU29m/2Kr74Z4GtZzu8D3
         55xru4PUelCFz7wslnIR+mDOIyUbiq+oHEaVDr3EwKED2Ck5f00HBrOb+IbMVKCaUmkx
         6j+tFu2S5rIZIaZXfC+Nb633ztSM9hrG2c3eSmnbnqz9VrHDEN6Hukd2faM/JPKtUUPs
         Urrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:to:from;
        bh=/yiGBN1h/7A+HybfyOrE68KDvzBKba+qnM8UKl9mq8s=;
        b=vV6S2sn5Eo5CbUCjoFEFJSzoblqmpii+dYY4Fv+1sTbJkR9rjhtm+gmwAlVdDBMz4n
         6xavSdEFI7e8hdC32PElyVKWGewixy8PZVb9ewHHTa1dVM2MnZ0ntA575fXA06eZxbvy
         qZMDqOLzA8xCq0R4agJCLRa9LV6io1lvm44Mz3rAxJEp2P4By4AGyPjk/CGVGhAeyA+6
         eVKrON3uKNRT10bPEHvJYP7jX6h+LYSp1uF8lQYbWfTl13lzZukCtT2lIuGRUUYNmEWR
         xu93+l7zU8RuRe/fufTtesk3ygmD8iaND2ZPAPjGICePk8Yxn6+71MMjwxHW8PnKGNno
         tYiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7si8167568qtb.404.2022.01.26.00.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jan 2022 00:36:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCdma-0008TK-BA
	for alex.bennee@linaro.org; Wed, 26 Jan 2022 03:36:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nCdmR-0008SS-Uw; Wed, 26 Jan 2022 03:35:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nCdmQ-0001Xd-4p; Wed, 26 Jan 2022 03:35:51 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20Q8GpZG010061; 
 Wed, 26 Jan 2022 08:35:29 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3du2nb0b4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 08:35:28 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20Q8Rnqd028201;
 Wed, 26 Jan 2022 08:35:26 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3dr9j9ca9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 08:35:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20Q8ZNDX44958142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 08:35:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D60D94C040;
 Wed, 26 Jan 2022 08:35:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89BD74C04A;
 Wed, 26 Jan 2022 08:35:23 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 26 Jan 2022 08:35:23 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.77.38])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6EAA22201B4;
 Wed, 26 Jan 2022 09:35:22 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/arm: ast2600: Fix address mapping of second SPI controller
Date: Wed, 26 Jan 2022 09:35:20 +0100
Message-Id: <20220126083520.4135713-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LlyLGEv6C4qCHtuYQ7bE-x2OSCeicRAH
X-Proofpoint-ORIG-GUID: LlyLGEv6C4qCHtuYQ7bE-x2OSCeicRAH
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_01,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 mlxlogscore=831 malwarescore=0 mlxscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260049
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 Troy Lee <troy_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gTE+hbmW82hQ

Address should be 0x1E631000 and not 0x1E641000 as initially introduced.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/838
Fixes: f25c0ae1079d ("aspeed/soc: Add AST2600 support")
Suggested-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index c3783bd87a25..568205fa6e9d 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -29,7 +29,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_DEV_PWM]       =3D 0x1E610000,
     [ASPEED_DEV_FMC]       =3D 0x1E620000,
     [ASPEED_DEV_SPI1]      =3D 0x1E630000,
-    [ASPEED_DEV_SPI2]      =3D 0x1E641000,
+    [ASPEED_DEV_SPI2]      =3D 0x1E631000,
     [ASPEED_DEV_EHCI1]     =3D 0x1E6A1000,
     [ASPEED_DEV_EHCI2]     =3D 0x1E6A3000,
     [ASPEED_DEV_MII1]      =3D 0x1E650000,
--=20
2.31.1

