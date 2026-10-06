Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DDFCA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:38:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENAD-0002y8-Eg; Wed, 07 Oct 2026 04:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEIIU-0002tn-GS
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:26:34 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEIII-0005RW-Ey
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:26:23 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-5e39cd2a795so623094e0c.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 20:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791343527; cv=none;
 d=google.com; s=arc-20260327;
 b=YP7ECvcQ/5Od3g2b7LP6HUtiwCZc2FSsyVdc4g8M7Qql27cws2WcsplBwB43QFDrsB
 j1uXsu09EbNYeEj8wF+2Yq1THsn3wQU+m9lWeq7fUGlt2OZ6cRgkCxRzqvKV7a1rd8N6
 oHHVl/87PhfrfwtFA/9UCtTdJaw+O+y036w9BtEwb0sepYcemzsH6aoZ0GDatPUyqcsG
 IXGQ9XEXcstIC71L1NacJ5LPeJ+vQQXyiuBCNyG31WN1+cFk43B0jk6zxan4pl5MACHK
 WUEkC2q/+gSbqWfOfXMnhKkBdY5sqfuLYXgAkl/TxA2RON8rv2Stp76hJFrwx0EucT8V
 hf5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=BNe28fzsNkReZkp5SawmoMK8Xda+uKQwSZoPrHwYWD4=;
 fh=39U1X7mEk6mkpL5Hsj8txB0eoAIZ1zO7IBOAx5CmFOc=;
 b=dTOi6AXaRCPtcLO9tQE0yvkFehgXn9yQNUNUQXeZJUll0KhYWKb5DKnPsaFiFNbkmK
 FaZ43vzzkYrAd0EDfzcxOtCqtr1sHr3brn7flvtCtPwhFgVErWzmLach0tBQf9bPQKL7
 9dOc2dZHIcCLQyXsr7O2SyOgypzsunfw1leXKKAYFntom2RsxugvX/3Cn5fRIJZ1cIqI
 pEH8oXePGqPhn74Kv1C47MVD6Q5MjPalmGTffMWgSO+1ZrkA5Xf8BkYdO/jTLDxvBXJT
 oF4evEnT6heoxPMVqMS0vYxQFA+Di7BHLbCKxd3sXSyuLFM29BZa9zJDPDEfyOhQ5bZF
 2jSA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791343527; x=1791948327; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=BNe28fzsNkReZkp5SawmoMK8Xda+uKQwSZoPrHwYWD4=;
 b=G2moQzMxHJ3sJylz0LEfu0tFVAi8gahRdXfxQsXRs/F8F5a9VOgfhu2mpD5j0ge39Q
 m4exvtO/B9XENMPQ9fUZyRdHAKE7yYOprL0z/QV8g6dQOIzsMIQjuMawvDqJz6z37xcG
 29g954C6sA1DBVyMrs0aTM7wTJJo3nWyFO/N9O+3UyYUtS/MT5d9uv9Wkur3k7y8kO9p
 po4/3tMaIUt2RVHuImgNHa9tMizCPR/b3JDxaa7K1KVuctBr03z47UXGWSKcP8j0atXv
 OPsdYuR+cOOcIQaTUrtAjZvr07W9b+XajnnVZOhkPkocBMwvK1L+j7ZlQQvdKpt2OO3c
 s9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791343527; x=1791948327;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=BNe28fzsNkReZkp5SawmoMK8Xda+uKQwSZoPrHwYWD4=;
 b=NQlaZcoitj7o1a/JaCoqpFs9blEr87NRerZEwhRli09QGI1222pmB+P65cTqk/7tOa
 vwmC3VqnX0ZKnApxBYwQSFeRA3NtFVGCu8ht3GX6QnUDKxYglZFBj6FD9AQtUpwz9Bz8
 OdBXip719jThPMIVKbc13P7l6c83OhHsUHUlir/kGAs2+vnk1rIaFjWSMMj80ivqvghQ
 HD8NEF3pgZ4zAltngszKz2sbW442P6aRZPrPlsKfrxG9Vu9xrXVUV78LLBD5mltZhPOi
 HmKJnKL78aJKQif1Nv1QbfDjdfHnn3fblWlfidsB35WnQlv9pCJYli2UOKy/WnhtYUJk
 ptuA==
X-Gm-Message-State: AFq9FYJfRdFzDFekWRX+DY7gIa1EWXticPUaduAxV/lSBDwX3J1ddo9G
 yRxWBnAUBFhUFDg/QY/RvlbHP+KTHjOIg0+NYHAReSpqwB4eK3UAP64+jlycXp6dTYW2dDHwOxS
 aZXd9CGRb501HSDG11a8TIetn8z8RRaY16Mls81Y5ffcdyzk32Fgvtd14ZA==
X-Gm-Gg: AYBFou27yuWlM+HIFloFUlqxz75zXBlz3ESaLQq3ZbdoEKvPYHp4TAKXWN0iYvW5DAA
 cAmuo4V9WxDC9uzKHP8f6jvGXLW3kzA4p73gTMivMAQ8z1WNQwZX+r6MyaJRJDglR1ghwDVHf4B
 HSN3bjhpvKduyIKSvO4fr4lsN7Q1GQKB9kPj7Lg6qRaxXWKZjFX6E5lsrE1u1nJImpW5rmIKNlg
 R8xEatvVOadK0UB1c46n+1HtegG1/g4MmrMFcwDeRqOn2L9NkrezNzk/PqWzAuGAfBOS1zCDxKh
 yWkI2QMd/OK2IPZo3TniSVtPX8b59fywa4JnzTYYTZ9lL39t+CVf8ODnRAUpUypVfLyNl4En6vL
 65z7cBr5Lu0+47uUaQnPuWKj5NFZJH30psTVckTtj/aohAwxM+Q==
X-Received: by 2002:a05:690c:6d83:b0:8af:1843:a9e5 with SMTP id
 00721157ae682-8b04f489215mr4470257b3.23.1791285868752; Tue, 06 Oct 2026
 04:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261001175003.ttbr-baddr-52bit-0-fuad.tabba@linux.dev>
 <20261002070925.2627344-2-fuad.tabba@linux.dev>
In-Reply-To: <20261002070925.2627344-2-fuad.tabba@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Oct 2026 12:24:17 +0100
X-Gm-Features: AclHuK_TkizGvf2w5BH9Ft35CVoiFyCh2Bna_MqzKkZHPm7QtqNfesSt9hkXhj8
Message-ID: <CAFEAcA_+gr25p1gix=qto5DQzh=VAguhAUh6Una9uMLzNYWZmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Use the 52-bit TTBR base address layout
 when TCR.DS is set
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, Will Deacon <will@kernel.org>,
 Itaru Kitayama <itaru.kitayama@linux.dev>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 2 Oct 2026 at 08:09, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> With TCR.DS set, TTBR[5:2] hold bits [51:48] of the translation table
> base address, whatever the OA size. If the effective OA size is below
> 52 bits, setting any of them is a level 0 Address size fault
> (AArch64_S1TTBaseAddress(), AArch64_S1Walk()).
>
> get_phys_addr_lpae() uses the 52-bit layout only when the OA size is
> over 48 bits. With TCR.DS set and an IPS of 48 bits, it takes TTBR[5:2]
> as base address bits [5:2] instead. A guest that sets them gets no
> fault: the walk either succeeds with TTBR[5:2] ignored, or reads its
> first descriptor from the wrong address. VTTBR walks with VTCR.DS take
> the same path.
>
> Use the 52-bit layout whenever TCR.DS is set, and check the whole base
> address against the OA size. Add TCR.DS and VTCR.DS cases with a 48-bit
> OA to the test.
>
> Fixes: ef56c2425e5f ("target/arm: Implement FEAT_LPA2")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  target/arm/ptw.c                      | 16 ++++----
>  tests/tcg/aarch64/system/ttbr-baddr.c | 53 +++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 6cff52d592..16f5fdfe0b 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2107,18 +2107,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      descaddr = extract64(ttbr, 0, 48);
>
>      /*
> -     * With a 52-bit OA (FEAT_LPA or FEAT_LPA2), bits [51:48] of descaddr are
> -     * in [5:2] of TTBR, and bits [5:0] of the base address are zero: a table
> -     * under 64 bytes is still 64-byte aligned (R_KBLCR).
> +     * With a 52-bit OA, or with TCR.DS, bits [51:48] of the base address are
> +     * in [5:2] of TTBR, and bits [5:0] of the base address are zero: the
> +     * table is at least 64-byte aligned.

You put that R_KBLCR reference into this comment in patch 1, so
why are you deleting it again in patch 2?

>       *
> -     * Otherwise, if the base address is out of range, raise AddressSizeFault.
> -     * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
> -     * but we've just cleared the bits above 47, so simplify the test.
> +     * If the base address is out of range, raise AddressSizeFault, as
> +     * AArch64_OAOutOfRange() does in the pseudocode.

Please don't drop information that's still relevant. This comment is
remarking that although the pseudocode is doing an IsZero check only
on the bits of the address between the max physaddr size and the
outputsize, QEMU is doing a check on all the upper bits, and saying
why that's OK. This is still the case, although the pseudocode has
changed a little so AArch64_OAOutOfRange()'s test is now:
   return !IsZero(address[NUM_PABITS-1:oasize]);
(and NUM_PABITS is 56).

>       */
> -    if (outputsize > 48) {
> +    if (outputsize > 48 || param.ds) {
>          descaddr &= ~MAKE_64BIT_MASK(0, 6);
>          descaddr |= extract64(ttbr, 2, 4) << 48;
> -    } else if (descaddr >> outputsize) {
> +    }
> +    if (descaddr >> outputsize) {
>          level = 0;
>          fi->type = ARMFault_AddressSize;
>          goto do_fault;

The code changes here look correct (compare AArch64_S1TTBaseAddress()
which checks walkparams.ds == '1' || (complex expr for FEAT_LPA)).

thanks
-- PMM

