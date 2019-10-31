Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp150819wri;
        Thu, 31 Oct 2019 16:24:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/sbVCos3CSrad5hCHtwuroRVJ+Fs7wwPXsOGlnHaV8q0qT2wdOIZwTVidXl5srzharnEB
X-Received: by 2002:a37:2ec5:: with SMTP id u188mr7952256qkh.94.1572564241473;
        Thu, 31 Oct 2019 16:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572564241; cv=none;
        d=google.com; s=arc-20160816;
        b=fn1YzuLHyBJTw4bPyPzGCEkhMuO1gz9xU1PhfKKjtQL3pKrwxrb2iV7JQPTVzfDJP2
         gnvu2z1+mpTtCBODRtiQn/QTZEYf4zH4hNdscbnOI4WX7Ltrwk/fvgJKqrg6asnwCJgT
         e0jGIMKTlao7Na/n19J/30OMYTTi5hlR3qWVq73EExPiK7WwkbrbfDBFv8DUJkcoyWQi
         3NpIdYPb2wzec+4axyBFAHj38Kpxgawq7M+cWBQY8cq7aU/Gx3dItgtiM4Y0nCGLCvSv
         ygqGJKkO5G9HlBDKCigfGEqP8roBK97ffjGaMX6/kIHCGrzhdsymyLU4SxKiafHtlrrP
         1xcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Yqco3RnJcgXf91mMjUPYNeljm114ocmGLRg8/iiLZ1A=;
        b=NVPm7M5QiFEwpuKZt2fHaXCS/21nRFpbqZSC8NipHvBGYu21l3hb5HJ2Fc6W6vVDam
         7x8jE1obh5ZaCqlquuTQyTGpOsMzTOc0u5zS5wSNKtX8FiSvCQ/ZGwHxkPNKhMzLWgTD
         TgLywV+3UHRIsa0fVJ3ZnAtzdkkY8X3/nH2xrIAcwfxwigNVlmFTPx9YF5OjlacaVEk/
         X+auPQSnytWpzAlmwip667Wbe5Q9sgor9rtt4OaHF0OX/cRNmlqLEsJ+Q1YGzIN0RntV
         RlbZb32RXuscXKtbPGGA+QXaqOfsSJsJ11xKT45YvDnLU+i4On4f9D4GW1iJAvpxGN3V
         OvCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21si5868540qkg.331.2019.10.31.16.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 16:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iQJnM-00081D-Sa
	for alex.bennee@linaro.org; Thu, 31 Oct 2019 19:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iQJmz-0007va-WD
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 19:23:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iQJmx-0002tC-8m
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 19:23:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51744)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iQJmv-0002o0-7C
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 19:23:33 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7DE60859FE
 for <qemu-arm@nongnu.org>; Thu, 31 Oct 2019 23:23:31 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id 92so4444410wro.14
 for <qemu-arm@nongnu.org>; Thu, 31 Oct 2019 16:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AHe94hIvQZyTw8SP80G7e/YOzr4yZD+3NkCoT6MZ8rw=;
 b=bs4FmaQYlRwEw64qKb26h7mKn63lSTgn4BxRtM9UAhcBRash9pgnPaLqedWS0tif2D
 WJVNEVgzLTi/mC0/bL6if14Ur0DianbyMuzo471YDx+9DHO9V9zr5MgCRJOt2zHwb1Hw
 1bNb9m/3iF0kmrKR5Inw5fkOeYbDZ6EstzN9lXDSbYYsFC2kylP9fyz5dcXlMCZT3rsR
 YWNN0210gEbvlWysOX1WoWeD5+emDiLlYlskvtClRDKP0gjIxriESn4PQNs+CfivgHop
 cIoHpXmEAOKWf4nX/ArgBFyCO/R4cW8jg94Y5c1Rg2C5URLMWdqWs3YZ31++bO4BdMNN
 FzfA==
X-Gm-Message-State: APjAAAWCyRqT6AGVwV1SrXFRUrpkkP75fn9thjIyRp3arrlYLz8DhWTp
 dYCdWJfG9R2xwXghdoY+jU76wLIektjaM4UTGdo0d3ccAknMA6pVPgKdimPNU/SLa8y1+lW9ve8
 tCswmfus5P5Nd
X-Received: by 2002:a1c:808d:: with SMTP id b135mr7220158wmd.175.1572564210244; 
 Thu, 31 Oct 2019 16:23:30 -0700 (PDT)
X-Received: by 2002:a1c:808d:: with SMTP id b135mr7220136wmd.175.1572564209909; 
 Thu, 31 Oct 2019 16:23:29 -0700 (PDT)
Received: from [192.168.20.58] (94.222.26.109.rev.sfr.net. [109.26.222.94])
 by smtp.gmail.com with ESMTPSA id q2sm4670145wmq.30.2019.10.31.16.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2019 16:23:29 -0700 (PDT)
Subject: Re: [PATCH v5 02/13] hw/core/qdev: add trace events to help with
 resettable transition
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-3-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f5d78215-ee4d-ae1a-74dc-52b3c179d88c@redhat.com>
Date: Fri, 1 Nov 2019 00:23:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191018150630.31099-3-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-s390x@nongnu.org,
 edgari@xilinx.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hv3gKZ1h2tYF

On 10/18/19 5:06 PM, Damien Hedde wrote:
> Adds trace events to reset procedure and when updating the parent
> bus of a device.
>=20
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   hw/core/qdev.c       | 27 ++++++++++++++++++++++++---
>   hw/core/trace-events |  9 +++++++++
>   2 files changed, 33 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 60be2f2fef..f230063189 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -38,6 +38,7 @@
>   #include "hw/boards.h"
>   #include "hw/sysbus.h"
>   #include "migration/vmstate.h"
> +#include "trace.h"
>  =20
>   bool qdev_hotplug =3D false;
>   static bool qdev_hot_added =3D false;
> @@ -98,7 +99,9 @@ void qdev_set_parent_bus(DeviceState *dev, BusState *=
bus)
>       bool replugging =3D dev->parent_bus !=3D NULL;
>  =20
>       if (replugging) {
> -        /* Keep a reference to the device while it's not plugged into
> +        trace_qdev_update_parent_bus(dev, dev->parent_bus, bus);

Nitpicking, if you respin, can you add object_get_typename(OBJECT(dev)))=20
and object_get_typename(OBJECT(bus)))?

With/without it:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +        /*
> +         * Keep a reference to the device while it's not plugged into
>            * any bus, to avoid it potentially evaporating when it is
>            * dereffed in bus_remove_child().
>            */
> @@ -272,6 +275,18 @@ HotplugHandler *qdev_get_hotplug_handler(DeviceSta=
te *dev)
>       return hotplug_ctrl;
>   }
>  =20
> +static int qdev_prereset(DeviceState *dev, void *opaque)
> +{
> +    trace_qdev_reset_tree(dev, object_get_typename(OBJECT(dev)));
> +    return 0;
> +}
> +
> +static int qbus_prereset(BusState *bus, void *opaque)
> +{
> +    trace_qbus_reset_tree(bus, object_get_typename(OBJECT(bus)));
> +    return 0;
> +}
> +
>   static int qdev_reset_one(DeviceState *dev, void *opaque)
>   {
>       device_legacy_reset(dev);
> @@ -282,6 +297,7 @@ static int qdev_reset_one(DeviceState *dev, void *o=
paque)
>   static int qbus_reset_one(BusState *bus, void *opaque)
>   {
>       BusClass *bc =3D BUS_GET_CLASS(bus);
> +    trace_qbus_reset(bus, object_get_typename(OBJECT(bus)));
>       if (bc->reset) {
>           bc->reset(bus);
>       }
> @@ -290,7 +306,9 @@ static int qbus_reset_one(BusState *bus, void *opaq=
ue)
>  =20
>   void qdev_reset_all(DeviceState *dev)
>   {
> -    qdev_walk_children(dev, NULL, NULL, qdev_reset_one, qbus_reset_one=
, NULL);
> +    trace_qdev_reset_all(dev, object_get_typename(OBJECT(dev)));
> +    qdev_walk_children(dev, qdev_prereset, qbus_prereset,
> +                       qdev_reset_one, qbus_reset_one, NULL);
>   }
>  =20
>   void qdev_reset_all_fn(void *opaque)
> @@ -300,7 +318,9 @@ void qdev_reset_all_fn(void *opaque)
>  =20
>   void qbus_reset_all(BusState *bus)
>   {
> -    qbus_walk_children(bus, NULL, NULL, qdev_reset_one, qbus_reset_one=
, NULL);
> +    trace_qbus_reset_all(bus, object_get_typename(OBJECT(bus)));
> +    qbus_walk_children(bus, qdev_prereset, qbus_prereset,
> +                       qdev_reset_one, qbus_reset_one, NULL);
>   }
>  =20
>   void qbus_reset_all_fn(void *opaque)
> @@ -1108,6 +1128,7 @@ void device_legacy_reset(DeviceState *dev)
>   {
>       DeviceClass *klass =3D DEVICE_GET_CLASS(dev);
>  =20
> +    trace_qdev_reset(dev, object_get_typename(OBJECT(dev)));
>       if (klass->reset) {
>           klass->reset(dev);
>       }
> diff --git a/hw/core/trace-events b/hw/core/trace-events
> index fe47a9c8cb..1a669be0ea 100644
> --- a/hw/core/trace-events
> +++ b/hw/core/trace-events
> @@ -1,2 +1,11 @@
>   # loader.c
>   loader_write_rom(const char *name, uint64_t gpa, uint64_t size, bool =
isrom) "%s: @0x%"PRIx64" size=3D0x%"PRIx64" ROM=3D%d"
> +
> +# qdev.c
> +qdev_reset(void *obj, const char *objtype) "obj=3D%p(%s)"
> +qdev_reset_all(void *obj, const char *objtype) "obj=3D%p(%s)"
> +qdev_reset_tree(void *obj, const char *objtype) "obj=3D%p(%s)"
> +qbus_reset(void *obj, const char *objtype) "obj=3D%p(%s)"
> +qbus_reset_all(void *obj, const char *objtype) "obj=3D%p(%s)"
> +qbus_reset_tree(void *obj, const char *objtype) "obj=3D%p(%s)"
> +qdev_update_parent_bus(void *obj, void *oldp, void *newp) "obj=3D%p ol=
d_parent=3D%p new_parent=3D%p"
>=20
