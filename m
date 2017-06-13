Received: by 10.25.0.23 with SMTP id 23csp445174lfa;
        Tue, 13 Jun 2017 11:09:13 -0700 (PDT)
X-Received: by 10.200.8.67 with SMTP id x3mr1630746qth.195.1497377353721;
        Tue, 13 Jun 2017 11:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497377353; cv=none;
        d=google.com; s=arc-20160816;
        b=wLFraDszbes1S+YIjt9itVws5NcCZAoGGldoa9sICs5fdOYQ36WnRzrqAgk6Sa2Z7t
         +bE2+I9kbcs3FNBwIYl48lrylWIuTQl5gZFFO+jewS9F8yH1ZLboc3Cfy4DW/Ldpwqrm
         2+Mg4fx/J9Da8V+4/DMlHW8bQjU/BOdXl4WLkCOHNH7WuRXTRgB6cvZpU89ubtLv64PG
         p5sZyVZJhE3cg+tOy/e04TmiFntYc9dBr1OIyaXMNrdDXqaApzTjhINxlB8PyAdgjZiG
         EerOGtzN8u1gSTeY/x0j453eljINdq9lzwEPW+U5dSj13NJukkT13792fXf7YWw0fzZs
         NqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=1TaliTn0fvbtDF/E64EFOWH87eI2Z9R+e2XuTuwDZ+E=;
        b=PkuHpM9kvtrxuMWo6pnhPB2iLeMocju3Gvwh9BvfKw+9hDKzr14anHlOxihXrIJJet
         Ot5Eaq+LER89udPxPNCOgmFIaiHnZ0AhHq9H+GLsLrQ9K4mfgNI50586wSSAKHgVtvVf
         FPl6dgXypGS9wMx+NoKkp396ZEv6Ng3jJ144WtFgBsYRJ7ofHJLjbtIr7Bx+fDPZwCjd
         1WoFIzAvins8BJu5uxZtmBwNisCkmolpg+u3n1HSJdoAfrBVWd5sjiBznKZAlkYaXxI9
         T7qn8HkAMpyszgoF25pnAtBOHsUFObutzFi/vSgENpVJWnOoEH30QUPG8r4jyY7PwhK8
         wR6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k51si721001qta.139.2017.06.13.11.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Jun 2017 11:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44593 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKqFb-0007kG-2H
	for alex.bennee@linaro.org; Tue, 13 Jun 2017 14:09:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1dKqFU-0007jB-15
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 14:09:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1dKqFQ-0008MW-Ps
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 14:09:03 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:33799)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1dKqFQ-0008MO-Eq; Tue, 13 Jun 2017 14:09:00 -0400
Received: by mail-wr0-f193.google.com with SMTP id u101so32792429wrc.1;
	Tue, 13 Jun 2017 11:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1TaliTn0fvbtDF/E64EFOWH87eI2Z9R+e2XuTuwDZ+E=;
	b=eomlB83tEXlDwBJ07cB5iIfRnQNeD5gXF4PXdbMbp8yg73GyAUdRgk4KjmlZONV6oI
	Qc6KrRc7p2iNAdCnN7U582D3s6JeknTwCNdr2k++36LQSDBvRZ9W66/TUBp2cJiyfAg8
	WU3tQf7Ws1RL6jY8ngFiEFi9If1vFxzlxZUjawrj/bPB7IngDNwGYwFB8DqoFjXYz1qt
	E4b8HoXtjl5sr8KWA3XdQyjcSNHpGR1NPGisX3rlRUOAgJGDK2JerXGZJOPgP9qzazHi
	wlvj6/Qyc/Da3Bk//2tVW/LC28c8qgyHY5+T+8mPtmGw1a85nuVFMKV7NgLW6T4sXO08
	DDbQ==
X-Gm-Message-State: AKS2vOwvAIrBYpFon3KcRU1W1KpbhgiijD6GLW8eorJwT/AWoBPnp5+8
	tkRQ+2wClCac2Q==
X-Received: by 10.80.139.65 with SMTP id l59mr910918edl.52.1497377337682;
	Tue, 13 Jun 2017 11:08:57 -0700 (PDT)
Received: from kozik-lap (pub082136089155.dh-hfc.datazug.ch. [82.136.89.155])
	by smtp.googlemail.com with ESMTPSA id
	x13sm7739230edb.12.2017.06.13.11.08.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Jun 2017 11:08:57 -0700 (PDT)
Date: Tue, 13 Jun 2017 20:08:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170613180855.g57l6cri33fzd2do@kozik-lap>
References: <20170425180609.11004-1-krzk@kernel.org>
	<CAFEAcA8C2QQynn_a7SsJOYo4oOuqV4UGmV2kKOHxLCafx=yTWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8C2QQynn_a7SsJOYo4oOuqV4UGmV2kKOHxLCafx=yTWA@mail.gmail.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.193
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
X-TUID: 5ed3oBop3Vuo

On Tue, Jun 13, 2017 at 07:06:20PM +0100, Peter Maydell wrote:
> On 25 April 2017 at 19:06, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Add emulation for Exynos4210 Pseudo Random Number Generator which could
> > work on fixed seeds or with seeds provided by True Random Number
> > Generator block inside the SoC.
> >
> > Implement only the fixed seeds part of it in polling mode (no
> > interrupts).
> 
> Hi -- this patch is a bit old and I forget what the status of it
> is. Does it still need review?

You had some comments on v2 which I hope I resolved. From my point of
view, it is ready to apply or final review.


Best regards,
Krzysztof

> 
> thanks
> -- PMM
> 
> 
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
> >  hw/arm/exynos4210.c      |   4 +
> >  hw/misc/Makefile.objs    |   2 +-
> >  hw/misc/exynos4210_rng.c | 282 +++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 287 insertions(+), 1 deletion(-)
> >  create mode 100644 hw/misc/exynos4210_rng.c
> >
> > diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> > index 960f27e45a36..5a622cfedfc8 100644
> > --- a/hw/arm/exynos4210.c
> > +++ b/hw/arm/exynos4210.c
> > @@ -86,6 +86,9 @@
> >  /* Clock controller SFR base address */
> >  #define EXYNOS4210_CLK_BASE_ADDR            0x10030000
> >
> > +/* PRNG/HASH SFR base address */
> > +#define EXYNOS4210_RNG_BASE_ADDR            0x10830400
> > +
> >  /* Display controllers (FIMD) */
> >  #define EXYNOS4210_FIMD0_BASE_ADDR          0x11C00000
> >
> > @@ -322,6 +325,7 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem,
> >      sysbus_create_simple("exynos4210.pmu", EXYNOS4210_PMU_BASE_ADDR, NULL);
> >
> >      sysbus_create_simple("exynos4210.clk", EXYNOS4210_CLK_BASE_ADDR, NULL);
> > +    sysbus_create_simple("exynos4210.rng", EXYNOS4210_RNG_BASE_ADDR, NULL);
> >
> >      /* PWM */
> >      sysbus_create_varargs("exynos4210.pwm", EXYNOS4210_PWM_BASE_ADDR,
> > diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> > index c8b489390f7e..e0699ea11155 100644
> > --- a/hw/misc/Makefile.objs
> > +++ b/hw/misc/Makefile.objs
> > @@ -26,7 +26,7 @@ obj-$(CONFIG_IVSHMEM) += ivshmem.o
> >  obj-$(CONFIG_REALVIEW) += arm_sysctl.o
> >  obj-$(CONFIG_NSERIES) += cbus.o
> >  obj-$(CONFIG_ECCMEMCTL) += eccmemctl.o
> > -obj-$(CONFIG_EXYNOS4) += exynos4210_pmu.o exynos4210_clk.o
> > +obj-$(CONFIG_EXYNOS4) += exynos4210_pmu.o exynos4210_clk.o exynos4210_rng.o
> >  obj-$(CONFIG_IMX) += imx_ccm.o
> >  obj-$(CONFIG_IMX) += imx31_ccm.o
> >  obj-$(CONFIG_IMX) += imx25_ccm.o
> > diff --git a/hw/misc/exynos4210_rng.c b/hw/misc/exynos4210_rng.c
> > new file mode 100644
> > index 000000000000..3f1459edb5df
> > --- /dev/null
> > +++ b/hw/misc/exynos4210_rng.c
> > @@ -0,0 +1,282 @@
> > +/*
> > + *  Exynos4210 Pseudo Random Nubmer Generator Emulation
> > + *
> > + *  Copyright (c) 2017 Krzysztof Kozlowski <krzk@kernel.org>
> > + *
> > + *  This program is free software; you can redistribute it and/or modify it
> > + *  under the terms of the GNU General Public License as published by the
> > + *  Free Software Foundation; either version 2 of the License, or
> > + *  (at your option) any later version.
> > + *
> > + *  This program is distributed in the hope that it will be useful, but WITHOUT
> > + *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + *  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> > + *  for more details.
> > + *
> > + *  You should have received a copy of the GNU General Public License along
> > + *  with this program; if not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "crypto/random.h"
> > +#include "hw/sysbus.h"
> > +#include "qemu/log.h"
> > +
> > +#define DEBUG_EXYNOS_RNG 0
> > +
> > +#define DPRINTF(fmt, ...) \
> > +    do { \
> > +        if (DEBUG_EXYNOS_RNG) { \
> > +            printf("exynos4210_rng: " fmt, ## __VA_ARGS__); \
> > +        } \
> > +    } while (0)
> > +
> > +#define TYPE_EXYNOS4210_RNG             "exynos4210.rng"
> > +#define EXYNOS4210_RNG(obj) \
> > +    OBJECT_CHECK(Exynos4210RngState, (obj), TYPE_EXYNOS4210_RNG)
> > +
> > +/*
> > + * Exynos4220, PRNG, only polling mode is supported.
> > + */
> > +
> > +/* RNG_CONTROL_1 register bitfields, reset value: 0x0 */
> > +#define EXYNOS4210_RNG_CONTROL_1_PRNG           0x8
> > +#define EXYNOS4210_RNG_CONTROL_1_START_INIT     BIT(4)
> > +/* RNG_STATUS register bitfields, reset value: 0x1 */
> > +#define EXYNOS4210_RNG_STATUS_PRNG_ERROR        BIT(7)
> > +#define EXYNOS4210_RNG_STATUS_PRNG_DONE         BIT(5)
> > +#define EXYNOS4210_RNG_STATUS_MSG_DONE          BIT(4)
> > +#define EXYNOS4210_RNG_STATUS_PARTIAL_DONE      BIT(3)
> > +#define EXYNOS4210_RNG_STATUS_PRNG_BUSY         BIT(2)
> > +#define EXYNOS4210_RNG_STATUS_SEED_SETTING_DONE BIT(1)
> > +#define EXYNOS4210_RNG_STATUS_BUFFER_READY      BIT(0)
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
> > +}
> > +
> > +static void exynos4210_rng_set_seed(Exynos4210RngState *s, unsigned int i,
> > +                                    uint64_t val)
> > +{
> > +    /*
> > +     * We actually ignore the seed and always generate true random numbers.
> > +     * Theoretically this should not match the device as Exynos has
> > +     * a Pseudo Random Number Generator but testing shown that it always
> > +     * generates random numbers regardless of the seed value.
> > +     */
> > +    s->seed_set |= BIT(i);
> > +
> > +    /* If all seeds were written, update the status to reflect it */
> > +    if (exynos4210_rng_seed_ready(s)) {
> > +        s->reg_status |= EXYNOS4210_RNG_STATUS_SEED_SETTING_DONE;
> > +    } else {
> > +        s->reg_status &= ~EXYNOS4210_RNG_STATUS_SEED_SETTING_DONE;
> > +    }
> > +}
> > +
> > +static void exynos4210_rng_run_engine(Exynos4210RngState *s)
> > +{
> > +    Error *err = NULL;
> > +    int ret;
> > +
> > +    /* Seed set? */
> > +    if ((s->reg_status & EXYNOS4210_RNG_STATUS_SEED_SETTING_DONE) == 0) {
> > +        goto out;
> > +    }
> > +
> > +    /* PRNG engine chosen? */
> > +    if ((s->reg_control & EXYNOS4210_RNG_CONTROL_1_PRNG) == 0) {
> > +        goto out;
> > +    }
> > +
> > +    /* PRNG engine started? */
> > +    if ((s->reg_control & EXYNOS4210_RNG_CONTROL_1_START_INIT) == 0) {
> > +        goto out;
> > +    }
> > +
> > +    /* Get randoms */
> > +    ret = qcrypto_random_bytes((uint8_t *)s->randr_value,
> > +                               sizeof(s->randr_value), &err);
> > +    if (!ret) {
> > +        /* Notify that PRNG is ready */
> > +        s->reg_status |= EXYNOS4210_RNG_STATUS_PRNG_DONE;
> > +    } else {
> > +        error_report_err(err);
> > +    }
> > +
> > +out:
> > +    /* Always clear start engine bit */
> > +    s->reg_control &= ~EXYNOS4210_RNG_CONTROL_1_START_INIT;
> > +}
> > +
> > +static uint64_t exynos4210_rng_read(void *opaque, hwaddr offset,
> > +                                    unsigned size)
> > +{
> > +    Exynos4210RngState *s = (Exynos4210RngState *)opaque;
> > +    uint32_t val = 0;
> > +
> > +    assert(size == 4);
> > +
> > +    switch (offset) {
> > +    case EXYNOS4210_RNG_CONTROL_1:
> > +        val = s->reg_control;
> > +        break;
> > +
> > +    case EXYNOS4210_RNG_STATUS:
> > +        val = s->reg_status;
> > +        break;
> > +
> > +    case EXYNOS4210_RNG_PRNG_OFFSET(0):
> > +    case EXYNOS4210_RNG_PRNG_OFFSET(1):
> > +    case EXYNOS4210_RNG_PRNG_OFFSET(2):
> > +    case EXYNOS4210_RNG_PRNG_OFFSET(3):
> > +    case EXYNOS4210_RNG_PRNG_OFFSET(4):
> > +        val = s->randr_value[(offset - EXYNOS4210_RNG_PRNG_OFFSET(0)) / 4];
> > +        DPRINTF("returning random @0x%" HWADDR_PRIx ": 0x%" PRIx32 "\n",
> > +                offset, val);
> > +        break;
> > +
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: bad read offset 0x%" HWADDR_PRIx "\n",
> > +                      __func__, offset);
> > +    }
> > +
> > +    return val;
> > +}
> > +
> > +static void exynos4210_rng_write(void *opaque, hwaddr offset,
> > +                                 uint64_t val, unsigned size)
> > +{
> > +    Exynos4210RngState *s = (Exynos4210RngState *)opaque;
> > +
> > +    assert(size == 4);
> > +
> > +    switch (offset) {
> > +    case EXYNOS4210_RNG_CONTROL_1:
> > +        DPRINTF("RNG_CONTROL_1 = 0x%" PRIx64 "\n", val);
> > +        s->reg_control = val;
> > +        exynos4210_rng_run_engine(s);
> > +        break;
> > +
> > +    case EXYNOS4210_RNG_STATUS:
> > +        /* For clearing status fields */
> > +        s->reg_status &= ~EXYNOS4210_RNG_STATUS_WRITE_MASK;
> > +        s->reg_status |= val & EXYNOS4210_RNG_STATUS_WRITE_MASK;
> > +        break;
> > +
> > +    case EXYNOS4210_RNG_SEED_IN_OFFSET(0):
> > +    case EXYNOS4210_RNG_SEED_IN_OFFSET(1):
> > +    case EXYNOS4210_RNG_SEED_IN_OFFSET(2):
> > +    case EXYNOS4210_RNG_SEED_IN_OFFSET(3):
> > +    case EXYNOS4210_RNG_SEED_IN_OFFSET(4):
> > +        exynos4210_rng_set_seed(s,
> > +                                (offset - EXYNOS4210_RNG_SEED_IN_OFFSET(0)) / 4,
> > +                                val);
> > +        break;
> > +
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: bad write offset 0x%" HWADDR_PRIx "\n",
> > +                      __func__, offset);
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps exynos4210_rng_ops = {
> > +    .read = exynos4210_rng_read,
> > +    .write = exynos4210_rng_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > +};
> > +
> > +static void exynos4210_rng_reset(DeviceState *dev)
> > +{
> > +    Exynos4210RngState *s = EXYNOS4210_RNG(dev);
> > +
> > +    s->reg_control = 0;
> > +    s->reg_status = EXYNOS4210_RNG_STATUS_BUFFER_READY;
> > +    memset(s->randr_value, 0, sizeof(s->randr_value));
> > +    s->seed_set = 0;
> > +}
> > +
> > +static void exynos4210_rng_init(Object *obj)
> > +{
> > +    Exynos4210RngState *s = EXYNOS4210_RNG(obj);
> > +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> > +
> > +    memory_region_init_io(&s->iomem, obj, &exynos4210_rng_ops, s,
> > +                          TYPE_EXYNOS4210_RNG, EXYNOS4210_RNG_REGS_MEM_SIZE);
> > +    sysbus_init_mmio(dev, &s->iomem);
> > +}
> > +
> > +static const VMStateDescription exynos4210_rng_vmstate = {
> > +    .name = TYPE_EXYNOS4210_RNG,
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_INT32_ARRAY(randr_value, Exynos4210RngState,
> > +                            EXYNOS4210_RNG_PRNG_NUM),
> > +        VMSTATE_UINT32(seed_set, Exynos4210RngState),
> > +        VMSTATE_UINT32(reg_status, Exynos4210RngState),
> > +        VMSTATE_UINT32(reg_control, Exynos4210RngState),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static void exynos4210_rng_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +
> > +    dc->reset = exynos4210_rng_reset;
> > +    dc->vmsd = &exynos4210_rng_vmstate;
> > +}
> > +
> > +static const TypeInfo exynos4210_rng_info = {
> > +    .name          = TYPE_EXYNOS4210_RNG,
> > +    .parent        = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(Exynos4210RngState),
> > +    .instance_init = exynos4210_rng_init,
> > +    .class_init    = exynos4210_rng_class_init,
> > +};
> > +
> > +static void exynos4210_rng_register(void)
> > +{
> > +    type_register_static(&exynos4210_rng_info);
> > +}
> > +
> > +type_init(exynos4210_rng_register)
> > --
> > 2.9.3
> >
