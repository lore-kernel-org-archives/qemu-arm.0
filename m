Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4154876wrs;
        Tue, 20 Aug 2019 09:03:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwKFBrQ52+nTEljjp00+8ML8HXANqt4bVhMEGftpEYmm2uOwskby3Ls6Gosi0MFhjsvbjSR
X-Received: by 2002:a05:6402:785:: with SMTP id d5mr19101670edy.210.1566317017961;
        Tue, 20 Aug 2019 09:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566317017; cv=none;
        d=google.com; s=arc-20160816;
        b=kye1EzS1sVKkORwUu2gYrneIm4BElRXg9kE5U0kcGUTvWt2kAvWFTrss8uFHCp+mS2
         bzaNaC5oB8V7qX1zKqkGM0JBY7uImftHI/pGiPvlpjKs94bDyooLBQ5FGDrNvzP8X8tn
         aSFVxbDvSdvtzKMT7edDy8zU4GchYdSqI5qTSp0aHiU976M9osC/sI7qeL0XtzsJyMPg
         7t1QY6cKRmhSsavWdKRLFFw6UfW3m/pSVOsqoRVWFkU1KVZ+Qwm9WTmelSfzKaobvfwP
         9k2iLlQzLeHEJmdfuodu+8FZNnbrv7E7c/YCFDWVOauiOMNYJ6GOVVQkHhAVojw1GZof
         /zvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=w7PUrn3HKgbef1SQpqkYEy8ZUPjYR9w77B6/fU8+PHc=;
        b=T1Klgzq5IGioam3lxCM0I9VamBFA6xsWhraKD/PZWGm4W7ACikvhwKVZZVgzXr1usk
         U/CUWnoQZ51ImE9wD7emLHBRqWg/Y9Y08zZYnCszJGIVUTs+DP/BUdNOJ6mGB81DZJsm
         6kzWltbmzOB+VTUrvFCQDuKdxXKZzfp7/yI0MN547cHSoH+2FvYwiMacqduJ7RcHt544
         t5PUhjoh0hwlTN3l54Khkp/GIo28MvtrriNvfFLC38Y1nbk7HiXx5a3VKEM4qTurOli9
         LFBLV48Rml0va7R6tr1bx3nazjGo+W70TwZyu6r5/beLotMkQ8oCydtDZ5jtNEkRFkm9
         3tyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id v4si2877749ejb.275.2019.08.20.09.03.37;
        Tue, 20 Aug 2019 09:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FC8228;
	Tue, 20 Aug 2019 09:03:37 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 518CB3F246;
	Tue, 20 Aug 2019 09:03:36 -0700 (PDT)
Date: Tue, 20 Aug 2019 17:03:29 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v7 4/6] include/elf: Add defines related to GNU property
 notes for AArch64
Message-ID: <20190820160320.GA27757@arm.com>
References: <20190803210803.5701-1-richard.henderson@linaro.org>
 <20190803210803.5701-5-richard.henderson@linaro.org>
 <CAFEAcA-_gMkE-0kA=xyUyNKxeqX0n6B-9i_7132xfFXQNRqb6w@mail.gmail.com>
 <7c739082-c1d5-ad03-0020-9776cf08694a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c739082-c1d5-ad03-0020-9776cf08694a@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: ZfQa5WQ+N4oA

On Tue, Aug 20, 2019 at 04:59:50PM +0100, Richard Henderson wrote:
> On 8/20/19 8:39 AM, Peter Maydell wrote:
> > On Sat, 3 Aug 2019 at 22:08, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> These are all of the defines required to parse
> >> GNU_PROPERTY_AARCH64_FEATURE_1_AND, copied from binutils.
> >> Other missing defines related to other GNU program headers
> >> and notes are elided for now.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > 
> > What's the authoritative source for these definitions? I
> > tried looking in glibc, binutils and the kernel without
> > any luck.
> 
> Presumably the true "authoritative" source is an ARM document, but I don't have
> that handy.
> 
> For binutils, the defines are in include/elf/common.h:
> 
> https://sourceware.org/git/?p=binutils-gdb.git;a=blob_plain;f=include/elf/common.h;hb=HEAD
> 
> The upstream kernel is also lacking the defines, as they're part of the ARM
> patch set that is still in flight.  The defines are still not present in glibc
> as of today.


The AArch64 spec is here:

https://developer.arm.com/docs/ihi0056/latest/elf-for-the-arm-64-bit-architecture-aarch64-abi-2019q2-documentation

Cheers
---Dave
