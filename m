Received: by 10.28.71.27 with SMTP id u27csp469224wma;
        Fri, 23 Feb 2018 03:23:33 -0800 (PST)
X-Google-Smtp-Source: AG47ELswCIW/kvxdXNjb29n9DxINvd/ip674GYZDyZRnSEg8Ra6GBEm8JH6iu6KF1lSPT6xmLzFI
X-Received: by 2002:a25:3bc6:: with SMTP id i189-v6mr722905yba.420.1519385013465;
        Fri, 23 Feb 2018 03:23:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519385013; cv=none;
        d=google.com; s=arc-20160816;
        b=gll2egQlvLePg5ta6QNBnsr+GzD21R/0HUsdb36uvjB8ojvVZ6lZxkRgqqeefUoiUy
         n+Vn/KhawNwXTp6z8xpbpXsNcsc0fQfrxrologH2y+sKvMF9jdyjT+28POmZz6jNTYnx
         mKgU8/ZkqfekDIRonBjt6LDkfKZC+CIDCo9ZrzslMhcJYjfkStSrytY4X9IWTzJbRXs1
         3Ev4kdVqQprVcQQmQjJLLV93FtkzvPIOk0oDx3QIGSA9yP8ESE4Lon1OlwWLrDc+Wx13
         Kdjogpz8nhtngKyrYQqUfoPV6zqPGD51B7yHKUvC5F4XdVS2jezMBkA1ERpQiOwCMCii
         1xIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Lhqenxa9Feg4Qg/IZEAveDGby/nqqR09GU1fmxsutZM=;
        b=elWDRESN3PlfmvyjzS8aLT0+SMDNshYJlYW5v6MIQ+XAix76AUPJ36UyAo571g7Ug/
         gW3NT0F6wwNlCkIF2dVBhzwdTUOgFB7o/pa+goiYOSkp49Ani6nnyPPUTtTsyoDn0rMU
         Sy9LEUH7JLEmXBHsgsx/hBzH4U1mkVmo1/UVBagxbR+oKfRN8Bw1ync82cEIKebiirSe
         6G2CJBbWZhXn1zpmoRwJuUMDjf6VtR1IPYkfeIgL2ZejRfl0p34VcFjjog/ndhjQMUHn
         yMlXVwKS5IrkwiQ6v6PqeLqPY8ZpHnGBpRXfyf7JsqicfMSkY80t2WJbWCyIk86uhduQ
         vobg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SwCMgZzM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d4-v6si51521ybe.554.2018.02.23.03.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 03:23:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SwCMgZzM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epBRs-0000Wc-SB
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 06:23:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epBRh-0000VT-Iz
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:23:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epBRg-0007rn-B2
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:23:21 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:33600)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epBRg-0007qq-25
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:23:20 -0500
Received: by mail-pl0-x244.google.com with SMTP id c11-v6so1317976plo.0
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 03:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lhqenxa9Feg4Qg/IZEAveDGby/nqqR09GU1fmxsutZM=;
	b=SwCMgZzMCgXroqo2hdbpqL4XAT9Crkri/w9a5chetN5nAxF5RiRUb3S0esaqQsW9FO
	9PZiDe35gRDdaBURdfXygfAvfaGNDIi+owsaRWwxJ6fIuxTo+Wchel282Tc+/LAfVgDL
	QLdzBk9sMatKENV+p6YgdNkW4hWlGYdp+XRY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lhqenxa9Feg4Qg/IZEAveDGby/nqqR09GU1fmxsutZM=;
	b=mpSbKrfuliyG6ZwYYTt6ca7DJ6dnoGupuxol+XC2KZufaNbKMk7z178OxabsXwvskE
	/T7zLOqPB1CfUDK5HsSxFnrkObdNGHCsE/R/ZeKEeaf7mL5ghJIrKNhWkerqoa5CHV4Z
	XPgcAhSu/gi5cg0hUjU0W3qhQZxL1hXpaRhYwDOp99Jxg6X5NMXAl180JjrV4uzpNyue
	UzDjukIaXHguZPwnSRrox4OzpW9oIvWqlfdKueef5fBRz1xbReUzYowX0tERZMCOnKwp
	4LVHgoc2pEIVT6L9pYp1bBK1A5H5TOHQKaR+zLZvyFBS6xMVXB5YCT/7fZyjJo1+dlUb
	rz8A==
X-Gm-Message-State: APf1xPDduDpcOiuJ5HX0xtPH6BosDyDpzi9cTIiw58POdLLvryHz4Qxv
	SVunKtaqLZCJUMa6KRb+a+kYXVsnu4fL/0AFdialPg==
X-Received: by 2002:a17:902:8b85:: with SMTP id
	ay5-v6mr1427482plb.329.1519384998995; 
	Fri, 23 Feb 2018 03:23:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 03:22:58 -0800 (PST)
In-Reply-To: <20180217182323.25885-9-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 11:22:58 +0000
Message-ID: <CAFEAcA-d6J8DLXiPqDPuMNt-MkjeG8Mu-LdTtFw7ma6TyrNaUg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-arm] [PATCH v2 08/67] target/arm: Implement SVE Predicate
 Misc Group
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
X-TUID: 8NxIPDCMeNFm

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |   3 +
>  target/arm/helper-sve.h    |   3 +
>  target/arm/sve_helper.c    |  86 +++++++++++++++++++++++-
>  target/arm/translate-sve.c | 163 ++++++++++++++++++++++++++++++++++++++++++++-
>  target/arm/sve.decode      |  41 ++++++++++++
>  5 files changed, 293 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8befe43a01..27f395183b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2915,4 +2915,7 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
>      return &env->vfp.zregs[regno].d[0];
>  }
>
> +/* Shared between translate-sve.c and sve_helper.c.  */
> +extern const uint64_t pred_esz_masks[4];
> +
>  #endif
> diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
> index 57adc4d912..0c04afff8c 100644
> --- a/target/arm/helper-sve.h
> +++ b/target/arm/helper-sve.h
> @@ -20,6 +20,9 @@
>  DEF_HELPER_FLAGS_2(sve_predtest1, TCG_CALL_NO_WG, i32, i64, i64)
>  DEF_HELPER_FLAGS_3(sve_predtest, TCG_CALL_NO_WG, i32, ptr, ptr, i32)
>
> +DEF_HELPER_FLAGS_3(sve_pfirst, TCG_CALL_NO_WG, i32, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_3(sve_pnext, TCG_CALL_NO_WG, i32, ptr, ptr, i32)
> +
>  DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index b63e7cc90e..cee7d9bcf6 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -39,7 +39,7 @@
>
>  static uint32_t iter_predtest_fwd(uint64_t d, uint64_t g, uint32_t flags)
>  {
> -    if (g) {
> +    if (likely(g)) {
>          /* Compute N from first D & G.
>             Use bit 2 to signal first G bit seen.  */
>          if (!(flags & 4)) {

Belongs in different patch ?

> @@ -114,3 +114,87 @@ LOGICAL_PPPP(sve_nand_pppp, DO_NAND)
>  #undef DO_NAND
>  #undef DO_SEL
>  #undef LOGICAL_PPPP
> +
> +/* Similar to the ARM LastActiveElement pseudocode function, except the
> +   result is multiplied by the element size.  This includes the not found
> +   indication; e.g. not found for esz=3 is -8.  */

Can we stick to the usual format for multiline comments, please?
(various examples here and elsewhere in the patchset). I know that
over the whole codebase we're a bit variable, but I think this is
the most common arrangement and it's definitely the one we use
in target/arm with perhaps the odd ancient comment as an exception.

/* line 1
 * line 2
 */


> +static void trans_PTRUE(DisasContext *s, arg_PTRUE *a, uint32_t insn)
> +{
> +    unsigned fullsz = vec_full_reg_size(s);
> +    unsigned ofs = pred_full_reg_offset(s, a->rd);
> +    unsigned numelem, setsz, i;
> +    uint64_t word, lastword;
> +    TCGv_i64 t;

A comment somewhere here about the way this code handles
the instructions that aren't PTRUE would be helpful I think
(specifically that a->pat is 32 for PFALSE and a->rd is
16 for SETFFR).

> +
> +    numelem = decode_pred_count(fullsz, a->pat, a->esz);
> +
> +    /* Determine what we must store into each bit, and how many.  */
> +    if (numelem == 0) {
> +        lastword = word = 0;
> +        setsz = fullsz;
> +    } else {
> +        setsz = numelem << a->esz;
> +        lastword = word = pred_esz_masks[a->esz];
> +        if (setsz % 64) {
> +            lastword &= ~(-1ull << (setsz % 64));
> +        }
> +    }
> +

>  ###########################################################################
>  # Named instruction formats.  These are generally used to
>  # reduce the amount of duplication between instruction patterns.
>
> +# Two operand with unused vector element size
> +@pd_pn_e0      ........ ........ ....... rn:4 . rd:4           &rr_esz esz=0
> +
> +# Two operand
> +@pd_pn         ........ esz:2 .. .... ....... rn:4 . rd:4      &rr_esz
> +
>  # Three operand with unused vector element size
>  @rd_rn_rm_e0   ........ ... rm:5 ... ... rn:5 rd:5             &rrr_esz esz=0
>
> @@ -77,6 +87,37 @@ NAND_pppp    00100101 1. 00 .... 01 .... 1 .... 1 ....       @pd_pg_pn_pm_s
>  # SVE predicate test
>  PTEST          00100101 01010000 11 pg:4 0 rn:4 00000
>
> +# SVE predicate initialize
> +PTRUE          00100101 esz:2 01100 s:1 111000 pat:5 0 rd:4    &ptrue
> +
> +# SVE initialize FFR (SETFFR)
> +PTRUE          00100101 0010 1100 1001 0000 0000 0000 \
> +               &ptrue rd=16 esz=0 pat=31 s=0

I found this very confusing at first, because the leftmost column
looks like it's the instruction name, and thus a copy-and-paste
error. I think it would be easier to read if we gave it a name
that indicates that it's dealing with a group of instructions
rather than only PTRUE.

> +
> +# SVE zero predicate register (PFALSE)
> +# Note that pat=32 is outside of the natural 0..31, and will
> +# always hit the default #uimm5 case of decode_pred_count.
> +PTRUE          00100101 0001 1000 1110 0100 0000 rd:4 \
> +               &ptrue esz=0 pat=32 s=0
> +
> +# SVE predicate read from FFR (predicated) (RDFFR)
> +ORR_pppp       00100101 0 s:1 0110001111000 pg:4 0 rd:4 \
> +               &rprr_s rn=16 rm=16
> +
> +# SVE predicate read from FFR (unpredicated) (RDFFR)
> +ORR_pppp       00100101 0001 1001 1111 0000 0000 rd:4 \
> +               &rprr_s rn=16 rm=16 pg=16 s=0
> +
> +# SVE FFR write from predicate (WRFFR)
> +ORR_pppp       00100101 0010 1000 1001 000 rn:4 00000 \
> +               &rprr_s rd=16 rm=%preg4_5 pg=%preg4_5 s=0

> +
> +# SVE predicate first active
> +PFIRST         00100101 01 011 000 11000 00 .... 0 ....        @pd_pn_e0
> +
> +# SVE predicate next active
> +PNEXT          00100101 .. 011 001 11000 10 .... 0 ....        @pd_pn
> +
>  ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
>
>  # SVE load predicate register
> --
> 2.14.3

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
