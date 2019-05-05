Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1443610wrh;
        Sun, 5 May 2019 07:14:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxeqTB/pa3fcqrfdLikD4g06c+kRvZT7n191X8YqE1TeCi5vEzpUjX+B2OwC/vRb4RJpHrW
X-Received: by 2002:adf:e690:: with SMTP id r16mr11849539wrm.193.1557065648485;
        Sun, 05 May 2019 07:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065648; cv=none;
        d=google.com; s=arc-20160816;
        b=KhNjuIRWk00R2K3icAGXuZ/R8OtPQ4/CfGrs8zjPpV4QP0U/YVu9xFIDwOSHJga+au
         4yidms70xC7q4C7UawjJ8v13oDPydr/HewRyJk+IfIbWC7CQbRBpo/61AkOIYaHNrvfP
         lKq8j/cj0QPHmDJWrtgBmng64xRvDp2qc0cwEEo/HYQtIBiY9nfKolY3YSlrNMtX7dBB
         iO5yDU5gA1PpSu8ippQ6aEeAiCpjGfpIm15Pe3UQQigtK7FRSbqLNzlmszvWV7iwehsA
         Ayh1I7jUElFJyBeoDX5p75pEZUg21t4txGvCEeM3URzr9hjf2i6qdjMFLKbbywskr0A2
         C/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=OriLAygB75bjbIUm7+RhTNrMtC7TJfxZ8unMYXEWbfo=;
        b=P/8J9vg2nDeoDB+ibdhn6XIh/5QpFFetFKehRel6+3lMXMn6aQern9QWAKcm2d1WCR
         I3yUYzR8YBU2gkSg1nihmNy5GIyv9cWsa/IfpPimhVWNWvZVfou66mIB8o0MsXh4FllT
         jIElikfDFFcsj+zDfuiwptt92zgO8HvyzkG9/u5C6Ib/I0+v1pGoAWM2djprRJ2jpk8h
         yExcvEzlQ74zwts1v7cfyGymZB908eq5eaCmNHNqpxlwz0GOB0jAAkWeppwbAPVSVjVy
         3pdJCoc/JGSQygCVrOtnT73a8wPilUKLyDherOPcEP8IVxMaw6qKx4yggfL29cQJsBQO
         xkhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20si4951910wmk.91.2019.05.05.07.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHu3-0001YD-Ho
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:14:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeN-0004WP-7Z
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:57:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeM-0004xU-5Z
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:57:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36582)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeG-0004s3-GE; Sun, 05 May 2019 09:57:50 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E1A530833AF;
	Sun,  5 May 2019 13:57:46 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4048460C18;
	Sun,  5 May 2019 13:57:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:05 +0200
Message-Id: <20190505135714.11277-20-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Sun, 05 May 2019 13:57:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 19/28] hw/arm: Express dependencies of the raspi
 machines with Kconfig
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
X-TUID: oQxkSgVYogCI

Most of the code is directly controlled by the CONFIG_RASPI switch,
so not much to add here additionally.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 4 +---
 hw/arm/Kconfig                  | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 31d31d3f4a..22bff20b32 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -31,15 +31,13 @@ CONFIG_COLLIE=3Dy
 CONFIG_ASPEED_SOC=3Dy
 CONFIG_NETDUINO2=3Dy
 CONFIG_MPS2=3Dy
+CONFIG_RASPI=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_IMX_FEC=3Dy
=20
-CONFIG_FRAMEBUFFER=3Dy
-
 CONFIG_DIGIC=3Dy
-CONFIG_RASPI=3Dy
 CONFIG_NRF51_SOC=3Dy
=20
 CONFIG_FSL_IMX6=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 55f7e5bfce..40be78303c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -258,6 +258,9 @@ config ALLWINNER_A10
=20
 config RASPI
     bool
+    select FRAMEBUFFER
+    select PL011 # UART
+    select SDHCI
=20
 config STM32F205_SOC
     bool
--=20
2.21.0

