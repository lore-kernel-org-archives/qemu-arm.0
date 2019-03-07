Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7207522wrx;
        Thu, 7 Mar 2019 06:29:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqybw3Wt+Xe8ZLvaoVCAAFGV83EHqXTlpsTBtD8k+kD+0d06zUkgS4APpytxBQFRtdoJ3CFd
X-Received: by 2002:a0d:edc2:: with SMTP id w185mr10237035ywe.228.1551968995776;
        Thu, 07 Mar 2019 06:29:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968995; cv=none;
        d=google.com; s=arc-20160816;
        b=SAEVmbhZm9cQqWOczBLbDPXx69bLUYPJ+Q53Wc8dvel5DBUQSBb/qbQ59HkdSUDPPX
         7o9WL7CZXoapxcr4FqNA4MPd5goZxAcsNpgjjYVwkXo16e+FIpuZjXel93ljqKzgLrPG
         dzDHHObXcCfsot3neQDMAMtpiwlPYx8cCWLxD9tBP6iFL7T+VbLn7XsSBpgD5qiUiZ8O
         U2EVJ7Q0df0g5etl+0mm3aZ8koMXqrc3J/xKaPWamDIpspDgmaJbHVkgPCZoWuCu1IjX
         YbaVDz49DJKTAlnp7J/iC2uETHhwrIWgZjGhwt5bSAQmVLUYMqwlJvzwArk7EUjApBg5
         jMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=mVz9QXBastWyo/q3qzM3klF10iwapb2OfzxZ/4e474Q=;
        b=mX6bsIKvQd1wQlz7HnZThZKL3C63zW0ZT33k1Q7LZ424oz1DGNdBmXBfXYplDkOyUA
         0wPQFWAU+Xa5Hjne+ZZEjI7qEVHumG8v0iCychiLfSn0qf7wtWKsdHDepUilYEwSy6eH
         btehWs6f8WH/rG+WxohIo810E3mt49aQGR9DN6IjKoDZq1wiY7fT+XMfTa8nyRuLjsWt
         YlVXYE7jKEkSv5k7Xdh4SBleM0aYCIfPbGeK0p/IYTIZeIWEQCFAeVmcuynh6cbigKcD
         zLpkTD8kS9dnDd62Hc77XSYI7iOeWPrg0mB56akGjWafIiVKCXx/jmNRag6hmeVYY2L2
         5M0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e133si2739935ybb.226.2019.03.07.06.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:29:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52709 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1u1z-00052U-5o
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:29:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1ttP-0005sW-L5
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:21:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1ttO-0000vy-SE
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:21:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:8396)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1ttN-0000kl-1W; Thu, 07 Mar 2019 09:21:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C201369CD;
	Thu,  7 Mar 2019 14:21:00 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 380E05C1B5;
	Thu,  7 Mar 2019 14:20:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:40 +0100
Message-Id: <1551968334-18982-16-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 07 Mar 2019 14:21:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 15/29] hw/arm: Express dependencies of the
 aspeed boards with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4EYXEk65pfIu

Dependencies have been determined by looking at hw/arm/aspeed.c

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 10 ++++++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 44988f7..81c8156 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -23,15 +23,12 @@ CONFIG_SPITZ=y
 CONFIG_TOSA=y
 CONFIG_Z2=y
 CONFIG_COLLIE=y
+CONFIG_ASPEED_SOC=y
 
 CONFIG_VGA=y
-CONFIG_TMP421=y
-CONFIG_PCA9552=y
 CONFIG_SSI_M25P80=y
 CONFIG_ALLWINNER_EMAC=y
 CONFIG_IMX_FEC=y
-CONFIG_FTGMAC100=y
-CONFIG_DS1338=y
 CONFIG_PLATFORM_BUS=y
 CONFIG_VIRTIO_MMIO=y
 
@@ -89,8 +86,6 @@ CONFIG_I82801B11=y
 CONFIG_ACPI=y
 CONFIG_ARM_VIRT=y
 CONFIG_SMBIOS=y
-CONFIG_ASPEED_SOC=y
-CONFIG_SMBUS_EEPROM=y
 CONFIG_GPIO_KEY=y
 CONFIG_MSF2=y
 CONFIG_FW_CFG_DMA=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 43ef149..e162049 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -262,6 +262,16 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    select DS1338
+    select FTGMAC100
+    select I2C
+    select PCA9552
+    select SERIAL
+    select SMBUS_EEPROM
+    select SSI
+    select SSI_M25P80
+    select TMP105
+    select TMP421
 
 config MPS2
     bool
-- 
1.8.3.1

