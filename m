Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7211240wrx;
        Thu, 7 Mar 2019 06:32:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQUvyDDgjh7KrCTSZynuQbJum61u/2Ng3BGKORUgovtgwTFl+yNeBxhLO2z9TdQOipooQ6
X-Received: by 2002:a25:7582:: with SMTP id q124mr11780598ybc.136.1551969179173;
        Thu, 07 Mar 2019 06:32:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969179; cv=none;
        d=google.com; s=arc-20160816;
        b=QWdK2Zb7z3EHdNfdpq0efKFnWBZqoMijDP57s3fB0RTXmptnXoDtL3DTipbTDxW3z4
         tp/tYi2DsiiqBqxEyINCCa12zYb1+j9nUwTtx3RFgdjDe3m5E/9slgxv/OBD33jcQArP
         WPA08P2K4WgmKBOynYD4r0mVaL4l1efC0LUW3ki6cNzrd9M/L7GOQ7nRXsS+ZDY5YlLl
         RQAndC83WhPGTB4Qq+0CbNaTa/P0LDznJlEAhQ2M2LQw81Wmlr4TqT8H/6sNsXG8zztU
         qLJUL/YZAZiv0tF2MjLet/mJh8lJKStexSlzH3jnW+W8yrEJhbiYJrkChkEGoZx0scCv
         BLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Mw5J6/5Rv7ph8HjQqQcv5EUeCisDMXgwjfwL9MQks0Y=;
        b=ychpqQ92t/jNmrD3WD46c9qcP2DIDsR53d950CP6mJdh8ZqDmlzJydAMHs8pozgMaV
         bg6mH9pLwKMj0adaTGibzbB6cz1yzqCMgWAS8S/Mpyi73lkQq8K1gcfAelTV9gKPWysD
         C4EPewqM1jFPuDec957xHVNzSHcfoYLRaZbHVJXnl28jqDi26C20VkQf14h6m4iR7pWB
         +jz0mFKOSM7oiwNJkS0QYt2cB0GSsw0nmpF2rnYoHqVzvtQL3xrov8FAG7wld4T+gqxQ
         fVbCrgzuFAmtUtcsFCm01skX/Roa+e9aXGEiPxIJ5njI4dfVMakW2+jOsPElLBqtBpOV
         cIpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g85si2884210ywb.108.2019.03.07.06.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:32:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1u4w-00086Z-I7
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:32:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tuQ-0006qa-HN
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tuE-0001j7-Sa
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:21:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45910)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tuB-0001eO-7S; Thu, 07 Mar 2019 09:21:52 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83DF399DDA;
	Thu,  7 Mar 2019 14:21:48 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D0965C1B5;
	Thu,  7 Mar 2019 14:21:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:45 +0100
Message-Id: <1551968334-18982-21-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 07 Mar 2019 14:21:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 20/29] hw/arm: Express dependencies of the
 raspi machines with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: feIP5JgYQdzN

Most of the code is directly controlled by the CONFIG_RASPI switch,
so not much to add here additionally.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 4 +---
 hw/arm/Kconfig                  | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index b8509fd..290023c 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -28,15 +28,13 @@ CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
 CONFIG_MPS2=y
+CONFIG_RASPI=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
 CONFIG_IMX_FEC=y
 
-CONFIG_FRAMEBUFFER=y
-
 CONFIG_DIGIC=y
-CONFIG_RASPI=y
 CONFIG_NRF51_SOC=y
 
 CONFIG_FSL_IMX6=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 32c8663..87440db 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -263,6 +263,9 @@ config ALLWINNER_A10
 
 config RASPI
     bool
+    select FRAMEBUFFER
+    select PL011 # UART
+    select SDHCI
 
 config STM32F205_SOC
     bool
-- 
1.8.3.1

