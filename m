Received: by 10.28.173.206 with SMTP id w197csp5904609wme;
        Wed, 17 Jan 2018 16:29:27 -0800 (PST)
X-Google-Smtp-Source: ACJfBotHfcwMuTgBHzaiRObyDq3M85j87cljmYkFbxJsGd09NDcVkbajMYsiA+wsT6glxRTplhwu
X-Received: by 10.37.115.11 with SMTP id o11mr25336195ybc.178.1516235367838;
        Wed, 17 Jan 2018 16:29:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516235367; cv=none;
        d=google.com; s=arc-20160816;
        b=idIpQGdpNKbmAVdUROdKkIi6fNPlw2v/THX2f89IqqAaYJp9XZcIu5/q1va7VFp24P
         b1js4pzH9QEgrAXER1tBxv/MTkVDfqPNUNSG95aqsKRznzoDfwxvsP/KSH/WDwojWxpP
         9Kt6zrEYrs5QupEuQmvcUe9iW0SmZWit5VmQv9a8JN1sDOJG+lKJmvkxGgy6q8JQdqDX
         RwNIARzkgdN8rbGVHbjdi07cvsaKvqXejUDPTWbkyPsoVGS9xqPpb1nmpv934V2OJ2tT
         wz+lF8m7x1hTllnSWVrGzYJod6ACipzZZEPK6+lOsEh1jMJ4GO3npPr9w5Humdz7zJgd
         eeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=/X3bhUpRPCgPx6NoEJ7MbLHhtHRRJhTbInU/NJp/iLI=;
        b=PZ+Q2WXcFo00kWjpxv06HQNaxe9XMp1y+vvgLyjPK+jVNwOsiHw2e493gg7W0YfTIn
         moT0kyk9etqbz3OS+dfrCoBnItLTOufGEejp0SEeioqnUtqXTQ0rzlUUtKJKsDbE6FTb
         wS4xd6Yy6nZ2hw9npshgCpL1xIgsQcPFmGz13carRIIjMmmd3uyQ+eidpVU7/E9lBL25
         CeUibDyR2hfle15lGUiNv0a8DexhWZ3cT101ADyoMD/MUEt9j4YZqqZvTX/+ga5qd+EZ
         qNqRbtnP8+/65iFYgTVizmrUG4qD5qBH9XGouINnIBEXXY8nB1UNq9lxB75C4O2i6lSg
         BPuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=NBp5nmF1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w196si1399963ybe.444.2018.01.17.16.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 16:29:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=NBp5nmF1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eby59-00022I-8I
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 19:29:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eby4x-000220-1u
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 19:29:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eby4u-0006VJ-Qk
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 19:29:15 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:37147)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1eby4s-0006OG-JT; Wed, 17 Jan 2018 19:29:12 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3zMPvz71bTz9t2l; Thu, 18 Jan 2018 11:29:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1516235344;
	bh=Ei+kRIbg3HlqanaMzQSscqhz4Syf5fSIttg0nxqnf9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBp5nmF1TDfDpuRXY8u56wucoEvCDmWKTKgImm1KHmRtHHVnWsMAL/AxBoVlSjU1q
	awKR34udmGVO4amuaeX0sVTnOFKN3pt8ZrNyIBdBk7k6jsC+s/YAuT2mwZqueIy64N
	CVpjJjeoJia8i8Qi/7OCqhw+eG/MbOf5G2dMrVBE=
Date: Thu, 18 Jan 2018 11:28:59 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180118002859.GA30352@umbus.fritz.box>
References: <1516203816-19374-1-git-send-email-imammedo@redhat.com>
	<1516203816-19374-23-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lYjFa3qL1bvncypl"
Content-Disposition: inline
In-Reply-To: <1516203816-19374-23-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH 22/24] cpu: get rid of unused cpu_init()
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
X-TUID: /YlHai7ujZPA


--lYjFa3qL1bvncypl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2018 at 04:43:34PM +0100, Igor Mammedov wrote:
> cpu_init(cpu_model) were replaced by cpu_create(cpu_type) so
> no users are left, remove it.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

ppc part

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
> index c8dd560..1a1d9a0 100644
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
>  #define TARGET_DEFAULT_CPU_TYPE ALPHA_CPU_TYPE_NAME("ev67")
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index c87bb76..3c1e1aa 100644
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
>  #define TARGET_DEFAULT_CPU_TYPE ARM_CPU_TYPE_NAME("any")
> diff --git a/target/cris/cpu.h b/target/cris/cpu.h
> index 8feabb4..9845d89 100644
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
>  #define TARGET_DEFAULT_CPU_TYPE CRIS_CPU_TYPE_NAME("crisv32")
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 04625f7..7a6074e 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -112,7 +112,6 @@ static inline int cpu_mmu_index(CPUHPPAState *env, bo=
ol ifetch)
> =20
>  void hppa_translate_init(void);
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_HPPA_CPU, cpu_model)
>  #define TARGET_DEFAULT_CPU_TYPE TYPE_HPPA_CPU
> =20
>  void hppa_cpu_list(FILE *f, fprintf_function cpu_fprintf);
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index f64e5ed..0b4563b 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1557,8 +1557,6 @@ uint64_t cpu_get_tsc(CPUX86State *env);
> =20
>  #define PHYS_ADDR_MASK MAKE_64BIT_MASK(0, TCG_PHYS_ADDR_BITS)
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_X86_CPU, cpu_model)
> -
>  #define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
>  #define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
> =20
> diff --git a/target/lm32/cpu.h b/target/lm32/cpu.h
> index 65f58f5..ec9efa7 100644
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
>  #define TARGET_DEFAULT_CPU_TYPE LM32_CPU_TYPE_NAME("lm32-basic")
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 193e8f8..da4171c 100644
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
>  #define TARGET_DEFAULT_CPU_TYPE M68K_CPU_TYPE_NAME("any")
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index f244efa..3ad1016 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -343,7 +343,6 @@ int cpu_mb_signal_handler(int host_signum, void *pinf=
o,
>  #define TARGET_PHYS_ADDR_SPACE_BITS 32
>  #define TARGET_VIRT_ADDR_SPACE_BITS 32
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_MICROBLAZE_CPU, cpu_mo=
del)
>  #define TARGET_DEFAULT_CPU_TYPE TYPE_MICROBLAZE_CPU
> =20
>  #define cpu_signal_handler cpu_mb_signal_handler
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index c5ee894..7c66ec0 100644
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
> =20
> diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
> index 9fabb93..a3a1bba 100644
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
>  #define TARGET_DEFAULT_CPU_TYPE MOXIE_CPU_TYPE_NAME("any")
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 2d03958..71a48b1 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -231,7 +231,6 @@ void nios2_check_interrupts(CPUNios2State *env);
>  # define TARGET_VIRT_ADDR_SPACE_BITS 32
>  #endif
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_NIOS2_CPU, cpu_model)
>  #define TARGET_DEFAULT_CPU_TYPE TYPE_NIOS2_CPU
> =20
>  #define cpu_gen_code cpu_nios2_gen_code
> diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
> index 8d1a87e..f2d2abb 100644
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
>  #define TARGET_DEFAULT_CPU_TYPE OPENRISC_CPU_TYPE_NAME("or1200")
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 4af4aff..3dc0359 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1372,8 +1372,6 @@ static inline uint64_t ppc_dump_gpr(CPUPPCState *en=
v, int gprn)
>  int ppc_dcr_read (ppc_dcr_t *dcr_env, int dcrn, uint32_t *valp);
>  int ppc_dcr_write (ppc_dcr_t *dcr_env, int dcrn, uint32_t val);
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_POWERPC_CPU, cpu_model)
> -
>  #define POWERPC_CPU_TYPE_SUFFIX "-" TYPE_POWERPC_CPU
>  #define POWERPC_CPU_TYPE_NAME(model) model POWERPC_CPU_TYPE_SUFFIX
> =20
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 174624a..3e647df 100644
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
>  #define TARGET_DEFAULT_CPU_TYPE S390_CPU_TYPE_NAME("qemu")
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index 203d212..ad58e24 100644
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
>  #define TARGET_DEFAULT_CPU_TYPE SUPERH_CPU_TYPE_NAME("sh7785")
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index 02c55ad..54b3dc7 100644
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
> =20
> diff --git a/target/tilegx/cpu.h b/target/tilegx/cpu.h
> index 67de53e..6c89b05 100644
> --- a/target/tilegx/cpu.h
> +++ b/target/tilegx/cpu.h
> @@ -164,7 +164,6 @@ static inline TileGXCPU *tilegx_env_get_cpu(CPUTLGSta=
te *env)
>  void tilegx_tcg_init(void);
>  int cpu_tilegx_signal_handler(int host_signum, void *pinfo, void *puc);
> =20
> -#define cpu_init(cpu_model) cpu_generic_init(TYPE_TILEGX_CPU, cpu_model)
>  #define TARGET_DEFAULT_CPU_TYPE TYPE_TILEGX_CPU
> =20
>  #define cpu_signal_handler cpu_tilegx_signal_handler
> diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
> index 835d51a..8ed17e0 100644
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
>  #define TARGET_DEFAULT_CPU_TYPE TRICORE_CPU_TYPE_NAME("tc1796")
> diff --git a/target/unicore32/cpu.h b/target/unicore32/cpu.h
> index fd3fa81..91b673a 100644
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
>  #define TARGET_DEFAULT_CPU_TYPE UNICORE32_CPU_TYPE_NAME("any")
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index 537e151..c21acf9 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -508,8 +508,6 @@ void xtensa_cpu_do_unaligned_access(CPUState *cpu, va=
ddr addr,
>  #endif
>  #define TARGET_DEFAULT_CPU_TYPE XTENSA_CPU_TYPE_NAME(XTENSA_DEFAULT_CPU_=
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

--lYjFa3qL1bvncypl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpf6kgACgkQbDjKyiDZ
s5IPBBAArvszWgVC6U/PvklkccYOaid0gQRvsst6/gjL5PHfczV5QaI40B3YRVV7
OPJQHJrdlt2JGuizbDFs60VEVGYU9fXt41hOSfOFnF5FlmTBuvSnFWwFn/alFLOo
3AOnih6NH7hOPBc061NJDlGyDrSaUTRU7xAUQ51HdR8wLRsjgT0RlJhuSieiCTQd
X4v2r0HR73md08suVQngfwl8Z92a4e0juWly0DJP76e8398deisz9l9m05hOWIpm
4AWPFhzERyqc1u0nXMYdAEHRtojAV3aA8Lu6wq2OWdsEie5QTw4fCg/ZAK1owEfD
pbFdc+TGoGDPnuDciAybKx7VHsg1Fpvg2rPm9TeYYclUrIcJMABvFy0MGpK8dJK7
6z5viEmdowam7Rh2g4xUkR+XLHELS5Z5UbnroagvcVSmS0is7UtNVk9sz/wlH/2Q
rd7Cv7/PptgeHx50YWymVLgMcoVAQAM+iUv7Xinkd4sSTbZPd1XRWo7t1fEZYMml
2G0G7KHHCnx+PZgzDGnQtkGACRMB7lXjmp0Qxi9P5fAfTDQ++9CYCC/7m6tTvS7E
UKnIMyFc5+Fm+cnhlYMxcM2AnQOLb2DdbQ7ZF4n7jGhaYch7UsZM6dtxgau8gVzK
sDkUptvX6ne0jvPne+Pcu/B7ZKqZhZ547UXIETH+l4/mqr8P1q4=
=er3+
-----END PGP SIGNATURE-----

--lYjFa3qL1bvncypl--
