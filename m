Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp986965njb;
        Thu, 1 Aug 2024 08:39:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+dAJEg1rbe/1rNMMJj69uXMWYN56xGStbVD5tY5dSdg0NGrFGtM+QhJIRGene1VwOs2Nn
X-Received: by 2002:a05:6358:2829:b0:1a8:b066:e266 with SMTP id e5c5f4694b2df-1af3ba79baamr46767155d.13.1722526787566;
        Thu, 01 Aug 2024 08:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722526787; cv=none;
        d=google.com; s=arc-20160816;
        b=xw9/FvumdGYf2sdjP9IlHgiyxcCEFeQvgNJMSWrzQli1QS6k+3X/TJ+zRqYDDm3Y6Q
         KkBpE51mUr3rtr7HoFkQUvNyLxd4ttDVhyoWh3uz2oCYBWWaqF+/zL9lvk+y4FY1EqXD
         yg9E5wriUIsHxJbTtJEybwtMtWxrw1uuWI7zy2fhezhDbfADc/ZjkTLi98XzPFOixwNK
         xq3CPmSCI5JhloUeBQJWMMm7GqSw0+w6tnBV3RlZ/jpds6vfG0wwTQXQhCkR6yplyDYq
         R2QaSbwf/tCwJGR9MU2YpVoHjkE5Siw8QE8mt1X6KljNy5DPuUXmaVOYFFsyR4HMPLuE
         t+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvtcL26MELukLXBLKiU1OvgArmvH0sx0AOPSGAsOPYQ=;
        fh=e92rbrHlyi7XHkE0igr5/eFmBvKwI+b0KFGjtUgMMk8=;
        b=A6Z3dSYpz+LP3Ed+elNYZfejzmD4UuaIYX0fxnyzN+3yVm20nIfV1VKx45HpTOjTei
         2YtYMCrvuL+JG/a2OKAWPBbtPDrq5mxKol6IRX/NS/dN5kY3xAnERDInviCzG2LigPBC
         huw+zWWVEVNcoq4+HeYlB6Oh62papl7BUTpGIzb956OuuHzLvIoGnovEigIvVjcdjbJm
         GpCLYfZinOiubhszf0Ljy6u52h0tNEQYge4r39E9M8OSCPj+/RMgGTTYm3vutSDBmJxG
         mKN0XAFjbGagsFV3RC3vwJXzn28X4Dmbm3wJFFoDV0o/N2hWsaHJH2x9SEnsZT3R76DD
         /09A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PtK89mur;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4945dbbc66esi6886137.393.2024.08.01.08.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PtK89mur;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722526787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cvtcL26MELukLXBLKiU1OvgArmvH0sx0AOPSGAsOPYQ=;
	b=PtK89murbmqpf5X7opHSGe0ko272oJBhFrenHW8y1gIdtzOQigTYEhf/5h2y+LiVx7yE+I
	G1kve+Z/7x92l7sdctXxgw2UnAtCuSY0J4IPJC4oRW1X2SP0i24DdUIuH31obKpLWgdl9H
	UDbHc1TEkobntn4PFpr6i4k7i9PHqaw=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-fkEvTGPrN1yKfsDM0UzTKQ-1; Thu, 01 Aug 2024 11:39:46 -0400
X-MC-Unique: fkEvTGPrN1yKfsDM0UzTKQ-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-6688b5b40faso167157567b3.2
        for <alex.bennee@linaro.org>; Thu, 01 Aug 2024 08:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722526785; x=1723131585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvtcL26MELukLXBLKiU1OvgArmvH0sx0AOPSGAsOPYQ=;
        b=fy9LE/lbWccybhafA2Nv8gap0y9YYlqfzvr5IGvnxIFBjR5sdQQH69fnC+C7lKKBn6
         DXiXIAWKpFwkRWDJaa2O9qwBWqZejnDSNgylBzR16gLRujx/EbmxXzs/wHxiqyAZdedU
         9B0xlInLO5hSfTEKWM68parAYaYLSDA7jgm5sWSWmfmrcLVS4oMoHLhI/HwZxkvdixYU
         +z9jxhy+yWkofXzMqXq89lFoqJtBXIoKdAvre65Ds8+3j2KiDUOFwdybofmrYCCV7IQz
         2IYGgxbLGLPOmeZXWaYazDqrPVq+ZSJHDfn9zB/ZSLZLQJHxJHsUgpJyCNhdAH0JX/GH
         DabQ==
X-Gm-Message-State: AOJu0YxdQBV+Npd6MAvu3GXYNeCCW0/GAiVOjfyl7ZtaQyHMvlHnUJAy
	eVcHCMeCadq9RCxtLmmp1FN2J7u15A6kHZyx/OLP5pAZG5gDv7BYoo/nqarO6/wqj8O4usgpKja
	Bo2+DOuNkF3OYimQzdxfgf3FHaQWGl25qSLNeVw7nTbM8mM9ogQ2IEDofYAvQ65wVsAesI2G6le
	+PcX+qzURBFqdPlcOMDSWTyHdabrX6Llk6jn2okRNmYw==
X-Received: by 2002:a81:6ec3:0:b0:65f:851d:8fb with SMTP id 00721157ae682-689614169ecmr5418637b3.19.1722526785247;
        Thu, 01 Aug 2024 08:39:45 -0700 (PDT)
X-Received: by 2002:a81:6ec3:0:b0:65f:851d:8fb with SMTP id
 00721157ae682-689614169ecmr5418347b3.19.1722526784938; Thu, 01 Aug 2024
 08:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240726134438.14720-1-crosa@redhat.com> <20240726134438.14720-8-crosa@redhat.com>
 <Zqd10nIix4gXKtDw@redhat.com> <63ef2c5b9ab213f544173df027abf5b056d59e8a.camel@infradead.org>
 <87wml0coat.fsf@draig.linaro.org>
In-Reply-To: <87wml0coat.fsf@draig.linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Date: Thu, 1 Aug 2024 11:39:32 -0400
Message-ID: <CA+bd_6JNRhj4K48Fg_yb7KeXmEYgzxyT1NJJJ6K0yFxamc9UwQ@mail.gmail.com>
Subject: Re: [PATCH 07/13] tests/avocado/kvm_xen_guest.py: cope with asset RW requirements
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, 
	Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: DOup2xBxbiG3

On Thu, Aug 1, 2024 at 10:26=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
> There are no real failures with readonly=3Don although you do see init
> complain a bit about not being able to mount /dev and open log files.
> snapshot allows that to happen but doesn't change the underlying
> storage.
>

I could swear I experienced failures when I developed this patch.  But
like your patch b9371a7b90 already fixes it.

Dropping this one.

Thanks!
- Cleber.
