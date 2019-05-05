Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1446576wrh;
        Sun, 5 May 2019 07:17:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2hW2BkAKiC5XfbpMJIWk7XYV4hR2F6S3sqdve/TdurQCas5zbAmC2Okfqjhndqb+fyyl2
X-Received: by 2002:a1c:4602:: with SMTP id t2mr13025242wma.120.1557065851346;
        Sun, 05 May 2019 07:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065851; cv=none;
        d=google.com; s=arc-20160816;
        b=MBeRqShrrKRwaladHEwogXr7XzANTeorCa87IvefdqBaN5VJEQHhCPAIMrjUphS1EG
         0iq2ZLUqx7RsMOJF1uu01OfP935QETEvnyi/E2osstKDTs7sYEaFkRxuNDawY5BUJtr2
         x9Z0zbzik/SlWPEPxc3BJuCgG2q0xmsvHiV/WkdEPRBvodAmpV2Rdk8hlhNJCZtltnZA
         LjA+ieR9gIH1Vx3LQYkQinUDPA5B3DhlJYo7pCrUJ+CmG29RCfthnmYArHzux1lf2xGP
         +qjT3Y5A6TUGOSAFWNz53bJxMu8xDnpuuqwtqleNCLVRtl3DeCcjfAR/BvHWH1z+MOE6
         mu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qi2hFQ5VErwaCDJQh/B273InKKvU1XB5Eqa+OkmBg6Y=;
        b=uSTCYLJztjT99Ii0yTorFY6By2lwjawzKsEsKz120ALeUwOuN7YyNeJy1222A54fcj
         W03ns9U+p41IK2mwUvemiZHEQWJTx4aMcqWvYc/wtobqAcVtOlWfFcQRfrSaUQalByWx
         6EY5wzEgwVM9TD0Ir1G0FL4wYFLvJD+qPbapwR+uxYwsaglnypiJtDBlw0i31MTr6Ri8
         o1WD1SvYMbbeu8CaH3MXSKosmYadly17zbWTrGr+7W0Gk+MeEmNqTDrT3A+yV5C0SyXG
         hHsUKTNOB2F+1u038Dw06hQjE9XfnNz+HW+WkVGQTPJ0TKBaq8HCBM4ydGOnKtUkpujd
         e4ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o82si5046147wmo.86.2019.05.05.07.17.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHxK-0004qS-C9
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:17:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeP-0004ZI-Vg
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeN-0004zB-SI
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeN-0004yS-M0; Sun, 05 May 2019 09:57:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 052D12CD7E1;
	Sun,  5 May 2019 13:57:55 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3C0060C47;
	Sun,  5 May 2019 13:57:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:11 +0200
Message-Id: <20190505135714.11277-26-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sun, 05 May 2019 13:57:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 25/28] hw/arm: Express dependencies of the ZynqMP
 zcu102 machine with Kconfig
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oSXJQv4160+3

This cleans up most settings in default-configs/aarch64-softmmu.mak.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/aarch64-softmmu.mak |  4 ----
 hw/arm/Kconfig                      | 11 +++++++++++
 hw/display/Kconfig                  |  1 +
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch6=
4-softmmu.mak
index 313490fb38..49ff415ee4 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -3,9 +3,5 @@
 # We support all the 32 bit boards so need all their config
 include arm-softmmu.mak
=20
-CONFIG_AUX=3Dy
-CONFIG_DDC=3Dy
-CONFIG_DPCD=3Dy
-CONFIG_XLNX_ZYNQMP=3Dy
 CONFIG_XLNX_ZYNQMP_ARM=3Dy
 CONFIG_XLNX_VERSAL=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index da091ac217..eff61efab9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -279,6 +279,17 @@ config STM32F205_SOC
=20
 config XLNX_ZYNQMP_ARM
     bool
+    select AHCI
+    select ARM_GIC
+    select CADENCE
+    select DDC
+    select DPCD
+    select SDHCI
+    select SSI
+    select SSI_M25P80
+    select XILINX_AXI
+    select XILINX_SPIPS
+    select XLNX_ZYNQMP
=20
 config XLNX_VERSAL
     bool
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 0577e68c8e..bb95f8d6a4 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -108,6 +108,7 @@ config VIRTIO_VGA
=20
 config DPCD
     bool
+    select AUX
=20
 config ATI_VGA
     bool
--=20
2.21.0

