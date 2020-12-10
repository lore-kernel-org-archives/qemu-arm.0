Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5875786lfb;
        Thu, 10 Dec 2020 05:02:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYnNDhSoBrIa7qG8nlI8f+z7TC/spjyjtDQMI4rTGAD4bNuswZHslgkgb/afVLr0rYUxOB
X-Received: by 2002:a67:87cd:: with SMTP id j196mr8051293vsd.43.1607605377572;
        Thu, 10 Dec 2020 05:02:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607605377; cv=none;
        d=google.com; s=arc-20160816;
        b=nIDtaBc9f1/wW037CdFJGHRi2ulkxKFdChS/f3MYhNhrwdnaLyqaEv6Ce6G4y6TXOQ
         NUVdWN2QELoIUqJipjxbI27LLvdk4iR9BOGX+NiIesffisJ13r9/kQgjJLogXUuXCs8i
         G/8fVDaly4BjvKEX1MrFnFQn6mckYFI/+wt969Z5MKlqDLdDMNfWoVkLghI9kcfLJAm8
         9yEfpJfn9pUas4k4UpSIW13GjANJ5MEK7pALqgid6vAwY5QdEonKcht2o0j4Gp63LMOA
         LUh2jE9i8m3u87t+ioo6XzJbiVCiOGD4YsODhP+6pWkuoRfYSLDYd6W6JCHR85QJJnYY
         dMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4rNqcdIR3S5Yfc67b0YZAFbchIomURlngsWwQ46t3jE=;
        b=j5iroue7vnplDGIc6+dXIGzju+sdMWpWrwP0586ovBHyDu5KLPwFKs07Bxp3btXSqH
         sP5TyYQNTg1NjbXtfxDP3FGMVlsNFi2TeTb84jV6edHJn6guzmnxuWJ6zxh7ocrYltdv
         c55vqI4Vg2XES5s9Oo6vNbMFQJLlOIT5Jb++aNLmPiIaqd9U46oDhOr3cSQrlSifFuio
         jlgQEDEoG0UndrJu8rv7aSGd/UxbTCf4zQcwpDX8V/pSvE5mI1s54bJk9tSGZ2Zx+++y
         08olZdbe223DPzrM8Zf3W3bayQtqpFJQxpwqSt3/wvqGKZ+QOXt6Wr4McmJo6StWdLJ6
         w34Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si693091uap.109.2020.12.10.05.02.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 05:02:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knLay-0003IQ-R9
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 08:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLQ2-0001bp-K9; Thu, 10 Dec 2020 07:51:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLPz-0001Sn-4V; Thu, 10 Dec 2020 07:51:37 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BACWrO6175135; Thu, 10 Dec 2020 07:51:26 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bk7csp2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 07:51:26 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BACXPRl028231;
 Thu, 10 Dec 2020 12:51:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3581fhk0fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:51:24 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0BACpMRe59376008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 12:51:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F37FAA4059;
 Thu, 10 Dec 2020 12:51:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA292A4057;
 Thu, 10 Dec 2020 12:51:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Dec 2020 12:51:21 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EC510220188;
 Thu, 10 Dec 2020 13:51:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/5] aspeed: g220a-bmc: Add an FRU
Date: Thu, 10 Dec 2020 13:51:15 +0100
Message-Id: <20201210125115.1812083-6-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210125115.1812083-1-clg@kaod.org>
References: <20201210125115.1812083-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_05:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1034 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=702 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100080
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 John Wang <wangzhiqiang.bj@bytedance.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FDsHiR5PvKxz

From: John Wang <wangzhiqiang.bj@bytedance.com>

Add an eeprom device and fill it with fru
information

$ ipmitool fru print 0
Product Manufacturer  : Bytedance
Product Name          : G220A

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20201210103607.556-1-wangzhiqiang.bj@bytedance.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index aee00ba8d682..bfe2051cfed4 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -615,6 +615,18 @@ static void g220a_bmc_i2c_init(AspeedMachineState *b=
mc)
     object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_a=
bort);
     object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_a=
bort);
     object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_a=
bort);
+
+    static uint8_t eeprom_buf[2 * 1024] =3D {
+            0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0xfe,
+            0x01, 0x06, 0x00, 0xc9, 0x42, 0x79, 0x74, 0x65,
+            0x64, 0x61, 0x6e, 0x63, 0x65, 0xc5, 0x47, 0x32,
+            0x32, 0x30, 0x41, 0xc4, 0x41, 0x41, 0x42, 0x42,
+            0xc4, 0x43, 0x43, 0x44, 0x44, 0xc4, 0x45, 0x45,
+            0x46, 0x46, 0xc4, 0x48, 0x48, 0x47, 0x47, 0xc1,
+            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa7,
+    };
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 4), 0x57,
+                          eeprom_buf);
 }
=20
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
--=20
2.26.2

