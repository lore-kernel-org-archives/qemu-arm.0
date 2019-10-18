Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1216964wrm;
        Fri, 18 Oct 2019 10:37:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxB4+8Uuv1fffV2KfyNO9KD6e4MFmab0hGPPKJ2Y8KKBEv88TK6DLbc/t3l4KUfh6ikksXM
X-Received: by 2002:a05:6402:21c7:: with SMTP id bi7mr10978352edb.205.1571420266386;
        Fri, 18 Oct 2019 10:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571420266; cv=none;
        d=google.com; s=arc-20160816;
        b=fbOPwJ74Z23fiHB1HJp3QtZqYZxl39T1EPiEsiJhVaKfWfwCLk79b1Z8HR3bw8QO8C
         pIH4YYNeSR/m/fTXdTxinB/6DMJkZAK4GBLkWRb/Pcebrd+555eG6uJfG+ikeDkf3bX0
         zCdTpGCKefoCHm6c7PFyYH6cgXnluWavtBVQX7dntEBEXCkk37ldCPholfU07VvVngeY
         yQY87kQZ9/kuv3s5ptb6L9Ku4VdAJpleY8xap4IHdQC2WECjyaX1uJPM2FwlnvlZqSCi
         cpSMN+aiqortIkOnrZZNVa6Y2mIrjopxOxFKx65oN2+Hgv03lL8eZmKg+tb5hL6EfD88
         PM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=q3Dgggzvmh33bgxoFL75y/5zguo8PaVi4JqFgwckaVI=;
        b=GZ9ejlXKPohiHdfhr273kHO30SWqH1BdiirjnFph//WCpVM6eRApS0UF9pyKbE3ISC
         vwEaGqybXOlt/EKYxDq86wB7X+Eio/qvUYLMKQVMT7TxENNrgjXbWWP9kEutYmnIjg4G
         Hm2ZU8xZ0ed2ow26bZa5sRPzfuLYOu2DQrVOuZI28PyDQM91fSMIsLc77i05QpyL5kpj
         cO7w3yMx6v6Eiy0nKQsfpYSXPG3iJCew+CYpPc7LxWdjhdf5WtZ/5VHo1yKXiqerycJt
         OIhodpbjzHcvLddR10lKViMWy8fhG1X+CGcwZBNGBom/tyzrtuNnSOAx+5WnAuY0YB1I
         GHFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mDonSJbM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17si3795248ejy.374.2019.10.18.10.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mDonSJbM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWC9-0001W7-6q
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLWBz-0001Vd-QU
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:37:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLWBy-0007ao-CZ
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:37:35 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLWBy-0007Zu-6Y
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:37:34 -0400
Received: by mail-ot1-x344.google.com with SMTP id 60so5664324otu.0
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q3Dgggzvmh33bgxoFL75y/5zguo8PaVi4JqFgwckaVI=;
 b=mDonSJbMtU2D/Iix8aA8+u2Ov059+VZg/xRm9n6lgXLIrqvdGqoeVE1cQKGHl2C4ad
 Pvrc0pdhqMIgBvNhNIynyG0k58IO8JEHeK/RgfYgQshFjtLUj1KhuOkSu33dQaG5PYfD
 vRmOXUNUtAYkpywon/HYXU3sA8oSeK+SWkO8rNxunXmLGU5LBKCLcgI1lhO4tt0kBhyJ
 XNiMayyzk1jvqq4G6hX2IaL6CW0JdpsTDhqp7sb/lY7UVbGMDatWn1pdEW18TiEfeox0
 5vofXHKQbixW+oZdKNFNwmleQkk/aJtzH6nnkWd3EoisCJ6YK1PxDnWSgwW2DDf2ejVE
 mkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q3Dgggzvmh33bgxoFL75y/5zguo8PaVi4JqFgwckaVI=;
 b=D9WplgbbQINHTW6QBYf3QAwtMrntMtCPTOumZ52V0RFOvUqnvaNeTCyrAO929ugCVJ
 oFn8Vdhigb866veTofRFEHphE5jAacPowqWxU/nY7DM7PUb5RBXrJlKoD7oH3I3qlrsq
 +sUYfN09hsQKCgb46/1ybaWEx0EBG4JQFZ0+N4gupWiW1ohiudcktqRdir0U2L3Fk/Jq
 v0jO32ozT+Eo8wK6DeyE3QczhRRpb4AdXchowsn5J6gyIeKrMTjI2u5jghiyE0kgzbMn
 ZQKIXXUNMaoKbXFb1BfNdlfAu2I1nZb8uBhJN+kuhxGX2J8SqLEDCwQK3yP6ZO3jVzFl
 VSnA==
X-Gm-Message-State: APjAAAVQYHYy2I1e7P24lC7rZ3m1PuUlAk0/znXdgWpqLsQ7Y0uYWYkc
 RBxDcHU3Ym3yByXA2epUybX5ieIGiIPKgdz0hyOD3g==
X-Received: by 2002:a05:6830:ca:: with SMTP id
 x10mr8154761oto.221.1571420253150; 
 Fri, 18 Oct 2019 10:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-9-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-9-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 18:37:22 +0100
Message-ID: <CAFEAcA_vpmUn4+GZEmUpYw4rQyE2irwgBs9oSQvTrDcv-7Buog@mail.gmail.com>
Subject: Re: [PATCH 08/14] cris: replace PROP_PTR with PROP_LINK for interrupt
 vector
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SycIBrzPuU1B

On Fri, 18 Oct 2019 at 16:43, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Instead of using raw interrupt vector pointer, store the associated
> CPU with a link property.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

A link property is reasonable for a tightly coupled CPU and
interrupt-controller. But in this case the binding is not
actually very tight, and we can avoid it.

> @@ -298,7 +296,7 @@ void axisdev88_init(MachineState *machine)
>
>      dev =3D qdev_create(NULL, "etraxfs,pic");
>      /* FIXME: Is there a proper way to signal vectors to the CPU core?  =
*/
> -    qdev_prop_set_ptr(dev, "interrupt_vector", &env->interrupt_vector);
> +    object_property_set_link(OBJECT(dev), OBJECT(cpu), "cpu", &error_abo=
rt);

Rather than using a link property like this, we could
instead make use of the fact that a qemu_irq line is
actually capable of passing an arbitrary "int" value,
not merely a bool. To do this we would:

 * remove the FIXME comment and the ptr prop/link prop code here
 * remove the definition of the property from the PIC device

> @@ -79,9 +78,10 @@ static void pic_update(struct etrax_pic *fs)
>          }
>      }
>
> -    if (fs->interrupt_vector) {
> -        /* hack alert: ptr property */
> -        *(uint32_t*)(fs->interrupt_vector) =3D vector;
> +    if (fs->cpu) {
> +        /* hack alert: cpu link property */
> +        int32_t *int_vec =3D &fs->cpu->env.interrupt_vector;
> +        *int_vec =3D (uint32_t)vector;
>      }
>      qemu_set_irq(fs->parent_irq, !!vector);

 * here, instead of setting the CPU interrupt_vector field
   and passing !!vector to qemu_set_irq, we just pass "vector",
   so the other end gets the whole integer

 * in target/cris/cpu.c:cris_cpu_set_irq(), we add something like
   if (irq =3D=3D CRIS_CPU_IRQ) {
       /*
        * The PIC passes us the vector for the IRQ as the value it sends
        * over the qemu_irq line
        */
       cpu->interrupt_vector =3D value;
   }
   at the top of the function.

It would also be nice somewhere to have a comment documenting
that this is the semantics the CPU expects for its incoming
IRQ line. Unless anybody has a better place, then perhaps
in the part of target/cris/cpu.h that defines CRIS_CPU_IRQ.
(If the PIC followed the just-recently-invented qdev convention
of having a .h file with a comment defining the "QEMU interface"
to the device, as eg include/hw/misc/armsse-mhu.h, then that
comment would be a good place to note that its sysbus IRQ 0
has these value-is-the-vector semantics. But it doesn't.)

>  }
> @@ -164,7 +164,7 @@ static void etraxfs_pic_init(Object *obj)
>  }
>
>  static Property etraxfs_pic_properties[] =3D {
> -    DEFINE_PROP_PTR("interrupt_vector", struct etrax_pic, interrupt_vect=
or),
> +    DEFINE_PROP_LINK("cpu", struct etrax_pic, cpu, TYPE_CRIS_CPU, CRISCP=
U *),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -173,10 +173,6 @@ static void etraxfs_pic_class_init(ObjectClass *klas=
s, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>
>      dc->props =3D etraxfs_pic_properties;
> -    /*
> -     * Note: pointer property "interrupt_vector" may remain null, thus
> -     * no need for dc->user_creatable =3D false;
> -     */
>  }

Incidentally this is a sysbus device, so it's not user
creatable anyway.

thanks
-- PMM
