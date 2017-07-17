Received: by 10.25.44.15 with SMTP id s15csp4049261lfs;
        Sun, 16 Jul 2017 19:39:14 -0700 (PDT)
X-Received: by 10.200.8.68 with SMTP id x4mr26965951qth.195.1500259154822;
        Sun, 16 Jul 2017 19:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500259154; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3i6vLo1tY+NGAoQEN3WxmGbuM6VhkhgTbOkdBnTAvhi4plfD2seglPNoFiS1aXZPx
         YdKFjhPc6rA6JfPOxI9Xwi9oQE/4EDFIJNIbo0pVWBjI5IfYeggKfxIobZmS2Hvi+54A
         SSAzLnKAUrwQ4VQw3RNl2+mJl87z8UhF0LVp6oncvw0DpucHfmoWI/7hjpm/+199p5vf
         XLig4iHZD1ziBBPycYY+t8bUBkghSxqUJpPKwud9Lw1fXZd9xuER9XTWYjiq+/W/55mg
         xvFW88JgbNCZAOAdwX3YL/aiWXLSv/0n1M3AiLmkdZhkcU7INCEFfgItu2AjvL3rRlsg
         DA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=bi9tGA9QitDES/C8BdPRdjP9GkVTxr3AF2UHp4rQa8I=;
        b=PBlkT1F6cIU8hv/gRQA64czFidY3inFS+lvBsIZltpsrWx4lRSlypojXaiMXzsDjdX
         iG6mApg3PMjbRCGbR5iUT2h9ugWyu45/y018jwdSV6oajhsEziIzYZJyDZsQBs6BKoSQ
         0eiFAp+3UFoxvGloZZkzUxhFu5lcL0iJb3ILqX/XMSLgeFbd24JJPRu9BHqXjZR9/XP2
         UmlmBeZdPtiMQYREAl9wicwYIM177AYrECFVfA6NJl+8e0np1115oKPyNncDxAqe1xoE
         fXYZWpQjCqtM1xznAv0WROYc9osEDst77OalaGAOB9CU8MytisSvdmHwsDvhmSrQVh20
         MFMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u84si4245306qki.177.2017.07.16.19.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 19:39:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWvwG-0000qW-4F
	for alex.bennee@linaro.org; Sun, 16 Jul 2017 22:39:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvf-0000J1-8K
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:38:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvb-0001U6-2M
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:38:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42212)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dWvva-0001Tp-So; Sun, 16 Jul 2017 22:38:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C993680F63;
	Mon, 17 Jul 2017 02:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C993680F63
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C993680F63
Received: from lemon.redhat.com (ovpn-12-94.pek2.redhat.com [10.72.12.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D2B0600C8;
	Mon, 17 Jul 2017 02:38:27 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jul 2017 10:38:19 +0800
Message-Id: <20170717023824.18796-2-famz@redhat.com>
In-Reply-To: <20170717023824.18796-1-famz@redhat.com>
References: <20170717023824.18796-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 17 Jul 2017 02:38:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 1/6] armv7m: Convert bitband.source-mamory to
 DEFINE_PROP_LINK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FNqDsTUme1B7

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 hw/arm/armv7m.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index c8a11f2..8efc4e8 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -97,12 +97,6 @@ static void bitband_init(Object *obj)
     BitBandState *s = BITBAND(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
-    object_property_add_link(obj, "source-memory",
-                             TYPE_MEMORY_REGION,
-                             (Object **)&s->source_memory,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
     memory_region_init_io(&s->iomem, obj, &bitband_ops, s,
                           "bitband", 0x02000000);
     sysbus_init_mmio(dev, &s->iomem);
@@ -349,6 +343,8 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
 
 static Property bitband_properties[] = {
     DEFINE_PROP_UINT32("base", BitBandState, base, 0),
+    DEFINE_PROP_LINK("source-memory", BitBandState, source_memory,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.9.4

