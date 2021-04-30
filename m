Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp290589lfg;
        Fri, 30 Apr 2021 09:47:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI8DAZ5poVhmVvWdizy+2k7E9uqI7Z1AQu5bUy4SzymC7QokjF3+/98qUQBydes6AFPM21
X-Received: by 2002:a92:cc8c:: with SMTP id x12mr4771467ilo.203.1619801246950;
        Fri, 30 Apr 2021 09:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619801246; cv=none;
        d=google.com; s=arc-20160816;
        b=lUPFWg5kBLq3LdVIJh2fonQt+qCwMImpZtE4L/5SBbOFAE2Mkx72GWxok0L2F6P63y
         k60aWK4Kj4A/5kzymi7zeBvubbAVU1VTnvFgpy2zQa5jqgjznpS57xYvEKSqkYNyGBLv
         eJifw6bCejhNLcCPQOP0n+RTj46h02l8KxRztEh+o7xj2R9ObZEOOxMVdzeGw5zzSh5e
         Dk+/OjiFWNTO2l93+zaGDp5WsT0d/YCnBhvC6TNM9W2CmM9MJWn83SAsk3dnzsR5joLl
         7441XOp1TGhZR2u8b9fg+c+YL7scbRqTfrwwzk+6/+ICdHDyrH3avEkXNCBF+o5uLMsl
         lpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=SObVNy07hYoD3tPMduphydeBj5hAX+tkS4AZoGtV1ok=;
        b=LT4pYN7BN88vcrVvxrkJWad/VHsieIuTlyCUsdYIKMp2O2fjMRfqiJ9UyDWwb7m2kS
         FudPvuTlzi447IITRHnk2AYNIaPMoL2Bd1NljMztCY/jAzkHb9h/KxAMO+Snd2GOIKc2
         U/bAMq6jH2tZuStFC10YiNBLsRUjRIcafN0xUNubT+9Apu1ArvWA1Pbj6VfASqzPiKnp
         mW4UmEGcQNw+fdY3Rag2IeAuIIWovUu8NuYa0dfLpSGWKtijTcVowb5XvRchkuWSBfan
         yonQpJwKiyRX6hp1rFbPYb5G0UKJnWcQiGx1uG2VJX0nDOUg3dH1KJZOhoy40jn0cu2E
         CVYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si4380955iot.35.2021.04.30.09.47.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 09:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcWIY-0001sD-7C
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 12:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcW5F-0000uj-7e; Fri, 30 Apr 2021 12:33:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcW5A-00073T-9P; Fri, 30 Apr 2021 12:33:37 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UGEVgu154316; Fri, 30 Apr 2021 12:33:18 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388n868h2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 12:33:17 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UGNsDd023783;
 Fri, 30 Apr 2021 16:33:16 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 384ay8kaph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 16:33:16 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13UGWnR435979754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 16:32:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7B3711C04C;
 Fri, 30 Apr 2021 16:33:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9334811C05B;
 Fri, 30 Apr 2021 16:33:13 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 16:33:13 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D4C9D220193;
 Fri, 30 Apr 2021 18:33:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/18] aspeed/i2c: Fix DMA address mask
Date: Fri, 30 Apr 2021 18:33:03 +0200
Message-Id: <20210430163309.4182922-4-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430163309.4182922-1-clg@kaod.org>
References: <20210430163309.4182922-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EbUiNH54XiDoqMcq-T4aTUAB1O6DWOuF
X-Proofpoint-GUID: EbUiNH54XiDoqMcq-T4aTUAB1O6DWOuF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1034
 bulkscore=0 lowpriorityscore=0 mlxlogscore=842 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300108
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
X-TUID: cN2QPg3SCfJW

The RAM memory region is now used for DMAs accesses instead of the
memory address space region. Mask off the top bits of the DMA address
to reflect this change.

Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210407171637.777743-4-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 518a3f5c6f9d..e7133528899f 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -601,7 +601,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr=
 offset,
             break;
         }
=20
-        bus->dma_addr =3D value & 0xfffffffc;
+        bus->dma_addr =3D value & 0x3ffffffc;
         break;
=20
     case I2CD_DMA_LEN:
--=20
2.26.3

