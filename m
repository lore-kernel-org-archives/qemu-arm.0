Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1441010wrh;
        Sun, 5 May 2019 07:11:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjOoMY+fE15UEpsB0/0uvLOLT9vS902TcJNIPnp/CJl1uSTEU51iBPAnPA2GqbsM9MGDjx
X-Received: by 2002:a1c:4b03:: with SMTP id y3mr13594201wma.113.1557065470919;
        Sun, 05 May 2019 07:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065470; cv=none;
        d=google.com; s=arc-20160816;
        b=vPtRebNEqwajH+yzMxckNVaBjolEParNJbwNfHU+IqNimBv/lKwy9j8FYRw20SLjIo
         95a3dnC7teDslorqg0Kk5g1jAXy/ci62+mzi/qgUke2wZ0zhhdh/iv8fx4IB9vudyWBA
         u+oaCtcOR3Cf2J6EWApte9JmS2gl+0P0xpP8kKRd8AX8xbjWmVm7KD3sGCGDR5w6iEuB
         ipZa+ix0keN75QW9umyU5veKO7OB95NNAStS+3GLlIAnhg59Ijom87U1nnUDv6EFpsry
         yulEt29NrUqm6FTMGTdDDHNxBnfbo8LoNrjnBCOxdcfumiRf8OjzuQQbOxJTuZ31V77P
         uf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Xb0XAlHfCnoP31bEmnNY14rclkyl23orNZGAqedX/E0=;
        b=InRFDL+Z8n2bBF/H5fGdRIsGOWK52mTzxvjq/7JwyOeelEI/dd670Vu2DR5alchbbp
         x1lqNm5FFeNYYLvGLJMlHyOd4wxb25KI9dy0BzRbkPAwGD3bAQxr4Wa0ECdEyz4ryalw
         rgVJV5J6OIrh+sXQrn5gU40lSP/i2yCIopN0EPNKVRl14BqsLjeTl4vZcoE/2cCAOnXG
         t/9tl8lfqoQj5qzKqILOuzfqYQTTvADoOJ5TZ7c3Pl9vmOxc8PLj1p7efmKrx2A8jQFD
         rz+JMHOjjl6TAA1Yu/UKI7pk0ywl9WT5GL3VTh/ftMKT2BYYPJUbb9JdI+mcRLDRVTNA
         eJzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z26si1631817wmf.21.2019.05.05.07.11.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:11:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHrB-0007ue-WE
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:11:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeE-0004Ns-H5
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeC-0004rF-Kh
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60478)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeC-0004qU-8N; Sun, 05 May 2019 09:57:44 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A4F7307D861;
	Sun,  5 May 2019 13:57:43 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1CEF60C18;
	Sun,  5 May 2019 13:57:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:03 +0200
Message-Id: <20190505135714.11277-18-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sun, 05 May 2019 13:57:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 17/28] hw/arm: Express dependencies of allwinner /
 cubieboard with Kconfig
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x103DT+cbsVf

Add dependencies for the Cubitech Cubieboard.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 6 +-----
 hw/arm/Kconfig                  | 9 +++++++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index c86a9f5427..a0b9016e3a 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -7,6 +7,7 @@ CONFIG_ARM_V7M=3Dy
 # CONFIG_TEST_DEVICES=3Dn
=20
 CONFIG_ARM_VIRT=3Dy
+CONFIG_CUBIEBOARD=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
@@ -32,7 +33,6 @@ CONFIG_NETDUINO2=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
-CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
=20
 CONFIG_FRAMEBUFFER=3Dy
@@ -60,10 +60,6 @@ CONFIG_IOTKIT_SYSINFO=3Dy
 CONFIG_ARMSSE_CPUID=3Dy
 CONFIG_ARMSSE_MHU=3Dy
=20
-CONFIG_ALLWINNER_A10_PIT=3Dy
-CONFIG_ALLWINNER_A10_PIC=3Dy
-CONFIG_ALLWINNER_A10=3Dy
-
 CONFIG_FSL_IMX6=3Dy
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 25ba109773..0e89383f50 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -25,6 +25,10 @@ config CHEETAH
     select OMAP
     select TSC210X
=20
+config CUBIEBOARD
+    bool
+    select ALLWINNER_A10
+
 config DIGIC
     bool
     select PTIMER
@@ -246,6 +250,11 @@ config ARM_V7M
=20
 config ALLWINNER_A10
     bool
+    select AHCI
+    select ALLWINNER_A10_PIT
+    select ALLWINNER_A10_PIC
+    select ALLWINNER_EMAC
+    select SERIAL
=20
 config RASPI
     bool
--=20
2.21.0

