Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D1BD2CE17
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 08:09:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTFG5-0003Gu-1X; Wed, 10 Dec 2025 03:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubinz@google.com>) id 1vTFG0-0003G7-E7
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 03:09:09 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yubinz@google.com>) id 1vTFFx-00045V-UM
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 03:09:07 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-64175f78a6fso6912a12.0
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 00:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1765354144; x=1765958944; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lHpbgUCRB1LKllVtqXHdLrTumo6YRmCvhnYrpWvvTnY=;
 b=oV2mexJ9/0QmeXqnmKEG7DB1sQG6XPxqT+dwz84U6Lo+Yc06eLyrmBfmBq7l+UI5Ks
 5YeIAQzQQr+rUycSOT2KzLHf3uAiDVJ0Jet2ASGb+2V/iye3y0jFfo/pu1/YQCil4Svz
 a/p0jcqqCR+cG++X6iLYKAOlZV9pYLNj4YGnfwPa+A3Or7kcQqjYqVTCwjm9qxhFk0iV
 Yho1z7SL4nb27ZelpH5FsKSTBewNIHA16RCj34CkRVrspg6ewg9SfQ48BSwFn9SW0LER
 ofBcdGPP+1CIsS0VzVDSlj1YWCJOpati5D2ZJq5KNeub5Ljvuj/fZfuZiu3Gzyznroqo
 PKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765354144; x=1765958944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lHpbgUCRB1LKllVtqXHdLrTumo6YRmCvhnYrpWvvTnY=;
 b=inDLxdCphFRh8+4T1BWkO0K08UEifPd601Ba/GH+BTNgVJZ2Dljgj/cowCIhFCwn6p
 kNvzWJZd8W2oABq2/SEwC8xl/WRO7IFmaD4LcmSwElGVHHUFTXShs78cRqcWvrJ3TjGF
 zBZ8fESnJpWHxrxcZO0KM4XNOH6EOVbsJ8c07DhKcBUgxbfKOUXNFttLA58P+D/21yuZ
 BtiuTGqMhlbHC+6DgOGFSfW+tlIyeJePtUWZwOlcq6NZ8GmPIvinPCpT0b1wlw0MGE3U
 +29/RgJ/Lvy960G5wbJokFwWS8PsT237o7408YdP9nU71eP8LRqQcVenYPGszKcGUT/C
 7MyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV70QuNjdzeIYQ3IEnc+8nFx8zXjT+9SyokYGbGYU51yyLYNR/VBvtCTHrTidhIU6NSj2bQ5InLJQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy1mIyiOFj+WQcGhYKDp4+CC1j/iRoa9X41IVpr+Ts7uXRPkdNK
 8Zr2J2tkYglLxaf2SthgjnZ5YT3sG9DfQdJo7jBHJVBWsXlf9mYBuh+1UBAJw2eKnyuUiOHM+bR
 nBXYclAXtXKtUY1wZvGLeQY3f7+cbpHGESc+IT6NT
X-Gm-Gg: AY/fxX4tnxr7A5H2b+DsxXjWgOI3NzqlJuYoAJQqvqt/a0gxZJ+GJq0YMdEEhUfrW56
 +x9wZLLJFG0kmkXP4OsSkA00cgP5GAXcmXa5HiCPkOQ6rs7uv4DZaqeXzBqFonInibPsTSf+m63
 g06QmxeQ6kc50U1CSa1s1geUHk0guE0Wwc7nZNrnQOFwo0r87UQK+WK0FrbdAcjrA8sZIC5gYvc
 2BuK5tX0l9WS3M/kqV51s9dUarI+r6gSFt6DLbO5b90qzzJ+eSZLwnWqOEC38N+NYeJ11YeS9VI
 NbY9HktE/es6YFoYTy1MwAF26/Ha
X-Google-Smtp-Source: AGHT+IFXqDlwwpJ0FWSoM6DRUQWWtOQBoAjh0Qw2SzYNXiZy3On4MtALY0ozyZHWmccWCaTp7l5erupyDg42GbSOTUs=
X-Received: by 2002:aa7:dd15:0:b0:643:6984:ceea with SMTP id
 4fb4d7f45d1cf-6496e565160mr18416a12.13.1765354143919; Wed, 10 Dec 2025
 00:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20251209-aspeed-sgpio-v2-0-976e5f5790c2@google.com>
 <20251209-aspeed-sgpio-v2-2-976e5f5790c2@google.com>
 <4dae8293-066f-4354-b50a-05ba4cc9b80f@redhat.com>
In-Reply-To: <4dae8293-066f-4354-b50a-05ba4cc9b80f@redhat.com>
From: Yubin Zou <yubinz@google.com>
Date: Wed, 10 Dec 2025 00:08:52 -0800
X-Gm-Features: AQt7F2o7FVP8TXyh2rh5X_3jSE35aAqidcDXzB1SEsZJHsIJvRev0HEuAE_GcmE
Message-ID: <CABU_6B+vRgWyEifCc4h1fJUPduRK68W44koVxRYGkeuHGEpLgg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] hw/gpio/aspeed_sgpio: aspeed: Add QOM property
 accessors for SGPIO pins
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>, 
 Nabih Estefan <nabihestefan@google.com>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a7dac20645948a8d"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=yubinz@google.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000a7dac20645948a8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi C=C3=A9dric

Good catch. I will fix these issues.

Yubin

On Tue, Dec 9, 2025 at 6:52=E2=80=AFAM C=C3=A9dric Le Goater <clg@redhat.co=
m> wrote:

> Hi,
>
> The subject needs a fix. Please remove the extra 'aspeed: '.
>
> On 12/9/25 01:01, Yubin Zou wrote:
> > This commit adds QOM property accessors for the Aspeed SGPIO pins.
>
> I think you can drop the above sentence from the commit log. It's
> redundant with the subject.
>
> > The `aspeed_sgpio_get_pin` and `aspeed_sgpio_set_pin` functions are
> > implemented to get and set the level of individual SGPIO pins. These
> > are then exposed as boolean properties on the SGPIO device object.
> >
> > Signed-off-by: Yubin Zou <yubinz@google.com>
> > ---
> >   hw/gpio/aspeed_sgpio.c | 78
> ++++++++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 78 insertions(+)
> >
> > diff --git a/hw/gpio/aspeed_sgpio.c b/hw/gpio/aspeed_sgpio.c
> > index
> 8676fa7ced134f1f62dc9e30b42c5fe6db3de268..efa7e574abe87e33e58ac88dba5e346=
9c6702b83
> 100644
> > --- a/hw/gpio/aspeed_sgpio.c
> > +++ b/hw/gpio/aspeed_sgpio.c
> > @@ -91,6 +91,73 @@ static void aspeed_sgpio_2700_write(void *opaque,
> hwaddr offset, uint64_t data,
> >       }
> >   }
> >
> > +static bool aspeed_sgpio_get_pin_level(AspeedSGPIOState *s, int pin)
> > +{
> > +    uint32_t value =3D s->ctrl_regs[pin >> 1];
> > +    bool is_input =3D !(pin % 2);
> > +    uint32_t bit_mask =3D 0;
> > +
> > +    if (is_input) {
> > +        bit_mask =3D SGPIO_SERIAL_IN_VAL_MASK;
> > +    } else {
> > +        bit_mask =3D SGPIO_SERIAL_OUT_VAL_MASK;
> > +    }
> > +
> > +    return value & bit_mask;
> > +}
> > +
> > +static void aspeed_sgpio_set_pin_level(AspeedSGPIOState *s, int pin,
> bool level)
> > +{
> > +    uint32_t value =3D s->ctrl_regs[pin >> 1];
> > +    bool is_input =3D !(pin % 2);
> > +    uint32_t bit_mask =3D 0;
> > +
> > +    if (is_input) {
> > +        bit_mask =3D SGPIO_SERIAL_IN_VAL_MASK;
> > +    } else {
> > +        bit_mask =3D SGPIO_SERIAL_OUT_VAL_MASK;
> > +    }
> > +
> > +    if (level) {
> > +        value |=3D bit_mask;
> > +    } else {
> > +        value &=3D ~bit_mask;
> > +    }
> > +    s->ctrl_regs[pin >> 1] =3D value;
> > +}
> > +
> > +static void aspeed_sgpio_get_pin(Object *obj, Visitor *v, const char
> *name,
> > +                                void *opaque, Error **errp)
> > +{
> > +    bool level =3D true;
> > +    int pin =3D 0xfff;
> > +    AspeedSGPIOState *s =3D ASPEED_SGPIO(obj);
> > +
> > +    if (sscanf(name, "sgpio%d", &pin) !=3D 1) {
> > +        error_setg(errp, "%s: error reading %s", __func__, name);
> > +        return;
> > +    }
> > +    level =3D aspeed_sgpio_get_pin_level(s, pin);
> > +    visit_type_bool(v, name, &level, errp);
> > +}
> > +
> > +static void aspeed_sgpio_set_pin(Object *obj, Visitor *v, const char
> *name,
> > +                                void *opaque, Error **errp)
> > +{
> > +    bool level;
> > +    int pin =3D 0xfff;
> > +    AspeedSGPIOState *s =3D ASPEED_SGPIO(obj);
> > +
> > +    if (!visit_type_bool(v, name, &level, errp)) {
> > +        return;
> > +    }
> > +    if (sscanf(name, "sgpio%d", &pin) !=3D 1) {
> > +        error_setg(errp, "%s: error reading %s", __func__, name);
> > +        return;
> > +    }
> > +    aspeed_sgpio_set_pin_level(s, pin, level);
> > +}
> > +
> >   static const MemoryRegionOps aspeed_gpio_2700_ops =3D {
> >     .read       =3D aspeed_sgpio_2700_read,
> >     .write      =3D aspeed_sgpio_2700_write,
> > @@ -114,6 +181,16 @@ static void aspeed_sgpio_realize(DeviceState *dev,
> Error **errp)
> >       sysbus_init_mmio(sbd, &s->iomem);
> >   }
> >
> > +static void aspeed_sgpio_init(Object *obj)
> > +{
> > +    for (int i =3D 0; i < ASPEED_SGPIO_MAX_PIN_PAIR * 2; i++) {
> > +        char *name =3D g_strdup_printf("sgpio%d", i);
>
> You could use a g_autofree variable and drop the g_free below.
>
> How about using a "%03d" format in the printf and sscanf too ?
>
> C.
>
> > +        object_property_add(obj, name, "bool", aspeed_sgpio_get_pin,
> > +                            aspeed_sgpio_set_pin, NULL, NULL);
> > +        g_free(name);
> > +    }
> > +}
> > +
> >   static void aspeed_sgpio_class_init(ObjectClass *klass, const void
> *data)
> >   {
> >       DeviceClass *dc =3D DEVICE_CLASS(klass);
> > @@ -143,6 +220,7 @@ static const TypeInfo aspeed_sgpio_ast2700_info =3D=
 {
> >     .name           =3D TYPE_ASPEED_SGPIO "-ast2700",
> >     .parent         =3D TYPE_ASPEED_SGPIO,
> >     .class_init     =3D aspeed_sgpio_2700_class_init,
> > +  .instance_init  =3D aspeed_sgpio_init,
> >   };
> >
> >   static void aspeed_sgpio_register_types(void)
> >
>
>

--000000000000a7dac20645948a8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0C=C3=A9dric<div><br></div><div>Good catch. I will =
fix these issues.</div><div><br></div><div>Yubin</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Dec 9, 2025 at 6:52=E2=80=AFAM C=C3=A9dric Le Goater &lt;<a href=
=3D"mailto:clg@redhat.com">clg@redhat.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
The subject needs a fix. Please remove the extra &#39;aspeed: &#39;.<br>
<br>
On 12/9/25 01:01, Yubin Zou wrote:<br>
&gt; This commit adds QOM property accessors for the Aspeed SGPIO pins.<br>
<br>
I think you can drop the above sentence from the commit log. It&#39;s<br>
redundant with the subject.<br>
<br>
&gt; The `aspeed_sgpio_get_pin` and `aspeed_sgpio_set_pin` functions are<br=
>
&gt; implemented to get and set the level of individual SGPIO pins. These<b=
r>
&gt; are then exposed as boolean properties on the SGPIO device object.<br>
&gt; <br>
&gt; Signed-off-by: Yubin Zou &lt;<a href=3D"mailto:yubinz@google.com" targ=
et=3D"_blank">yubinz@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/gpio/aspeed_sgpio.c | 78 ++++++++++++++++++++++++++++++=
++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 78 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/gpio/aspeed_sgpio.c b/hw/gpio/aspeed_sgpio.c<br>
&gt; index 8676fa7ced134f1f62dc9e30b42c5fe6db3de268..efa7e574abe87e33e58ac8=
8dba5e3469c6702b83 100644<br>
&gt; --- a/hw/gpio/aspeed_sgpio.c<br>
&gt; +++ b/hw/gpio/aspeed_sgpio.c<br>
&gt; @@ -91,6 +91,73 @@ static void aspeed_sgpio_2700_write(void *opaque, h=
waddr offset, uint64_t data,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static bool aspeed_sgpio_get_pin_level(AspeedSGPIOState *s, int pin)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t value =3D s-&gt;ctrl_regs[pin &gt;&gt; 1];<br>
&gt; +=C2=A0 =C2=A0 bool is_input =3D !(pin % 2);<br>
&gt; +=C2=A0 =C2=A0 uint32_t bit_mask =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (is_input) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bit_mask =3D SGPIO_SERIAL_IN_VAL_MASK;<br=
>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bit_mask =3D SGPIO_SERIAL_OUT_VAL_MASK;<b=
r>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return value &amp; bit_mask;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void aspeed_sgpio_set_pin_level(AspeedSGPIOState *s, int pin, =
bool level)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t value =3D s-&gt;ctrl_regs[pin &gt;&gt; 1];<br>
&gt; +=C2=A0 =C2=A0 bool is_input =3D !(pin % 2);<br>
&gt; +=C2=A0 =C2=A0 uint32_t bit_mask =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (is_input) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bit_mask =3D SGPIO_SERIAL_IN_VAL_MASK;<br=
>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bit_mask =3D SGPIO_SERIAL_OUT_VAL_MASK;<b=
r>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (level) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 value |=3D bit_mask;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D ~bit_mask;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 s-&gt;ctrl_regs[pin &gt;&gt; 1] =3D value;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void aspeed_sgpio_get_pin(Object *obj, Visitor *v, const char =
*name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 bool level =3D true;<br>
&gt; +=C2=A0 =C2=A0 int pin =3D 0xfff;<br>
&gt; +=C2=A0 =C2=A0 AspeedSGPIOState *s =3D ASPEED_SGPIO(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (sscanf(name, &quot;sgpio%d&quot;, &amp;pin) !=3D 1)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s: error reading =
%s&quot;, __func__, name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 level =3D aspeed_sgpio_get_pin_level(s, pin);<br>
&gt; +=C2=A0 =C2=A0 visit_type_bool(v, name, &amp;level, errp);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void aspeed_sgpio_set_pin(Object *obj, Visitor *v, const char =
*name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 bool level;<br>
&gt; +=C2=A0 =C2=A0 int pin =3D 0xfff;<br>
&gt; +=C2=A0 =C2=A0 AspeedSGPIOState *s =3D ASPEED_SGPIO(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!visit_type_bool(v, name, &amp;level, errp)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (sscanf(name, &quot;sgpio%d&quot;, &amp;pin) !=3D 1)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s: error reading =
%s&quot;, __func__, name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 aspeed_sgpio_set_pin_level(s, pin, level);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static const MemoryRegionOps aspeed_gpio_2700_ops =3D {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D aspeed_sgpio_27=
00_read,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.write=C2=A0 =C2=A0 =C2=A0 =3D aspeed_sgpio_2700_wr=
ite,<br>
&gt; @@ -114,6 +181,16 @@ static void aspeed_sgpio_realize(DeviceState *dev=
, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void aspeed_sgpio_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 for (int i =3D 0; i &lt; ASPEED_SGPIO_MAX_PIN_PAIR * 2;=
 i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *name =3D g_strdup_printf(&quot;sgpi=
o%d&quot;, i);<br>
<br>
You could use a g_autofree variable and drop the g_free below.<br>
<br>
How about using a &quot;%03d&quot; format in the printf and sscanf too ?<br=
>
<br>
C.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add(obj, name, &quot;bool=
&quot;, aspeed_sgpio_get_pin,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aspeed_sgpio_set_pin, NULL, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(name);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void aspeed_sgpio_class_init(ObjectClass *klass, co=
nst void *data)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; @@ -143,6 +220,7 @@ static const TypeInfo aspeed_sgpio_ast2700_info =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_ASPEED_SGPIO &quot;-ast2700&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TYPE_A=
SPEED_SGPIO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =C2=A0=3D aspeed_sgpio_270=
0_class_init,<br>
&gt; +=C2=A0 .instance_init=C2=A0 =3D aspeed_sgpio_init,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void aspeed_sgpio_register_types(void)<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000a7dac20645948a8d--

