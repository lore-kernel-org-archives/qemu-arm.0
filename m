Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1970829wru;
        Mon, 16 Jul 2018 15:06:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfuykPVxyY6gTBruVfsDamljVtEI3WqEviHtOFz6ZojuxLq1VaCOzf0qoyYvfOyDovFILph
X-Received: by 2002:a0c:d44a:: with SMTP id r10-v6mr19990748qvh.248.1531778810958;
        Mon, 16 Jul 2018 15:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531778810; cv=none;
        d=google.com; s=arc-20160816;
        b=Px65JAMTxv0V0ohGuqkOjg4NRM4pf2PFf+lw4aUMDpMVb9mLP44DzTQ/m19eto5/z/
         zbtYv0K/QFhawYkbhXTClumzXJWha0/naDfDzLL4pLAmHv97ZgqqouUrp2n2HtoR8TOk
         ITB1HgFOnb/ZmWNzhGg51OTHEWh9wyQQ43cQDcLyl000FLrh0NWrPMExJJLTk0DhozMN
         PGuLScRdImKgLQC2C0+ItvP5DcgnMtnmF2rIhv9Lyky1it6wimVxwx5YxqoRp/FoOs6h
         n2ulQ/jZynbQnJEzMX1UDpdpV2iOdRH5DCOnpMF2XFhLlw4KS+m2bXO7dlzuaVL3xT46
         2tdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=PkyW0707ppeT5SPYposifgCygimlr+E9Qom4J3avBls=;
        b=dAegTxGWbY+CGqhxUe3A2GuqhFLeAW0edLiVUz6NIpXAvsAVvnjUF2T3ZSuXG8a6hk
         jzFLPPR4Otl2Jl0iWUI8IulOxKLbgEqm2CSxt/9EoqXNDGFoEynCJPvRi6IiPDdtyjI7
         upXX1YB5ZwHVgYDdzyCgsk7YYWgBhxfNH0WLbWcrRWZ9eJXOX7XaFD5HeWaa8QT1tDFv
         0rM3TIgWO4VPxOW8i/ZyWG9/n0/qLtxx/vcK0Y6Z/xKIBTHP32SADB9srOl26yAdU2ai
         YJVxVnPP+ZWkUvFiYpm8VdHJTudNbDcxnmGkbgEDYvbDv92whAj5MLzXUjyeeG0Bv8le
         4cGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ryB4CZTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5-v6si4862903qte.9.2018.07.16.15.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 15:06:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ryB4CZTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffBdq-0005Zs-FF
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 18:06:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBdc-0005Xk-Qz
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 18:06:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBdb-000533-Gu
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 18:06:36 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:36401)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ffBdY-0004zq-6Q; Mon, 16 Jul 2018 18:06:32 -0400
Received: by mail-lf0-x243.google.com with SMTP id b22-v6so20940693lfa.3;
	Mon, 16 Jul 2018 15:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PkyW0707ppeT5SPYposifgCygimlr+E9Qom4J3avBls=;
	b=ryB4CZTGT+UWQ2HgL97nGVw9HhXXnKoSG7HxQjxzfWYESugfuvg95nLabf529K5pD8
	tydpnadQ5zxJoas2M/m6jvf6VMVn06nNwiH+SYMKRiC1nNGona+NDeqizkTcuifLxP7e
	QU75EzL8275opT5YqA3OWikEzldHH+PsTxvflRarelyjZQdK51LF/7XcL3OUag+CHoum
	UnCHUvGe9ukLkwCXb/jaMneXR7FNTgjDOH8pzlFS9rxmCzIBPPhG6AOXUTcbzCiYs3c3
	DCtFh49L4tuJFkEdkQCQANQiKfXXXU5Nvk+tlLN+PegB8FNtBpaTgKXAzFlExwj51GtM
	Jcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PkyW0707ppeT5SPYposifgCygimlr+E9Qom4J3avBls=;
	b=BGlaKzb2STdQ+g71jSS08IEd2c+wzH5MyOCFXtzg+rnmj7N8ACAESGk4dEzlykJQ5s
	Ii4KApEzyYwpQikjqWYmJ4sEmIL3vZpTZjGQgFE6sETaaK1bLy6yOnX15bliCMUezC87
	Wbdk3t0a1/EUf9gqYb601ih/3Xy4NcrPwlfSUfapnq7WPpxqb50ROQHzZq5BLiiMVWGj
	ZhvcprUw6Q9WELX03EQfWtBrJ2S6iKd0pRkJ2D3W8NGLRoVhVLsALw8+q3cwx8osapX3
	UOkjVdXZzo3xMX+Rj+vyafQYXf5lXvBYinNlJ30IT6kS0NlX+p7dBAixcIH766cpbFwv
	80zg==
X-Gm-Message-State: AOUpUlFzXRftfbRYZ7UBfXOxX0a/j+q9hcXnjzKarqVlaY6SFiZcoDWl
	ybB1gCA2SnRphvCmpXXd4vmPvuZ0zT4iqPAOc8A=
X-Received: by 2002:a19:de4e:: with SMTP id
	v75-v6mr11868274lfg.14.1531778790844; 
	Mon, 16 Jul 2018 15:06:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8749:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 15:06:00
	-0700 (PDT)
In-Reply-To: <1531745974-17187-17-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-17-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jul 2018 15:06:00 -0700
Message-ID: <CAKmqyKOe_0-BJS9XvFbwXa2KiDkpNwYX+Bkf4_fW8=JaFWS3Yg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 16/17] hw/display/xlnx_dp:
 Move problematic code from instance_init to realize
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x/YW8JWzJr1o

On Mon, Jul 16, 2018 at 5:59 AM, Thomas Huth <thuth@redhat.com> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> aux_create_slave() calls qdev_init_nofail() which in turn "realizes"
> the corresponding object. This is unlike qdev_create(), and it is wrong
> because qdev_init_nofail() must not be called from an instance_init
> function.  Move qdev_init_nofail() and the subsequent aux_map_slave into
> the caller's realize function.
>
> There are two more bugs that needs to be fixed here, too, where the
> objects are created but not added as children.  Therefore when
> you call object_unparent on them, nothing happens.
>
> In particular dpcd and edid give you an infinite loop in bus_unparent,
> because device_unparent is not called and does not remove them from
> the list of devices on the bus.
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> [thuth: Added Paolo's fixup for the dpcd and edid unparenting]
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c     |  8 +++++++-
>  hw/misc/auxbus.c         | 18 ++++++++++++------
>  include/hw/misc/auxbus.h | 14 +++++++++++++-
>  3 files changed, 32 insertions(+), 8 deletions(-)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 5130122..6439bd0 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1234,9 +1234,12 @@ static void xlnx_dp_init(Object *obj)
>      /*
>       * Initialize DPCD and EDID..
>       */
> -    s->dpcd = DPCD(aux_create_slave(s->aux_bus, "dpcd", 0x00000));
> +    s->dpcd = DPCD(aux_create_slave(s->aux_bus, "dpcd"));
> +    object_property_add_child(OBJECT(s), "dpcd", OBJECT(s->dpcd), NULL);
> +
>      s->edid = I2CDDC(qdev_create(BUS(aux_get_i2c_bus(s->aux_bus)), "i2c-ddc"));
>      i2c_set_slave_address(I2C_SLAVE(s->edid), 0x50);
> +    object_property_add_child(OBJECT(s), "edid", OBJECT(s->edid), NULL);
>
>      fifo8_create(&s->rx_fifo, 16);
>      fifo8_create(&s->tx_fifo, 16);
> @@ -1248,6 +1251,9 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
>      DisplaySurface *surface;
>      struct audsettings as;
>
> +    qdev_init_nofail(DEVICE(s->dpcd));
> +    aux_map_slave(AUX_SLAVE(s->dpcd), 0x0000);
> +
>      s->console = graphic_console_init(dev, 0, &xlnx_dp_gfx_ops, s);
>      surface = qemu_console_surface(s->console);
>      xlnx_dpdma_set_host_data_location(s->dpdma, DP_GRAPHIC_DMA_CHANNEL,
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index b8a8721..0e56d9a 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -32,6 +32,7 @@
>  #include "hw/misc/auxbus.h"
>  #include "hw/i2c/i2c.h"
>  #include "monitor/monitor.h"
> +#include "qapi/error.h"
>
>  #ifndef DEBUG_AUX
>  #define DEBUG_AUX 0
> @@ -63,9 +64,14 @@ static void aux_bus_class_init(ObjectClass *klass, void *data)
>  AUXBus *aux_init_bus(DeviceState *parent, const char *name)
>  {
>      AUXBus *bus;
> +    Object *auxtoi2c;
>
>      bus = AUX_BUS(qbus_create(TYPE_AUX_BUS, parent, name));
> -    bus->bridge = AUXTOI2C(qdev_create(BUS(bus), TYPE_AUXTOI2C));
> +    auxtoi2c = object_new_with_props(TYPE_AUXTOI2C, OBJECT(bus), "i2c",
> +                                     &error_abort, NULL);
> +    qdev_set_parent_bus(DEVICE(auxtoi2c), BUS(bus));
> +
> +    bus->bridge = AUXTOI2C(auxtoi2c);
>
>      /* Memory related. */
>      bus->aux_io = g_malloc(sizeof(*bus->aux_io));
> @@ -74,9 +80,11 @@ AUXBus *aux_init_bus(DeviceState *parent, const char *name)
>      return bus;
>  }
>
> -static void aux_bus_map_device(AUXBus *bus, AUXSlave *dev, hwaddr addr)
> +void aux_map_slave(AUXSlave *aux_dev, hwaddr addr)
>  {
> -    memory_region_add_subregion(bus->aux_io, addr, dev->mmio);
> +    DeviceState *dev = DEVICE(aux_dev);
> +    AUXBus *bus = AUX_BUS(qdev_get_parent_bus(dev));
> +    memory_region_add_subregion(bus->aux_io, addr, aux_dev->mmio);
>  }
>
>  static bool aux_bus_is_bridge(AUXBus *bus, DeviceState *dev)
> @@ -260,15 +268,13 @@ static void aux_slave_dev_print(Monitor *mon, DeviceState *dev, int indent)
>                     memory_region_size(s->mmio));
>  }
>
> -DeviceState *aux_create_slave(AUXBus *bus, const char *type, uint32_t addr)
> +DeviceState *aux_create_slave(AUXBus *bus, const char *type)
>  {
>      DeviceState *dev;
>
>      dev = DEVICE(object_new(type));
>      assert(dev);
>      qdev_set_parent_bus(dev, &bus->qbus);
> -    qdev_init_nofail(dev);
> -    aux_bus_map_device(AUX_BUS(qdev_get_parent_bus(dev)), AUX_SLAVE(dev), addr);
>      return dev;
>  }
>
> diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
> index 68ade8a..c15b444 100644
> --- a/include/hw/misc/auxbus.h
> +++ b/include/hw/misc/auxbus.h
> @@ -123,6 +123,18 @@ I2CBus *aux_get_i2c_bus(AUXBus *bus);
>   */
>  void aux_init_mmio(AUXSlave *aux_slave, MemoryRegion *mmio);
>
> -DeviceState *aux_create_slave(AUXBus *bus, const char *name, uint32_t addr);
> +/* aux_create_slave: Create a new device on an AUX bus
> + *
> + * @bus The AUX bus for the new device.
> + * @name The type of the device to be created.
> + */
> +DeviceState *aux_create_slave(AUXBus *bus, const char *name);
> +
> +/* aux_map_slave: Map the mmio for an AUX slave on the bus.
> + *
> + * @dev The AUX slave.
> + * @addr The address for the slave's mmio.
> + */
> +void aux_map_slave(AUXSlave *dev, hwaddr addr);
>
>  #endif /* HW_MISC_AUXBUS_H */
> --
> 1.8.3.1
>
>
