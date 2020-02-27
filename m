Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3835599lfg;
        Wed, 26 Feb 2020 18:35:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7sUT+Pk8/bieqtLTv4PspRXsNwdvldOx6desCYyUVdCj61feiYUGn/mod9aeU2wqD7d34
X-Received: by 2002:a37:551:: with SMTP id 78mr2636020qkf.46.1582770949836;
        Wed, 26 Feb 2020 18:35:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582770949; cv=none;
        d=google.com; s=arc-20160816;
        b=d2VV4hI53CcShYMl7aZ7CsSRH1Ifs91nxlewcTT6Og2tSVvEMGKk2MMQ2J1bEb1gzH
         O9uO7Ft4FIGru+x8bbtWBwVHMlhcJvqE5h2dC9GTxmLfIu/qOHd+yGwsyeuo32dNiEAx
         unBZMZh+XWUMRS68Qqv5Xh0/sKjG3eWOqG0wYbwnoVSg81mpWnu9GO3WRB//MEsNoGXl
         zmawPHAuomT1YRzQMXl98eRdBxXXeIHaBKIN1aiFOEBMUzehaAh0ZZIS8ndgxGR6NKZf
         PKNmOPXWNMt1TovsM+QunVYyuKbtq8uSr5zsevoJWMpMpNxucOC2t4yTRG80GyXYetnK
         CkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=UVK3kE5ftprVdEVs6FpI0ue5ySl3DKFSTudG/sSM1jM=;
        b=Mpp3TwKmKWpDxkIIghffUBJfkYTTZiUv0Uo8QEjm/PVZT27Sai19DatELbSjOlgPjS
         9fqfWZyop29QpflzQzbseimPxE/Mkr2efgITURsIoik0lJ5wyupBIZtXBUQN1Cet39bz
         a6P3j17dFogrZlKteIn0suSAl0Fiv4Mh2JnxiXvakmIsohKKfgO3sSbIZCZKI0HgK8pR
         lNuooc+lsAIvx2n/1OfSIBfZPNgOLNTJBb+dNsNi3KgKKSrlpYgPh+DCInxP/2xYgqOl
         oEgvNwDA8h8zMtryRkMDd51J9orpIuvmdGF0gdXeHkEEzpjCEU5CQ6u1WHjz4HqAVTR+
         uRmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si159117qke.41.2020.02.26.18.35.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 18:35:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j791h-00084N-8J
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 21:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j791T-0007zq-8N
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 21:35:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j791S-0001fg-14
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 21:35:35 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3174 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j791R-0001ZC-MH; Wed, 26 Feb 2020 21:35:33 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9D6DC12A53F73219C1E5;
 Thu, 27 Feb 2020 10:35:31 +0800 (CST)
Received: from localhost.localdomain (10.175.104.216) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Feb 2020 10:35:21 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH v3 5/6] hw/misc/mos6522: move timer_new from init() into
 realize() to avoid memleaks
Date: Thu, 27 Feb 2020 10:50:54 +0800
Message-ID: <20200227025055.14341-6-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200227025055.14341-1-pannengyuan@huawei.com>
References: <20200227025055.14341-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
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
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 euler.robot@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gx7iGX+Gbr1Q

There are some memleaks when we call 'device_list_properties'. This patch move timer_new from init into realize to fix it.
Meanwhile, add calls to mos6522_realize() in mac_via_realize to make this move to be valid.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Cc: Laurent Vivier <laurent@vivier.eu>
---
v2->v1:
- no changes in this patch.
v3->v2:
- remove null check in reset, and add calls to mos6522_realize() in mac_via_realize to make this move to be valid.
---
 hw/misc/mac_via.c | 5 +++++
 hw/misc/mos6522.c | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index b7d0012794..1d72d4ef35 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -879,6 +879,11 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     sysbus_init_child_obj(OBJECT(dev), "via2", &m->mos6522_via2,
                           sizeof(m->mos6522_via2), TYPE_MOS6522_Q800_VIA2);
 
+    object_property_set_bool(OBJECT(&m->mos6522_via1), true, "realized",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&m->mos6522_via2), true, "realized",
+                             &error_abort);
+
     /* Pass through mos6522 output IRQs */
     ms = MOS6522(&m->mos6522_via1);
     object_property_add_alias(OBJECT(dev), "irq[0]", OBJECT(ms),
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 19e154b870..c1cd154a84 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -485,6 +485,11 @@ static void mos6522_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->timers); i++) {
         s->timers[i].index = i;
     }
+}
+
+static void mos6522_realize(DeviceState *dev, Error **errp)
+{
+    MOS6522State *s = MOS6522(dev);
 
     s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer1, s);
     s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer2, s);
@@ -502,6 +507,7 @@ static void mos6522_class_init(ObjectClass *oc, void *data)
 
     dc->reset = mos6522_reset;
     dc->vmsd = &vmstate_mos6522;
+    dc->realize = mos6522_realize;
     device_class_set_props(dc, mos6522_properties);
     mdc->parent_reset = dc->reset;
     mdc->set_sr_int = mos6522_set_sr_int;
-- 
2.18.2

