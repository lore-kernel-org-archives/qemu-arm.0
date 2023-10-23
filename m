Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1359529ejb;
        Mon, 23 Oct 2023 06:22:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTEm2oqtC1aZ/eUG9Sd9L6IRKjiENcwuboO/QvXrnoRoC6q7mXysqacrVCsvvFDZjh/L8C
X-Received: by 2002:a05:6214:b61:b0:66d:d6b:f259 with SMTP id ey1-20020a0562140b6100b0066d0d6bf259mr10616029qvb.40.1698067353427;
        Mon, 23 Oct 2023 06:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698067353; cv=none;
        d=google.com; s=arc-20160816;
        b=YEBxrtmGiPCtazLgc3+F4kcptnDVKNgWUr/RzImAl1h3VyQenteD3StovqhI9P4JW8
         nb8p13QBZ7KF6x9p1z4pkg8RlgmJV6pT8rOqJZwv7OYKVP9/7aDX9BqDlBiTQj6x5scs
         Baf8q07oGl1AJxqWktsfNV72qRjKQ90ckPtPuHhfxit1xLa7UF8PCqZu3d8iVfaGfOp0
         PNsVyYddW+pXqqTBh4Go9qcPQ5DfzaZdB8W1qDGC+4t2P34LSzY9XSUnkHSH4a4XpgVS
         qtz+R98kSOimh1d0e8G+ufVXrB0tF9a1Wq3ohd+1STd8XfwUmiBP3uLwzfVnFV/4WnQL
         o0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HxSbq0sc1ZAr/JRiYAFnmYeY89c5LKmxBzgT1ddDD7c=;
        fh=KKgV8yGdO3wefit931VWUmQYSs/U8T0jotN22bZqjuQ=;
        b=dr26hvZscQsZQg66BmWQEtlVTzqBrrz8HNCu5GzTEkRPn4REzx/wchjWgKd0yULhHU
         d/4rW3UxgRTLx9XttqxlvbE8ICta6T3fdF9DzlUnqE/HUxliLuBkrgnT1GTSqnrTfDJq
         YAXqVthJJ9HzXx1MNLk8Uv+EP8MUWeDYHote7SQglJDm9xlSltFm+TtVfcZW4S2wqQie
         XtjKmZzi0yWoPSs0bu43MGkhczz0b8lcE9fnsf0OAnHhfmGIAu/MXY6umKyZuJYZZdU6
         OEa76+/OWz/wKeH2mi/Dl7x7ANZESlT6HIGTdEPmcLmiA9SjLjdpY72oTvVA6DC/dwj2
         0MCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i0ujRFao;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op29-20020a056214459d00b0066d03c645a1si5674767qvb.274.2023.10.23.06.22.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 06:22:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i0ujRFao;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quusg-0007dQ-AO; Mon, 23 Oct 2023 09:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1quusf-0007dH-MG
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 09:22:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1quusd-0003H5-CZ
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 09:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698067321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HxSbq0sc1ZAr/JRiYAFnmYeY89c5LKmxBzgT1ddDD7c=;
 b=i0ujRFao0Keb4RwUJpJ5YEkLNlDabgO/rHVZGoFR0iJQgo6RYccSsNagTdgbg3ldJgCJEx
 m10+rSqZCcCV33V6q1N+JfdVQJm5JQlu9M5Ks6SKS5DoIaba+UR7OycdcVuJfI/8/gMJoi
 nR0ShOlYFErmaUMxV2aq1kXrR/Tj3aA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-8hNr3b5gOACm70uJ_rZqQg-1; Mon, 23 Oct 2023 09:22:00 -0400
X-MC-Unique: 8hNr3b5gOACm70uJ_rZqQg-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5400c8c6392so1227611a12.1
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 06:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698067319; x=1698672119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HxSbq0sc1ZAr/JRiYAFnmYeY89c5LKmxBzgT1ddDD7c=;
 b=Yne+Bzw/7XCnZSe2VXgM4QwwdWBhnR/xMr5y46QTVdZ/yoP+cKSgh2P67YqQlYz2Sd
 deZ00FpRfIb8xLOVCA6QYkslxjP6v1DFrRcw6tTKmCyerI7h/FruzBQGo56NjjB3BE/N
 KUfWn337rp5YaAEYgTNbpnZuVx26H1DWm/2P56rTa4moLJPhAvE5nKZoauOeudwEDzYv
 EJSxfSO1Q5hzeBfviD8uD0lWpW3Ud3HIpWPUBk5FF48Wn3cHGwniBSmuyCdeQG/zR6Ya
 ORCXaXfaa1VkQc2rHzKNFXsJG5oaWEDRyrvy33egoMui9i04vfxaXqSf7OwTAAZbMqut
 j+6A==
X-Gm-Message-State: AOJu0YxWPu6Gw6gaaIztMBhXMG3/ifTu7KvqxcYQ9aQg4BnjX/NTleez
 7Zgn2VkL6pQ/l+ztCC8dF6N6ryFemT5cR8t/Igb6ErvJs1tckT4lTW2ZmIDYfF9dhFE+rlrvZRm
 7G3MzWK76pkep/maIbhJdqlQdRZXP
X-Received: by 2002:a05:6402:278d:b0:53f:be89:4e4b with SMTP id
 b13-20020a056402278d00b0053fbe894e4bmr7146059ede.4.1698067319181; 
 Mon, 23 Oct 2023 06:21:59 -0700 (PDT)
X-Received: by 2002:a05:6402:278d:b0:53f:be89:4e4b with SMTP id
 b13-20020a056402278d00b0053fbe894e4bmr7146039ede.4.1698067318893; Mon, 23 Oct
 2023 06:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
 <20231023113047.2572137-18-marcandre.lureau@redhat.com>
 <1bb1f023-0618-5dad-c269-07bb010f5a14@eik.bme.hu>
In-Reply-To: <1bb1f023-0618-5dad-c269-07bb010f5a14@eik.bme.hu>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 23 Oct 2023 17:21:47 +0400
Message-ID: <CAMxuvayrAdnPdskWzc1_1kJu6J8oHsGuYrcR10_QwGavPzXSBA@mail.gmail.com>
Subject: Re: [PATCH v5 17/19] hw/sm501: allow compiling without PIXMAN
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-ppc@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3aqhl1CdnISt

Hi

On Mon, Oct 23, 2023 at 5:15=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:
>
> On Mon, 23 Oct 2023, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Drop the "x-pixman" property and use fallback path in such case.
>
> Patch diverged from commit message, the x-pixman property is not dropped
> just the default changed. Needs updated commit message to reflect that.
>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> > hw/display/sm501.c | 59 +++++++++++++++++++++++++++++++++-------------
> > 1 file changed, 42 insertions(+), 17 deletions(-)
> >
> > diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> > index 0eecd00701..282671d1b3 100644
> > --- a/hw/display/sm501.c
> > +++ b/hw/display/sm501.c
> > @@ -438,6 +438,12 @@
> > #define SM501_HWC_WIDTH                 64
> > #define SM501_HWC_HEIGHT                64
> >
> > +#ifdef CONFIG_PIXMAN
> > +#define DEFAULT_X_PIXMAN 7
> > +#else
> > +#define DEFAULT_X_PIXMAN 0
> > +#endif
> > +
> > /* SM501 local memory size taken from "linux/drivers/mfd/sm501.c" */
> > static const uint32_t sm501_mem_local_size[] =3D {
> >     [0] =3D 4 * MiB,
> > @@ -730,7 +736,6 @@ static void sm501_2d_operation(SM501State *s)
> >     switch (cmd) {
> >     case 0: /* BitBlt */
> >     {
> > -        static uint32_t tmp_buf[16384];
> >         unsigned int src_x =3D (s->twoD_source >> 16) & 0x01FFF;
> >         unsigned int src_y =3D s->twoD_source & 0xFFFF;
> >         uint32_t src_base =3D s->twoD_source_base & 0x03FFFFFF;
> > @@ -828,9 +833,11 @@ static void sm501_2d_operation(SM501State *s)
> >                 de =3D db + (width + (height - 1) * dst_pitch) * bypp;
> >                 overlap =3D (db < se && sb < de);
> >             }
> > +#ifdef CONFIG_PIXMAN
> >             if (overlap && (s->use_pixman & BIT(2))) {
> >                 /* pixman can't do reverse blit: copy via temporary */
> >                 int tmp_stride =3D DIV_ROUND_UP(width * bypp, sizeof(ui=
nt32_t));
> > +                static uint32_t tmp_buf[16384];
> >                 uint32_t *tmp =3D tmp_buf;
> >
> >                 if (tmp_stride * sizeof(uint32_t) * height > sizeof(tmp=
_buf)) {
> > @@ -860,9 +867,12 @@ static void sm501_2d_operation(SM501State *s)
> >                                        dst_pitch * bypp / sizeof(uint32=
_t),
> >                                        8 * bypp, 8 * bypp, src_x, src_y=
,
> >                                        dst_x, dst_y, width, height);
> > -            } else {
> > +            } else
> > +#else
> > +            {
> >                 fallback =3D true;
> >             }
> > +#endif
> >             if (fallback) {
> >                 uint8_t *sp =3D s->local_mem + src_base;
> >                 uint8_t *d =3D s->local_mem + dst_base;
> > @@ -894,20 +904,23 @@ static void sm501_2d_operation(SM501State *s)
> >             color =3D cpu_to_le16(color);
> >         }
> >
> > +#ifdef CONFIG_PIXMAN
> >         if (!(s->use_pixman & BIT(0)) || (width =3D=3D 1 && height =3D=
=3D 1) ||
> >             !pixman_fill((uint32_t *)&s->local_mem[dst_base],
> >                          dst_pitch * bypp / sizeof(uint32_t), 8 * bypp,
> > -                         dst_x, dst_y, width, height, color)) {
> > -            /* fallback when pixman failed or we don't want to call it=
 */
> > -            uint8_t *d =3D s->local_mem + dst_base;
> > -            unsigned int x, y, i;
> > -            for (y =3D 0; y < height; y++) {
> > -                i =3D (dst_x + (dst_y + y) * dst_pitch) * bypp;
> > -                for (x =3D 0; x < width; x++, i +=3D bypp) {
> > -                    stn_he_p(&d[i], bypp, color);
> > +                         dst_x, dst_y, width, height, color))
> > +#endif
> > +            {
> > +                /* fallback when pixman failed or we don't want to cal=
l it */
> > +                uint8_t *d =3D s->local_mem + dst_base;
> > +                unsigned int x, y, i;
> > +                for (y =3D 0; y < height; y++) {
> > +                    i =3D (dst_x + (dst_y + y) * dst_pitch) * bypp;
> > +                    for (x =3D 0; x < width; x++, i +=3D bypp) {
> > +                        stn_he_p(&d[i], bypp, color);
> > +                    }
> >                 }
> >             }
> > -        }
> >         break;
> >     }
> >     default:
> > @@ -1875,9 +1888,15 @@ static void sm501_reset(SM501State *s)
> >     s->twoD_wrap =3D 0;
> > }
> >
> > -static void sm501_init(SM501State *s, DeviceState *dev,
> > -                       uint32_t local_mem_bytes)
> > +static bool sm501_init(SM501State *s, DeviceState *dev,
> > +                       uint32_t local_mem_bytes, Error **errp)
> > {
> > +#ifndef CONFIG_PIXMAN
> > +    if (s->use_pixman !=3D 0) {
> > +        error_setg(&error_warn, "x-pixman !=3D 0, not effective withou=
t PIXMAN");
>
> I think this should just be warn_report not an error

It's a warning (error_warn), but I will change it to warn_report()

>
> > +    }
> > +#endif
> > +
> >     s->local_mem_size_index =3D get_local_mem_size_index(local_mem_byte=
s);
> >
> >     /* local memory */
> > @@ -1916,6 +1935,7 @@ static void sm501_init(SM501State *s, DeviceState=
 *dev,
> >
> >     /* create qemu graphic console */
> >     s->con =3D graphic_console_init(dev, 0, &sm501_ops, s);
> > +    return true;
>
> and no need to add errp as we never return false so it won't be printed
> anyway.
>

ok

> > }
> >
> > static const VMStateDescription vmstate_sm501_state =3D {
> > @@ -2014,7 +2034,9 @@ static void sm501_realize_sysbus(DeviceState *dev=
, Error **errp)
> >     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> >     MemoryRegion *mr;
> >
> > -    sm501_init(&s->state, dev, s->vram_size);
> > +    if (!sm501_init(&s->state, dev, s->vram_size, errp)) {
> > +        return;
> > +    }
>
> This could be left alone too, just issuing a warning above should be
> enough, no other cahnges are needed.
>
> Regards,
> BALATON Zoltan
>
> >     if (get_local_mem_size(&s->state) !=3D s->vram_size) {
> >         error_setg(errp, "Invalid VRAM size, nearest valid size is %" P=
RIu32,
> >                    get_local_mem_size(&s->state));
> > @@ -2038,7 +2060,8 @@ static void sm501_realize_sysbus(DeviceState *dev=
, Error **errp)
> >
> > static Property sm501_sysbus_properties[] =3D {
> >     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
> > -    DEFINE_PROP_UINT8("x-pixman", SM501SysBusState, state.use_pixman, =
7),
> > +    /* this a debug option, prefer PROP_UINT over PROP_BIT for simplic=
ity */
> > +    DEFINE_PROP_UINT8("x-pixman", SM501SysBusState, state.use_pixman, =
DEFAULT_X_PIXMAN),
> >     DEFINE_PROP_END_OF_LIST(),
> > };
> >
> > @@ -2112,7 +2135,9 @@ static void sm501_realize_pci(PCIDevice *dev, Err=
or **errp)
> > {
> >     SM501PCIState *s =3D PCI_SM501(dev);
> >
> > -    sm501_init(&s->state, DEVICE(dev), s->vram_size);
> > +    if (!sm501_init(&s->state, DEVICE(dev), s->vram_size, errp)) {
> > +        return;
> > +    }
> >     if (get_local_mem_size(&s->state) !=3D s->vram_size) {
> >         error_setg(errp, "Invalid VRAM size, nearest valid size is %" P=
RIu32,
> >                    get_local_mem_size(&s->state));
> > @@ -2126,7 +2151,7 @@ static void sm501_realize_pci(PCIDevice *dev, Err=
or **errp)
> >
> > static Property sm501_pci_properties[] =3D {
> >     DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB)=
,
> > -    DEFINE_PROP_UINT8("x-pixman", SM501PCIState, state.use_pixman, 7),
> > +    DEFINE_PROP_UINT8("x-pixman", SM501PCIState, state.use_pixman, DEF=
AULT_X_PIXMAN),
> >     DEFINE_PROP_END_OF_LIST(),
> > };
> >
> >

