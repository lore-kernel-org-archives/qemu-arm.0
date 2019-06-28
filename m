Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2689595wru;
        Fri, 28 Jun 2019 09:38:19 -0700 (PDT)
X-Received: by 2002:a19:5218:: with SMTP id m24mr5273136lfb.109.1561739899073;
        Fri, 28 Jun 2019 09:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561739899; cv=none;
        d=google.com; s=arc-20160816;
        b=i9ADnekAxayoZJWDFasEZmUa39G6qHxyaAq9LsDzQHRCgUEBl8apjabPaxK14WfbGA
         8kLo0Y6y3Bu1w2Fb0H5YXbsWe6oGKk1dV4KNDaYcYYENx/H1DNvFB2tu3SChLO5vyc5h
         Og5G+vv41bDqfsmoVtpqTfZCRd53hBXTqQJureYEThoeLoFGzdS4FzASXFDg+uF5WPx1
         gDaOn7qCSxDghHaP0toYJ4jC/aTR0p8Nt/G7wjm3SRHdDSNFynJ+Xyta+NpfiU0hvxEF
         t+So1/pNLasLzaSJHO8QOLs7LSeVb2b4NbdQMIUmV2SS0vLjtV/v0Zgzo1sAi/VX7FHW
         Xf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+PC5nl+ig+mRBNdUabM7Gb+PFZU7gEoP5wibD+xDhCI=;
        b=aE9EoYzhxE/RxO3+0LKNfuV+0Ik8FrYZCfG46fNP+6oQSUItH/Z0aKJg9WKoJm1lN7
         EIUpgp7LAby7cZ56WdUzZQLN7fbf6NHgAq9V0r8WBa5PLO9mjSoYTxeYnsGK5lnQYhG/
         cRgVxJ0VxVRk53+Ex8QrijqIJUFVbu9j3BDWM7CeWBJV5Bd75MXK4Q3jV3A/bYOBi64x
         akp+QSwz99EMtriLfpwkFmH4qvARB0ZUy5HFglSxNha1Gf/zrH9PQlD3cMwcvPWh2a7H
         TMpz3JQ6JLshEmT6kzmcGK8vvWfVk+kPTTmQGJB1CGniy4mS8HLSZ1xoWzwhbJ65tyn3
         fUpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bOT42Qvn;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z16sor740081lfh.31.2019.06.28.09.38.18
        (Google Transport Security);
        Fri, 28 Jun 2019 09:38:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bOT42Qvn;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+PC5nl+ig+mRBNdUabM7Gb+PFZU7gEoP5wibD+xDhCI=;
        b=bOT42QvneO7Q2nnb4emKDrlJlXJBNa0rhv6IwqaNxRBPKnp9adUddDUM7YrkxzhCNL
         IYqqm7ccfyakqK7x9dBSEoarKgtFZvvjcr5Natjeaz9eIwY5mE6kXMBvygQLw8XHYLKy
         XRPOkWDOjBODQho32P4ef83le7kLDu/lepUDGd0fNRo+ItxX2QCMT6RTp+NPkMPgFDR4
         HSHC4eqnULU8J96UbRogVR6qqhlO6mQhxAic5QtrFRG5GXc6B3RE31Pw6QE6g2Sa/FGv
         eqaHWguAZNGyXZAyhEWEY6XbtZS+WzUUaaNg/6Sdh3KqwfzkKRUYTVXEu+ebDr4UTUHO
         bzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+PC5nl+ig+mRBNdUabM7Gb+PFZU7gEoP5wibD+xDhCI=;
        b=pO3Uq85WqU4i/Z8vnkpPQ1irUySOSpYiFXOTtI3hXfjoHWG2hpywkxDuoOcRNbED/2
         LMixNj0IQsGlD9x8h07gg8kQigh9Z9YLuWgBoOHdlBVLafMUrJL+vWiNnZU+lBS/k/Bx
         48lzuNjkEN328rIKuj2eqrL6u4Tv42f56G8pcoB1dG/0AemHocdr96AdGL5gHqTgcd2M
         uEa2QvNdY/E/ppk503C83iNTpMO9kowQWnOSLHDshGbpJJ5dNsZjHSoidD4r4b+65VRy
         /9DJhW3bHlvu9THM/Jh9gRvrTTpDnVGVshN68XpGVW7DSRyYCdDCiybCrMpMYvK+0vC7
         1JNw==
X-Gm-Message-State: APjAAAXvbC/IeICMBP4bqjM1FgweMm7e9watzX7pUyvyqesWFreqFmTL
	amvNNSFgo/ADYj78Nb6pAOBKrP9fUOUHcz3sWmHrx+bWsAs=
X-Google-Smtp-Source: APXvYqwQFBRfxw1s+Vq9rh/0wzk+8k72xa+8HW6dYkz9KghDNd+18P6/4DllfvgZzvlWtGYDDrMlNUHlLX/ijXs6SyI=
X-Received: by 2002:ac2:4990:: with SMTP id f16mr5309931lfl.93.1561739898726;
 Fri, 28 Jun 2019 09:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-18-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-18-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:35:18 -0700
Message-ID: <CAKmqyKPDmO-G8APN1Ce9ZSxt6AxXwmjEfMYi4+v6fEQWWJT6Rg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 17/28] hw/block/pflash_cfi02: Document
 'Page Mode' operations are not supported
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Qemu-block <qemu-block@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, Magnus Damm <magnus.damm@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Aurelien Jarno <aurelien@aurel32.net>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: jigUoGnbR4gy

On Thu, Jun 27, 2019 at 1:57 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The 'page mode' feature entry was implicitly set as zero
> (not supported). Document it exists, so we won't discard
> it if we squeeze the CFI table.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
> [PMD: Extracted from bigger patch]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 23d05a6308..01d9c5d75a 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -637,7 +637,9 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>      pfl->cfi_table[0x0a + pri_ofs] =3D 0x00;
>      /* Burst mode not supported. */
>      pfl->cfi_table[0x0b + pri_ofs] =3D 0x00;
> -    assert(0x0b + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
> +    /* Page mode not supported. */
> +    pfl->cfi_table[0x0c + pri_ofs] =3D 0x00;
> +    assert(0x0c + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
>  }
>
>  static Property pflash_cfi02_properties[] =3D {
> --
> 2.20.1
>
>
