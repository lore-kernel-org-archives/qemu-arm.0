Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3026140ejm;
        Wed, 3 May 2023 11:33:00 -0700 (PDT)
X-Received: by 2002:a05:6402:88f:b0:506:a44c:e213 with SMTP id e15-20020a056402088f00b00506a44ce213mr2455159edy.20.1683138780870;
        Wed, 03 May 2023 11:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683138780; cv=none;
        d=google.com; s=arc-20160816;
        b=KYfp+MGtmEbMf7rpqsds+SCoh0hsRlrb/7Q85WsuCX4MiPbZPMcJbSEPA6KnBUzBMn
         nXtcVu1BBXSxsn4pyYZtXfsmDC4/vaU8crZHUf0bI5BXay+mBDl1eIjibMKivOprTm9b
         1ItRVKBVEZGWR7mxJzOXIir/lUb897/v9p4bvboiBXactHLyTLHslPRnd4uu5eyPow1A
         heVoSR2qsnlW0EiHLHuDmgQ8Fk7wBUz5IPMpxrffJrXO9eAanHqjWcPLggHYENHMvT+r
         dcZNpIffg7agYPaXRXY5HQIWuETsZd1/Zkue1hYv/JjavHuaqzx6qq1kRQEfRBWGhn7i
         1L0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7HPnytuNr2tTl/GqvQTToDLhcLLgMbXFPrdQg6Ojybw=;
        b=DqfXl4hFTS1hpez/nqaiDu9D2QO3tomn+S9N/SZfqXROR88tA02Ur8RxbADRws/uuc
         xGMrJ9TG+Am+G7IWi7n+EYjq+pgIVjc38GAb/hKi7pTKvzjZyv78afkMzwfchQ16/FYm
         KTNPgZd4G37JVErhqDLthDEpcSKSSs8jU4wzYxnUK5fsPmt7nfiyFHEQH3W6u9A6uXUx
         VV2J2xoh/MAlgN3eot66tj59qA+GNIGd8xJgmpb0sPgV8mYvFp3ZEG4xPa0ZO1av15lg
         d7EBd53gBjIuqbo5id6U04CktrRrRDzCmOqU+wUe1LrqlJbDQGEV+Y4bhGkpOYpscKkT
         eScQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MFLbub58;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id es7-20020a056402380700b0050478b980a4sor432358edb.0.2023.05.03.11.33.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 May 2023 11:33:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MFLbub58;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683138780; x=1685730780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HPnytuNr2tTl/GqvQTToDLhcLLgMbXFPrdQg6Ojybw=;
        b=MFLbub58dPc9NKR90AB/sEh2260o1RKuuap6Ha3xOjiRynr8xn97i3mAFNhjFaZTFu
         ld4lhG7WettebZ2LBvk4y1qO2kd+PefOfjUgqKD+FeOPgZ3aZIYgOHVQmkkr1p4OHfK/
         A0UF5Yr618w9HPaNiS/SRnWcT7jRrCA9/spWB7rB9DMwTvE2De14dOMT/q0jkR9EmEQo
         H5z3sDEo0ERqWnRkyIXBFdzaNzsfpzpmSvLZ48pN1dftUAzqCQdrLftJlPfB0Qyql800
         +5lR5DcGyEZmaZXi/XzrwR1BlBi8G1UfIGaa4b5PX+KBYRE7zONiOjZIj+PrLU/7Yg3l
         avCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683138780; x=1685730780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HPnytuNr2tTl/GqvQTToDLhcLLgMbXFPrdQg6Ojybw=;
        b=UK2uNx0+/tpAouMrcjKllvYwwcxgGomAdkfhnLbpQodg6Fm4hAoaJDOoltXRVJvFd0
         MyUGfpkd3rBkCL116+JedAM/el26lnTXQVXgIstbd5ENwNCbUYYR6du4xjEqhm2H1TGv
         Vx4mT+3lSeWReH2L1rqiMHDFdD3ctpB93RnCahcdooGqlYwzMlp0A5Hp42JxtBI+wXnw
         XxMSGvz9/ptcy1439R6L2fQcrmnOHl2wL363EF/l2Z6usQrQO2wCFwWdFDGhAflY61vS
         0wGbDYAd0MbyO+q9IlfCwj5lOcyL2T06lPICK4rQPxXPBo6f/pK4ZKvAdC351id8NWd3
         2e3w==
X-Gm-Message-State: AC+VfDxaN1KFUxf1mfgcZMFwua18L32lEttn49Imuf8EFeZXlaLUkDM3
	lUPLL33bwnCmiEyc/fOpvz0vCnmpwCngAIEezNUYJY2k
X-Google-Smtp-Source: ACHHUZ5s7h/c5A0PtXntSGXjorpj0baJSPHTvsdXxqvcb457iHeabpO+RRkLPMuBaCTKEdcnCz9wP2v7SHw34UIEduM=
X-Received: by 2002:aa7:d343:0:b0:504:8a2b:b3c7 with SMTP id
 m3-20020aa7d343000000b005048a2bb3c7mr2695328edr.11.1683138780347; Wed, 03 May
 2023 11:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org> <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org> <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
In-Reply-To: <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 May 2023 19:32:45 +0100
Message-ID: <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Beraldo Leal <bleal@redhat.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, 
	Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: YqJ3ktpQ2eKh

On Wed, 3 May 2023 at 18:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 5/3/23 17:35, Alex Benn=C3=A9e wrote:
> >> You should select a device only if you cannot even start
> >> the machine without --nodefaults.
> >
> > Which is the case here right? We could skip tests that explicitly
> > instantiate a device but these are tests failing with default devices
> > the machine tries to instantiate.
>
> I'm sorry, I meant "select" directives are needed if you cannot even
> start the machine *with* --nodefaults.
>
> Devices that are added *without* --nodefaults should use "imply"
> directives instead, as is already the case.

Do we really want to build a QEMU that then barfs unless
you pass -nodefaults, though ? That doesn't seem very useful.
Something somewhere ought to be saying "if you want the
virt board then you almost certainly want these". Or
alternatively we should fall back to "don't create a
network device we don't have", maybe ?

-- PMM
