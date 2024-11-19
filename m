Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3167499njc;
        Tue, 19 Nov 2024 02:30:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsz2dI6/foC7lV8U21h5Uc5hbmVKxQDjASimFqhUXjZmOo5PbqSvzg/fLAUyviFhBTHFi6u8aoj2qniQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHHfvXq4G0R746sXG/mOSUbnhKFk9v0BcHZbebIUfzjElKTjQpKSx1M9exU3laOZc3mbjCD
X-Received: by 2002:a05:6102:5114:b0:4a3:ed09:4746 with SMTP id ada2fe7eead31-4ad62e5fa11mr14932727137.0.1732012224260;
        Tue, 19 Nov 2024 02:30:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732012224; cv=none;
        d=google.com; s=arc-20240605;
        b=fPb2YS1p1Y62s7Jv2TTrBIzmEtOzBMil5IN/sOIqN+OPbborE+QnyDl0UnOMuo8nAp
         uOJ8WZvXN83fF0iAel4HJGE2QdCucaa9QCfXRLfE4Cs4vAoNyBMmHZqLSzZU04B1IXYl
         hch9KDMGbl9ZNK22qb4lJ8i8V7OEV8Ro0Mu/CbBT58TeD1XhnSYk2jscVAgwU3TEtjyf
         /yGtAStqNnRWWsWiy6O61nbtX1Q2byMK0PQ3nYwPDyOn5SbaMRX4K9B8hD7ZJs4PHIOU
         g/7PxNcvxWtROvlZuMY6p6eHBOygye/6Nt7+PMBxHtwi8+5kmzZT9hMTL/M3SSMj6odC
         nIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=31S/gPBx567OTdkVGKSNuBJlJHg1VUWDKIvZRCSBvUE=;
        fh=dhWrJZNkxpXlZnBbBJ/MCSDef0P+g1dZQUbpD8kxZj8=;
        b=LrpEWpPSja6wf8jMQ9b1rj2thAcPMZwzscbacdeaMNi/50d7o82XCwcOjbF0Sr9g9Z
         BjEx4iYXSCW6GxiqB301C/Gia0CyiC8vHkjOKuhFHeXAhSpFZ203cRbVUNC0v8hmC+Pp
         a0wWuOIQwQdDlwPnN8kmMILGbIebLyqyIfC6pSZXkeLuwSD3fVCIC3DWZ5Jtn576rxsf
         pooz+wjWQLbCq4tQFDGrMNLhuEoUgfALqMYPc6jps72UmTg3IJ/uahvFPLGnv2ap2+HC
         ojyeiopZ2d42fXSAA4G1vS2vljw8ZZCxAO85A5ZB3RzZrkfLAl9qGjO03kM/qFOFK1vA
         8J8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nIRKKUQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ad646fa9b5si2434569137.115.2024.11.19.02.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2024 02:30:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nIRKKUQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tDLUa-0002uL-VH; Tue, 19 Nov 2024 05:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tDLUW-0002tE-0s
 for qemu-arm@nongnu.org; Tue, 19 Nov 2024 05:29:53 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tDLUU-0002Mi-5A
 for qemu-arm@nongnu.org; Tue, 19 Nov 2024 05:29:51 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5cfd3a7e377so1824651a12.2
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2024 02:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732012188; x=1732616988; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=31S/gPBx567OTdkVGKSNuBJlJHg1VUWDKIvZRCSBvUE=;
 b=nIRKKUQSex8AV5fxBMl+ixAwzQEKcVaxE6x2cw/i3dk6RfLSk8sjdNNiz8oLIaPx/S
 jbOIEfNPkUSW7qOXkplr0arB0XULZgCIf+BEH4y6QSI7Yri2Ct0UUny6GfxYv7+pYOx/
 lC7OXyWq+4tqwAQZARiUK142EYNIxtQ/Wr0aUcoCL5HdWW/cJ8v+T6pTxRw7D+Hd55GR
 PWHHv8mci3+d3CsRmcGQki1/hJqLvYUt4FMaaKZRjOR1IUQSr3WIGHXNpIz6tNrFdmjx
 3ggG93unneUOqpkYQbDDIMCQ+6jP3vuOY+J2GLwNe4RRZiFr3LhdgkanrtH+T+AsgQxE
 p5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732012188; x=1732616988;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=31S/gPBx567OTdkVGKSNuBJlJHg1VUWDKIvZRCSBvUE=;
 b=TPaDCEDfG3da+F83SzqnIZuED015lVj3vTiX/EZSN1MUYWoU850GbUF7O6eltSSdtj
 UpvTdmTsGujDw5e2ftHjTMcIE2YiAybPsMcaFE+rHVHyOeIVuS1J3htC/DBmGTURxTX3
 umpnSAWwbmPdPkB174KoyWwPDZAsaYlssmjSUlmckYVs9luALMk5zIpKngArCpVQBLym
 IK47gwWYnrCt3pClo6yGCH9TkDLGZU+eS6mnNm9opz1AUBTO0N2Dnnkwkf1S09y3lEu6
 W0KGuPFSKBhHi0DQlwMaHPPCXowFdKs25lU2mK/qVlKkGcWTTahOYrA0Ni2NvV74vIUF
 sw0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/z0QEmFyuI6QbC9n6GNoRI1DZ1n4mT/bse1AOE8SYuxspT3xrHx7/OF/UHq1VIh5cLWTsWqKpDw==@nongnu.org
X-Gm-Message-State: AOJu0Yzu1F3SSaLuwR2EWoDAMKbnnx/JI3weM7mDF9ansDwlDP8aAoSP
 54pjcBwGtHe2lSdfOFJEdss020uyNNFkdjPZDp6tuE29Ft5IDi2/TmgYz/Cp05TrxPE4mMJ8J9y
 Xdhu1Kg/d1WSW356wqkJiON4nnvdz2gB0/2SePg==
X-Received: by 2002:a05:6402:40d2:b0:5cf:ddc5:b6e with SMTP id
 4fb4d7f45d1cf-5cfddc50e50mr2095705a12.1.1732012187768; Tue, 19 Nov 2024
 02:29:47 -0800 (PST)
MIME-Version: 1.0
References: <20241118021820.4928-1-joel@jms.id.au>
 <CAFEAcA9tPhbjnJ6XjMcZq6iWS4i1BdrTB+=391L5UgaVSMkCLQ@mail.gmail.com>
 <CACPK8XeFP+fmws+tcG-qgz1WXyKAtMicpfcgDG-pd_jp8PLXwQ@mail.gmail.com>
In-Reply-To: <CACPK8XeFP+fmws+tcG-qgz1WXyKAtMicpfcgDG-pd_jp8PLXwQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Nov 2024 10:29:36 +0000
Message-ID: <CAFEAcA_+YvS7zTuosAxK8zMgBTD01SRheAat7WbHsfLHCCFGcA@mail.gmail.com>
Subject: Re: [PATCH] hw/aspeed: Correct minimum access size for all models
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 BMC-SW@aspeedtech.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Evm18v56aXok

On Tue, 19 Nov 2024 at 02:53, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 18 Nov 2024 at 20:40, Peter Maydell <peter.maydell@linaro.org> wrote:
> > Have you reviewed all the device read/write function
> > implementations for these devices to check whether
> > (a) changing the .valid value does the right thing, or
>
> I read the implementation of the read/write memory ops and I believe
> it does the right thing. We want devices to accept reads that are of
> any size, instead of returning an error.
>
> > (b) whether there are cases where we should instead
> > be updating the implementation and setting the .impl
> > min access size ?
>
> Reading the documentation for impl vs valid, we definitely want to set
> valid to 1. There should be no machine check when performing byte
> reads.
>
> I don't think we want to change .impl.min from the default of 1.
>
> I'm not sure if I've missed something that you're trying to point out.
> Are there gotchas about setting valid.min=1 that I should know about?

The "gotcha" is that the memory system's implementation of the
size 1 and 2 reads when .impl.min is 4 and .valid.min is 1
(as for instance with aspeed_apb2opb_ops after this patch)
is "read 4 bytes, return the relevant portion"
and the implementation of size 1 and 2 writes is "pad the
small value with zeroes at either end appropriately so it is
4 bytes and write that". That is often the right thing for
the required behaviour of the device registers, but it is
also quite common that it is the wrong behaviour. For instance
for some devices the write of a byte is supposed to only modify
that byte, and leave the other bytes of a 4-byte register alone.
Or if the device has bit-clears-on-read behaviour for a register
then the default handling will incorrectly do that for bits
that the guest didn't actually read.

Conversely if the device leaves the .impl.min at its default 1
and moves .valid.min from 4 to 1 (as with eg ftgmac100_ops)
the device will now be called for byte reads and writes at any
address in its range. If a write to, say, byte 3 of a 32-bit
register is supposed to update bits [31:24], that won't happen
unless the write function is changed (usually if there's a switch
on offset the write to something that's not at a multiple-of-4
will end up in the default "log an error" code path).

What this adds up to is that it's a bit misleading to have
a single patch which changes the minimum access size for lots
of devices at once, because for each device you need to look
at QEMU's implementation of the read and write functions
together with the spec of the device, and confirm that the
right way to implement "byte writes are supported" for this
particular device is to change .valid.min, and that you don't
also need to make changes to the read or write function code
at the same time or adjust .impl.min. Putting them all in one
patch with no discussion in the commit message of the device
behaviour and implementation was just a bit of a yellow flag
to me that maybe this complexity wasn't considered.

If we get this wrong for one of these devices, it's also likely
to be rather easier to bisect the problem if bisection
can track it down to "we made this change to aspeed_timer"
rather than "we made this change to a dozen devices all at once".

-- PMM
