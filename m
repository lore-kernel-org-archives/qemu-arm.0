Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1233574njm;
        Mon, 1 Jul 2024 02:01:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyToD3PKMRGance6TKAvNqMvy5KWfs0pyExrRUbYW0wA3kKrZqXpPkmhNTVfNq8VQnjdNu
X-Received: by 2002:a05:6808:2288:b0:3d6:2adc:3878 with SMTP id 5614622812f47-3d6b2d1917emr7454481b6e.15.1719824502849;
        Mon, 01 Jul 2024 02:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719824502; cv=none;
        d=google.com; s=arc-20160816;
        b=pzp4aTLzT/JZ57nlh1SPEv+0BUjSRMkWonNhikLzt+tBkoVyYvCIujRD5LCTGUS9DT
         8y6f9XfiSNMlLHFbcmJ7T90AFHLivliI/fY+qP93/BTAk6SDI2EOyw4NRoiBe5PaRFfC
         UJlRkccDR5fhVtKWhlAvq/i9W5uRq2phf7YGQlN30S43EV3ofv8jOkISK3KX0buooIBI
         lJGXLtkxSyaAgGUijIcJYbUk9vPNchAkyeIcSxb758tn5vqyVAIbyQq/+Gh2Gad2OqoC
         aHZkhE9u9lRGuvvnwoiEd1OlMvb79BAFEoqEffxowHRKmdg18yKzFfApcBPL5EKTiUjM
         ftmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=oEBDYAQdGZzD+ww+OiJTTgxS9CQV9GMVKaDk3lRKAtA=;
        fh=cHe3sz4CLiXC+Vuv6Ru02H7bl9v+JXtoMaf9yn504mA=;
        b=jGVV9ZEaOIoX0hAzK13j8m9Al1K6No2wOPhyzdhDYmRMifaqPx3NVOj4SItv+W4Ri/
         ypSF4jM187WQc36dd5s5kJAeOUP1IFkvui14PnOf1TUkYxa796tDLa5Wg0KbUsJhyUfj
         VV7nkkN+nZb9M8/yroyjkSkDpALATxzSNe7xRyzvTYAczumnynLAs7F4/OM+0nGp0Teu
         t1dzi+8V4BF7kyLSrDCn1YXjqc7Ossg33m/3iQ2Js/U3LwXlYCS+rtJfDwpvPL/MZ2nH
         5RSLHu+UXiN0KuOd1aMe3ips4BaQT0/D88vo1o7oOQutyRcPFPHuDJpjnEJyfQkCYbjd
         DP9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ds8tVoQU;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e61854asi79078626d6.581.2024.07.01.02.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 02:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ds8tVoQU;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719824502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEBDYAQdGZzD+ww+OiJTTgxS9CQV9GMVKaDk3lRKAtA=;
	b=Ds8tVoQUvr8yVbIGykFsewVvIjfwMAMiSsNpwopyrfd3Sccjn8kF/JyywJPD9lwgiWzPNY
	EsFYr/zaTLuFLbxXLcn4x0QccjHqfmVPuaDmnOTesMILisM22NmXVWdLGVbxq3icCF62oB
	o9/HmGVUTBV4gd4MUdZR/7Jt9Cgc5ys=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-tbeP5G58On6yK5NhJGoTYA-1; Mon, 01 Jul 2024 05:01:40 -0400
X-MC-Unique: tbeP5G58On6yK5NhJGoTYA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4257a75193aso9815755e9.1
        for <alex.bennee@linaro.org>; Mon, 01 Jul 2024 02:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719824499; x=1720429299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEBDYAQdGZzD+ww+OiJTTgxS9CQV9GMVKaDk3lRKAtA=;
        b=S9QStT72UCJOOQTwU0JFpLQ63pLIAIVfuvplAZOu/KH0UZ3x6+IM2ULUrfTlyrlph2
         07WlICxl5oV9ZcmCo1WnuOhkSlsGgcktMdgWOSR/F/rjI1NjsFy6y+588dJFIkePxI/s
         T3z8KRHQYXNXjxjNRKFGG8owjhzb+zggSyObCmnZGSqfJAaOWJL7NmmN7QoUHj2PGBG+
         QlW2CQBTaKn5gE64TXwnekFiMd6L/0EpwkV3dBXJcAjaX5IamqaqTC29zcmUAZ0AI0rt
         KKxhr5YCQAVcrfnYvosOYMoT9aLTU5W9bHHYlN7z9vYdny28hjb7eLHu7LAnp8nq8TDZ
         XhIg==
X-Gm-Message-State: AOJu0Yx005ngq5L4U8vRgHo5O2mhlWrVhKGG2vUuB3E4EU+ELRtUYrUk
	9j6OkHMu67qKvhOoX+py6sXEYCPHSAx3MVuMbLnw+ZADik3lrgAC6kmajdVDVsHXlRY6WvkQaPw
	al4jCRCsDkXAMJR2koOfMjaTRz+lUMDZ9aCC26C5qu/gG3liQnYMc00LNlvbwvGMIWhur5R2xMI
	sPIW5vIljZEVwGwKz9X22buyugj1gcJZGHnjxu1LRv
X-Received: by 2002:a7b:c458:0:b0:424:a655:c8b with SMTP id 5b1f17b1804b1-4257a010ab5mr32800105e9.19.1719824499033;
        Mon, 01 Jul 2024 02:01:39 -0700 (PDT)
X-Received: by 2002:a7b:c458:0:b0:424:a655:c8b with SMTP id 5b1f17b1804b1-4257a010ab5mr32799715e9.19.1719824498651;
        Mon, 01 Jul 2024 02:01:38 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4258014f8b7sm47322965e9.41.2024.07.01.02.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 02:01:38 -0700 (PDT)
Date: Mon, 1 Jul 2024 11:01:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, Peter Xu
 <peterx@redhat.com>, Mads Ynddal <mads@ynddal.dk>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Alexandre
 Iooss <erdnaxe@crans.org>, Stefan Hajnoczi <stefanha@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Thomas Huth <thuth@redhat.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Fabiano Rosas
 <farosas@suse.de>
Subject: Re: [PATCH 02/23] target/i386: fix gen_prepare_size_nz condition
Message-ID: <20240701110136.6829422c@imammedo.users.ipa.redhat.com>
In-Reply-To: <87ikxtnnjh.fsf@draig.linaro.org>
References: <20240628124258.832466-1-alex.bennee@linaro.org>
	<20240628124258.832466-3-alex.bennee@linaro.org>
	<87ikxtnnjh.fsf@draig.linaro.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: b/oz4C4NRGYG

On Fri, 28 Jun 2024 15:34:58 +0100
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>=20
> > Incorrect brace positions causes an unintended overflow on 32 bit
> > builds and shenanigans result.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2413
> > Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org> =20
>=20
> This seems to trigger regressions in:
>=20
>   qtest-x86_64/bios-tables-test
>   qtest-x86_64/pxe-test
>   qtest-x86_64/vmgenid-test
>=20
> Could that be down to generated test data?

Without context, I'd guess, that
guest doesn't boot/get to randevu point that tests are waiting for
and then it just timeouts =3D> fails.

>=20
> > ---
> >  target/i386/tcg/translate.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> > index ad1819815a..94f13541c3 100644
> > --- a/target/i386/tcg/translate.c
> > +++ b/target/i386/tcg/translate.c
> > @@ -877,7 +877,7 @@ static CCPrepare gen_prepare_sign_nz(TCGv src, MemO=
p size)
> >          return (CCPrepare) { .cond =3D TCG_COND_LT, .reg =3D src };
> >      } else {
> >          return (CCPrepare) { .cond =3D TCG_COND_TSTNE, .reg =3D src,
> > -                             .imm =3D 1ull << ((8 << size) - 1) };
> > +                             .imm =3D (1ull << (8 << size)) - 1 };
> >      }
> >  } =20
>=20
