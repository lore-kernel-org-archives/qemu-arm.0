Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3548383lfo;
        Wed, 16 Mar 2022 04:21:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2yFgkwdtRuUub6AOAiLeqHK2JxpildMyN2BCguTldmv48qga/DWX6xwia4SPWFE1ID4gh
X-Received: by 2002:a05:6214:519c:b0:435:9d34:548e with SMTP id kl28-20020a056214519c00b004359d34548emr24754790qvb.63.1647429671303;
        Wed, 16 Mar 2022 04:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647429671; cv=none;
        d=google.com; s=arc-20160816;
        b=RpvYBP2o2DTUb2NgkJMdisGNyBOUQsRBtnSACe/3oVMPIm9Azqg1xiqcG0GDc+YhYa
         Ykcx7BVMcq7gD8aTAjr5voh+dZIOf8lH0P2wEHmA/NyrkmQf23mnoxyldL4YO/8mQOYU
         +mjuycHxYzko3P3aYhQ8XdcJI7tNSbOcpDZxpXRXrc9vIoJXfuDA8jvfK83E1ND/DeN5
         lf4RDSKpoclWSUMwrI0+bedEEX94w4jY8qTsTgsndazxw424wwVbFquR3SuoQtePf/Yo
         4ZmCiUEtT31l32mFg9GvTDC5zB/29v407r+doypdfd+1Owczm0eLgriJlmKZiB8bgB34
         HEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/TL583DEkbDyjI2lISe6tf0W0oZtMhVFkrT7h414pGk=;
        b=f8Os82HKzqXWjoqIz+vc5sJDwA1lpBKgrTiWIIy49Ya2mjW+QcyeJR/9ForZlyf/CP
         ys4ox3O/SOO673ynxjkwEgvAbVk3KdCBo0Cf7+Q1J22GLxBfBdCB0sr71WnBiseXgV64
         iYQIq5UF+TulOoLN67WDr+rRv1u1ECRLkanPro7sB0Z+Di9rycxa9YABmTVGVwkpPNgd
         Kd0ykrwF2LuJ0ubue6jiZ0vMi+zxgOQdzsHkNKFWhW7ecEO4BVY9WRxMQ7sokKGqH9Ia
         yToVfHtDifmbyA16TGHG30QnT5ihv1fPf8gcB1HgiwVDPuiU3U8vp3pYCvs2Q5G3UmGV
         mvSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BYnNWJeX;
       spf=pass (google.com: domain of mlureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mlureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mlureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h4-20020a05622a170400b002e1dbac80d5si403251qtk.301.2022.03.16.04.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Mar 2022 04:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of mlureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BYnNWJeX;
       spf=pass (google.com: domain of mlureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mlureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647429670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TL583DEkbDyjI2lISe6tf0W0oZtMhVFkrT7h414pGk=;
	b=BYnNWJeX/FV4n5wD8ceq6ffq/z5Lj20WupZIORYAICtCFWXQ7Y5EOFzz29wEJ7TXSjXoHf
	ojft9y638Rebtlr3Y9KHhshDbIC3L+PWp7Bi6X/jbmvRP1XfJQB86sy6yrNqF5NcKlL+yg
	WhzVbq6YGYx1kqY/9+xHO5dQlfH52IE=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-BvY52xbAMG-2F6tyKy9Wtg-1; Wed, 16 Mar 2022 07:21:09 -0400
X-MC-Unique: BvY52xbAMG-2F6tyKy9Wtg-1
Received: by mail-yb1-f199.google.com with SMTP id h83-20020a25d056000000b0063380d246ceso1751556ybg.3
        for <alex.bennee@linaro.org>; Wed, 16 Mar 2022 04:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/TL583DEkbDyjI2lISe6tf0W0oZtMhVFkrT7h414pGk=;
        b=y6QbB/LeYi7vvVBpsXkGpyZEAk96hK3hS8YI+U6zjq2X0MuKHrJluBdTJGv2M16BHy
         Rhx8gkSekmiCI21xyR474cuVe6g4nnFqziX9flCtNVIZOhnQGyg0rCBwTJ5VhSkIYCrI
         hb6d9dPxV1TPwbSFLcWd1kk+Vhkc/kfgAb0zVbeP7eicnWEUGbnbyIq+kBfhNaw3txtL
         bjNAqHvYjMyO+a/ICgxm+NW7zWWfE7O18eR29GTRlfp4fDnRiWDNSJqTa2vmCLqKipxh
         I6QG9UQqOt618whMUvWZmjme8u0gcxAr8qa/4JEmS+8zil+pvd+sBXFy7kEByUpURbGz
         HIlA==
X-Gm-Message-State: AOAM532p0dqH6TRdv6TO6eyTB1W+di2rKRDfelQm1hS9JbxwLSGW0ptN
	HM/MbSCyS4i+Pexx/GFEEuhovFELcKnBgPahOCSfJtlvAa6BbPM011N01du4XW80llWtA7VTZl6
	Oh0nKdjhdkNPlUqbvU7D+uneFnenpXg23
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id r204-20020a815dd5000000b002dc19cf17acmr29007715ywb.312.1647429669295;
        Wed, 16 Mar 2022 04:21:09 -0700 (PDT)
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id
 r204-20020a815dd5000000b002dc19cf17acmr29007686ywb.312.1647429669039; Wed, 16
 Mar 2022 04:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
 <9c101703-6aff-4188-a56a-8114281f75f4@redhat.com> <20220316121535.16631f9c.pasic@linux.ibm.com>
In-Reply-To: <20220316121535.16631f9c.pasic@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 15:20:58 +0400
Message-ID: <CAMxuvayNSQxv_fkSE9z1acMk-D3bC+rxyh9q9CLzsDqyADHvNw@mail.gmail.com>
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
	"open list:Overall KVM CPUs" <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Bin Meng <bin.meng@windriver.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Peter Xu <peterx@redhat.com>, 
	Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, 
	"open list:virtio-blk" <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
	Huacai Chen <chenhuacai@kernel.org>, Eric Farman <farman@linux.ibm.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>, 
	"open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, 
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
	"open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Eduardo Habkost <eduardo@habkost.net>, 
	"open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Coiby Xu <Coiby.Xu@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: a25B8imFMrNc

Hi

On Wed, Mar 16, 2022 at 3:16 PM Halil Pasic <pasic@linux.ibm.com> wrote:
>
> On Wed, 16 Mar 2022 11:28:59 +0100
> Thomas Huth <thuth@redhat.com> wrote:
>
> > On 16/03/2022 10.53, marcandre.lureau@redhat.com wrote:
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > Replace a config-time define with a compile time condition
> > > define (compatible with clang and gcc) that must be declared prior to
> > > its usage. This avoids having a global configure time define, but als=
o
> > > prevents from bad usage, if the config header wasn't included before.
> > >
> > > This can help to make some code independent from qemu too.
> > >
> > > gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > [...]
> > > @@ -188,7 +188,7 @@ CPU_CONVERT(le, 64, uint64_t)
> > >    * a compile-time constant if you pass in a constant.  So this can =
be
> > >    * used to initialize static variables.
> > >    */
> > > -#if defined(HOST_WORDS_BIGENDIAN)
> > > +#if HOST_BIG_ENDIAN
> > >   # define const_le32(_x)                          \
> > >       ((((_x) & 0x000000ffU) << 24) |              \
> > >        (((_x) & 0x0000ff00U) <<  8) |              \
> > > @@ -211,7 +211,7 @@ typedef union {
> > >
> > >   typedef union {
> > >       float64 d;
> > > -#if defined(HOST_WORDS_BIGENDIAN)
> > > +#if HOST_BIG_ENDIAN
> > >       struct {
> > >           uint32_t upper;
> > >           uint32_t lower;
> > > @@ -235,7 +235,7 @@ typedef union {
> > >
> > >   typedef union {
> > >       float128 q;
> > > -#if defined(HOST_WORDS_BIGENDIAN)
> > > +#if HOST_BIG_ENDIAN
> > >       struct {
> > >           uint32_t upmost;
> > >           uint32_t upper;
> > > diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> > > index 0a5e67fb970e..7fdd88adb368 100644
> > > --- a/include/qemu/compiler.h
> > > +++ b/include/qemu/compiler.h
> > > @@ -7,6 +7,8 @@
> > >   #ifndef COMPILER_H
> > >   #define COMPILER_H
> > >
> > > +#define HOST_BIG_ENDIAN (__BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__)
> >
> > Why don't you do it this way instead:
> >
> > #if __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
> > #define HOST_WORDS_BIGENDIAN 1
> > #endif
> >
> > ... that way you could avoid the churn in all the other files?
> >
>
> I guess "prevents from bad usage, if the config header wasn't included
> before" from the commit message is the answer to that question. I agree
> that it is more robust. If we keep the #if defined we really can't
> differentiate between "not defined because not big-endian" and "not
> defined because the appropriate header was not included."

That's right, thanks
