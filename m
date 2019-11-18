Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp96916lfi;
        Mon, 18 Nov 2019 06:16:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbt2FrZEzuhuBJ7rh8+Gw5MLJ1PI0wD31qt2mMEomsHlCnYiYms6fymt5SlU/6NCGRP6wB
X-Received: by 2002:a17:906:298b:: with SMTP id x11mr27373421eje.257.1574086564954;
        Mon, 18 Nov 2019 06:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574086564; cv=none;
        d=google.com; s=arc-20160816;
        b=QzkwNEhc14ieszSOfNwMZk24/Ja/6m3HWWzu2iiqb7Sa6TTHDwE6hOGQlDQB5NGc5W
         Vi3auX/Hiw2TvOAhJaCdpBFmW4G17i0+b/M2TxXHmszwiJd4CZeUrcSr1NJbxJzMTsEF
         4fxr90TBTXlWl3okyJV5HZ9VljFIVOMe4Xf+nV1hNvaN+KDH/B1vnblNWyMaJbQaPXXy
         qlSInGN6QKxrp08hwge76TPD1XLoUksw2XG6eYDgS2eW+xy+63MZbZ/phhWnSSXQW5iC
         G8CQhtXfsYV6m1KvzK+Q8XQkbjAJls0c5YMaVTrr6byvaIf2bbaHD3OkbLdnfO/U07qh
         06rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=UuG3uj1aqaiNUsla+JUMynno2gyt23d76k1nIzSvyHI=;
        b=YzQI7nJ8aECILdZEHcp8J5/+LWPMq0QSvX+8IROwvfHEVVx43EUJotZrT2KpQ+kFzI
         Uuza2GSd/WbgGUyhMDVihV2lmHczlD/+tMQpT2RFfqecOTb/2MzrorHJAxuV05dGo6iN
         Hqtsx3R+x6uV9F/BvZZfkRMBiwO9lLYFUAkHQHx/AS8+hiWVtayN5vBkv28fD/vgICvj
         lOkyKh+W8AfNRqDABezwzEee1dyIKf/AnRWK6YRpOMc6s/Kov2TWnc+jew7pUcjKAAmC
         JhmK9C/oOtkN1ckZ76/222nCNDMFnC1nRBizDEvt242jMSFAnSxbz5xKAcNt/gzKzVsu
         F2Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si11782326eji.80.2019.11.18.06.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:16:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWhox-00083b-Ia
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 09:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frederic.konrad@adacore.com>) id 1iWhol-00081D-9V
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:15:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frederic.konrad@adacore.com>) id 1iWhoj-0006FI-SO
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:15:51 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:36636
 helo=smtp.eu.adacore.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
 id 1iWhoj-0006Dw-Jp; Mon, 18 Nov 2019 09:15:49 -0500
Received: from localhost (localhost [127.0.0.1])
 by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 2585F8137E;
 Mon, 18 Nov 2019 15:15:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
 by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7pGSlIZyjkEr; Mon, 18 Nov 2019 15:15:47 +0100 (CET)
Received: from localhost.localdomain (lfbn-tou-1-352-33.w86-206.abo.wanadoo.fr
 [86.206.184.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.eu.adacore.com (Postfix) with ESMTPSA id 0464A81368;
 Mon, 18 Nov 2019 15:15:43 +0100 (CET)
Subject: Re: [PATCH v3 24/33] leon3: use qemu_irq framework instead of
 callback as property
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-25-marcandre.lureau@redhat.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <ebcefe3d-6a3a-1c9e-3263-964db5033090@adacore.com>
Date: Mon, 18 Nov 2019 15:15:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191023173154.30051-25-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.98.77.210
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Paul Burton <pburton@wavecomp.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ECLzxng5Ci8Z

Hi Marc-Andr=C3=A9,

Le 10/23/19 =C3=A0 7:31 PM, Marc-Andr=C3=A9 Lureau a =C3=A9crit=C2=A0:
> "set_pin_in" property is used to define a callback mechanism where the
> device says "call the callback function, passing it an opaque cookie
> and a 32-bit value". We already have a generic mechanism for doing
> that, which is the qemu_irq. So we should just use that.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/intc/grlib_irqmp.c | 35 ++++-------------------------------
>   hw/sparc/leon3.c      |  9 +++++----
>   target/sparc/cpu.h    |  1 +
>   3 files changed, 10 insertions(+), 35 deletions(-)
>=20
> diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
> index bc78e1a14f..794c643af2 100644
> --- a/hw/intc/grlib_irqmp.c
> +++ b/hw/intc/grlib_irqmp.c
> @@ -25,6 +25,7 @@
>    */
>  =20
>   #include "qemu/osdep.h"
> +#include "hw/irq.h"
>   #include "hw/sysbus.h"
>   #include "cpu.h"
>  =20
> @@ -58,10 +59,8 @@ typedef struct IRQMP {
>  =20
>       MemoryRegion iomem;
>  =20
> -    void *set_pil_in;
> -    void *set_pil_in_opaque;
> -
>       IRQMPState *state;
> +    qemu_irq irq;
>   } IRQMP;
>  =20
>   struct IRQMPState {
> @@ -82,7 +81,6 @@ static void grlib_irqmp_check_irqs(IRQMPState *state)
>       uint32_t      pend   =3D 0;
>       uint32_t      level0 =3D 0;
>       uint32_t      level1 =3D 0;
> -    set_pil_in_fn set_pil_in;
>  =20
>       assert(state !=3D NULL);
>       assert(state->parent !=3D NULL);
> @@ -97,14 +95,8 @@ static void grlib_irqmp_check_irqs(IRQMPState *state=
)
>       trace_grlib_irqmp_check_irqs(state->pending, state->force[0],
>                                    state->mask[0], level1, level0);
>  =20
> -    set_pil_in =3D (set_pil_in_fn)state->parent->set_pil_in;
> -
>       /* Trigger level1 interrupt first and level0 if there is no level=
1 */
> -    if (level1 !=3D 0) {
> -        set_pil_in(state->parent->set_pil_in_opaque, level1);
> -    } else {
> -        set_pil_in(state->parent->set_pil_in_opaque, level0);
> -    }
> +    qemu_set_irq(state->parent->irq, level1 ?: level0);
>   }
>  =20
>   static void grlib_irqmp_ack_mask(IRQMPState *state, uint32_t mask)
> @@ -335,6 +327,7 @@ static void grlib_irqmp_init(Object *obj)
>       IRQMP *irqmp =3D GRLIB_IRQMP(obj);
>       SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);
>  =20
> +    qdev_init_gpio_out_named(DEVICE(obj), &irqmp->irq, "grlib-irq", 1)=
;
>       memory_region_init_io(&irqmp->iomem, obj, &grlib_irqmp_ops, irqmp=
,
>                             "irqmp", IRQMP_REG_SIZE);
>  =20
> @@ -343,31 +336,11 @@ static void grlib_irqmp_init(Object *obj)
>       sysbus_init_mmio(dev, &irqmp->iomem);
>   }
>  =20
> -static void grlib_irqmp_realize(DeviceState *dev, Error **errp)
> -{
> -    IRQMP *irqmp =3D GRLIB_IRQMP(dev);
> -
> -        /* Check parameters */
> -    if (irqmp->set_pil_in =3D=3D NULL) {
> -        error_setg(errp, "set_pil_in cannot be NULL.");
> -    }
> -}
> -
> -static Property grlib_irqmp_properties[] =3D {
> -    DEFINE_PROP_PTR("set_pil_in", IRQMP, set_pil_in),
> -    DEFINE_PROP_PTR("set_pil_in_opaque", IRQMP, set_pil_in_opaque),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
>   static void grlib_irqmp_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>  =20
>       dc->reset =3D grlib_irqmp_reset;
> -    dc->props =3D grlib_irqmp_properties;
> -    /* Reason: pointer properties "set_pil_in", "set_pil_in_opaque" */
> -    dc->user_creatable =3D false;

Was confused first, since we don't want this device to be user creatable.=
 But I
think that SysBusDevice has that set to "false" anyway so it's all right.

> -    dc->realize =3D grlib_irqmp_realize;
>   }
>  =20
>   static const TypeInfo grlib_irqmp_info =3D {
> diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
> index c5f1b1ee72..6db6ea9b5c 100644
> --- a/hw/sparc/leon3.c
> +++ b/hw/sparc/leon3.c
> @@ -143,9 +143,10 @@ void leon3_irq_ack(void *irq_manager, int intno)
>       grlib_irqmp_ack((DeviceState *)irq_manager, intno);
>   }
>  =20
> -static void leon3_set_pil_in(void *opaque, uint32_t pil_in)
> +static void leon3_set_pil_in(void *opaque, int n, int level)
>   {
> -    CPUSPARCState *env =3D (CPUSPARCState *)opaque;
> +    CPUSPARCState *env =3D opaque;
> +    uint32_t pil_in =3D level;
>       CPUState *cs;
>  =20
>       assert(env !=3D NULL);
> @@ -225,8 +226,8 @@ static void leon3_generic_hw_init(MachineState *mac=
hine)
>  =20
>       /* Allocate IRQ manager */
>       dev =3D qdev_create(NULL, TYPE_GRLIB_IRQMP);
> -    qdev_prop_set_ptr(dev, "set_pil_in", leon3_set_pil_in);
> -    qdev_prop_set_ptr(dev, "set_pil_in_opaque", env);
> +    env->pil_irq =3D qemu_allocate_irq(leon3_set_pil_in, env, 0);
> +    qdev_connect_gpio_out_named(dev, "grlib-irq", 0, env->pil_irq);
>       qdev_init_nofail(dev);
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, LEON3_IRQMP_OFFSET);
>       env->irq_manager =3D dev;
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index 778aa8e073..709215f8c1 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -508,6 +508,7 @@ struct CPUSPARCState {
>   #endif
>       sparc_def_t def;
>  =20
> +    qemu_irq pil_irq;
>       void *irq_manager;
>       void (*qemu_irq_ack)(CPUSPARCState *env, void *irq_manager, int i=
ntno);
>  =20
>=20

Seems ok to me.

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

Thanks,
Fred
