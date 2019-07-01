Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2608192wru;
        Mon, 1 Jul 2019 05:38:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFgeRCazVWu4sa7fwOn9R/209AfISO1C4Xknoeks6IsQnDpMxL5wccyrTion+ew4qZJeHe
X-Received: by 2002:a50:91ef:: with SMTP id h44mr28653433eda.276.1561984694838;
        Mon, 01 Jul 2019 05:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561984694; cv=none;
        d=google.com; s=arc-20160816;
        b=yfwzRJ5IBqa4g9fUuwPKc4x7dvwdBPsbPfK1C8/yadniZ7lykRJ0G7gE/kOb9pMXBA
         tRI29nbchPqgFvqYrkUXLaGIml7yUwDdOHeWZK/2adlLUquhEIlAeHZ31g/AcvdnxdY6
         y7p3/yjwHHGqEsSd9IKwV9OXUNSVyl9AVFCE6zb3wLFNs0eldmEktC9LeogPcc2iF9Me
         jo3my93xb0zj4D2FrglQT6a93mhbr1WP0Tz1SW3ATrnhYVBQwfotk+EAhju6QHdBoatD
         MYLTtf3t1ZoFb8g4d2LvGiY/AYmhPHvwtNHNa+TQRW5DuJrNz4DPuSED5X3qgVF2ye1+
         6d9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7KWo4jjz0geac+nfkhX1CIxwgL8MHyRTVe4jqPUz/VM=;
        b=nssdOEtrKjApL5qT0jJPKtH9Isr6ilEpA/L1f24Zn45E6+yuXKYLnYc/hzY4/kBYeW
         7w1NpJRQZY0TV/4DzbtkHAgzCfjWxT3hhnPBCkUdT5KqIPPi0uEoxlojFxtzYHxAMaYe
         bVt3ynjOjaitmi0bVaGTRYxhMp4wAiCZv2XM13e3yaWpoxbM5jqW4q0FkmkvMSiCz0qd
         0usTOKTii3cy9h2HI4GaMg9Jkv2Up3JcDaU78axsB+5+54Q3BAUmKR9w5PWazSCBlvSg
         NIMp4iEoTiRGlhaCFWQNLKECeSonsQltq6g0SQRjn7F81g0/EE8ARyF0LNWwOSP3brr1
         jtBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o47si8918734edc.347.2019.07.01.05.38.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 05:38:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhvZV-00029M-Sv
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 08:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57745)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hhvTQ-000684-OR
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:31:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hhvTO-00033n-Ly
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:31:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46576)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hhvTH-0002mE-0L; Mon, 01 Jul 2019 08:31:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AE386308427E;
 Mon,  1 Jul 2019 12:31:42 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EA2217CC0;
 Mon,  1 Jul 2019 12:31:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 14:31:06 +0200
Message-Id: <20190701123108.12493-5-philmd@redhat.com>
In-Reply-To: <20190701123108.12493-1-philmd@redhat.com>
References: <20190701123108.12493-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 01 Jul 2019 12:31:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/6] hw/arm/fsl-imx: Add the cpu as child of
 the SoC object
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j3OHwmdpMQQT

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/fsl-imx25.c | 4 +++-
 hw/arm/fsl-imx31.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 869ee89b15..a237e967e4 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -36,7 +36,9 @@ static void fsl_imx25_init(Object *obj)
     FslIMX25State *s =3D FSL_IMX25(obj);
     int i;
=20
-    object_initialize(&s->cpu, sizeof(s->cpu), "arm926-" TYPE_ARM_CPU);
+    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
+                            ARM_CPU_TYPE_NAME("arm926"),
+                            &error_abort, NULL);
=20
     sysbus_init_child_obj(obj, "avic", &s->avic, sizeof(s->avic),
                           TYPE_IMX_AVIC);
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 662fe78f1b..423d9ef076 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -33,7 +33,9 @@ static void fsl_imx31_init(Object *obj)
     FslIMX31State *s =3D FSL_IMX31(obj);
     int i;
=20
-    object_initialize(&s->cpu, sizeof(s->cpu), "arm1136-" TYPE_ARM_CPU);
+    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
+                            ARM_CPU_TYPE_NAME("arm1136"),
+                            &error_abort, NULL);
=20
     sysbus_init_child_obj(obj, "avic", &s->avic, sizeof(s->avic),
                           TYPE_IMX_AVIC);
--=20
2.20.1

