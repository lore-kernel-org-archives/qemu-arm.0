Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp296799wrq;
        Fri, 8 Feb 2019 22:48:40 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYViR3yWVUKHwdlHTjx/iLB1Vs/EnZ53Pi2jL8T0jAVi2cmzSXs6rjycvFQN0CUmHMFvani
X-Received: by 2002:a05:600c:2255:: with SMTP id a21mr1804271wmm.31.1549694920308;
        Fri, 08 Feb 2019 22:48:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694920; cv=none;
        d=google.com; s=arc-20160816;
        b=Lh9UfucujgDoeyiYbu078yB0a+T7z454rSh72iMZQll9UWRtPsUKIU9nzdxbvBNONt
         wutc+ze4c/kec7jJABcG08viQRmPyLzasHFOXC/BChbzU3ot84FNSimZNPQcWl5193bX
         hrcY2idAWorUr4dUGC6UqcTVzSku04FTcFI9Y8nAcpOiRTgVtrgGoEYxn40U67jJ3qlp
         nr+6KFFdvvMdzHzaESpIRKztHqLe66/Y1aN5JDEbM9zARZPQhPuHt6WcAlj3lkhEJSor
         c41fgkwOBN2HAS9qgGvp7ZQ0A5geOYvYeT7QDAvTly1NH5uOLUtWaSGx7zBxPt58XPxM
         KuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=0ooPhq/pvoZqKfciXh4f1lS4At6p+wqxY8JjBBUyl+M=;
        b=SC1RcoyDhq6U0MtzU8m5pdXJOsKExiinO6OVZ7iMfdcWnC3h2TiYaY31BYM+lhy82a
         AgeN4jMz+7K+if54mKJ0gv3ZWd2DHEIpVziXx//Vd6oA1w0smAiEEOUE1J3JeAsXnguF
         BwiS/uZ21QVVa0QJYqlaaHIvH6/oi7k4QtjK1chExzLo9ymAoYY7lfY9wZVWwyCrrRcu
         QiRNfSi5/WF0Uz8UB/nt2q/Y1YWnaFCkQSI3G8k9/R4KvB0QemZnlrTZ0sUqrpdSP+5m
         lzmFj67aEH8G8bqNPqDc/5FPR1kSDWgdjvsi/0c1qOWJEJRVHXWnj/tHuAbaRx4DbvlI
         jePg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y188si3235229wmd.149.2019.02.08.22.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:48:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMRL-0002Jv-Aa
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:48:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJk-0004PP-Hb
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJY-0004GL-PH
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50504)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJI-0003pg-Ie; Sat, 09 Feb 2019 01:40:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA87C7F41D;
	Sat,  9 Feb 2019 06:40:17 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 740FB62937;
	Sat,  9 Feb 2019 06:40:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:18 +0100
Message-Id: <1549694366-1284-18-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sat, 09 Feb 2019 06:40:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 17/25] hw/arm: Express dependencies of the raspi
 machines with Kconfig
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
Cc: qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dWrJ9WdmBbl8

Most of the code is directly controlled by the CONFIG_RASPI switch,
so not much to add here additionally.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 4 +---
 hw/arm/Kconfig                  | 4 ++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index b530a06..6605786 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -27,15 +27,13 @@ CONFIG_COLLIE=y
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
index 5765fe9..6b1522f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -270,6 +270,10 @@ config ALLWINNER_A10
 
 config RASPI
     bool
+    select FRAMEBUFFER
+    select PL011 # UART
+    select SDHCI
+    select PCI          # TODO: Currently required for SDHCI, remove this later
 
 config STM32F205_SOC
     bool
-- 
1.8.3.1

