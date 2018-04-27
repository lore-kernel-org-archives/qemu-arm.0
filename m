Received: by 10.28.4.212 with SMTP id 203csp445949wme;
        Fri, 27 Apr 2018 00:25:09 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpoQNQPRmBFcvSkNSQO06SERL7W+R+nPLXnsE/22AFHRx/Mo6CBxoLwPFynzJ2KBIXhYpqt
X-Received: by 2002:ac8:34e7:: with SMTP id x36-v6mr557588qtb.416.1524813909325;
        Fri, 27 Apr 2018 00:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524813909; cv=none;
        d=google.com; s=arc-20160816;
        b=jkEYP8WD0/pXjnfkh5UJ02OU/q+IH4bwugnMIqHkYxS2MNFLkLVJzaccgxtN2jnZlG
         Lea4cD1si8IM2Jp2o9bLFOkUVYAQlEQoS+gpGZCTSQ6Is+twSNencJgxrqyBz24E7A0A
         PJmWmE1znO2HKoOESD5s69W6T2AXN8/kEU5BXGgqawMn1e/1KxrUH0RVagm1jtOLAemQ
         YGEFqY4aVVgG+2Cjb41UIUfZyMjsmrnKrOxMNvRFaRusRtG6PtH+b0yBXJLruAyHYAe+
         W9laHjKKt41NOOpIo6kmOJD9Tzp2K53c3bLfDi99kGbv7qBVmnpOcSPCb8K4Zb8mY9MC
         zHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RghBud1Mu2ZH0EcHB855VYllLM4HrzLGKuLOQxFlBto=;
        b=LZynlXNG2C377ORA3Lc+S7ICRJdXzOIk+qRGW6fmj9NYCIqL9XAq3raNQrNJThbYRG
         G8ims8+eLhNdBLXik8nBjt1cymYI8xmzPEalwQLsPLV62hwjIBRDTsYuWOIbr+45sS+6
         Vs2a2IdiC760dMGRt0t0hqOpVRt8GEgEXsePGhX+JvbFlxEKUQB4FWOi/mZUumVzAH5J
         otZ42q/46+S3QfbDw4NiC6iNkTZMAvCBVA7K9aPF+zTAMCq3hGC3ncEcAwpxEWzGnSnn
         n+UXJHQq4YczaYr6vsYTvTIcm/vFqWS5EkH9UmN62S112DktQSqAxxRpnha5xf/dhcw+
         5N1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@sifive.com header.s=google header.b=RspGgfMz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u37-v6si74936qtj.37.2018.04.27.00.25.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 00:25:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@sifive.com header.s=google header.b=RspGgfMz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBxki-00035l-Rp
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 03:25:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fBxkT-00034v-Bb
	for qemu-devel@nongnu.org; Fri, 27 Apr 2018 03:24:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fBxkR-0007UH-OW
	for qemu-devel@nongnu.org; Fri, 27 Apr 2018 03:24:53 -0400
Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229]:42670)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mjc@sifive.com>) id 1fBxkR-0007Tv-E8
	for qemu-devel@nongnu.org; Fri, 27 Apr 2018 03:24:51 -0400
Received: by mail-ot0-x229.google.com with SMTP id l13-v6so989834otk.9
	for <qemu-devel@nongnu.org>; Fri, 27 Apr 2018 00:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RD5yKWsJ9em7TdlZn7suPQhil2fSsoeqPSTz3TeICiw=;
	b=RspGgfMzHGkG3do2MHziYytY0AEXVL2OsRdkAZmH98967JQUJvR47FUVmatM0+tieU
	JkwsBHDrUWgoA1am48vUZUHXPHt4vg2byMUh3BNXACUrQ3nfm2zO2uzoTr5v1woG+gw4
	SLc5OQ1u0ZYgdYhidrpkLCM3ly9DOLdycaH4fg+WFTfH2+CnfBAyx7+R8p/0MkqWKLOc
	Y4suDoY/xGKH+OTwXJxpKg5UxPNYnjwtyi+Ku8xuOyU1hLntnI9DuUoKiyNgSg6Hi1S/
	2x7i6yNJ5gCxelGqoNVF0wCxoOzhjAcwA9hsmDNjFy/37++/M7PHPNAh17+9GIz5UC4k
	8rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RD5yKWsJ9em7TdlZn7suPQhil2fSsoeqPSTz3TeICiw=;
	b=hew6zt9Cmqb2MR9aWcPZ7F9RQq5YDt5I/CCzeuQ39TVFvdxXEGONZkvs58Csm83YL6
	D3s7BeRIncfJtJb+tEaLH7ByKVRZ6lYXHRCwo0gul5jCeAFL2LLi3L7B4w/9ZRZ9ybnO
	iVH0rgzsmLSrJxLtMVQpkKVuehjyWCtGFeWDkWYZVWTnbNtYVWYM+EizGAYLru6n6Lkw
	FQjuIctLNhSLaGJb1EgcY66K0CMcypyA9k4YWaimOJ3LYzcuKnIudiI5fy0urB3fcthr
	Dzjw/Jp0Wx2ZrrV3jaStgO3MWBIoSZG7KCptRTbz6jP/8eQn8XOuKboJZav5JIbbi1ER
	yXGg==
X-Gm-Message-State: ALQs6tCeiRUjzbjyiRSuBmo4gLbn7Fae4/4FfLPQqHirIVxgptxdy6MT
	KdQrsA+yNl4yKCM/4exFn2z7lFG0VF091gY2OmMiyA==
X-Received: by 2002:a9d:3844:: with SMTP id r4-v6mr671569otd.13.1524813890568; 
	Fri, 27 Apr 2018 00:24:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.25.195 with HTTP; Fri, 27 Apr 2018 00:24:50 -0700 (PDT)
In-Reply-To: <20180427002651.28356-6-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-6-richard.henderson@linaro.org>
From: Michael Clark <mjc@sifive.com>
Date: Fri, 27 Apr 2018 19:24:50 +1200
Message-ID: <CAHNT7NujtwKtCtsxG91DtgriDd2sjVZwyqKhAp03LR=eJjdMtQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::229
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 5/9] target/riscv: Use new atomic min/max
 expanders
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Emilio G. Cota" <cota@braap.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D5v9NgXuRKf9

On Fri, Apr 27, 2018 at 12:26 PM, Richard Henderson <
richard.henderson@linaro.org> wrote:

> Cc: Michael Clark <mjc@sifive.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>

Reviewed-by: Michael Clark <mjc@sifive.com>

If you give me a remote I can pull into my local workspace and test. The
change looks pretty straight-forward. There are tests for amos in
riscv-tests but no parallel tests (i.e. contended case).

Regarding this target/riscv/translate.c. I'd like to make a patch to
remove CPURISCVState *env arguments from several gen functions.

---
>  target/riscv/translate.c | 72 ++++++++++++++----------------
> ------------------
>  1 file changed, 20 insertions(+), 52 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 808eab7f50..9cab717088 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -725,7 +725,6 @@ static void gen_atomic(DisasContext *ctx, uint32_t opc,
>      TCGv src1, src2, dat;
>      TCGLabel *l1, *l2;
>      TCGMemOp mop;
> -    TCGCond cond;
>      bool aq, rl;
>
>      /* Extract the size of the atomic operation.  */
> @@ -823,60 +822,29 @@ static void gen_atomic(DisasContext *ctx, uint32_t
> opc,
>          tcg_gen_atomic_fetch_or_tl(src2, src1, src2, ctx->mem_idx, mop);
>          gen_set_gpr(rd, src2);
>          break;
> -
>      case OPC_RISC_AMOMIN:
> -        cond = TCG_COND_LT;
> -        goto do_minmax;
> -    case OPC_RISC_AMOMAX:
> -        cond = TCG_COND_GT;
> -        goto do_minmax;
> -    case OPC_RISC_AMOMINU:
> -        cond = TCG_COND_LTU;
> -        goto do_minmax;
> -    case OPC_RISC_AMOMAXU:
> -        cond = TCG_COND_GTU;
> -        goto do_minmax;
> -    do_minmax:
> -        /* Handle the RL barrier.  The AQ barrier is handled along the
> -           parallel path by the SC atomic cmpxchg.  On the serial path,
> -           of course, barriers do not matter.  */
> -        if (rl) {
> -            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> -        }
> -        if (tb_cflags(ctx->tb) & CF_PARALLEL) {
> -            l1 = gen_new_label();
> -            gen_set_label(l1);
> -        } else {
> -            l1 = NULL;
> -        }
> -
>          gen_get_gpr(src1, rs1);
>          gen_get_gpr(src2, rs2);
> -        if ((mop & MO_SSIZE) == MO_SL) {
> -            /* Sign-extend the register comparison input.  */
> -            tcg_gen_ext32s_tl(src2, src2);
> -        }
> -        dat = tcg_temp_local_new();
> -        tcg_gen_qemu_ld_tl(dat, src1, ctx->mem_idx, mop);
> -        tcg_gen_movcond_tl(cond, src2, dat, src2, dat, src2);
> -
> -        if (tb_cflags(ctx->tb) & CF_PARALLEL) {
> -            /* Parallel context.  Make this operation atomic by verifying
> -               that the memory didn't change while we computed the
> result.  */
> -            tcg_gen_atomic_cmpxchg_tl(src2, src1, dat, src2,
> ctx->mem_idx, mop);
> -
> -            /* If the cmpxchg failed, retry. */
> -            /* ??? There is an assumption here that this will eventually
> -               succeed, such that we don't live-lock.  This is not unlike
> -               a similar loop that the compiler would generate for e.g.
> -               __atomic_fetch_and_xor, so don't worry about it.  */
> -            tcg_gen_brcond_tl(TCG_COND_NE, dat, src2, l1);
> -        } else {
> -            /* Serial context.  Directly store the result.  */
> -            tcg_gen_qemu_st_tl(src2, src1, ctx->mem_idx, mop);
> -        }
> -        gen_set_gpr(rd, dat);
> -        tcg_temp_free(dat);
> +        tcg_gen_atomic_fetch_smin_tl(src2, src1, src2, ctx->mem_idx,
> mop);
> +        gen_set_gpr(rd, src2);
> +        break;
> +    case OPC_RISC_AMOMAX:
> +        gen_get_gpr(src1, rs1);
> +        gen_get_gpr(src2, rs2);
> +        tcg_gen_atomic_fetch_smax_tl(src2, src1, src2, ctx->mem_idx,
> mop);
> +        gen_set_gpr(rd, src2);
> +        break;
> +    case OPC_RISC_AMOMINU:
> +        gen_get_gpr(src1, rs1);
> +        gen_get_gpr(src2, rs2);
> +        tcg_gen_atomic_fetch_umin_tl(src2, src1, src2, ctx->mem_idx,
> mop);
> +        gen_set_gpr(rd, src2);
> +        break;
> +    case OPC_RISC_AMOMAXU:
> +        gen_get_gpr(src1, rs1);
> +        gen_get_gpr(src2, rs2);
> +        tcg_gen_atomic_fetch_umax_tl(src2, src1, src2, ctx->mem_idx,
> mop);
> +        gen_set_gpr(rd, src2);
>          break;
>
>      default:
> --
> 2.14.3
>
>
