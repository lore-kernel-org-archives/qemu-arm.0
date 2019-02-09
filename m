Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp301543wrq;
        Fri, 8 Feb 2019 22:57:06 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZnZ+a09/PoFzuV2KLdWiEFuigu11/enQARMVC+XLaBcoDcevOfvMRcLYQRAqdtSMEp6+Zs
X-Received: by 2002:adf:b6a1:: with SMTP id j33mr19455466wre.55.1549695425972;
        Fri, 08 Feb 2019 22:57:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549695425; cv=none;
        d=google.com; s=arc-20160816;
        b=WtrHMawb5/167g/83Gt5H1jAlZvgh0Ikrn980Uye/ZXqdqsOy+SCp5cP/FS7f7HLxP
         ODPr2JwCI6R0w6HOLXGoOUFLltgAtJDiNg+TaB7PurNuIxbQUYK6qZALPW7Lh9IFrxRd
         1g8ZfDAJvVNGhQicG49hpfdXtvHd3sqj3IM1qgQHAFBH7KPeLKjdozIepOFrROQvCcT9
         T9Cgf+fYNCM01eD1mDsO+iDFHHWAqOfuEsDfiOIpEk2LEsy7TzNXzhmPC+p6tzgHasXO
         wJ/etTrdJRgfzlrTmmKuL0bCJxZeBla8So0IUAElAl3OkvltQdQtVdNfOtn2kQUaWmYT
         f4KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=8veLfiib/bMN44VXNhQZBY757BBoMj+MQdv5R4ai++0=;
        b=pv0biGzoE8VF6pSMcDr7XjtcgilIN9vDv0Y/hP34xvxwNA+dSgGxpSoxPHBGHRobyl
         ZAzJQRyZFjCpKA+W/TGFfUfqjW4BgciFv0I5S583FHnOUKRiPRdCnJC0Plcx5qAydNIZ
         M0owtM2cLcMm2Xqgi2hQ/JYiKZrhFBUpdCzs79QGpkWS3wEmzAQIPK+U+B1niGWosPji
         i+2oPveC9wLaodpuq0jlZYI6WKeWqpCnyEnd9XzZ/NnSu34e4cSdwYRsiFoADzG1klOH
         NNPjeFLVgKcjd6BGx8Tu3rZnjEg2rN67qxHsOKQKfKBvoqJMiXWAnca+YIk6AU6KJ5nr
         BKzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si2877378wmf.195.2019.02.08.22.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:57:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMZV-0000uD-2Q
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:57:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJn-0004SF-NE
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJl-0004Rh-NP
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52216)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJl-0003qt-BY; Sat, 09 Feb 2019 01:40:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E237637EC;
	Sat,  9 Feb 2019 06:40:20 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EB1C5B6A4;
	Sat,  9 Feb 2019 06:40:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:19 +0100
Message-Id: <1549694366-1284-19-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 09 Feb 2019 06:40:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 18/25] hw/arm: Express dependencies of
 canon-a1100 with Kconfig
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
X-TUID: oOEnCYwCa6UV

Add Kconfig dependencies for the DIGIC / canon-a1100 machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 2 +-
 hw/arm/Kconfig                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 6605786..20fcbcb 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -28,12 +28,12 @@ CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
+CONFIG_DIGIC=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
 CONFIG_IMX_FEC=y
 
-CONFIG_DIGIC=y
 CONFIG_NRF51_SOC=y
 
 CONFIG_FSL_IMX6=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 6b1522f..617a460 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -31,6 +31,7 @@ config CUBIEBOARD
 config DIGIC
     bool
     select PTIMER
+    select PFLASH_CFI02
 
 config EXYNOS4
     bool
-- 
1.8.3.1

