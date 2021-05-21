Received: by 2002:a0c:aa83:0:0:0:0:0 with SMTP id f3csp118979qvb;
        Fri, 21 May 2021 05:10:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtx+gZVILVwRowXwlO7GiDqUZVwFnnwD/ic6Sdr2GUEN1AhWh9vhX36FlW2pdbYINycEjq
X-Received: by 2002:a05:6402:cb8:: with SMTP id cn24mr10670596edb.325.1621599028205;
        Fri, 21 May 2021 05:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621599028; cv=none;
        d=google.com; s=arc-20160816;
        b=rEvV2S811C7K5Ec8vB5r7l1cm+IbiwlT/Toalnw42r19lElbVQJ7Prh0Sf56cUx8Wz
         QJVs4TI+cv4Jsf8hfnrN7J+CfWcBlQi3mdY/XW9OO6r0ZlFMv6GJDVCoGe/FA97bk4nW
         zoscXIstF384kEVrT4/lo+q4mH1HgSMnUxy7qUKIrCqTpNjQPUX0PcHZ5bbgZ0ADXk8j
         dNAFejRvI/9UyNTDQSlfKtEwcyekARmAHpYgFZEfzgm7ACxnmfiTUBZb3aeRkzhWb4aq
         ZEApWQSaxmslliYHJlyTdlldJEjT7Q6WxKHPyq5RfKG5ihCHJTio8mT0bfcGXapqXVkG
         EA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bBn7z0ovxKhCSlvrYap6fcOL12MAz+pHNhgvYTppXhc=;
        b=g/fvX3VMfmpszv+V9GcIOgQoSdt2f7LsnmCJ2jbRZeexrtvvbNevPZMQrIFDt2k1Tk
         Sa9nDG3oXXHC6/CbHPcU8DoZQTmKkKhoSJQozoSb8ccO87I5nqEFi2bCKAPFkVZ/Owkg
         8LtobjM90RR7HdjsuhhZbktHzSMpi3tdfe+pzD2B4y3FmEUV/O202QbXpfk3virt+P3M
         FcPPl1AfyUg5EfUZxGFeC6DSvbpJnSDYGoxW7YzF/iURYTq4zr5Fn09a9HKNnDHqMXPt
         /NaXK5MkBLkWnOqlNb3ysxKfEp+ZHKP03dKBi70NH3kljzOIaMYuPldAS3kknevVrhfj
         RZqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iNBmrovO;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wrampazz@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i11si5685711edc.325.2021.05.21.05.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 05:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iNBmrovO;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621599027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bBn7z0ovxKhCSlvrYap6fcOL12MAz+pHNhgvYTppXhc=;
	b=iNBmrovOIf9qf+4on/O5pQTlIC9LaoKS5KHMtDkIK6VEzB1hE87hCL/e08WisTUhIjKE2w
	RwN+YVGEWJixHmUPxGI/JR0kH/JUtzhVQ9ut6ReRajXno8kNgfu/ZFAYM+kioXpizVmVTI
	+hiC+ZR/kJJ0wcEuhkTRRwiAnca3dNU=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-cwDjIxuPNpqMHzXuTuIQkg-1; Fri, 21 May 2021 08:10:20 -0400
X-MC-Unique: cwDjIxuPNpqMHzXuTuIQkg-1
Received: by mail-vs1-f71.google.com with SMTP id f20-20020a67d8940000b029022a675e6e86so6610298vsj.2
        for <alex.bennee@linaro.org>; Fri, 21 May 2021 05:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bBn7z0ovxKhCSlvrYap6fcOL12MAz+pHNhgvYTppXhc=;
        b=V5cbdsNEJ17tRpjR1TSHurh8idsWUSFHwWUZiccoRSgyvLqMBHUwFTZIjTlybhPCwR
         Y1rn43VUm/IlbyDsJPEn2o2TBwsIKXpgq4yWapSBR0DZ+r2SHyEZ8A+iic8sXSTrhJlz
         cnzzMddw0xdhrqSFD4sZFGFQkmAplCXEM1V4ABu28uGIMFcxKrqCuK8bY+j3kxqPJVBZ
         6fYuSYODU2/FXbG6AFPgrKfBUrxTlgoWGw4ZBBQi4g5oMq8KQoumpLfBJlgHETS8yEer
         PxCKCHVI10zUsCB9S5bmfEWOTADir4BVX/P0vCjdY+QCA56Ud9Yf5JVgImvQlTiIZAFX
         4syA==
X-Gm-Message-State: AOAM531i2eW6lkeOswPWAbaqYrLSsXFtQ+7IznDu/lI89XYvOOLqPote
	2qSEjgaADQLrZNuysog+Cp/biC4uwtfZREm+nMCGzERtezOHRTx32A239LhWtxKl7/wYOqEL7YG
	ZfnacmyhtBTbUDmg+r82Mzunp4mZY4HUZ
X-Received: by 2002:ab0:4042:: with SMTP id h60mr10070491uad.133.1621599019766;
        Fri, 21 May 2021 05:10:19 -0700 (PDT)
X-Received: by 2002:ab0:4042:: with SMTP id h60mr10070455uad.133.1621599019468;
 Fri, 21 May 2021 05:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com> <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
In-Reply-To: <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 09:09:53 -0300
Message-ID: <CAKJDGDZgEKyGJmAWNWTSRbqqb8zqWbabQX2Sup5ziiiq-cZ_pw@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: IiVyUeNvuO1A

On Thu, May 20, 2021 at 5:28 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 5/20/21 9:53 PM, Willian Rampazzo wrote:
> > Conceptually speaking, acceptance tests "are a series of specific tests
> > conducted by the customer in an attempt to uncover product errors befor=
e
> > accepting the software from the developer. Conducted by the end-user ra=
ther
> > than software engineers, acceptance testing can range from an informal
> > =E2=80=9Ctest drive=E2=80=9D to a planned and systematically executed s=
eries of scripted
> > tests" [1]. Every time Pressman refers to the term "acceptance testing,=
" he
> > also refers to user's agreement in the final state of an implemented fe=
ature.
> > Today, QEMU is not implementing user acceptance tests as described by P=
ressman.
> >
> > There are other three possible terms we could use to describe what is c=
urrently
> > QEMU "acceptance" tests:
> >
> >   1 - Integration tests:
> >       - "Integration testing is a systematic technique for constructing=
 the
> >          software architecture while at the same time conducting tests =
to
> >          uncover errors associated with interfacing. The objective is t=
o take
> >          unit-tested components and build a program structure that has =
been
> >          dictated by design." [2]
> >       * Note: Sommerville does not have a clear definition of integrati=
on
> >         testing. He refers to incremental integration of components ins=
ide
> >         the system testing (see [3]).
> >
> >   2 - Validation tests:
> >       - "Validation testing begins at the culmination of integration te=
sting,
> >          when individual components have been exercised, the software i=
s
> >          completely assembled as a package, and interfacing errors have=
 been
> >          uncovered and corrected. At the validation or system level, th=
e
> >          distinction between different software categories disappears. =
Testing
> >          focuses on user-visible actions and user-recognizable output f=
rom the
> >          system." [4]
> >       - "where you expect the system to perform correctly using a set o=
f test
> >          cases that reflect the system=E2=80=99s expected use." [5]
> >       * Note: the definition of "validation testing" from Sommerville r=
eflects
> >         the same definition found around the Internet, as one of the pr=
ocesses
> >         inside the "Verification & Validation (V&V)." In this concept,
> >         validation testing is a high-level definition that covers unit =
testing,
> >         functional testing, integration testing, system testing, and ac=
ceptance
> >         testing.
> >
> >   3 - System tests:
> >       - "verifies that all elements mesh properly and that overall syst=
em
> >          function and performance is achieved." [6]
> >       - "involves integrating components to create a version of the sys=
tem and
> >          then testing the integrated system. System testing checks that
> >          components are compatible, interact correctly, and transfer th=
e right
> >          data at the right time across their interfaces." [7]
> >
> > The tests implemented inside the QEMU "acceptance" directory depend on =
the
> > software completely assembled and, sometimes, on other elements, like o=
perating
> > system images. In this case, the proposal here is to rename the current
> > "acceptance" directory to "system."
>
> Are user-mode tests using Avocado also system tests?
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html

Yes, they are considered system tests because in software engineering,
system testing means your software built and tested using external
test artifacts, just like your example.

>
> > [1] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, =
A
> >     Practitioner=E2=80=99s Approach. p. 430.
> > [2] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, =
A
> >     Practitioner=E2=80=99s Approach. Software Engineering, p. 398.
> > [3] Sommerville, Ian (2016). Software Engineering. p. 240-242.
> > [4] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, =
A
> >     Practitioner=E2=80=99s Approach. Software Engineering, p. 407.
> > [5] Sommerville, Ian (2016). Software Engineering. p. 227.
> > [6] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, =
A
> >     Practitioner=E2=80=99s Approach. Software Engineering, p. 377.
> > [7] Sommerville, Ian (2016). Software Engineering. p. 240.
> >
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
>
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index f718b61fa7..c5de3c9fd5 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -52,7 +52,7 @@ include:
> >      # Avoid recompiling by hiding ninja with NINJA=3D":"
> >      - make NINJA=3D":" $MAKE_CHECK_ARGS
> >
> > -.acceptance_template: &acceptance_definition
> > +.system_template: &system_definition
>
> .system_test_template: &system_test_definition ?

Agreed, keeps the consistency.

>
> > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > index 8f220e15d1..c580292bb5 100644
> > --- a/tests/Makefile.include
> > +++ b/tests/Makefile.include
> > @@ -16,7 +16,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat=
),)
> >       @echo " $(MAKE) check-tcg            Run TCG tests"
> >       @echo " $(MAKE) check-softfloat      Run FPU emulation tests"
> >  endif
> > -     @echo " $(MAKE) check-acceptance     Run all acceptance (function=
al) tests"
> > +     @echo " $(MAKE) check-system         Run all system tests"
>
