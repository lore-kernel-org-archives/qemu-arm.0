Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D05FC9EC0
	for <qemu-arm@archiver.kernel.org>; Sat,  7 Mar 2026 01:16:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vygHW-0006zF-Ew; Fri, 06 Mar 2026 20:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ikerjosemartinez26@gmail.com>)
 id 1vyegZ-0002V7-Ty
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 18:34:23 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ikerjosemartinez26@gmail.com>)
 id 1vyegX-0008Lb-CB
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 18:34:23 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4833115090dso101139435e9.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 15:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772840059; cv=none;
 d=google.com; s=arc-20240605;
 b=hvb3CIkrok9OazIO38O2pjcLPzbAqcjL/RjWvHuaayEuxnJFI3a5Hmxih6SFSL/Xq9
 yUIxZ7oQt4fZvSAA8qhjEMFzdWj+Yq9fCDbgcIAsWysSPxY/gilexNnQiOJSCBHwazNF
 zSHZaueCiGrmLkIyer1OUpweaIfQj6HSa4SigwtTI1fLKbkw+Ap9JroGsLqvvXNEqh8g
 ZGc84iJJ2OT8YUtqT6DICe5+EXsgCApdA8ItUIloGnLZHFGoizDOmdH9s7LKvwt6Yb6K
 YuBZcDJ6A/6jyr/ZyX3H/zH4v6Pm0+2zqNmM7QZOTYNgw5cgiUpbnqauJsKgS67Ff/hf
 4kxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=FBEyjHpxv/JhlXX/WwMZpkg7JVNR8hqN7ZqxTEVZTPs=;
 fh=or1UIrhqY12wd+HH/Qc1BN/8AvUKccpVwJ7R0SytN84=;
 b=RDrtfPYtDQai69EVXvuRYzX/yFWy9N3xBsZg3lp5EHc6IrdYVS7oEzuEMkdXrTz/7V
 BfKmvC0FxZGcviq+120aqTIiqiPaYGJ1yNwmnFgdPahenzPXs8xJ2v5zLwa1S2GdCcN1
 CCq94pxiZO03Lt/NMUVzHjjk9Z4Q9bok0AShCz7Lie05gELKIOBKYVi0iKAY+atWOqpq
 7hy/bNz4miiv0qVLgGNCYxNu6sXsZHJ/ZLh5J5fGSGByjEh7DIPtTYAyEOHoqplArSQi
 xWqbkjtQjg75nW5cCvASnCbTHMwBfXq6W9/hM3lkw4R52oWu1YncibIiw+gNN3S+4Uz7
 01Dw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772840059; x=1773444859; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FBEyjHpxv/JhlXX/WwMZpkg7JVNR8hqN7ZqxTEVZTPs=;
 b=iA1okFgpsEg+1FDCt5NgI2pDK96Da8whCZNyesy5dgwQeq3lOcsvbq2tQ72ZPguoGv
 bO9ZBa0Xa1ayB3uxWW0wktdl5jssvp6VOIrnn5/3t5aOVBOucXrJ4ZCXZ8GrjLGOssJn
 vYheKkTmzWPoi5G+057ACRPEJmLirpL2WXYTUm96xtmJilKK8wZ13RnyhcNopaPJUSg2
 TDbRdXZtlZJoI3ddOGscbcFKDBmhPxr2wOAaCbPL/HHmVTTT5ArFiD+Yz/q1AI1BdmZ4
 U8sypaknV8O4umY8Gg00c0PHhOfbHy532HjNcIU1NP9IRXcx9U6wx67ExCgQU4l6j2ft
 J9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772840059; x=1773444859;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBEyjHpxv/JhlXX/WwMZpkg7JVNR8hqN7ZqxTEVZTPs=;
 b=axDsJIKLsNbrxiReHzC3R40YcqgQDYw8T/ixBMxF3eQ1sEDcnWJxU4fMqPLM8RBfvE
 H24tecHKWF8oGdf9TAWKTdiUb8E68iGdngutfIOs7jlaPdHSPQcR1pGehRBRikwmIYtE
 wfgMv9WIhUEwVQ/t5UsrJ9O8muQBCbdiv+wik7tuGi3zhTZ+DBAObGs0PdhAXB0cqaq1
 zVLjIBFcqgaBWI5OKr0QgmGLc/j43rkmpGcheT1j+HUlcDt0RIU4lnD5Hh9JOS23vqf6
 Olk+NlUImgWAVhHpDX3pxcgEJvQ8l2x4RoDQTB6fQXmPIcgZmSRFbrrVnPv5bsflqGwV
 4G6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrK+XioUfkdh/MDHDPs7aRDycAgi/M5OGBs/1VQTTkQD5bjQ70/h2ZrvEmsDORGjjlJKwzMNbM3w==@nongnu.org
X-Gm-Message-State: AOJu0YyAlQag6djbKqZ/vpDalVdgDbo3H1xMSJpuAlucdnaAbgSuNIBD
 yXDEpT5n5pa7WJPkgibiM5FRpj3Y3J+J+/JWUJ4ier7OxQRqDKHKN1cX7ZOhACNrrMg/FWT06d8
 7F2ORwsdvZKmhXRnmMiJBQmCY1swUNsY=
X-Gm-Gg: ATEYQzyzv9ovwQCcKKVJxz6IzofdcEu69X+3PWJ3bJLVww1HECWpRlCF9AKkTQev+p/
 B7Pwrl0mvZfEGuDiTy1wKM//ZLMM1IDqd6N5ssg38DYv3I1vc36Qwxcb1QUeUqiHrCi8MylvmKq
 n8Fh2X7BzK2TAmKsYR2pQSRogxQleOjQakhAtMvkKo65qetrtBviMlivorrRO0XU4+F9qiM4fk7
 bB2Md+Vngcdrd7Ou1SsCTRnS2WaZwd9wLA3ovIIemMH4vDkWGItnc7rSRSPyHUTYiA7P7Wob7yE
 Vo0PyY0dg15kK2Q=
X-Received: by 2002:a05:600c:b93:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-48526923bd3mr58884905e9.10.1772840059059; Fri, 06 Mar 2026
 15:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20260304212303.667141-1-vsementsov@yandex-team.ru>
 <20260304212303.667141-4-vsementsov@yandex-team.ru> <87o6l01r5z.fsf@suse.de>
In-Reply-To: <87o6l01r5z.fsf@suse.de>
From: "noreply77-demartz@thinocorp.com" <ikerjosemartinez26@gmail.com>
Date: Fri, 6 Mar 2026 16:34:07 -0700
X-Gm-Features: AaiRm50bbp00SqKk1zN60XcgK4FfBnE-EXCAqbVcDNyaxGTc0TOPTZkosOmTp9s
Message-ID: <CAMLMkj3xChSPT4Rd4ZSSoEqmzz+Vts+ULR8AK3Ta5awZEP+HsQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/18] migration: make .post_save() a void function
To: Fabiano Rosas <farosas@suse.de>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, peterx@redhat.com,
 qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f6c2ea064c637d34"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ikerjosemartinez26@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, POSSIBLE_GMAIL_PHISHER=3.173,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 06 Mar 2026 20:16:37 -0500
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000f6c2ea064c637d34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hola,

Espero que este mensaje se encuentre bien.

Con respecto a la propuesta de Vladimir de cambiar .post_save() a una
funci=C3=B3n void en el proceso de migraci=C3=B3n, Fabiano ha se=C3=B1alado=
 que este
cambio afecta actualmente la compilaci=C3=B3n en Rust.

Para evitar inconvenientes con el pr=C3=B3ximo "freeze", Fabiano ya ha suge=
rido
una soluci=C3=B3n t=C3=A9cnica para corregir este error de compatibilidad. =
Quedamos a
la espera de sus comentarios o de su aprobaci=C3=B3n para proceder con los
ajustes necesarios y asegurar que la serie de parches pueda integrarse sin
problemas.

Saludos cordiales,

Jhosenad

Jhosenad@thinocorp.com

El vie, 6 de mar de 2026, 16:21, Fabiano Rosas <farosas@suse.de> escribi=C3=
=B3:

> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:
>
> > All other handlers now have _errp() variants. Should we go this way
> > for .post_save()? Actually it's rather strange, when the vmstate do
> > successful preparations in .pre_save(), then successfully save all
> > sections and subsections, end then fail when all the state is
> > successfully transferred to the target.
> >
> > Happily, we have only three .post_save() realizations, all always
> > successful. Let's make this a rule.
> >
> > Also note, that we call .post_save() in two places, and handle
> > its (theoretical) failure inconsistently. Fix that too.
> >
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > ---
> >  docs/devel/migration/main.rst |  2 +-
> >  hw/ppc/spapr_pci.c            |  3 +--
> >  include/migration/vmstate.h   |  8 +++++++-
> >  migration/savevm.c            |  3 +--
> >  migration/vmstate.c           | 12 +++---------
> >  target/arm/machine.c          |  4 +---
> >  6 files changed, 14 insertions(+), 18 deletions(-)
> >
> > diff --git a/docs/devel/migration/main.rst
> b/docs/devel/migration/main.rst
> > index 234d280249a..2de70507640 100644
> > --- a/docs/devel/migration/main.rst
> > +++ b/docs/devel/migration/main.rst
> > @@ -439,7 +439,7 @@ The functions to do that are inside a vmstate
> definition, and are called:
> >
> >    This function is called before we save the state of one device.
> >
> > -- ``int (*post_save)(void *opaque);``
> > +- ``void (*post_save)(void *opaque);``
> >
> >    This function is called after we save the state of one device
> >    (even upon failure, unless the call to pre_save returned an error).
> > diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> > index ea998bdff15..1dc3b02659f 100644
> > --- a/hw/ppc/spapr_pci.c
> > +++ b/hw/ppc/spapr_pci.c
> > @@ -2093,14 +2093,13 @@ static int spapr_pci_pre_save(void *opaque)
> >      return 0;
> >  }
> >
> > -static int spapr_pci_post_save(void *opaque)
> > +static void spapr_pci_post_save(void *opaque)
> >  {
> >      SpaprPhbState *sphb =3D opaque;
> >
> >      g_free(sphb->msi_devs);
> >      sphb->msi_devs =3D NULL;
> >      sphb->msi_devs_num =3D 0;
> > -    return 0;
> >  }
> >
> >  static int spapr_pci_post_load(void *opaque, int version_id)
> > diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> > index 3695afd483f..85838a49aee 100644
> > --- a/include/migration/vmstate.h
> > +++ b/include/migration/vmstate.h
> > @@ -223,7 +223,13 @@ struct VMStateDescription {
> >      bool (*post_load_errp)(void *opaque, int version_id, Error **errp)=
;
> >      int (*pre_save)(void *opaque);
> >      bool (*pre_save_errp)(void *opaque, Error **errp);
> > -    int (*post_save)(void *opaque);
> > +
> > +    /*
> > +     * Unless .pre_save() fails, .post_save() is called after saving
> > +     * fields and subsections. It should not fail because at this
> > +     * point the state has potentially already been transferred.
> > +     */
> > +    void (*post_save)(void *opaque);
>
> +CC Paolo, Zhao
>
> This change breaks the rust build:
> https://gitlab.com/farosas/qemu/-/jobs/13393119755
>
>   error[E0308]: mismatched types
>      --> ../rust/migration/src/vmstate.rs:605:18
>       |
>   605 |             Some(vmstate_no_version_cb::<T, F>)
>       |             ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn
> pointer, found fn item
>       |             |
>       |             arguments to this enum variant are incorrect
>       |
>       =3D note: expected fn pointer `unsafe extern "C" fn(_) -> ()`
>                     found fn item `unsafe extern "C" fn(_) -> i32
> {vmstate_no_version_cb::<T, F, impl Into<Errno>>}`
>
>
> Is something like the following diff the right fix? It'd be nice to get
> an ack so this series doesn't miss the freeze. (CI run:
> https://gitlab.com/farosas/qemu/-/pipelines/2369688593)
>
> -- >8 --
> From 90a7b53d2b0d53692df1ef2cfe7607b13e4961d8 Mon Sep 17 00:00:00 2001
> From: Fabiano Rosas <farosas@suse.de>
> Date: Fri, 6 Mar 2026 18:53:14 -0300
> Subject: [PATCH] fixup! migration: make .post_save() a void function
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  rust/migration/src/migratable.rs |  3 +--
>  rust/migration/src/vmstate.rs    | 12 +++++++-----
>  2 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/rust/migration/src/migratable.rs
> b/rust/migration/src/migratable.rs
> index 7748aac2f2..7088c1b156 100644
> --- a/rust/migration/src/migratable.rs
> +++ b/rust/migration/src/migratable.rs
> @@ -406,10 +406,9 @@ fn pre_save(&self) -> Result<(), InvalidError> {
>          Ok(())
>      }
>
> -    fn post_save(&self) -> Result<(), InvalidError> {
> +    fn post_save(&self) {
>          let state =3D unsafe {
> Box::from_raw(self.migration_state.replace(ptr::null_mut())) };
>          drop(state);
> -        Ok(())
>      }
>
>      fn pre_load(&self) -> Result<(), InvalidError> {
> diff --git a/rust/migration/src/vmstate.rs b/rust/migration/src/vmstate.r=
s
> index edc7c70265..f34a36f680 100644
> --- a/rust/migration/src/vmstate.rs
> +++ b/rust/migration/src/vmstate.rs
> @@ -492,6 +492,11 @@ fn from(_value: InvalidError) -> Errno {
>      into_neg_errno(result)
>  }
>
> +unsafe extern "C" fn vmstate_post_save_cb<T, F: for<'a> FnCall<(&'a T,),
> ()>>(opaque: *mut c_void) {
> +    // SAFETY: the function is used in T's implementation of VMState.
> +    F::call((unsafe { &*(opaque.cast::<T>()) },));
> +}
> +
>  unsafe extern "C" fn vmstate_post_load_cb<
>      T,
>      F: for<'a> FnCall<(&'a T, u8), Result<(), impl Into<Errno>>>,
> @@ -597,12 +602,9 @@ pub const fn pre_save<F: for<'a> FnCall<(&'a T,),
> Result<(), impl Into<Errno>>>>
>      }
>
>      #[must_use]
> -    pub const fn post_save<F: for<'a> FnCall<(&'a T,), Result<(), impl
> Into<Errno>>>>(
> -        mut self,
> -        _f: &F,
> -    ) -> Self {
> +    pub const fn post_save<F: for<'a> FnCall<(&'a T,), ()>>(mut self, _f=
:
> &F) -> Self {
>          self.0.post_save =3D if F::IS_SOME {
> -            Some(vmstate_no_version_cb::<T, F>)
> +            Some(vmstate_post_save_cb::<T, F>)
>          } else {
>              None
>          };
> --
> 2.51.0
>
>
>

--000000000000f6c2ea064c637d34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hola,<br><br>Espero que este mensaje se encuentre bi=
en.<br><br>Con respecto a la propuesta de Vladimir de cambiar .post_save() =
a una funci=C3=B3n void en el proceso de migraci=C3=B3n, Fabiano ha se=C3=
=B1alado que este cambio afecta actualmente la compilaci=C3=B3n en Rust.<br=
><br>Para evitar inconvenientes con el pr=C3=B3ximo &quot;freeze&quot;, Fab=
iano ya ha sugerido una soluci=C3=B3n t=C3=A9cnica para corregir este error=
 de compatibilidad. Quedamos a la espera de sus comentarios o de su aprobac=
i=C3=B3n para proceder con los ajustes necesarios y asegurar que la serie d=
e parches pueda integrarse sin problemas.<br><br>Saludos cordiales,<br><br>=
Jhosenad<div><br></div><div data-smartmail=3D"gmail_signature"><span style=
=3D"background-color:rgb(31,31,31);color:rgb(227,227,227);font-family:&quot=
;google sans text&quot;,roboto,&quot;helvetica neue&quot;,helvetica,sans-se=
rif,&quot;noto color emoji&quot;;font-size:16px;letter-spacing:0.2px">Jhose=
nad</span>@<a href=3D"http://thinocorp.com">thinocorp.com</a></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">El vie, 6 de mar de 2026, 16:21, Fabiano Rosas &lt;<a href=3D"mailt=
o:farosas@suse.de">farosas@suse.de</a>&gt; escribi=C3=B3:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:v=
sementsov@yandex-team.ru" target=3D"_blank" rel=3D"noreferrer">vsementsov@y=
andex-team.ru</a>&gt; writes:<br>
<br>
&gt; All other handlers now have _errp() variants. Should we go this way<br=
>
&gt; for .post_save()? Actually it&#39;s rather strange, when the vmstate d=
o<br>
&gt; successful preparations in .pre_save(), then successfully save all<br>
&gt; sections and subsections, end then fail when all the state is<br>
&gt; successfully transferred to the target.<br>
&gt;<br>
&gt; Happily, we have only three .post_save() realizations, all always<br>
&gt; successful. Let&#39;s make this a rule.<br>
&gt;<br>
&gt; Also note, that we call .post_save() in two places, and handle<br>
&gt; its (theoretical) failure inconsistently. Fix that too.<br>
&gt;<br>
&gt; Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsem=
entsov@yandex-team.ru" target=3D"_blank" rel=3D"noreferrer">vsementsov@yand=
ex-team.ru</a>&gt;<br>
&gt; Reviewed-by: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">peterx@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/devel/migration/main.rst |=C2=A0 2 +-<br>
&gt;=C2=A0 hw/ppc/spapr_pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 +--<br>
&gt;=C2=A0 include/migration/vmstate.h=C2=A0 =C2=A0|=C2=A0 8 +++++++-<br>
&gt;=C2=A0 migration/savevm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 +--<br>
&gt;=C2=A0 migration/vmstate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12=
 +++---------<br>
&gt;=C2=A0 target/arm/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4=
 +---<br>
&gt;=C2=A0 6 files changed, 14 insertions(+), 18 deletions(-)<br>
&gt;<br>
&gt; diff --git a/docs/devel/migration/main.rst b/docs/devel/migration/main=
.rst<br>
&gt; index 234d280249a..2de70507640 100644<br>
&gt; --- a/docs/devel/migration/main.rst<br>
&gt; +++ b/docs/devel/migration/main.rst<br>
&gt; @@ -439,7 +439,7 @@ The functions to do that are inside a vmstate defi=
nition, and are called:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 This function is called before we save the state of one d=
evice.<br>
&gt;=C2=A0 <br>
&gt; -- ``int (*post_save)(void *opaque);``<br>
&gt; +- ``void (*post_save)(void *opaque);``<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 This function is called after we save the state of one de=
vice<br>
&gt;=C2=A0 =C2=A0 (even upon failure, unless the call to pre_save returned =
an error).<br>
&gt; diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c<br>
&gt; index ea998bdff15..1dc3b02659f 100644<br>
&gt; --- a/hw/ppc/spapr_pci.c<br>
&gt; +++ b/hw/ppc/spapr_pci.c<br>
&gt; @@ -2093,14 +2093,13 @@ static int spapr_pci_pre_save(void *opaque)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static int spapr_pci_post_save(void *opaque)<br>
&gt; +static void spapr_pci_post_save(void *opaque)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SpaprPhbState *sphb =3D opaque;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(sphb-&gt;msi_devs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sphb-&gt;msi_devs =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sphb-&gt;msi_devs_num =3D 0;<br>
&gt; -=C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int spapr_pci_post_load(void *opaque, int version_id)<br>
&gt; diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h=
<br>
&gt; index 3695afd483f..85838a49aee 100644<br>
&gt; --- a/include/migration/vmstate.h<br>
&gt; +++ b/include/migration/vmstate.h<br>
&gt; @@ -223,7 +223,13 @@ struct VMStateDescription {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool (*post_load_errp)(void *opaque, int version_i=
d, Error **errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int (*pre_save)(void *opaque);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool (*pre_save_errp)(void *opaque, Error **errp);=
<br>
&gt; -=C2=A0 =C2=A0 int (*post_save)(void *opaque);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Unless .pre_save() fails, .post_save() is calle=
d after saving<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* fields and subsections. It should not fail beca=
use at this<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* point the state has potentially already been tr=
ansferred.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 void (*post_save)(void *opaque);<br>
<br>
+CC Paolo, Zhao<br>
<br>
This change breaks the rust build:<br>
<a href=3D"https://gitlab.com/farosas/qemu/-/jobs/13393119755" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://gitlab.com/farosas/qemu/-/jobs/=
13393119755</a><br>
<br>
=C2=A0 error[E0308]: mismatched types<br>
=C2=A0 =C2=A0 =C2=A0--&gt; ../rust/migration/src/vmstate.rs:605:18<br>
=C2=A0 =C2=A0 =C2=A0 |<br>
=C2=A0 605 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Some(vmstate_no=
_version_cb::&lt;T, F&gt;)<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---- =
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn pointer, found fn item<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argum=
ents to this enum variant are incorrect<br>
=C2=A0 =C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 =3D note: expected fn pointer `unsafe extern &quot;C&q=
uot; fn(_) -&gt; ()`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found=
 fn item `unsafe extern &quot;C&quot; fn(_) -&gt; i32 {vmstate_no_version_c=
b::&lt;T, F, impl Into&lt;Errno&gt;&gt;}`<br>
<br>
<br>
Is something like the following diff the right fix? It&#39;d be nice to get=
<br>
an ack so this series doesn&#39;t miss the freeze. (CI run:<br>
<a href=3D"https://gitlab.com/farosas/qemu/-/pipelines/2369688593" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://gitlab.com/farosas/qemu/-/p=
ipelines/2369688593</a>)<br>
<br>
-- &gt;8 --<br>
From 90a7b53d2b0d53692df1ef2cfe7607b13e4961d8 Mon Sep 17 00:00:00 2001<br>
From: Fabiano Rosas &lt;<a href=3D"mailto:farosas@suse.de" target=3D"_blank=
" rel=3D"noreferrer">farosas@suse.de</a>&gt;<br>
Date: Fri, 6 Mar 2026 18:53:14 -0300<br>
Subject: [PATCH] fixup! migration: make .post_save() a void function<br>
<br>
Signed-off-by: Fabiano Rosas &lt;<a href=3D"mailto:farosas@suse.de" target=
=3D"_blank" rel=3D"noreferrer">farosas@suse.de</a>&gt;<br>
---<br>
=C2=A0rust/migration/src/migratable.rs |=C2=A0 3 +--<br>
=C2=A0rust/migration/src/vmstate.rs=C2=A0 =C2=A0 | 12 +++++++-----<br>
=C2=A02 files changed, 8 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/rust/migration/src/migratable.rs b/rust/migration/src/migratab=
le.rs<br>
index 7748aac2f2..7088c1b156 100644<br>
--- a/rust/migration/src/migratable.rs<br>
+++ b/rust/migration/src/migratable.rs<br>
@@ -406,10 +406,9 @@ fn pre_save(&amp;self) -&gt; Result&lt;(), InvalidErro=
r&gt; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ok(())<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 fn post_save(&amp;self) -&gt; Result&lt;(), InvalidError&gt;=
 {<br>
+=C2=A0 =C2=A0 fn post_save(&amp;self) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let state =3D unsafe { Box::from_raw(self=
.migration_state.replace(ptr::null_mut())) };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drop(state);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ok(())<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0fn pre_load(&amp;self) -&gt; Result&lt;(), InvalidError=
&gt; {<br>
diff --git a/rust/migration/src/vmstate.rs b/rust/migration/src/vmstate.rs<=
br>
index edc7c70265..f34a36f680 100644<br>
--- a/rust/migration/src/vmstate.rs<br>
+++ b/rust/migration/src/vmstate.rs<br>
@@ -492,6 +492,11 @@ fn from(_value: InvalidError) -&gt; Errno {<br>
=C2=A0 =C2=A0 =C2=A0into_neg_errno(result)<br>
=C2=A0}<br>
<br>
+unsafe extern &quot;C&quot; fn vmstate_post_save_cb&lt;T, F: for&lt;&#39;a=
&gt; FnCall&lt;(&amp;&#39;a T,), ()&gt;&gt;(opaque: *mut c_void) {<br>
+=C2=A0 =C2=A0 // SAFETY: the function is used in T&#39;s implementation of=
 VMState.<br>
+=C2=A0 =C2=A0 F::call((unsafe { &amp;*(opaque.cast::&lt;T&gt;()) },));<br>
+}<br>
+<br>
=C2=A0unsafe extern &quot;C&quot; fn vmstate_post_load_cb&lt;<br>
=C2=A0 =C2=A0 =C2=A0T,<br>
=C2=A0 =C2=A0 =C2=A0F: for&lt;&#39;a&gt; FnCall&lt;(&amp;&#39;a T, u8), Res=
ult&lt;(), impl Into&lt;Errno&gt;&gt;&gt;,<br>
@@ -597,12 +602,9 @@ pub const fn pre_save&lt;F: for&lt;&#39;a&gt; FnCall&l=
t;(&amp;&#39;a T,), Result&lt;(), impl Into&lt;Errno&gt;&gt;&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0#[must_use]<br>
-=C2=A0 =C2=A0 pub const fn post_save&lt;F: for&lt;&#39;a&gt; FnCall&lt;(&a=
mp;&#39;a T,), Result&lt;(), impl Into&lt;Errno&gt;&gt;&gt;&gt;(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mut self,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _f: &amp;F,<br>
-=C2=A0 =C2=A0 ) -&gt; Self {<br>
+=C2=A0 =C2=A0 pub const fn post_save&lt;F: for&lt;&#39;a&gt; FnCall&lt;(&a=
mp;&#39;a T,), ()&gt;&gt;(mut self, _f: &amp;F) -&gt; Self {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.0.post_save =3D if F::IS_SOME {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Some(vmstate_no_version_cb::&lt;=
T, F&gt;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Some(vmstate_post_save_cb::&lt;T=
, F&gt;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
-- <br>
2.51.0<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000f6c2ea064c637d34--

