Received: by 10.223.172.38 with SMTP id v35csp1406681wrc;
        Tue, 5 Sep 2017 06:12:49 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb44h3/GTdIJI2keFnqlJto9Ocg40frkeLeg+bydQOxErKhfmBbsOLIdQ9zFTIm1o0mqvlaY
X-Received: by 10.200.41.117 with SMTP id z50mr4835909qtz.191.1504617169352;
        Tue, 05 Sep 2017 06:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504617169; cv=none;
        d=google.com; s=arc-20160816;
        b=l8pkTWJtW5K/Av+muiAnsPXDL6bBwa6EXD/aahBxl3ybMMkfMwlncs4ux+gh3CqzTE
         RaJTuRnCKGJ7Iy47ERmynJMpSAZV2kdSpwWhh1hRQkga+YO/Of7lid+VDAHeooCpvmZ7
         rBV6ms6Zik8vytWSzxoYOdor2F/Z+7+RNSytZtbB7CygE5AzEz2GaTurChMn5WEOEF5Q
         XDNJAiG5BLBbMUTAcHv84lFgIuD6k68srAI/KTYq+uNXNSvj9CY17O3UBYnVeMxhvu/6
         3Q+hZwsge6CIbZo6qT/LylOknG8Zqcb4i/+LrWaiBjx29KpGH8/QFboYVDnGnRZ5VC61
         DxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=lqdmAjaQzQdThnjZp/t9wd1H4Rw5k1I19E2R/yBh72w=;
        b=LrxLWvJfcj5epEAK5KMRpIVk/+lVYr0fcncJY+viXiI5lIy61JSp/V3kSlcB1ldm4M
         KuaVkE/aL+UjdzUeUJyfsONoH/S8qVEHGigxCiibd7dyWKFEpLn//s8krOJ7koE/UY9Z
         noSRdRuPT0OqRaPNwl+aXRFWsgzgNPCRqcon+Fh5TRgsfhc7zihAtc/NdFQYRXGipf1v
         5dgMQuDSAvz/AtskXEARIM9pwkgMx0VV/JsV1J5+cD8rIIzcRHLuowEGv7a2+o/X+BsB
         a8kR+jUr18vhYVHQL5WxIc+qIqAY1senDHumGEdpO7FkikKl2lgIY+Q4Nt/qog7vjd0r
         y3wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3si389330qki.535.2017.09.05.06.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 06:12:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58856 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpDep-00074P-1B
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 09:12:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDeJ-0006cU-CS
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDeA-0007u3-1B
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34510)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dpDe9-0007sd-Rt; Tue, 05 Sep 2017 09:12:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3DD163E08;
	Tue,  5 Sep 2017 13:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E3DD163E08
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-97.pek2.redhat.com [10.72.12.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D5DB812C4;
	Tue,  5 Sep 2017 13:12:02 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Sep 2017 21:11:48 +0800
Message-Id: <20170905131149.10669-6-famz@redhat.com>
In-Reply-To: <20170905131149.10669-1-famz@redhat.com>
References: <20170905131149.10669-1-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 05 Sep 2017 13:12:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 5/6] xilinx_axienet: Convert to
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
X-TUID: fAr4PDJ3tTnA

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/net/xilinx_axienet.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 5ffa739f68..d4c2c89dc1 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -989,18 +989,6 @@ static void xilinx_enet_init(Object *obj)
     XilinxAXIEnet *s =3D XILINX_AXI_ENET(obj);
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
=20
-    object_property_add_link(obj, "axistream-connected", TYPE_STREAM_SLA=
VE,
-                             (Object **) &s->tx_data_dev,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
-    object_property_add_link(obj, "axistream-control-connected",
-                             TYPE_STREAM_SLAVE,
-                             (Object **) &s->tx_control_dev,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
-
     object_initialize(&s->rx_data_dev, sizeof(s->rx_data_dev),
                       TYPE_XILINX_AXI_ENET_DATA_STREAM);
     object_initialize(&s->rx_control_dev, sizeof(s->rx_control_dev),
@@ -1021,6 +1009,10 @@ static Property xilinx_enet_properties[] =3D {
     DEFINE_PROP_UINT32("rxmem", XilinxAXIEnet, c_rxmem, 0x1000),
     DEFINE_PROP_UINT32("txmem", XilinxAXIEnet, c_txmem, 0x1000),
     DEFINE_NIC_PROPERTIES(XilinxAXIEnet, conf),
+    DEFINE_PROP_LINK("axistream-connected", XilinxAXIEnet,
+                     tx_data_dev, TYPE_STREAM_SLAVE, StreamSlave *),
+    DEFINE_PROP_LINK("axistream-control-connected", XilinxAXIEnet,
+                     tx_control_dev, TYPE_STREAM_SLAVE, StreamSlave *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.13.5

