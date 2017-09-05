Received: by 10.223.172.38 with SMTP id v35csp1406016wrc;
        Tue, 5 Sep 2017 06:12:12 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6kqP3OsCmEjsK8M4PHGakc83RiXMr/fZ4D+rIsoLdPvl1WGdVMBKl71u2BCWeuEAp1cHzx
X-Received: by 10.55.16.74 with SMTP id a71mr5687908qkh.170.1504617132655;
        Tue, 05 Sep 2017 06:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504617132; cv=none;
        d=google.com; s=arc-20160816;
        b=xLGJ4StU/b3ljNDJeQj5eO4X1ubLKqk+Ig0NlKfuGg7qtB4vM9sKjYBEZPEPS42U3G
         SIKUUo5s0x6cgyVIGxQeJKm5Jjo3eOgkAMDDPwLv8D5gHmsLZ9qJE25k6qAu/af4OMSO
         dpd2QDaT0szNQ1o7D0VPUrF9EDaJmU74YfxnzWuIvctaR+bkA64syqUwxxFr1OhqZGxl
         wmimjAoSfDMDOYbxxuPC/CQTxzqRmcjMO7iwdkeQg57ADUGhX2y1X87GCLEL0F8W+80w
         uCwwUaGDSCTpxjKBSnAYmMMUTkwPqo+nFEEy+ElwsjWEleBboJKeBqrfdaDJoYdmO3bQ
         Ff7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=QqoFoUIBlnOlKB9MoQQBtUKtMCAAmx840VB1sxDcwBo=;
        b=bIMYaYq5H7bu1g8w1v+lDuWrwqdo0UbL0Hnc/N/lAq2lXr0TJy6hxLBUP2UPa4yz8z
         lUzaiHYCKFyZwgXuHqdcza/TdqOwT0IF0O3mVCKmWeDAcp5EcBo7UennscbNxX8J60JQ
         dexSdzbIaVHP5W7kJqLUpDv0E+u1XlJyGAnBI7tvbSlWNKV95v0XwM6DbDZZk24YlSlK
         VSkHx4hlZe9OKBpkyoo3GQeusrOFDhBAz1nbeNO2O9ENNLbw4+gp4boffeD9nUeGt29i
         o3tTvc2+fpteD843SdDPqTvpCSDkbuoZP6L79Nm8pMWTIKP0iuQnqZi8z0EC8bbiDKOf
         JsuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d77si447980qkh.149.2017.09.05.06.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 06:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpDeE-0006Ti-BC
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 09:12:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDe4-0006OZ-U6
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDe0-0007kB-87
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64702)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dpDe0-0007io-2X; Tue, 05 Sep 2017 09:11:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F51AAC2C3;
	Tue,  5 Sep 2017 13:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1F51AAC2C3
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-97.pek2.redhat.com [10.72.12.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37A4F7FB8D;
	Tue,  5 Sep 2017 13:11:52 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Sep 2017 21:11:44 +0800
Message-Id: <20170905131149.10669-2-famz@redhat.com>
In-Reply-To: <20170905131149.10669-1-famz@redhat.com>
References: <20170905131149.10669-1-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 05 Sep 2017 13:11:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 1/6] armv7m: Convert bitband.source-memory to
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JoTDFLvoPls0

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/armv7m.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index d2477e84e4..4c560dde56 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -97,12 +97,6 @@ static void bitband_init(Object *obj)
     BitBandState *s =3D BITBAND(obj);
     SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);
=20
-    object_property_add_link(obj, "source-memory",
-                             TYPE_MEMORY_REGION,
-                             (Object **)&s->source_memory,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
     memory_region_init_io(&s->iomem, obj, &bitband_ops, s,
                           "bitband", 0x02000000);
     sysbus_init_mmio(dev, &s->iomem);
@@ -349,6 +343,8 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kern=
el_filename, int mem_size)
=20
 static Property bitband_properties[] =3D {
     DEFINE_PROP_UINT32("base", BitBandState, base, 0),
+    DEFINE_PROP_LINK("source-memory", BitBandState, source_memory,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.13.5

