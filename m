Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp654553wrs;
        Fri, 23 Aug 2019 07:33:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDE9hgtB65wKphCkWJ8MdS/nfS7D5smmO+F2bsTC5SMZvXVqRpzo/CKRI0DvByxFiqouCl
X-Received: by 2002:aa7:cf1a:: with SMTP id a26mr4795235edy.170.1566570809042;
        Fri, 23 Aug 2019 07:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566570809; cv=none;
        d=google.com; s=arc-20160816;
        b=qGyV9rfEpwpLcORMEV8yWhgBKFFLreZsDRvuOf26p5S20P/Z2vnuEvH0WKgCm/9aOB
         hfDEbUTy4WuBdB8ZcXl/aWGlYrsMIoy/UIeiq24UDow62GulzlvGHHf2m2tygslZEcoZ
         ULqCqWFTNH3zfFnfKB7FFFayGnYAVidhu8moo6ae1Wm5gfqsfuBdu6HCSPbAgumJlgOW
         lGunW/Rupn6ruh53bw0EaejXLk4xb9x6YgHk/uVvh/1ADTTdCLPG4hWgrcmWwAPuqA9S
         Vo9CDm4ez1eROQTAtjedVmRASx2kl5Q3gTTgWd5Io4bb5/Oq2WSPN0vK/kvFPoZ2jyvD
         SyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=w9C+fgfQDpolAeuie6NmcuKD9vM0XX5V/Mu9qHNYhng=;
        b=lCGqHYmZAWqEsy5YAox1Vh7ukzaW04hLXAvdskmXXlFMS42AgMgh4NzAxN4fyk3DZu
         DWL458Rr4IoiedGiqw1xpagVaOh57fyXYknx36r2xyp28v/9qRzACLVV0Kny/MdG1La3
         q8mIT5mJvIXcBXJAENU/WRJQulSFoirQDvTwFZeD4+SplrCub3S+k/jWpKjPO+90adsX
         xjEZrMxcF/J2XCMoAtso3hnqqG6sxeu8cSVCo2jhz8te7i9BAuoZxgYlLiC4LDQUyrhR
         9dR/3i7vupDtXFuxNEk7olB0M4tqi2zRovE/ekHEVGLO+EY5nnaVtBREa1r6CJw065kx
         eCtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cw20si1561546ejb.189.2019.08.23.07.33.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 07:33:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1Ad5-0008Io-Fa
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 10:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50149)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1Acn-0008EJ-AE
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:33:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1Acm-0001RF-0R
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:33:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41546)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1Acl-0001P4-3R; Fri, 23 Aug 2019 10:33:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD7301801592;
 Fri, 23 Aug 2019 14:33:04 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A8C25DD61;
 Fri, 23 Aug 2019 14:32:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 16:32:43 +0200
Message-Id: <20190823143249.8096-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 23 Aug 2019 14:33:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/6] hw/arm: Use ARM_CPU_TYPE_NAME() and
 object_initialize_child()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tgMS69pXc5xE

First we use ARM_CPU_TYPE_NAME() when we should.

Then is follow up of [1]:

  This series looks at Eduardo suggestions from [2]
  and Thomas commit aff39be0ed97 to replace various
  object_initialize + qdev_set_parent_bus calls by
  sysbus_init_child_obj().

Finally, some devices are declared orphean while they have a parent,
let them be together again.

Since v1 [3]:
- addressed Peter Maydell review comments

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01492.html
[2] https://patchwork.ozlabs.org/patch/943333/#1953608
[3] https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00135.html

Philippe Mathieu-Daud=C3=A9 (6):
  hw/arm: Use ARM_CPU_TYPE_NAME() macro when appropriate
  hw/arm: Use object_initialize_child for correct reference counting
  hw/arm: Use sysbus_init_child_obj for correct reference counting
  hw/arm/fsl-imx: Add the cpu as child of the SoC object
  hw/dma/xilinx_axi: Use object_initialize_child for correct ref.
    counting
  hw/net/xilinx_axi: Use object_initialize_child for correct ref.
    counting

 hw/arm/allwinner-a10.c  |  3 ++-
 hw/arm/cubieboard.c     |  3 ++-
 hw/arm/digic.c          |  3 ++-
 hw/arm/exynos4_boards.c |  4 ++--
 hw/arm/fsl-imx25.c      |  4 +++-
 hw/arm/fsl-imx31.c      |  4 +++-
 hw/arm/fsl-imx6.c       |  3 ++-
 hw/arm/fsl-imx6ul.c     |  2 +-
 hw/arm/mcimx7d-sabre.c  |  9 ++++-----
 hw/arm/mps2-tz.c        | 15 +++++++--------
 hw/arm/musca.c          |  9 +++++----
 hw/arm/xlnx-zynqmp.c    |  8 ++++----
 hw/dma/xilinx_axidma.c  | 16 ++++++++--------
 hw/net/xilinx_axienet.c | 17 ++++++++---------
 14 files changed, 53 insertions(+), 47 deletions(-)

--=20
2.20.1

