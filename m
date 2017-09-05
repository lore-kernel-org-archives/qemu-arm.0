Received: by 10.223.172.38 with SMTP id v35csp1406891wrc;
        Tue, 5 Sep 2017 06:13:00 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7xRIJ1Ait0LczfMrVY7BNi8c5FAEiCjO+k4mi379G192woGP9KHCch3AW1NbgUhxPePe3j
X-Received: by 10.200.2.72 with SMTP id o8mr4967393qtg.63.1504617180746;
        Tue, 05 Sep 2017 06:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504617180; cv=none;
        d=google.com; s=arc-20160816;
        b=hgOf1Zl1SSZiaHVnx4cMMdadXzvYuYzObiTuytY7WIUHIUc1MtBvHi6349FmzYHgOU
         z3/crV1e8QLFJS5VqJmExE7lIPnC3LWRsnucGeni0ANoyjYcNTEyWnUbwROGqwispiW8
         fr4WtUGYwHo3qsvsQrrH5kaXbf/R0gsnV5SAwYbgOisjODDXss8j37fnk7lrk2EkMa+4
         32Cx1jUNJksIAaYf2WMVrSXjdmiv1LcK5nFycNEEVlmXylLwq1yo3voenRFU7JoSuSgP
         d78rDTEuwVuPqYcDeOgo7O5UF9pq/5oSgDHa4qr9i1PIE78bK2S7EpPyUro6zGulwDQJ
         zQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=po0WF9Mda4n0JliQ/ijfstQTpMWdeTpESFtf7p8QfuE=;
        b=MSuGZ9I8R67hZIGsBPg/aknJndAy8o/L4rmJ7+hBiEpFai5XFJkxsITwd2SrUXX813
         QsfvYCU0jYUSqLK976+XQOYGDZJ4tS3l0jBBr5mDPQ6Lj+aOtQiUVr5Y39NhGqz13kYO
         YmejMdPE3vB6JyWu1J8MveSX5j6ptaMNku3gppYOIZTHVtvIr4Ua0ykl72gvNrypJ8/b
         u06zo+wJ175Wc8dC46DeGCKcdQY3o54q6jl1qz5GiNi/0lRDmxItggaCIOmVNGYPsD7G
         az1SpCUucocnMc+LL9G0Oq62AYxo9ZIlIhiM6LH9YjNdw+kejHJkIZCqurTM7zO12Jqa
         itCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c1si386054qkd.196.2017.09.05.06.13.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 06:13:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpDf0-0007E3-CQ
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 09:12:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDeJ-0006cx-U4
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDeC-0007wV-8q
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46164)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dpDeC-0007vA-3I; Tue, 05 Sep 2017 09:12:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BFBF2C9DC7;
	Tue,  5 Sep 2017 13:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2BFBF2C9DC7
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-97.pek2.redhat.com [10.72.12.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 747F47FB8D;
	Tue,  5 Sep 2017 13:12:05 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Sep 2017 21:11:49 +0800
Message-Id: <20170905131149.10669-7-famz@redhat.com>
In-Reply-To: <20170905131149.10669-1-famz@redhat.com>
References: <20170905131149.10669-1-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 05 Sep 2017 13:12:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 6/6] xilinx_axidma: Convert to DEFINE_PROP_LINK
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
X-TUID: J99ZQ8jJh+zc

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/dma/xilinx_axidma.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 3987b5ff96..9b48103574 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -562,18 +562,6 @@ static void xilinx_axidma_init(Object *obj)
     XilinxAXIDMA *s =3D XILINX_AXI_DMA(obj);
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
=20
-    object_property_add_link(obj, "axistream-connected", TYPE_STREAM_SLA=
VE,
-                             (Object **)&s->tx_data_dev,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
-    object_property_add_link(obj, "axistream-control-connected",
-                             TYPE_STREAM_SLAVE,
-                             (Object **)&s->tx_control_dev,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
-
     object_initialize(&s->rx_data_dev, sizeof(s->rx_data_dev),
                       TYPE_XILINX_AXI_DMA_DATA_STREAM);
     object_initialize(&s->rx_control_dev, sizeof(s->rx_control_dev),
@@ -593,6 +581,10 @@ static void xilinx_axidma_init(Object *obj)
=20
 static Property axidma_properties[] =3D {
     DEFINE_PROP_UINT32("freqhz", XilinxAXIDMA, freqhz, 50000000),
+    DEFINE_PROP_LINK("axistream-connected", XilinxAXIDMA,
+                     tx_data_dev, TYPE_STREAM_SLAVE, StreamSlave *),
+    DEFINE_PROP_LINK("axistream-control-connected", XilinxAXIDMA,
+                     tx_control_dev, TYPE_STREAM_SLAVE, StreamSlave *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.13.5

