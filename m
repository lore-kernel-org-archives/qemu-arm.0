Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp660528wrs;
        Fri, 23 Aug 2019 07:38:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6IXoagUwhtfSLJlTqkN/Lu5zNrBll2xkq8flWLiIazP7eXSpvwYsXkccB2Zwr0JbgzKx3
X-Received: by 2002:a0c:8a76:: with SMTP id 51mr4160378qvu.210.1566571127563;
        Fri, 23 Aug 2019 07:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566571127; cv=none;
        d=google.com; s=arc-20160816;
        b=Hs0ctxD1I6BIZWZ/4w5Yw58dOWa5oSICHrHB5lpGI+tBRX0gAbWZ98tvRF1enWf5D2
         ASwSMjc0i3rc6AGuw1NiEI9L5xRaUBDJoBNEu3r6qNDQD9A7pdZ/74GNVydaT4w3RtbP
         85URhcYjsgvKvLHkX9z/+Mz0Q5W3vbKkP9T9dirmzXWPdg4d6xbuQC9iwwN6EAYiAg7Z
         l/TiZbJOqbtLawkfJ62msTBtDl1khq32qiILnb7v7AKGNNQTn5Dl2i5xNuas8JJTG+np
         Gpx59GKOF9Ii3O2hW6GDSI8M54g6d1OHu91ljlR+9+/P9r6BNbLYNNuCaip03wPEGdSc
         muug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ISmXKEKBlKL/Xf7rsaz/pj1tD+4DIvh/8870H17YilU=;
        b=n3Wmss5OkoqGjpbm6utt32D5uKn5VOJ4Sj/J3PIxlrcokoggREUCyRDceGal6dy/oi
         y9v2xD/7O2l/6pBeF6V30N72ydEJXmFhIk1L2VROoUzqalFFzjc7wIbEm0atXJoFrPfQ
         TsZMXnOyGuVeVTZjo2j4m4XyiSsAzpf/qEJpGVEZVJHqUuuVcLWBjZCgd7vpbObG9I6z
         mswtwBfZHbhS6x6ycjE08lBS3LurlHAz88MJFqtnKugWbxyj9kZIEAJrleheSwoir6pG
         Tf3UIWoaC09YsFTswSPLfgT2FJL5XxUvvyo1k3soK+cz8TY/SsFshOAlXy9L6wY6N55Q
         hgAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si2052054qvc.67.2019.08.23.07.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 07:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1AiE-0004rT-Kv
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 10:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50401)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1AdH-0000O4-Tv
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:33:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1AdG-0001q1-UJ
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:33:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53524)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1AdG-0001pk-PF; Fri, 23 Aug 2019 10:33:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 17CB7307D915;
 Fri, 23 Aug 2019 14:33:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E549B5D9CA;
 Fri, 23 Aug 2019 14:33:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 16:32:47 +0200
Message-Id: <20190823143249.8096-5-philmd@redhat.com>
In-Reply-To: <20190823143249.8096-1-philmd@redhat.com>
References: <20190823143249.8096-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 23 Aug 2019 14:33:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 4/6] hw/arm/fsl-imx: Add the cpu as child of
 the SoC object
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h39Z1kTudEhv

Child properties form the composition tree. All objects need to be
a child of another object. Objects can only be a child of one object.

Respect this with the i.MX SoC, to get a cleaner composition tree.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: reworded commit description with Markus suggestions
---
 hw/arm/fsl-imx25.c | 4 +++-
 hw/arm/fsl-imx31.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 2b2fdb203a..3cb5a8fdfd 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -36,7 +36,9 @@ static void fsl_imx25_init(Object *obj)
     FslIMX25State *s =3D FSL_IMX25(obj);
     int i;
=20
-    object_initialize(&s->cpu, sizeof(s->cpu), ARM_CPU_TYPE_NAME("arm926=
"));
+    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
+                            ARM_CPU_TYPE_NAME("arm926"),
+                            &error_abort, NULL);
=20
     sysbus_init_child_obj(obj, "avic", &s->avic, sizeof(s->avic),
                           TYPE_IMX_AVIC);
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 6760de3c8c..55e90d104b 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -33,7 +33,9 @@ static void fsl_imx31_init(Object *obj)
     FslIMX31State *s =3D FSL_IMX31(obj);
     int i;
=20
-    object_initialize(&s->cpu, sizeof(s->cpu), ARM_CPU_TYPE_NAME("arm113=
6"));
+    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
+                            ARM_CPU_TYPE_NAME("arm1136"),
+                            &error_abort, NULL);
=20
     sysbus_init_child_obj(obj, "avic", &s->avic, sizeof(s->avic),
                           TYPE_IMX_AVIC);
--=20
2.20.1

