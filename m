Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4417842wrh;
        Tue, 30 Apr 2019 00:39:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyvVc9x6XHj6/S5zaczZ7a+MHp+zKhJGb/K/fP87dZjRKlA7T39RZ7nFv2hrf9f5E0Mv70p
X-Received: by 2002:a5d:45cc:: with SMTP id b12mr4558075wrs.142.1556609986809;
        Tue, 30 Apr 2019 00:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556609986; cv=none;
        d=google.com; s=arc-20160816;
        b=TRAB8mq8SXQdyj6RZ0OxOA/VO6b1w7GTfZsfZQS7fODzCwjazUnIUZSfIm6NjIsqx8
         uc/iW0miTXSFkbIFC1foRK976OCf8lHjhGypDcPF0Jf90aPBAsNy/Wx6GYu2uTkBKyl6
         FLvTXYYFYbiIff12uCi1DMYfF51mrTzmQ8JktnebUU0t0YI8UinYsXzK83JdL4UNLnIm
         RZw8TDk3BrKBlDNXEwcvxwT08HOprP9QWwWCAeaJs44jgCoJvfnfIa+Nj1sPu1GDPeVH
         ot1QhZaBJRA+V3UWAtpdJV7JN6eoI9jiRWXDDQtVZ+dyGAFoo/5KbjQuGX9tvUShi/dD
         XAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qi2hFQ5VErwaCDJQh/B273InKKvU1XB5Eqa+OkmBg6Y=;
        b=ATaS1zLxf/0TpZNvus0Vz1hQTa6NSQ2NhmozkOhwiEyyOy3CzwwJU8gjtye70CNPr1
         BzpHtQcTjVybv1y9YzGa7jNYgBGzJOy0AxlpLpTycC63qnFM6VlKBDlSmHBXuuSFdRJQ
         vBVQV/N9EV80nOM+NZD/lpyeOV/m9J19a/QZXw9AfJHrzBgNqEp4k38gnJYJNhTnFcQi
         L8uLmfkSkZE317nxC8m1X5+hshpwfJ3h1PjDHo5PxFIuTYMeGS/GaOLnlUmvbKir0wTx
         9Qxje9v2FwmjVVJJ9/zWXJnjA0KBUcc/LdeJZRlGIlrslccKoCTV6x4l1CdiNRIhMdjl
         SxSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16si16785502wrr.110.2019.04.30.00.39.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:39:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLNMf-00029W-Rh
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:39:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN2q-0001E7-5R
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:19:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN2p-00060I-8z
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:19:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48546)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN2p-0005zx-3F; Tue, 30 Apr 2019 03:19:15 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E997821F3;
	Tue, 30 Apr 2019 07:19:14 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CA451001DD2;
	Tue, 30 Apr 2019 07:19:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:14:02 +0200
Message-Id: <20190430071405.16714-28-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 30 Apr 2019 07:19:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 27/30] hw/arm: Express dependencies of the
 ZynqMP zcu102 machine with Kconfig
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Cedric Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Jeffery <andrew@aj.id.au>, Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Dm5ueyJbOdx

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

