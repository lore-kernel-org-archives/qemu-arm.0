Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7795079wrx;
        Sat, 23 Feb 2019 00:11:09 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZu7hPOpFwO0cxYYAX41H1NAinR19jpj4TsO7N03DX46an2+N04i+4EjrBvHyOxZ4SN4mAP
X-Received: by 2002:a25:2fc6:: with SMTP id v189mr6620900ybv.121.1550909469835;
        Sat, 23 Feb 2019 00:11:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909469; cv=none;
        d=google.com; s=arc-20160816;
        b=FGKtSWpHuBVxNjXnxwAFNmWdfDthIA++X0P1wtsabE5xAuLhGqfKn5JBOnSgTH5yDD
         FdkRmZB/RyWoD/yjUzwpThtfn75nnNnBA67T7+oTN8V+wikDLZk4WgIpIbllnF/1ywcB
         0GmdA0FuseWLIc0/JlMbp20GjnipMN4fWdd9o7KH++jNh0GusZQTliMzheBmCooNx0eW
         yDzc0YIzMchyvsO1YGqL70K5l4WYjamx4ysmD37qwnRMD7HnOOeoPeFNl5zn90ay+ECZ
         Bg9y02mylS9Xfw79nAKa+qFFKOpH5cA8okcyDXDLshfel9Dn/R/gbx+zMf+sF0BYaDtv
         pi/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=OQ+Rge/4ck6WbKpXCtX0aIsbRpEsSWDJGs++tUvYFbk=;
        b=yaemIXEaEVgmkin+YMxE3tncHq9WkvF33wCsP7/3NpDLOQ2sRJdg9m3mvwxMadj142
         xUoLHGdKqbsygF4cLfwhQJfIBBXo+Dza4rY7TZr+qH0fYccsM2LSdBL0KzOBgSJpUStz
         z8dP//rwj+1hQb5S+jBvNDd5uFE47u565kQQ+biYPpkigtkhsHyWU7Bns3b//b+IdjmC
         NV68rK+2k5YvAAMe8gGq0RyiIGYyNbq48K9TcTyJLGkilcOiKxzAtV8K0fzpjQ6POuCL
         sw39b3oEOmcAklzU2amGzjWvkOP3TLP561Vil32fpsF17bR9n3ios9oWvegvcDyzn0F6
         furg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y143si2172295ywa.97.2019.02.23.00.11.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:11:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSOr-00046A-6u
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:11:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4Z-0004ng-4z
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4Y-0002MG-8X
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33432)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4Y-0002Ki-0t; Sat, 23 Feb 2019 02:50:10 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FB80300309D;
	Sat, 23 Feb 2019 07:50:09 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B29415D9CA;
	Sat, 23 Feb 2019 07:50:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:11 +0100
Message-Id: <1550908162-22644-20-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Sat, 23 Feb 2019 07:50:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 19/30] hw/arm: Express dependencies of
 allwinner / cubieboard with Kconfig
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
X-TUID: uU382pjV8iyj

Add dependencies for the Cubitech Cubieboard.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 6 +-----
 hw/arm/Kconfig                  | 9 +++++++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index b0c6c99..badb190 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -4,6 +4,7 @@
 CONFIG_ARM_V7M=y
 
 CONFIG_ARM_VIRT=y
+CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
 CONFIG_HIGHBANK=y
 CONFIG_INTEGRATOR=y
@@ -29,7 +30,6 @@ CONFIG_NETDUINO2=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
-CONFIG_ALLWINNER_EMAC=y
 CONFIG_IMX_FEC=y
 
 CONFIG_FRAMEBUFFER=y
@@ -56,10 +56,6 @@ CONFIG_IOTKIT_SYSCTL=y
 CONFIG_IOTKIT_SYSINFO=y
 CONFIG_ARMSSE_CPUID=y
 
-CONFIG_ALLWINNER_A10_PIT=y
-CONFIG_ALLWINNER_A10_PIC=y
-CONFIG_ALLWINNER_A10=y
-
 CONFIG_FSL_IMX6=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 34243b4..73382b6 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -24,6 +24,10 @@ config CHEETAH
     select OMAP
     select TSC210X
 
+config CUBIEBOARD
+    bool
+    select ALLWINNER_A10
+
 config DIGIC
     bool
     select PTIMER
@@ -257,6 +261,11 @@ config EXYNOS4
 
 config ALLWINNER_A10
     bool
+    select AHCI
+    select ALLWINNER_A10_PIT
+    select ALLWINNER_A10_PIC
+    select ALLWINNER_EMAC
+    select SERIAL
 
 config RASPI
     bool
-- 
1.8.3.1

