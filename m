Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp861652wrq;
        Wed, 23 Oct 2019 06:05:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+mzjaHHCGw13Ed1zRmMBM9eCKUuuuqGO2zddyTf0zsGZDOYyIPBRBJqi53V6gq91awxa6
X-Received: by 2002:a37:7b44:: with SMTP id w65mr8222423qkc.409.1571835939243;
        Wed, 23 Oct 2019 06:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571835939; cv=none;
        d=google.com; s=arc-20160816;
        b=TH1TB17QSGEMRxBe8mNXcI5Rtx1Tccweo7JNc4Yj/j2dH/+Uo5YYdXwWnqCJ92IMuT
         m1vfdrOk2W121OcPqd1KQGlq1sBTb4t9/nSFTOp9goUd7Le5sfNdXjcFcCEfaJKWgiey
         s74sSavWfxTKtvMO0kwYVw90RLl6uHOh3cUiT4usvDdnbmsFfn7lHdlmx5A352Zz1lMd
         iVn0DlVk9p3JMp1DceWqMdfV0Mk4ZnOyNADGHQX049Y4eJagW0EUx+F57xoxCaNOPkFf
         pt1BO0Zs4SMmcVD3PKRwAtITdLOCZsZd132UEmLW+JKOYjM+zUK4g259M/+NOW5Q+ru/
         I5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :message-id:mime-version:date:subject:to:from;
        bh=aHobhOjmcmfn+mQ2n0YOcWCvTFgauxqYU840/i/Y85g=;
        b=qSkKM9D6Gq8YEnkAjsvFIlz/Fcxl4e6UgR1GF1/wma5fbfdufmkry8+u+hDzupEUVY
         l4b2S/TgMxoea79w6E5udrYR09BpCKa/EUvhZIKF01ln/ox280bEPukY3N09elheE3S1
         mc7FPtgrRifrfQ47X+oys/6d1y9M7iaDLLhL7xThirzxkwriFjFbWgjueV8YRCtAmFh5
         Oo9tGxbbNvGMyCUz4QnabBSHHmHJVMyJmuuexLhwvQzk4f5GB2pvXgWwECFHX1x6gg7y
         u+Barzr3hGGHaqOJpON9eI68uIsFzq6CtWQY88tGzj8X5c0Xaga6lCds3A6D3DVUW39Z
         GKLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si19043548qtg.313.2019.10.23.06.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 06:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNGKX-0001Ow-Mt
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 09:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iNGKG-0001Ip-MM
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 09:05:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iNGKF-0000KI-Br
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 09:05:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58392)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iNGKF-0000E2-45
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 09:05:19 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9ND42ec009871
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 09:05:08 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vtpvx1gm6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 09:05:08 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-arm@nongnu.org> from <clg@kaod.org>;
 Wed, 23 Oct 2019 14:05:05 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 23 Oct 2019 14:05:02 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9ND4Smd26607952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Oct 2019 13:04:28 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FCE3AE056;
 Wed, 23 Oct 2019 13:05:01 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35751AE053;
 Wed, 23 Oct 2019 13:05:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Oct 2019 13:05:01 +0000 (GMT)
Received: from yukon.kaod.org.com (sig-9-145-76-221.uk.ibm.com [9.145.76.221])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6ECF1220170;
 Wed, 23 Oct 2019 15:05:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/2] hw/gpio: Fix property accessors of the AST2600 GPIO 1.8V
 model
Date: Wed, 23 Oct 2019 15:04:53 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19102313-0020-0000-0000-0000037D22F8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102313-0021-0000-0000-000021D36492
Message-Id: <20191023130455.1347-1-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-23_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=762 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910230134
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id x9ND42ec009871
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, rashmica.g@gmail.com,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v2Z7po6wNycp

Hello,

The property names of AST2600 GPIO 1.8V model are one character bigger
than the names of the other ASPEED GPIO model. This change increases
the string buffer size by one and parses the property name with a
better pattern.

This fixes the QOM test of the ast2600-evb machine under :

  Apple LLVM version 10.0.0 (clang-1000.10.44.4)
  Target: x86_64-apple-darwin17.7.0
  Thread model: posix
  InstalledDir: /Library/Developer/CommandLineTools/usr/bin

And all tests for the AST2600 EVB machine should now pass !

Thanks,

C.

C=C3=A9dric Le Goater (2):
  hw/gpio: Fix property accessors of the AST2600 GPIO 1.8V model
  aspeed: Add an AST2600 eval board

 include/hw/arm/aspeed.h |  1 +
 hw/arm/aspeed.c         | 23 +++++++++++++++++++++++
 hw/gpio/aspeed_gpio.c   |  8 ++++----
 3 files changed, 28 insertions(+), 4 deletions(-)

--=20
2.21.0

