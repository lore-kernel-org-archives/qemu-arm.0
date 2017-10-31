Received: by 10.223.161.27 with SMTP id o27csp3718704wro;
        Tue, 31 Oct 2017 06:29:47 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QI8AtVI5AP5BqR8z0XASO7vH94zYI4TJ/boztFsp+MaRkIDrcP4nOSOFCtPJ/CtPcbxUIM
X-Received: by 10.129.85.149 with SMTP id j143mr1199839ywb.0.1509456586939;
        Tue, 31 Oct 2017 06:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509456586; cv=none;
        d=google.com; s=arc-20160816;
        b=zS0/UCbQqe6u4SgUqkjcG5KPnIEAHksZ+zW5uERK1mVTI5SeTUmuEN+iKQ9S4JpY3F
         AIUzgVSnDuSS7Lv3bSzayjYDbnfslpDm4mNMeD8Itptk8KSnLAOjcbNjN53kP7KayHih
         OEPYglrK2KXAJtIDU5CyJdQP07IH5O8DyNb1QsKtK9hYXqVUQ5EFc356Jb4XMT3glDmV
         7NgfYKcvajZAHUO2q1ToO7Ol3hB5SmEvpVDYWpf2FW9ROQk3ju/4QrV4jh/Bjx+6owJR
         +NPu92zEzhr3MFgO5HyDMtjIydblrTpxVxt/LptlV/ug+uZHnZDRR2qc0J0Rs+LqqNPs
         6llA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/fE2fbaS2Dv6V5CKVkm0cLnnTuh3i8YrFzLKqDAKRP0=;
        b=Me2oRsOncubbmmvEdF3Phk7W0XEQClTo/ZblDZKqBJpDRVy78tSuhIYHPPVgBFYRxW
         5Hbb8pTAyQIuvJjBXmCb4xVZ/ib0WNTniALUkQ0Gu5SvGTx+Mnjem5qPDludy5jJhy4t
         Qq8bNyZSJ8xr9ulil3s206pcQNPJt8yWYkLdXU3OwVM9GHoKwrvRCv+TyaYC9QIaurhC
         /BuSFv6P+cZChRihJ2gt43uHItBn8kJxNfR9fClPO0b76ozYpGUbVJNZOlbwK5JC9CPG
         Y/Spl8nMHMfDCszhyJjvvOTPvKTFCmPt29iWI9X9XE/BcDqnbHSoaJl1xXupND7/n0fU
         u8GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=St7YXXzz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4si383281ywd.727.2017.10.31.06.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 06:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=St7YXXzz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9Wby-0000Qf-C2
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 09:29:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9Wbk-0000ON-Fa
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 09:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9Wbj-0001im-AF
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 09:29:32 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:48712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e9Wbj-0001hO-46
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 09:29:31 -0400
Received: by mail-wr0-x242.google.com with SMTP id 15so15961496wrb.5
	for <qemu-arm@nongnu.org>; Tue, 31 Oct 2017 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/fE2fbaS2Dv6V5CKVkm0cLnnTuh3i8YrFzLKqDAKRP0=;
	b=St7YXXzzf3YCpjDbyftIMOV9/he5vpyZX4bZjahGWIwSf3kCGTukzDvZ/hR9l2wdgX
	HgdeuXJ+R2pVTRrhOAORP221OOoqrD9BQnZKB+D8v89rwA6Uleq7Vp+aYdi8eGeNGjhU
	biWKn2xpL5NLDURG+U1F+/XprO6OwlYapc3TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/fE2fbaS2Dv6V5CKVkm0cLnnTuh3i8YrFzLKqDAKRP0=;
	b=mb7JMNXOCSs9UKZiZYfOiYL9BjWV/jc5MEE9UubY3Oeq+P26Vc0ydvGbO9Cs5gt8rI
	YyKprwgfKgAPpx7wYYMr+FTKnS3BpbUhwih9OKd1Twvs0UadFxcAeT7tv9PyFP+vkujJ
	bnWPQ32LH384U5l2yWvjkldlYAX63lWcX72bmUEzmdfylDt4k2EEefHCpBOAQLbgwb71
	stC1c5KKNJedJG4fPQV35Ch5vhr9NabSOVTjZVXXFvaWv7JDmXSfNxC3nlU6YzW9BegQ
	EfRHcN8Nd02Rjp7K3i9V2MsBUd0V2vK4sNf7WlPsFfWkNApTp0s0EvoIuAHgOnShtaQr
	fBGg==
X-Gm-Message-State: AMCzsaUsWVOlcoRlP8aM9ziZwKT4kL5LRaLJs9JJdSNNV5LYT85TRED6
	eR7LztDrm4Ai0KRLS7mti3Ypciz5HnlAGmzR0LZNWw==
X-Received: by 10.223.169.80 with SMTP id u74mr1732000wrc.178.1509456569765;
	Tue, 31 Oct 2017 06:29:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 31 Oct 2017 06:29:09 -0700 (PDT)
In-Reply-To: <20171031130223.220-1-Andrew.Baumann@microsoft.com>
References: <20171031130223.220-1-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2017 13:29:09 +0000
Message-ID: <CAFEAcA9a0rK+ByrNskT6jajaLG1PKFk0RQzxNs_-Hd61zN96ww@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [PATCH v3] arm: implement cache/shareability
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
X-TUID: rS3xHQ4SaKKj

On 31 October 2017 at 13:02, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> On a successful address translation instruction, PAR is supposed to
> contain cacheability and shareability attributes determined by the
> translation. We previously returned 0 for these bits (in line with the
> general strategy of ignoring caches and memory attributes), but some
> guest OSes may depend on them.
>
> This patch collects the attribute bits in the page-table walk, and
> updates PAR with the correct attributes for all LPAE translations.
> Short descriptor formats still return 0 for these bits, as in the
> prior implementation.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> v2:
>  * return attrs via out parameter from get_phys_addr, rather than MemTxAttrs
>  * move MAIR lookup/index inline, since it turned out to be simple
>  * implement attributes for stage 2 translations
>  * combine attributes from stages 1 and 2 when required
>
> v3:
>  * implement S2 allocation hints and check for cache-disabled
>  * fix stage 2 shareability bits
>  * fix combined allocation hints (always use stage 1 hints)
>  * remove LOG_UNIMP message
>
> There's unfortunately one new wrinkle in this revision: the spec for
> S2ConvertAttrsHints() calls S2CacheDisabled() and returns non-cached if the
> cache is disabled. I assumed that we ought to emulate this. However, it wasn't
> clear to me what to make of the "if ELUsingAArch32(EL2)" branch -- we have a
> cp15.hcr_el2, but no HCR2 register. I just left a TODO comment, but it's quite
> likely I've missed something.


> +/* Translate from the 4-bit stage 2 representation of
> + * memory attributes (without cache-allocation hints) to
> + * the 8-bit representation of the stage 1 MAIR registers
> + * (which includes allocation hints).
> + *
> + * ref: shared/translation/attrs/S2AttrDecode()
> + *      .../S2ConvertAttrsHints()
> + */
> +static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
> +{
> +    uint8_t hiattr = extract32(s2attrs, 2, 2);
> +    uint8_t loattr = extract32(s2attrs, 0, 2);
> +    uint8_t hihint = 0, lohint = 0;
> +
> +    if (hiattr != 0) { /* normal memory */
> +        /* TODO: to faithfully emulate S2CacheDisabled() for the case
> +         * when EL2 is aarch32, we should check HCR2 (not HCR_EL2), but
> +         * qemu doesn't presently model this register.
> +         */

We don't currently implement HCR2, but when we do it will be
in the top 32 bits of cp15.hcr_el2, because that's where
it's architecturally mapped. So the bit to be checked is
in the same place regardless (AArch32 HCR2.ID is bit 1, and
AArch64 HCR_EL2.ID is bit 33, and so on.) This is pretty frequently
true -- it's rare that you need to actually look in a different
place for aarch32 vs aarch64.

Actually checking this bit is a little bit odd for QEMU, because
mostly what we're implementing here is "we report in PAR the attrs
that the page tables say, even if that's not what the implementation
actually does", and "NC if HCR_EL2.CD is 1" is an "affects what
the implementation does" bit of behaviour.

That said, the ARM ARM is a bit vague in this area so following
the pseudocode here is probably safest.

> +        if ((env->cp15.hcr_el2 & HCR_CD) != 0) { /* cache disabled */
> +            hiattr = loattr = 1; /* non-cacheable */
> +        } else {
> +            if (hiattr != 1) { /* Write-through or write-back */
> +                hihint = 3; /* RW allocate */
> +            }
> +            if (loattr != 1) { /* Write-through or write-back */
> +                lohint = 3; /* RW allocate */
> +            }
> +        }
> +    }
> +
> +    return (hiattr << 6) | (hihint << 2) | (loattr << 2) | lohint;
> +}

thanks
-- PMM
