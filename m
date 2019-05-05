Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1448863wrh;
        Sun, 5 May 2019 07:20:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxFg0iqiPGxtRuxAqG4msZbfIhZLbA5WeAT5oURzgZyRr71xR4o1d6xmNailk9fog70K2n2
X-Received: by 2002:a7b:c415:: with SMTP id k21mr1477632wmi.29.1557066015702;
        Sun, 05 May 2019 07:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557066015; cv=none;
        d=google.com; s=arc-20160816;
        b=cXS38cnSJjdlz1OuDshFH+vsICyl4bHDbkK+f13Dv33cX6filcrwT0VnFUrgoP13/R
         ptAJPyWIOHgbvgvEQCg/Ac4C8Tr+Od/r/lUf2STVAUabm8o3vM/WeOT7fMUkglHqndP3
         JCQEryZbuzQbw7hDr8/QLrquoUs5V/vkDH/EzarQ90GNz8lHeo7BIp/p/0lwq1X81+u2
         i7gTR7++NvFuEcMv4l5rcHS12dL39ARV67s+YzQpUyoweBvS27uLKoKGdpPOsozQCd3s
         SBr/6K9r5d2FMbqunU7BGc3azOq0pBUpY7ylJPnHY/CL/oARxRi14sd+MKAMV0T9xsRE
         pjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7/tV10etgLk5/QwRV+UcFbarepj6U+o5ZgvC+grDtok=;
        b=ZAv2Rs/SsM6vzl0N2wQx+b65eU4KtAhMsQxdlwvjZCaeXBKMAm//4up+czCT0Xk4Xt
         gZSlCIomNas0VDspvXwl+otIjLST6XYBI1S4bosSjMDt5Sk4XVXWdoXT1pGBoYVmB4IA
         575w6pHNTP0OGw2S3Co/a7eqsGO+IhpRklFLYTiuluVJ4EqH3arCLrzyS0iiFockYLEZ
         38AGLGpva+hD163EdMF+D129eeBaGxEVuVj+VO7f9oS+cggoV+BaPvJ84AJHT7QosUES
         a0+3Nt6xuYsKPR8R1nNHOqqp1kAvg1c3Pb++WXpFyLc45905Ld+xsIXC5+0FiRVsp/Ol
         pu8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si5944359wrq.126.2019.05.05.07.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHzy-0006TG-QD
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:20:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeW-0004hO-Fn
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeV-00055s-M1
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:58:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43148)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeT-00051u-95; Sun, 05 May 2019 09:58:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F5D28553F;
	Sun,  5 May 2019 13:57:59 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46AFE60C47;
	Sun,  5 May 2019 13:57:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:14 +0200
Message-Id: <20190505135714.11277-29-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sun, 05 May 2019 13:57:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 28/28] hw/arm: Remove hard-enablement of the
 remaining PCI devices
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dAyWlz6k3w5m

The PCI devices should be pulled in by default if PCI_DEVICES
is set, so there is no need anymore to enforce them in the configs
file.

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 233937f394..f23ecfd5c5 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -36,14 +36,6 @@ CONFIG_DIGIC=3Dy
 CONFIG_SABRELITE=3Dy
 CONFIG_EMCRAFT_SF2=3Dy
 CONFIG_MICROBIT=3Dy
-
-CONFIG_VGA=3Dy
-
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
-
-CONFIG_PCIE_PORT=3Dy
-CONFIG_XIO3130=3Dy
-CONFIG_IOH3420=3Dy
-CONFIG_I82801B11=3Dy
--=20
2.21.0

