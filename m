Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7211705wrx;
        Thu, 7 Mar 2019 06:33:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwsdBd98R4zISzYgNGlDavEDB4c0g3khTO0uYK7P4aefrY2tkfJSqc29Vapu4OHvFvZkRE1
X-Received: by 2002:a25:1955:: with SMTP id 82mr11335737ybz.76.1551969202773;
        Thu, 07 Mar 2019 06:33:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969202; cv=none;
        d=google.com; s=arc-20160816;
        b=VZJZnmR6uZEQPymhPTmdlb3lWWpEvuaoh1IjsY0Mi/cIjJyiwtzVI0VB0+eMV9Meln
         loFEeYcIoFD5vtLClYvkyAw4kJfz/K86CweLq3MPWt3O/jQIXynNyAvggpAvmp78Aaso
         FNBb6ZrTGFpAGnJV7vTxaeBJVdKDGIhAYAC4tHKupm2F/Q3xnQPwAXc/nVAlPBZJKg9s
         2KGvawXcpj0Bny/g124Pu6PEV+pNnOU1Yct299F4xJTdrSkgC62Rth0GKGLtnxtcUWd0
         RrLqKSsb+L8M6FayzDY3mKQ9amUdfEX8E+jBqxv1iB6zwftxNbpkl0Klmff2F00MxX73
         WDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5myEIT4w+Wi0R2m7st7Oa1p1iG8HP9Z1gCmurCcTwkc=;
        b=p5wmjzeeSrfm2zUQM7cz2USpLvkTRuEkAU5j0692rVUbNuZ3Vbc4YBv7YnzK8uXpuS
         fElJ38xjEcN62d2QPXa/tUJ0jliNIFNp5XhQ41Ho+kKszb683LdRt11P+SmcL4nkYQXS
         ijP0jvHHt+85xEthoOTek/5yPgpvJMaY1+uWC4k1wPGmiqreOLnYw5YHWMHMHTgTmvur
         ihUrwZ2kQqlAvPVGYd7ope/b/9cXl96gWpNDrv69gy9DkDwNcrbPTdIyImpj2XSupuEs
         d/vSe0JiucSTM1JmgsEQo6zS41gdSndXJs+poBwoe13MmJ/UFd5m0DuA/kjKq3GzvTrX
         FgPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o133si2917416ywd.403.2019.03.07.06.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:33:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1u5I-0008MO-9w
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:33:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tuW-0006wG-Bz
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tuQ-0001w0-IH
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tuE-0001hN-RD; Thu, 07 Mar 2019 09:21:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AE28C05CDDF;
	Thu,  7 Mar 2019 14:21:52 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0F365C545;
	Thu,  7 Mar 2019 14:21:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:46 +0100
Message-Id: <1551968334-18982-22-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 07 Mar 2019 14:21:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 21/29] hw/arm: Express dependencies of
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vabWYdr1TPFR

Add Kconfig dependencies for the DIGIC / canon-a1100 machine.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 2 +-
 hw/arm/Kconfig                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 290023c..53609ea 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -29,12 +29,12 @@ CONFIG_ASPEED_SOC=3Dy
 CONFIG_NETDUINO2=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
+CONFIG_DIGIC=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_IMX_FEC=3Dy
=20
-CONFIG_DIGIC=3Dy
 CONFIG_NRF51_SOC=3Dy
=20
 CONFIG_FSL_IMX6=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 87440db..ed42e60 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -31,6 +31,7 @@ config CUBIEBOARD
 config DIGIC
     bool
     select PTIMER
+    select PFLASH_CFI02
=20
 config EXYNOS4
     bool
--=20
1.8.3.1

