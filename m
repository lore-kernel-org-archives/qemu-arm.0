Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6336127lfp;
        Tue, 4 Feb 2020 23:10:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzW92E/twnOsRrx51/8UO9mewVsUJnp9vIuJi7j7frOH6z5HGv5vuHQUWTfuKQXZdODNHNh
X-Received: by 2002:ad4:59c2:: with SMTP id el2mr29796524qvb.152.1580886644223;
        Tue, 04 Feb 2020 23:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580886644; cv=none;
        d=google.com; s=arc-20160816;
        b=02N5eAsGnie5SW9fVwAG9OBZfyYx23qbYi31nJ5f82Cm4jYm3kmhfugtRWEgaEr89B
         IK/R/Uu72VkxHFVAlvVDdpytjdxc6YbXNDGFqVQI/hWYgXExUgeBX18RnqyKnVrOSG7/
         Hp5/S/DfZu7kjrSXwdUcJ+8CPC3kkXPYz4Luj995sUTlMc6hgaesNiA5bG+d5rAPX8Zh
         BYI9/iK/Rld3lTm30EiF+AQeSITVvIUmHFBbdi+Vb389XuNOkMslsfE98UmXojjOG5rg
         M9KHdc9JYPEcyAr0VcSwRDxJpfSIZkC/KrDMMKLAtsOwP0AiqYy4QLHWJ+vYJY9OSLDX
         97pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=5RrdnfT/sgout2MWu+rL5gkwvPkIbz5Smd+pxtvyGFM=;
        b=dZMaCVQJFvr8WNymnuHFC/953trezMOi5sPX2DWN8ZnhPBlLbsU/cClxgn2BKS0Knb
         ypTVL1qxEo3Id3RrOmTplVmuSO40Zny5+NpRyL0H2HkX0RYZH3A/VvFEI+iBwfiNqIJm
         47NThg5CXwzVsYVu8cIJg87n6BBV/wMfxah+E+tgqQ0+Tj8Sbo/abMdk+rxvzN6SHPpd
         B9g1gdd23aDGigP/6PdNE8vkqes1opZswz9wgxHGKi+3NdFYK/75Ol0Tj2nHUR8Yt7ow
         6DyyhaLnAypoSujCDB8R1/EzyId6zBYuuS7CjvFE6Ht1XdZXaTq5xEGA/1pbjN5DonsC
         S+Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si16065411qkg.63.2020.02.04.23.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 23:10:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izEpe-0002yn-NE
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 02:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1izEn6-0001DI-Im
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 02:08:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1izEn3-0008Kc-Es
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 02:08:04 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:58670 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1izEn3-0007jO-2N; Wed, 05 Feb 2020 02:08:01 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3B49D1F9887F0D343EAF;
 Wed,  5 Feb 2020 15:07:53 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 5 Feb 2020 15:07:44 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH 1/3] armv7m_systick: delay timer_new to avoid memleaks
Date: Wed, 5 Feb 2020 15:06:57 +0800
Message-ID: <20200205070659.22488-2-pannengyuan@huawei.com>
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
X-TUID: xQvPXgzOqEP0

From: Pan Nengyuan <pannengyuan@huawei.com>

There is a memory leak when we call 'device_list_properties' with typenam=
e =3D armv7m_systick. It's easy to reproduce as follow:

  virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-prope=
rties", "arguments": {"typename": "armv7m_systick"}}'

This patch delay timer_new to fix this memleaks.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Cc: qemu-arm@nongnu.org
---
 hw/timer/armv7m_systick.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 85d122dbcb..74c58bcf24 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -216,6 +216,11 @@ static void systick_instance_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &systick_ops, s, "systick", 0x=
e0);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
+}
+
+static void systick_realize(DeviceState *dev, Error **errp)
+{
+    SysTickState *s =3D SYSTICK(dev);
     s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, systick_timer_tick, s)=
;
 }
=20
@@ -238,6 +243,7 @@ static void systick_class_init(ObjectClass *klass, vo=
id *data)
=20
     dc->vmsd =3D &vmstate_systick;
     dc->reset =3D systick_reset;
+    dc->realize =3D systick_realize;
 }
=20
 static const TypeInfo armv7m_systick_info =3D {
--=20
2.21.0.windows.1


