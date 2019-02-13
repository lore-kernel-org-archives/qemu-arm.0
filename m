Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1662198wrp;
        Wed, 13 Feb 2019 00:57:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iad3rqNrTJ4yqwAMLPohSlK3EbawywsnbK+FOp7uNsbA5TiBx3Ee3NknN5R7Uz3mfnua8EK
X-Received: by 2002:a25:c08e:: with SMTP id c136mr6528556ybf.194.1550048230491;
        Wed, 13 Feb 2019 00:57:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048230; cv=none;
        d=google.com; s=arc-20160816;
        b=LHBp8iB+ywz61NWo80u/OGtN5XxOPeffKu9wpLQOTDWwu4VHQdtOc5Dt9QwAeRKIa1
         k9GMkM5kdRnAu2o+VcY7JkPC89dvhRUda+zlkGwSnLVs2pswswrREVVS1Y92cBH6SeiX
         yMBYY3f2tsUsQ7JIGnP6IjH60aCVQ6LNa7NQdJ8dMVycAmoR5D0Tn8Z4kV7RG9Eo+WM9
         d7qHP1qdW47HXYVBBsk4k9fD5B6s07bOYuZCdEafnhtzqtuzF+WFee4vYeJVTGd0YzFt
         ivZNMx/I13VJulthQ4Ed8jMcNsREL9PREtx8khMNvi41aQaxqe6uLHtcVfMlSE4BeRtr
         1vrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=xUeUOxTEpNUsqPT/ZL3qra34dV1YVIrT7bmc0r6k6/k=;
        b=pAQT0BAkXgZcmvLjSsWODP4tWYvmSYl0t3kgipx4eTcxsAMqh29c7xsSSKR+MqlzBy
         mmdDnaq2Ri98JvktHRCjRxmukusXYyrS2VT6Q9zwLRRfJk6MyglH8Oas/rXkJ6uWhTV9
         XcMNHqKimFobXhjL2hK1uBwGrQtkQkQ72FWn5Go/Trvs2tfxX3ggr8lrAJDePJj2tg0+
         8iEj8ObtC2FalKOMKNfRiRM9rhS2ji+Fx78qXUaKQ6NPLyLq5P7sDpXST/TMekD0eX9p
         xVikdkU2cI0tjMTP3FV3TZQefq8hPeTyfhqFrQpLAryAdnAJZb8FhR5I2Z6kBtxhzLT1
         8XRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186si6229876ybu.64.2019.02.13.00.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 00:57:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqLt-0007Fg-RM
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 03:57:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqFs-00024X-3p
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:51:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq5H-0006I6-Rg
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:40:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48228)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq5H-0006Gd-1Q; Wed, 13 Feb 2019 03:39:59 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 480EB89AD9;
	Wed, 13 Feb 2019 08:39:58 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDA25101E841;
	Wed, 13 Feb 2019 08:39:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:18 +0100
Message-Id: <1550047098-1210-26-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 13 Feb 2019 08:39:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 25/25] hw/arm: Remove hard-enablement of the
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xou0fqYVO/LF

The PCI devices should be pulled in by default if PCI_DEVICES
is set, so there is no need anymore to enforce them in the configs
file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index c1bc6ac..19c84ac 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -32,14 +32,6 @@ CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
 CONFIG_MICROBIT=y
-
-CONFIG_VGA=y
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

