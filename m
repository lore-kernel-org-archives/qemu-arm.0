Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1275299njc;
        Wed, 21 May 2025 08:41:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOb5A8RDsHcUubvGBMm7mpANQQpo8IOR/WKJyzs0GIzUszW4wePyR8MdN6GjD30mTeWD4oNjKiqwUJcw==@linaro.org
X-Received: by 2002:a05:690c:6c91:b0:70d:f038:6c3d with SMTP id 00721157ae682-70df0387166mr56587957b3.3.1747842097377;
        Wed, 21 May 2025 08:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747842097; cv=none;
        d=google.com; s=arc-20240605;
        b=cFNeWG25tSCFuA3NRf4GQjn+++5WGzoBhktIfX8YFPTmJq9hqdgqROKOMdYZDUYxxL
         BCsefnp0B09Q0e/diVQzpcbgjZsZqj5V7hPHlytpwvK4BXVZcewYotAHjZtxrYw0R2cx
         cuNGeIBdsNcIFmNpa8BTuRSMH3jJ04Mixi5JAJriyF0SICsWjP9h5xTl6a9I4hBnilvi
         DBh2QhXTd2RiZ11y7BFYyF7dQu9+8jxODcL6XcJJW8UwidNEr78NtxqK1jd7QgqKv7WJ
         aMdDo54Z+jbgh58ct62CyXWGpL/n0LljtZ6xEjiD0I8FQ3RzjaBvpPfPGk6aeDnlnPKM
         sqWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=spfLx4z/2w6V3UeSHe3VBdiO1OMuzXoFQOHptwcYaYc=;
        fh=a2DZgWR0mtOhFS50Hh7SCZ9c00KrFTtoPbGnUTdK4vQ=;
        b=lKS/hrbrRpJTMZ0p0o8lpWDZMoe9jCHaXZzM3khMPbKRPolMWoIT0XYdNNaq1FZErg
         YDgPmjqQqDyux3vkWiaB7XaykQM9nbdtketHfypHLetuQUEsY5KtPFPXRQfLuSUyV44a
         viW2R64fR9TsrhjGZ+xVcLDFUNtWfi5V1LA4gSwqo1TF9s4QHfo5eNdITPpuP1fxFQLA
         AG04uwpN+5EhxHyxrCErncHA+34LZ5/zYvBHyEOAgy2WtrmOBOkz0o0ruzs5vpWC0FZr
         0Ue7nucvso9oIHRVwt+tQMCZAEJSGTyoEaES1bHE6BKaGl//mkPk7szKS+S8ZkmHAmvm
         qVzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z5C9l0WI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-70ca8514943sor66491917b3.7.2025.05.21.08.41.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 May 2025 08:41:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z5C9l0WI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747842097; x=1748446897; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spfLx4z/2w6V3UeSHe3VBdiO1OMuzXoFQOHptwcYaYc=;
        b=Z5C9l0WIFdgm0CtvYGldkH+ciPTX6vsZli2uRs47Rcnsgj3tV2UW8lxPZW3y5rZ9Wn
         ENLEUsFh3JkO1U6VWBrWus8O9rkfXZkB5Qlr/pGvw3huw3km+EjY98M/Jmv+AWShW0ND
         U27BF17F86UygJA6hIDn/KZWlylNjAzxBXD3Vh0OXQD51ekuCcnu4Rwc0gLQL23+zkko
         vWZWRXNz1/uz609b65cyJbbPWAGH5sOowEeEE9h9znqIfzAn2xOMMDeSyVmpYaG7r/lL
         gyCPhYaJUysryNT8rI7hYMk1qraXwcdsDqimWFV7KfhaBmx5Z1UMifYYJc7QMihcNwm0
         FtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842097; x=1748446897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spfLx4z/2w6V3UeSHe3VBdiO1OMuzXoFQOHptwcYaYc=;
        b=jXVZUu3lGIlBnBQMXsBPbqx1KtQbrTDthQ+MV1BsZekke71hwPxsEaMLHVeDqFRZMj
         MmjFsrFiDuoKYhF26wzQI//x4pQppRqkY5TpCJEhfX9mnya54T0j5ImkrlZofbd6t6KY
         BpUvS/Rej0Qkkffq66WrakVI+cH9gaLKmFt8WyWf7yu/1bZBROhcgutaRaMZ3oZsJe9j
         nBtz380iE0UNdWhjDwstELM8jsjsHMO4T5AXal5iawnVYkf4nd1Kdz/WnIfKPHfychhw
         iIiFI2SgPAPSR8j++2jvqdjGzXSCrZt802IZH3FQBBiiRmOwP2/B/G/itpWq96FbG9m9
         IlKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC901jyYBqA5EA/rpAKya5PPzBNDdM89jedPfPg6EpppcyQ7XYTOtQuAIt5BPPcieAeUAQJicGnQNcAg==@linaro.org
X-Gm-Message-State: AOJu0Yzx93h7yCg035kJbpCZqdqLuxq9CNtLOUe7LjTMWEt3j0fQabmn
	ys9OmhMSu6XEQPkwl2F/o/Izl8sAcIT+potlGT9nTuYlJpoW04oxShoNYA0G/HrN0GB3Y9NkZaT
	bGSHxHWefMXqeds2co4v5TlFKXxF+bEEhRS79qNRcMcoM
X-Gm-Gg: ASbGncsxrhfVudSnTBUjZOfCOQOiXHGjI5Ltnh+rMMS1nRhiCwlbcKA9i2PIo+KQn/9
	kpcPVXtQ8zXsNhvNuEF3id4uboYLx9E/RJhDIG5OOL9MMSDVS1azXiv1Yt6q1d7chXJSwXNYjg9
	EedZRKNqyY8ODzcMteL1zN8EnvSRkXHPPACka7RP5sYTgE
X-Google-Smtp-Source: AGHT+IE4lqVILNbp+91oyYEN/v1dl/Zmyx+CpYjMBQPP1jiCqBYQw6fdo1H43hpPWRJPQhryy9tig6s4K7Ji5mcRMms=
X-Received: by 2002:a05:690c:6002:b0:70c:beb2:d15d with SMTP id
 00721157ae682-70cbeb2d57cmr238950107b3.15.1747842096924; Wed, 21 May 2025
 08:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
 <20250207153112.3939799-12-alex.bennee@linaro.org> <ee091002-a552-49fe-ae5e-8916937dba15@tls.msk.ru>
 <56e0a35b5c53b416db130c414cd0f3d6@linux.ibm.com> <CAFEAcA8Mzo-Ne48=uFBTcy+CXNcnxGOaW941p=CRkD6gmC=JfA@mail.gmail.com>
 <aC3zT7gOMn4i-d4U@redhat.com>
In-Reply-To: <aC3zT7gOMn4i-d4U@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 May 2025 16:41:24 +0100
X-Gm-Features: AX0GCFv5PEVvm_Y2xRgD4c7fEzTF202zrflBykavwYv7tsKc7GPCnyfB1SeKVGQ
Message-ID: <CAFEAcA_M5cJ3atABVCdR+_p2t3wvr3+Pmesq9Hs39J9c2ateWg@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] gdbstub: Try unlinking the unix socket before binding
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Michael Tokarev <mjt@tls.msk.ru>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org, 
	Peter Xu <peterx@redhat.com>, Thomas Huth <thuth@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
	qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>, 
	Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
	Kyle Evans <kevans@freebsd.org>, Alistair Francis <alistair.francis@wdc.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>, 
	Alexandre Iooss <erdnaxe@crans.org>, Laurent Vivier <lvivier@redhat.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Warner Losh <imp@bsdimp.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5gqqY7bLnCRl

On Wed, 21 May 2025 at 16:38, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Wed, May 21, 2025 at 04:34:24PM +0100, Peter Maydell wrote:
> > Also, mjt's packaging for Debian puts in some stubs for the
> > offending getwpuid etc functions, which suppress the glib warnings
> > (this is why he noticed this whereas none of the rest of us did):
> >
> > https://sources.debian.org/patches/qemu/1:10.0.0%2Bds-2/static-linux-us=
er-stubs.diff/
>
> Oh interesting, I was conincidentally wondering if adding dummy
> stubs might suppress this.

If we do I think that g_assert_not_reached() is probably better than
returning -1 etc.

> How about we pull that change upstream, and expand it to getaddrinfo
> too ?  I like the stubs much more than artificially splitting up
> the source files

The stub is still effectively a runtime assert. Splitting the
source file gives us a compile time guarantee that we don't
call the function, so I prefer that.

thanks
-- PMM
