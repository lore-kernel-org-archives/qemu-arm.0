Received: by 10.28.173.206 with SMTP id w197csp2178023wme;
        Fri, 12 Jan 2018 10:38:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBotg94yQalueum1/XiKS31WwqM12GoRS3xQSIqI3b/lMdcTh4O0apIGnXT038cyRgGWGFQk1
X-Received: by 10.13.206.4 with SMTP id q4mr23946181ywd.305.1515782336006;
        Fri, 12 Jan 2018 10:38:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515782336; cv=none;
        d=google.com; s=arc-20160816;
        b=1AbqstON7x9oNJ2tKeRF2gmCdDPbrV+Hy5SGwmSzC3cUL8UBij7Yj4kr9g6ZDk092m
         kWUc3/6K0UyaHT40p5epVGYXjUL4OQn+NfxaqB3jCoqe55JvlF8rvmheuVqC3tVaSlr4
         sByHjp7OBWoq2NVhUXzOH27dCZ7Sd+9maFEDE5QID58p20xC5W0g/ztKEtgKlwTifbd/
         X+J0DqvyF1dcijfjDZ2ELqnPnKmtGfLjLw6NRVqVtLNRsqqpU3qaCdPepGHDFXg1yAPS
         bxVoqs+EBjLOxxqqZY1rVFWu545ZUz63OrF0A51tD4FbuTwFq4BD61Loqz7sbYbKCN81
         v1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=T95+IoUtyydlH4UOUDxB1BcPWC89x0jqAezDjJWrItU=;
        b=F5PiYcHW9kr2XmKqcPuLK7TAuqeldbPt0GvkzAj7jmPhP3Epcp93blVNaYLaDEY+JM
         5jdGMlt5uRdCnIxKgTdQVjjm0CuNB1VwBMKr2W2X3XwkrYacPL8IgaAZNNx8gl/Vcvhy
         f9j+Pm9OJ+yd2vMuaJnNJNKSQkQSAXMVrjIfrv+SkeqDXmQ/t+Wl7TsHH1tCtOAFeuqa
         aOGgW8Yh+QghJWQ1umGVd3JamPzmevmS5Armt/gatfZtpmSVUttiytJlf4Nazrw6mvrC
         E+bvijiflt9Z7mky4O2WiyCwzYsnzfKi8hbA8zQ/tIZrqQBwqiVwSODChp6Cv13J0g9g
         D/ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NmtYF8Dt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o66si2311832ywb.552.2018.01.12.10.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 10:38:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NmtYF8Dt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea4EB-0002it-F6
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 13:38:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ea4E1-0002hF-Bf
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:38:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ea4E0-0000u1-DB
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:38:45 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:44703)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ea4E0-0000tV-9F
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:38:44 -0500
Received: by mail-ot0-x242.google.com with SMTP id g59so5807414otg.11
	for <qemu-arm@nongnu.org>; Fri, 12 Jan 2018 10:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T95+IoUtyydlH4UOUDxB1BcPWC89x0jqAezDjJWrItU=;
	b=NmtYF8DtfHX2EbEIXJv8KyjmD+pygIoFbykM++w/Wjga9+LKr3B+6iQetVMSP9CALO
	CTVMMo/0uGTqCVmpEaHM3Csk8RM0Ir9LCILYXNTqqJNemXOkywhFrDSJG3xV6fOWtZ27
	VaUEIpl8O1IxFZ8vweIsGdW/YH7hPnRGLqKUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T95+IoUtyydlH4UOUDxB1BcPWC89x0jqAezDjJWrItU=;
	b=aTIDLz4M/yJWkxw2IPOuN+s+WAVGg9JV9ztDWrWRuxcHIGydRS7/L2cryV8utxZnkA
	ZE5T34GxetNVRE15GUyvYvgFCFlfelNS8/193wnar7wkwAC8SOFSVj97VwEtO5qafyRi
	FzNLW2YGjzFtAUiFUUvJaHSgLBOMSrThTmSXmr1/vdFxdQYIDD76xdBkZAz2IavP3kHp
	USafFonEU0t8pKYiy14Qai8mlw1bytJrXl8zDDGmPje2PGvFGMb8yMgvOXAGycb49WLT
	XvvjobCnU/6cJu2quw0nWnARg+me0WFvbdWhhAWh2QS9Kn4/sdFYEJfikpP6NFj6IiAU
	W4PA==
X-Gm-Message-State: AKwxyteCt951wXSo1zerNrjtMOizUi3V6A8j4CklAYNxwKY1YE6ZwpZn
	KmlQ+UFnzAocRSdasOQTRql6Mg/ZlmbH3linNIfZPg==
X-Received: by 10.157.52.215 with SMTP id t23mr7486326otd.54.1515782323504;
	Fri, 12 Jan 2018 10:38:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Fri, 12 Jan 2018 10:38:23 -0800 (PST)
In-Reply-To: <20171218173022.18418-8-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2018 18:38:23 +0000
Message-ID: <CAFEAcA-kbZRaGoERUG7iZGsO3hswC=ityDWf4n2fwXsSwO7jCw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH 7/9] target/arm: Expand vector registers for
 SVE
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
X-TUID: kO/A1mef4rfC

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Change vfp.regs as a uint64_t to vfp.zregs as an ARMVectorReg.
> The previous patches have made the change in representation
> relatively painless.
>
> Add vfp.pregs as an ARMPredicateReg.  Let FFR be P16 to make
> it easier to treat it as for any other predicate.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 64 ++++++++++++++++++++++++++++++++--------------
>  target/arm/machine.c       | 37 ++++++++++++++++++++++++++-
>  target/arm/translate-a64.c |  8 +++---
>  target/arm/translate.c     | 12 ++++-----
>  4 files changed, 90 insertions(+), 31 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e1a8e2880d..150b0d9d84 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -153,6 +153,47 @@ typedef struct {
>      uint32_t base_mask;
>  } TCR;
>
> +/* Define a maximum sized vector register.
> + * For 32-bit, this is a 128-bit NEON/AdvSIMD register.
> + * For 64-bit, this is a 2048-bit SVE register.
> + *
> + * Note that the mapping between S, D, and Q views of the register bank
> + * differs between AArch64 and AArch32.
> + * In AArch32:
> + *  Qn = regs[n].d[1]:regs[n].d[0]
> + *  Dn = regs[n / 2].d[n & 1]
> + *  Sn = regs[n / 4].d[n % 4 / 2],
> + *       bits 31..0 for even n, and bits 63..32 for odd n
> + *       (and regs[16] to regs[31] are inaccessible)
> + * In AArch64:
> + *  Zn = regs[n].d[*]
> + *  Qn = regs[n].d[1]:regs[n].d[0]
> + *  Dn = regs[n].d[0]
> + *  Sn = regs[n].d[0] bits 31..0
> + *
> + * This corresponds to the architecturally defined mapping between
> + * the two execution states, and means we do not need to explicitly
> + * map these registers when changing states.
> + */

The transformations on the data structures (ie the meat of this patch
looks good).

> +
> +#ifdef TARGET_AARCH64
> +# define ARM_MAX_VQ    16
> +#else
> +# define ARM_MAX_VQ    1
> +#endif
> +
> +typedef struct ARMVectorReg {
> +    uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
> +} ARMVectorReg;
> +
> +typedef struct ARMPredicateReg {
> +#ifdef TARGET_AARCH64
> +    uint64_t p[2 * ARM_MAX_VQ / 8] QEMU_ALIGNED(16);
> +#else
> +    uint64_t p[0];
> +#endif
> +} ARMPredicateReg;

I think introducing the predicate registers should go in a separate
patch.

> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -1513,19 +1513,17 @@ static inline void gen_vfp_st(DisasContext *s, int dp, TCGv_i32 addr)
>      }
>  }
>
> -static inline long
> -vfp_reg_offset (int dp, int reg)
> +static inline long vfp_reg_offset(bool dp, unsigned reg)
>  {
>      if (dp) {
> -        return offsetof(CPUARMState, vfp.regs[reg]);
> +        return offsetof(CPUARMState, vfp.zregs[reg >> 1].d[reg & 1]);
>      } else {
> -        long ofs = offsetof(CPUARMState, vfp.regs[reg >> 1]);
> +        long r = offsetof(CPUARMState, vfp.zregs[reg >> 2].d[(reg >> 1) & 1]);
>          if (reg & 1) {
> -            ofs += offsetof(CPU_DoubleU, l.upper);
> +            return r + offsetof(CPU_DoubleU, l.upper);
>          } else {
> -            ofs += offsetof(CPU_DoubleU, l.lower);
> +            return r + offsetof(CPU_DoubleU, l.lower);
>          }
> -        return ofs;

...I see we're tweaking the logic on this code again. I was
expecting that the changes in the previous patch would have turned
out to be in support of just having to do a one-line change in this
one, but apparently not ?

>      }
>  }

thanks
-- PMM
