Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2452680lff;
        Thu, 5 Dec 2019 10:33:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqxai1vuW0WXrQ9i77uER2vn/Te91WZyifvsGIg/VKolilRVUteD3W1abl3V79GZ3k1zltWJ
X-Received: by 2002:aca:4587:: with SMTP id s129mr8252207oia.124.1575570795879;
        Thu, 05 Dec 2019 10:33:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575570795; cv=none;
        d=google.com; s=arc-20160816;
        b=QCdy7nlHUaltHGBifRq+wGBtSlPO4B06RrK6aJissD9ctzLoHBrl5rfkfDona0dff+
         VurHYN1WpEKakiGjQE/rKHP0/GtfpPR9BPuFiGX2i4LdzDWmvjYiXgdpNhxPeS45dbME
         070rhOccTi0s4QP73P83YUw9pGZRioTrG1vMrEzPushxGBF7r65N8hCwNZEEdbKaq7Hq
         3bNxTAbsI6TdrfxFbvA3/i5a0J/xhcGTA4OO0P7SuAusHlc4pm5xq+KLSX0ARaozfzDl
         IypWWVrEO0upw45Mb4KS7HnYm3ylZ5qs3H7yBkGYc/kMGEDLvBMV5zS2vMuxHJy1fADb
         OA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fo78LySk+IDjHJmOYFaESpk0uW4l7d7VSVykxo1MFYI=;
        b=h23sDlMuBE2+cmMAfORQkkTT2YRoBH+54VJ34M9LldhA8ZtVh1M6bg8Sh3vqX4QIFE
         WgGR2Akk24Uzmygyq3BIbfp4e8driVbvTnm0E5rNCx3LLYxkTOepxsw7yaTViM7wv9Fs
         7fhEkny3yDrBxmrMHPFCQ5MwnD6plH1KUJYyUcENsf4MbDxeEE+qiPDH9qIT3gMVSSrE
         97SA6e69zYwK5M6IGXMEIL/94nQg6aEydrXsyopaqZFcxoDdrHcDFsXz3OY34d9GkXgO
         YMUy3uqfcPj83f2vaVo1kXOKUl6NaAzkNoR4gwE6+gY2CM4OY5c6XQJGaJhebQ80UcR4
         n+WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zok+uz4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si5690557otr.69.2019.12.05.10.33.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 10:33:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zok+uz4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icvwB-0001TM-07
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 13:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1icvvk-0001T5-Am
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 13:32:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1icvvi-00082W-DN
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 13:32:47 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41122)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1icvvh-00080w-Dd
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 13:32:45 -0500
Received: by mail-oi1-x241.google.com with SMTP id i1so3666022oie.8
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2019 10:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fo78LySk+IDjHJmOYFaESpk0uW4l7d7VSVykxo1MFYI=;
 b=zok+uz4GuyolOqem9+ituSa4mJxRpP4Baj0B9R9dNwdGTomF5SOyvNSTGkpy7bIX3k
 3eDPSksWNCgnyJTwh48YE3tnW48xZ67H2xg/O0tXRP33L4NDNQ4mio75LW6mbkYbtpYM
 UOdUuNhyeczdFJ6u/Ndxsojau2KpWHsGIbgb7aGFwU0N+nDROs1BiueQSypHpnxN+fHF
 pN09mUJ+7p2XnhXWBll22+UcfNm4D7gpUTEvDmez+OL1RYFBqnnIYEBjNpeJoXgxxemP
 t8GnY9Uk1CImxIwhr2PQnZ5sjf1weiOLvB8u9n6hM9eUleorbAZl2ZeiMDVpj+JDMmlP
 GChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fo78LySk+IDjHJmOYFaESpk0uW4l7d7VSVykxo1MFYI=;
 b=TdUhnRFLkYlCrwkSzjQg1eVaRWIoyvHJeGqrCLBKWt2HmDaucWZO1BI9CY+YmXDaW/
 QOtUgnDfV4fdlXW7KizEUkVXtzG0k+JN2Yikz3aftBMTKFM59NbDUvc1NlyZmfhl1E5F
 F5FhesxUCUZ3nB8IRineys/Qs3Dd7Y+xGr1+4eiatvkFNKdnlJ6CioRMruvv5Gv3X83T
 H4nY2nca0LWtbycSgE/1wSDasZ4IOMdG1Eru5ZUmLElXX+EdVPUjphqbqJPoFSAfyYvf
 JJpnUYIMT0SAub4NJlYWbuLD96mtJDLAqcMrbYSewN73K4fVdzJDbos1SOL2WiXilQqp
 QSpQ==
X-Gm-Message-State: APjAAAWlIdSBeebm8NXJtkF4PrNVkyhu0Z3VHqDf7t4tt6uqg/tA5NUs
 rOW39MKCgw9uFVtZyea0tBG1wB4DII+GMHjtoxelRyuJKss=
X-Received: by 2002:aca:f5cc:: with SMTP id t195mr8680471oih.163.1575570762676; 
 Thu, 05 Dec 2019 10:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-20-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2019 18:32:31 +0000
Message-ID: <CAFEAcA-2uT9Pj=HCP+ZrCy2GygNy+BhME0o5P8OQReEdKJgscg@mail.gmail.com>
Subject: Re: [PATCH v5 19/22] target/arm: Cache the Tagged bit for a page in
 MemTxAttrs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: kbV3okbuM9uH

On Fri, 11 Oct 2019 at 14:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This "bit" is a particular value of the page's MemAttr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index e988398fce..17981d7c48 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9609,6 +9609,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>      uint64_t descaddrmask;
>      bool aarch64 = arm_el_is_aa64(env, el);
>      bool guarded = false;
> +    uint8_t memattr;
>
>      /* TODO:
>       * This code does not handle the different format TCR for VTCR_EL2.
> @@ -9836,17 +9837,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>          txattrs->target_tlb_bit0 = true;
>      }
>
> +    if (mmu_idx == ARMMMUIdx_S2NS) {
> +        memattr = convert_stage2_attrs(env, extract32(attrs, 0, 4));
> +    } else {
> +        /* Index into MAIR registers for cache attributes */
> +        uint64_t mair = env->cp15.mair_el[el];
> +        memattr = extract64(mair, extract32(attrs, 0, 3) * 8, 8);
> +    }
> +
> +    /* When in aarch64 mode, and MTE is enabled, remember Tagged in IOTLB.  */
> +    if (aarch64 && memattr == 0xf0 && cpu_isar_feature(aa64_mte, cpu)) {
> +        txattrs->target_tlb_bit1 = true;
> +    }

A comment somewhere saying that 0xf0 is the "Tagged Normal Memory"
attribute would probably be helpful.

> +
>      if (cacheattrs != NULL) {
> -        if (mmu_idx == ARMMMUIdx_S2NS) {
> -            cacheattrs->attrs = convert_stage2_attrs(env,
> -                                                     extract32(attrs, 0, 4));
> -        } else {
> -            /* Index into MAIR registers for cache attributes */
> -            uint8_t attrindx = extract32(attrs, 0, 3);
> -            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
> -            assert(attrindx <= 7);
> -            cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
> -        }
> +        cacheattrs->attrs = memattr;
>          cacheattrs->shareability = extract32(attrs, 6, 2);
>      }

Don't we also need to care about the stage 2 attributes
somewhere ? If the combo of stage 1 + stage 2 doesn't
say it's Normal Inner&OuterShareable WB NT RA WA then
it shouldn't be Tagged even if the stage 1 attributes ask
for that.

There's also the special case for "stage 1 translation
disabled" -- depends on HCR_EL2.DC and HCR_EL2.DCT.

thanks
-- PMM
