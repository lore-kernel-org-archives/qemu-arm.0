Received: by 10.28.4.212 with SMTP id 203csp1998118wme;
        Thu, 3 May 2018 07:55:36 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZquUK0B2TlVaqOVUNQ3KoAnDCcfsmZyJbS3i3bH9QMyeQW+FQvR3kDXgutkEWM68zI1vD2L
X-Received: by 2002:aed:23f5:: with SMTP id k50-v6mr19688165qtc.367.1525359336536;
        Thu, 03 May 2018 07:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525359336; cv=none;
        d=google.com; s=arc-20160816;
        b=F6N73DsrncbFl7l29l/NQT2HnN6Znumh+vbzQ+I7RnjHp6Eonij2lCjuf2wgiWJw55
         FS5Qib3+tF1gGz4pWey0OeX3NwOKHqRkEHyNSJZiQY6ux5XDhYolqDaH1ybpH/Dedqec
         K6BWCof2jyq1qecoERxqsp/7vxJRHaKKvPiKlYRph4sTg7kUZ/ZEBDpKm+xbro5Z280h
         GkRzY+wE2J3jAbuojJx2lJyfqUmzx0xm9G40ZAk9TWp2JFs46qxNio7bUFWhUKE7GL4P
         Q3YZZTF8WACHEKO0HJiFu3+PXqK4TwXFxsKsP6iJHApXq1qNYbsr7ZIgE2DUHhvpkzdh
         4AoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=J5ISdLkZ39la8AyCUoBS8SnOchopA+b6Z/Pazv2LvSE=;
        b=DUiWw/WNw/GhCQqIh2vRwr1d5zKxMWb3VlTRCplwfiKaXZC0iGUMk9nVfKC6CxkKvu
         8ZOvxMXScbzfob01TEp3nSe8w/w0JLnFe1ZAIgWvQAKvrCjSwJjwDkH776MexPrs8nso
         HvdT670ghWaxSbok6V9f/SAO0yIISEPFdVsQUDJmGzhRwtnv0iQ+XwuwbB22ZM/+nY8S
         k/YvMakP73Q9GHRJEFfvRznJ+9bAX3jxscKfIOjKUHicxSewCuZoCoWEbeF8kcZDciuN
         IqZtzhprSyesBc5ZP+wGyrjyW+30VfLa10LoCA277mB4UY9+A0jzWGxGq6hiP8himlNM
         qGRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K5OVhyXG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e10-v6si3278623qvm.131.2018.05.03.07.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 07:55:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K5OVhyXG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEFdv-00030S-UH
	for alex.bennee@linaro.org; Thu, 03 May 2018 10:55:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEFdj-0002yb-RB
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:55:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEFdi-0001Uv-UC
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:55:23 -0400
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231]:44707)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEFdi-0001Ua-Or
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:55:22 -0400
Received: by mail-oi0-x231.google.com with SMTP id e80-v6so16305466oig.11
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J5ISdLkZ39la8AyCUoBS8SnOchopA+b6Z/Pazv2LvSE=;
	b=K5OVhyXGUUC5SXHqlv8Qi3Vt+KfIRiNJW1d+gPVCBGspTcVtS+4xEGyjIzlb49nvyD
	6i+c0xu303mssHEUwYL7NBHKy1Sk0ysTwPBW0Io+0gur9XqwAxAgNSKCS82BVlVNWCf3
	SQ9SyWl0BYIFcQgApMPTHy3cnev/i9/8yONxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J5ISdLkZ39la8AyCUoBS8SnOchopA+b6Z/Pazv2LvSE=;
	b=lgwmAEuo0mc02kGLbqIR1xCPf7HwdtPSj4OC3lG05PE+0GR6uUuyvFj6SowYx5jn4N
	SLZSEar+DoObgYoqKy1Ttx0ahlpjd0+forKZOEq23cRQBWpVZX0azoCGCeNyVF46I36r
	SJogqPv7acTpYo4NGpGY3MwNcL0PpzmKldCSG0QGq9MQpIkFpCBgpPQ4Sm3/1X2h0xTU
	ZHhPwG127EbogeRSs9DJSHtiSLNxZ9j/HSas51jMhNumX6LQ6RBGCn3P9X3iMYxZO/cL
	Us44x3cnNu9360je40fbRZuT0pELl5WjWi3xzBnnJPcnBHDuUpCOYb0Ooyjn5znaHZ52
	zR0Q==
X-Gm-Message-State: ALQs6tBypzD1NUjSDETI4rdmFYfsOZAPc5ZGjQ0N7cx70uty84moQZEZ
	BY8fUg5v1kTIuM05L1YdVE/Nt6exdI/UUEJnMCY1UA==
X-Received: by 2002:aca:cd0b:: with SMTP id
	d11-v6mr13931272oig.337.1525359321939; 
	Thu, 03 May 2018 07:55:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 07:55:01 -0700 (PDT)
In-Reply-To: <20180427002651.28356-9-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 15:55:01 +0100
Message-ID: <CAFEAcA_ZaP8Wxe3P+5SKpmQxzJqOEQxnKcdh7StGytOi9iR0yg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 8/9] target/arm: Implement CAS
 and CASP
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
X-TUID: kaKwC+4MpHcd

On 27 April 2018 at 01:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.h    |   2 +
>  target/arm/helper-a64.c    |  43 ++++++++++++++++
>  target/arm/translate-a64.c | 119 +++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 161 insertions(+), 3 deletions(-)

> +static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
> +                                      int rn, int size)
> +{
> +    TCGv_i64 s1 = cpu_reg(s, rs);
> +    TCGv_i64 s2 = cpu_reg(s, rs + 1);
> +    TCGv_i64 t1 = cpu_reg(s, rt);
> +    TCGv_i64 t2 = cpu_reg(s, rt + 1);
> +    TCGv_i64 addr = cpu_reg_sp(s, rn);
> +    int memidx = get_mem_index(s);
> +
> +    if (rn == 31) {
> +        gen_check_sp_alignment(s);
> +    }
> +
> +    if (size == 2) {
> +        TCGv_i64 cmp = tcg_temp_new_i64();
> +        TCGv_i64 val = tcg_temp_new_i64();
> +
> +        if (s->be_data == MO_LE) {
> +            tcg_gen_concat32_i64(val, t1, t2);
> +            tcg_gen_concat32_i64(cmp, s1, s2);
> +        } else {
> +            tcg_gen_concat32_i64(val, t2, t1);
> +            tcg_gen_concat32_i64(cmp, s2, s1);
> +        }
> +
> +        tcg_gen_atomic_cmpxchg_i64(cmp, addr, cmp, val, memidx,
> +                                   MO_64 | MO_ALIGN | s->be_data);
> +        tcg_temp_free_i64(val);
> +
> +        if (s->be_data == MO_LE) {
> +            tcg_gen_extr32_i64(s1, s2, cmp);
> +        } else {
> +            tcg_gen_extr32_i64(s2, s1, cmp);
> +        }
> +        tcg_temp_free_i64(cmp);
> +    } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
> +        TCGv_i32 tcg_rs = tcg_const_i32(rs);
> +
> +        if (s->be_data == MO_LE) {
> +            gen_helper_casp_le_parallel(cpu_env, tcg_rs, addr, t1, t2);
> +        } else {
> +            gen_helper_casp_be_parallel(cpu_env, tcg_rs, addr, t1, t2);
> +        }
> +        tcg_temp_free_i32(tcg_rs);
> +    } else {
> +        TCGv_i64 d1 = tcg_temp_new_i64();
> +        TCGv_i64 d2 = tcg_temp_new_i64();
> +        TCGv_i64 a2 = tcg_temp_new_i64();
> +        TCGv_i64 c1 = tcg_temp_new_i64();
> +        TCGv_i64 c2 = tcg_temp_new_i64();
> +        TCGv_i64 zero = tcg_const_i64(0);
> +
> +        /* Load the two words, in memory order.  */
> +        tcg_gen_qemu_ld_i64(d1, addr, memidx,
> +                            MO_64 | MO_ALIGN_16 | s->be_data);
> +        tcg_gen_addi_i64(a2, addr, 8);
> +        tcg_gen_qemu_ld_i64(d2, addr, memidx, MO_64 | s->be_data);
> +
> +        /* Compare the two words, also in memory order.  */
> +        tcg_gen_setcond_i64(TCG_COND_EQ, c1, d1, s1);
> +        tcg_gen_setcond_i64(TCG_COND_EQ, c2, d2, s2);
> +        tcg_gen_and_i64(c2, c2, c1);
> +
> +        /* If compare equal, write back new data, else write back old data.  */
> +        tcg_gen_movcond_i64(TCG_COND_NE, c1, c2, zero, t1, d1);
> +        tcg_gen_movcond_i64(TCG_COND_NE, c2, c2, zero, t2, d2);
> +        tcg_gen_qemu_st_i64(c1, addr, memidx, MO_64 | s->be_data);
> +        tcg_gen_qemu_st_i64(c2, a2, memidx, MO_64 | s->be_data);

I think this has the wrong behaviour if you do a CASP-with-mismatched-value
to read-only memory -- architecturally this should fail the comparison
and return the memory value in registers, it's not allowed to do a
memory write and take a data abort because the memory isn't writable.

> +        tcg_temp_free_i64(a2);
> +        tcg_temp_free_i64(c1);
> +        tcg_temp_free_i64(c2);
> +        tcg_temp_free_i64(zero);
> +
> +        /* Write back the data from memory to Rs.  */
> +        tcg_gen_mov_i64(s1, d1);
> +        tcg_gen_mov_i64(s2, d2);
> +        tcg_temp_free_i64(d1);
> +        tcg_temp_free_i64(d2);
> +    }
> +}
> +

thanks
-- PMM
