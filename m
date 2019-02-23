Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7783754wrx;
        Fri, 22 Feb 2019 23:54:22 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZhOEiUMj9uIoajVE+e1qT94HoDWFvW4ELai7kIpqBjDB85Hw7ZpTis49fGpzmbsBeLyLK2
X-Received: by 2002:a0d:cb15:: with SMTP id n21mr6098200ywd.209.1550908462852;
        Fri, 22 Feb 2019 23:54:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908462; cv=none;
        d=google.com; s=arc-20160816;
        b=jrBicneVgOxCEY1DFshub5ns5FYstymuU3/qFhH6okvIajGaUZT81OfLTdivirIH+w
         BrQRZ9SPbf3C6mp9lzDU9E+Er7sSLMHiJJWitznO0b0UFfgxm8Vpg9jHqSbGB/o5oCL2
         i2/+VTtKh3IUl025O8qLyXA4q5V+6v6l8zYO+MLkcQyi7jO3LtnA++Jjxf9boHc67N2O
         61yt0UAIhQ8i/i4EXQ6AUoJQqUsfOnLDUcU2sesWmE3W45gvxFOeF4HQVsGFCqZME3GG
         NgPQSGJTHUQqkrYQS3eNjpvlfv0VSL27BhgsomyZnSGWgd1PAY3L1F2ZB+d8KAeWbUCv
         hecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=uS/2llQIOaBLcztg+NjI3oQ9OqMm8PLUyKbUrGjM8w4=;
        b=tDexOJXqmGTB50P3qc+wSFHHPqLrq3WLhsaP6Dc+lgOGCjo5jANV69xrBwk2mwIglU
         rAz23+iIN+msg0JD9qsP4nVSscKwMultAi+VK6TelO/UaphiP9YGolFs51rLTbNG0+l1
         sdBl/HIJM3ZtiYCgm7GpCmkflF00ST5Hod3ss0MKu9K4wGDyIGV5oW4aZbJtWnN7Ma7D
         j/jfRmpK42NOgfmSe8lCi8Oi3l35gVwcANIFxz4s6Sk1p07IkvmPLAM+iIxrGgz4myR8
         XxMkJ8QVo3WZhvhXv6eYeSKE64m8SUk4WqJNcv5gzjTvqPkvi2sKesrRo9dcByP/TBcO
         LTYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d134si2000543ybh.367.2019.02.22.23.54.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:54:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxS8c-0007d5-8T
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:54:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4B-0004Wx-O4
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:49:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4A-0001vS-RR
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:49:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50856)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS48-0001oo-98; Sat, 23 Feb 2019 02:49:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89EF581105;
	Sat, 23 Feb 2019 07:49:39 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F0E55D9CA;
	Sat, 23 Feb 2019 07:49:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:48:58 +0100
Message-Id: <1550908162-22644-7-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 23 Feb 2019 07:49:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 06/30] hw/arm: Express dependencies of the
 highbank machines with Kconfig
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l/sRzcS5HdC9

Add Kconfig dependencies for the highbank machine (and the midway
machine).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  9 +--------
 hw/arm/Kconfig                  | 12 ++++++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 67fc8df..c91f526 100644
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
@@ -43,24 +44,17 @@ CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
 CONFIG_ARM11MPCORE=3Dy
-CONFIG_A15MPCORE=3Dy
=20
 CONFIG_NETDUINO2=3Dy
=20
-CONFIG_ARM_TIMER=3Dy
-CONFIG_PL011=3Dy
-CONFIG_PL022=3Dy
-CONFIG_PL031=3Dy
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
@@ -150,7 +144,6 @@ CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
-CONFIG_HIGHBANK=3Dy
 CONFIG_MUSICPAL=3Dy
=20
 # for realview and versatilepb
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9d86b16..aea7301 100644
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

