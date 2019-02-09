Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp291998wrq;
        Fri, 8 Feb 2019 22:40:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZaXa1QYshtIs4eV1g4g1eom/FxoKV6K14TgDI4M6F/QxutrQKNI1H+KXfcHXAJp/hkkUH5
X-Received: by 2002:a7b:c110:: with SMTP id w16mr1620078wmi.20.1549694414775;
        Fri, 08 Feb 2019 22:40:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694414; cv=none;
        d=google.com; s=arc-20160816;
        b=cWtu9Kwo0Dxbk3SXgxX/nHRhe0sGdnetNUiJtak5l7JOkpPi2uR71+Q/oiMeslE9An
         tRbOPENKgsbJNkntPC60IOhIZbQrEgBGqx3/t6HapxojHmOE21yiZZCV6ht1EBTpBZF+
         SnH8KEUlaeYHGI/1c1/7YEFsG97oI6/mfUKD9JUEpLjTzdWMMki+PHsTr7RIOQc2qF02
         DJ/J7ZNAgUtiwopRxD6981DXiDpZUFZr8m6X3CEeOpWPWfuB+raZ0uXmuO/PJXnS/H9h
         U/xdptxwq68H8knlS2n1MFYVBEXAKOjhWj7CZ+ugp8bNoBU1oT9Cd9S4Ao/va7G0Yzl+
         F/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=QOmFqIAlMv6mlPTfIvK+CLIMqbns2IqOWln6c5BS4zo=;
        b=sLC9EYT4c49IECki/J0uekejsQldcZKJBR4v6HgEXw+HzzBwvVBhbmdM+fbmGGpsL2
         vGYjNRGyOOCN/+bQaGjDwNDLI4vPa51b+S5CV4JqFWs39+2VR9VJ9vWJjAzYQxNPZO72
         xw/tSHOkCtgIaBAkYlqDe2f33fKsYgrZfWWKz98L6ITsidjQD53wldpNd0gTwDFx70bq
         ilYLKHyv8pIOHHg40vf3iWU5wS8XPGgC4cmmURSiiQ/HR9C4D0nHZsVMwt0ZeBYm31wm
         Om+0yMy1Vii0KI2tOO3iaiX6B4EMx1H1GZtksSASj8TjmpG6EGSW1c3SUlKh9D5Ob5xw
         8AZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si2811953wrv.375.2019.02.08.22.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:40:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMJB-0003XX-Pk
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:40:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIv-0003W6-AQ
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIs-0003Ng-IX
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:12239)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMIs-0003DT-AC; Sat, 09 Feb 2019 01:39:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B9B285A03;
	Sat,  9 Feb 2019 06:39:37 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2241B62662;
	Sat,  9 Feb 2019 06:39:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:03 +0100
Message-Id: <1549694366-1284-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sat, 09 Feb 2019 06:39:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 02/25] hw/arm: Express dependencies of the
 highbank machines with Kconfig
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
X-TUID: HXzrtK+Zw7IP

Add Kconfig dependencies for the highbank machine (and the midway
machine).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  4 +---
 hw/arm/Kconfig                  | 12 ++++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 3baafc4..59734ee 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -6,6 +6,7 @@ CONFIG_ARM_V7M=3Dy
 CONFIG_PCI_DEVICES=3Dy
=20
 CONFIG_EXYNOS4=3Dy
+CONFIG_HIGHBANK=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -54,14 +55,12 @@ CONFIG_PL022=3Dy
 CONFIG_PL031=3Dy
 CONFIG_PL041=3Dy
 CONFIG_PL050=3Dy
-CONFIG_PL061=3Dy
 CONFIG_PL080=3Dy
 CONFIG_PL110=3Dy
 CONFIG_PL181=3Dy
 CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
-CONFIG_XGMAC=3Dy
 CONFIG_PXA2XX=3Dy
 CONFIG_BITBANG_I2C=3Dy
 CONFIG_FRAMEBUFFER=3Dy
@@ -151,7 +150,6 @@ CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
-CONFIG_HIGHBANK=3Dy
 CONFIG_MUSICPAL=3Dy
=20
 # for realview and versatilepb
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2850000..984de8a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -18,6 +18,18 @@ config EXYNOS4
=20
 config HIGHBANK
     bool
+    select A9MPCORE
+    select A15MPCORE
+    select AHCI
+    select ARM_TIMER # sp804
+    select ARM_V7M
+    select PCI
+    select PL011 # UART
+    select PL022 # Serial port
+    select PL031 # RTC
+    select PL061 # GPIO
+    select PL310 # cache controller
+    select XGMAC # ethernet
=20
 config INTEGRATOR
     bool
--=20
1.8.3.1

