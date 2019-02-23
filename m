Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7785408wrx;
        Fri, 22 Feb 2019 23:57:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYZjJZExmLhw8wKBecAPcN4oWEMlZUjy7qYGBqjbUSK4U04okTtU2k7B6FaN+bjal4+3dIv
X-Received: by 2002:a81:2548:: with SMTP id l69mr6354346ywl.397.1550908634119;
        Fri, 22 Feb 2019 23:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908634; cv=none;
        d=google.com; s=arc-20160816;
        b=XAmue6eagWtt+0NVUWjoOnOO8SL0LG9xbeoQqJ8v4R4C2GvlG9QJ4b2hGv/91+QsYA
         mLauosfy14cKleEEDHJ0XLOAcnVhGD8IfmqMWeaNojMFlEIWBBD8k2SGhYleJbAOh4+e
         xC+NcBxI97EM58Nf4maZzLY2jch1D7fkyBpDbeQJ8k3koqt+POGsnWFLcqS2ueNYcKue
         o7BG4zH6bFcK2pj6HK0nlN4etjsF4CKUte7Hmfl6SxvLJvggi4f+Jevf9KCyfX/jhxWG
         vCXC5xJQe3JHFDMXZP+RheozSRumbBDgJsZh1XUN6QHGStBBKLNeKosyPd7Vm8pEy6ZP
         jb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=ANpi0onr3ltb6Ruo9BdPkpLtZ29Nx3XsBWzeiVeOQa8=;
        b=ZsUAEU8pMIYFoKYe0J+1EajRJayooP70pHgnn+YC9YIfs9bmfkZ2U712WELG0k2wCz
         /p0fzzCM+l1eoYZgQDBgeS3uIZWnD149VVQf2zCFVumIbREo9Dg5NoP7NNCgOvs9+9+7
         M4pewX8bkNdaEUA2COYiSHMcATH8OoQaBx53nNMTs+J/SKIc6vctseNMnqjKWCq8jpm/
         1wpjvOM6hVPpBfIQW86zPt/LkBU2w/mtNA1wqwD6SXJ+WSBRw+OyWry4ffePkmN3xqZs
         psoVruRMwIJYq+cTf4LSOi2bR5560lwKtv5dk1rCKtXhbgCFwpE8HzTNn4s0u2+ZHbkQ
         wznQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si2132615ybp.263.2019.02.22.23.57.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:57:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSBN-0001hK-IZ
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:57:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4W-0004kZ-8R
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4V-0002GA-Gq
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59596)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4V-00027B-6j; Sat, 23 Feb 2019 02:50:07 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AACF899CE0;
	Sat, 23 Feb 2019 07:49:58 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 508EE5D9CA;
	Sat, 23 Feb 2019 07:49:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:08 +0100
Message-Id: <1550908162-22644-17-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sat, 23 Feb 2019 07:49:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 16/30] hw/arm: Express dependencies of the
 aspeed boards with Kconfig
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
X-TUID: vD+VQyDEJZHJ

Dependencies have been determined by looking at hw/arm/aspeed.c

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 10 ++++++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 34725e1..476fe05 100644
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
 
@@ -91,8 +88,6 @@ CONFIG_I82801B11=y
 CONFIG_ACPI=y
 CONFIG_ARM_VIRT=y
 CONFIG_SMBIOS=y
-CONFIG_ASPEED_SOC=y
-CONFIG_SMBUS_EEPROM=y
 CONFIG_GPIO_KEY=y
 CONFIG_MSF2=y
 CONFIG_FW_CFG_DMA=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f15e433..32b3785 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -267,6 +267,16 @@ config FSL_IMX6
 
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

