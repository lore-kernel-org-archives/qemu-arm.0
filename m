Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2740348ejb;
        Wed, 25 Oct 2023 06:27:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS1hYEprs/Zc6cQ5CF1EBVvVGgiZCUVdggDpgxIa2bzclaLYcBQgKq/eGze6J1UFEJwVPZ
X-Received: by 2002:a05:620a:2890:b0:775:446b:860c with SMTP id j16-20020a05620a289000b00775446b860cmr16518987qkp.70.1698240461899;
        Wed, 25 Oct 2023 06:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698240461; cv=none;
        d=google.com; s=arc-20160816;
        b=VJ0iJUAc2YIRA466ajVqw+PyyLVRy8/mfnKz9aO4qjYRrnlyhry1Ps9z6e3jeu+KwJ
         3a/c8lXIMGkcCtjELd4UMySD8MedcHlVxOS3nYfCZf9IGBixO+jUcYwCMDE3TNAZvSaa
         dsteI4xaGznoVsz5ra0Rs0X1b+ALzVBUF+yfGgDNVLXdnvXqGLC98+XLO5Glgp4bzAyx
         LBZIqVVkdbzs8uECZiKmYQk2DEKalaVuyq/69xZI5fFqXp2qNhyHF0YX1PsJLEPgJIOB
         yTEz7GvSGCJYpSJ4wjguBK3SeoOe2SOCdCq4Ibb1dpPapHbaEb4HufJTp6118ubj+lRI
         of6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pilNiS4pU0CfC0m1XhMSR+2CsdHHab2yVxcsy7Ctxt8=;
        fh=PtJCBIvinW7B3gtAF+8dZxmQhnbsxbmF3dE5/qOdwzk=;
        b=Ewdh9OUikCzJJRu+Ihmv4TGl546WGJAOByMMrvJ8ULAzpmzqwJAXYBb+MlnYoUKzle
         Hlvgn2g/Aq0OfNhwhfKSbykeBdpwhZfvNQTAADnEbkgVGbwytQEJA/PZMQ8Y7F1GwNnM
         CwEjFSlxoPSwN2MTuYnwUTvibJ7edji39YWz5mBfjCo+gVZmbmlsg+1oXrdWsNkJ1bNa
         Ucj7YmeiAgEB6aDr5slZdO11R79qz+F5tFm3QNlRH8mwr1klT/rtBvxvJGhvY73e+au4
         ERVPYXqQmfb+eUFek5GyDnqw55gh9P+rD75DCm8yCEwPpks2JSg13/FC7DgsVjsF6gpa
         VxLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PZvJXYA2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de42-20020a05620a372a00b00779d8250e92si4885762qkb.657.2023.10.25.06.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 06:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PZvJXYA2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvduo-0006EZ-2N; Wed, 25 Oct 2023 09:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1qvdun-0006E6-9q
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 09:27:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1qvdul-0007E0-Ne
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 09:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698240435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pilNiS4pU0CfC0m1XhMSR+2CsdHHab2yVxcsy7Ctxt8=;
 b=PZvJXYA20N0PEgyXJc9PyTQAFo5jcIucRoDApIqBy7RjZPoJf/G9Wo+83OvaAtsok5pFKR
 ITv2rOCyA6RBj2Vrm7DL7DJUD2TZQOPNqG4BXpJ82q+m81PbbK3UFD83aaRfitWjRXfNYs
 EYo82rew4JAcoC3u3nDluXlVPotglDA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-vUlUXXdSO_mIpGM1RZvaLA-1; Wed, 25 Oct 2023 09:27:11 -0400
X-MC-Unique: vUlUXXdSO_mIpGM1RZvaLA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-53e2acda9d6so3709241a12.2
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 06:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698240430; x=1698845230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pilNiS4pU0CfC0m1XhMSR+2CsdHHab2yVxcsy7Ctxt8=;
 b=lXrIbI5iSGi7wOKJu1EAx3TBAjq4cO80mZb9NZgN1bAtDp8Z0OWypBnIDf6tDv2ipl
 G/PzKEfCvPm2ElkGBlzEHj3t0qa+AVqYPfRLTXqwhDtuGLWRxU+BWF16BFCOGoRi7bGV
 tZ2NQHdSknw3uaIql5xVZ9gYlz8KPnd1sKP4tbovqTLN7XPMUjJfDdp63E1ZuPJr/OpA
 6h77bJq6cyH7HWl8yXye1VKIfALZ3BAb6vlUwLWU2RE/6SoQJuyEj7MK9WUOAJQPuUWO
 NxIpqDNqSinQ43u0eKlzmqQu3TCmjMEYU+WyTUXqEkk41aS9ol/wZgG6L4MsgEgz+OE5
 uQuw==
X-Gm-Message-State: AOJu0Yy5oUUTkMnGDsk9qaa1TLs0fMSVV/riqEsmCxRxV4qkupOxq5dD
 BBKoYNVWrm84LKl3lXtJXOEYQsuZ+Q/1oQ4eRcADHQpAXaAZAcQngjWQTaJC1DStizhJuKCj5Nl
 P0xIGxTmzPznMZwuDtyQO84uHWm+T
X-Received: by 2002:a50:cd59:0:b0:540:16d0:cd4 with SMTP id
 d25-20020a50cd59000000b0054016d00cd4mr7766623edj.41.1698240430425; 
 Wed, 25 Oct 2023 06:27:10 -0700 (PDT)
X-Received: by 2002:a50:cd59:0:b0:540:16d0:cd4 with SMTP id
 d25-20020a50cd59000000b0054016d00cd4mr7766608edj.41.1698240430149; Wed, 25
 Oct 2023 06:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
 <20231023113047.2572137-5-marcandre.lureau@redhat.com>
 <4af29498-c70f-4969-ba71-2b30ed281ea6@redhat.com>
In-Reply-To: <4af29498-c70f-4969-ba71-2b30ed281ea6@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 25 Oct 2023 17:26:58 +0400
Message-ID: <CAMxuvayE4YQk2HsEVQxVNkVP+GFL1wrw683s7jDr5c_Moq=9Cw@mail.gmail.com>
Subject: Re: [PATCH v5 04/19] vl: move display early init before default
 devices
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, 
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: T92I4C1E7n7c

Hi

On Wed, Oct 25, 2023 at 1:56=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> On 23/10/2023 13.30, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The next commit needs to have the display registered itself before
> > creating the default VCs.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   system/vl.c | 41 +++++++++++++++++++++++------------------
> >   1 file changed, 23 insertions(+), 18 deletions(-)
> >
> > diff --git a/system/vl.c b/system/vl.c
> > index 92d29bf521..2cecb3d884 100644
> > --- a/system/vl.c
> > +++ b/system/vl.c
> > @@ -1349,6 +1349,28 @@ static void qemu_disable_default_devices(void)
> >       }
> >   }
> >
> > +static void qemu_early_display_init(void)
> > +{
> > +#if defined(CONFIG_VNC)
> > +    if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
> > +        display_remote++;
> > +    }
> > +#endif
> > +    if (dpy.type =3D=3D DISPLAY_TYPE_DEFAULT && !display_remote) {
> > +        if (!qemu_display_find_default(&dpy)) {
> > +            dpy.type =3D DISPLAY_TYPE_NONE;
> > +#if defined(CONFIG_VNC)
> > +            vnc_parse("localhost:0,to=3D99,id=3Ddefault");
> > +#endif
> > +        }
> > +    }
> > +    if (dpy.type =3D=3D DISPLAY_TYPE_DEFAULT) {
> > +        dpy.type =3D DISPLAY_TYPE_NONE;
> > +    }
> > +
> > +    qemu_display_early_init(&dpy);
> > +}
>
> So we now have qemu_early_display_init() and qemu_display_early_init() ..=
. ?
> That's very confusing, could you maybe come up with a different name for =
the
> new function?

Ok, what about qemu_setup_display() ? I'll also simplify a bit the logic th=
ere.

