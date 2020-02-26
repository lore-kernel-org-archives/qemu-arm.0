Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3162273lfg;
        Wed, 26 Feb 2020 06:45:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxw5ZUNM9g5lxkwsfg2TqOT2rD+H03eWgwRmzgh0lwbUmiPPeeCzN6hMMwx5MctBnFX3j6s
X-Received: by 2002:a17:906:4a5a:: with SMTP id a26mr4897867ejv.49.1582728335475;
        Wed, 26 Feb 2020 06:45:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582728335; cv=none;
        d=google.com; s=arc-20160816;
        b=du2OaCGBpDfEw0x2K/KlIg+l33YZoFhuP4vY7mP+Li2uZd49EEddS6kViUoBHfhEM1
         c559wp2bnYPU/lVWjdrfqw6WywJS7CC6PVlIgEmlpZgA9B4xK0/9Iyyt8n3sxTccD18K
         aTvGORmFfhhQADDZ5N7geiu9S6IM3YmtBky1rPf9szqndPmXP9u0C63sMRSVlfrgigYe
         VuZru8fof9yzO6Ot8EDjyWhcmdgEBEs+GCAySxADdGj1q7JnpF8Oyk9MjdBRydENE0LT
         8hT8YSEndRPETld+t3QwSxrLquZZqwkqAvVAUOGqW0Sgoo1Hq9wVzH2HfF0w7GBF6jTT
         RCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=qlVXF2tk1qgD8ay0foIDoyXWCm75nANb9zMd0kEiJDc=;
        b=s9KGdcpZedhsVQBup6kAMkEHhtvxxhb3fd6wTnPy1CGkRPcdKN03WvRuFccYtsATcF
         Ousv12YcqGGys0jOPjxrAnFAf/A7d9dekI1YfPFHm1S0OQ/XmqjHEqfsM2qrlYVCKv7P
         HSpUmXq/OnfBbHflwj4qjX4T+W2++E7hwC5be00ggU7J2f4ZYVleyZnA7JGGY4ZFF9OL
         EkCIEJ7YWP6jP0I2EqvHkS0yEd9tQyX0bxifBIQk9zVsPIrsP0bmrnp2Jh15uN4Lvlkw
         hlQUDaGnUsjoinIP1zDT308ild5/JLfr6J73FTgeHN/JWGsFS0JXJgRQrUUePp79wLmS
         Zyaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cfyGLRA2;
       spf=pass (google.com: domain of imammedo@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id l6si1930399edn.221.2020.02.26.06.45.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Feb 2020 06:45:35 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cfyGLRA2;
       spf=pass (google.com: domain of imammedo@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582728334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlVXF2tk1qgD8ay0foIDoyXWCm75nANb9zMd0kEiJDc=;
	b=cfyGLRA2hcU/peZmgfmvn8jMd/txnj7gMCroM3Kv+0M2ikxVg+KmRrQ6tMEWuzUAZpH11n
	FMQ8dWAwGnqOr30aqsiQVW5gmd6/xjysDeRTkjYlcMWn3k3QOy6oNZLG7XaqHJ3xMRliry
	i14W1ceg01KUsuM5u1B+MvyLEMnhgD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-sXoOkyq4M4OKUo4ufgTqQg-1; Wed, 26 Feb 2020 09:45:30 -0500
X-MC-Unique: sXoOkyq4M4OKUo4ufgTqQg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EA0418A5517;
	Wed, 26 Feb 2020 14:45:29 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 451D18C086;
	Wed, 26 Feb 2020 14:45:27 +0000 (UTC)
Date: Wed, 26 Feb 2020 15:45:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Howard Spoelstra
 <hsp.cat7@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm
 <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: Sudden slowdown of ARM emulation in master
Message-ID: <20200226154525.5c4c0ac9@redhat.com>
In-Reply-To: <87k149xwqw.fsf@linaro.org>
References: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
	<20200226101948.786be4b0@redhat.com>
	<CAFEAcA80K+h-nkiHrh15mmgomBaqDpdhRwb34zwKqF31dp3KDw@mail.gmail.com>
	<87k149xwqw.fsf@linaro.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: uSm365XgbEHo

On Wed, 26 Feb 2020 14:13:11 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> Peter Maydell <peter.maydell@linaro.org> writes:
>=20
> > On Wed, 26 Feb 2020 at 09:19, Igor Mammedov <imammedo@redhat.com> wrote=
: =20
> >>
> >> On Wed, 26 Feb 2020 00:07:55 +0100
> >> Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
> >> =20
> >> > Hello Igor and Paolo, =20
> >>
> >> does following hack solves issue?
> >>
> >> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> >> index a08ab11f65..ab2448c5aa 100644
> >> --- a/accel/tcg/translate-all.c
> >> +++ b/accel/tcg/translate-all.c
> >> @@ -944,7 +944,7 @@ static inline size_t size_code_gen_buffer(size_t t=
b_size)
> >>          /* ??? If we relax the requirement that CONFIG_USER_ONLY use =
the
> >>             static buffer, we could size this on RESERVED_VA, on the t=
ext
> >>             segment size of the executable, or continue to use the def=
ault.  */
> >> -        tb_size =3D (unsigned long)(ram_size / 4);
> >> +        tb_size =3D MAX_CODE_GEN_BUFFER_SIZE;
> >>  #endif
> >>      }
> >>      if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) { =20
> >
> > Cc'ing Richard to ask: does it still make sense for TCG
> > to pick a codegen buffer size based on the guest RAM size? =20
>=20
> Arguably you would never get more than ram_size * tcg gen overhead of
> active TBs at any one point although you can come up with pathological
> patterns where only a subset of pages are flushed in and out at a time.
>=20
> However the backing for the code is mmap'ed anyway so surely the kernel
> can work out the kinks here. We will never allocate more than the code
> generator can generate jumps for anyway.
>=20
> Looking at the SoftMMU version of alloc_code_gen_buffer it looks like
> everything now falls under the:
>=20
>   # if defined(__PIE__) || defined(__PIC__)
>=20
> leg so there is a bunch of code to be deleted there. The remaining
> question is what to do for linux-user because there is a bit more logic
> to deal with some corner cases on the static code generation buffer.
>=20
> I'd be tempted to rename DEFAULT_CODE_GEN_BUFFER_SIZE to
> SMALL_CODE_GEN_BUFFER_SIZE and only bother with a static allocation for
> 32 bit linux-user hosts. Otherwise why not default to
> MAX_CODE_GEN_BUFFER_SIZE on 64 bit systems and let the kernel deal with
> it?

*-user call
  tcg_exec_init(0);
which in in the end results in
  DEFAULT_CODE_GEN_BUFFER_SIZE -> DEFAULT_CODE_GEN_BUFFER_SIZE_1

so for *-user cases we can just always call
   code_gen_alloc(DEFAULT_CODE_GEN_BUFFER_SIZE)

> > (We should fix the regression anyway, but it surprised me
> > slightly to find a config detail of the guest machine being
> > used here.)
> >
> > thanks
> > -- PMM =20
>=20
>=20
