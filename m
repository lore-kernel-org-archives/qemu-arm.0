Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1078005lfg;
        Mon, 24 Feb 2020 18:59:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqzY/kLA8NxQR/RHNRbplGg3ppiiSd91uF3aIFs1IKvb/j1EGnj3fvhxCxTSbLTvFJK1aHVf
X-Received: by 2002:a05:6214:13a8:: with SMTP id h8mr45841677qvz.41.1582599589569;
        Mon, 24 Feb 2020 18:59:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582599589; cv=none;
        d=google.com; s=arc-20160816;
        b=nPUa/6Wsg8v+lvsmEVJtlN8DPdqijGU9Rmhmhafa/8nd89quLye90A6j9wiBfJ8QxV
         HQc8s1jDnKSqqqfGQn6MFGacIjvPhOjqFBjh3Zl+tnO+S0RbSsGRZmHD396xv32z2kll
         C2MHppIwxnyH83h2p/oR3lxCa5tyVFtUPfQsDF5h0rzmZz0JJmTVwin6AF7BeMED2id4
         IPnMCf4FFcP/bH1eB4iZLcD2Xudxc26qsdX9Ubp2R+DjKU78GNJmSHftrGcq8wDc4Z/h
         jxLP+baTi1y0T/CwkSMouNKHpG7XxVQnOU4pKtUDvsUgwuL+/rvF+HmSYro97vxcJtr0
         byhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=cYxTwmlOwljeTvOsibP1HNvXlsACABrb4goF2pOS7xw=;
        b=j2Te+4rY7r7llidpO0cmoMmLePcUkloCvOaMHB+UXSWgHPV40KktDI8totybtfbyl2
         ssWs7w1CEZeShfkHE+NKtXGasM1sCZb4ZJ755AINpbDCv/fg9bg0/mRxG/krAXYWo04E
         Otl8dLkBzuK2Ev2Oko9L0L+h95YAhDvARXa+tK6R89ME5DpPd11taHwlP3iQqRnJOhCV
         jGIBdc57UyPX+AZt3rMBY1jOlopyxADsDmWdadQ44PS+NAWrBvH570Vv4bZdzMvs1y7K
         rffZSJz8wKChHANDPRb2OE5+eAioc4uOHl9Rf3CcAZHu7mCr//H7pnyV0MTNAv78CvWe
         DjBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si6547219qti.136.2020.02.24.18.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 18:59:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6QRp-0005RC-1Y
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 21:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6QRi-0005R2-4X
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 21:59:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6QRg-0007JL-VW
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 21:59:41 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:47664 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6QRg-0007Gc-LD; Mon, 24 Feb 2020 21:59:40 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5AF4A33254F7D2F1710F;
 Tue, 25 Feb 2020 10:59:35 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:59:27 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH] hw/net/imx_fec: write TGSR and TCSR3 in imx_enet_write()
Date: Tue, 25 Feb 2020 10:59:23 +0800
Message-ID: <20200225025923.19328-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 jasowang@redhat.com, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/j5NHvQessY

The current code causes clang static code analyzer generate warning:
hw/net/imx_fec.c:858:9: warning: Value stored to 'value' is never read
        value =3D value & 0x0000000f;
        ^       ~~~~~~~~~~~~~~~~~~
hw/net/imx_fec.c:864:9: warning: Value stored to 'value' is never read
        value =3D value & 0x000000fd;
        ^       ~~~~~~~~~~~~~~~~~~

According to the definition of the function, the two =E2=80=9Cvalue=E2=80=
=9D assignments
 should be written to registers.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
I'm not sure if this modification is correct, just from the function
 definition, it is correct.
---
 hw/net/imx_fec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 6a124a154a..92f6215712 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -855,13 +855,13 @@ static void imx_enet_write(IMXFECState *s, uint32_t=
 index, uint32_t value)
         break;
     case ENET_TGSR:
         /* implement clear timer flag */
-        value =3D value & 0x0000000f;
+        s->regs[index] =3D value & 0x0000000f;
         break;
     case ENET_TCSR0:
     case ENET_TCSR1:
     case ENET_TCSR2:
     case ENET_TCSR3:
-        value =3D value & 0x000000fd;
+        s->regs[index] =3D value & 0x000000fd;
         break;
     case ENET_TCCR0:
     case ENET_TCCR1:
--=20
2.23.0


