Received: by 10.25.15.165 with SMTP id 37csp920158lfp;
        Tue, 20 Jun 2017 08:35:29 -0700 (PDT)
X-Received: by 10.176.17.26 with SMTP id e26mr5409466uab.94.1497972929855;
        Tue, 20 Jun 2017 08:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497972929; cv=none;
        d=google.com; s=arc-20160816;
        b=NpFNXSQpFVI+/J/kHvFA5ZgikWHGHYXtDxWuwS46vbwIjf2yt4PxZJmHjD/7CatlyP
         4i9QiJo7cZhxRUN4sj8nA1DuUWAnevdeqBZNDZWPFx+K1XkHYAkKslmMADnHDsracbn5
         4OSA1dZ9DZvq+e9yuNjOHHKa3AsVLOuOa1yIWZcyn47YnRxSDflitPxzGeRhfECjMyhE
         ojrHjjzA1Kvt8YbE0lBFNJbSY1Zscoqqr28zFPG1VLBRibIopzIp0HNWGYKhiBM9cOHe
         w0jjjWQwS+EImBLUUKEAC05yufhlk6eIKP/bQseyMfY+s+sslqjfcNZwrX8QfB4wK9C+
         VO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VPrQY+R6NjP2k7pvQkYuRvr17sBJ+KyeAZJelpjrtcs=;
        b=zjrlo28QyVw1gwHSGQWIAOAD43DB5YRDsQmcyNs2Zdap32q4b5027q3zqJzUG8tl6U
         YeVu3E2KzYFhGMkQbquMqYpWUgO0PRko6yjWQzhz9ldxpILDVYn2vG/LOGuhkDpx6z56
         dTNcYgIyS8b7xDhJDuPgHWJilvvfW2Tabbz/gmZWKt1MftFQEHHM96cYcfZo+MDylNHJ
         4fkFf7oQVE7xzLCCteXXr3Nb5Z5dLhCBT5MiB6UNr8rc8nWT4/OotPpNwZrO4HBQlJW8
         YX0utPrNH1YxI3RNGKTplwla+60agt0R3AT8RoVu3YSHOGdI6nD/t6KpCbrO9U/GIV5z
         pV1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=MdaRfsqi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15si6053601vkb.32.2017.06.20.08.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Jun 2017 08:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=MdaRfsqi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dNLBh-00064f-9f
	for alex.bennee@linaro.org; Tue, 20 Jun 2017 11:35:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dNLBc-00062y-D7
	for qemu-arm@nongnu.org; Tue, 20 Jun 2017 11:35:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dNLBY-0005F0-C3
	for qemu-arm@nongnu.org; Tue, 20 Jun 2017 11:35:24 -0400
Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231]:36368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dNLBY-0005DW-5h
	for qemu-arm@nongnu.org; Tue, 20 Jun 2017 11:35:20 -0400
Received: by mail-lf0-x231.google.com with SMTP id o83so76857777lff.3
	for <qemu-arm@nongnu.org>; Tue, 20 Jun 2017 08:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VPrQY+R6NjP2k7pvQkYuRvr17sBJ+KyeAZJelpjrtcs=;
	b=MdaRfsqiG58DG6p5iLIqMmkAtaY+j2JI0h2gYms+aEhDX6Xpz8U3G4bXbtvEv1mfO+
	aA/q62GK/YqjMEZYo+MB6vvwrCJD2pqHuJA9vKl+73IUYsi7N2WkvHx48Qn8zkxEIhCM
	b0XKfnKy8OWqCldFvLvQnrET8xM44uV6FLzcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VPrQY+R6NjP2k7pvQkYuRvr17sBJ+KyeAZJelpjrtcs=;
	b=FA+1wnF1zlWctrypoCPkGOIyjjZPS1y4tLot2UXJEuOsMB+TF//EOU8ZtvKedpkX20
	9FPXj4ZIrdzdon01iF3NiwN+DTMAYY3b8bDXTnyaHSQ7iWp99oWycAWd2WX3Q/5gMVP1
	eslK0b/u/ZB41JpvVqCG5yY2znjpLID0m1IcOV1h6/YtGbodovmFrpBN6qDjgBC6DloG
	+jlWDJp69y8hlJZqcGc8rWlEzgHaVE97j/v0AmRT732h7zDV2IY0okhoYpbvfoBLhgoO
	lWR4SnvkrIjENpSTgba6nk0XehlBUMeK8H4b4IE0B2uc3BY9RnSx23YrhbpnPLYHdtz0
	AXjA==
X-Gm-Message-State: AKS2vOzu737ce0vcLm4sN5PfssKU09gsJOtkSZu7rY4HhsMgIzP7ZVQj
	MUFJQxLx3MsJ+thn9eTnr57X9KOSewxV
X-Received: by 10.28.66.23 with SMTP id p23mr3174008wma.38.1497972918451; Tue,
	20 Jun 2017 08:35:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 20 Jun 2017 08:34:57 -0700 (PDT)
In-Reply-To: <20170425180609.11004-1-krzk@kernel.org>
References: <20170425180609.11004-1-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jun 2017 16:34:57 +0100
Message-ID: <CAFEAcA8PjjUk6QrAE6ppgyYsYAyh+0uqd=_EgH-g4K=--utdoA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::231
Subject: Re: [Qemu-arm] [PATCH v3] hw/misc: Add Exynos4210 Pseudo Random
 Number Generator
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X7ySUWAvX1ue

On 25 April 2017 at 19:06, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Add emulation for Exynos4210 Pseudo Random Number Generator which could
> work on fixed seeds or with seeds provided by True Random Number
> Generator block inside the SoC.
>
> Implement only the fixed seeds part of it in polling mode (no
> interrupts).
>
> Emulation tested with two independent Linux kernel exynos-rng drivers:
> 1. New kcapi-rng interface (targeting Linux v4.12),
> 2. Old hwrng inteface
>    # echo "exynos" > /sys/class/misc/hw_random/rng_current
>    # dd if=/dev/hwrng of=/dev/null bs=1 count=16
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v2:
> 1. Drop GRand in favor of qcrypto_random_bytes() after discussion with
>    Peter Maydell.
> 2. Because of above, ignore the seed value but mark if each one of five
>    seed registers were seeded.
> 3. Fix memset of s->randr_value (copy paste error, also shorter sizeof
>    can be used).
>
> Changes since v1:
> 1. Use GRand-like functions to fix build on MingW32 (this adds also
>    finalize).
> 2. Add DPRINTF macro.
> 3. Use HWADDR_PRIx and family for printing values.
> ---

> +#define EXYNOS4210_RNG_STATUS_WRITE_MASK        (EXYNOS4210_RNG_STATUS_PRNG_DONE \
> +                                                    | EXYNOS4210_RNG_STATUS_MSG_DONE \
> +                                                    | EXYNOS4210_RNG_STATUS_PARTIAL_DONE)
> +
> +#define EXYNOS4210_RNG_CONTROL_1                  0x0
> +#define EXYNOS4210_RNG_STATUS                    0x10
> +#define EXYNOS4210_RNG_SEED_IN                  0x140
> +#define EXYNOS4210_RNG_SEED_IN_OFFSET(n)        (EXYNOS4210_RNG_SEED_IN + (n * 0x4))
> +#define EXYNOS4210_RNG_PRNG                     0x160
> +#define EXYNOS4210_RNG_PRNG_OFFSET(n)           (EXYNOS4210_RNG_PRNG + (n * 0x4))

Some of these lines are slightly overlong.

> +
> +#define EXYNOS4210_RNG_PRNG_NUM                 5
> +
> +#define EXYNOS4210_RNG_REGS_MEM_SIZE            0x200
> +
> +typedef struct Exynos4210RngState {
> +    SysBusDevice parent_obj;
> +    MemoryRegion iomem;
> +
> +    int32_t randr_value[EXYNOS4210_RNG_PRNG_NUM];
> +    /* bits from 0 to EXYNOS4210_RNG_PRNG_NUM if given seed register was set */
> +    uint32_t seed_set;
> +
> +    /* Register values */
> +    uint32_t reg_control;
> +    uint32_t reg_status;
> +} Exynos4210RngState;
> +
> +static bool exynos4210_rng_seed_ready(const Exynos4210RngState *s)
> +{
> +    unsigned int i;
> +
> +    for (i = 0; i < EXYNOS4210_RNG_PRNG_NUM; i++) {
> +        if ((s->seed_set & BIT(i)) == 0) {
> +            return false;
> +        }
> +    }
> +
> +    return true;

This can be more efficiently written as:

    uint32_t mask = MAKE_64BIT_MASK(0, EXYNOS4210_RNG_PRNG_NUM);

    /* Return true if all the seed-set bits are set. */
    return (s->seed_set & mask) == mask;


Unless you object, I propose to make those minor tweaks
locally and commit to target-arm.next, rather than making
you spin another version of this.

thanks
-- PMM
