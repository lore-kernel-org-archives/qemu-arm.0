Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp896930wrq;
        Wed, 13 Jun 2018 09:15:06 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLtARUm9OnhO8jYc/XoM4PxhgNrfuU2lnDAM2H8jlPMi+WBqU0eXYB0k/CdkJdfNrRAEw/G
X-Received: by 2002:a37:3147:: with SMTP id x68-v6mr4960820qkx.358.1528906506598;
        Wed, 13 Jun 2018 09:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528906506; cv=none;
        d=google.com; s=arc-20160816;
        b=h4Q7K12SylblgtdNgIfRybHEL8xF+Ydn0OJ63WOLgHF8o30ej8JVneA+K5Y88lDwHJ
         Ywm7C+hBjPMs31LqhJsKCQD1qOyKoSdRjgJiD02QKJ4rBQuQ0a0rHsQEcjtGmPm/QWiD
         YQmLTRoZjYMd0MQF8nKL+AOPcYTWu30/69U2rIp8T6lJk7Xf9TlyrESkHTyDBkaJG3Ue
         KLsPmaxb5nlZeJrMgSfVCv9UT+nacNDA+XLljOwmUhIiEMIX1LYPTZXMcmBepKumbHYH
         RrsTumFHzYMAPn9Td+ERzYPv8Rfjnl/31lLNr6+a9u4MUrATa9SzhyVLA52NLDJg/ygd
         uEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=p+UdqNlST+g+cCJu3E3OrkFW7efyPdpnmawnzfzU9Rc=;
        b=se0LNQ7RFuJkjISNY0H2PZ4Cs57/CkgRBe7T3cM5R3L3cYXY4tgDext8agf+zxQHvX
         Y9fLIE21hNJJLjytH2oCNNxCZungVzdGUJCgqj+6xDXOGNgxyfWqYbBKQuZUIsYaWsdy
         hX+BO4mYhSbvhlXcIkclgM+9uyLaLsje5tnf+/84Jf9d19VBGpAZHnbbMoxM+bMvhSD/
         KNVkl+1I7pCdkB0r4t72BQxOOnOb0fQjsvdDdWlWWpz+XsBP9++7H6BpgXIFnrVgZYWS
         8aSAhc5287J30jTChaZIRZB6f2ZM16h6sqzx96BIXuGcrk2w8qOIrp8q2XAd2gCLGDyU
         Dzig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o189-v6si3091315qkc.220.2018.06.13.09.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 09:15:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT8QM-0004yx-45
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 12:15:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fT8QE-0004yV-Ty
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 12:15:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fT8QB-0003qU-75
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 12:14:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59340 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1fT8QB-0003oE-1V; Wed, 13 Jun 2018 12:14:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BC01859BF;
	Wed, 13 Jun 2018 16:14:54 +0000 (UTC)
Received: from [10.36.118.61] (unknown [10.36.118.61])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73FDE1116706;
	Wed, 13 Jun 2018 16:14:37 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20180612104430.25745-1-kraxel@redhat.com>
	<20180612104430.25745-6-kraxel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <4aa5fc41-7c7f-dfc5-f41d-b55d5222faf0@redhat.com>
Date: Wed, 13 Jun 2018 18:14:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180612104430.25745-6-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 16:14:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 16:14:54 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PULL 5/8] object: fix
 OBJ_PROP_LINK_UNREF_ON_RELEASE ambivalence
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
Cc: Corey Minyard <minyard@acm.org>, Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Zhang Chen <zhangckid@gmail.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f7PkAvZenK+5

On 12/06/2018 12:44, Gerd Hoffmann wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> A link property can be set during creation, with
> object_property_add_link() and later with object_property_set_link().
>=20
> add_link() doesn't add a reference to the target object, while
> set_link() does.
>=20
> Furthemore, OBJ_PROP_LINK_UNREF_ON_RELEASE flags, set during add_link,
> says whether a reference must be released when the property is destroye=
d.
> This can lead to leaks if the property was later set_link(), as the
> added reference is never released.
>=20
> Instead, rename OBJ_PROP_LINK_UNREF_ON_RELEASE to OBJ_PROP_LINK_STRONG
> and use that has an indication on how the link handle reference
> management in set_link().

The difference between add_link() and set_link() is a bit confusing.
Maybe we can mention it explicitly in the documentation of the two
functions, and also explain the rationale for add_link() not ref'ing the
object?

Also, more immediately:

>      /* Unref the link pointer when the property is deleted */

This is wrong now.

Paolo

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Message-id: 20180531195119.22021-3-marcandre.lureau@redhat.com
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

 ---
>  include/qom/object.h      | 12 +++++++++---
>  hw/core/qdev-properties.c |  2 +-
>  hw/core/qdev.c            |  2 +-
>  hw/display/xlnx_dp.c      |  2 +-
>  hw/dma/xilinx_axidma.c    |  4 ++--
>  hw/dma/xlnx-zdma.c        |  2 +-
>  hw/i386/pc.c              |  2 +-
>  hw/i386/pc_piix.c         |  2 +-
>  hw/i386/pc_q35.c          |  2 +-
>  hw/ipmi/ipmi.c            |  2 +-
>  hw/net/xilinx_axienet.c   |  4 ++--
>  hw/ssi/xilinx_spips.c     |  2 +-
>  net/can/can_host.c        |  2 +-
>  net/colo-compare.c        |  2 +-
>  qom/object.c              |  8 +++++---
>  target/arm/cpu.c          |  4 ++--
>  ui/console.c              |  2 +-
>  17 files changed, 32 insertions(+), 24 deletions(-)
>=20
> diff --git a/include/qom/object.h b/include/qom/object.h
> index a0c78c76f7..f3d2308d56 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1103,6 +1103,11 @@ char *object_property_get_str(Object *obj, const=
 char *name,
>   * @errp: returns an error if this function fails
>   *
>   * Writes an object's canonical path to a property.
> + *
> + * If the link property was created with
> + * <code>OBJ_PROP_LINK_STRONG</code> bit, the old target object is
> + * unreferenced, and a reference is added to the new target object.
> + *
>   */
>  void object_property_set_link(Object *obj, Object *value,
>                                const char *name, Error **errp);
> @@ -1394,7 +1399,7 @@ void object_property_add_child(Object *obj, const=
 char *name,
> =20
>  typedef enum {
>      /* Unref the link pointer when the property is deleted */
> -    OBJ_PROP_LINK_UNREF_ON_RELEASE =3D 0x1,
> +    OBJ_PROP_LINK_STRONG =3D 0x1,
>  } ObjectPropertyLinkFlags;
> =20
>  /**
> @@ -1432,8 +1437,9 @@ void object_property_allow_set_link(const Object =
*, const char *,
>   * link property.  The reference count for <code>*@child</code> is
>   * managed by the property from after the function returns till the
>   * property is deleted with object_property_del().  If the
> - * <code>@flags</code> <code>OBJ_PROP_LINK_UNREF_ON_RELEASE</code> bit=
 is set,
> - * the reference count is decremented when the property is deleted.
> + * <code>@flags</code> <code>OBJ_PROP_LINK_STRONG</code> bit is set,
> + * the reference count is decremented when the property is deleted or
> + * modified.
>   */
>  void object_property_add_link(Object *obj, const char *name,
>                                const char *type, Object **child,
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 989778ab7f..35072dec1e 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -1308,7 +1308,7 @@ static void create_link_property(Object *obj, Pro=
perty *prop, Error **errp)
>      object_property_add_link(obj, prop->name, prop->link_type,
>                               child,
>                               qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             OBJ_PROP_LINK_STRONG,
>                               errp);
>  }
> =20
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index ffec461791..cf0db4b6da 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -409,7 +409,7 @@ void qdev_init_gpio_out_named(DeviceState *dev, qem=
u_irq *pins,
>          object_property_add_link(OBJECT(dev), propname, TYPE_IRQ,
>                                   (Object **)&pins[i],
>                                   object_property_allow_set_link,
> -                                 OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                                 OBJ_PROP_LINK_STRONG,
>                                   &error_abort);
>          g_free(propname);
>      }
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index c32ab083f8..51301220e8 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1223,7 +1223,7 @@ static void xlnx_dp_init(Object *obj)
>      object_property_add_link(obj, "dpdma", TYPE_XLNX_DPDMA,
>                               (Object **) &s->dpdma,
>                               xlnx_dp_set_dpdma,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             OBJ_PROP_LINK_STRONG,
>                               &error_abort);
> =20
>      /*
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 9b48103574..401a328e27 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -525,12 +525,12 @@ static void xilinx_axidma_realize(DeviceState *de=
v, Error **errp)
>      object_property_add_link(OBJECT(ds), "dma", TYPE_XILINX_AXI_DMA,
>                               (Object **)&ds->dma,
>                               object_property_allow_set_link,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             OBJ_PROP_LINK_STRONG,
>                               &local_err);
>      object_property_add_link(OBJECT(cs), "dma", TYPE_XILINX_AXI_DMA,
>                               (Object **)&cs->dma,
>                               object_property_allow_set_link,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             OBJ_PROP_LINK_STRONG,
>                               &local_err);
>      if (local_err) {
>          goto xilinx_axidma_realize_fail;
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index 8eea757aff..b6745f5bcf 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -787,7 +787,7 @@ static void zdma_init(Object *obj)
>      object_property_add_link(obj, "dma", TYPE_MEMORY_REGION,
>                               (Object **)&s->dma_mr,
>                               qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             OBJ_PROP_LINK_STRONG,
>                               &error_abort);
>  }
> =20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index f3befe6721..ea57a46f81 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -483,7 +483,7 @@ void pc_cmos_init(PCMachineState *pcms,
>                               TYPE_ISA_DEVICE,
>                               (Object **)&pcms->rtc,
>                               object_property_allow_set_link,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE, &error_ab=
ort);
> +                             OBJ_PROP_LINK_STRONG, &error_abort);
>      object_property_set_link(OBJECT(pcms), OBJECT(s),
>                               "rtc_state", &error_abort);
> =20
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 3d81136065..d2f0d60361 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -289,7 +289,7 @@ static void pc_init1(MachineState *machine,
>                                   TYPE_HOTPLUG_HANDLER,
>                                   (Object **)&pcms->acpi_dev,
>                                   object_property_allow_set_link,
> -                                 OBJ_PROP_LINK_UNREF_ON_RELEASE, &erro=
r_abort);
> +                                 OBJ_PROP_LINK_STRONG, &error_abort);
>          object_property_set_link(OBJECT(machine), OBJECT(piix4_pm),
>                                   PC_MACHINE_ACPI_DEVICE_PROP, &error_a=
bort);
>      }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index b60cbb9266..5be6ef73bb 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -194,7 +194,7 @@ static void pc_q35_init(MachineState *machine)
>                               TYPE_HOTPLUG_HANDLER,
>                               (Object **)&pcms->acpi_dev,
>                               object_property_allow_set_link,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE, &error_ab=
ort);
> +                             OBJ_PROP_LINK_STRONG, &error_abort);
>      object_property_set_link(OBJECT(machine), OBJECT(lpc),
>                               PC_MACHINE_ACPI_DEVICE_PROP, &error_abort=
);
> =20
> diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c
> index 9be281fd87..63c031703d 100644
> --- a/hw/ipmi/ipmi.c
> +++ b/hw/ipmi/ipmi.c
> @@ -104,7 +104,7 @@ void ipmi_bmc_find_and_link(Object *obj, Object **b=
mc)
>  {
>      object_property_add_link(obj, "bmc", TYPE_IPMI_BMC, bmc,
>                               isa_ipmi_bmc_check,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             OBJ_PROP_LINK_STRONG,
>                               &error_abort);
>  }
> =20
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index d4c2c89dc1..cc880a3d08 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -951,12 +951,12 @@ static void xilinx_enet_realize(DeviceState *dev,=
 Error **errp)
>      object_property_add_link(OBJECT(ds), "enet", "xlnx.axi-ethernet",
>                               (Object **) &ds->enet,
>                               object_property_allow_set_link,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             OBJ_PROP_LINK_STRONG,
>                               &local_err);
>      object_property_add_link(OBJECT(cs), "enet", "xlnx.axi-ethernet",
>                               (Object **) &cs->enet,
>                               object_property_allow_set_link,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             OBJ_PROP_LINK_STRONG,
>                               &local_err);
>      if (local_err) {
>          goto xilinx_enet_realize_fail;
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 03f5faee4b..f599025956 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -1346,7 +1346,7 @@ static void xlnx_zynqmp_qspips_init(Object *obj)
>      object_property_add_link(obj, "stream-connected-dma", TYPE_STREAM_=
SLAVE,
>                               (Object **)&rq->dma,
>                               object_property_allow_set_link,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             OBJ_PROP_LINK_STRONG,
>                               NULL);
>  }
> =20
> diff --git a/net/can/can_host.c b/net/can/can_host.c
> index c3d26521cd..c79347abab 100644
> --- a/net/can/can_host.c
> +++ b/net/can/can_host.c
> @@ -77,7 +77,7 @@ static void can_host_instance_init(Object *obj)
>      object_property_add_link(obj, "canbus", TYPE_CAN_BUS,
>                               (Object **)&ch->bus,
>                               object_property_allow_set_link,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             OBJ_PROP_LINK_STRONG,
>                               &error_abort);
>  }
> =20
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index c3a2be4c90..dd745a491b 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -980,7 +980,7 @@ static void colo_compare_init(Object *obj)
>      object_property_add_link(obj, "iothread", TYPE_IOTHREAD,
>                              (Object **)&s->iothread,
>                              object_property_allow_set_link,
> -                            OBJ_PROP_LINK_UNREF_ON_RELEASE, NULL);
> +                            OBJ_PROP_LINK_STRONG, NULL);
> =20
>      s->vnet_hdr =3D false;
>      object_property_add_bool(obj, "vnet_hdr_support", compare_get_vnet=
_hdr,
> diff --git a/qom/object.c b/qom/object.c
> index cb7a8cd589..e6462f289c 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1564,9 +1564,11 @@ static void object_set_link_property(Object *obj=
, Visitor *v,
>          return;
>      }
> =20
> -    object_ref(new_target);
>      *child =3D new_target;
> -    object_unref(old_target);
> +    if (prop->flags =3D=3D OBJ_PROP_LINK_STRONG) {
> +        object_ref(new_target);
> +        object_unref(old_target);
> +    }
>  }
> =20
>  static Object *object_resolve_link_property(Object *parent, void *opaq=
ue, const gchar *part)
> @@ -1581,7 +1583,7 @@ static void object_release_link_property(Object *=
obj, const char *name,
>  {
>      LinkProperty *prop =3D opaque;
> =20
> -    if ((prop->flags & OBJ_PROP_LINK_UNREF_ON_RELEASE) && *prop->child=
) {
> +    if ((prop->flags & OBJ_PROP_LINK_STRONG) && *prop->child) {
>          object_unref(*prop->child);
>      }
>      g_free(prop);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5d60893a07..ab047b9402 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -690,7 +690,7 @@ static void arm_cpu_post_init(Object *obj)
>                                   TYPE_MEMORY_REGION,
>                                   (Object **)&cpu->secure_memory,
>                                   qdev_prop_allow_set_link_before_reali=
ze,
> -                                 OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                                 OBJ_PROP_LINK_STRONG,
>                                   &error_abort);
>  #endif
>      }
> @@ -718,7 +718,7 @@ static void arm_cpu_post_init(Object *obj)
>      if (arm_feature(&cpu->env, ARM_FEATURE_M_SECURITY)) {
>          object_property_add_link(obj, "idau", TYPE_IDAU_INTERFACE, &cp=
u->idau,
>                                   qdev_prop_allow_set_link_before_reali=
ze,
> -                                 OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                                 OBJ_PROP_LINK_STRONG,
>                                   &error_abort);
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_initsvtor_prope=
rty,
>                                   &error_abort);
> diff --git a/ui/console.c b/ui/console.c
> index ef1247f872..bc58458ee8 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1287,7 +1287,7 @@ static QemuConsole *new_console(DisplayState *ds,=
 console_type_t console_type,
>      object_property_add_link(obj, "device", TYPE_DEVICE,
>                               (Object **)&s->device,
>                               object_property_allow_set_link,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             OBJ_PROP_LINK_STRONG,
>                               &error_abort);
>      object_property_add_uint32_ptr(obj, "head",
>                                     &s->head, &error_abort);
>=20

