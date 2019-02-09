Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp300362wrq;
        Fri, 8 Feb 2019 22:55:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaeX+dvXNcbhGCgn1FtZnzK1jF0GvoytgauU5J/kL5HiXFrLLbpfs8pl4FKxF1b2gV4+OHP
X-Received: by 2002:a1c:9992:: with SMTP id b140mr1166638wme.83.1549695307590;
        Fri, 08 Feb 2019 22:55:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549695307; cv=none;
        d=google.com; s=arc-20160816;
        b=luqiKM+tZTZQrTWIKAHSOm68gk9aAXZOPGv7coOcUCY6XeqhjuKU3girwEArlvVl1k
         2BhDl3BsISlfhes6L+qY9Whd95MCYJHxjzDIbb8q4QWt7iKIFCBqYFs0XU9AEU5aTymn
         YGI33fmk5NUYP3W2JZwxrphw5XtTH9eh1E+6Y281AUl+PwlXxkDuXbBKvMxZwEG4cX9L
         buHUAlzpKOfm8boovKPHdTvJzMsdIza6nNLaRbJFkzksbvH0Eaqg89yVTOAsUpNLbL+6
         +cl4RTMie0odjftICjVSvc01L/L2Mm8ctezmzQp1qCrN+wzRev+N0uG9wLCkwAmcMIj9
         YNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=7BZ+GOs9SrTEtpN91vPokmYyTFxnIqRTRJHo0ED00tM=;
        b=0boP4efljycoua/1RsDuy4zu5wi2CyhmJ+Tn9gvUifQTE152z7yvFzQI7bXVrF7czl
         oqtnzfZcykyVFdEoad9cH/n9bNjJbmPjJNkxAfQvXqRwh1f5IhUuIr5Cd+Os2ZiFWP83
         /sPXZqjbtt3VWSxRVWhpptbbY39jm4i1fVKm54QocQm0jLZN/8g+c+itqgaeRVA4NmIX
         bXtDIfKoQugtMVP7P8E4E4Jb8iZXMN7bQj3UYiE3LgCSLhv20zrg085Y2BwtNtzrUg8H
         fpnGq39BgJkj6HCTOniaakH30Ib2satPVL8x2GBWeRG1aKegG1ele40y/EheaKnsz0fk
         jh4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si3317939wrc.111.2019.02.08.22.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:55:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMXa-00074u-Lk
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:55:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJs-0004XD-V4
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 01:40:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJr-0004XP-OA
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 01:40:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60314)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJk-0003tS-Sc; Sat, 09 Feb 2019 01:40:48 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F51783F93;
	Sat,  9 Feb 2019 06:40:24 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09EB954505;
	Sat,  9 Feb 2019 06:40:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:21 +0100
Message-Id: <1549694366-1284-21-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sat, 09 Feb 2019 06:40:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 20/25] hw/arm: Express dependencies of the MSF2
 machine with Kconfig
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
Cc: qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2sC+AeDsZjge

Add Kconfig dependencies for the emcraft-sf2 machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 4 ++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index f6193b1..729e4b8 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -30,9 +30,9 @@ CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
+CONFIG_MSF2=y
 
 CONFIG_VGA=y
-CONFIG_SSI_M25P80=y
 CONFIG_IMX_FEC=y
 
 CONFIG_NRF51_SOC=y
@@ -45,5 +45,4 @@ CONFIG_PCIE_PORT=y
 CONFIG_XIO3130=y
 CONFIG_IOH3420=y
 CONFIG_I82801B11=y
-CONFIG_MSF2=y
 CONFIG_PCI_EXPRESS_DESIGNWARE=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d98d39e..7823a16 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -362,7 +362,11 @@ config NRF51_SOC
 
 config MSF2
     bool
+    select ARM_V7M
     select PTIMER
+    select SERIAL
+    select SSI
+    select SSI_M25P80
 
 config ZAURUS
     bool
-- 
1.8.3.1

