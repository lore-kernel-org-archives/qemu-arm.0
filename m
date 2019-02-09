Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp301760wrq;
        Fri, 8 Feb 2019 22:57:27 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYSGF1RSdhYD/u3n0HhA6a/8FW9MPJDGFmTy302bCiLaOu9ToUzKqP0ldWsWm6UXcAmC/E4
X-Received: by 2002:adf:e34b:: with SMTP id n11mr18613628wrj.91.1549695447258;
        Fri, 08 Feb 2019 22:57:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549695447; cv=none;
        d=google.com; s=arc-20160816;
        b=Ayhal7eUgfcPg2RYiSNN+cfY7oifjGjAysxIfPzqUejwcW9qSj0SXl7N62xhhqeDno
         aeRMVRWZpCZAzboLIlE/UWn8149VVX8q8yOEKQ7+kPfGHLzaJanqueo0sLhOfp872rAi
         4au4roLb9rsAY7Kr16HtXkpiKxtdAMsx2871XyUwX5A1F03WK/IvySpMKbQv5pksVHLz
         ylHfeizpJwdk+qJNwBkESdS7/Jnei4/QgwbfoE989hNWv3h/H9Uy814+rM4G09oKND0r
         BP98UiHWO7/4CWQCWaU9RvvrPoCThTM29dq2GHW12Oj3Q5abbb0TuqBcS4ylfJyC00rl
         m7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=d3/96t5aZyi3qb6hS/asGY1J4BgMvne0FrktLC5tOaI=;
        b=STXSoRaQshOsl1TMEThUT96OHkfgqXP3dawKOC/waUZL26F0FMG3qRLAAHeDoYHfuz
         wD8+ob8DCe1RhGQlQyomwC7dSontEt330YcRwQms8MgLWXdlJEeAJekHadT6Aiij158i
         kaac2T2aSNKACdOMC0LudJqPHS/IV8LtyKpTCxg4Z5ctq6M79j4d7pyewNtkuXOb/Mus
         ANCuDo1bhBIwHC3Sc10PhmmK3ZerhHZxSHYVD9hwEXwJpX5MVT/I3fJIImxYTG5sGxew
         yFDBqDwfnlYBhq0E5/f6uqsBnTR9OT8/U1mr6SO9e8u4VLd7UguyXrH9LxXSgScRSJLF
         15mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b139si3406598wmb.191.2019.02.08.22.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:57:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMZq-00012P-8B
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:57:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJt-0004XZ-8a
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 01:40:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJs-0004YP-0m
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 01:40:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33146)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJk-0004G4-OO; Sat, 09 Feb 2019 01:40:48 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 230F8C05167B;
	Sat,  9 Feb 2019 06:40:36 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2E5254505;
	Sat,  9 Feb 2019 06:40:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:26 +0100
Message-Id: <1549694366-1284-26-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sat, 09 Feb 2019 06:40:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 25/25] hw/arm: Remove hard-enablement of the
 remaining PCI devices
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
X-TUID: 8dZbTZSAaSqQ

The PCI devices should be pulled in by default if PCI_DEVICES
is set, so there is no need anymore to enforce them in the configs
file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index e0d1a00..47f721e 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -31,16 +31,7 @@ CONFIG_RASPI=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
 CONFIG_MSF2=y
-
-CONFIG_VGA=y
-
 CONFIG_NRF51_SOC=y
-
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-
-CONFIG_PCIE_PORT=y
-CONFIG_XIO3130=y
-CONFIG_IOH3420=y
-CONFIG_I82801B11=y
-- 
1.8.3.1

