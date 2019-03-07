Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7204896wrx;
        Thu, 7 Mar 2019 06:27:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwt4B3L26Xu191ypmXL8eGQdqJch/ju3Ue8CgkHIE//0WK9dqmC5fLA17mRywJbum38uHv
X-Received: by 2002:a81:615:: with SMTP id 21mr10360963ywg.295.1551968828845;
        Thu, 07 Mar 2019 06:27:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968828; cv=none;
        d=google.com; s=arc-20160816;
        b=BhOub+O2cBqF7xL7UM3gM5LhiwuGwpDhHWixLVUZsHG6A9DebKbHtQkdvUuTrf9urY
         WhPyrr64/IIB/YtU0C4qb18sJqowxbduwnX7BkPqEsjsja/dQxHk6Hp6+/KAMM8xE5uz
         GTcCEN2Jfd6z24MXw/VitWlSZVOda1k5SVUK3t/8YiXKoOTB0xrXMboXEWY+Tq84SsW1
         sqnPvaokr5bQSaE6edgVxGUnC6noG3z4hGubSOa7NdnPS2HSgqIKzTz5Z28Zp3hz5qSH
         7rtp0eK2JHeOf17BB6cRiagEzh8yEtuReE+QOIVbjb7bPq6FXkqOHoH9v5o9YiWGqbaq
         o9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=TK9SZ9eTMLSMg2IBQZNJKVJngZNttTEP6j62Xqo5gzo=;
        b=kNKlYAX29R7yuiDl99KlJzDplo/aC9uuGrnoc1IGBUcpXMnPaUz3w6Tzzo+Ue0n77c
         Sphbl5J0RDyLPGtOUgBEPz5dV8kvp7f/aPGcmvaKUaE7++coyMNEsn1wZdmr5OOx8eBm
         t7OIJ3C6WeljS0vn9DNTYVPnw29FKAguHR4kQVEDNXZ/PC0UZLXNyMa8Oa/9Uv1u7rlB
         UERWRP4n9dthYibkSI6dLu5bOOgAhBJJKgG9l9OyY8RVacoF5TGldlH/v0rdYZqQMbbO
         64ophzFEjyovMcSn6YajL223TSUp8IHOHuA2Grqj2zCGGwHczqANZ5BJJl6AiBtXdsR6
         cBFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187si2656591ywb.105.2019.03.07.06.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:27:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1tzI-0002w5-9P
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:27:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tso-0005K2-6P
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:20:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tsn-0000Kt-53
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:20:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48562)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tsm-0000KI-UO; Thu, 07 Mar 2019 09:20:25 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D78E8764B;
	Thu,  7 Mar 2019 14:20:24 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABC205C1B5;
	Thu,  7 Mar 2019 14:20:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:35 +0100
Message-Id: <1551968334-18982-11-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 07 Mar 2019 14:20:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 10/29] hw/arm: Express dependencies of
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nc/E29WFu3f1

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
index 2c07f5c..46ec4eb 100644
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
index cfb3ab1..cb19fd3 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -96,6 +96,16 @@ config REALVIEW
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

