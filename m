Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4705781lfp;
        Mon, 3 Feb 2020 18:06:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwc3sa+Eu3L40N9Sv7O1ssBAbXQaLxjZZZmCKDu8INiUXjU3SO2C7hC2flFgYDoR7rEeJya
X-Received: by 2002:a37:a8c1:: with SMTP id r184mr26148555qke.151.1580781992960;
        Mon, 03 Feb 2020 18:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580781992; cv=none;
        d=google.com; s=arc-20160816;
        b=NrQi33WZqkOyUVG2w6LbL+upC2dk8scc4vH9eUam5j/J2Yo1xCqaVQi+WZTQdkvdz9
         8LUhb4K6ZpWww+DGnI6R2751jY0+1Du2JreIfeAmALhBhMX1AkwVWJ2sJr80jEyjq9PW
         giklCCqc3it0a5xWspEv9CeM19IiGLpiAdaL+UrcdNJVWNxZRbZkn1R4A1DqZTjDnEfC
         XzOMca4119O+DIk4edh7UP7HZd08sB/qDGtBebynxjkFaLDRkheW2HPSiL2clJIl6m5N
         ldT6uN3+QnI2cLpasXbqZ0LykG6+rWPMtNka2PItMt7UEC4grMq/udN/PCGN1dFAuSlc
         r3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=NgJz4sa8O2FI3cLl1yYshc7KPIWgE0EReyj5OuUL+Qw=;
        b=oY4dn8iFWOrN7i2hlFLe05NcggGQ/8SBiWAwbJWigdQoaz3Go2GOFwSagB0O7G2fGf
         R9pd/R7Znx03KEWHM/xsomwIgiDB9JYbHSfSffJR1lTabbnfhgNGdGlLNdnI2vbNZYAQ
         0Cj92dO2wNPpP8Nb00O/vxBy690R2J2WQXN9eFeWYhs2O82cyHVENhouYqPVuPrwkE5a
         y9tYtId3LbTjFM/EcysAHVHzmN7YXfAUm/12i/70JM+IFY0dFmKylxNyZoaW0aw/xQ5Q
         kth6h2GqScZLDoXQZx+GnOCUzhqFJZCDPSGVRF3TWFEVSHT/IarLLZBJVl0e/O+oq4U3
         CsEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22si13424529qkg.298.2020.02.03.18.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 18:06:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iynbk-0002nd-Ch
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 21:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35077)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iynbc-0002nK-MF
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 21:06:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iynbb-0007Id-DI
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 21:06:24 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2754 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iynbb-0006gX-1i; Mon, 03 Feb 2020 21:06:23 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 01129323CB897F3B19F3;
 Tue,  4 Feb 2020 10:06:17 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Tue, 4 Feb 2020 10:06:11 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH v2] pl031: add finalize function to avoid memleaks
Date: Tue, 4 Feb 2020 10:05:54 +0800
Message-ID: <20200204020554.9380-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: Euler Robot <euler.robot@huawei.com>, qemu-arm@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wP1prARYPMas

From: Pan Nengyuan <pannengyuan@huawei.com>

There is a memory leak when we call 'device_list_properties' with
typename =3D pl031. It's easy to reproduce as follow:

  virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-prope=
rties", "arguments": {"typename": "pl031"}}'

The memory leak stack:
  Direct leak of 48 byte(s) in 1 object(s) allocated from:
    #0 0x7f6e0925a970 in __interceptor_calloc (/lib64/libasan.so.5+0xef97=
0)
    #1 0x7f6e06f4d49d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
    #2 0x564a0f7654ea in timer_new_full /mnt/sdb/qemu/include/qemu/timer.=
h:530
    #3 0x564a0f76555d in timer_new /mnt/sdb/qemu/include/qemu/timer.h:551
    #4 0x564a0f765589 in timer_new_ns /mnt/sdb/qemu/include/qemu/timer.h:=
569
    #5 0x564a0f76747d in pl031_init /mnt/sdb/qemu/hw/rtc/pl031.c:198
    #6 0x564a0fd4a19d in object_init_with_type /mnt/sdb/qemu/qom/object.c=
:360
    #7 0x564a0fd4b166 in object_initialize_with_type /mnt/sdb/qemu/qom/ob=
ject.c:467
    #8 0x564a0fd4c8e6 in object_new_with_type /mnt/sdb/qemu/qom/object.c:=
636
    #9 0x564a0fd4c98e in object_new /mnt/sdb/qemu/qom/object.c:646
    #10 0x564a0fc69d43 in qmp_device_list_properties /mnt/sdb/qemu/qom/qo=
m-qmp-cmds.c:204
    #11 0x564a0ef18e64 in qdev_device_help /mnt/sdb/qemu/qdev-monitor.c:2=
78

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Changes V2 to V1:
- Delay the timer_new until realize instead of putting it into instance_i=
nit, since the pl031 can't be hotplugged(suggested by Peter Maydell).
---
 hw/rtc/pl031.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index ae47f09635..0b9253eb30 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -190,7 +190,11 @@ static void pl031_init(Object *obj)
     qemu_get_timedate(&tm, 0);
     s->tick_offset =3D mktimegm(&tm) -
         qemu_clock_get_ns(rtc_clock) / NANOSECONDS_PER_SECOND;
+}
=20
+static void pl031_realize(DeviceState *dev, Error **errp)
+{
+    PL031State *s =3D PL031(dev);
     s->timer =3D timer_new_ns(rtc_clock, pl031_interrupt, s);
 }
=20
@@ -321,6 +325,7 @@ static void pl031_class_init(ObjectClass *klass, void=
 *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->vmsd =3D &vmstate_pl031;
+    dc->realize =3D pl031_realize;
     device_class_set_props(dc, pl031_properties);
 }
=20
--=20
2.21.0.windows.1


