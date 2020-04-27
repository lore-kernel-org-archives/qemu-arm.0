Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4326263lfm;
        Mon, 27 Apr 2020 09:33:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypI3Y19MPbc2nJf57yrSdkBddydqpCzx22UQ40eP5RzGq8koQ26tupzgFH7JeCHr+dBAW9os
X-Received: by 2002:ae9:ef93:: with SMTP id d141mr23012308qkg.311.1588005205777;
        Mon, 27 Apr 2020 09:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588005205; cv=none;
        d=google.com; s=arc-20160816;
        b=NAKVnFidEx3/raGeGzdYIihEBjju0GqrpEnP29+4yIKNQAuFBGz+awmzXKA5uBm5xo
         eyBZhX5FX4xuHWOo1kHtlIhr0pwaVcQHjwjNt1aVff9hUkEIaV98C+7HEqjnaUUfzN4l
         qO3dvEGYDWomaNnX4P0gyFQaSBO3Tf/maH7L30GMF2y/ohQ9eY7EBTmS5pGgNM7FTKX1
         dlQHDGv+zK3EiOGbeQZl70IJvq3hYZwgUHdUtHUX0XC/6zgh0oWwFuHZYH1EPfEUN/LP
         z6L0cAFeRe+zm3uHOgC5F3XM4fbGdE5g6esmXt0KMQA4sgKHfJAPwZVuyf6Lxl8XZ0HZ
         yStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p17cZDIwneO/U0CNmCdokYFNYwmtPokiq0K2zTokMzs=;
        b=KIVCz4NOtLsQCoycFpvhGqUtHUFM5sVQ0rMIQBTc6xZ+nPtNg0cSBmbMwH8dgdINdw
         dR6PGHL3hDXPcEd4Ejvac5y7up+6gH57r6HGIjHEnaRP6U7daiLIVF8XXUB1myLV33+4
         Ob0GJkOCAOt6louGr09FZc9YfSPj9FJVsY82SCKb/kghqa+FJVcUs7gQtZIL1SfeEkvd
         xtaFDA9cxlLxRoRT0VuvhOHqUwP2tD+z+zdUPrWPE7y69ANVuTylCw6bcFMeHC7TyMvH
         etym6pGaFA/aUjUc12zYsAfGfwfnVuQFvRngedr+uGDEzo5FXnsniVcAhGgGLn2+Y4rP
         cNrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ssgFKFOy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r75si8442983qke.251.2020.04.27.09.33.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 09:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ssgFKFOy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT6hA-0004JU-Tw
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 12:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT6h0-0004Hz-JU
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 12:33:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT6gk-0000n2-TI
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 12:33:14 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT6gk-0000m4-GN
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 12:32:58 -0400
Received: by mail-ot1-x341.google.com with SMTP id c3so27217328otp.8
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p17cZDIwneO/U0CNmCdokYFNYwmtPokiq0K2zTokMzs=;
 b=ssgFKFOyD6Jrus/kvpqLgZLhrLkxHOSk6FjBfp2ksJNLMc6TTFlLoPZhzuPv7DIz+R
 NWjdgeUuh5UPg1pE9j5SPU4DFMXriID9ZnEx+/x0JN9FGRGf/sE/MsaXa1QdD6dzDpnF
 vuLANdPJTh3sWbI9u4oY6EtZjgdxnKn+HjVpCLN3twVzPgGXLuAdFQAn+kLcXsweG3SZ
 2tdFiIOGUlIW2en0ufTORxCRFOfZUKSWEfIZfA2NLffXAyb21IL94SBAsTBIx9iDHyjY
 Tpl4zWtwNcfXNmVCrlhWw+piJNrsbCtFOk1qPV81zFFPrGFGevzflHw/o/cLbAeY2Ib2
 /XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p17cZDIwneO/U0CNmCdokYFNYwmtPokiq0K2zTokMzs=;
 b=J6F/fbdsnGinbh8cU8m8VDJaCQmoGKps4d5fnCvwyFHCEvp5lwgUyADiHYrQad1lfo
 hiFMKSwLV7EpiCXbv+n3ecA1LZW5TQpwaf6BWzMs3jPtoI/qMCiOOGuR6Pu2PRU4PrFn
 dx8Tk/3JJDcUj9oBQW6N8zSZeoYxm58XTE/RAhxg4nzxThO34yy7CoJD9mlFJh8To+cR
 7gK2hXpzT/ii6+MhZKC4KPJArj8jDmWyC508iN31pC1mheNKVrcdSCDSIxH4NM7B/p68
 Dcsfgh/3DmDDJ35rNADts+dniBWsxrgnkdkcnz0gHS6iH5Xnitr0ClIYgzLoBf899seq
 YiUw==
X-Gm-Message-State: AGi0PuZnYHcKuA8hB2ZnTc/bYsjOEP8LNFfUelP8PZCP8KNqqzGXaWmx
 aHBYGV/M37Ya2riKgB6/TjTeUd10vWsZFV+h5BdllA==
X-Received: by 2002:aca:c751:: with SMTP id x78mr16510058oif.163.1588005174575; 
 Mon, 27 Apr 2020 09:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-14-richard.henderson@linaro.org>
 <CAFEAcA8oWP9XGzD+pb_VhDth8zx8j1Gz4vwiK+dArpw8x1BmqA@mail.gmail.com>
 <22c1fd55-7cd3-6320-1f90-40d1bd2cc883@linaro.org>
In-Reply-To: <22c1fd55-7cd3-6320-1f90-40d1bd2cc883@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 17:32:42 +0100
Message-ID: <CAFEAcA-iqrEi_wQ+mBN1NtrEKq3uDYPoDunqW5e9KV6ivz3-SQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/18] target/arm: Update contiguous first-fault and
 no-fault loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::341
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
X-TUID: gVCJGvqauvjE

On Mon, 27 Apr 2020 at 17:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/27/20 4:03 AM, Peter Maydell wrote:
> > On Wed, 22 Apr 2020 at 05:33, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> With sve_cont_ldst_pages, the differences between first-fault and no-fault
> >> are minimal, so unify the routines.  With cpu_probe_watchpoint, we are able
> >> to make progress through pages with TLB_WATCHPOINT set when the watchpoint
> >> does not actually fire.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> >
> >>      /*
> >> -     * Perform one normal read, which will fault or not.
> >> -     * But it is likely to bring the page into the tlb.
> >> +     * From this point on, all memory operations are MemSingleNF.
> >> +     *
> >> +     * Per the MemSingleNF pseudocode, a no-fault load from Device memory
> >> +     * must not actually hit the bus -- it returns (UNKNOWN, FAULT) instead.
> >> +     * If you map non-RAM with Normal memory attributes and do a NF
> >> +     * load then it should access the bus -- but doing so is illegal.
> >> +     *
> >> +     * While we do not have access to the memory attributes from the PTE
> >> +     * to tell Device memory from Normal memory, we can validly assume that
> >> +     * non-RAM has been mapped as Device memory.  Thus we indicate fault
> >> +     * on all MMIO.
> >
> > I still don't understand why this is right. All non-RAM is MMIO
> > but not all MMIO is non-RAM; so you might have something that's
> > MMIO (at least for the moment) and has been mapped Normal. That
> > shouldn't fault.
>
> Everything that must go through the slow path has TLB_MMIO set.

Yes. But not everything that goes through the slow path is Device memory.
We can (should) fault on all accesses to Device memory, but we can't
fault on all accesses that are slow-pathed, because some of them could
be entirely valid Normal memory.

> What you're thinking of, romd, has TLB_MMIO set on the write comparator but not
> the read comparator.

True when the romd device is in 'romd mode', ie mr->romd_mode is
true. Otherwise memory_region_is_romd() returns false and
tlb_set_page_with_attrs() treats it like normal MMIO, because
both read and write must take the slow path. (For flash this
happens when it is put into programming mode and reads from
the memory region are no longer simple reads from the backing
host RAM.)

thanks
-- PMM
