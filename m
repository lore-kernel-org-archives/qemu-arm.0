Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2218119wrq;
        Thu, 24 Oct 2019 04:31:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyrkHGFJ2w6ssNBtMm003T400nY6QITY2tXRbfv0Mq7I9EzBm7NLFt9sqhx8s/0fsGdqCsx
X-Received: by 2002:a05:620a:342:: with SMTP id t2mr13171285qkm.251.1571916713571;
        Thu, 24 Oct 2019 04:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571916713; cv=none;
        d=google.com; s=arc-20160816;
        b=d2QOUUNDEEwX9XYilWyQn9AxIgr0gMh/6usG08uADh1LFilibFe/77LnV+Ix59eZs5
         FdBbYxqKvUjM+vKed7517WXOwgaV6ZpelW8pgTu4W0LDkdksCOFE1CUZ8OUb/nM0YzvK
         zGnb7d3Mno30SAdeYE1PbNBnOzym5u/71VGz7e3FmWkzOPVhru1eSu4UmL4rTW9F3ZjW
         7ZJPekSTelOgNRbuY069f0/iDYuvGZPAuvuIE+RCEb2Ygvz3vC89QzdQCFgv989hst8i
         DJpcfr8VoBnqhtj+d5aRmQ+apjF/iOUsePXrtIMvFAbNx7dTJoqSPU+8zL4dAZ7ooTHf
         SI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=IVJGlbjmC8YxXRv3XhIhG4IkKHi+YOzThhNUpLQ4XfM=;
        b=CpUk3lIg9fBVQSGJD2mp3xA0b763XcH/yDQclFtk6okyXScyHtnCQ6Geb5uZMerEDF
         qRk9FTPc/q6+TOFXGEd5UooTR+Bq94hSgjD+eF7F/2nv9psk5rYQjJdQ2hYsdgmrhOdF
         JjP9cFZO0NHk0ieMwWXGInepExXuuYgogejFU6/iOIeOna5mkydsNAlHTUPD616ZVtCc
         NUt6TzX6hIu0h7h6fzj+T3YsjLXr3dyUJyREpJsL2CqhunTLXlWqO2Rexfg1pGt/P5WC
         QWNS9ZQZ4ESHSCMosYgB6jxCjTm7BfCT31m39u/p9UhpWsBISux0dnXpyaebkdKlrVv1
         xvXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k32si8226496qtd.177.2019.10.24.04.31.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 04:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNbLL-0001ht-UD
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 07:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iNb38-0003Oz-AH
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:13:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iNb36-0001SK-R1
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:13:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iNb36-0001Rv-IL
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:13:00 -0400
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BA3734627A
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 11:12:59 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id 74so14023235oie.3
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 04:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IVJGlbjmC8YxXRv3XhIhG4IkKHi+YOzThhNUpLQ4XfM=;
 b=XHEsZBeCD/CLPDAwLneC5nkqtZksCqaLXGrfQsKbx+TVXfTxxNJiNIIHCX3yhadia9
 XduvmyTKry6/8ow/QWuWjzSGG4qPyQQx9oEpVBttapVMzV8vgU3UoeTfQmFJRAWswlsZ
 XavUdwJkUy1ihN2wF3gNqsa/5Aicezxuwc1K4wmdz0bN7ahHScBztaL+r2tBvRqcsboT
 Sef3ultVw1SGsn1wLFx7Bsqrguv29LdjfrZ1+JTL1OEl+J3hXz13m8pVo+39ghZRjmwX
 FlSRB/q35yqwyq++3/zpnfutoXEIX6OrQtihuu1wdpzkvGXP8vLyiQAQpms/c9nzEnPn
 6XrA==
X-Gm-Message-State: APjAAAX8jW1VB9HkS9iP3sFPXAFBlLS2aBTz3i98+88RLRzmYim7xZgh
 5+TrN7HvU1vNDlZfkUio+FN+P+BVrIh+OOykE0o4ahWUMdaCypPVFZS+5X/JptHtp42TbH1pAj3
 7n9SkYZCuf96mu7ev+tAF3ihOT5ow
X-Received: by 2002:a05:6830:1003:: with SMTP id
 a3mr6367271otp.166.1571915579143; 
 Thu, 24 Oct 2019 04:12:59 -0700 (PDT)
X-Received: by 2002:a05:6830:1003:: with SMTP id
 a3mr6367236otp.166.1571915578846; 
 Thu, 24 Oct 2019 04:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-24-marcandre.lureau@redhat.com>
 <06288994-a5d3-038d-794e-ed63acdadd95@redhat.com>
In-Reply-To: <06288994-a5d3-038d-794e-ed63acdadd95@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 24 Oct 2019 13:12:47 +0200
Message-ID: <CAMxuvawLDSsNkoSXNprXAWVZ13FZT_WZ5V3AXyN0euT9SKa1DQ@mail.gmail.com>
Subject: Re: [PATCH v3 23/33] dp8393x: replace PROP_PTR with PROP_LINK
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oYUN/oQyxhn9

On Thu, Oct 24, 2019 at 1:02 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 10/23/19 7:31 PM, Marc-Andr=C3=A9 Lureau wrote:
> > Link property is the correct way to pass a MemoryRegion to a device
> > for DMA purposes.
> >
> > Sidenote: as a sysbus device, this remains non-usercreatable
> > even though we can drop the specific flag here.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/mips/mips_jazz.c | 3 ++-
> >   hw/net/dp8393x.c    | 7 +++----
> >   2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
> > index 8d010a0b6e..878925a963 100644
> > --- a/hw/mips/mips_jazz.c
> > +++ b/hw/mips/mips_jazz.c
> > @@ -284,7 +284,8 @@ static void mips_jazz_init(MachineState *machine,
> >               dev =3D qdev_create(NULL, "dp8393x");
> >               qdev_set_nic_properties(dev, nd);
> >               qdev_prop_set_uint8(dev, "it_shift", 2);
> > -            qdev_prop_set_ptr(dev, "dma_mr", rc4030_dma_mr);
> > +            object_property_set_link(OBJECT(dev), OBJECT(rc4030_dma_mr=
),
> > +                                     "dma_mr", &error_abort);
> >               qdev_init_nofail(dev);
> >               sysbus =3D SYS_BUS_DEVICE(dev);
> >               sysbus_mmio_map(sysbus, 0, 0x80001000);
> > diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> > index a5678e11fa..946c7a8f64 100644
> > --- a/hw/net/dp8393x.c
> > +++ b/hw/net/dp8393x.c
> > @@ -173,7 +173,7 @@ typedef struct dp8393xState {
> >       int loopback_packet;
> >
> >       /* Memory access */
> > -    void *dma_mr;
> > +    MemoryRegion *dma_mr;
> >       AddressSpace as;
> >   } dp8393xState;
> >
> > @@ -922,7 +922,8 @@ static const VMStateDescription vmstate_dp8393x =3D=
 {
> >
> >   static Property dp8393x_properties[] =3D {
> >       DEFINE_NIC_PROPERTIES(dp8393xState, conf),
> > -    DEFINE_PROP_PTR("dma_mr", dp8393xState, dma_mr),
> > +    DEFINE_PROP_LINK("dma_mr", dp8393xState, dma_mr,
> > +                     TYPE_MEMORY_REGION, MemoryRegion *),
> >       DEFINE_PROP_UINT8("it_shift", dp8393xState, it_shift, 0),
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> > @@ -936,8 +937,6 @@ static void dp8393x_class_init(ObjectClass *klass, =
void *data)
> >       dc->reset =3D dp8393x_reset;
> >       dc->vmsd =3D &vmstate_dp8393x;
> >       dc->props =3D dp8393x_properties;
> > -    /* Reason: dma_mr property can't be set */
> > -    dc->user_creatable =3D false;
>
> Patch is OK except this user_creatable change I don't understand.

It's a sysbus device, so it's not user-creatable anyway. I'll add a
commit comment.

>
> >   }
> >
> >   static const TypeInfo dp8393x_info =3D {
> >
