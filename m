Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp293193lfg;
        Fri, 30 Apr 2021 09:50:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIuYhtIZ7EIsqnqXnndPwb2VaO3NIVs3EeCmuxy3K8B6dp0z5STWZS/mVCndDbJPu3kqKH
X-Received: by 2002:a5d:984a:: with SMTP id p10mr4610560ios.106.1619801430295;
        Fri, 30 Apr 2021 09:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619801430; cv=none;
        d=google.com; s=arc-20160816;
        b=nzteWlZcpJcDMGQmdOPdyODRg+8+Ao/Xjrtx+cgG8/YG99u4TasOe8vboTQLcX82Sx
         Veq9sTAQdnHDY2YBlee2Bx3T7gro6yDr9V+1SVbUcONIecOQtco/AvBz4rT4K19bdRTx
         pckOBmtn4fjhtRGplcK6wHfAsgqcWfvqLJFWoAtPo4d7HMMHfpP9vjNUZ1R73uqhYUBa
         V5qwJjkoIBrT1rOJa6PfEPLJCv7CclDkMZQYc783k3Alq37yaQdbktlErQ1a05WTPHod
         shrTDX0i0q3rAQRqEoiAZw5AhRMmja7Wy6Cq9mgkdQl3jh3CU0rSMJfZ2bNYS4lqbfgy
         /C/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=s5gdgpuGomYzfek2HEPhynDjlyR7LXLvHh8yiPZprzU=;
        b=e6Vik3yLCZ8Kv8Bf6Abm1oXXy1qSrT2pBBMB/Dlpa0mKP8kaRXqeMUy/XBhIxxhKoE
         VabWHxlcQkJf8V8H2SaFKTydGif6Mruoq91cVpAMfscXIKie8v5SSpmZdrI6aWGgtfss
         VKIuXEbOfrg0ERGOJIHIS1l35xQz/FedXO/ziAObMbs1qiHsQBvhQEtoUK2xxKHd1j/P
         jz/t91w8wKW31ar7EBoT2T0NlVD2m4yErVc3nyRdFSuupze8ttmAjAMUkIpQYaQsIDWl
         /PHMwE56SpWwrZZaSda84DMZ0w0nS+FS9TUlG2Y8NCTub0psNET15mo14GUzRKxSRvKT
         kjBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14si2585677jav.125.2021.04.30.09.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 09:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcWLV-0005DS-JC
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 12:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcW5A-0000sJ-Dl; Fri, 30 Apr 2021 12:33:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcW56-00073A-OH; Fri, 30 Apr 2021 12:33:35 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UG4mYa085128; Fri, 30 Apr 2021 12:33:19 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388muphadu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 12:33:19 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UGOig9011823;
 Fri, 30 Apr 2021 16:33:17 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 384akhbabg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 16:33:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UGXEos40108326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 16:33:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75CB44203F;
 Fri, 30 Apr 2021 16:33:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EECC4204C;
 Fri, 30 Apr 2021 16:33:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 16:33:14 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 85CDA22016C;
 Fri, 30 Apr 2021 18:33:13 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/18] aspeed/i2c: Rename DMA address space
Date: Fri, 30 Apr 2021 18:33:04 +0200
Message-Id: <20210430163309.4182922-5-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430163309.4182922-1-clg@kaod.org>
References: <20210430163309.4182922-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eDXUhKsU-MBO9dHxUI-npw1TDXboa8-P
X-Proofpoint-GUID: eDXUhKsU-MBO9dHxUI-npw1TDXboa8-P
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=753 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300108
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jKrgnpvvSx1H

It improves 'info mtree' output.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20210407171637.777743-5-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index e7133528899f..8d276d9ed391 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -816,7 +816,8 @@ static void aspeed_i2c_realize(DeviceState *dev, Erro=
r **errp)
             return;
         }
=20
-        address_space_init(&s->dram_as, s->dram_mr, "dma-dram");
+        address_space_init(&s->dram_as, s->dram_mr,
+                           TYPE_ASPEED_I2C "-dma-dram");
     }
 }
=20
--=20
2.26.3

