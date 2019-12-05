Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2333444lff;
        Thu, 5 Dec 2019 09:11:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqxyTjrZYF0mlauBvJwpejwon5pEJTwZInDxvlDSyzPDDyXJGaaGPCZRh5aUIlXbnY66qi9h
X-Received: by 2002:aca:3cc3:: with SMTP id j186mr7756310oia.169.1575565889837;
        Thu, 05 Dec 2019 09:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575565889; cv=none;
        d=google.com; s=arc-20160816;
        b=xVi9+FFfjq+xJ4UT6GDbtckWrXo7t+v158SCgmkaOp3NoZwqdihkCha5wvUqi0me0i
         F2g5hiR8h5lXV/4SjGYSu+5ojHIpyDEamBRcj77qZfFdAW7dmqRxWCHZIowtrHoCXAN+
         QUmUr5UdbEfEA/nCQlK5RDGSDXkl+3Ypg0jbMXdsJNbZ9kYu9TJHhS91hL1bmg0B6KG2
         /Z3X485Lrjgtzdshy+erSa7POjfIqEi2FtcNFFOYaZdTbuC61AEMpQOdIIBWp6Ifjhps
         Jx3Mg5Wa6sguJ++V2XFl9fnKlkkiAQTWt5ZQINtbZ3VkucL1qKbRlQP28+VijzTvQ+XY
         MEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtGFypd1tT/KDgKKVEQWYE6cS0eFJfLHx2BXKFo+wN4=;
        b=cMx0TFuzaxPIzjtHhPheQbHX36Dm767UxqAbVXHWj3zLgiiJ6AMAxrRlDyjvzt5ocJ
         K/FJPVLA3Z7wefIolObv6DSy+LGKlRriWbIltnGj1Vm6Jh8zWFECyX3KZmonPgJyrqyh
         4yaiKc2jmH/nRhG5GxWmncDTnKbA2cboxNJ6ZQKgvkR8U2mP8TYII28UdswnkNo2BHOa
         l07ciIcisqKSl1XD6j4H+Ve83hiSW7fCiRvLTJ3aYQnJB2sbQ6o/voMMsHDmE66wn3RG
         uClGIg0iSyTUxUFI7eza/UfoIktC+X0HtoQTj14xLj/NPDMEnEXKfN/1ZCxTBEq0mEkF
         AmTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oy6JRgwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si5653722otq.141.2019.12.05.09.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 09:11:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oy6JRgwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icuf2-0001SZ-IZ
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 12:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1icubC-0005fU-Rt
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:07:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1icubA-0006HX-US
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:07:30 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40101)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1icubA-0006EI-E7
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:07:28 -0500
Received: by mail-ot1-x344.google.com with SMTP id i15so3225143oto.7
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2019 09:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YtGFypd1tT/KDgKKVEQWYE6cS0eFJfLHx2BXKFo+wN4=;
 b=oy6JRgwtThoEKvQtK8rzBh7dRmXkZerjJBWllUk+kPG5maVnwewdrrETeIr4xLyUXz
 U+tdZBte4wkUAiJ5e4TwEuyiYsXhFf5tCpjL/fWzIKPmoAKeW/aUBF0pMq5Ez5IIt+pj
 wYKOcBW6tbuOSxG7lL4hZY4TFMU4MlpdZob6zOEr2KlIZkJCJh2F24vBhC1bbwfEnSY1
 WDV6+rEiGd8CH39CH2ct8Jup6QK4cqP3phHozy174L3uTc4iYJ+uX3js488+jJDa3TcS
 siLeZaUAC8o9FNM8ySoaqKTn4/RjCWz3liY50WIB3wVpVLZm4/HIXeAGtu5yq1bUu9cT
 J7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YtGFypd1tT/KDgKKVEQWYE6cS0eFJfLHx2BXKFo+wN4=;
 b=JAuLG2jB4QYf/BYvoFGJX6Z1v7W73/BkYnTo5r1qJlv+6DsHnvyYDJ0NuyysT/Gh7N
 0r8pdVHtiaoYoOh3VfhsC1Eks60A0HQEPMj60YnVCJSGigjXRUUXOvjo+3OrtAh4ygq6
 fRr7GpzizxSryEGy2Z+PIsMHqUTWMJqrmMUgsYfkJa29BFRxsCjkmtjQ6WC4yxOgis78
 Y2rjr02qjAZpzH+cDUhnml14ythTPARyoiKJ+Tk00bBTwDMqlOKk7HSUQ+2N8cXz49Ll
 NEpRhj/58nQHmdCglikmhmswW5kE5Rh6D3unhHLdG6TXoa/sb7Ts2AJrW0TuzWKP9ba7
 v/2g==
X-Gm-Message-State: APjAAAVktqek2DlKWG0V8fgnWBYwS6RQn+HIfYEyUVAb4xQyMC7OfvaN
 5NJdkDwkuO/A9g4l1fmSjjlNnQy7zoO5sdeAUU7syw==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr7746462otg.232.1575565647508; 
 Thu, 05 Dec 2019 09:07:27 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-12-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2019 17:07:16 +0000
Message-ID: <CAFEAcA_0pBg57n8wq2j0tS94ewJf1mrYsJYzaWYcQAKvfBFm-g@mail.gmail.com>
Subject: Re: [PATCH v5 11/22] target/arm: Implement LDG, STG, ST2G instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KVUqbUxuPATj

On Fri, 11 Oct 2019 at 14:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Split out allocation_tag_mem.  Handle atomicity of stores.
> v3: Add X[t] input to these insns; require pre-cleaned addresses.
> v5: Fix !32-byte aligned operation of st2g.
> ---
>  target/arm/helper-a64.h    |   5 ++
>  target/arm/mte_helper.c    | 154 +++++++++++++++++++++++++++++++++++++
>  target/arm/translate-a64.c | 115 +++++++++++++++++++++++++++
>  3 files changed, 274 insertions(+)
>

> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -25,8 +25,21 @@
>  #include "exec/helper-proto.h"
>
>
> +static uint8_t *allocation_tag_mem(CPUARMState *env, uint64_t ptr,
> +                                   bool write, uintptr_t ra)
> +{
> +    /* Tag storage not implemented.  */
> +    return NULL;
> +}
> +
>  static int get_allocation_tag(CPUARMState *env, uint64_t ptr, uintptr_t ra)
>  {
> +    uint8_t *mem = allocation_tag_mem(env, ptr, false, ra);
> +
> +    if (mem) {
> +        int ofs = extract32(ptr, LOG2_TAG_GRANULE, 1) * 4;
> +        return extract32(atomic_read(mem), ofs, 4);

Can we have a comment somewhere describing what our tag
storage looks like? I guess from the code that we're doing
it as a byte array where each byte stores 2 4-bit tags
(in which order?), but documenting it would be nice.

> +    }
>      /* Tag storage not implemented.  */
>      return -1;
>  }

> +static void do_st2g(CPUARMState *env, uint64_t ptr1, uint64_t xt,
> +                    uintptr_t ra, stg_store1 store1)
> +{
> +    int el, tag;
> +    uint64_t ptr2, sctlr;
> +    uint8_t *mem1, *mem2;
> +
> +    check_tag_aligned(env, ptr1, ra);
> +
> +    el = arm_current_el(env);
> +    sctlr = arm_sctlr(env, el);
> +    tag = allocation_tag_from_addr(xt);
> +
> +    /*
> +     * Trap if accessing an invalid page(s).
> +     * This takes priority over !allocation_tag_access_enabled.
> +     */
> +    mem1 = allocation_tag_mem(env, ptr1, true, ra);
> +
> +    if (ptr1 & TAG_GRANULE) {
> +        /* The two stores are unaligned and modify two bytes.  */
> +        ptr2 = ptr1 + TAG_GRANULE;
> +        mem2 = allocation_tag_mem(env, ptr2, true, ra);
> +
> +        /* Store if page supports tags and access is enabled.  */
> +        if ((mem1 || mem2) && allocation_tag_access_enabled(env, el, sctlr)) {
> +            if (mem1) {
> +                store1(ptr1, mem1, tag);
> +            }
> +            if (mem2) {
> +                store1(ptr2, mem2, tag);
> +            }
> +        }
> +    } else {
> +        /* The two stores are aligned 32, and modify one byte.  */

Not sure what the '32' means here?

> +        if (mem1 && allocation_tag_access_enabled(env, el, sctlr)) {
> +            tag |= tag << 4;
> +            atomic_set(mem1, tag);
> +        }
> +    }
> +}

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index cf341c98d3..c17b36ebb2 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -3559,6 +3559,118 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
>      }
>  }
>
> +/*
> + * Load/Store memory tags
> + *
> + *  31 30 29         24     22  21     12    10      5      0
> + * +-----+-------------+-----+---+------+-----+------+------+
> + * | 1 1 | 0 1 1 0 0 1 | op1 | 1 | imm9 | op2 |  Rn  |  Rt  |
> + * +-----+-------------+-----+---+------+-----+------+------+
> + */
> +static void disas_ldst_tag(DisasContext *s, uint32_t insn)
> +{
> +    int rt = extract32(insn, 0, 5);
> +    int rn = extract32(insn, 5, 5);
> +    uint64_t offset = sextract64(insn, 12, 9) << LOG2_TAG_GRANULE;
> +    int op2 = extract32(insn, 10, 3);

Typo ? op2 is only 2 bits, not 3.

> +    int op1 = extract32(insn, 22, 2);

The Arm ARM calls this field 'opc', fwiw.

> +    bool is_load = false, is_pair = false, is_zero = false;
> +    int index = 0;
> +    TCGv_i64 dirty_addr, clean_addr, tcg_rt;
> +
> +    if ((insn & 0xff200000) != 0xd9200000
> +        || !dc_isar_feature(aa64_mte_insn_reg, s)) {
> +        goto do_unallocated;
> +    }

Bits 28:24 are already checked by the decode that got us here.

I did wonder about maybe doing the decode of
[31:30] and [21] in the caller (which would match the
structure of the decode tables in the manual), but
we do the same sort of thing for bit [31] in
disas_ldst_multiple_struct() and disas_ldst_single_struct(),
so this is fine.

Not all the insns in this encoding group are present
for the mte_insn_reg cut-down implementation:
LDGM, STGM and STZGM should UNDEF unless we have
full-fat MTE. We haven't added any of those in this patch,
but it might affect how you want to structure the
conditional for doing the feature bit test. (Looking
ahead, patch 13 which adds those insns doesn't update the
feature bit test.)


> +
> +    switch (op1) {
> +    case 0: /* STG */
> +        if (op2 != 0) {
> +            /* STG */
> +            index = op2 - 2;

What does 'index' represent? It looks from the rest of
the code like it's some sort of tristate between
'preindex', 'postindex' and 'not indexed'; if so
a comment explaining what the valid values and meanings
are would be helpful. Alternatively, follow the approach
of disas_ldst_reg_imm9() and just have separate
'post_index' and 'writeback' bools.

> +            break;
> +        }
> +        goto do_unallocated;
> +    case 1:
> +        if (op2 != 0) {
> +            /* STZG */
> +            is_zero = true;
> +            index = op2 - 2;
> +        } else {
> +            /* LDG */
> +            is_load = true;
> +        }
> +        break;
> +    case 2:
> +        if (op2 != 0) {
> +            /* ST2G */
> +            is_pair = true;
> +            index = op2 - 2;
> +            break;
> +        }
> +        goto do_unallocated;
> +    case 3:
> +        if (op2 != 0) {
> +            /* STZ2G */
> +            is_pair = is_zero = true;
> +            index = op2 - 2;
> +            break;
> +        }
> +        goto do_unallocated;
> +
> +    default:
> +    do_unallocated:
> +        unallocated_encoding(s);
> +        return;
> +    }

Should there be a
    if (rn == 31) {
        gen_check_sp_alignment(s);
    }
here?

> +
> +    dirty_addr = read_cpu_reg_sp(s, rn, true);
> +    if (index <= 0) {
> +        /* pre-index or signed offset */
> +        tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
> +    }
> +
> +    clean_addr = clean_data_tbi(s, dirty_addr, false);
> +    tcg_rt = cpu_reg(s, rt);

I think this is only correct for LDG, where the Rt field
is 'specifies the Xt register to use'; for STG and ST2G
it's an '<Xn|SP>' form where 31 means "use SP" and you
want cpu_reg_sp() for those.


> +
> +    if (is_load) {
> +        gen_helper_ldg(tcg_rt, cpu_env, clean_addr, tcg_rt);
> +    } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
> +        if (is_pair) {
> +            gen_helper_st2g_parallel(cpu_env, clean_addr, tcg_rt);
> +        } else {
> +            gen_helper_stg_parallel(cpu_env, clean_addr, tcg_rt);
> +        }
> +    } else {
> +        if (is_pair) {
> +            gen_helper_st2g(cpu_env, clean_addr, tcg_rt);
> +        } else {
> +            gen_helper_stg(cpu_env, clean_addr, tcg_rt);
> +        }
> +    }
> +
> +    if (is_zero) {
> +        TCGv_i64 tcg_zero = tcg_const_i64(0);
> +        int mem_index = get_mem_index(s);
> +        int i, n = (1 + is_pair) << LOG2_TAG_GRANULE;
> +
> +        for (i = 0; i < n; i += 8) {
> +            tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_Q);
> +            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
> +        }
> +        tcg_temp_free_i64(tcg_zero);
> +    }
> +
> +    if (index != 0) {
> +        /* pre-index or post-index */
> +        if (index > 0) {
> +            /* post-index */
> +            tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
> +        }
> +        tcg_gen_mov_i64(cpu_reg_sp(s, rn), dirty_addr);
> +    }
> +}

thanks
-- PMM
