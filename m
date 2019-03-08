Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7811149wrx;
        Thu, 7 Mar 2019 17:40:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvL46yfHrpJ2+mxm+4xJNopD/bFEjCnCOS+KHTSUBNvOdSI7QnFJDA+brTTH4ZGSvw9Go5
X-Received: by 2002:a81:b727:: with SMTP id v39mr12480688ywh.300.1552009248707;
        Thu, 07 Mar 2019 17:40:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552009248; cv=none;
        d=google.com; s=arc-20160816;
        b=numEGMso6nQOv8qLIqtgzjkg5FUFxiocylH6xqJmAxZ5x+1Qc0bI9PT0ca646ALvks
         zhwDgzqZ73bfVyF+8YAZP5pfmWLUIN6Nf26BhbiLrTbVwxVC74lVupC2EPHe9wwHzWQX
         xWtK2ffHnO6tu36pDPXNmPb6MDc+3EqwifBuPyQG48GS8yQB+1cL8OrFJ98mcAXRIlEH
         qIE2HvIl/n8wAHpmub5a7Q4d+OOCsoUj5Hgl69T6Icnd5FsH7vBNLKI+6lPC6C1rf4Kr
         GgzJhr20qAGjPX0niBrkNsVbDJABOkNuKhGJ47yrXy3FLZWjTQ+YLjtOD4cJfIaf0eD5
         Em2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=DbuRYaDRpdSVXhdbS0MAqz1ZczQli526Snq48gh0bk4=;
        b=nXku4kHPtxI2AnuFPrWuLn8CDMPbwLKPK6iae5bRbU65OZQIPXDXX9mryc2mbQtHFf
         CSGK4BbOpBKkLOASA0BdoCK+04ZT5IWRmulBOH3/fagS5DXIFTBOERzf2ZcBCwZ8pU4F
         LIzzITHQ2/McsuEMDn81jwZj+9tfXVETH/wwjuw9fRu7RA1QthxHOS7dTgsXp0q/MEba
         dCpF0Xgg38Ew1RUfZ845R+vRCJPf2qaEykLa74Gg+c3QZMcBJl40+QMDwoDSUCHMfMfx
         niI+bND+a65NMF5c/8lVLEwE8dmNbOjwi4hoKYONS0JcvTijIbl30qmrtNndDXyFDwE4
         OKrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si3679346ybk.33.2019.03.07.17.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:40:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24VE-0000Yk-2u
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:40:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Og-0002ky-1S
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:34:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Oe-0001Kx-3Y
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:34:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36912)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24Oa-0001Fk-A3; Thu, 07 Mar 2019 20:33:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1732287637;
	Fri,  8 Mar 2019 01:33:54 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D680260BE5;
	Fri,  8 Mar 2019 01:33:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:12 +0100
Message-Id: <20190308013222.12524-9-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 08 Mar 2019 01:33:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 08/18] hw/nvram/fw_cfg: Move
 fw_cfg_file_slots_allocate() to common_realize()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aOiQ4Qt5oXlW

Each implementation (I/O and MEM) calls fw_cfg_file_slots_allocate()
then fw_cfg_common_realize().
Simplify by moving the fw_cfg_file_slots_allocate() call into
fw_cfg_common_realize() where it belongs.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 0fb020edce..ca58d279a4 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -929,19 +929,26 @@ static void fw_cfg_machine_ready(struct Notifier *n=
, void *data)
     qemu_register_reset(fw_cfg_machine_reset, s);
 }
=20
-
+static void fw_cfg_file_slots_allocate(FWCfgState *s, Error **errp);
=20
 static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
 {
     FWCfgState *s =3D FW_CFG(dev);
     MachineState *machine =3D MACHINE(qdev_get_machine());
     uint32_t version =3D FW_CFG_VERSION;
+    Error *local_err =3D NULL;
=20
     if (!fw_cfg_find()) {
         error_setg(errp, "at most one %s device is permitted", TYPE_FW_C=
FG);
         return;
     }
=20
+    fw_cfg_file_slots_allocate(s, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     fw_cfg_add_bytes(s, FW_CFG_SIGNATURE, (char *)"QEMU", 4);
     fw_cfg_add_bytes(s, FW_CFG_UUID, &qemu_uuid, 16);
     fw_cfg_add_i16(s, FW_CFG_NOGRAPHIC, (uint16_t)!machine->enable_graph=
ics);
@@ -1108,7 +1115,7 @@ static void fw_cfg_io_realize(DeviceState *dev, Err=
or **errp)
     FWCfgIoState *s =3D FW_CFG_IO(dev);
     Error *local_err =3D NULL;
=20
-    fw_cfg_file_slots_allocate(FW_CFG(s), &local_err);
+    fw_cfg_common_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
@@ -1125,8 +1132,6 @@ static void fw_cfg_io_realize(DeviceState *dev, Err=
or **errp)
                               &fw_cfg_dma_mem_ops, FW_CFG(s), "fwcfg.dma=
",
                               sizeof(dma_addr_t));
     }
-
-    fw_cfg_common_realize(dev, errp);
 }
=20
 static void fw_cfg_io_class_init(ObjectClass *klass, void *data)
@@ -1162,7 +1167,7 @@ static void fw_cfg_mem_realize(DeviceState *dev, Er=
ror **errp)
     const MemoryRegionOps *data_ops =3D &fw_cfg_data_mem_ops;
     Error *local_err =3D NULL;
=20
-    fw_cfg_file_slots_allocate(FW_CFG(s), &local_err);
+    fw_cfg_common_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
@@ -1189,8 +1194,6 @@ static void fw_cfg_mem_realize(DeviceState *dev, Er=
ror **errp)
                               sizeof(dma_addr_t));
         sysbus_init_mmio(sbd, &FW_CFG(s)->dma_iomem);
     }
-
-    fw_cfg_common_realize(dev, errp);
 }
=20
 static void fw_cfg_mem_class_init(ObjectClass *klass, void *data)
--=20
2.20.1

