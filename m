Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AD9C5AC67
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 13:17:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtmME-00008r-Le; Tue, 11 Aug 2026 09:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wtmMA-00008M-CR
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 09:17:26 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wtmM6-0005hO-Qo
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 09:17:24 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-c998fd549a8so2306684a12.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 06:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786454241; cv=none;
 d=google.com; s=arc-20260327;
 b=VS9+JtjlNxhFO/yMZmGiSL8cvnSypOuUQvElcx137RKM8lbe4QMw1ISJzrwsaVweD9
 g4txpnq/Ug/dsrpm5UVQkJaGt7q1SyZOVtGgLcLnqVid6BNfHGVTxw0a/BW7tZdms7ka
 N3C4n+xuWcVn/CXUT+LpTztBbLsfPcMIohmqU/dEuuT2Q+2ceS392kD1XAZHdFRpd+1p
 jJ3FOUkrmXM+h32XTUN7bwfbmMWUKEgxBSY8oekiJcFaMGfRQNaOfAVxz2gyN6wXvIaK
 JZJ4qTOW9GNOWoWYQ0nOLJRaoik+dohM7njenK5vuKoLFvEqC1b+UxIV2hoZmpKIXe5W
 zXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vF5Y90tyUDQ0pHuaXZfwkPEHihpZWPqOXzDXdJb1YnA=;
 fh=jkGzljeIUNdnINvlpEC2AST6i72ct3/ouIEC71SeqYw=;
 b=aUqkcm1l+VTUbZkXhWRQQSIjGgmmdigZAUT/DLCFeadipAjP4x6L0+sUV4lZG5hqIZ
 qWoUQrSmLkqpRs0x2LH2WopVJqL6MxHq1yzX85u5YGzkypL0PT3E7e9Jbn1YtGUSBvJz
 feu0DrWXeLahMJUwlwRJQzX7L7GiHoEgjpBf+8/VQuSt+TtyYWz+5VOiKX6aGzLdFZXX
 WsvvZYktCDcn2TFLC5uNrP6BB2LR6BPTer8DoE/6+Ds9OgNhygpoLObH4cFp2u5cvrT7
 oaykEgfdqPDLyL9ourVSyjXVGbRAKEQumfgEFQBCtRnfOhghojQ4OLqzOeHzhe7c0lvO
 EAWA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1786454241; x=1787059041; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vF5Y90tyUDQ0pHuaXZfwkPEHihpZWPqOXzDXdJb1YnA=;
 b=fJgatyQi6SzX9UwO4PSB+hTVhak3dnHXJVuHVPiuLTQftIlkm2L/ClcbcmcQL1rk9n
 jnRIEZMvXKyPkfBt+2lhP9+sGEq7SUqkGo/NNDkM2gX8PysUVS381gKh8XuIUkbWejUg
 09ian46a4wjm/RsYrlcWDPDi36JMW87r5crKCpNzfQq1ZLhnnU2WKRViqmUQzxOgj4MM
 dWJ6mR1RJGp2SGVb6RJHIl1W306b1tlXu6gA0/fZ6x4D6qG70yBed6nChv7ZjS50v7qm
 BRp3kQ5+TXIeafPE0OV3HlRWXiCClzF/kcsskZWCoptdM7dR0N5JUd1Wl0cRrGU4FjXo
 GZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786454241; x=1787059041;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vF5Y90tyUDQ0pHuaXZfwkPEHihpZWPqOXzDXdJb1YnA=;
 b=SA81d0w0gX/F9HOUBpVHIW+7uE4qF+vXcXCskrPTfW1LHZhLibHgEPMnE/shdYYQEL
 Pus02jOHEDTQ4wA2GVqHik0mshDiouFKfhXK+0W4YjdNlY696WRfMo7jmwuGCFFlD+EF
 Bf0koNSUv8XZPJEQFYN57LNEZnD0eMZhjjrDEhMSNuduKa928Pc2aOpC5qSlrRVLpiiN
 WBnNP2Nm2d/0+THy+9FMPmQg0JihIIYQyZTjegTftXIzPXUNawqaF7cdZd2GSxiGIzMM
 TJCg+TYybn5uF64OK0NmZRcAODWz1RK5FWVvMv4CaerGulCcghyX8FqsQGoHSc/vc9Hn
 +WMA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrUFNYe20dc0WWhAxcAYypHYVfspQ4nUn68zmxcQz5YlRJvkeSvWST7LORDrptkehRNfEyrxnaOEA==@nongnu.org
X-Gm-Message-State: AOJu0YyYfaYqEjULcHte4I4ioysvsv3128WT4RwJEK67YguVTLkJ7zpG
 TK+BwJv1QRUD52/toIcEKCvPoNeEEuwbNnTogbiEMtjY/XjoKgXrak+i/j9+xsXBZzhPkAkHL3s
 KYIRfmWf6AmnQe5tbbrQw5fqGSq+ewpU=
X-Gm-Gg: AR+sD11QFbCG5jqaZbvTSb60do2/FqMbBeJmxeNxE4aXyNjgE0vfl1qIemikXOqecSw
 Lt7YxbtazOVhZgb0IZPyfnKIQ0ULLPnfL2XFIwiec9QLKmFlxxl97IVZRWqu43WSqMOwEzBsNsN
 DsrMkcDNW+M1BGl3s/4YL3Zpy6zMqxDew7l1CtjnAL5XzzzRGFsZ7bmqD4gWXIiPNZFtpCihKdP
 bBg8KkPZC8rODuuyKTVdpaVE0r77/S5exrfQpFTZYOSyBNEPlP0gSuhvqEeCG3CyzPqvbDicxC8
 ftOukdZ3add91L3dcvWzMGAgxD1Vs+VzWWNLbCsOKw1PEyoEz37hsVH1HJ1GubGHKd8+9KTNsoP
 d
X-Received: by 2002:a05:6a20:72a4:b0:3c3:88a5:83db with SMTP id
 adf61e73a8af0-3cc2b7787abmr4611415637.5.1786454240652; Tue, 11 Aug 2026
 06:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260810153503.2652324-1-alex.bennee@linaro.org>
In-Reply-To: <20260810153503.2652324-1-alex.bennee@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 11 Aug 2026 17:17:08 +0400
X-Gm-Features: AUfX_mxJZR8roAjVlONxn1IoNkVJ9YJIgZirp8wc1ZYzE6cwSmZ7g-wCNAVfGog
Message-ID: <CAJ+F1CJ8doa7m5Z82gp_wVRdrdM9F5sXkecgX3agJVUAXwmTaQ@mail.gmail.com>
Subject: Re: [RFC PATCH] char-fe: implement qemu_chr_fe_backend_name
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, zhenwei pi <zhenwei.pi@linux.dev>, 
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Aug 10, 2026 at 7:36=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> A number of chardev users where calling qemu_chr_fe_get_driver() which
> is discouraged as it blocks backend hotswap. As the pattern is common
> and need for the string is transitory add a helper and keep
> qemu_chr_fe_get_driver() for those that really need the funkiness of
> poking around the backend setup.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  include/chardev/char-fe.h       | 13 ++++++++++++-
>  backends/cryptodev-vhost-user.c |  8 +-------
>  backends/rng-egd.c              |  8 +-------
>  backends/vhost-user.c           |  8 +-------
>  hw/char/imx_serial.c            |  4 ++--
>  5 files changed, 17 insertions(+), 24 deletions(-)
>
> diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
> index 5f8a6df17dc..13218d04c8d 100644
> --- a/include/chardev/char-fe.h
> +++ b/include/chardev/char-fe.h
> @@ -52,7 +52,8 @@ void qemu_chr_fe_deinit(CharFrontend *c, bool del);
>   * associated Chardev.
>   * Note: avoid this function as the driver should never be accessed dire=
ctly,
>   *       especially by the frontends that support chardevice hotswap.
> - *       Consider qemu_chr_fe_backend_connected() to check for driver ex=
istence
> + *       Consider qemu_chr_fe_backend_connected() to check for driver
> + *       existence or qemu_chr_fe_backend_name() if you need the name.
>   */
>  Chardev *qemu_chr_fe_get_driver(CharFrontend *c);
>
> @@ -70,6 +71,16 @@ bool qemu_chr_fe_backend_connected(CharFrontend *c);
>   */
>  bool qemu_chr_fe_backend_open(CharFrontend *c);
>
> +/**
> +  * qemu_chr_fe_backend_name:
> +  *
> +  * Returns: caller freeable string or NULL
> +  */
> +static inline char * qemu_chr_fe_backend_name(CharFrontend *c)
> +{
> +    return (c->chr && c->chr->label) ? g_strdup(c->chr->label) : NULL;
> +}
> +
>  /**
>   * qemu_chr_fe_set_handlers_full:
>   * @c: a CharFrontend
> diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-u=
ser.c
> index cc478d9902d..3334e280a27 100644
> --- a/backends/cryptodev-vhost-user.c
> +++ b/backends/cryptodev-vhost-user.c
> @@ -373,13 +373,7 @@ cryptodev_vhost_user_get_chardev(Object *obj, Error =
**errp)
>  {
>      CryptoDevBackendVhostUser *s =3D
>                        CRYPTODEV_BACKEND_VHOST_USER(obj);
> -    Chardev *chr =3D qemu_chr_fe_get_driver(&s->chr);
> -
> -    if (chr && chr->label) {
> -        return g_strdup(chr->label);
> -    }
> -
> -    return NULL;
> +    return qemu_chr_fe_backend_name(&s->chr);
>  }
>
>  static void cryptodev_vhost_user_finalize(Object *obj)
> diff --git a/backends/rng-egd.c b/backends/rng-egd.c
> index 1d92bd71cf7..c2207f40c5c 100644
> --- a/backends/rng-egd.c
> +++ b/backends/rng-egd.c
> @@ -126,13 +126,7 @@ static void rng_egd_set_chardev(Object *obj, const c=
har *value, Error **errp)
>  static char *rng_egd_get_chardev(Object *obj, Error **errp)
>  {
>      RngEgd *s =3D RNG_EGD(obj);
> -    Chardev *chr =3D qemu_chr_fe_get_driver(&s->chr);
> -
> -    if (chr && chr->label) {
> -        return g_strdup(chr->label);
> -    }
> -
> -    return NULL;
> +    return qemu_chr_fe_backend_name(&s->chr);
>  }
>
>  static void rng_egd_finalize(Object *obj)
> diff --git a/backends/vhost-user.c b/backends/vhost-user.c
> index 380d8250233..46dadb74800 100644
> --- a/backends/vhost-user.c
> +++ b/backends/vhost-user.c
> @@ -152,13 +152,7 @@ static void set_chardev(Object *obj, const char *val=
ue, Error **errp)
>  static char *get_chardev(Object *obj, Error **errp)
>  {
>      VhostUserBackend *b =3D VHOST_USER_BACKEND(obj);
> -    Chardev *chr =3D qemu_chr_fe_get_driver(&b->chr);
> -
> -    if (chr && chr->label) {
> -        return g_strdup(chr->label);
> -    }
> -
> -    return NULL;
> +    return qemu_chr_fe_backend_name(&b->chr);
>  }
>
>  static void vhost_user_backend_class_init(ObjectClass *oc, const void *d=
ata)
> diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
> index fb41ee2ac50..8ac4efbb5e9 100644
> --- a/hw/char/imx_serial.c
> +++ b/hw/char/imx_serial.c
> @@ -278,10 +278,10 @@ static void imx_serial_write(void *opaque, hwaddr o=
ffset,
>                               uint64_t value, unsigned size)
>  {
>      IMXSerialState *s =3D (IMXSerialState *)opaque;
> -    Chardev *chr =3D qemu_chr_fe_get_driver(&s->chr);
> +    g_autofree char *label =3D qemu_chr_fe_backend_name(&s->chr);
>      unsigned char ch;
>
> -    trace_imx_serial_write(chr ? chr->label : "NODEV", offset, value);
> +    trace_imx_serial_write(label ? label : "NODEV", offset, value);
>
>      switch (offset >> 2) {
>      case 0x10: /* UTXD */
> --
> 2.47.3
>
>

