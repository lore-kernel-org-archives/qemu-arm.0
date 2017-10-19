Received: by 10.223.197.9 with SMTP id q9csp7014566wrf;
        Thu, 19 Oct 2017 09:51:13 -0700 (PDT)
X-Received: by 10.80.167.34 with SMTP id h31mr3290942edc.43.1508431873327;
        Thu, 19 Oct 2017 09:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508431873; cv=none;
        d=google.com; s=arc-20160816;
        b=Wpkc1VPM01K8fdvpSuBWyayqFdhK/VhSuPIb/TThXJtEi8t0aK+RUQcg8p4kdT5m1U
         N4dBsV/3ZdvibqONHLrnCRKX+cDj+NFN2P6Q78rIbtTX3k/FBzrF5brxDZdh4Yo902w+
         Gddn/2toJTi11VzqYXg2E77zWASng7Ad6D/vuKf3c29RZVXhhYD4ZlSEJgJ0Ud7UdhuA
         J2SMiS8p1eGpjGePozi0xL29SBlfRq8rYhg55RnZk3btoiBTUz/fzw8Yjdo0wjRFU2o4
         1c26wd6fOvCTwa7TYGoPRpFpFbbBXL78nW4/rqRjZjyk3jnBDe+jOhNtg99JUFOMWXL+
         86yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=d+ppvuy3wEaBP5JzmVyB7ioFquY9HOA4lPxG9rN+wqU=;
        b=VLFDt5PqX4cLWRLOIoELfoSg0YNqHEiddRCkzhnp6fdz3G/RatArbSc2aG5EYcDGSo
         kfLzReVWVbkAqUTNJ919mI81+SX5Xb67kXVFyGsdssuXtioCsIu3Fxbcni6brve9wMQ6
         199YV1R2aRXL7gfILnhirx7WIXDHXiHuxClrlon1Gc6g0bZEsNqkObDVti6llllxU6VM
         RYquxvFzj975nzKgJW+ACZUo10AbV+y3egtQNWx6SOC4+i3Wk8lAR0mPmLwjM0VqZejR
         w3OTe4oFbbhouiS5a71OVX5JUDDfsQMvi5ub0Vibt9piqbeF5x/lO6pnbvbKIgMdWDSI
         ZCvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IHFhASP3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d93si620162edd.348.2017.10.19.09.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 09:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IHFhASP3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5E2K-0005Oh-5I
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 12:51:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5E25-0005Lg-U5
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5E24-0005il-I0
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:50:57 -0400
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:45136)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5E24-0005hB-8q
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:50:56 -0400
Received: by mail-wr0-x230.google.com with SMTP id k7so8995617wre.2
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d+ppvuy3wEaBP5JzmVyB7ioFquY9HOA4lPxG9rN+wqU=;
	b=IHFhASP3sXAmc0chDkSq9EPiB4HjvsNPNVXwSZiv6qET4hEptkak2ENWRxHvYBEPyF
	MKAg8Ff4OdURdJnLMkNoDyuwO2lxO17QfB+0NHQPmtPzn1gGrtDPJopbjmuEubut+9T4
	I2exH0dAnpOwiDY+g2zO9d0mGFD0WOeJ4qH4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d+ppvuy3wEaBP5JzmVyB7ioFquY9HOA4lPxG9rN+wqU=;
	b=G9T5LBOhKNjcwA43zrAz1Yw9Vqb1cmHjBrNdjezHvn5/y6T+ld+3YNdECd5Os45/3I
	Qi9IISgtI5UTpRUpOmmXWVF2nVAGsN7yXSiDAophBIXrzZr8mjatPpimjhSuwTCNUqc+
	OS1vym35NQAGrBbC5R0yjVKSNX4N/eY05mkDjTuYrCzE6yztTEPNfONpZMg4QuWIKiaq
	1LiJx3G7zRjsI8D2/xmn1A7yVn7PJ3c7AAMAgTBCwk8/M15ODngmvooqAsyIwd59DIxd
	10R0yyt1qwj0SuXNRTJxGgw/AhKOaL5jGSPYg991HAv6hRXbZbgY92sBqINF44qd8yIe
	X6/A==
X-Gm-Message-State: AMCzsaUiukMWJBul35RwluqlQtfqkebaBNqZfkziKsB7T2zSW8jwS4VN
	2P6vFPAZMYBMQl4pW+40oqWfDdHoH7l+YhI+Ra/lCg==
X-Google-Smtp-Source: ABhQp+TIGZoQs3uzasz5J0PLY+E3dEiQtOSuxBFU8Osg7LcpA6Bq7sSFzOO6NjyhMyq0doCrwHNUzHiLrnsXwoB5yMc=
X-Received: by 10.223.155.209 with SMTP id e17mr2148253wrc.194.1508431852434; 
	Thu, 19 Oct 2017 09:50:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 19 Oct 2017 09:50:31 -0700 (PDT)
In-Reply-To: <20171018001608.8388-1-Andrew.Baumann@microsoft.com>
References: <20171018001608.8388-1-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 17:50:31 +0100
Message-ID: <CAFEAcA-6saNdT9k9Oo+cMoPWR-miaDq08EhN=3pbVzbadwzOwA@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-arm] [RFC PATCH] arm: implement cache/shareability
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
X-TUID: Lm2DzG7DtTkZ

On 18 October 2017 at 01:16, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> On a successful address translation instruction, PAR is supposed to
> contain cacheability and shareability attributes determined by the
> translation. Previous versions of QEMU returned 0 for these bits (in
> line with the general strategy of ignoring caches and memory
> attributes), but some guests may depend on them.
>
> This patch collects the attribute bits in the page-table work, and

"walk"

> updates PAR with the correct attributes after translation by the MAIR
> registers, but only in the restricted case of an LPAE descriptor with
> no second-stage translation. Other cases log an unimplemented message,
> and return 0 in these bits as in the prior implementation.
> ---

Hi; thanks for this patch. Looks like you forgot to add your
signed-off-by line.

> This is my second attempt at implementing enough of the PAR attribute
> bits to be able to boot Windows on aarch64. I'd appreciate some
> feedback/guidance on the following:
>
> 1. Is adding these entirely ARM-specific fields to the generic
>    MemTxAttrs bitfield the right approach, or would you prefer a new
>    return field from get_phys_addr() and friends?

MemTxAttrs is for attributes of a memory transaction as they
go out on a bus (conceptually speaking). While some of the
cacheability info does go out on a hardware AXI bus, it
obviously isn't formatted as an index into the MAIR registers,
since those are entirely CPU internal. I'm not sure the
shareability stuff goes outside the CPU at all, but I haven't
looked closely at the AXI spec.

While you could wade into the complexities of figuring out what
attributes we want to expose to devices via the MemTxAttrs fields,
I would suggest keeping things internal to the CPU implementation,
by adding another parameter to get_phys_addr() &c.

> 2. Is it acceptable to implement this piecemeal for the special LPAE
>    case we care about, and defer the messy special cases for later? (I
>    hope so!)

Depends whether I look at the other parts and decide on your
behalf that they're easy ;-)

> 3. Is my implementation of mair0 and mair1 (with the XXX comments)
>    sane? I suspect it's not. I had a hard time mapping what the ARM
>    ARM describes (e.g. in the pseudocode for AArch32.S1AttrDecode and
>    AArch64.S1AttrDecode) to the union interpreting mair_el[0] and
>    mair_el[1].

Where the AArch64.S1AttrDecode() pseudocode says MAIR[] this is
MAIR[S1TranslationRegime()], which in QEMU terms is
env->cp15.mair_el[regime_el(env, mmu_idx)].

For AArch32 things are a little trickier. NS MAIR0/MAIR1 are always
in env->cp15.mair0_ns and env->cp15.mair1_ns (and if you happen to
want the combined 64 bits MAIR1:MAIR0 then env->cp15.mair_el[1]
will give you that). But where Secure MAIR0/MAIR1 live depends
on whether EL3 is AArch32 or AArch64. If EL3 is AArch32 then the
MAIR0/MAIR1 are really banked registers, and the secure copies
are in env->cp15.mair0_s and env->cp15.mair1_s (with the MAIR1:MAIR0
combo being in env->cp15.mair_el[3])). But if EL3 is AArch64 then
these registers are architecturally not banked, and a secure EL1
will be using env->cp15.mair0_ns and mair1_ns just like NS EL1.

Helpfully, regime_el() abstracts away most of this, so if all
you want is a MAIR1:MAIR0 pair you can just say
 env->cp15.mair_el[regime_el(env, mmu_idx)];
the same as for AArch64.

We don't implement AArch32 EL2 yet, so the datastructure isn't
quite right for it yet, but HMAIR1:HMAIR0 is in mair_el[2]
(and the 32-bit part of the union should have uint32_t for
hmair0 and hmair1 where it currently has _unused_mair_1).

>  include/exec/memattrs.h |  3 +++
>  target/arm/helper.c     | 57 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 59 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index d4a1642098..3f4e1d7f0d 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -37,6 +37,9 @@ typedef struct MemTxAttrs {
>      unsigned int user:1;
>      /* Requester ID (for MSI for example) */
>      unsigned int requester_id:16;
> +    /* ARM: memory cacheability and shareability attributes */
> +    unsigned int arm_attrindx:3;
> +    unsigned int arm_shareability:2;
>  } MemTxAttrs;
>
>  /* Bus masters which don't specify any attributes will get this,
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 96113fe989..1dc1834929 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -19,6 +19,9 @@
>  #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
>
>  #ifndef CONFIG_USER_ONLY
> +static inline bool regime_using_lpae_format(CPUARMState *env,
> +                                            ARMMMUIdx mmu_idx);
> +
>  static bool get_phys_addr(CPUARMState *env, target_ulong address,
>                            MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                            hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
> @@ -2148,6 +2151,54 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
>      return CP_ACCESS_OK;
>  }
>
> +static uint8_t get_memattrs(CPUARMState *env, ARMMMUIdx mmu_idx,
> +                            uint8_t attrindx)
> +{
> +    uint64_t mair;
> +
> +    if (!regime_using_lpae_format(env, mmu_idx)) {
> +        qemu_log_mask(LOG_UNIMP,
> +                      "arm: short PTE memory attributes not implemented");
> +        return 0; /* keep consistency with the prior implementation */
> +    }
> +
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_S1E2:
> +        mair = env->cp15.mair_el[2];
> +        break;
> +
> +    case ARMMMUIdx_S1E3:
> +        mair = env->cp15.mair_el[3];
> +        break;
> +
> +    case ARMMMUIdx_S1SE0:
> +    case ARMMMUIdx_S1SE1:
> +        /* XXX: is this correct? */
> +        mair = (uint64_t)env->cp15.mair1_s << 32 | env->cp15.mair0_s;
> +        break;
> +
> +    case ARMMMUIdx_S1NSE0:
> +    case ARMMMUIdx_S1NSE1:
> +        /* XXX: is this correct? */
> +        mair = (uint64_t)env->cp15.mair1_ns << 32 | env->cp15.mair0_ns;
> +        break;

You can and should replace all this lot with
   mair = env->cp15.mair_el[regime_el(env, mmu_idx)];

which will give you the correct answer for S1SE0, where the
correct set of register state depends on whether EL3 is AArch32
or not (if EL3 is AArch32 then EL3 is the controlling one for
the Secure EL0 translation regime and the state is in mair1_s/mair0_s,
whereas if EL3 is AArch64 then EL1 is the controlling one for
Secure EL0 translation and the state is in mair_el[1].

> +    case ARMMMUIdx_S12NSE0:
> +    case ARMMMUIdx_S12NSE1:
> +    case ARMMMUIdx_S2NS:
> +        /* these cases (involving stage 2 attribute combining) are also NYI */
> +        qemu_log_mask(LOG_UNIMP,
> +                      "arm: stage 2 memory attributes not implemented");

The way to handle the S12NS* cases is to do the attribute combining
in the part at the top of get_phys_addr() which handles
S12NSE0/S12NSE1 by doing the stage 1 and stage 2 translations,
in a similar way to how we combine S1 and S2 permissions.

S2NS just requires you to look up the bits in the stage 2
translation table, there's no MAIR registers here.

> +        return 0;
> +
> +    default:
> +        abort(); /* M-profile code shouldn't reach here */
> +    }
> +
> +    assert(attrindx <= 7);
> +    return extract64(mair, attrindx * 8, 8);
> +}
> +
>  static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>                               MMUAccessType access_type, ARMMMUIdx mmu_idx)
>  {
> @@ -2173,7 +2224,9 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>              if (!attrs.secure) {
>                  par64 |= (1 << 9); /* NS */
>              }
> -            /* We don't set the ATTR or SH fields in the PAR. */
> +            par64 |= (uint64_t)get_memattrs(env, mmu_idx,
> +                                            attrs.arm_attrindx) << 56; /*ATTR*/

I think this is the wrong place to try to do the lookup from
AttrIndex[] pagetable bits to memory attributes via the MAIR*,
because not every kind of page table does memory attributes
that way. In particular for short descriptors with TEX remap
disabled, the attributes are directly in the page descriptors,
and this is also true for stage 2 translation tables.

So you want the page table walk functions to directly fill in
the information about cacheability and shareability, including
doing lookups in MAIR registers (or PRRR/NMRR registers, which
QEMU stores in the same CPUState fields, but they have a different
format.)

> +            par64 |= attrs.arm_shareability << 7; /* SH */
>          } else {
>              par64 |= 1; /* F */
>              par64 |= (fsr & 0x3f) << 1; /* FS */
> @@ -8929,6 +8982,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>           */
>          txattrs->secure = false;
>      }
> +    txattrs->arm_attrindx = extract32(attrs, 0, 3);
> +    txattrs->arm_shareability = extract32(attrs, 6, 2);
>      *phys_ptr = descaddr;
>      *page_size_ptr = page_size;
>      return false;
> --
> 2.14.2

thanks
-- PMM
