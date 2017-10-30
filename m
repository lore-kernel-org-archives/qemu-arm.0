Received: by 10.223.161.27 with SMTP id o27csp2836458wro;
        Mon, 30 Oct 2017 12:26:04 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Tvst/c/c9oMYVId0yhMdVcQC028kp0ON9Gh0ib7uWmaGT5hoDkmzNVatwtYa+IWww/0tgg
X-Received: by 10.37.195.6 with SMTP id t6mr6651430ybf.73.1509391564883;
        Mon, 30 Oct 2017 12:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509391564; cv=none;
        d=google.com; s=arc-20160816;
        b=ltB8BPvX9lzzfeNDPsVTP2TCuGN8Bm1VpiSrpzeBY7tgWHeY4JGPFjvjO6nbOg7F9Y
         gcLdKbk5Cr5ciIZ9uy90i0lOKycUu1D/c+joSSOOtjLEB6yETxDiHmNdOWJmrvCNShSI
         qa6QA52wYjzzrAwwCmlLxYTH607JZTvGZgwtJTeK5rFULutrOIKkcleG1y+wiTK00JWo
         Xi8V0wUwKpyQukMYrYFFqV7gEG2jaUu3BhXHHqC7MjkmXz22NUy33q/tpCCMtE+fsN6Y
         YU/fVRAT8V7k/07vHAchuikJ3kv0fbvnLsrtDkRU6Mg7hxJFtlSQslwSuoxe7h1dfPL4
         AWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=N/7eL93qAae5zFg9u1F5VrYOBeEY3TKYmMw/ZzFFtxQ=;
        b=n2lYn88WbNgsdEbGoiqRyq8QaYlQnyDUHTP7I1w+nRBZeFnyQ3zKnE1xzW+lGZsVlV
         NfDBuJDVIH6e6kw1+l4XEWjnaQCKAElcO917nU2QGqN/Huvr3t3wHrF6LxUrr65mR5AX
         LESv8+AcTmnzPik79zg58GL1DATPjTrrD+kutmBgPKYfCc8cMssLCnDyHQcyrEL+qYy3
         utqLyoM084w2zI+SN22W4BrmPDFMXzUyeUnQ3PAg+yOfUY6ztIZ2nt3GlpyOMm5xq6yc
         cT7MmZZBDTM4HvHUUQ+FrpdzEeEYvVme8fJq0GEHAxmKrDP8arAZkZxKjqzfDdd6Uc9l
         Nn3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Irto4NhU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l195si2266628ybf.809.2017.10.30.12.26.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Oct 2017 12:26:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Irto4NhU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9FhE-00046w-8K
	for alex.bennee@linaro.org; Mon, 30 Oct 2017 15:26:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9Fh4-00046k-OI
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 15:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9Fgy-0007nG-2A
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 15:25:49 -0400
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:50500)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e9Fgx-0007mn-OF
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 15:25:47 -0400
Received: by mail-wm0-x231.google.com with SMTP id s66so17913568wmf.5
	for <qemu-arm@nongnu.org>; Mon, 30 Oct 2017 12:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N/7eL93qAae5zFg9u1F5VrYOBeEY3TKYmMw/ZzFFtxQ=;
	b=Irto4NhUQLKG5p2MwzUj/UhOuPXlv8D2DGohq8Q7OndFOmHCBlj05bvx77+xDp8HT9
	zTVGaLQjpuDq6ecMuBR2shv6qyhIQCJnnONMLvqwW6st2xM8UPjohFD1Z6VFgYbY0U4I
	u7pyv0nMOqDp2DbTGQRuJwB67tOWXYWiUEVDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N/7eL93qAae5zFg9u1F5VrYOBeEY3TKYmMw/ZzFFtxQ=;
	b=UNXjrBzz0yDHvOA0QTTECuG4S9PzLiBoH6XPIIYhPYhIqB+NENW59qQ5STwkXnSwES
	bEkJ3wgB/ep/ELUF3GPTFERtE3pSK27nFaMJaxMZnAXgN7sU3NhjfL5WTv9uQkKIy63/
	Ju5zQzWAddBgI2Uz7oSe64c+xD2nLtnUd6kUPdakuw++m0rc0y/V50rGO2bgjDjL5QJE
	/KkbLCbpgtFn0IKGAj8JlIHXOinwSogmXmoojnak2KNLEyA+VY5pYSyByeA1i/nwEaWN
	84b3p2hL/K9ZkCDfbDzuqr1AOA1eYeuOhBr1Z06aGIyLO1bCqOcLd2zcBOcoWOU0T/5Y
	f6RA==
X-Gm-Message-State: AMCzsaX/w5GYvXoVnKzv7Se3LNP2vsvjWtqxzmgV5HCX7T8qtcUdsA6s
	VqMfhWNOSU6QciTcke0JJST9jGrL6W8LAN0SCTGV1A==
X-Received: by 10.28.46.136 with SMTP id u130mr4179677wmu.127.1509391546562;
	Mon, 30 Oct 2017 12:25:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 30 Oct 2017 12:25:25 -0700 (PDT)
In-Reply-To: <20171020214918.18944-1-Andrew.Baumann@microsoft.com>
References: <20171020214918.18944-1-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Oct 2017 19:25:25 +0000
Message-ID: <CAFEAcA-bW6CtLTN0omLoL7x7r996rY9BS1MvH4KdfS-2z6g1LQ@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-arm] [PATCH v2] arm: implement cache/shareability
 attribute bits for PAR registers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZIMYAG73yCZ6

On 20 October 2017 at 22:49, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> On a successful address translation instruction, PAR is supposed to
> contain cacheability and shareability attributes determined by the
> translation. We previously returned 0 for these bits (in line with the
> general strategy of ignoring caches and memory attributes), but some
> guest OSes may depend on them.
>
> This patch collects the attribute bits in the page-table walk, and
> updates PAR with the correct attributes for all LPAE
> translations. Short descriptor formats still return 0 for these bits,
> as in the prior implementation, but now log an unimplemented message.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> v2:
>  * return attrs via out parameter from get_phys_addr, rather than MemTxAttrs
>  * move MAIR lookup/index inline, since it turned out to be simple
>  * implement attributes for stage 2 translations
>  * combine attributes from stages 1 and 2 when required

Hi. This is looking pretty good, but I have a few comments below,
and we're pretty much at the softfreeze date (KVM Forum last week
meant I didn't get much code review done, unfortunately). Would
you be too sad if this missed 2.11 ?

> Attributes for short PTE formats remain unimplemented; there's a LOG_UNIMP for
> this case, but it's likely to be noisy for guests that trigger it -- do we need
> a one-shot mechanism for the log statement?

I think we should just drop that LOG_UNIMP.

> @@ -8929,6 +8939,28 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>           */
>          txattrs->secure = false;
>      }
> +
> +    if (cacheattrs != NULL) {
> +        if (mmu_idx == ARMMMUIdx_S2NS) {
> +            /* Translate from the 4-bit stage 2 representation of
> +             * memory attributes (without cache-allocation hints) to
> +             * the 8-bit representation of the stage 1 MAIR registers
> +             * (which includes allocation hints).
> +             */
> +            uint8_t memattr = extract32(attrs, 0, 4);
> +            cacheattrs->attrs = (extract32(memattr, 2, 2) << 4)
> +                              | (extract32(memattr, 0, 2) << 2);

Pseudocode S2ConvertAttrsHints() specifies some hint bit defaults
(no-allocate for NC; RW-allocate for WT or WB) -- do we want to
follow that?

> +            cacheattrs->shareability = extract32(attrs, 4, 2);

Are you sure this is the right bit offset for the shareability bits?
I think 4,2 is the S2AP (access) bits, and the SH bits are in 6,2, same
as for stage 1 descriptors.

> +        } else {
> +            /* Index into MAIR registers for cache attributes */
> +            uint8_t attrindx = extract32(attrs, 0, 3);
> +            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
> +            assert(attrindx <= 7);
> +            cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
> +            cacheattrs->shareability = extract32(attrs, 6, 2);
> +        }
> +    }
> +
>      *phys_ptr = descaddr;
>      *page_size_ptr = page_size;
>      return false;
> @@ -9490,6 +9522,89 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
>      return false;
>  }
>
> +/* Combine either inner or outer cacheability attributes for normal
> + * memory, according to table D4-42 of ARM DDI 0487B.b (the ARMv8 ARM).
> + *
> + * NB: only stage 1 includes allocation hints (RW bits), leading to
> + * some asymmetry.
> + */
> +static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
> +{
> +    if (s1 == 4 || s2 == 4) {
> +        /* non-cacheable has precedence */
> +        return 4;
> +    } else if (extract32(s1, 2, 2) == 0 || extract32(s1, 2, 2) == 2) {
> +        /* stage 1 write-through takes precedence */
> +        return s1;
> +    } else if (extract32(s2, 2, 2) == 2) {
> +        /* stage 2 write-through takes precedence */
> +        return s2;
> +    } else { /* write-back */
> +        return s1;
> +    }

The v8A ARM ARM pseudocode CombineS1S2AttrHints() says that the hint
bits always come from s1 regardless of whose attrs won.

(I was hoping you could write this function as something like a
MAX or MIN, but the complexities of the writethrough-transient
encoding and the hint bits mean it doesn't work out.)

> +}
> +
> +/* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
> + *
> + * @s1:      Attributes from stage 1 walk
> + * @s2:      Attributes from stage 2 walk
> + */
> +static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
> +{
> +    uint8_t s1lo = extract32(s1.attrs, 0, 4), s2lo = extract32(s2.attrs, 0, 4);
> +    uint8_t s1hi = extract32(s1.attrs, 4, 4), s2hi = extract32(s2.attrs, 4, 4);
> +    ARMCacheAttrs ret;
> +
> +    /* Combine shareability attributes (table D4-43) */
> +    if (s1.shareability == 2 || s2.shareability == 2) {
> +        /* if either are outer-shareable, the result is outer-shareable */
> +        ret.shareability = 2;
> +    } else if (s1.shareability == 3 || s2.shareability == 3) {
> +        /* if either are inner-shareable, the result is inner-shareable */
> +        ret.shareability = 3;
> +    } else {
> +        /* both non-shareable */
> +        ret.shareability = 0;
> +    }

You can play bit games with the format here, because
what we're effectively implementing is "whichever is last in
the order '0, 3, 2' wins", which is
   ret.shareability = MIN(s1.shareability ^ 1, s2.shareability ^ 1) ^ 1;
(since the xor with 1 transforms (0,3,2) to (1,2,3) and is self-inverse).
Is that better than the if ladder above? Not entirely sure :-)

> +    /* Combine memory type and cacheability attributes */
> +    if (s1hi == 0 || s2hi == 0) {
> +        /* Device has precedence over normal */
> +        if (s1lo == 0 || s2lo == 0) {
> +            /* nGnRnE has precedence over anything */
> +            ret.attrs = 0;
> +        } else if (s1lo == 4 || s2lo == 4) {
> +            /* non-Reordering has precedence over Reordering */
> +            ret.attrs = 4;  /* nGnRE */
> +        } else if (s1lo == 8 || s2lo == 8) {
> +            /* non-Gathering has precedence over Gathering */
> +            ret.attrs = 8;  /* nGRE */
> +        } else {
> +            ret.attrs = 0xc; /* GRE */
> +        }

Isn't this if-ladder equivalent to just "ret.attrs = MIN(s1lo, s2lo);" ?

> +
> +        /* Any location for which the resultant memory type is any
> +         * type of Device memory is always treated as Outer Shareable.
> +         */
> +        ret.shareability = 2;
> +    } else { /* Normal memory */
> +        /* Outer/inner cacheability combine independently */
> +        ret.attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
> +                  | combine_cacheattr_nibble(s1lo, s2lo);
> +
> +        if (ret.attrs == 0x44) {
> +            /* Any location for which the resultant memory type is Normal
> +             * Inner Non-cacheable, Outer Non-cacheable is always treated
> +             * as Outer Shareable.
> +             */
> +            ret.shareability = 2;
> +        }
> +    }
> +
> +    return ret;
> +}

thanks
-- PMM
