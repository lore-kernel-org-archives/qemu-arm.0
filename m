Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1675535wrp;
        Wed, 13 Feb 2019 01:11:54 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYrfO+JMMp4XyLtCvQfZJrOi1EXSNdlgqigPJJ3u9s+4XgSugFcxE0Bswk6iFQ35ZbNYK22
X-Received: by 2002:a25:e82:: with SMTP id 124mr6575094ybo.70.1550049114179;
        Wed, 13 Feb 2019 01:11:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550049114; cv=none;
        d=google.com; s=arc-20160816;
        b=n724djIcdZqxzba5Mu8YLzCg8WL9I1WQhUISo8RHan4+b9Em0YQ4cfRud+sDzjwZqW
         7i8GtldsFb3Ssn2IKU1zLGljqb2dLlOjD+G+gliDmUo2GhLlZTP9iTOekJoamyKcF8fM
         LY8LJHax3vvAXRBUVoFrmC11yq+QRvFloH4yh94r38qGH0ww87oSlQOeWXU+v88VpO/b
         ao7rKVOcr4qHBXnp6FcKu8nndeLYqh0G1NHQj8NlIbnx+po5J/z35ouzMvJ2Ut1R9v6f
         L6ScYCgaeJLN2mvByLLgCa4YicKrwIwlM1l2XvQd4MeSB5IqLZYzO8ioc6+Ux9BBIDvF
         iWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=f5f+GuVSvBfnGe1caiJDMpxcA79uLa/BxP9r4rjcQb0=;
        b=TTfsUQwPuAG7WAtnDKRlCs24enm70B9AANnh3LX8Ng9VC0RxfIZq3xKVt4OnS1VQVz
         LCi0Cp41yCmEa+2zQFxOphFlyqbTjm4PM5FgzzE4wjZuUcefAD+R77/sh6AcnRNJPNSD
         GViUuTDwtFBiyt//3Pz2Lk6gQNzbwNxqCvaPZ86fYN631c9dC5JCJxWoMLsf20ZomRXX
         zAYj2quTyhiwcIGtEsjBN+Qi2ymWNay98WxZCzQc5ZJPdvxDaqBcf44nfZjf+PwYC6Wd
         3SPx/BcWAw2uRsusAE4mHGNH9TUDLjV9diWpF5+V+Zv2/P/34pbBq9H/j5edJ7ieKo6t
         WC2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a189si2189939ywe.246.2019.02.13.01.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:11:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqa9-00028A-Gq
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG4-00024X-UB
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:51:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4J-0005X2-Cg
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:39:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4G-0005Ne-SI; Wed, 13 Feb 2019 03:38:57 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27CB180467;
	Wed, 13 Feb 2019 08:38:53 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7F05101E841;
	Wed, 13 Feb 2019 08:38:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:00 +0100
Message-Id: <1550047098-1210-8-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 13 Feb 2019 08:38:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 07/25] hw/arm: Express dependencies of
 stellaris with Kconfig
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
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G4CTtucUz+XG

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
index 492db53..1be49bd 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -13,6 +13,7 @@ CONFIG_MUSICPAL=3Dy
 CONFIG_CHEETAH=3Dy
 CONFIG_SX1=3Dy
 CONFIG_NSERIES=3Dy
+CONFIG_STELLARIS=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -21,16 +22,10 @@ CONFIG_SERIAL=3Dy
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
index fe1505e..3034252 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -95,6 +95,16 @@ config REALVIEW
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

