Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp561132wrq;
        Fri, 13 Jul 2018 04:13:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcYTdu1A8uZOrpGTIR4Tl9VagdaZaezjnfGXj4ISvFR4J3uKr17ZmRFq6OABZFtH4ZszNV6
X-Received: by 2002:a37:b286:: with SMTP id b128-v6mr4972724qkf.158.1531480435389;
        Fri, 13 Jul 2018 04:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531480435; cv=none;
        d=google.com; s=arc-20160816;
        b=igG0uVaAmj4ZuYZknKVPHSuVuKLoWlTT257GyahQZ95HIW3jA3JG6BqJGZ43qSoXlY
         OZMvCih3gsqIY0i/P+oc6Mu5Dbnv7iszUaLZKpoARDxhM5qUFvoLJZcG4xGxRD+JDno+
         Ir5FDl5WevSXDzkEQiz2ENKrk2ruJ00mBihMqZBjK8eKYXlLQYdM7w/CVL6+XseFFF2L
         rp5E9uuzYncmN19002ek8Q7AJUQkOWcsIUr7a/pxv7V8thJ2ZCEIccOtp3ENhGl+/Z49
         JJX13sbHXtQf3jrG8sbE1K+8Vu+Pq8COd49lE96CnTctEXV8IdPsxGmCCwBd1VG5nbpR
         1RGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=S/7iHkHS5iH7t+45z+PQKq2Qy1DTSh/p47lGNCi8/lg=;
        b=e3s6HEDgxRKXdempUZ/7qnBXvH79Ztjno0l750FzooM7K/qWGlbbueny5xmLpCMDzZ
         /ft0y6mxkAEUgZajE+iwIl4S0lnfEopNzrq4rSYLs+VF/mgSYNTquV/Zmp0/yd+VMT1C
         MN5faKIRBN/YNx4synrjrUsdBAU92SvnZH2NR5QUJVydvGPoglos5e0TOgZNp6lPrYta
         rk+j2Dp7J7CWS+APYDHuxmWYoVu8vQ7WOkLoXHHZBzh2Cmxvo78A00lNXa9h39qWQ2yK
         JUFzlDN+Xxz1XNoS3lD2vNTbHvOMmDYGCZ8JDEtWB+Ur7AEp4EjvR72ovVBOCGPsV/ob
         DuQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 77-v6si2600443qkp.176.2018.07.13.04.13.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 04:13:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdw1K-0005Lr-Pi
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 07:13:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fdw1B-0005LW-JS
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 07:13:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fdw16-0002I5-K5
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 07:13:45 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:32976 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1fdw16-0002Hm-DG; Fri, 13 Jul 2018 07:13:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E32D400ADE9;
	Fri, 13 Jul 2018 11:13:39 +0000 (UTC)
Received: from [10.36.117.240] (ovpn-117-240.ams2.redhat.com [10.36.117.240])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 011A81C722;
	Fri, 13 Jul 2018 11:13:36 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-7-git-send-email-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <d76b1a42-e232-f8a3-48dc-d71238403c94@redhat.com>
Date: Fri, 13 Jul 2018 13:13:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1531470464-21522-7-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 11:13:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 11:13:39 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 06/16] hw/display/xlnx_dp: Move
 problematic code from instance_init to realize
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iIPOO0HerqAJ

On 13/07/2018 10:27, Thomas Huth wrote:
> aux_create_slave() calls qdev_init_nofail() which in turn "realizes"
> the corresponding object. Thus this most not be called from an
> instance_init function. Move the code to the realize function instead.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/display/xlnx_dp.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)

> +    s->aux_bus =3D aux_init_bus(dev, "aux");

aux_init_bus can remain in the same place, and likewise the qdev_create
that assigns to s->edid.

The only thing that has to move is the qdev_init_nofail and
aux_bus_map_device, like this:

----------------- 8< ------------------
From: Paolo Bonzini <pbonzinI@redhat.com>
Subject: [PATCH] hw/display/xlnx_dp: Move problematic code from instance_=
init to realize

aux_create_slave() calls qdev_init_nofail() which in turn "realizes"
the corresponding object. This is unlike qdev_create(), and it is wrong
because qdev_init_nofail() must not be called from an instance_init
function.  Move qdev_init_nofail() and the subsequent aux_map_slave into
the caller's realize function.
=20
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 51301220e8..589ef59dfd 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1234,7 +1234,7 @@ static void xlnx_dp_init(Object *obj)
     /*
      * Initialize DPCD and EDID..
      */
-    s->dpcd =3D DPCD(aux_create_slave(s->aux_bus, "dpcd", 0x00000));
+    s->dpcd =3D DPCD(aux_create_slave(s->aux_bus, "dpcd"));
     s->edid =3D I2CDDC(qdev_create(BUS(aux_get_i2c_bus(s->aux_bus)), "i2=
c-ddc"));
     i2c_set_slave_address(I2C_SLAVE(s->edid), 0x50);
=20
@@ -1248,6 +1248,9 @@ static void xlnx_dp_realize(DeviceState *dev, Error=
 **errp)
     DisplaySurface *surface;
     struct audsettings as;
=20
+    qdev_init_nofail(DEVICE(s->dpcd));
+    aux_map_slave(AUX_SLAVE(s->dpcd), 0x0000);
+
     s->console =3D graphic_console_init(dev, 0, &xlnx_dp_gfx_ops, s);
     surface =3D qemu_console_surface(s->console);
     xlnx_dpdma_set_host_data_location(s->dpdma, DP_GRAPHIC_DMA_CHANNEL,
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index b8a8721201..2fe807d42f 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -74,9 +74,11 @@ AUXBus *aux_init_bus(DeviceState *parent, const char *=
name)
     return bus;
 }
=20
-static void aux_bus_map_device(AUXBus *bus, AUXSlave *dev, hwaddr addr)
+void aux_map_slave(AUXSlave *aux_dev, hwaddr addr)
 {
-    memory_region_add_subregion(bus->aux_io, addr, dev->mmio);
+    DeviceState *dev =3D DEVICE(aux_dev);
+    AUXBus *bus =3D AUX_BUS(qdev_get_parent_bus(dev));
+    memory_region_add_subregion(bus->aux_io, addr, aux_dev->mmio);
 }
=20
 static bool aux_bus_is_bridge(AUXBus *bus, DeviceState *dev)
@@ -260,15 +262,13 @@ static void aux_slave_dev_print(Monitor *mon, Devic=
eState *dev, int indent)
                    memory_region_size(s->mmio));
 }
=20
-DeviceState *aux_create_slave(AUXBus *bus, const char *type, uint32_t ad=
dr)
+DeviceState *aux_create_slave(AUXBus *bus, const char *type)
 {
     DeviceState *dev;
=20
     dev =3D DEVICE(object_new(type));
     assert(dev);
     qdev_set_parent_bus(dev, &bus->qbus);
-    qdev_init_nofail(dev);
-    aux_bus_map_device(AUX_BUS(qdev_get_parent_bus(dev)), AUX_SLAVE(dev)=
, addr);
     return dev;
 }
=20
diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
index 68ade8a90f..c15b444748 100644
--- a/include/hw/misc/auxbus.h
+++ b/include/hw/misc/auxbus.h
@@ -123,6 +123,18 @@ I2CBus *aux_get_i2c_bus(AUXBus *bus);
  */
 void aux_init_mmio(AUXSlave *aux_slave, MemoryRegion *mmio);
=20
-DeviceState *aux_create_slave(AUXBus *bus, const char *name, uint32_t ad=
dr);
+/* aux_create_slave: Create a new device on an AUX bus
+ *
+ * @bus The AUX bus for the new device.
+ * @name The type of the device to be created.
+ */
+DeviceState *aux_create_slave(AUXBus *bus, const char *name);
+
+/* aux_map_slave: Map the mmio for an AUX slave on the bus.
+ *
+ * @dev The AUX slave.
+ * @addr The address for the slave's mmio.
+ */
+void aux_map_slave(AUXSlave *dev, hwaddr addr);
=20
 #endif /* HW_MISC_AUXBUS_H */


Paolo

> +    /* Initialize DPCD and EDID */
>      s->dpcd =3D DPCD(aux_create_slave(s->aux_bus, "dpcd", 0x00000));
>      s->edid =3D I2CDDC(qdev_create(BUS(aux_get_i2c_bus(s->aux_bus)), "=
i2c-ddc"));
>      i2c_set_slave_address(I2C_SLAVE(s->edid), 0x50);
> =20
>      fifo8_create(&s->rx_fifo, 16);
>      fifo8_create(&s->tx_fifo, 16);
> -}
> -
> -static void xlnx_dp_realize(DeviceState *dev, Error **errp)
> -{
> -    XlnxDPState *s =3D XLNX_DP(dev);
> -    DisplaySurface *surface;
> -    struct audsettings as;
> =20
>      s->console =3D graphic_console_init(dev, 0, &xlnx_dp_gfx_ops, s);
>      surface =3D qemu_console_surface(s->console);
>=20

