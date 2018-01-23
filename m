Received: by 10.28.71.27 with SMTP id u27csp3921328wma;
        Tue, 23 Jan 2018 03:15:55 -0800 (PST)
X-Google-Smtp-Source: AH8x226iz8pmR0IZNqc+lVdhTK1Jv/knps5RI4A1iUoINVNahkBUeVwNckRcTZh3B9QKzA7dNAfo
X-Received: by 10.37.203.143 with SMTP id b137mr1982261ybg.412.1516706155546;
        Tue, 23 Jan 2018 03:15:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516706155; cv=none;
        d=google.com; s=arc-20160816;
        b=YauaQN84mp1xXfesh3jRTzvg3a27+7MCKk54uFWK9LTopnY1n6GcWTpK7K62LplF0E
         8mv28cAmub0PQGNl1Vf+VOGsOKQfeGNz7FV1P8Og2EfZ1ZdV13FhMnGz/xM3xhIvlYNV
         NOX/Qp94QtQpL0wIp/8MYM+8xLbkH6xOB1hXOwQyJj23iJCTDlUeg3JcrSbo833DEK97
         Nu3do1uuh42gJOlHFB0a7CbaP6BOteQH0JE6zLX25n/T42NoE7qXvFIJk1bgpxQpz+ji
         XpdtKxfF9zLPPOnxBXydD+bny0edgkjCik0rSg051UT1jRh4dZAbzEs6S+s0QDBaCXsI
         i5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=/S9sLLx4mjtFTDrCl4lNNay7GuG1+5Tx5q3LoBgppQc=;
        b=oz0+3GkZtofG8s5PsBO23QUXiAtXToFFjZ25j1pPUYkcZd6x17fGtfLHwoy/rvhVFF
         DJfHVZ4JnBL9UaiXFF1qk8FqgZMrgBgPZ2fuUaTdtUoY7FgRV0ePLJWOwTI5dFwViFyC
         b3Ob6e8yVBpleFx3+PetGWRwLY0rMPZaqZzq9NM6R42L4nQS/Zt+sgaPDKbETp8QqgRs
         Npy6zOiGD/y8V7U+vtcUt39W6IJc4wr5zHwNPMabwWdHp8yEybABpIV4c6e5K4/a2x4r
         CF12WHb2QtAwAt0kXUJzoknOl4EzJLVSXYjSVMnl/5FRqoulKCnbBA9qedbLYxyv0ZjZ
         d3HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=XRkfUfoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v134si4139557ywe.101.2018.01.23.03.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 03:15:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=XRkfUfoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edwYU-0004bg-Rs
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 06:15:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1edwYE-0004ZT-EJ
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 06:15:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1edwY7-0005X8-3G
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 06:15:38 -0500
Received: from ozlabs.org ([103.22.144.67]:42245)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1edwY6-0005WI-C0; Tue, 23 Jan 2018 06:15:31 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3zQm1W34xCz9s4s; Tue, 23 Jan 2018 22:15:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1516706127;
	bh=rt1jzkIg5xUy44/jCwnnrAno9oG+iOTiVEOb6xOvpiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRkfUfoQUg7TBdRzrkNVlPwzFdaWk9uovIYmkrVPMiVlVlPhojMZvjOxLuNvocfOt
	YCDrUiHC1KywyGUdcKj1a0TAsNm+YNqJequo5f5ocG34yFHZFZjtwItuaCwQtwj3hr
	aghOSsN9NyH71GX90YaP1dHFhMAhYVZAkz16blfw=
Date: Tue, 23 Jan 2018 22:15:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180123111520.GH11419@umbus>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<1516694904-64879-25-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1XWsVB21DFCvn2e8"
Content-Disposition: inline
In-Reply-To: <1516694904-64879-25-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v3 24/25] cpu: get rid of unused cpu_init()
 defines
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I3XLOs/1XQUQ


--1XWsVB21DFCvn2e8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2018 at 09:08:23AM +0100, Igor Mammedov wrote:
> cpu_init(cpu_model) were replaced by cpu_create(cpu_type) so
> no users are left, remove it.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

ppc parts

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> CC: Richard Henderson <rth@twiddle.net> (maintainer:Alpha)
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> CC: Eduardo Habkost <ehabkost@redhat.com>
> CC: Michael Walle <michael@walle.cc>
> CC: Laurent Vivier <laurent@vivier.eu>
> CC: Aurelien Jarno <aurelien@aurel32.net>
> CC: Yongbok Kim <yongbok.kim@mips.com>
> CC: Anthony Green <green@moxielogic.com>
> CC: Chris Wulff <crwulff@gmail.com>
> CC: Marek Vasut <marex@denx.de>
> CC: Stafford Horne <shorne@gmail.com>
> CC: David Gibson <david@gibson.dropbear.id.au>
> CC: Alexander Graf <agraf@suse.de>
> CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> CC: Artyom Tarasenko <atar4qemu@gmail.com>
> CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> CC: Guan Xuetao <gxt@mprc.pku.edu.cn>
> CC: Max Filippov <jcmvbkbc@gmail.com>
> CC: qemu-arm@nongnu.org
> CC: qemu-ppc@nongnu.org
> CC: qemu-s390x@nongnu.org
> ---
>  target/alpha/cpu.h      | 2 --
>  target/arm/cpu.h        | 2 --
>  target/cris/cpu.h       | 2 --
>  target/hppa/cpu.h       | 1 -
>  target/i386/cpu.h       | 2 --
>  target/lm32/cpu.h       | 2 --
>  target/m68k/cpu.h       | 2 --
>  target/microblaze/cpu.h | 1 -
>  target/mips/cpu.h       | 2 --
>  target/moxie/cpu.h      | 2 --
>  target/nios2/cpu.h      | 1 -
>  target/openrisc/cpu.h   | 2 --
>  target/ppc/cpu.h        | 2 --
>  target/s390x/cpu.h      | 2 --
>  target/sh4/cpu.h        | 2 --
>  target/sparc/cpu.h      | 4 ----
>  target/tilegx/cpu.h     | 1 -
>  target/tricore/cpu.h    | 2 --
>  target/unicore32/cpu.h  | 2 --
>  target/xtensa/cpu.h     | 2 --
>  20 files changed, 38 deletions(-)
>=20
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 21ed5d6..b3bec21 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -468,8 +468,6 @@ enum {
> =20
>  void alpha_translate_init(void);
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_ALPHA_CPU, cpu_model)
> -
>  #define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
>  #define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index f9fb141..b37d266 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2167,8 +2167,6 @@ static inline bool arm_excp_unmasked(CPUState *cs, =
unsigned int excp_idx,
>      return unmasked || pstate_unmasked;
>  }
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_ARM_CPU, cpu_model)
> -
>  #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
>  #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
>  #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
> diff --git a/target/cris/cpu.h b/target/cris/cpu.h
> index 1a27653..db80cb1 100644
> --- a/target/cris/cpu.h
> +++ b/target/cris/cpu.h
> @@ -267,8 +267,6 @@ enum {
>  #define TARGET_PHYS_ADDR_SPACE_BITS 32
>  #define TARGET_VIRT_ADDR_SPACE_BITS 32
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_CRIS_CPU, cpu_model)
> -
>  #define CRIS_CPU_TYPE_SUFFIX "-" TYPE_CRIS_CPU
>  #define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)
>  #define CPU_RESOLVING_TYPE TYPE_CRIS_CPU
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index b92ae3f..628d7de 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -112,7 +112,6 @@ static inline int cpu_mmu_index(CPUHPPAState *env, bo=
ol ifetch)
> =20
>  void hppa_translate_init(void);
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_HPPA_CPU, cpu_model)
>  #define CPU_RESOLVING_TYPE TYPE_HPPA_CPU
> =20
>  void hppa_cpu_list(FILE *f, fprintf_function cpu_fprintf);
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 82c7381..1ed60b0 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1564,8 +1564,6 @@ uint64_t cpu_get_tsc(CPUX86State *env);
> =20
>  #define PHYS_ADDR_MASK MAKE_64BIT_MASK(0, TCG_PHYS_ADDR_BITS)
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_X86_CPU, cpu_model)
> -
>  #define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
>  #define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
>  #define CPU_RESOLVING_TYPE TYPE_X86_CPU
> diff --git a/target/lm32/cpu.h b/target/lm32/cpu.h
> index 0656052..53939e5 100644
> --- a/target/lm32/cpu.h
> +++ b/target/lm32/cpu.h
> @@ -255,8 +255,6 @@ void lm32_watchpoint_insert(CPULM32State *env, int in=
dex, target_ulong address,
>  void lm32_watchpoint_remove(CPULM32State *env, int index);
>  bool lm32_cpu_do_semihosting(CPUState *cs);
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_LM32_CPU, cpu_model)
> -
>  #define LM32_CPU_TYPE_SUFFIX "-" TYPE_LM32_CPU
>  #define LM32_CPU_TYPE_NAME(model) model LM32_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_LM32_CPU
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 8a4299a..7d64804 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -401,8 +401,6 @@ void register_m68k_insns (CPUM68KState *env);
>  #define TARGET_PHYS_ADDR_SPACE_BITS 32
>  #define TARGET_VIRT_ADDR_SPACE_BITS 32
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_M68K_CPU, cpu_model)
> -
>  #define M68K_CPU_TYPE_SUFFIX "-" TYPE_M68K_CPU
>  #define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_M68K_CPU
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index 492f9f7..a0ea421 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -343,7 +343,6 @@ int cpu_mb_signal_handler(int host_signum, void *pinf=
o,
>  #define TARGET_PHYS_ADDR_SPACE_BITS 32
>  #define TARGET_VIRT_ADDR_SPACE_BITS 32
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_MICROBLAZE_CPU, cpu_mo=
del)
>  #define CPU_RESOLVING_TYPE TYPE_MICROBLAZE_CPU
> =20
>  #define cpu_signal_handler cpu_mb_signal_handler
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index 0fcbfb3..cfe1735 100644
> --- a/target/mips/cpu.h
> +++ b/target/mips/cpu.h
> @@ -739,8 +739,6 @@ enum {
> =20
>  int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_MIPS_CPU, cpu_model)
> -
>  #define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
>  #define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_MIPS_CPU
> diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
> index 3f94a5a..5f8d10b 100644
> --- a/target/moxie/cpu.h
> +++ b/target/moxie/cpu.h
> @@ -120,8 +120,6 @@ void moxie_translate_init(void);
>  int cpu_moxie_signal_handler(int host_signum, void *pinfo,
>                               void *puc);
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_MOXIE_CPU, cpu_model)
> -
>  #define MOXIE_CPU_TYPE_SUFFIX "-" TYPE_MOXIE_CPU
>  #define MOXIE_CPU_TYPE_NAME(model) model MOXIE_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_MOXIE_CPU
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 2234bff..8897e9a 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -231,7 +231,6 @@ void nios2_check_interrupts(CPUNios2State *env);
>  # define TARGET_VIRT_ADDR_SPACE_BITS 32
>  #endif
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_NIOS2_CPU, cpu_model)
>  #define CPU_RESOLVING_TYPE TYPE_NIOS2_CPU
> =20
>  #define cpu_gen_code cpu_nios2_gen_code
> diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
> index 9b32ea4..6f843fa 100644
> --- a/target/openrisc/cpu.h
> +++ b/target/openrisc/cpu.h
> @@ -390,8 +390,6 @@ int cpu_openrisc_get_phys_data(OpenRISCCPU *cpu,
>                                 int *prot, target_ulong address, int rw);
>  #endif
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_OPENRISC_CPU, cpu_mode=
l)
> -
>  #define OPENRISC_CPU_TYPE_SUFFIX "-" TYPE_OPENRISC_CPU
>  #define OPENRISC_CPU_TYPE_NAME(model) model OPENRISC_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_OPENRISC_CPU
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index d5f2f3d..32c51fb 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1376,8 +1376,6 @@ static inline uint64_t ppc_dump_gpr(CPUPPCState *en=
v, int gprn)
>  int ppc_dcr_read (ppc_dcr_t *dcr_env, int dcrn, uint32_t *valp);
>  int ppc_dcr_write (ppc_dcr_t *dcr_env, int dcrn, uint32_t val);
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_POWERPC_CPU, cpu_model)
> -
>  #define POWERPC_CPU_TYPE_SUFFIX "-" TYPE_POWERPC_CPU
>  #define POWERPC_CPU_TYPE_NAME(model) model POWERPC_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index b2121cb..b3bfcf5 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -727,8 +727,6 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t g=
en, uint8_t ec_ga,
> =20
> =20
>  /* helper.c */
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_S390_CPU, cpu_model)
> -
>  #define S390_CPU_TYPE_SUFFIX "-" TYPE_S390_CPU
>  #define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)
>  #define CPU_RESOLVING_TYPE TYPE_S390_CPU
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index 709e0ca..c6418ef 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -274,8 +274,6 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong=
 addr);
> =20
>  void cpu_load_tlb(CPUSH4State * env);
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_SUPERH_CPU, cpu_model)
> -
>  #define SUPERH_CPU_TYPE_SUFFIX "-" TYPE_SUPERH_CPU
>  #define SUPERH_CPU_TYPE_NAME(model) model SUPERH_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_SUPERH_CPU
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index 345b39a..28f254d 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -654,10 +654,6 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env,=
 target_ulong addr,
>  #endif
>  int cpu_sparc_signal_handler(int host_signum, void *pinfo, void *puc);
> =20
> -#ifndef NO_CPU_IO_DEFS
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_SPARC_CPU, cpu_model)
> -#endif
> -
>  #define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
>  #define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_SPARC_CPU
> diff --git a/target/tilegx/cpu.h b/target/tilegx/cpu.h
> index a73215e..238f8d3 100644
> --- a/target/tilegx/cpu.h
> +++ b/target/tilegx/cpu.h
> @@ -164,7 +164,6 @@ static inline TileGXCPU *tilegx_env_get_cpu(CPUTLGSta=
te *env)
>  void tilegx_tcg_init(void);
>  int cpu_tilegx_signal_handler(int host_signum, void *pinfo, void *puc);
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_TILEGX_CPU, cpu_model)
>  #define CPU_RESOLVING_TYPE TYPE_TILEGX_CPU
> =20
>  #define cpu_signal_handler cpu_tilegx_signal_handler
> diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
> index a2ef632..13d629d 100644
> --- a/target/tricore/cpu.h
> +++ b/target/tricore/cpu.h
> @@ -411,8 +411,6 @@ static inline void cpu_get_tb_cpu_state(CPUTriCoreSta=
te *env, target_ulong *pc,
>      *flags =3D 0;
>  }
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_TRICORE_CPU, cpu_model)
> -
>  #define TRICORE_CPU_TYPE_SUFFIX "-" TYPE_TRICORE_CPU
>  #define TRICORE_CPU_TYPE_NAME(model) model TRICORE_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_TRICORE_CPU
> diff --git a/target/unicore32/cpu.h b/target/unicore32/cpu.h
> index 9644b07..5ff8b98 100644
> --- a/target/unicore32/cpu.h
> +++ b/target/unicore32/cpu.h
> @@ -165,8 +165,6 @@ static inline int cpu_mmu_index(CPUUniCore32State *en=
v, bool ifetch)
> =20
>  #include "exec/cpu-all.h"
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_UNICORE32_CPU, cpu_mod=
el)
> -
>  #define UNICORE32_CPU_TYPE_SUFFIX "-" TYPE_UNICORE32_CPU
>  #define UNICORE32_CPU_TYPE_NAME(model) model UNICORE32_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_UNICORE32_CPU
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index 23dbd45..6481c3b 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -509,8 +509,6 @@ void xtensa_cpu_do_unaligned_access(CPUState *cpu, va=
ddr addr,
>  #endif
>  #define XTENSA_DEFAULT_CPU_TYPE XTENSA_CPU_TYPE_NAME(XTENSA_DEFAULT_CPU_=
MODEL)
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_XTENSA_CPU, cpu_model)
> -
>  void xtensa_translate_init(void);
>  void xtensa_breakpoint_handler(CPUState *cs);
>  void xtensa_finalize_config(XtensaConfig *config);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1XWsVB21DFCvn2e8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpnGUgACgkQbDjKyiDZ
s5JhUhAAw3ZTvAKl3kmig2D6E8U66100VNZVhjHUDGP7QFiFKiglVei4dZoZ+gfw
ttzhhjeqPZgpH4tGq3dgHajRRCUQfRtFyU8giS9lPUFymaAVxf/2WMoJkpOYVl2P
eRRkwIbTbfasyBAMXh3pLuqpMNNfrjbbvoOXRlaQStJeRQsg/GpoagbEV+y6GgRa
pE6x1HfwXnbjqeijVOLzasY4YXV0EktHAHOgVG8nP21iFRw8zZvB4PLMCLxUafbG
s7sI+uMF5fzGJ00EYpYsDzy0JA22jVDVGOp5dD1RFesSDnooKQiProhHxdNiEa3o
EpxftS0rdiYaVFY6yHa+iZkxlwofpUlHFqdvqtNnhbmKwuPll9WFqIFdcXilV4zz
dfBoHZ/wlVpHocK2/MmHs11GIHqhQHF4AOt3PlcGCnpdK8AlaW/qG2f5iFLXE3Pk
jLdBAT7wmuj5eB5cu51lqFlpeoPe3Y8XUjsse3q/uuLA9oPN0c95CL4jmv9gQ/ZB
p+UVuczKk/Jc0yrxC7kDHacsbRIQD4g13/Y+sBGjzKP+5qWscNhrHJ2pGiH5vH+D
c5ehXAasn26qDEjI5yY4E7OiBYdytxbs4KHQ0Fcr5lkOnZl++KjlPh9PyF1gXYOg
AINxR5zGWP/3AuA8nmy8ZNCOk4Eg5araaoFdJWMNQOX55WnLRhM=
=kmMh
-----END PGP SIGNATURE-----

--1XWsVB21DFCvn2e8--
