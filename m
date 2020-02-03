Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3632098lfp;
        Sun, 2 Feb 2020 23:47:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqzYGhlTBN8SBCaQQsKe3zo8K3daq+Jzgxb/veIO4gSRbfhWs1+zcRZu0GGJMKe8L12E73r1
X-Received: by 2002:ae9:e306:: with SMTP id v6mr22353998qkf.162.1580716062975;
        Sun, 02 Feb 2020 23:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580716062; cv=none;
        d=google.com; s=arc-20160816;
        b=Rtob89GHAKHMLYyMZGmRJS3WujNbQXlDY/cR3qC2KT7njhOMEm3g6NdTDkuePwrW9O
         4glIdk3heRLsfwQ5P9pnTCyh+6t5kJE3MFGQ6+QoOzBr1d9DERsK+zqv8DsOCnKGwLG8
         RhBzJl6PxfyzZ3FcdzT3LAheC9xUASNyCTv3/PQOzESJ5jfvqq+XAt/RKdk43pUXSSDK
         qO2nS31/dPfF5LeUCBXP7gl3LDEcOVnz8ixvqnKpiQW1zcSG7Kb32BDjv2dkkqM/hfdE
         U3HOZEa9PXK4iuJpzvjEcZP6xaFyfIkaEhPwhnLMs+i4q0imoiCmXlkpCq2dHmTBxx3J
         kCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=bG0K7h6x2mJJXNkEfT5+sGkVDoYUcH82YyM3kP6Ad78=;
        b=Wbi1H08M/c94h1HFSjrcbevg5r4ZUTR8Tnce2pobP6nWPWDH7L5Z1PwiEU+GTwjhkn
         uVJRVuPZZyHrMyOIc5ZFqE6g9oyJKC4HiyUSd+gq0GwlKARzFZdiICQRLymS4DLfyc3x
         +zVqV8rMWp3MSNB+FTagKu/lvXg3ByV4t6Wil0Q6Q+p2w2Zt6hkCb3RHwqgwQ25A3iPe
         j2GCT6RL49H7r10MoJBtFSuJwPpBls+6zlMGxSCIk5b5YWI1DZVwwYF8Z1BD6pgRF6O9
         nKySYAvH2H0I+Voj6VwNC9K6ayGt5l/0dZVOEVGiy5PLSzhJdTDxvzwswa9mPUWXxpz6
         n+kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si11833175qkg.90.2020.02.02.23.47.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 23:47:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyWSM-0001xt-Cx
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 02:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iyWSE-0001v8-7Y
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 02:47:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iyWSD-0007XS-56
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 02:47:34 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2693 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iyWSC-0007Ss-Qe; Mon, 03 Feb 2020 02:47:33 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0003527C3EF67B893E43;
 Mon,  3 Feb 2020 15:47:27 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 15:47:21 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH] pl031: add finalize function to avoid memleaks
Date: Mon, 3 Feb 2020 15:47:18 +0800
Message-ID: <20200203074718.37252-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: zhang.zhanghailiang@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, xuding42@huawei.com, qemu-arm@nongnu.org,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9oTf2x1BcAO+

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
 hw/rtc/pl031.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index ae47f09635..50664ca000 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -194,6 +194,15 @@ static void pl031_init(Object *obj)
     s->timer =3D timer_new_ns(rtc_clock, pl031_interrupt, s);
 }
=20
+static void pl031_finalize(Object *obj)
+{
+    PL031State *s =3D PL031(obj);
+    if (s->timer) {
+        timer_del(s->timer);
+        timer_free(s->timer);
+    }
+}
+
 static int pl031_pre_save(void *opaque)
 {
     PL031State *s =3D opaque;
@@ -329,6 +338,7 @@ static const TypeInfo pl031_info =3D {
     .parent        =3D TYPE_SYS_BUS_DEVICE,
     .instance_size =3D sizeof(PL031State),
     .instance_init =3D pl031_init,
+    .instance_finalize =3D pl031_finalize,
     .class_init    =3D pl031_class_init,
 };
=20
--=20
2.21.0.windows.1


