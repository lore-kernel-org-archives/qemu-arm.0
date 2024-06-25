Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp772424njc;
        Tue, 25 Jun 2024 13:43:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4+1tkdhKZq0WY1NlbAWfE8iqNO6DDOZMXlQTvqPIvy8Ae46AtHaqfd9AasnW7mEgyujZ4iV/OpNa9hu7X73843mDzLQ4m
X-Received: by 2002:a2e:a312:0:b0:2ec:51b6:8f32 with SMTP id 38308e7fff4ca-2ec5b36af7emr60574281fa.47.1719348225217;
        Tue, 25 Jun 2024 13:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719348225; cv=none;
        d=google.com; s=arc-20160816;
        b=p7qRrnqiuUbaLzievfhwXjy8xpofJ2fEyT6EsULzda+6cOObwTcCUiDFO9IkWmsbU4
         t2Df0rSwAzJPuF4MpUPEptHthTK/qgJqMKlbAxwlDL9p1sSaNuow6+gckZ0hJcLeLiFL
         Hx6vF04UK93YVOIQAX4y0378pRK60cQLHHN+C6Y0cbWmNlSPa4nNVw4Ruz5pCIAOJsj7
         m43JcWI0A9mJCSji4XcGp0STWbCqjaU4Alg0DehFEps/A8Ql8E95+pJZp7yTvndAg6y1
         R5vg5SXRT2+0akLqUbEONG4SKmTeXUGkWMuuFVaGgrIH+VxpXp01YWdxlAQRD4BvJ7OI
         KuSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZXIz+d5w40cdWni0TnhrWsiE2g89YSo3ZwK5XpmqL9I=;
        fh=OKfAsayTowlCRqSdj+L8O0wGszL0JAOiIUM57UH9csg=;
        b=NhtJYZuYWh/D4QRol5AkvGpiUujw5WE9JGFgWeKQg/8Uqeu6+UFSjyauQ5tetkOnY/
         f/Gwp17eWYNGS1tWax0hgXNLaU7UxqG5vNOGvH+E2m5vqrSvmG8lYtoDVd/APTN/xR4g
         9x7XIOcd0SwQzvOXoBdfwgb5nhRvobEOHHnZA3iim0wwFfODzvK2u12S0gKrA3X642BE
         VQHc+ESA0toC6sKm7HxiC0clqfIt5SIh/sgdjeNDkuQlrngUZONnKkZbCxr+OUq1WBzC
         FPAAq6D+rcl5wd7lh/9JZXlSlz8q55owgaUEGH7dJEmO3h4SvAJbD1YIzr2sPT6MfsZv
         vWBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adrUTkHt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ec4f66a365sor24390751fa.2.2024.06.25.13.43.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 25 Jun 2024 13:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adrUTkHt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719348224; x=1719953024; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXIz+d5w40cdWni0TnhrWsiE2g89YSo3ZwK5XpmqL9I=;
        b=adrUTkHtQ4dWsaKFGGnDpKDeNDr4RVPWhR98hJGbqy9Isip5T4KW2WekQ25R1KKkI5
         JVwRtsoUl2ZqCAJslLnM3LePdKVLNA8CHLAD13YYG25H/cp6aYq+DlXbdNTBKMTtjL6g
         TyCoZDqFZrDpOm02FBJY1Cb75DXpAWkvxAT2/kH3nLdckhUj10ZcicQdc+Z3H41BStxU
         9vk620LME8lVbFsApr267zDD1s/681UmOYWd1eitd0yj4AFbCHCTTwuDaK+S1qk4PSqR
         TdYSd5gx59z+R9ZB9Lr5gBo97Cg1REK8g84APHclTstPxdfG+hOlVFI5R/zm5w1Ez/Rr
         mM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719348224; x=1719953024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXIz+d5w40cdWni0TnhrWsiE2g89YSo3ZwK5XpmqL9I=;
        b=TCyvxfY2bQBb+S3enmgQ1SnUSVuprlr6Qi20TgK1oAghqrNdbNI/x7D/FjoOc5j3aA
         SMv3uVNOXSFRYrUsRmn5wPwFdul4dzSbMZADgGaOpn941/Yv6VBJTDOZL1RakFrlGm+m
         L7FoklL0Wr8MU50qIXoLXQDwpe8Eyk67313fLeGXXtdqSVR2l7JMpuVcsyJHlY4t0UDL
         RX8ISAn2trhpeLw/TaO4NvIDQCaJ8CU8jCnnj5vzvNc4GXpRG2eYeg+eKufr+LKIpPDn
         rwbNWArICvHjK7L8znyDhrxVVlz0TjD3IDoLtvS2d4ETsLbIrm2VjOx5AjxGcOnFyPuw
         JRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqapm/PodyqkUYzWg/0GvjXLu9owvLbYw/USDN4JCBqQ2R/GEwA5tQixf388R2bYUdfkThtlTT+YWag85GPfWPPbY0kYzG
X-Gm-Message-State: AOJu0YxQ3RbBqUEU+p0sF6p5fYefO7YqVC0CGtf3LgvUcPV742IrSl2x
	XRTz9LiwLvNtEt1C84L/sUdw7q5UcMw00vuKSFPiaOVUWa+W30naFkD8uKmcsz3Bm+2F1rWY4Qi
	UCwRi7I1Hpt7xLtXY0LT3RK2xNeVlKPAy2ZOkKY6j
X-Google-Smtp-Source: AGHT+IHPx0VNRvcCqOwVRYpAvJUFGUVOwXB8f6kgkCWPn4VtBKZW34UnssULVjXQAoaMWKAbiOakWr5YcFCGdYT0RY0=
X-Received: by 2002:a2e:a788:0:b0:2ec:680d:daeb with SMTP id
 38308e7fff4ca-2ec680ddb46mr37053871fa.30.1719348224549; Tue, 25 Jun 2024
 13:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <rust-pl011-rfc-v3.git.manos.pitsidianakis@linaro.org>
 <229703c7f4394691f254b02c012ee0d7dcf57afb.1718827153.git.manos.pitsidianakis@linaro.org>
 <Znrt77XOc2YBNZyM@intel.com> <ZnsXOyYJAlae1Ito@redhat.com>
In-Reply-To: <ZnsXOyYJAlae1Ito@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 21:43:33 +0100
Message-ID: <CAFEAcA-Pr1YT7=prVTukf8iNHjU1fvEvWz5-5_oR7Hgam833gQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/5] DO NOT MERGE: replace TYPE_PL011 with
 x-pl011-rust in arm virt machine
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Zhao Liu <zhao1.liu@intel.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Mads Ynddal <mads@ynddal.dk>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Gustavo Romero <gustavo.romero@linaro.org>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	rowan.hart@intel.com, Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ftERNQnfyBD1

On Tue, 25 Jun 2024 at 20:15, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Wed, Jun 26, 2024 at 12:18:55AM +0800, Zhao Liu wrote:
> > Hi Manos,
> >
> > On Wed, Jun 19, 2024 at 11:14:02PM +0300, Manos Pitsidianakis wrote:
> > > Date: Wed, 19 Jun 2024 23:14:02 +0300
> > > From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > > Subject: [RFC PATCH v3 5/5] DO NOT MERGE: replace TYPE_PL011 with
> > >  x-pl011-rust in arm virt machine
> > > X-Mailer: git-send-email 2.44.0
> > >
> > > Convenience patch for testing the rust device.
> > >
> > > Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > > ---
> > >  hw/arm/virt.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index 3c93c0c0a6..f33b58ae0d 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -912,7 +912,11 @@ static void create_uart(const VirtMachineState *=
vms, int uart,
> > >      int irq =3D vms->irqmap[uart];
> > >      const char compat[] =3D "arm,pl011\0arm,primecell";
> > >      const char clocknames[] =3D "uartclk\0apb_pclk";
> > > +#ifdef CONFIG_WITH_RUST
> > > +    DeviceState *dev =3D qdev_new("x-pl011-rust");
> > > +#else
> > >      DeviceState *dev =3D qdev_new(TYPE_PL011);
> > > +#endif
> > >      SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
> > >      MachineState *ms =3D MACHINE(vms);
> > >
> >
> > I realized that if we want to merge the rust pl011 device, then this
> > patch or similar enablement support is necessary, otherwise, the rust
> > code is only used for compilation and cannot actually be run...
> >
> > This is also an open for the devices that are rewrite in Rust.
> >
> > I think there should be an option for the user to choose whether to
> > enable pl011 in C or pl011 in Rust. What do you think?
> >
> > Perhaps the easiest way to enable rust pl011 is to add an option for
> > virt machine... But that's certainly not a long-term approach. I think
> > the ideal way would be to allow rust pl011 to be specified in the
> > command line via -device, but this approach would mean allowing the
> > user to create pl011 and would require changes to the current buildin
> > pl011's creation logic.
>
> While having both impls present is reasonable for the RFC, IMHO, if
> we're to merge this, then the Rust impl of pl011 should fully replace
> the C impl. Maintaining 2 different impls of the same device in
> parallel is highly undesirable. This would of course impl that the
> Rust impls needs to be a feature match for the existing impl. If we
> do a full replacement, then the question of how the user chooses
> between the 2 impls is then entirely avoided.

Yes, I agree this is where we want to go for the long term. For
the short term of reaching consensus on all the earlier parts of
the patch series (build system integration, how to do a rust
device model, etc), I think this patch is fine as a "don't commit this"
way to test the series. In the medium term I guess "feature-parity
both in parallel for a (hopefully) short time and then drop the C
version" ? I definitely feel we don't want a user-facing runtime
option for selecting which one, at any rate.

thanks
-- PMM
