Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp930773wrx;
        Thu, 18 Apr 2019 11:11:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKEKqD8KHoB+y0xyc1UX/C+BBqLcFZo6AaES75icrAQ7Y9HrfqpB9J6ycPOKajQLgPTliC
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr8857963wrn.108.1555611083563;
        Thu, 18 Apr 2019 11:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555611083; cv=none;
        d=google.com; s=arc-20160816;
        b=BVU4CPXLwEHNwJcWu9NdA2wHfE5b03bNqdgo6oMvrDIcdJV+0wIH4YjhtteWGKfOCW
         1vq8HFoJOJ+zQ7Ehy5WYwCNvJcwjhnNa9AoEXsxXDePU12sM7bhXIjsB22ohAoWhXe82
         YXa+eYRK9eI0aMyBHjeGk7oQDiQa1TlrtYISgAIkLYQC11IaAe8lKRlDFnULZMT5Ee5q
         TYWZyS6vzljLVXESFaua9Xll+SNv034U+ifSWbNqzBLT96Y2Fp1Aa4pgYLoIPA+tdAfj
         XTTh4GqGceIoFYOwNXrmUuP3iwqcUbim+nCOboTA336T7JW7t6y386yVcUdLOgyjZXhv
         8NVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5IyWgTw1JPnU7rkPneAC55smRyYRpNzwEJUpmgNPUY0=;
        b=Gy40nDoMmPd5gqYj+WtfKgO63GWcAvBlNhLU0fIBnZq/2xCbRbvkFXJz1vIxUP5g0v
         VmfJ4JeZjV8uH4FWfRqL41cIYjL8vebbo1+4TxbXc9CrNkXHL/Khd+Rmi2XH+JjR3BVi
         mNATZdf83eCa2XcPW9SMzWxZWYg2xybxhN/TYtbCASZpt9SWank3Xv7weYgwEtX8hbqs
         cbTFyYkMbJAj2A5cf+2fJE1FEgQ64C67CkWsPZLcjbFpqIzat4iQ8J+mSBVxnhN1+Xq3
         4JlxRY6N7+bEQpTSCsWtYMeZrlYhBeO1qwDrbG6vhQzY9wnTDdv2pJUCOOcX+qr3cIUP
         Xmwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11si2332831wru.108.2019.04.18.11.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBVK-0001vA-J6
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:11:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBOD-0004R2-0N
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:04:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBO7-0002hl-3f
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:03:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49942)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBO3-0002gF-KM; Thu, 18 Apr 2019 14:03:52 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AA6E300250C;
	Thu, 18 Apr 2019 18:03:50 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8BA0C1001F52;
	Thu, 18 Apr 2019 18:03:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:46 +0200
Message-Id: <20190418180057.3593-19-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 18 Apr 2019 18:03:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-QEMU-4.1 v5 18/29] hw/arm: Express
 dependencies of allwinner / cubieboard with Kconfig
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
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zzPAh+51ZB/z

Add dependencies for the Cubitech Cubieboard.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 6 +-----
 hw/arm/Kconfig                  | 9 +++++++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index c86a9f5427..a0b9016e3a 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -7,6 +7,7 @@ CONFIG_ARM_V7M=3Dy
 # CONFIG_TEST_DEVICES=3Dn
=20
 CONFIG_ARM_VIRT=3Dy
+CONFIG_CUBIEBOARD=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
@@ -32,7 +33,6 @@ CONFIG_NETDUINO2=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
-CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
=20
 CONFIG_FRAMEBUFFER=3Dy
@@ -60,10 +60,6 @@ CONFIG_IOTKIT_SYSINFO=3Dy
 CONFIG_ARMSSE_CPUID=3Dy
 CONFIG_ARMSSE_MHU=3Dy
=20
-CONFIG_ALLWINNER_A10_PIT=3Dy
-CONFIG_ALLWINNER_A10_PIC=3Dy
-CONFIG_ALLWINNER_A10=3Dy
-
 CONFIG_FSL_IMX6=3Dy
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 49306d6419..2ef5696900 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -25,6 +25,10 @@ config CHEETAH
     select OMAP
     select TSC210X
=20
+config CUBIEBOARD
+    bool
+    select ALLWINNER_A10
+
 config DIGIC
     bool
     select PTIMER
@@ -245,6 +249,11 @@ config ARM_V7M
=20
 config ALLWINNER_A10
     bool
+    select AHCI
+    select ALLWINNER_A10_PIT
+    select ALLWINNER_A10_PIC
+    select ALLWINNER_EMAC
+    select SERIAL
=20
 config RASPI
     bool
--=20
2.21.0

