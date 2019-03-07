Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7212446wrx;
        Thu, 7 Mar 2019 06:34:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqwS6aGlS6L8YAGni93iIguBRd1dqgJEo1bd7DHLVxVJFtW58FsohjLN2gPgcWFmOXjUYD3e
X-Received: by 2002:a81:5dc2:: with SMTP id r185mr10196394ywb.55.1551969247900;
        Thu, 07 Mar 2019 06:34:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969247; cv=none;
        d=google.com; s=arc-20160816;
        b=B/EPlFPsAihT0T9985VbVk0bmQnjIHm3nwdJefCPVr2IKnAmOgCIF13aoSQwEWKGns
         gSqCRU+keQfCQtOwVfIINX5U57aMgfaQC8F6W9p60Xc7p5sLpOK2wR7OmlF632J3jztU
         uhXuqsBWqULPaUjEfV0IaUjQFfZUuVFKopQ8rbsLtM+VUT+sxk08b4eS39gwHdWWfLwh
         XebeeI/yY6PVomv5GAa4TF51WkzHoSigZOq41Gh3SjLFpjUcc97iDqzDtK4Et3L3BgO0
         BhCeKWjDX4aXydDniawfrMb9TKP6xLUSM2bUXhI9eA5JfB9OfDzgLs9iSxFvZCH82vWg
         OLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=vglgLt6zjy/6uSdjEJjL5YlBmD4HkqYkRGtXpj24U9w=;
        b=oCPLLwwYBRZIASP8DEhvJEFEmWj+TEDvFngta3rts09zr2BBQBJCI/e/2g5eCGGX2A
         N+ZmFOjGoRLFrK0zhizcn5UkXa+tVJZgtq18Adw5m4Max6FP+gvD6jcFS3A8x+yUIuE7
         jGX75pGj0XCT9c9cIJqbZdiV2rgbcGxzOmmqUbGuosUWVmKihPvaRSfnN/Eqdt5Eqkew
         g8UHn62QVEvUatSzw1JfCmICIyXUSKY8MRW+1aSW83QpxrgkALKz7Rpr6gta15+Z2SRx
         3IOUUwGIOSYPS/E0rS+GkF6sezXZXDm/wT/Cuw3k5+Gbyek3MiamStPxyrEuxJeU3aps
         FNIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si2838001ybk.287.2019.03.07.06.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:34:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1u63-0000Kl-7k
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:34:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1ttt-0006Ly-Ut
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:21:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1ttt-0001Sp-70
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:21:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54754)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1ttr-0001RG-AO; Thu, 07 Mar 2019 09:21:31 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DA16C058CBD;
	Thu,  7 Mar 2019 14:21:30 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60EBD5C28C;
	Thu,  7 Mar 2019 14:21:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:43 +0100
Message-Id: <1551968334-18982-19-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 07 Mar 2019 14:21:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 18/29] hw/arm: Express dependencies of
 allwinner / cubieboard with Kconfig
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
X-TUID: tjAJVPqKHi/J

Add dependencies for the Cubitech Cubieboard.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 6 +-----
 hw/arm/Kconfig                  | 9 +++++++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index beb94d9..b6f3d60 100644
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
@@ -57,10 +57,6 @@ CONFIG_IOTKIT_SYSINFO=y
 CONFIG_ARMSSE_CPUID=y
 CONFIG_ARMSSE_MHU=y
 
-CONFIG_ALLWINNER_A10_PIT=y
-CONFIG_ALLWINNER_A10_PIC=y
-CONFIG_ALLWINNER_A10=y
-
 CONFIG_FSL_IMX6=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 68eccbf..743c78b 100644
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
@@ -251,6 +255,11 @@ config ARM_V7M
 
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

