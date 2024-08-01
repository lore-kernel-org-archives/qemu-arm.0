Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp689690njb;
        Wed, 31 Jul 2024 18:02:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJBxLfq7SyNsK4MhVTSm/CBe8Tjpe7U5M6Sj1p/I60JswcU+AxSWPes825aIa8sWU5fsZmWb+i2JdVmESPQhy55hxT4bAB
X-Google-Smtp-Source: AGHT+IEcacVxROTdjTjrDQaCQ54jAzL7zyzWlTzraKrtP3IUvAaAratzazhNbhswwAvO6AoCuhWK
X-Received: by 2002:a05:620a:171f:b0:79e:fb1c:a1a4 with SMTP id af79cd13be357-7a30c6518e5mr104244485a.18.1722474170199;
        Wed, 31 Jul 2024 18:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722474170; cv=none;
        d=google.com; s=arc-20160816;
        b=odPg0NpI02nCHOKWalHREwMyFhT8cgW8fgeopJHQ4eExPkanS3nSZKzUUaC2dIxGLL
         3eQSzxVzW0u72C9tDZx38dwSnUeCFOA1RY3XTJdN9uFrZdZJi7ge/rIU2CALAlF1ZOka
         nzc1RGh+vHMFdj+/1fdqdTXbbpLzDXUxFDQNcgDlRkvFOqR/MmtkQSD3TwE8e4alL1Fn
         7kpOn3E8XQSwT3f4NYTEXSyKRBVcEmraTsFKTh/SPqjPtyjOgiBPLEER/ik/+B0iKIR1
         2WDZUZzG779wvJKF/ZtY42ep4Zwknml4n22TUxzaA3SM+OElJVhOfC1MgqEMK5tQ3Dso
         JeCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2EPtgXVG1DmXN8mUPqzXK4hPCx8jDKiZuZxR6dbrnTQ=;
        fh=gzJzf/cQb8bHJAW/9I2MGK20Tnl7y05Tm381Tbt/Pf8=;
        b=W6g7IufMdVeUm09Mi+2hQBJ06D0tEzDQElKgGGceZfBIOwzW60ErmOzpVTAPuXKHvr
         R/wacykjGPVWKuNHfaDleWFaTJCEt5Jk2zMrebA2kQvobO/dzK9RoRggaufLAye0oqzQ
         UJy8pIGroG4Ngz9Rev4YHrFczsIb8MnyyB55/f/Tqm88WQ1rCQp49llirU4hMgX0zJWD
         ejGgXhVPAFQUeNt9uO5omzpfzwCd8nU6RzfXnMWPJeJsD3On7H8BkWM6titLJ3QgnOTc
         uAT3NlLV0WAaUqk00iSKuoDkli8cN1cpu5rzIYizxh4ZqyrKPfznO/LnFGNrZ1xapFKo
         Q/FA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K67U6rB8;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe8136894si168529861cf.73.2024.07.31.18.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 18:02:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K67U6rB8;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722474169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2EPtgXVG1DmXN8mUPqzXK4hPCx8jDKiZuZxR6dbrnTQ=;
	b=K67U6rB8qJl5o215w6zBP53N78+ecuQTEfIsQt/3PKBtmQFBc1X76wpZGgayD2sSAmIi+/
	luTSnAxP5MM4+QeGzpeflLHmpj3uahsmLpEfnijqfrpZp+I7YHSag+WxPhTqmFpw+9rwX5
	VYPtidLgDQ8mzdhzAOktMTkUG3y8fZ8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-QrQnVrSzPT-N7De5oYSKWw-1; Wed, 31 Jul 2024 21:02:48 -0400
X-MC-Unique: QrQnVrSzPT-N7De5oYSKWw-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-66b8faa2a4aso130100847b3.0
        for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 18:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722474168; x=1723078968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EPtgXVG1DmXN8mUPqzXK4hPCx8jDKiZuZxR6dbrnTQ=;
        b=gB0+jAl94kVH1C5fC9Mr/k8AtVI7HcPfKTkpG7zngMWL60u0usanBCoAXY0yejCRI9
         R68AYwpMEnTh9jIcBbn8ayDHsvQ5YheErHFMSvscZLKD5s48saZXwoISOXzPYJ4ORgz4
         KjI6LAh72CoX2egQoKwbI4QTdbkf4T2L78KrUhmzd7O85leIGoWiMuFeDwGBtUA3Wx0v
         av8KaQ2XXKY2dQCxrqDgnyPhwVKIPx1jnpLQNFTGI0+0NU89YccPRb9luPt3pRmCrOuu
         KN6WxDLuTY4gRJ6BKy53WVVdrS2+cnibFlC2bqqvEM5iNhXMZd5lbbZ+v3+z2NQVgANt
         DBYg==
X-Forwarded-Encrypted: i=1; AJvYcCVa52fcg3pbkYpNsrtVGnvaSYoLs25CY0aIKVVGLqqnGN4kjh7J1qtEaMi+1b3CXcSgYjYf812ZOwTOc+wUtHDRrD2PXNwK
X-Gm-Message-State: AOJu0YwSe1wtPmXAvQhw8k0nDMnckz8/JS/gfIDyu9c0+yeke0c5VzG7
	SvpNn0IrsQ05727pYIToLJS5c0x5W5pl093aIfsE+SclOBXFxZ2SWx29xFJBNM/D06rXe73H0sL
	yQQu+B7wygynfdYraGUNiEaCbXMx6RzwXNa0FJwPl2ad5CUkI468Zk40nRD2NUc8dLM0nDW9BS3
	fbFTXH0TUM0pCsP45sd4OrPuJ0v5eVHiswvMpA1Fs=
X-Received: by 2002:a0d:d2c2:0:b0:65f:7cee:43b with SMTP id 00721157ae682-6874c831fd1mr1432697b3.19.1722474167829;
        Wed, 31 Jul 2024 18:02:47 -0700 (PDT)
X-Received: by 2002:a0d:d2c2:0:b0:65f:7cee:43b with SMTP id
 00721157ae682-6874c831fd1mr1432307b3.19.1722474167551; Wed, 31 Jul 2024
 18:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240726134438.14720-1-crosa@redhat.com> <20240726134438.14720-4-crosa@redhat.com>
 <ZqdvR3UFBCAu8wiI@redhat.com>
In-Reply-To: <ZqdvR3UFBCAu8wiI@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Wed, 31 Jul 2024 21:02:36 -0400
Message-ID: <CA+bd_6Lepg=uXs1NViYV5eZBGot2ZRAYUi-NDXwSBsdBk17LPA@mail.gmail.com>
Subject: Re: [PATCH 03/13] tests/avocado/intel_iommu.py: increase timeout
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, David Woodhouse <dwmw2@infradead.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, 
	Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: s5LPHc50vZIQ

On Mon, Jul 29, 2024 at 6:30=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Fri, Jul 26, 2024 at 09:44:28AM -0400, Cleber Rosa wrote:
> > Based on many runs, the average run time for these 4 tests is around
> > 250 seconds, with 320 seconds being the ceiling.  In any way, the
> > default 120 seconds timeout is inappropriate in my experience.
> > Let's increase the timeout so these tests get a chance to completion.
>
> A high watermark of over 5 minutes is pretty long for a test.
>

I agree.

> Looking at the test I see it runs
>
>    self.ssh_command('dnf -y install numactl-devel')
>
> but then never actually uses the installed package.
>
> I expect that most of the wallclock time here is coming from having
> dnf download all the repodata, 4 times over.
>

Exactly.

> If the intention was to test networking, then replace this with
> something that doesn't have to download 100's of MB of data, then
> see what kind of running time we get before increasing any timeout.
>
>

I was trying not to get in the way of the original test writer.

Eric,

Are you OK with replacing this command for a simpler file transfer?
Any suggestions?

Regards,
- Cleber.
