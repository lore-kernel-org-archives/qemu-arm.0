Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3959375lfm;
        Mon, 27 Apr 2020 04:04:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypLfscXVhGaxnVMKlzNkdU8bDvaoFP5VgH4pTQZZ7XAfYR8hWaajtTrCYNsSdTRngIzkeKff
X-Received: by 2002:a37:7143:: with SMTP id m64mr21996082qkc.215.1587985466417;
        Mon, 27 Apr 2020 04:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587985466; cv=none;
        d=google.com; s=arc-20160816;
        b=qH9lGjoe6THWlFWixyah6jmqHQ0LPgLZgx7bwHF5N2p2YYF7t096a9FRJsYl2KVikD
         OJ6mKpEkJdE5Yk0JChW867d+I4cXhNO8N3FHiv2H6HptGnKaAqwtMUFn/pl4/N/yroPj
         0Sx/j2Zixpa3Hr7L+Y0mGZ+WvqfbCVDUVOhuvQgiTC5Yaot3baljcqO/+iQ2XxlrzG/F
         W5vqgaYkOvoyqjSI4OHSvFOMLYk9/N6BzvtDvFDyXLiC+A0PeflzUCW/H0x0/70B7FW6
         YZcwaSVD3kxvrGE0VcT7G4Zx7a5JeTiZsRNasL+2iZdvzvkErhxL1FvoqLPJqpwtfiWs
         2/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HvlQefAiz25NF63fuWVIv5v7xOmESVGyuHEcJqxJtyI=;
        b=pWRBdxljX5Es39tH97sBmKrSaxSXWjeZXjUhNsX2N7QLWf5h47AGFefZ+w6Z2YIait
         p/fYPwrzYKg2yFMQ810RnmFbGGh5SzC5YkH/PiA+/MlyucmVYe3rcQ1jUY6hSp6Ae6p6
         SCvFxsi7IFEwoci10y1yc3r2iD4Grn0+WSZrxaX9oFFFI0v774KDLExvel8beCLhYxkd
         Rr6yD57d99wf3w/qQIugg38ZCkoDk0iwmAx4dH00f6bZjAmUoOjy99Sc53OEM6aO5i0Y
         dSRb62XtEbQpAW+2JpdzUI7DIcPOPUuvG5p5uNXLvwnR2eAvyraQ8b0reWXFmgmvHTeE
         5ZLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xIOiYKIG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ba18si8770515qvb.198.2020.04.27.04.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 04:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xIOiYKIG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT1Yn-0008QW-Lh
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 07:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT1Yc-0008OU-8d
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 07:04:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT1Ya-0003Ac-9P
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 07:04:14 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT1YZ-00033K-QQ
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 07:04:11 -0400
Received: by mail-ot1-x344.google.com with SMTP id z17so25451801oto.4
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 04:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HvlQefAiz25NF63fuWVIv5v7xOmESVGyuHEcJqxJtyI=;
 b=xIOiYKIGU9uUamWZ8nUVsg8mnsF6WiZ/ngYXzhb0MxLOiYDehDliPwevgVLLQ0cTvC
 N+GkUorL+6eFsKbauyhxeQtFtGp1Ah2T6G4Y/I3Zn1uA8R7ALKbOA8Xry4TjAgI3xzfL
 eYs2Eu3dGgrnWktHd8odzURzXqKS70sIdVYUTFSFM2wqRFwmrGwvlrANRjAHGEj3Huh3
 z844aZaubBxGY65XZ4G0mqX/FM4H+xFNJtIyV7NMl9JudPmFwVQVmqnJ/NDLMvRcgxyU
 hNV0KnMW7smmILgQMFjnCb4JfzS+aDSR58RUqa5XtUc3Su43whBN/3I+cCGLhOXfAS6o
 jHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HvlQefAiz25NF63fuWVIv5v7xOmESVGyuHEcJqxJtyI=;
 b=lo5LaUgmvd8KcBxdQe9S6xihYBFBPQdZsWg47ZCpWiRfPI3ZM6vf4ojiPtf5Es936e
 liYhHGA/VampAiXDYMOSYlWU/C0FXz+yzPh59IQhmju0bHEWmg5FqjEnRHxTVL0YMZ/j
 yD72PDBQUamkhMAFFUJWsarTyv9Gx8Wp8Ar+4WrJFrIUCcnaX5ajCXc3QoIRJ/d5RD5n
 YwR0NREigLWPNOB1zzAniuc27QjNR43cD3yvlsBW/V7yi5QR3B/K/iZX1FAPRf09As3i
 BMzaK73voy4I/CcucaExf0NCzCWA7NwX/mgGN42WpBYdrvzX23JYj3yQeV1cWG7A32xI
 f2cw==
X-Gm-Message-State: AGi0Pub9jSXUfL+B6RpDyP2eVQjcBZk7KoM0zSt/BaxtrcWLGvXCaSZx
 LOzfoYnaXZZO+GoG/Zx5KRb68C27gedQbfGJkPfubQ==
X-Received: by 2002:aca:c751:: with SMTP id x78mr15440249oif.163.1587985450446; 
 Mon, 27 Apr 2020 04:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-14-richard.henderson@linaro.org>
In-Reply-To: <20200422043309.18430-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 12:03:59 +0100
Message-ID: <CAFEAcA8oWP9XGzD+pb_VhDth8zx8j1Gz4vwiK+dArpw8x1BmqA@mail.gmail.com>
Subject: Re: [PATCH v3 13/18] target/arm: Update contiguous first-fault and
 no-fault loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 90IDfrbBZP2q

On Wed, 22 Apr 2020 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With sve_cont_ldst_pages, the differences between first-fault and no-fault
> are minimal, so unify the routines.  With cpu_probe_watchpoint, we are able
> to make progress through pages with TLB_WATCHPOINT set when the watchpoint
> does not actually fire.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


>      /*
> -     * Perform one normal read, which will fault or not.
> -     * But it is likely to bring the page into the tlb.
> +     * From this point on, all memory operations are MemSingleNF.
> +     *
> +     * Per the MemSingleNF pseudocode, a no-fault load from Device memory
> +     * must not actually hit the bus -- it returns (UNKNOWN, FAULT) instead.
> +     * If you map non-RAM with Normal memory attributes and do a NF
> +     * load then it should access the bus -- but doing so is illegal.
> +     *
> +     * While we do not have access to the memory attributes from the PTE
> +     * to tell Device memory from Normal memory, we can validly assume that
> +     * non-RAM has been mapped as Device memory.  Thus we indicate fault
> +     * on all MMIO.

I still don't understand why this is right. All non-RAM is MMIO
but not all MMIO is non-RAM; so you might have something that's
MMIO (at least for the moment) and has been mapped Normal. That
shouldn't fault.

> +     *
> +     * Similarly, CPU_BP breakpoints would raise exceptions, and so
> +     * return (UNKNOWN, FAULT).  For simplicity, we consider gdb and
> +     * architectural breakpoints the same.
>       */
> -    tlb_fn(env, vd, reg_off, addr + mem_off, retaddr);
> +    if (unlikely(flags & TLB_MMIO)) {
> +        goto do_fault;
> +    }

thanks
-- PMM
