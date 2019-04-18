Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp934374wrx;
        Thu, 18 Apr 2019 11:14:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1IEU568zF1QkF2IAIUe8w+dH5wDsEwKanNJF4LNRoF+zY3uKppmt1kuH6bfzNQuN62vDX
X-Received: by 2002:adf:fc51:: with SMTP id e17mr5933169wrs.243.1555611297821;
        Thu, 18 Apr 2019 11:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555611297; cv=none;
        d=google.com; s=arc-20160816;
        b=0+n9KEHWO85jXmi7lkvm3x+yJJc/KdGWbVthpEl1Bhuahv57vc4RXwVpMJ2RG99VPg
         mvyQB1YwUWRAEZTpmK0Qy/Wm38Wjxx4hDTCCGaGBGik4Q00Gn/5xMztkSurrybkdV0B8
         KdwflS8JMcPHz2IsgbM5KNsac8KQzFRDMKHQPXsCjV4z3Qj0+TjbI5SarfK/b+E8gfu6
         fTTrbk+siJ+8EK/kgm6vTLnhQNG/8qLBGE+sQKB19Q/iPNa19R80gIQcvfrjkEU6deDn
         gNTyprLpWn/CgiZngxVlqW21hGYIsMhLGQJezG56MFMF0Kaj0rXbSljPd5ULBvU4zVk1
         y4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5ApIW91UKUxHp67NT7IqFQMuHKfSZXONgRte4mf1X60=;
        b=HgXnmDfNa13LSDgKhH8sebp3DGy1LBgK/h2hRjrL08Pglnq4MXunczgQdXtEG7pu+J
         /Ze/6EOroNfbGTGeD7SYUu24a2CFV6LRIa/g0IAjaHYd6bSvlaclxw8vb4x97CYhTe+7
         GPE+33lj6AMgXokZUvCxwrk/Tdj9ejRjD97FtgxbrKEjPGYZykLq4h5ntiIcvAtl0Q/L
         cTWLJxoukMjiIikKb6YeFZl/REuFSqDnHbvMaUI0OLXp96kBoCl9QTcMHQKmDVYZAnfa
         Y9emAhk/QaaUB3k72Q5lDMlKJky7wVEiHtEXdbzPAb9SUcrDda4a7qJrorjl1BAb+k0p
         tXPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si2194831wrn.134.2019.04.18.11.14.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:14:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45230 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBYm-00052W-PI
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:14:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBOV-0004i0-AY
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:04:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBOS-0002vr-Tz
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:04:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37542)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBOQ-0002sa-Qo; Thu, 18 Apr 2019 14:04:14 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7C593D945;
	Thu, 18 Apr 2019 18:04:11 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD68A1001E66;
	Thu, 18 Apr 2019 18:03:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:48 +0200
Message-Id: <20190418180057.3593-21-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 18 Apr 2019 18:04:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-QEMU-4.1 v5 20/29] hw/arm: Express
 dependencies of the raspi machines with Kconfig
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
X-TUID: 3V3SXsrVP3ZZ

Most of the code is directly controlled by the CONFIG_RASPI switch,
so not much to add here additionally.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 4 +---
 hw/arm/Kconfig                  | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 31d31d3f4a..22bff20b32 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -31,15 +31,13 @@ CONFIG_COLLIE=3Dy
 CONFIG_ASPEED_SOC=3Dy
 CONFIG_NETDUINO2=3Dy
 CONFIG_MPS2=3Dy
+CONFIG_RASPI=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_IMX_FEC=3Dy
=20
-CONFIG_FRAMEBUFFER=3Dy
-
 CONFIG_DIGIC=3Dy
-CONFIG_RASPI=3Dy
 CONFIG_NRF51_SOC=3Dy
=20
 CONFIG_FSL_IMX6=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 466b143fdf..e68a29ca2b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -257,6 +257,9 @@ config ALLWINNER_A10
=20
 config RASPI
     bool
+    select FRAMEBUFFER
+    select PL011 # UART
+    select SDHCI
=20
 config STM32F205_SOC
     bool
--=20
2.21.0

