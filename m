Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp910376lfm;
        Wed, 22 Apr 2020 10:43:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypIrWtgVyG3/j8OxVqVKPFxiw/lzc0wctwN41gwkt2iz/vzKfmd7zSA/Mvw/O9C8qysox5iS
X-Received: by 2002:aa7:d311:: with SMTP id p17mr24578888edq.73.1587577416580;
        Wed, 22 Apr 2020 10:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587577416; cv=none;
        d=google.com; s=arc-20160816;
        b=OIdzS+inEcJssjf+osYgQf3fvXJj3W6Vn6R0HemkoppWGouk5Mu2HHfkKbIDvsr0u7
         q7EfiZhsKfJlGse69l9CoTITKHzHtF8TdSpBE+PMjS3g7cunWh1pAvB2y2UK7JifaR1j
         lHqwTEjSD+PIbSV52tm4u1ya6cfYWdqU9XSIgg5+mc/L3PkwM0AnnTEilJu+NLF9EdA5
         C9TTYiq5G5fJFWNoizjIVp5egLgCKLda/T2rAoOE6N9frOd8kA0rKR4Kgp4zWs3pQxlo
         87yjgriLC30GLw/6ZSPGx1M4AvdLKkOBz7GCXKoRBZOuiyjvMxcq0BbrdKmmWXgpODNO
         X+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hHXTQbHTk/GqfkhzXqY9YnXuAZpapaywKPSFwdmxyTg=;
        b=xSISN5xMgaLh1oyQy302NZilI3/Hay2Q9QSqnrcf8FQYjANblxFRbZkGqXdqjM4N4Y
         XKGdRvQJ1Wl+PjCPcfLyd7D9E+b32qXOlSPWMKF2tajDzsnf7hzlRt0b830E+AFjDdeA
         IlaEHhg0/EewWTPpMM3hdp0dBTiRAP9N0n8CYlocv6IV1znClXqEjS08hxAko0NYG3Aq
         lv0FrTVYBMaiN+ijucs4VOHqKEbOF3Os4OQ2VtqyIsC0TgJzSuP/qBlfD75p2tST0l9v
         HDsF16+uwwCcNXObKaaIxcjSVw1Ah19Ab2oEjLErDXES+qEo5/XRB/+GslNlNl9EDHhk
         nVmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OZ07+/Df";
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id cq7si3613549edb.319.2020.04.22.10.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2020 10:43:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OZ07+/Df";
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587577415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHXTQbHTk/GqfkhzXqY9YnXuAZpapaywKPSFwdmxyTg=;
	b=OZ07+/Df50JHj/9pX0ftFA34OU1QNzYHG7pe4AriHV9pcjpzlwkL2dN5Bunx+mf3AD3eEK
	S8b6iXxEeiaXkvyX2crpXnTtAgLCYzz/meo8WGCTbjWQtF/VgUw7AMhNwYiOdcMQrnbN5o
	/IvZHReVr3voxb+ht2PF1s1GwOZT604=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-dp4wzN1zOhG0usva1MzfQA-1; Wed, 22 Apr 2020 13:43:34 -0400
X-MC-Unique: dp4wzN1zOhG0usva1MzfQA-1
Received: by mail-wr1-f72.google.com with SMTP id e5so1403454wrs.23
        for <alex.bennee@linaro.org>; Wed, 22 Apr 2020 10:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hHXTQbHTk/GqfkhzXqY9YnXuAZpapaywKPSFwdmxyTg=;
        b=PWYbGBbDb5N7CDeuR8BjGT0g9Nq/9BPsrMndJ8E8R7woLwhqeVAK1BD29/y7aSSmvs
         zrEGa47WzhTC3/dNUo2HLk1EI/RwGblozs59gV4B8Fep9TodtWJMbBh3J+jmWZIUJRoe
         DkxdB1dwhIA4lY6MehwxT3HekbvCWD0Vt9VEOFKVbAwiQAeXtQq9R+/DVpkVxLtYh2L0
         +8xm4pENgjB9FsBAzovYKtPGsqJ12qIWyqTDbNG1UzEi3p0HxI8LOkljXmyJS0KZpnIW
         n0MsmXZS7WmmIhW+khm5r7rcttG8wrxVSMxijGPVQuq0dALms5ExS0WtTUGOe76CccAo
         T66A==
X-Gm-Message-State: AGi0PuZnnREerdpU+59FQFOlg4hWXehI7dfKO5TrStjXtj1d1gf+AyPt
	PjRLfzFXjV+15mT6TGQ1xqNC+1u/kFKWU4QEXKKqe9EITjwue9wT0Bm3lj85kEYl4cz8v5qMRi5
	Tjk2GqYKl+SeSTc6h9CJz/TqG/GeZHgJa
X-Received: by 2002:adf:9d8d:: with SMTP id p13mr169770wre.17.1587577412865;
        Wed, 22 Apr 2020 10:43:32 -0700 (PDT)
X-Received: by 2002:adf:9d8d:: with SMTP id p13mr169751wre.17.1587577412671;
 Wed, 22 Apr 2020 10:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200422124501.28015-1-peter.maydell@linaro.org> <b6dd8d4a-ec38-84c5-eb94-cf25bfa4cf4a@redhat.com>
In-Reply-To: <b6dd8d4a-ec38-84c5-eb94-cf25bfa4cf4a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Wed, 22 Apr 2020 19:43:21 +0200
Message-ID: <CAP+75-XS1Xo0HCEADP6ppKNbKNz6Se9n_8vWQ9OaoNDtGw0D0A@mail.gmail.com>
Subject: Re: [PATCH for-5.0?] target/arm: Fix ID_MMFR4 value on AArch64 'max' CPU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: kvwOlKiDyr8b

On Wed, Apr 22, 2020 at 7:41 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 4/22/20 2:45 PM, Peter Maydell wrote:
> > In commit 41a4bf1feab098da4cd the added code to set the CNP
> > field in ID_MMFR4 for the AArch64 'max' CPU had a typo
> > where it used the wrong variable name, resulting in ID_MMFR4
> > fields AC2, XNX and LSM being wrong. Fix the typo.
> >
> > Fixes: 41a4bf1feab098da4cd
> > Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
>
> Nice testing/catch Laurent!
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > maybe 5.0 just because it's so trivial. I dunno...

BTW FWIW LGTM...

> >
> > There's also an error where we use the uint32_t u variable
> > to update the 64-bit ID_AA64DFR0 register, but that's harmless
> > because as it happens the top 32 bits of that register are
> > all zeroes anyway, so we can just fix that in 5.1.
> >
> >   target/arm/cpu64.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 62d36f9e8d3..95d0c8c101a 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -705,7 +705,7 @@ static void aarch64_max_initfn(Object *obj)
> >           u =3D cpu->isar.id_mmfr4;
> >           u =3D FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
> >           u =3D FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
> > -        u =3D FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
> > +        u =3D FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
> >           cpu->isar.id_mmfr4 =3D u;
> >
> >           u =3D cpu->isar.id_aa64dfr0;
> >
