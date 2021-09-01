Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp948572lfb;
        Wed, 1 Sep 2021 16:00:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlDVaQih3ibuttsRbf5uFkabBCvFsC9FsOtGUq/6b3NT7JilDuH0nGcYDNAd8Uk5JQKt0T
X-Received: by 2002:a6b:fd1a:: with SMTP id c26mr173625ioi.57.1630537211982;
        Wed, 01 Sep 2021 16:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630537211; cv=none;
        d=google.com; s=arc-20160816;
        b=nAFxwiNWECNBC0+0Dju1go1DW7sjKv9l+f4AH6HM8H7QUS5G3x9ibwqOe6MBDuQdoO
         VGFTHsj2y4QTMkHjMoqlHCVB8zqq5K6urqN0RyFQvC+LONBgdzNj7zYADymOPl5sb//J
         X/bE2ujyMaF6wtfjq4AcG4+DibGzyfXdM5agXfAkx5uW/ddHAtYgBQXIt2onU7DAvshU
         Wbyu8VYq88eIV6ronX6lbsg9s4YqeW4451fP82Ahp9qJONqWayBI0Vc3bsUKtbBGxVX/
         eOjWOMB90xS4zp7oAOgOXbG6mS+j4C4kIxdYXgR6cJaRnsEV5JsLMiRmzgRmEDNCqUOQ
         uijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=vLpQSiv1KX3TInMV87Lqn+ph2VhFme0+494mZrhJA1A=;
        b=kI7hILqSajsEpqxULXeqqPK0tNl/PJK4DhNhYDl1Vt5a0N5wpu4xK7NR+IamylP/s2
         nPxHlXmENsn8D7LaOWyfle6IRyTKjhCU8pUnw5NIFamLsmp1Mfgh3Cyz3/4wC1/9BcHR
         kcRi5toyQjL9Xn3qCx6PyupK83uY8waSk5ATLGU6pIkfqoYJ1JoqmZj3cbW4FPO3s++a
         vC8OxD3nzcLlnVNJfr4EkzvybEOD2gjBQec3SF83plhJZP0d9Re1ylBeUUq3dR/yy4a9
         RjksRWkACKju2Pnk/h6whOI9/tjm9fNLSEREC7NPADijNGi83qEfwCRkppVQx//W+9+x
         dQOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=dw0A+5kF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g34si679494jaa.104.2021.09.01.16.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 16:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=dw0A+5kF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:58528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLZDG-0007Kd-PR
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 19:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLZD2-0007KK-AS
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 18:59:56 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:28080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLZD0-0001jj-EH
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 18:59:56 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181MoKUr023910
 for <qemu-arm@nongnu.org>; Wed, 1 Sep 2021 15:59:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=vLpQSiv1KX3TInMV87Lqn+ph2VhFme0+494mZrhJA1A=;
 b=dw0A+5kFeWr9bD4Fp3DFODbPgFHzNSaUyJPkCrzkl2oIYea/JE+EKjnfVzeMkzWCwkKl
 gv0f5WdeGsntKsrxjM46y3bRpv+rdeIsAuDHQUD7/lDiXn1OCg17GOMxMIaydEpwFUaD
 9EyXxOdUf1D7Oz07sLRKZgradVRoMHC9VzQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3atdwtw696-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 15:59:53 -0700
Received: from intmgw002.46.prn1.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:59:51 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 744C317DA286; Wed,  1 Sep 2021 15:59:47 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <patrick@stwcx.xyz>, <f4bug@amsat.org>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 0/1] hw/arm/aspeed: Add Fuji machine type
Date: Wed, 1 Sep 2021 15:59:45 -0700
Message-ID: <20210901225946.500125-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: foBw0HKcA0GBW05aSn-eQeMkACXB9Dzt
X-Proofpoint-ORIG-GUID: foBw0HKcA0GBW05aSn-eQeMkACXB9Dzt
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_05:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 mlxlogscore=999 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109010134
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8878769573=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wD+ar88sTDzU

From: Peter Delevoryas <pdel@fb.com>

Adding a new Aspeed AST2600 machine type, uses MAC3 for ethernet1 and
UART1 for the serial console, which is different than the existing
ast2600-evb. Otherwise though, my usage so far hasn't required a
different set of hardware strap registers or anything, so I just
inherited the rest of the configuration from the ast2600-evb. If
preferred, I can eliminate the inheritance and just declare Fuji
completely independently.

I included more info in the commit message, but just for convenience,
here's the DTS link and a link to an image I'm providing for the
acceptance test.

https://github.com/facebook/openbmc-uboot/blob/openbmc/helium/v2019.04/arch=
/arm/dts/aspeed-bmc-facebook-fuji.dts
https://github.com/peterdelevoryas/openbmc/releases/download/fuji-v0.1-alph=
a/fuji.mtd

I'm not sure exactly what the requirements are on the image url
provided, or the requirements of the image itself.

The existing OpenBMC acceptance tests mostly use images from the Linux
Foundation repository's releases, e.g.

https://github.com/openbmc/openbmc/releases/download/2.9.0/obmc-phosphor-im=
age-romulus.static.mtd

Although, I do see one image from a regular user's repo:

https://github.com/hskinnemoen/openbmc/releases/download/20200711-gsj-qemu-=
0/obmc-phosphor-image-gsj.static.mtd.gz

So maybe it's not that unreasonable? I also might be able to organize a
release link on the official Facebook OpenBMC Github.

As far as the actual requirements of the acceptance test, I didn't use
the existing "do_test_arm_aspeed" because Fuji was sufficiently
different (different U-Boot version, kernel address, CPU, SPI control
register, doesn't use systemd), but I could try unifying them if there's
interest or suggestions on how to do so.

By the way, Fuji takes a long time to boot on my Macbook:

(19/38) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_as=
t2600_fuji_openbmc: PASS (85.13 s)

The next longest boot time is <20 seconds:

17/38) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: PASS (17.46 s)

Not sure if that's a problem for the CIT infra time or not.

Thanks,
Peter

Peter Delevoryas (1):
  hw/arm/aspeed: Add Fuji machine type

 hw/arm/aspeed.c                        | 14 ++++++++++++++
 tests/acceptance/boot_linux_console.py | 25 +++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

--=20
2.30.2

