Received: by 10.223.159.74 with SMTP id f10csp5293576wrg;
        Wed, 13 Dec 2017 08:40:21 -0800 (PST)
X-Google-Smtp-Source: ACJfBotIPXaxO62EjpgQGGvd+WSK5FyhRSodrnoUhC1APrjgfQhUVM/V3W8jzETDWBsNOk86McRe
X-Received: by 10.37.192.65 with SMTP id c62mr2352209ybf.75.1513183220962;
        Wed, 13 Dec 2017 08:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513183220; cv=none;
        d=google.com; s=arc-20160816;
        b=fZdmS9H0OmVPJSNXC4/4NKxLGEl2xdc2lJttjjgTCbSxyfQmOCbmuqiqquylUBHKEl
         In0mXC0aI2L9Tj7vWlbc/iB+slnJEwz+6HhIfUiMkaHzhezOO7W/C496zcyRHIq4l4Ip
         5I7XGg8GeHgJ1WhXGbUj1O6oWZ7Spi2mG/MZpTNV2R7xfQo8/ww53MngzDHrIVrzWeM6
         uIwWNh4tDXSro5mAe22xzeZeF4fwAp6zLrxqmvpxfSrfg4wL6+j6q4fu6U7aqm/NFkMf
         cD2g5k7CBp9vE0efj9xeDybRAxgkYSKJHM3x+CdS0iCFTKr84aHQ0WMunH4GYUchBt4K
         MRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OW4aQypydjxim/V9pfF6PGWdBiv7XGnz+yrR9nCUX7o=;
        b=nwFNWdk89SN7inAMB0XDdDP7pv8CxQHPyi9lfXSY9f1osUiCdxP5Dx+K1szyBqEaEQ
         dc/XBOQVazYKbm9PlprgbeP6OGd6T+hUIw6zmcAVXlPSNJAZd2AX9COMpqhOWwhP1Y8m
         WPLP7XkzJGstznhgnLshvPFCscP0NFewryXXE7PISn0DCSlmm374vylJkAYOs61sQdxs
         1FPMqjI1fBjefXBAOBSX+8Itwpvr5l6mR+g0QrjeUi5evPruX9MTLW97bQjGO7UJrkAk
         HIcauMteK9+9Uw1szZjEn5qeuwBm+eQDact2EJQSKAnpy+PdFm/YNWdE6kgvmQeArzxb
         xM/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ce79CYig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z12si415137ybj.57.2017.12.13.08.40.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 08:40:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ce79CYig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36255 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePA4y-0002iA-Dt
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 11:40:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ePA4q-0002i0-Ix
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:40:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ePA4p-0003De-ID
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:40:12 -0500
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:46665)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ePA4p-0003Ci-Cp
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:40:11 -0500
Received: by mail-oi0-x234.google.com with SMTP id t81so1949716oih.13
	for <qemu-arm@nongnu.org>; Wed, 13 Dec 2017 08:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OW4aQypydjxim/V9pfF6PGWdBiv7XGnz+yrR9nCUX7o=;
	b=Ce79CYigzv8izMhdSN2WtHZCNGUedmLnoQNsaOh4dH3tckrsKLB2BoE2kFBHTeE7Ta
	qXIFFGywTpSP8Cr9EoMBExaxWlQM8c5glHJ0Cf+RDWppoKIdTiUISkbpAg+uvon7mFD6
	V2HiyCMdk6zoAbNCEZwH0W4vXsE1jPPDO+BbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OW4aQypydjxim/V9pfF6PGWdBiv7XGnz+yrR9nCUX7o=;
	b=rYSLUjal0e1FUN17KzNVcU/IvOs3mgTcc04TM5SYJmIJos5dAfqsFn9SidLVCBH+ya
	ewjJS11/qmAY0d8MmMrOnmidbm1cXYjd1mZwPXafNYoDdBzJGOk7mcCDMnSTak41d1oQ
	7H8T0znOEwuhqMtF1Sh/7tQP3ryEi0lLP/iM7A9VzLdd5pbgwDLXMfwM9evSyR98Pgt5
	xElfBwh+jkfM7hVYa8XF1rb918/x5P6rWeYkveLbNCGuKWDN3YWrzHwKNTRtakMRxJpW
	TmuhbiYDD2wUYGrCcemrDhMRFnPbBEKP5ktzUK60dt/+g3TIyvNDKSvyE4N8iNGyy1Zb
	d1Lw==
X-Gm-Message-State: AKGB3mJsMOCKrP/UcGagzRc4q76s8FD1Wo8qNr4v1EsJ2yjctgLtO2I0
	zOfjSA1+rDbi+zaFHZxfhjcTVZwLnIS1wP+I5oYB4DKi
X-Received: by 10.202.199.134 with SMTP id x128mr2303989oif.63.1513183210535; 
	Wed, 13 Dec 2017 08:40:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Wed, 13 Dec 2017 08:39:50 -0800 (PST)
In-Reply-To: <1501867249-1924-4-git-send-email-peter.maydell@linaro.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-4-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Dec 2017 16:39:50 +0000
Message-ID: <CAFEAcA-mOzfHhGt0jXtTVMe4_GGp6bg_SK1R4JBbQxpw2+gokg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::234
Subject: Re: [Qemu-arm] [PATCH 3/8] cputlb: Support generating CPU
 exceptions on memory transaction failures
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m7YbM31UOE+M

On 4 August 2017 at 18:20, Peter Maydell <peter.maydell@linaro.org> wrote:
> Call the new cpu_transaction_failed() hook at the places where
> CPU generated code interacts with the memory system:
>  io_readx()
>  io_writex()
>  get_page_addr_code()

> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c

>  static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
> +                      int mmu_idx,
>                        uint64_t val, target_ulong addr,
>                        uintptr_t retaddr, int size)
>  {
> @@ -783,6 +791,7 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>      hwaddr physaddr = iotlbentry->addr;
>      MemoryRegion *mr = iotlb_to_region(cpu, physaddr, iotlbentry->attrs);
>      bool locked = false;
> +    MemTxResult r;
>
>      physaddr = (physaddr & TARGET_PAGE_MASK) + addr;
>      if (mr != &io_mem_rom && mr != &io_mem_notdirty && !cpu->can_do_io) {
> @@ -795,7 +804,12 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    memory_region_dispatch_write(mr, physaddr, val, size, iotlbentry->attrs);
> +    r = memory_region_dispatch_write(mr, physaddr,
> +                                     val, size, iotlbentry->attrs);
> +    if (r != MEMTX_OK) {
> +        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_STORE,
> +                               mmu_idx, iotlbentry->attrs, r, retaddr);
> +    }

I was looking at a bug that involved stepping through this function,
and it turns out that the value in the variable "physaddr" here is
not in fact the physical address of the access. It's just the offset
into the memory region.

This doesn't matter for Arm or Alpha, which don't actually need the
physaddr for reporting the exceptions, and those are the only
current implementations of the transaction_failed hook.
But we should fix this so it doesn't bite us when we do eventually
have a cpu that needs the physaddr...

If we have a CPUIOTLBEntry how do we get back to the physaddr for it?

thanks
-- PMM
