Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4601153lfp;
        Sun, 16 Feb 2020 19:22:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqzmi7uvo1xUQAonMop4737mG/4pkwNFb5HywM5W8tiNrK8sYOetWoIdKsZbIJDH4rfAF6mH
X-Received: by 2002:a37:ac17:: with SMTP id e23mr12519913qkm.80.1581909744074;
        Sun, 16 Feb 2020 19:22:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581909744; cv=none;
        d=google.com; s=arc-20160816;
        b=NEMC4gVeqk7Z5TzsWLPt/j7jBOHtEbVDpHFv8jBzysVgy+9socri3cy0ldMnUmHzct
         I5pu6acbrsS2XXs6+6hmHfqwmoBOcQ9/cKMeM1D8M3FYqTJWcn/vGSON2Z81CiaL/6oI
         GL8s84Bnuw/ZBVpW1bA5+0hyF/aSrXDWj+mIooZG3L4Q2lPZIB+2vIlxmNVSKmBFZmDD
         I5S1LGeMpl/XFiAiTm5h/bpCkcE7Gg1zQb7gGMCNvATW/WeTDzQEZZHnSxZud8U/LbSR
         WZgkau7euBPi4REk1Rv1Gz6RoVr7A5vb8wH0HtdgeoNSttf9UPUHP6ghY+XeYVf6/uik
         yDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=liZU3zUJ98FVmBdGqiTnD3dPCciUB+j8fv58ElDwkbM=;
        b=sHds9p+L+uLu9tLhejfhaCMLmPrxWeueDP6Qo+9JAaOBhtVGYeODCQvR4BIO81MlOW
         DI3EIBxBOIuk8R3LCVwwAY6VrmRRW6BlK7Mh12Wjs7QJJauUfTGMHU8EzhFkMjX32mML
         yZjmsBAzvUIKduExrmfoTmWTcK7x9/DDQHxDoGV9TlNlm1A6R0hjJor/58BhIRTNtxLZ
         rqCP22xBS9z3+2MoRLPLrlqihqMHclNLFrN0HRkUOS2kwGmFsiCR3AX6nn1HzMNd7YCg
         r9kiwUmlCTFRGKmvnxc7L2JnerP3wck6UG5wigVe56G59J3k7Sm4Ik2xjR44EnAsaMgF
         tbHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r188si6478813qke.50.2020.02.16.19.22.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 19:22:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3WzH-0005KM-E9
	for alex.bennee@linaro.org; Sun, 16 Feb 2020 22:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j3Wz7-0005Jt-D6
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 22:22:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j3Wz6-0003gM-9L
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 22:22:13 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2788 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j3Wz5-0003WK-Uz; Sun, 16 Feb 2020 22:22:12 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EEF6AA41280FCCC59048;
 Mon, 17 Feb 2020 11:22:02 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Mon, 17 Feb 2020 11:21:55 +0800
From: <pannengyuan@huawei.com>
To: <balrogg@gmail.com>, <peter.maydell@linaro.org>,
 <mav2-rk.cave-ayland@ilande.co.uk>, <david@gibson.dropbear.id.au>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>
Subject: [PATCH v2 0/2] delay timer_new from init to realize to fix memleaks.
Date: Mon, 17 Feb 2020 11:21:25 +0800
Message-ID: <20200217032127.46508-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: zhang.zhanghailiang@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 euler.robot@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GmgZjE+U4X2j

From: Pan Nengyuan <pannengyuan@huawei.com>

v1:
   - Delay timer_new() from init() to realize() to fix memleaks.
v2:
   - Similarly to other cleanups, move timer_new into realize in target/s=
390x/cpu.c (Suggested by Philippe Mathieu-Daud=C3=A9).
   - Send these two patches as a series instead of sending each as a sing=
le patch but with wrong subject in v1.

Pan Nengyuan (2):
  s390x: fix memleaks in cpu_finalize
  hw: move timer_new from init() into realize() to avoid memleaks

 hw/arm/pxa2xx.c        | 17 +++++++++++------
 hw/arm/spitz.c         |  8 +++++++-
 hw/arm/strongarm.c     | 18 ++++++++++++------
 hw/misc/mos6522.c      | 14 ++++++++++++--
 hw/timer/cadence_ttc.c | 16 +++++++++++-----
 target/s390x/cpu.c     | 22 ++++++++++++++++++----
 6 files changed, 71 insertions(+), 24 deletions(-)

--=20
2.21.0.windows.1


