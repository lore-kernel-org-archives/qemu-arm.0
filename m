Received: by 10.223.172.38 with SMTP id v35csp1406246wrc;
        Tue, 5 Sep 2017 06:12:25 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5GyrCV0QKDoCf7h0fRjVglGfkRtA/c1gvAG/2xTVDdv9sNmWosXotzlmhQHRG0PmRgXLgG
X-Received: by 10.55.36.74 with SMTP id w71mr5361329qkg.260.1504617145451;
        Tue, 05 Sep 2017 06:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504617145; cv=none;
        d=google.com; s=arc-20160816;
        b=LhL3euKVRxQcEW5W3BbLtEpcIAE8qY2o4YCuA5Kz0jyM592NQus/A+TuWxGffFO0QY
         ff/RYU/qz/PyNNylJQ6uSjc47anZe/I4vIE5Mw4rc5lp/Dc9RwSA7fzxOPvdR0z+Kp8b
         OyWRrjBheCpukJkgcOxsh1JDh8SGl13bbFZZxg+kc42hQznbvRlwipfKK/ojjkiH6x7C
         7ha/20A/00bwh9us4VzTbehvRxm5qucWYDDLv4uxjzoXKlCnEhcOUPNzNaFcYYRBiBht
         HhopPbYoQGIzZXl/PRI5bXB2ZkW0PR+sXvnWKBlg7vE9Nqqz5MRZu5KGq2wkHFV8uuQW
         Wc6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=9clcBD/z/WTUFkpWBe90f9V6RUUi7FQ+dU9KDY2wdfM=;
        b=wEkWYRY5eMAoyiCNE9K6CQcnHtgXb1L5tsiQ0jYUZeos595BupFAGRejAhfEkORaIA
         fd2bK6juVA+8Is6W1KR1JqwMRMFHLJ2AZs4gbvMlre25GZRj7Rop9DNCI+f5S7zpf2eS
         m4my1mbJo0sU5ISe7F/BsBono775o71xMXiJAVaEwH0kgcQDbM2w7Pjk74G/5MDxAqS3
         daq9y4sFAQYLCjgbP1WaGkwciSCuC3MR7WZ0d+kOde+xPejSIpdbySJPVhEQQqupLGXb
         D7bHioXpStCsCVG1/kxJHQgL0tGAmrPIVb+dlsNnb/IjZo8m+SaqfjAkWsXa5FwfF5zb
         bJGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m89si207033qtd.203.2017.09.05.06.12.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 06:12:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpDeR-0006gL-52
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 09:12:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDeC-0006V7-8Q
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDe7-0007ro-Hq
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47702)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dpDe7-0007r3-BF; Tue, 05 Sep 2017 09:12:03 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73ED513D1A;
	Tue,  5 Sep 2017 13:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 73ED513D1A
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-97.pek2.redhat.com [10.72.12.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 939F6812C0;
	Tue,  5 Sep 2017 13:12:00 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Sep 2017 21:11:47 +0800
Message-Id: <20170905131149.10669-5-famz@redhat.com>
In-Reply-To: <20170905131149.10669-1-famz@redhat.com>
References: <20170905131149.10669-1-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 05 Sep 2017 13:12:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 4/6] xlnx_zynqmp: Convert to DEFINE_PROP_LINK
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
X-TUID: WFyWW7jHdA8V

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 9eceadbdc8..22c2a33719 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -140,11 +140,6 @@ static void xlnx_zynqmp_init(Object *obj)
                                   &error_abort);
     }
=20
-    object_property_add_link(obj, "ddr-ram", TYPE_MEMORY_REGION,
-                             (Object **)&s->ddr_ram,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE, &error_abor=
t);
-
     object_initialize(&s->gic, sizeof(s->gic), gic_class_name());
     qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
=20
@@ -433,6 +428,8 @@ static Property xlnx_zynqmp_props[] =3D {
     DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
     DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
     DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
+    DEFINE_PROP_LINK("ddr-ram", XlnxZynqMPState, ddr_ram, TYPE_MEMORY_RE=
GION,
+                     MemoryRegion *),
     DEFINE_PROP_END_OF_LIST()
 };
=20
--=20
2.13.5

