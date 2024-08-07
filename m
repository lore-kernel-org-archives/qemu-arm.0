Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp460361dlb;
        Wed, 7 Aug 2024 10:26:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfWXCTiMy1z53tuafW+a6ap48lzEFYrSos7B9IcCEAkyhuXT5R65gVq4X9UphkyEagyh8vlkdvr2/9As4E7zixhqmfc6k0
X-Google-Smtp-Source: AGHT+IHHC76oOjVtVZKfcEEUqjAFCE896davyDbhGSXgahknAOGfOwXGBGhQpkRqsZlFnNuh+/cv
X-Received: by 2002:a05:6808:1206:b0:3da:4c28:6697 with SMTP id 5614622812f47-3db5582e23dmr23546548b6e.38.1723051576483;
        Wed, 07 Aug 2024 10:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723051576; cv=none;
        d=google.com; s=arc-20160816;
        b=MhbyeyLV9gdA0HnqShJk70A1kBpoLFM8EZ21pdhPe8msuyaWkCydAgTOp0r2Nf1XS7
         aVnfGCKww1eTpQ9uU4a9t4A7do/6Yz8DLHDI7RF7YjjGUXg5jHtON6bd9g2VDLX81vuF
         m/D/sgf7mVh5PEl26T/qSKRkaKZ3uAQNayQllwCgHieNObxyK6QubftM4kTM3BoCLjHb
         ZdSGpYMhC/1wxmDWIC6XqgGTvxzQKYkkMZdl3ilDHhvP3f3wDVc60H/wMm3bm2P4gdUT
         U1jOWZKLoF0hG+H4GHhXzLeEmHwhVPJLwImdfGjpn6EvK5ZjjSzZ7GxJtP+gpTTIJ/VC
         K6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H5QV4+iopPwY0m4DyFRDxo2bCkauQC1irFXatbAdCSc=;
        fh=FX4BZXOl5Sz2E8AIVn2HcfkcP7j5I3rthFzyXlYsQqk=;
        b=PCb70lj03xemYKm5KaIgyDzVig7uFBBnIBAunFR8A+9kCaLrhpToP4onFEUfzgqteR
         iVx7N3rRdHW5XjLv41/WDo/j5GTEXazL63MO5b+3K4hEnSER54NEwqzbgXCLsKUXmwZf
         psT5Rb2XKqDa9uW4hT3FSYVmalYjCZ/RFDpiT/ybkTfcvuU1Qv9JZslZmu5iXlDFaF/h
         h/qoXRRAK6vm0hDma2mZi+qTWdSZsuVVRw+ufUpftuTaHnMKjBtY2C5WcHDUDfPzrsSJ
         1+TvSD4hLbICWBLH3FvNzrFPFCWpc9jKUJGBGKkBhHkXTbrteDM1KAe7igTnjhPKkbNK
         rosw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N+akD2lF;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-451c87d7f96si19859041cf.276.2024.08.07.10.26.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 10:26:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N+akD2lF;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723051576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H5QV4+iopPwY0m4DyFRDxo2bCkauQC1irFXatbAdCSc=;
	b=N+akD2lFoQDJlM0ZhoKXXIKh69GhszAMLwTH9asZxBkVm7QZ6wUq/kj1kjn0rr8nc8OP7x
	2vybGEdegsib9TDnowSmvrm18XxA7C/fD/lA1Ynb+M2keyps81ywAQ+jkR2B45z6LLJsgC
	cq7z8we+QhVdMyzfXNDmx2MnH+HOhws=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-r34IvgymO1-9aBwhADgHxg-1; Wed, 07 Aug 2024 13:26:14 -0400
X-MC-Unique: r34IvgymO1-9aBwhADgHxg-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6506bfeaf64so1722837b3.1
        for <alex.bennee@linaro.org>; Wed, 07 Aug 2024 10:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723051574; x=1723656374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5QV4+iopPwY0m4DyFRDxo2bCkauQC1irFXatbAdCSc=;
        b=i7tsktBnxDujtRDaEqrnT5hGpSumPN/dTW5Bwtt85/EEm47QsoDzOY7kvmQmThaaq1
         3Lb+AsM3Can/W4XRu3Y20g9HpW6zWXZmFUmeCsxx+lN9PvgA+HHHoHqREoTgp3/hYYih
         XE6V4B4+SStkeAelF5bmLFSuuBIDeD1ZRzYkWBGLFyAycJB35yRdwYdgWXAazIaO/KKq
         ENIlvXNQN2KI9KZESntKalumjScFQecYIXXaZIZrBpItKj4OGFkaXFGe7U6JtgUISTYi
         CuallQXa8nQP7GrEJ3wLlEC4S8rhMzf/pRK3+1GGbHIWQ6fwuJ25Yifwk/kxda3UXkWU
         RF3A==
X-Forwarded-Encrypted: i=1; AJvYcCWiZMtfGSH3P2SjYUTxe/D0U26NKxK32O/TylhoCkNTBTYCR13x6bnrykmr19wD2h0IoiXhJDi8aUzdWR7wJ7hR1XTP0lkd
X-Gm-Message-State: AOJu0YzJVPgSg3PX09qWpmMo6Q/2kIUusp39ALXUTxaqzOpFWf5yth5d
	UcdBRZVOqkiCvzLXs+tvHFX4DT+9z03bemxmCDx46L/+6Isa50nbcik6AFuUGnmTzw/DABFLmiu
	5eqs6W6dBBB1/e0NSoXVwgT5rdd9UBPv263enUyK7D5moSdxOKwGEeJ9vKfmLHrp1p8sXvuoxHs
	vJA5RBmwYmhxR+nEchrv1ckeLf2mf0
X-Received: by 2002:a05:690c:2910:b0:632:77ca:dafd with SMTP id 00721157ae682-6994e688610mr28408357b3.10.1723051574402;
        Wed, 07 Aug 2024 10:26:14 -0700 (PDT)
X-Received: by 2002:a05:690c:2910:b0:632:77ca:dafd with SMTP id
 00721157ae682-6994e688610mr28408047b3.10.1723051574034; Wed, 07 Aug 2024
 10:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240806173119.582857-1-crosa@redhat.com> <20240806173119.582857-9-crosa@redhat.com>
 <fff8c0f4-881a-4317-857a-0d20a72484eb@linaro.org>
In-Reply-To: <fff8c0f4-881a-4317-857a-0d20a72484eb@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Date: Wed, 7 Aug 2024 13:26:01 -0400
Message-ID: <CA+bd_6+-9Mqu-qmRowXhRUSVZenY6dugVE+no15coxbCot1Lkg@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] tests/avocado/machine_aarch64_sbsaref.py: allow
 for rw usage of image
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Radoslaw Biernacki <rad@semihalf.com>, 
	Troy Lee <leetroy@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>, 
	Beraldo Leal <bleal@redhat.com>, kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Paul Durrant <paul@xen.org>, Eric Auger <eric.auger@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, qemu-arm@nongnu.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Jamin Lin <jamin_lin@aspeedtech.com>, 
	Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NuMmIJE9id8r

On Tue, Aug 6, 2024 at 3:30=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> On 6/8/24 19:31, Cleber Rosa wrote:
> > When the OpenBSD based tests are run in parallel, the previously
> > single instance of the image would become corrupt.  Let's give each
> > test its own snapshot.
> >
>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ?

Yes, sorry about missing that.

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>

Thanks for the review.

Regards,
- Cleber
