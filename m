Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp901396wrp;
        Wed, 25 Sep 2019 07:58:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyc2lhoQt2iLQn6tC30gdVDFIhqQOLwqwDRrHBIqPy8sKoTsfhglJ3TkMA6uNTj8eyylLPj
X-Received: by 2002:ac8:1767:: with SMTP id u36mr9195899qtk.152.1569423499072;
        Wed, 25 Sep 2019 07:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569423499; cv=none;
        d=google.com; s=arc-20160816;
        b=a9SfmQLgzAbovnecwGAdAgEllkIe3lRvFkqoZHzsxNOFi3E70lugKK0kqyMJEuh27i
         JtdnseYyyDZUt1zcIPuCZCcld7RgpgS1lHx2wT0nEN7TVQD0oQSiKr3RM7FdU75F+Jqa
         6oJO+njZhbFqkdSrJ7ZBRT4ZpeY9hQ2pNkgVHB4Yqc7Di7J5WjTs25P9hqaFJepBeSMr
         CMw9KcfpwKrCYTWvnW63yMUcPsTMAD8qsIYjZJlaXjhca8vH70E80VFw5X+69JESiM7m
         SmH06wd6r18UlHNuCUj2zMO6sjwr7KyN8KOpnLc372G7ykJ59E40glKC6eTw4cB3eFKr
         YgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4OcogPGSIZ4gZoNq55Tte3SSLY3tr6CBRPSfvgR2kPU=;
        b=xVj47td1ACuYPUgowZFDJULUdFrjooBym2npy1PTM+JpqvrCivixNQE/8pyWQXgs9Z
         RnKPDdkbQic75arATkWwXkyt30sAeaN5jyiQO/RfVvaeWCnAbBdIREfjCUiuoIkYh4Lp
         nPPoDypGI/NERmsXfpPzusXOld4o3OZhGLSPwQduFmYUa5Puhs+JkzhmgJgY4klj5ecZ
         t+WCz69hDct0X8m3PjqY+pPC38yMuKXG/+0I24I75Gi4qMEjzmpSdPyU802FMeFoW3Xc
         qCgnJ9lsp+4yomTQktOUV7DjXtirU2ge8bhau2LJas/f6ELHEsrnCwizZXBl/XbdLr4D
         F4xA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20si4098939qtc.33.2019.09.25.07.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8kD-0005WX-5O
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8OO-0005et-5c
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:35:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8OM-0001tS-UB
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:35:44 -0400
Received: from 10.mo179.mail-out.ovh.net ([46.105.79.46]:42928)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8OM-0001sr-Nz
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:35:42 -0400
Received: from player786.ha.ovh.net (unknown [10.108.42.88])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6737914326E
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 16:35:40 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id D5334A4D4480;
 Wed, 25 Sep 2019 14:35:33 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 23/23] aspeed/soc: Add ASPEED Video stub
Date: Wed, 25 Sep 2019 16:32:48 +0200
Message-Id: <20190925143248.10000-24-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8879972568535632657
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.79.46
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1rD5Tu//Jjyi

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast2600.c     | 5 +++++
 hw/arm/aspeed_soc.c         | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 43478f617879..cccb684a19bb 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -96,6 +96,7 @@ enum {
     ASPEED_SDMC,
     ASPEED_SCU,
     ASPEED_ADC,
+    ASPEED_VIDEO,
     ASPEED_SRAM,
     ASPEED_SDHCI,
     ASPEED_GPIO,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index af047463a355..931887ac681f 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -44,6 +44,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_SCU]       =3D 0x1E6E2000,
     [ASPEED_XDMA]      =3D 0x1E6E7000,
     [ASPEED_ADC]       =3D 0x1E6E9000,
+    [ASPEED_VIDEO]     =3D 0x1E700000,
     [ASPEED_SDHCI]     =3D 0x1E740000,
     [ASPEED_GPIO]      =3D 0x1E780000,
     [ASPEED_GPIO_1_8V] =3D 0x1E780800,
@@ -236,6 +237,10 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
     create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_IOMEM=
],
                                 ASPEED_SOC_IOMEM_SIZE);
=20
+    /* Video engine stub */
+    create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_VIDEO]=
,
+                                0x1000);
+
     if (s->num_cpus > sc->num_cpus) {
         warn_report("%s: invalid number of CPUs %d, using default %d",
                     sc->name, s->num_cpus, sc->num_cpus);
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 6defb143acde..f4fe243458fd 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -34,6 +34,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] =3D {
     [ASPEED_SDMC]   =3D 0x1E6E0000,
     [ASPEED_SCU]    =3D 0x1E6E2000,
     [ASPEED_XDMA]   =3D 0x1E6E7000,
+    [ASPEED_VIDEO]  =3D 0x1E700000,
     [ASPEED_ADC]    =3D 0x1E6E9000,
     [ASPEED_SRAM]   =3D 0x1E720000,
     [ASPEED_SDHCI]  =3D 0x1E740000,
@@ -63,6 +64,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] =3D {
     [ASPEED_SCU]    =3D 0x1E6E2000,
     [ASPEED_XDMA]   =3D 0x1E6E7000,
     [ASPEED_ADC]    =3D 0x1E6E9000,
+    [ASPEED_VIDEO]  =3D 0x1E700000,
     [ASPEED_SRAM]   =3D 0x1E720000,
     [ASPEED_SDHCI]  =3D 0x1E740000,
     [ASPEED_GPIO]   =3D 0x1E780000,
@@ -231,6 +233,10 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_IOMEM=
],
                                 ASPEED_SOC_IOMEM_SIZE);
=20
+    /* Video engine stub */
+    create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_VIDEO]=
,
+                                0x1000);
+
     if (s->num_cpus > sc->num_cpus) {
         warn_report("%s: invalid number of CPUs %d, using default %d",
                     sc->name, s->num_cpus, sc->num_cpus);
--=20
2.21.0

