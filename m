Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7783109wrx;
        Fri, 22 Feb 2019 23:53:15 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYVeYY+n1uMQMT9U56uLJqPNSbFGU3Q3HGYmMICKVr8lr0GCl5Bmi/VMFSig4NGFxcY+S18
X-Received: by 2002:a25:bcc6:: with SMTP id l6mr6420082ybm.258.1550908395756;
        Fri, 22 Feb 2019 23:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908395; cv=none;
        d=google.com; s=arc-20160816;
        b=AnqshKXOuh0VUYgmtikEBEo5lmb5g02jthf7dMLVcNMAvMrebsXEy5iWXfeN/B+P7i
         +0xgNoKi8lVi+7FmL7lR83rMw/KzoXHK93JPGS6QryzFwEs87Jzh/Vjed0K6jWtCfW+K
         Be8bJ6OlOcwK7sUWUbX5sH9ViXTSFp0PZCi9qecjL5ESQAI6tTb6creEsIM17jSJ+ygh
         eZqAIDpgdZnspdapmLZec6HA8xmDHwWHkR40+JhNXPs+lvliy9EkYByQmf3+xEe/1j7J
         rqG//2J6H50OwbknJ9dQ8xvatc2VSR7U6SHUE7V2zjR/ATpjZPhI8uXr6VE5ZUYOVdwM
         nIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oWTFbSw7T2KoDAjCZ2/5V1QjGlvsP8m5HX3H6PkmU7o=;
        b=bCTN6FIYpi9Bsf9hYgTaTHzjbhPPl2h1XhbhyiHyCgf7UA7TT1jeefGDyJhg7zN+AP
         5U/PwsX3vV2Gg/jAkDbMRHVYNdmRLmtccedp0BUXWoCV4UCc5wuLsFWI2A8tF1K96VBI
         wCWYY1Twnz45FzN+TPpCPlWB+2v2IEmetUW2Lns8/p13n/0CLCzD3LGqSn7jl+DsQzI/
         ii1yUHUGmMSH4QqdrO8YNlTygiIrT44veEI2bOMCl7h8RzKkBCeVusOjh5qd4ENemNRS
         yaUi9yjAoWyiP/msWl7WwXDUobN9/h/EjrNvbb7RtjITETKX285Fq7Ua8AFUnQQwn7dt
         hAcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si2107728ywb.239.2019.02.22.23.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxS7X-0006R2-69
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:53:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4B-0004Vx-6N
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:49:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4A-0001uw-8i
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:49:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35368)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS48-0001q2-CZ; Sat, 23 Feb 2019 02:49:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 698EA307DAC1;
	Sat, 23 Feb 2019 07:49:41 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 116485D9CA;
	Sat, 23 Feb 2019 07:49:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:48:59 +0100
Message-Id: <1550908162-22644-8-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sat, 23 Feb 2019 07:49:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 07/30] hw/arm: Express dependencies of
 integratorcp with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qc/RQ9KnOIC0

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 8 +-------
 hw/arm/Kconfig                  | 9 +++++++++
 hw/display/Kconfig              | 1 +
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index c91f526..74382cc 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -7,6 +7,7 @@ CONFIG_PCI_DEVICES=3Dy
=20
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
+CONFIG_INTEGRATOR=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -31,7 +32,6 @@ CONFIG_ADS7846=3Dy
 CONFIG_MAX111X=3Dy
 CONFIG_SSI_SD=3Dy
 CONFIG_SSI_M25P80=3Dy
-CONFIG_SMC91C111=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
 CONFIG_FTGMAC100=3Dy
@@ -48,10 +48,7 @@ CONFIG_ARM11MPCORE=3Dy
 CONFIG_NETDUINO2=3Dy
=20
 CONFIG_PL041=3Dy
-CONFIG_PL050=3Dy
 CONFIG_PL080=3Dy
-CONFIG_PL110=3Dy
-CONFIG_PL181=3Dy
 CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
@@ -113,9 +110,6 @@ CONFIG_VFIO_PLATFORM=3Dy
 CONFIG_VFIO_XGMAC=3Dy
 CONFIG_VFIO_AMD_XGBE=3Dy
=20
-CONFIG_INTEGRATOR=3Dy
-CONFIG_INTEGRATOR_DEBUG=3Dy
-
 CONFIG_ALLWINNER_A10_PIT=3Dy
 CONFIG_ALLWINNER_A10_PIC=3Dy
 CONFIG_ALLWINNER_A10=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index aea7301..6a34ce1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -33,6 +33,15 @@ config HIGHBANK
=20
 config INTEGRATOR
     bool
+    select ARM_TIMER
+    select INTEGRATOR_DEBUG
+    select PL011 # UART
+    select PL031 # RTC
+    select PL050 # keyboard/mouse
+    select PL110 # pl111 LCD controller
+    select PL181 # display
+    select PCI
+    select SMC91C111
=20
 config MAINSTONE
     bool
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index ee3acd9..34c8c12 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -21,6 +21,7 @@ config JAZZ_LED
=20
 config PL110
     bool
+    select FRAMEBUFFER
=20
 config SII9022
     bool
--=20
1.8.3.1

