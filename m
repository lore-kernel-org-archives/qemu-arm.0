Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7785156wrx;
        Fri, 22 Feb 2019 23:56:49 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYpHNTsO4U/Y+YlpaAxHU83q4LA0HbX4oV6Fw6tazjX8qH0EaxYaYLddVG3l29XhMkC/G7t
X-Received: by 2002:a25:c805:: with SMTP id y5mr6756259ybf.68.1550908609894;
        Fri, 22 Feb 2019 23:56:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908609; cv=none;
        d=google.com; s=arc-20160816;
        b=D/8mLkEsAHpYbsdsThk4xcNOJ27sztSxBrgb7WRi/NugAK/oEdMwAhoWtGuUoQC+t6
         TG3p5ryLKUQZh74Uzym1WiBB8YiNt9PBynL4SB3pCRdQss7o8WXO9SdEu/v/CIF02c/C
         +gkSdZ40qJ3VLtSD0NaarejP7eEuEziygs8D58IbaZnTQROA37Bi7T98lCqWknH5gzd4
         pryb+IyLrpopTgBQtAGh79HweaQmVDXleS8PLnUzH/Ok+66ni31DaqZKvRKNs1loM16N
         eXON2vKr8BpObMQ2SwmiPplaepxhiiSToKj+DEFO38obB3AQxZOjpfAup784ZxDIcLj1
         o+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=b70sEPjEOLLVXAlSe6mQ5za6lIVzlUwXdthQj3DwzPQ=;
        b=N90mGDWhH/QdOVzj9on+ChvUGH5ECXkJdeNpXjHkuECu8hU0A5ShFEVxhWjhd7UAht
         f8cnHk/ZR0yc0m3EEE5wUebnVVuHOfQHcEqK4iXxStpjlVmQAuID1oC2xnUXZIM0zBBo
         x9nd6uZOkj6RoVICJYKhvfptTp4zRr06dWn/RJxE1gm3vbryyKdm8M9FKIJMVQ3g6ogT
         DK5u33yTvVRQ/AaRomPbVCVRZ5iWnAvtSir8vD88fdH7Gcbqk6galhMOP+HAaFTyPFmE
         Id+cSNsnmKWwaMQO/qnvLIVoVfswuGjcpusR274yvy3q6z6Eq8O3h8AaNhxRQjJr46M1
         nBsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h189si2094957ywb.311.2019.02.22.23.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:56:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSAz-0001Pm-7N
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:56:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4J-0004cR-EZ
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4H-00021z-Dt
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59576)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4F-0001zb-NI; Sat, 23 Feb 2019 02:49:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 558122DE20;
	Sat, 23 Feb 2019 07:49:50 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D18485D9CA;
	Sat, 23 Feb 2019 07:49:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:03 +0100
Message-Id: <1550908162-22644-12-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sat, 23 Feb 2019 07:49:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 11/30] hw/arm: Express dependencies of
 stellaris with Kconfig
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hfbRuGgfhVnu

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 10 ++++++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index e0818f1..4ca7b63 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -14,6 +14,7 @@ CONFIG_MUSCA=3Dy
 CONFIG_CHEETAH=3Dy
 CONFIG_SX1=3Dy
 CONFIG_NSERIES=3Dy
+CONFIG_STELLARIS=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -22,16 +23,10 @@ CONFIG_SERIAL=3Dy
 CONFIG_MAX7310=3Dy
 CONFIG_TMP421=3Dy
 CONFIG_PCA9552=3Dy
-CONFIG_STELLARIS=3Dy
-CONFIG_STELLARIS_INPUT=3Dy
-CONFIG_STELLARIS_ENET=3Dy
-CONFIG_SSD0303=3Dy
-CONFIG_SSD0323=3Dy
 CONFIG_DDC=3Dy
 CONFIG_SII9022=3Dy
 CONFIG_ADS7846=3Dy
 CONFIG_MAX111X=3Dy
-CONFIG_SSI_SD=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index af559be..db48b9b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -98,6 +98,16 @@ config REALVIEW
=20
 config STELLARIS
     bool
+    select ARM_V7M
+    select I2C
+    select PL011 # UART
+    select PL022 # Serial port
+    select PL061 # GPIO
+    select SSD0303 # OLED display
+    select SSD0323 # OLED display
+    select SSI_SD
+    select STELLARIS_INPUT
+    select STELLARIS_ENET # ethernet
=20
 config STRONGARM
     bool
--=20
1.8.3.1

