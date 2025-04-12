Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp939582njc;
        Sat, 12 Apr 2025 03:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9h0GLH0uPRF4GwNXjrnpoFzcNiQFkU440TtyJa3sPgX5EvgE0Q4PYxyhkawTSDBc4q2ec
X-Received: by 2002:a05:6402:34d5:b0:5ec:cc79:84f5 with SMTP id 4fb4d7f45d1cf-5f36f52b9e8mr4862556a12.7.1744453319105;
        Sat, 12 Apr 2025 03:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744453319; cv=none;
        d=google.com; s=arc-20240605;
        b=fZtxc9ry8JYOSDwJtARXXqnvb+8I6RYU0a5dpmmqyzUHe/HQFhkAzMp8BMrNYoyqAj
         FZiJy7IlncsiKbYgyh+fO/fPm6wqVUJ2YRClsgTS0IoP7Du7NCXlS4avNuqafwSMRyaC
         PZ9oojZNiR3AkscGWq4ivEmheF8jN2cdvDrYH5PzsQTWv2CMaczFFK3CIbjoK0mbu+LN
         AZGW3VxLuR56+gWzf1WA7VDOMIJud6fc8C+v97O1SjXYRG/7eRHDA6jP+ekJJDJ3W+VP
         +V3q6agsBcC7HPH0UO6mz50gkCpEurFt7pR7rzmScGAi5O7HmIdyouZoOCeTihilwLVU
         zC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8ZN1z54BNoN4tZ6rXpv1jL7pDZiAQKvk/wBRnTkDugQ=;
        fh=Un3iYNNU8h/R/nWmOY2Oa2CT+zZI+ZGWFZKnRlWRwoE=;
        b=I87WcR1HeabisIUUaENcp5Kxljtq08j64AePTa7w+cx2vskO/z7js0/MPiZ90O9W8M
         hKx2fTn4d8VIygl1NU5OfjycFvL5m98+ph9rhyn/K/YGZWVAOIfOUh9IKUKo3hY4NAR2
         7gH9FOolWcLqIz6JqYzS/AwRw3uFHAvu7mXaH7QqpDgqn9pwa1MfNtwmkGdUL+NPpJkF
         RrV1143UvNK19knrUY73JCOCgd/kMd/bSSsxkgE+kOaT2S5ty1qitFcHlPoLz/vgl4HY
         vCQlAp3NqBJqOxZWPW750sB+cLTdDDBCRfgttGREJaNEhO7x89AgU621W6/U3wlBQAnV
         j+dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b=IDAZFJ7v;
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
Return-Path: <qemu_oss@crudebyte.com>
Received: from kylie.crudebyte.com (kylie.crudebyte.com. [5.189.157.229])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5f36ee57d87si2017676a12.44.2025.04.12.03.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:21:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) client-ip=5.189.157.229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b=IDAZFJ7v;
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=8ZN1z54BNoN4tZ6rXpv1jL7pDZiAQKvk/wBRnTkDugQ=; b=IDAZFJ7vcPW7YMgQ+g7m+TSHLb
	UxNotxxINEpJ/RoFD/GYuQNIpCWMiPZWuTrMpb/TEiRfqm9EzvkElWKisCMU08jOA1afyTGDkKcOM
	ZZBqx1kKvKBgw6scDXH14I4Ng/dyp8huyIa4q8qrFTfGK5dXGdKjSY3emvvc1vMY39/bIFF3KFVA2
	AHgZ5axKHKlf7g+PykfXk9HzODy3lDydiL/cYPzoZQh5x/HMTnokDySzF7UcLSd3gW13JnJO9Ao5e
	6Rauf/DhH6ZPyRpwY5EjiAIlGdmLYOWb+RaoapSnRYzzk5m3hG1LVZDQmirdSmG8RHHp5D+Fa36Bg
	Ot9g86b8MysFA0kWOxETwF3R4EaD88UkBxWr10VW/Hhfri9h6r/j5I3c+LBMDuPD6SIfoekCMossP
	TuTtMhej+ViuSgfSHaPU8YvnWVb9IUC40XQ0b4UcWlfxxxBEfN/2ILnRTbgLh2bDhW6KIDi1yLm9I
	BJ+0QruA1qCZVZfR6a9EqL/iKX9y4anyGokeLBRjE0FFgdQQgILl+QRC/x31JXFdxaO2psWdFjStk
	DDHF4xgbjEWgvvZkOdoLojIqjniXOIGZFFapm9wM8M2Km30hdND0r1W2cbNHB3VharGX2oezD8BfR
	K2aWhgHHl6WO6TWmUGLlMNZB6IqGBJfg4H8LjFFKk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?ISO-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>
Subject: Re: [PATCH 08/10] hw/9pfs: Allow using hw/9pfs with emscripten
Date: Sat, 12 Apr 2025 12:21:47 +0200
Message-ID: <1881242.gqbg26PhFk@silver>
In-Reply-To: <2441396.svyq9LpYvz@silver>
References:
 <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <CAEDrbUakVwwn228nSb0rD1C9qiZ-tpcHBzLRDVyGRNsim97=JQ@mail.gmail.com>
 <2441396.svyq9LpYvz@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TUID: 1jQ+e88eMjiu

On Saturday, April 12, 2025 10:21:47 AM CEST Christian Schoenebeck wrote:
> On Friday, April 11, 2025 12:47:29 PM CEST Kohei Tokunaga wrote:
> > Hi Christian,
> > 
> > > > Emscripten's fiber does not support submitting coroutines to other
> > > > threads. So this commit modifies hw/9pfs/coth.h to disable this behavior
> > > > when compiled with Emscripten.
> > >
> > > The lack of being able to dispatch a coroutine to a worker thread is one
> > > thing, however it would probably still make sense to use fibers in 9pfs as
> > > replacement of its coroutines mechanism.
> > >
> > > In 9pfs coroutines are used to dispatch blocking fs I/O syscalls from main
> > > thread to worker thread(s):
> > >
> > > https://wiki.qemu.org/Documentation/9p#Control_Flow
> > >
> > > If you just remove the coroutine code entirely, 9p server might hang for
> > good,
> > > and with it QEMU's main thread.
> > >
> > > By using fibers instead, it would not hang, as it seems as if I/O
> > syscalls are
> > > emulated in Emscripten, right?
> > 
> > Thank you for the feedback. Yes, it would be great if Emscripten's fiber
> > could be used to address this limitation. Since Emscripten's fiber is
> > cooperative, I believe a blocking code_block can still block the 9pfs server
> > unless an explicit yield occurs within it. I'll continue exploring better
> > solutions for this. Please let me know if I'm missing anything.
> 
> As far as I understand it, the I/O syscalls are emulated, and when being
> called by fibers, blocking syscalls would imply to yield under the hood,
> without explicit yield by application that is.
> 
> If that's true, it would only require little code changes for this to work.
> 
> > > Missing
> > >
> > >     errno = ENOTSUP;
> > 
> > Sure, I'll fix this in the next version of the series.
> > 
> > > Looks like you just copied the macOS errno translation code. That probably
> > > doesn't make sense.
> > 
> > Errno values differ between Emscripten and Linux, so conversion is required
> > here. I've used the same mappings as macOS for now, but I'm happy to add
> > more conversions if needed.
> 
> OK, but why have you chosen macOS errno mapping exactly? Are you testing on a
> macOS host machine? Are errno values of emscripten machine dependent?
> 
> The errno mapping must be correct, otherwise funny things will happen on guest
> side if 9p2000.L client is used, as it blindly expects errno numbers sent by
> 9p server to be in native Linux errno number presentation.

Let my answer my own question: I just checked the wasi sources. The errno
values are hard coded by the wasi API, consistent over systems. So the current
mapping of this patch is wrong. macOS uses a different mapping than the wasi
API.

https://github.com/WebAssembly/wasi-libc/blob/main/libc-bottom-half/headers/public/__errno_values.h

https://github.com/emscripten-core/emscripten/blob/4af36cf80647f9a82be617a0ff32f3e56f220e41/system/include/wasi/api.h#L116

So please use a correct mapping as defined in that header file.

/Christian

> Alternatively 9p2000.u protocol variant could be used for Emscripten. Not
> ideal, as this 9p protocol version is somewhat a legacy protocol from QEMU
> perspective, reduced performance, less reliable, but it transmits error
> strings to client which it can map to correct errno values by itself. Linux 9p
> client uses a hash map for this errno translation of 9p2000.u error strings.
> 
> /Christian

