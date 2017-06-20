Received: by 10.25.15.165 with SMTP id 37csp924291lfp;
        Tue, 20 Jun 2017 08:45:09 -0700 (PDT)
X-Received: by 10.159.36.147 with SMTP id 19mr18347335uar.152.1497973509064;
        Tue, 20 Jun 2017 08:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497973509; cv=none;
        d=google.com; s=arc-20160816;
        b=dXYbv3wkVor4b1bxupS61vLnWx1LFOLdQntIRNOMyPAhOClMOivosNofPoYav4sK5k
         +lKqgKvuKTo2qv2Y/UXxZEgIpiKVGE4+PcY4EXwJfAXSAUG2kezbsVnmm3v8gmii3NaU
         6c1C/hEmmIZb6GhwuShMYlUxjAbntVdke/qWOHxY9FZFczSaXQgWuMhkNYVInN8cjRD2
         ow9snRkwESMLEyQnMhOJ+tALWiPdllDhs8fX21qXLO7PHZ7cQ/RFSWfZnspN6TEdBfvB
         M2URJiRneXZfIszT+o+30UPcJOuaFVWuOxPx1uP2N7XCiEZC8HSwLqmcjZ7uB4989iBW
         aJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=Ol8Tkaq1GNVXKn0cY5VZVey9X8KAWoAtHuiWnvKV34Q=;
        b=DZ5kpSSBnj60ENEqjzYfjAygzkh+ssFVjhCXtkNHKKISVVQzI3TEwYrmC1JeMOL+Lm
         Vcd2LUNqLRCJP6tolapNMjTkDpi46LY+nJlCiAYTcgJbaOauifh9xAC/yQAyiVq6DLik
         sXOW3kRtkba/TAjASG8tNOvtIhn+ar6/ZbJUkpkXGnuOjuHJ5cbKO5Bsgcg3GHLLWchj
         OrKwk5d4D3rryrkx2OoEiaRes51wk/g8wP2c7c0DHBRTucyELzzSqI4nbvO5wBanP36W
         05DyA1+Ip4roU6bVEgIa7+Nv+P4UUdJhmgiZXHJucgxSeECpyJpvV3TncUQbswpnycPB
         8x9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7si6057514vkf.268.2017.06.20.08.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Jun 2017 08:45:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dNLL2-0001x5-6H
	for alex.bennee@linaro.org; Tue, 20 Jun 2017 11:45:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1dNLKv-0001wu-CX
	for qemu-arm@nongnu.org; Tue, 20 Jun 2017 11:45:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1dNLKs-0001iT-8A
	for qemu-arm@nongnu.org; Tue, 20 Jun 2017 11:45:01 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:33132)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1dNLKs-0001hv-09; Tue, 20 Jun 2017 11:44:58 -0400
Received: by mail-lf0-f66.google.com with SMTP id u62so15419505lfg.0;
	Tue, 20 Jun 2017 08:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ol8Tkaq1GNVXKn0cY5VZVey9X8KAWoAtHuiWnvKV34Q=;
	b=Fj0Xm4j8hScifiqbE2a/hV7ph/nvwvtkeyo1zp/30ax61NsAckZWQZRrGZI2gBoujs
	nnJTBe5rPnjxOMEKAY/MsL6sxtPK8cOQ4l9dIWMyUM8DO0lQXyXvGbwVpocafQnDMAxY
	415eThr3MUbYY5Z+FgPyKo4uPSNhpy3OJyQ61pc8OdxouZT59T7nDUGXvz36Ol8poHct
	OLTglVLqw0zvlttxRV11kEVcsJ8GLRGFAi7MHYCJkTY5VFrGeQPeXvQsHwpk5i3uj0MJ
	06tKtnzti8pJ82hpENtbFAu0bbjj6LvmvolOsZVofzuM9Uw/LaPUHvXeyIGG8t7lm+dK
	abOw==
X-Gm-Message-State: AKS2vOylN0jdnJxEPmpeZ6peqKntGKx0UoLUaUe9xD/cYboFlPo37d8g
	cjvL0Jnv97XulA==
X-Received: by 10.80.137.136 with SMTP id g8mr21789808edg.125.1497973496288;
	Tue, 20 Jun 2017 08:44:56 -0700 (PDT)
Received: from kozik-lap (pub082136089155.dh-hfc.datazug.ch. [82.136.89.155])
	by smtp.googlemail.com with ESMTPSA id
	k44sm6902325ede.16.2017.06.20.08.44.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Jun 2017 08:44:55 -0700 (PDT)
Date: Tue, 20 Jun 2017 17:44:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170620154453.fmcixyow3e54u7li@kozik-lap>
References: <20170425180609.11004-1-krzk@kernel.org>
	<CAFEAcA8PjjUk6QrAE6ppgyYsYAyh+0uqd=_EgH-g4K=--utdoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8PjjUk6QrAE6ppgyYsYAyh+0uqd=_EgH-g4K=--utdoA@mail.gmail.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.66
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
X-TUID: /gcM5FXVMaQl

On Tue, Jun 20, 2017 at 04:34:57PM +0100, Peter Maydell wrote:
> On 25 April 2017 at 19:06, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Add emulation for Exynos4210 Pseudo Random Number Generator which could
> > work on fixed seeds or with seeds provided by True Random Number
> > Generator block inside the SoC.
> >
> > Implement only the fixed seeds part of it in polling mode (no
> > interrupts).
> >
> > Emulation tested with two independent Linux kernel exynos-rng drivers:
> > 1. New kcapi-rng interface (targeting Linux v4.12),
> > 2. Old hwrng inteface
> >    # echo "exynos" > /sys/class/misc/hw_random/rng_current
> >    # dd if=/dev/hwrng of=/dev/null bs=1 count=16
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v2:
> > 1. Drop GRand in favor of qcrypto_random_bytes() after discussion with
> >    Peter Maydell.
> > 2. Because of above, ignore the seed value but mark if each one of five
> >    seed registers were seeded.
> > 3. Fix memset of s->randr_value (copy paste error, also shorter sizeof
> >    can be used).
> >
> > Changes since v1:
> > 1. Use GRand-like functions to fix build on MingW32 (this adds also
> >    finalize).
> > 2. Add DPRINTF macro.
> > 3. Use HWADDR_PRIx and family for printing values.
> > ---
> 
> > +#define EXYNOS4210_RNG_STATUS_WRITE_MASK        (EXYNOS4210_RNG_STATUS_PRNG_DONE \
> > +                                                    | EXYNOS4210_RNG_STATUS_MSG_DONE \
> > +                                                    | EXYNOS4210_RNG_STATUS_PARTIAL_DONE)
> > +
> > +#define EXYNOS4210_RNG_CONTROL_1                  0x0
> > +#define EXYNOS4210_RNG_STATUS                    0x10
> > +#define EXYNOS4210_RNG_SEED_IN                  0x140
> > +#define EXYNOS4210_RNG_SEED_IN_OFFSET(n)        (EXYNOS4210_RNG_SEED_IN + (n * 0x4))
> > +#define EXYNOS4210_RNG_PRNG                     0x160
> > +#define EXYNOS4210_RNG_PRNG_OFFSET(n)           (EXYNOS4210_RNG_PRNG + (n * 0x4))
> 
> Some of these lines are slightly overlong.

Breaking lines does not make much sense, so I could just get rid of
EXYNOS4210 prefix. It is a local define so maybe there is no need of
prefixing it?

> 
> > +
> > +#define EXYNOS4210_RNG_PRNG_NUM                 5
> > +
> > +#define EXYNOS4210_RNG_REGS_MEM_SIZE            0x200
> > +
> > +typedef struct Exynos4210RngState {
> > +    SysBusDevice parent_obj;
> > +    MemoryRegion iomem;
> > +
> > +    int32_t randr_value[EXYNOS4210_RNG_PRNG_NUM];
> > +    /* bits from 0 to EXYNOS4210_RNG_PRNG_NUM if given seed register was set */
> > +    uint32_t seed_set;
> > +
> > +    /* Register values */
> > +    uint32_t reg_control;
> > +    uint32_t reg_status;
> > +} Exynos4210RngState;
> > +
> > +static bool exynos4210_rng_seed_ready(const Exynos4210RngState *s)
> > +{
> > +    unsigned int i;
> > +
> > +    for (i = 0; i < EXYNOS4210_RNG_PRNG_NUM; i++) {
> > +        if ((s->seed_set & BIT(i)) == 0) {
> > +            return false;
> > +        }
> > +    }
> > +
> > +    return true;
> 
> This can be more efficiently written as:
> 
>     uint32_t mask = MAKE_64BIT_MASK(0, EXYNOS4210_RNG_PRNG_NUM);
> 
>     /* Return true if all the seed-set bits are set. */
>     return (s->seed_set & mask) == mask;
> 
> 
> Unless you object, I propose to make those minor tweaks
> locally and commit to target-arm.next, rather than making
> you spin another version of this.

No objections, please feel free to change them in your tree.

Best regards,
Krzysztof

