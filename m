Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp297857wrq;
        Fri, 8 Feb 2019 22:50:36 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbpmfVjZU21dl28UtbaEUnlxFlaXApNEqNzFZOuu77FbJ4awJDFHdBkViGblHFq0usEglPK
X-Received: by 2002:a5d:430f:: with SMTP id h15mr2558265wrq.202.1549695036944;
        Fri, 08 Feb 2019 22:50:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549695036; cv=none;
        d=google.com; s=arc-20160816;
        b=jFTSnu4nlsBkmZzSqK3vFqkql0MOQN3BrpPsrXdYOPVM1mOdo4BOuE1+ryB4iuewE9
         x/CXMgwB4e8cyJfYMdZSipvb+Hn5KYsVK8FZ0Of51BmyNMH4xXlLldQIzIOSdyOeMJWY
         RcZsZ1INi4R3kb2jyt7gcRN2/TYtdJm7l6otbfZCWMRBaV57evhbYIiqwvEyNsNLp2jv
         /b034dmSz4969n5+qTJ/oWnsGdAbXcQip6Fs/2tAbamsmtJvmjUvKUVhtHLYmX8yZUNG
         S+M+E5eNqNq1Krc3sFUFvfuOHwunMQ12mZtdN58AYiGhDNXaUaYqiWvtZlT9N+Sk74wz
         TB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=A/2OVV/yhvYAXYHsevQHyNB/4tcqq3V5xsg8otNWjqM=;
        b=E2z5oTvtk8dWB6i4Py3AP2TXnvE0LTNaFJ61LQw/gOf2Mf0Fr3l86NgzN15End0gFF
         0gPxnCCx50xsRA1hkc2VY6iR1UqJ/mkSBzMRh3sQ1r1cO9jud7i7fkLELgoZmgb5bP41
         83VvpOXW4b3+04LeAiwjR2tdaJ0pCRtwQQUkD3qa807tF+DwcETropId3Zf8nKrbzWjW
         bDrw8xHuhr+sMRGA7BTvrTo6oob1CMsKpRIpbgvN7VklSEwAd59q3ZbAUi6mCViZali7
         vhfdS69dv1T50SuVRWnw389L9vQA/NNXAQqhBuotY0sUhTNboODY5WuvdN21HIc0OJEZ
         OnIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si3267298wrc.422.2019.02.08.22.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:50:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMTD-0003lg-Uf
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:50:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJ4-0003hn-Rq
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJ4-0003de-5P
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJ3-0003cs-WB; Sat, 09 Feb 2019 01:40:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 486225947C;
	Sat,  9 Feb 2019 06:40:05 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 572D817153;
	Sat,  9 Feb 2019 06:40:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:16 +0100
Message-Id: <1549694366-1284-16-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Sat, 09 Feb 2019 06:40:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 15/25] hw/arm: Express dependencies of allwinner
 / cubieboard with Kconfig
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
X-TUID: dU4KSzbWi/rk

Add dependencies for the Cubitech Cubieboard.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  6 +-----
 hw/arm/Kconfig                  | 10 ++++++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 3279fb5..28bb37f 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -4,6 +4,7 @@
 CONFIG_ARM_V7M=y
 
 CONFIG_ARM_VIRT=y
+CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
 CONFIG_HIGHBANK=y
 CONFIG_INTEGRATOR=y
@@ -28,7 +29,6 @@ CONFIG_NETDUINO2=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
-CONFIG_ALLWINNER_EMAC=y
 CONFIG_IMX_FEC=y
 
 CONFIG_FRAMEBUFFER=y
@@ -55,10 +55,6 @@ CONFIG_IOTKIT_SYSCTL=y
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
index 5d7dafb..3621d44 100644
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
@@ -257,6 +261,12 @@ config EXYNOS4
 
 config ALLWINNER_A10
     bool
+    select AHCI
+    select PCI          # TODO: Currently required for AHCI, remove this later
+    select ALLWINNER_A10_PIT
+    select ALLWINNER_A10_PIC
+    select ALLWINNER_EMAC
+    select SERIAL
 
 config RASPI
     bool
-- 
1.8.3.1

