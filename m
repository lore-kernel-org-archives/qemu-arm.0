Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp867635njf;
        Thu, 15 Aug 2024 07:08:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/SxNyok0T48wMpTFTAlGLRPZmgZGPlyX3XIxQV7J/oL+6OgpSPoPG5yO7LKShoFDSrFQw5BKI/mxh498GIUFuoNDvIsQh
X-Google-Smtp-Source: AGHT+IG6fyJe39m7167UFmWsrPEazzexscXCQHJr2HvBmDNmoyKfofZ0Rrk+Y0uh0rYelilBRmuj
X-Received: by 2002:a05:620a:2447:b0:79f:16df:a69f with SMTP id af79cd13be357-7a4ee323d60mr862206185a.2.1723730905051;
        Thu, 15 Aug 2024 07:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723730905; cv=none;
        d=google.com; s=arc-20160816;
        b=UACtL4HvtM5sHFY3NJHbdvaIyE75TP87XweySrp1KGBIFzPyHton+hylBaLOqk/+v5
         N6bPoFE3C9oyFPnz/PxFI4cbUhXOh4bHW/jtvNpdUp79pYgVLKeoq3sVf/NMukl7l2ks
         kExwn6w54dsWmTcygzMw6wkmzT7YVXOVX1q0LedU440Salx/BwvUz4wWTu5is/NQy1qx
         7F+lfO1AMH1wdYSprmn9NHVlmmcuPb4Z6ZRQd/y80bk58UDWYvbue0a01YV9g/6r9ALs
         jbVX6uCmeqQ8klmQnQHY5kbg0M3mDrKRnkQfXiZYFPrdF6jqivJHK8dIFq6A1pvNb69n
         TubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vzr3KYLk8750O7gOgaxuZ0lSzVhIlcuDGPfj02xRDb8=;
        fh=Uecb+9fVC75kOwPTllDIYTpVsF4m2rEMatI4tUtbSuw=;
        b=jNYN+a4bpDIVpYCkYnoKpYnI0uqgim64AArcNh00ty3IjusKB9hL7e0nbwhPiKKUnn
         mJKKMqS7TIWbRuthWoHB3o3a2RVI+mXCfkeEcRBoSYUz3/7YnkP+8tDNRYb0YQ/N0s7a
         rgFo0zC9bzvEDMN9dDx4SDxVdOy8LoM8AG9efrO24FlmNxjFEzj0uL3tL/6glT3ecGdZ
         LxwcI7P8Sv0RV0BL4uYhxOdhDCZ9ZFDfJ4wf5Gbbb6TMcPKvoIA3wDKhBVa30S/qbu1V
         JJtbx2Wvk+XD3en0kJX3M/8qAeXWExNyceqfCdYAQaKSFfdQ39t5fE7w0eYm2QNr8D/o
         7aEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=beqbAlls;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a4ff0b6924si182861085a.321.2024.08.15.07.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 07:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=beqbAlls;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723730904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzr3KYLk8750O7gOgaxuZ0lSzVhIlcuDGPfj02xRDb8=;
	b=beqbAllsONlaYSmNgsWKgLSD6EkFW8TqzVinJB1sLZTjZrd3zDWKTkCNojkApIkO2NwehW
	JSkLMfSMDndHk+T0Hac3Nl4eZXzkP4bQyAGeHC7RPoeWFETL+OOgiE3abWO/6HyAuIkIu0
	PqQuxsHiM/dD6SiD7bb5+QtDeiVslug=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-3_rERV5aPtmFptc8y_p8fw-1; Thu, 15 Aug 2024 10:08:23 -0400
X-MC-Unique: 3_rERV5aPtmFptc8y_p8fw-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6ad97b9a0fbso20140957b3.0
        for <alex.bennee@linaro.org>; Thu, 15 Aug 2024 07:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723730903; x=1724335703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzr3KYLk8750O7gOgaxuZ0lSzVhIlcuDGPfj02xRDb8=;
        b=JCMGwXLqTJMnoQb+oQb/NJ5t4XW3oD1Pn9T4mMnNAo4fMLQYN1sEO9QTWjBWlLbEuW
         UyvJIdG0xp1QlmDEYMlbZVKweUR/KOXItTj3ZVsfQE4yvQl3OeIho6+gsUJLkkIlr+Hz
         erOwC7dh8TyImlkgU1VYK95USAda3Gt5u0P248r5t6I/QCoQsy9iUL5nmJZQoJluawGI
         ObE0fK//6vRTVscXE+dbb8CI/87iGOQjMpMrJJHRzUwIFScrv1UBL/OAXcZZTR42eW/Y
         fkO8S1x8J0f9H2yXBxedTgtJOyxha6s9zDcTO7yP7fH1gNJyoJ1hUVIn4QUmFsqDIZgk
         FSOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwNBAzCOL8Yuzp/5v8K07gRoIT4vGBDlguvUXD0TZzyyozh9abrzp1K4Sx3BFH3B1h0MvlttJ6HKWjHa50k1IbE0DCcoo1
X-Gm-Message-State: AOJu0YxrcBnr62MAi/m/ebNAMqeWfAXwHbf542Hk+YGEtAimLbS+bqg3
	FCTxsz+/0Luktcxg8SrKSBRJV/9ZSWSTfLELuGVzPwaZyeqH3OlkP4AbK2NnSP+hZmcazrayB3w
	rM+BfgFacQvVXjUYGzbxDI5v31bhdxJmj2EkI7O4cZ3Qqgrcn4JoViyD8rm2uFblS/LcyYsFY8B
	U7aCk9nl7sPbu1MYkuXX3wRWrbJbdL
X-Received: by 2002:a05:690c:4710:b0:651:6e6f:32d2 with SMTP id 00721157ae682-6ac9a4787c2mr61877267b3.43.1723730902726;
        Thu, 15 Aug 2024 07:08:22 -0700 (PDT)
X-Received: by 2002:a05:690c:4710:b0:651:6e6f:32d2 with SMTP id
 00721157ae682-6ac9a4787c2mr61876777b3.43.1723730902291; Thu, 15 Aug 2024
 07:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240806173119.582857-1-crosa@redhat.com> <20240806173119.582857-10-crosa@redhat.com>
 <1f645137-c621-4fa3-ace0-415087267a7b@redhat.com>
In-Reply-To: <1f645137-c621-4fa3-ace0-415087267a7b@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Thu, 15 Aug 2024 10:08:11 -0400
Message-ID: <CA+bd_6LTqGbx2+GOyYHyJ4d5gpg4v8Ddx5apjghiB0vjt8Abhg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] Avocado tests: allow for parallel execution of tests
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Radoslaw Biernacki <rad@semihalf.com>, 
	Troy Lee <leetroy@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>, 
	Beraldo Leal <bleal@redhat.com>, kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Paul Durrant <paul@xen.org>, 
	Eric Auger <eric.auger@redhat.com>, David Woodhouse <dwmw2@infradead.org>, qemu-arm@nongnu.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Jamin Lin <jamin_lin@aspeedtech.com>, 
	Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 6ydp+sEOyoag

On Mon, Aug 12, 2024 at 6:17=E2=80=AFAM Thomas Huth <thuth@redhat.com> wrot=
e:
> ...
> > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > index 537804d101..545b5155f9 100644
> > --- a/tests/Makefile.include
> > +++ b/tests/Makefile.include
> > @@ -94,6 +94,9 @@ TESTS_RESULTS_DIR=3D$(BUILD_DIR)/tests/results
> >   ifndef AVOCADO_TESTS
> >       AVOCADO_TESTS=3Dtests/avocado
> >   endif
> > +ifndef AVOCADO_PARALLEL
> > +     AVOCADO_PARALLEL=3D1
> > +endif
> >   # Controls the output generated by Avocado when running tests.
> >   # Any number of command separated loggers are accepted.  For more
> >   # information please refer to "avocado --help".
> > @@ -141,7 +144,8 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-=
vm-images
> >               --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_=
RESULTS_DIR) \
> >               $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
> >                       --filter-by-tags-include-empty-key) \
> > -            $(AVOCADO_CMDLINE_TAGS) --max-parallel-tasks=3D1 \
> > +            $(AVOCADO_CMDLINE_TAGS) --max-parallel-tasks=3D$(AVOCADO_P=
ARALLEL) \
> > +                     -p timeout_factor=3D$(AVOCADO_PARALLEL) \
> >               $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
> >               "AVOCADO", "tests/avocado")
>
> I think it was nicer in the previous attempt to bump the avocado version:
>
> https://gitlab.com/qemu-project/qemu/-/commit/ec5ffa0056389c3c10ea2de1e78=
3
>
> This re-used the "-j" option from "make", so you could do "make -j$(nproc=
)
> check-avocado" just like with the other "check" targets.
>

Hi Thomas,

I can see why it looks better, but in practice, I'm not getting the
best behavior with such a change.

First, the fact that it enables the parallelization by default, while
there still seems to be issues with test timeout issues, and even
existing races between tests (which this series tried to address as
much as possible) will not result in the best experience IMO.  On my
12 core machine, and also on GitLab CI, having 4 tests running in
parallel gets a nice speed up (as others have reported) while still
being very stable.

I'd say making the number of parallel tests equal to `nproc` is best
kept for a future round.

Let me know if this sounds reasonable to you.

Regards,
- Cleber.

>   Thomas
>
