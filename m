Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1143109ejb;
        Wed, 24 Apr 2024 23:28:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUA2TECWV0TQy9yoVWkVcZMns6960kvPm5yltQGaOTSC7cdpwAHRcv9RYUcwCVnyZRreL7rOLXTK6Q7j5VpFa0lkHKkmjF
X-Google-Smtp-Source: AGHT+IEFUI2KIGcEzbaa3eVCIY2d04TRgJ41dbTjN9EgyNtQrEyjnscvn6eMYkQuqN0dl3IjBgFX
X-Received: by 2002:adf:f342:0:b0:349:d810:9974 with SMTP id e2-20020adff342000000b00349d8109974mr2830872wrp.17.1714026517468;
        Wed, 24 Apr 2024 23:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714026517; cv=none;
        d=google.com; s=arc-20160816;
        b=Hhpry7FBHhrAyOmDveK7PW+Rtkp6dZ00oPIUlRYri0s0zavhX9LT01Xpf6Fvc8xOcI
         lswuf//a8PK2mRkzzx2t4miyX58Wrn/U1Q3YpX/Dd8DKJn/PBtZNwmKTcsqgAk3uIyV7
         O9RRsvOen2FaYKI9WMjaX95QTOXIEpSAOxT2D93Fu3v+lLAy6S8FPHIieB2VdWRSlPpI
         Y19uizRiCz8NBmBBf0K5dTx1gkrzkrC4MnPBvzCPokDMVn3vXtMigoks2vA4Juka5ykw
         g4YfZD8mhha7fKRzBmNdm6GkXbD9SUtnlXCnOKBZw4YDhoyj7VwBJGx13auFgsdWHcG2
         Rg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=5QMD6OT4/QN/tvMX/7HwcVotZ4cCQJVV7+QfBX/IXgc=;
        fh=dNjB6WICFZxWQc8GY768FZO6HiP1SM1B7ly2xzLomko=;
        b=FCDIrhjuAwD/DpYzMJ2TJfrqv/220tlX/WR2cs4bclodxaoOh5oYOwhAjMaf50rLX/
         2NuF5iWKsgLqCVIuVvehUKdzzWcThQ2K1Jzal2UqRx4kWUo5zr/jGQp+Qfz7/PGSIIrc
         +mHD9i8LZ0KkEghD6dIFSFr8cR3I4b4Xiv4uQYYR4hL+VIxT9h/TLpRk3P340yrFMliY
         wavz1QraCFnlboLJiJtyVgD5qAewNLUrPIpqGn7xk9naOjqmkUepoa43hda7sbt9xurS
         7wAYfUzdVf4K8/u/93dc95F/SP1GiVu+XxEqYNhn5CsRF1pUNMZpx4a/1xXmGZVLYgHw
         Udgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=VS8TNiuP;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id y13-20020adff6cd000000b00343c09fa301si7768814wrp.169.2024.04.24.23.28.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 23:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=VS8TNiuP;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
	List-Help; bh=5QMD6OT4/QN/tvMX/7HwcVotZ4cCQJVV7+QfBX/IXgc=; b=VS8TNiuP7OgPdUJ
	QEV8fRLGE0wAPkCR6SlJs5Fu9RLITCHipuNzZbfe2ZbTDRmrQEOqZIrPGP1RN/D8Ec5xr+jZZ1anB
	/oFJ+9cQQNSj3gMdhcenLgNyrVHLAMTED0n505jZtd+03ADjnOGjfVvEnsTc8Jr3fHE3Mf2nbkJQT
	Vs=;
Date: Thu, 25 Apr 2024 08:29:40 +0200
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Yanan Wang <wangyanan55@huawei.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH 02/24] exec: Declare CPUBreakpoint/CPUWatchpoint type in
 'breakpoint.h' header
Message-ID: <bjz7nuf5v5z6vlucnm7rw2bp6dfnpw534pwfqzlenllmxzx3o2@tnzxchmwmcpl>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-3-philmd@linaro.org>
 <09dd8fe2-29ec-4099-9746-70fe8665b3dd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09dd8fe2-29ec-4099-9746-70fe8665b3dd@linaro.org>
X-TUID: 7va5T4o7MP2W

On 18/04/24, Philippe Mathieu-Daudé wrote:
> On 18/4/24 21:25, Philippe Mathieu-Daudé wrote:
> > The CPUBreakpoint and CPUWatchpoint structures are declared
> > in "hw/core/cpu.h", which contains declarations related to
> > CPUState and CPUClass. Some source files only require the
> > BP/WP definitions and don't need to pull in all CPU* API.
> > In order to simplify, create a new "exec/breakpoint.h" header.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > ---
> >   include/exec/breakpoint.h | 23 +++++++++++++++++++++++
> >   include/hw/core/cpu.h     | 16 +---------------
> >   target/arm/internals.h    |  1 +
> >   target/ppc/internal.h     |  1 +
> >   target/riscv/debug.h      |  2 ++
> >   5 files changed, 28 insertions(+), 15 deletions(-)
> >   create mode 100644 include/exec/breakpoint.h

Reviewed-by: Anton Johansson <anjo@rev.ng>
