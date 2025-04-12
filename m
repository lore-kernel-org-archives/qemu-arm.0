Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp903326njc;
        Sat, 12 Apr 2025 01:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUm8CGIlSy4ZacRv9Axkdi06SqHqGgrTG/kmKR6sAprq37NcDpuDT/vh/sUT+sAImwyHrK
X-Received: by 2002:a05:6402:1d48:b0:5ec:da2e:6f4d with SMTP id 4fb4d7f45d1cf-5f36f6779d9mr4140220a12.18.1744446118900;
        Sat, 12 Apr 2025 01:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744446118; cv=none;
        d=google.com; s=arc-20240605;
        b=adV+1DVJ4whxIT5dcyTBp9W29/GcZSiEsa7DKxZBBM6+9mEFEorJQmu2DCli1TAOOU
         Kx2m5ix7sdylAoLRCjCHngX8diPfwnHBf74PYOa++ri2rXKWDGTedYa304Bwd0GW4HOx
         0DbZ8UcNGXEZq+sWRbus38tNAvUHqwa4RT6k7vYC0GsnMA+EC6B5M8O5Vsjy2V5Zqjbo
         IWwda4bBut2iP1Rnhawtkbl/MI+amKImlAypAt9XaACTaYl8ZVQfa6Wz/YRMlitDOFkB
         b0GrRDFonLW+zpoVwq+loUx8AoE2bZCqURHTdpY01n7Nhwjck/9ikek8CNIDH+GvqV24
         464A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EyyvU26WyWKZPrjnU2aSEB0k5vWB94xWPRhX4O3z5BM=;
        fh=Un3iYNNU8h/R/nWmOY2Oa2CT+zZI+ZGWFZKnRlWRwoE=;
        b=NvvOIk2AsGvlHBXEfcaOOp7J9HQUaWJvv+Vyh/FXenuy1u69qzRYfViUiYeteIYvek
         vk55OGnHjRFSU2krS3JXEhHB0vBofozcSMkaqpUDJ1+l9tQxo1POurSzBnSl4STvHn56
         /7ImKiFF/UP3jXkW5ae45A+Gpsfz8W7DjV3U16T1FzLg5ZYOD/GBbubR2miC1vb7+oqm
         b3hBIYc/o+RO/gqIsoIBx9kaQnjwTjCcGU4SdAYeSReunacZ0lnlbAZvPXk+dizcPw7r
         SBNWTj+KL7E0hFxaMAmLYpMP0VbszIjkOKawguglRUhe0DxejEFf5t20oEnWnIi4Yyu0
         j2gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b=X0PHKkwi;
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
Return-Path: <qemu_oss@crudebyte.com>
Received: from kylie.crudebyte.com (kylie.crudebyte.com. [5.189.157.229])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5f36f646ec0si1916654a12.476.2025.04.12.01.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 01:21:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) client-ip=5.189.157.229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b=X0PHKkwi;
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=EyyvU26WyWKZPrjnU2aSEB0k5vWB94xWPRhX4O3z5BM=; b=X0PHKkwiOKMRj4NvkXHZOEICQO
	IU5nERcHuk3T6uPDUcXFOLwOe/xgDoCzBUOxX7dy8d45+2GoR//cYecZfgMsMvdkNsrR1shm9oI8D
	7bteA0D/SK+GkQ7tgk0bTKMWzRv9VEr1f1Et+A0/E/VeHN/LxSxExgEGBBuNR8Mms8TBG8oK2xbtE
	fxCXSHc7zT0oyUMRHbLuWCpSDt0TjeNXl7CSWeURF89WHAHV4CqJVfS/Y18RhT/qhF/ryo5kuXHGS
	VgYNHtyHkvVY0CedsT5xcnfXgrEJfg/pp3Arz2lNS6g1+8xVjVcoMY7bnzw2ztHxALuUp+iXhdyoi
	6yar6q4XNB/+5p0jX1uAUIVq9GHa0bLmnOVp2+gJyMWstLdxs9YnRT2AlwdQx5IudXstbXJF5XIpm
	NZqeFMhD6S8gyWePDtW7HH8CQz6xy9PtkYc/jHsqpIoOjh4e0Unbt10Ik2SzdaFa3nG2F8DVnsGYr
	xxBfVOGzIu00yzh0xdDuyuRY2iE9FxM8DMzrNYabg+xddQufqR8Tyj6f+bOwazAGS0xV9se4nSI0K
	rlnHXzomHa4xGaauyAF7qpChLB58HEHrmmGtm4kK3arxnhbJGm0RKCB3pvVPw2d9BbHPtt/gFc8RU
	fO9C8Gbo2j2hj0D+3ce6dVeuYuPA9mIJOZtr9ckAk=;
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
Date: Sat, 12 Apr 2025 10:21:47 +0200
Message-ID: <2441396.svyq9LpYvz@silver>
In-Reply-To:
 <CAEDrbUakVwwn228nSb0rD1C9qiZ-tpcHBzLRDVyGRNsim97=JQ@mail.gmail.com>
References:
 <cover.1744032780.git.ktokunaga.mail@gmail.com> <2533109.DitPQcejgS@silver>
 <CAEDrbUakVwwn228nSb0rD1C9qiZ-tpcHBzLRDVyGRNsim97=JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TUID: SDMViddRpVPE

On Friday, April 11, 2025 12:47:29 PM CEST Kohei Tokunaga wrote:
> Hi Christian,
> 
> > > Emscripten's fiber does not support submitting coroutines to other
> > > threads. So this commit modifies hw/9pfs/coth.h to disable this behavior
> > > when compiled with Emscripten.
> >
> > The lack of being able to dispatch a coroutine to a worker thread is one
> > thing, however it would probably still make sense to use fibers in 9pfs as
> > replacement of its coroutines mechanism.
> >
> > In 9pfs coroutines are used to dispatch blocking fs I/O syscalls from main
> > thread to worker thread(s):
> >
> > https://wiki.qemu.org/Documentation/9p#Control_Flow
> >
> > If you just remove the coroutine code entirely, 9p server might hang for
> good,
> > and with it QEMU's main thread.
> >
> > By using fibers instead, it would not hang, as it seems as if I/O
> syscalls are
> > emulated in Emscripten, right?
> 
> Thank you for the feedback. Yes, it would be great if Emscripten's fiber
> could be used to address this limitation. Since Emscripten's fiber is
> cooperative, I believe a blocking code_block can still block the 9pfs server
> unless an explicit yield occurs within it. I'll continue exploring better
> solutions for this. Please let me know if I'm missing anything.

As far as I understand it, the I/O syscalls are emulated, and when being
called by fibers, blocking syscalls would imply to yield under the hood,
without explicit yield by application that is.

If that's true, it would only require little code changes for this to work.

> > Missing
> >
> >     errno = ENOTSUP;
> 
> Sure, I'll fix this in the next version of the series.
> 
> > Looks like you just copied the macOS errno translation code. That probably
> > doesn't make sense.
> 
> Errno values differ between Emscripten and Linux, so conversion is required
> here. I've used the same mappings as macOS for now, but I'm happy to add
> more conversions if needed.

OK, but why have you chosen macOS errno mapping exactly? Are you testing on a
macOS host machine? Are errno values of emscripten machine dependent?

The errno mapping must be correct, otherwise funny things will happen on guest
side if 9p2000.L client is used, as it blindly expects errno numbers sent by
9p server to be in native Linux errno number presentation.

Alternatively 9p2000.u protocol variant could be used for Emscripten. Not
ideal, as this 9p protocol version is somewhat a legacy protocol from QEMU
perspective, reduced performance, less reliable, but it transmits error
strings to client which it can map to correct errno values by itself. Linux 9p
client uses a hash map for this errno translation of 9p2000.u error strings.

/Christian

