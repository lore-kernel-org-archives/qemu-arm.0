Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6336320lfp;
        Tue, 4 Feb 2020 23:10:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqxb66fx0Xw7hhDrsg0ApBFCxZ83/LHu0ILSv6LD6JmfJISbk4QBmbO6nUZ/HC2aEEzc/PSz
X-Received: by 2002:aed:24b2:: with SMTP id t47mr31824908qtc.337.1580886658048;
        Tue, 04 Feb 2020 23:10:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580886658; cv=none;
        d=google.com; s=arc-20160816;
        b=xFZH9jBaK4bYzQGFK4IBwczQ5cHWF6ItBgpZy13QzW5GAOOkoKsZKBwFV2RCGcoLZe
         GhJUMnJgyMo0JLEYyHsNsfFy6qSTYe7J1WKUvrdceBamrgu75wMlsSlG5E7n8H/9xyMW
         +7Z7iOqjS2l14vzDu5bt5FsUb5Fh6EZ9FtMopZ3cPsTvUy4qxk+djow9WF8VjXk3upYU
         4SOIs2Ky4R1oxekWfs+VliAsR3Y15epFI93tboeNc/zNxf/QAGwPR2QAadvgxkX/X+gs
         o3amDwzSNPZxURJQhYdB247FSuTEMWwNhRcg1UZh1J8Yd4ISA5Z2sY779srpC+JqZbQr
         ObMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=saxK5JxEUNImATLoVBaEiraCmg83AzANvhEB4IrimzU=;
        b=QwDf4ACdg7R8sG7KM94ORAMU/demFY7y4XweDaseazQjDBhAMrnXdY+M12oeYduYpO
         3niyZ/jEFMVZKGS3yP9b4Ccop55cc/aH40ykLKt1eCk6D/AJrwfEW2BFdKWZ45BaQtre
         naxlqqFZghbcjo4QW2PKCTc7F4xQKUKd61Dh/JQ2rcAo4JpbFVfkqB0yF58fIDZIeOsT
         L17Il49PGGNCv0R9qkkhznqZVvKuj87OFPoNhsFW+Wf5UsEKZiwUiCC4wdSGO+J1IWiM
         3dGill5BsPOEaQIIDs/rmpTpUpIJqMv/MC//SpEftcUuUlEe7N33g6q+ZxosYjxAyWNz
         BvyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p26si14599235qtn.17.2020.02.04.23.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 23:10:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izEpt-0003HQ-G7
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 02:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48374)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1izEnC-0001Dl-3C
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 02:08:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1izEnA-0000CG-0F
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 02:08:10 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:58666 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1izEn6-0007jP-7w; Wed, 05 Feb 2020 02:08:07 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 375FF86DF44D2F0DC405;
 Wed,  5 Feb 2020 15:07:53 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 5 Feb 2020 15:07:45 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH 3/3] stellaris: delay timer_new to avoid memleaks
Date: Wed, 5 Feb 2020 15:06:59 +0800
Message-ID: <20200205070659.22488-4-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200205070659.22488-1-pannengyuan@huawei.com>
References: <20200205070659.22488-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Euler Robot <euler.robot@huawei.com>, Pan Nengyuan <pannengyuan@huawei.com>,
 zhang.zhanghailiang@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rD2HKYYo1c6b

From: Pan Nengyuan <pannengyuan@huawei.com>

There is a memory leak when we call 'device_list_properties' with typenam=
e =3D stellaris-gptm. It's easy to reproduce as follow:

  virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-prope=
rties", "arguments": {"typename": "stellaris-gptm"}}'

This patch delay timer_new in realize to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Cc: qemu-arm@nongnu.org
---
 hw/arm/stellaris.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index bb025e0bd0..221a78674e 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -347,11 +347,15 @@ static void stellaris_gptm_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
=20
     s->opaque[0] =3D s->opaque[1] =3D s;
+}
+
+static void stellaris_gptm_realize(DeviceState *dev, Error **errp)
+{
+    gptm_state *s =3D STELLARIS_GPTM(dev);
     s->timer[0] =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opaq=
ue[0]);
     s->timer[1] =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opaq=
ue[1]);
 }
=20
-
 /* System controller.  */
=20
 typedef struct {
@@ -1536,6 +1540,7 @@ static void stellaris_gptm_class_init(ObjectClass *=
klass, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->vmsd =3D &vmstate_stellaris_gptm;
+    dc->realize =3D stellaris_gptm_realize;
 }
=20
 static const TypeInfo stellaris_gptm_info =3D {
--=20
2.21.0.windows.1


