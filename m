Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1667322wrp;
        Wed, 13 Feb 2019 01:02:57 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaDHUY+VLkdoUV6CFpiA0QIDy8ZP1sCG+7X483H6SFYg9ZUdPgvOVU4rGm+n6aUrHq9kayz
X-Received: by 2002:a81:5c89:: with SMTP id q131mr3517184ywb.90.1550048577741;
        Wed, 13 Feb 2019 01:02:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048577; cv=none;
        d=google.com; s=arc-20160816;
        b=OeZ/k7AXJTcB9od0rJKj4WYZXesRUBCnr1ppEk/0apG20m41mYy408j4ihYFz+YE/p
         ae8VeLaIJGPcWApmm2DNse/N9lbqV3vhFCKAWZdwmHha0RTZSfQ4HNDGSTd2q0o9xeW+
         E0Dz6ogwJsYCcuIXXWzCSaVMz/UYKV57O83qZwnLbKd0X2p6FoZs3ozHTBGBzilO0Scs
         PXTvaNsUcPecKRq1DFfua30uWj4HFmn4e6wyi/xdEP6Fb74vumsv+560hbAh3r/fVUmi
         5cbxEiNzBoDZo5s8HmSiEWstIuP1IJsRFGw/gZjdWHxXpr8RkxOC2f1OgD8sBiif6Os/
         hF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=QOmFqIAlMv6mlPTfIvK+CLIMqbns2IqOWln6c5BS4zo=;
        b=bUkpMXQjTaJgTliajtjPsVtc/RlT/fAxl6Oo86zH/pYJF8CGho0s4OchOLxbNgx5Ha
         Q/5TxEWlv/ixtzHBMPEWvL4uIBqJN3Ric+p+mcLsjrIY8j4fjrRdjhr3ztkiRGbtIodu
         V4GTS/BjAfwCTabpM8toHWMFYWBtGm3B4wVDtjnD4d2ic8G9FvTW53Z4wvJInJtLMZHf
         WXzpjRKKBK0qpFs4Mnpu2v87O/Xjvp0uUGCryFlZXAa7oiTefBw4Y8vKEgctvCYoeFSd
         1PNr2PMIYX8Rk2SiFYOWs1hpbZDwF+yxeOMnekSbqWK1XUHuvtqarKD2JV93ebMHOR32
         CsyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si9091244ybo.287.2019.02.13.01.02.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:02:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqRU-0003ug-8G
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:02:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG6-00023s-N9
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:51:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq3u-0004zR-JO
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:38:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55398)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq3s-0004xg-RO; Wed, 13 Feb 2019 03:38:34 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 114FFC01DDFD;
	Wed, 13 Feb 2019 08:38:32 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A027A101E841;
	Wed, 13 Feb 2019 08:38:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:37:55 +0100
Message-Id: <1550047098-1210-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 13 Feb 2019 08:38:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 02/25] hw/arm: Express dependencies of the
 highbank machines with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wCWR5V73NlNB

Add Kconfig dependencies for the highbank machine (and the midway
machine).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  4 +---
 hw/arm/Kconfig                  | 12 ++++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 3baafc4..59734ee 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -6,6 +6,7 @@ CONFIG_ARM_V7M=3Dy
 CONFIG_PCI_DEVICES=3Dy
=20
 CONFIG_EXYNOS4=3Dy
+CONFIG_HIGHBANK=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -54,14 +55,12 @@ CONFIG_PL022=3Dy
 CONFIG_PL031=3Dy
 CONFIG_PL041=3Dy
 CONFIG_PL050=3Dy
-CONFIG_PL061=3Dy
 CONFIG_PL080=3Dy
 CONFIG_PL110=3Dy
 CONFIG_PL181=3Dy
 CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
-CONFIG_XGMAC=3Dy
 CONFIG_PXA2XX=3Dy
 CONFIG_BITBANG_I2C=3Dy
 CONFIG_FRAMEBUFFER=3Dy
@@ -151,7 +150,6 @@ CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
-CONFIG_HIGHBANK=3Dy
 CONFIG_MUSICPAL=3Dy
=20
 # for realview and versatilepb
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2850000..984de8a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -18,6 +18,18 @@ config EXYNOS4
=20
 config HIGHBANK
     bool
+    select A9MPCORE
+    select A15MPCORE
+    select AHCI
+    select ARM_TIMER # sp804
+    select ARM_V7M
+    select PCI
+    select PL011 # UART
+    select PL022 # Serial port
+    select PL031 # RTC
+    select PL061 # GPIO
+    select PL310 # cache controller
+    select XGMAC # ethernet
=20
 config INTEGRATOR
     bool
--=20
1.8.3.1

