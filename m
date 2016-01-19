Received: by 10.25.159.19 with SMTP id i19csp2630529lfe;
        Tue, 19 Jan 2016 09:39:24 -0800 (PST)
X-Received: by 10.140.100.141 with SMTP id s13mr38450848qge.25.1453225164532;
        Tue, 19 Jan 2016 09:39:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j9si38436896qhj.65.2016.01.19.09.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 09:39:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLaFY-0004uj-1s
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 12:39:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaFV-0004uY-OC
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:39:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaFU-0000sQ-FA
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:39:21 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:36471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLaFU-0000s8-9p
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:39:20 -0500
Received: by mail-vk0-x231.google.com with SMTP id n1so197905489vkb.3
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 09:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vL39pvB4oJOlMKRAWC26U15UaBMn9eBRsN4FIIeZtik=;
	b=BLW8A3Q0TdBIfIpciHt7ecbpVPkGrW9Q4tOrW2HjceV/7YaCBA8WlD0blxHA83hZm9
	UiiuWVlgTLAI1XBIi6wK4tq57PH1AJjWTj0NEtWfWi2iKxKRhFHYQMEUj9j75ECVl0lq
	dqLvyh/7o66OFWOLF4zM9zGteU7kvJeJZISj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vL39pvB4oJOlMKRAWC26U15UaBMn9eBRsN4FIIeZtik=;
	b=H9SRIDyOtKWVQaTlN8moNVlzo/zssUbmNIgK51p+cCdzCI0riNZqghlFCmv3XrxKPa
	6f65ViBUhcx6aqDtQo5gJ5QIN5Jry1s0+D77qELqcL9g+W6xqW9/j7mYMjlQw0cWKIlY
	xMWoEDnpen1VPaRKaBjXrpZnsBqFWOn9yoOr89RpOzbfYDIOz4BnnExJMOsc4ZRfiCeC
	9PQBRSAfo7cHEvxfVTAqp51hDtbw9K2FWd17iMYv2G0q8B6vEAPu4o5hlRp1Ul8iln+S
	cU5oSXdXyEmnwv3ffdg8hnA7vYwOqRnr1DsrYIYSc0vx4+skLaCpWT4mJiX9iTEDnLVP
	lWvA==
X-Gm-Message-State: ALoCoQlP8p706NIL3Hv9t3WkoHRAkCwFtfdpQ8096AmyDzBQNPaE/GPPM/7G3c+iw9cudmfCT/URm2mLPhnAmBEjVObodyAU+KaSYfh0BLKyKcosne+vuXM=
X-Received: by 10.31.141.2 with SMTP id p2mr21380648vkd.37.1453225159849; Tue,
	19 Jan 2016 09:39:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 09:39:00 -0800 (PST)
In-Reply-To: <922c7336b12809a8646aeabd6e32972680c5549f.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<922c7336b12809a8646aeabd6e32972680c5549f.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 17:39:00 +0000
Message-ID: <CAFEAcA_gSYCbF85jmzqQVuU5FYsFnnZDZbFmnnMyo=S-EtiEUQ@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 14/17] target-arm: implement BE32 mode in
	system emulation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qvDSk7n1WtH/

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> System emulation only has a little-endian target; BE32 mode
> is implemented by adjusting the low bits of the address
> for every byte and halfword load and store.  64-bit accesses
> flip the low and high words.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> [PC changes:
>   * rebased against master (Jan 2016)
> ]
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
>
>  target-arm/cpu.h       |  5 ++-
>  target-arm/translate.c | 86 +++++++++++++++++++++++++++++++++++++++++---------
>  2 files changed, 73 insertions(+), 18 deletions(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 96b1e99..5814019 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1925,9 +1925,8 @@ static inline bool bswap_code(bool sctlr_b)
>  #endif
>          sctlr_b;
>  #else
> -    /* We do not implement BE32 mode for system-mode emulation, but
> -     * anyway it would always do little-endian accesses with
> -     * TARGET_WORDS_BIGENDIAN = 0.
> +    /* All code access in ARM is little endian, and there are no loaders
> +     * doing swaps that need to be reversed
>       */
>      return 0;
>  #endif
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 44c3ac9..2d80bb2 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -914,6 +914,12 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
>      }
>  }
>
> +#ifdef CONFIG_USER_ONLY
> +#define IS_USER_ONLY 1
> +#else
> +#define IS_USER_ONLY 0
> +#endif
> +
>  /* Abstractions of "generate code to do a guest load/store for
>   * AArch32", where a vaddr is always 32 bits (and is zero
>   * extended if we're a 64 bit core) and  data is also
> @@ -923,19 +929,35 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
>   */
>  #if TARGET_LONG_BITS == 32
>
> -#define DO_GEN_LD(SUFF, OPC)                                             \
> +#define DO_GEN_LD(SUFF, OPC, BE32_XOR)                                   \
>  static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
>                                       TCGv_i32 addr, int index)           \
>  {                                                                        \
>      TCGMemOp opc = (OPC) | s->mo_endianness;                             \
> +    /* Not needed for user-mode BE32, where we use MO_BE instead.  */    \
> +    if (!IS_USER_ONLY && s->sctlr_b && BE32_XOR) {                       \
> +        TCGv addr_be = tcg_temp_new();                                   \
> +        tcg_gen_xori_i32(addr_be, addr, BE32_XOR);                       \
> +        tcg_gen_qemu_ld_i32(val, addr_be, index, opc);                   \
> +        tcg_temp_free(addr_be);                                          \
> +        return;                                                          \
> +    }                                                                    \
>      tcg_gen_qemu_ld_i32(val, addr, index, opc);                          \
>  }
>
> -#define DO_GEN_ST(SUFF, OPC)                                             \
> +#define DO_GEN_ST(SUFF, OPC, BE32_XOR)                                   \
>  static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
>                                       TCGv_i32 addr, int index)           \
>  {                                                                        \
>      TCGMemOp opc = (OPC) | s->mo_endianness;                             \
> +    /* Not needed for user-mode BE32, where we use MO_BE instead.  */    \
> +    if (!IS_USER_ONLY && s->sctlr_b && BE32_XOR) {                       \
> +        TCGv addr_be = tcg_temp_new();                                   \
> +        tcg_gen_xori_i32(addr_be, addr, BE32_XOR);                       \
> +        tcg_gen_qemu_ld_i32(val, addr_be, index, opc);                   \

Cut-n-paste error -- this should be a store...

> +        tcg_temp_free(addr_be);                                          \
> +        return;                                                          \
> +    }                                                                    \
>      tcg_gen_qemu_st_i32(val, addr, index, opc);                          \
>  }
>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
