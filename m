Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp852456lfg;
        Fri, 28 Feb 2020 08:23:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxp0N+wb4pobtDrJdcPbB/4KYDy2GkwMCsE0NCu6m1loEsvBM7KgrewaCf9CBJ1Xx7BlP9M
X-Received: by 2002:aed:2be4:: with SMTP id e91mr5093292qtd.148.1582906986109;
        Fri, 28 Feb 2020 08:23:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582906986; cv=none;
        d=google.com; s=arc-20160816;
        b=F8D6UXI9LWRqBMQ8Nxe3x22mMjBO5DUfIU4BSbuvB+5gTEL5s+8/ysDxLbNixnzA8y
         zjTIoLlmGTsLIHDyGobRC0Tyk7VICqTQ447r2dOWnefQI3nZi+MWEQyqh3Q3+9sIOWnr
         yY1C/DC35AQ5WWXliMa7eMBc99REb58ZSJlAIXVlOl5acH+3tIbZ7sUVHPzMgpbkgX9p
         klNAmJ2jl0/+gXLXNUg84NDjei7r8r1k1Mbn3FLZlUYBN5yq8JDftECmx96bkIOV5WNR
         wS3DTGk5AbcbQDgS4mPfI7qormkRRskgXdH87RnFrR768l+amxhGjbjGYPWMbCPVloWr
         wdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vUyVrR5UnNRx0q4may4bQIwQNcS0KvoRhyJK6bJDMD4=;
        b=Aoc3x9oWJ8ds46ckr3PBc01gT8UOc3nmtk4PkGsq7NOORApV8pX4PTn7l9+fxRUU8A
         +Ll784B4BXp7jgvDlpmOOrYwj/plULIqCzAOPQ2n4ZgvA0PC2JURKGDyEJujVzzWqATa
         ES0NuaYG4y68ZcAP8aUJPohKrVYl9i+t3WyrLILesP7UPVFuT6HaYK0N8+syESsvUPTE
         cqqp0EOId92YhALs0GkPUdOIsk8arNn+F6vbIkvVVhrAoewYd4NRLmdDkqghE7V7Qe24
         c3inPodETYK6ommUSn8mMaVSZ1pb3J4tpv2sywfFLqsl6dC9Z/F6T+18czFPwz6W0/mz
         OOAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PCHBan/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si1474589qvo.135.2020.02.28.08.23.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 08:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PCHBan/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7iPp-0005Bg-IQ
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 11:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iPf-0005Az-O4
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:22:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iPe-0005az-GE
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:22:55 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43985)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7iPe-0005aA-6e
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:22:54 -0500
Received: by mail-ot1-x343.google.com with SMTP id j5so2189770otn.10
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 08:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vUyVrR5UnNRx0q4may4bQIwQNcS0KvoRhyJK6bJDMD4=;
 b=PCHBan/fR4XVM7nCiotyl+2Rjn3+hW6QXudEar8T2pwcrGtaHs7oXV+l0DDddL5Eoh
 q2c2vwg5oA95AYXfJ176eQy681K0Mx1q0gzYAGA3IxzAZaTUctsJziJcQT756DpkbS8w
 BPfln6Pkq0JQlQeKpUOzM/hGDBjDo39H9EXgQdO7dAlwWTwigRTjcYB2F1qb6ZvrzjKK
 gL7DP0Qm8D9TRdK3oAc9mFac3IcfXM90HJ8iUinXQ5VBWdz1JIFDkxVKuNGRWzD6/XDJ
 Ej1lt5goNPujZ6XRmx4Rs94PAlGyBVueDwNh3H1utjb/mxPZpmd+RaC9vvqNvHfnH8Tr
 9OPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vUyVrR5UnNRx0q4may4bQIwQNcS0KvoRhyJK6bJDMD4=;
 b=L3AIVquTuxc163jOTJ6QD3r4P4Lj76U4suwfCQImVCAPeGG519X21keH0lPuHUmfUR
 FlU/tASjVy0Ddghu1lbTfuZ4bCkPmYc6PZ0/w6VmAMgjzRITIg1Gr7DLY2BnToR5xPWl
 xOs+ut9hwHJ89ytF1ad9cMqY6ByjpZhWqIMCSTLIa3W9pIDkZnG+fy2FTL+MOvzCBNyO
 RYUiLQfs01Su+++H/M3EUuK3VqNNqomrHFK5nieNjjEq42fh/cWu1qqUd3FWw78vbVss
 lS/kEWWd217c/1+MVWT2JIFEbseo9r55jzNfXIownIhMySzpo3zsqnv62ziVC3E8wzLI
 YFGQ==
X-Gm-Message-State: APjAAAXoHepT3cNyzDqkgUjafF32JU49Rf1VxlQeCtiklJMl/8TaeKza
 5Q8qAkYXuXYRokSML63865wq4e3HuGui5BjfAkSPhQ==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr3762536otq.97.1582906973325; 
 Fri, 28 Feb 2020 08:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-2-richard.henderson@linaro.org>
In-Reply-To: <20200225180831.26078-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 16:22:42 +0000
Message-ID: <CAFEAcA8ipK0nZioEgbNq5B1L-tqA+rzn-C2yyfet4_4yNVnYqA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] target/arm: Improve masking of HCR RES0 bits
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-TUID: 9cWNlFukptcm

On Tue, 25 Feb 2020 at 18:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Don't merely start with v8.0, handle v7VE as well.
> Notice writes from aarch32 mode, and the bits that
> ought not be settable from there.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 79db169e04..d65160fdb3 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5089,8 +5089,13 @@ static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
>  static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  {
>      ARMCPU *cpu = env_archcpu(env);
> -    /* Begin with bits defined in base ARMv8.0.  */
> -    uint64_t valid_mask = MAKE_64BIT_MASK(0, 34);
> +    uint64_t valid_mask;
> +
> +    if (arm_feature(env, ARM_FEATURE_V8)) {
> +        valid_mask = MAKE_64BIT_MASK(0, 34);  /* ARMv8.0 */
> +    } else {
> +        valid_mask = MAKE_64BIT_MASK(0, 28);  /* ARMv7VE */
> +    }
>
>      if (arm_feature(env, ARM_FEATURE_EL3)) {
>          valid_mask &= ~HCR_HCD;
> @@ -5114,6 +5119,14 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>          valid_mask |= HCR_API | HCR_APK;
>      }
>
> +    if (ri->state == ARM_CP_STATE_AA32) {
> +        /*
> +         * Writes from aarch32 mode have more RES0 bits.
> +         * This includes TDZ, RW, E2H, and more.
> +         */
> +        valid_mask &= ~0xff80ff8c90000000ull;
> +    }

Isn't bit HCR2 bit 16 (aka bit 32+16==48 here) also RES0 from AArch32 ?
I suppose it's RES0 from AArch64 too, but as far as what we've
implemented goes so are a bunch of other bits.

I'm not really a fan of the hex-number here either, given we
have HCR_* constants.

thanks
-- PMM
