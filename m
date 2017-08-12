Received: by 10.25.221.202 with SMTP id w71csp2295967lfi;
        Sat, 12 Aug 2017 09:30:34 -0700 (PDT)
X-Received: by 10.233.223.68 with SMTP id t65mr26277053qkf.122.1502555434488;
        Sat, 12 Aug 2017 09:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502555434; cv=none;
        d=google.com; s=arc-20160816;
        b=WdxMnoZZ/wVnZ+ZUoYX4hRurBzYYmzqF+7uitJcxT72uzRtCq/iSUAov5RMmO7pZvt
         Qo1rR07cttE4QvxcyHvcV092JnwC8NM/ETbIFWJnGLO4ej8wzXeo8FQ+cSlFKvR/68w+
         hmwP93XW0h9DBsBvAvV8vc3jUmo/GONhhp/upm+W8i4lFw7YiYF8kHc5vPC7ozpfwM0g
         ygMisZ+NDXNXoHSH52CO7At5G2oANfK6QvkgDxerwEllHeAVKpOdAX7qtmFiWX1OcuLk
         7pR2gVmL5bj5y06NPL52npxivxpjlyOMn5iTvuufdnWyjGkjOEzWhn4dRASUEq5VIo+D
         BVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=AOVERSA4r3M9ySyrY0zlq4kCYWIO+zt/3MXGyT7ep/I=;
        b=K4abOGl3RsGKbRRHDf7VNprrdlTmKGWibjrIdlbdzpDtMZbTkeiRaaow1BYwxgCBR0
         GoddcJ+PMG6e9jJiAocFTQ+5Eglqz2FdAaxhc+iOwaerJCWVkU+y3JurCucI42rjjVmi
         zn4zU0w/rsVXx2tZ9qoqR+FADl7KlqHMydYHdC6RCmQJMkLlZ4FhiRDr45YS2QtIxMDP
         +LLQlqX5HRMYsYwkgiFXS/VBomiM5WNg9BeV+A+4ZYsEKkazauKmFaCVQXxr6aWr7DWz
         nM8x710xwzoBh67qhhoVkz3zECaTlcTyWsHcWViIg4oPbu+e1sJeJS2kElHYoOOcYI00
         Qbtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Egu2IjSl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z66si115518qkg.96.2017.08.12.09.30.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 09:30:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Egu2IjSl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgZJ1-0000v6-SL
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 12:30:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgZIu-0000qp-6o
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 12:30:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgZIs-0008BW-NU
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 12:30:24 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:37924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dgZIp-0008Ae-Fl; Sat, 12 Aug 2017 12:30:19 -0400
Received: by mail-wm0-x241.google.com with SMTP id y206so9694360wmd.5;
	Sat, 12 Aug 2017 09:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=AOVERSA4r3M9ySyrY0zlq4kCYWIO+zt/3MXGyT7ep/I=;
	b=Egu2IjSlocH8QIX5QKvJwoE9FL6QMKolNJC6aEhaoJWa/UihHD3j1efRas8xc/sUT9
	r6P/Agm6RTLek1OhprM4lV9wgUFDEs7SWn6+nGUwwH2oBXKcGIdifpAy3nH9oUceXgV9
	NdLQ6+CMAfQvgXHsAi9SK8dTRaV2k9DXPxE06xyF+1SyblluXZ2VGl50icHCaTKH7IP7
	ja8CxofLIbT0zx+MquW/AB3h0d44hRaeyQCMziVF7cc3wzyQjYLLGQsLVkxH9TrxZL2A
	ib7A2gsR5omMTw7NQH2H+GB+2K2WKfY+It6rlOEjnOGXBA20MBfZYD11uRK0oTDaoSxN
	KosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=AOVERSA4r3M9ySyrY0zlq4kCYWIO+zt/3MXGyT7ep/I=;
	b=rLuTs70lZOrxJVZ9jPFsrqpAsFGnRBgEx4EwCW6qWkEOwUcBuuHFfCTXwYtxSttYKy
	jesl688dDWJ3ANi7AoeWHD3CtJN499aGXXM0ti4diebx0uajpwONiNFNgPUf5yQfG7i4
	3p8I9qxISnELMnWT+aAntwVFGZxU74vEBREjp/Sg7FjrS+gWmhuspPD0XRwK2565qg0K
	X6JTW+/LLPHg4SM8R0W9JZ9lNSzBkm1XsJmDLuO3mr3EqXwUjjEp7EUEvkdKnLa3oXO1
	BU1hSg/plMliDz3z5oWZmuTxJIKdfLR3XKX9cS1evzRgtanFy+pkKc6EkZEOwxe0UKdy
	jw0Q==
X-Gm-Message-State: AHYfb5j98FvbmIW2k1Fkl37NjqmWfzfJKaJxGDUj47IB7WO7wNvUMB7o
	UBO234rCYWCKytQyNBxHCEXHjDeAGg==
X-Received: by 10.28.54.67 with SMTP id d64mr1319448wma.135.1502555418143;
	Sat, 12 Aug 2017 09:30:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Sat, 12 Aug 2017 09:29:47 -0700 (PDT)
In-Reply-To: <20170812154131.29372-1-richard.henderson@linaro.org>
References: <20170812154131.29372-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Sat, 12 Aug 2017 09:29:47 -0700
X-Google-Sender-Auth: Y_T4zaulWyfzwEE3gos7ysBYUys
Message-ID: <CAKmqyKO=+QDLgEAyqrdTCkDsu6nojmDsdqsu5+po3OP_KOwYQA@mail.gmail.com>
To: Richard Henderson <rth7680@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Correct load/store
 exclusive pairing and alignment
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LKLz14vzqvzK

On Sat, Aug 12, 2017 at 8:41 AM, Richard Henderson <rth7680@gmail.com> wrote:
> SetExclusiveMonitors in the pseudocode is on the address + width,
> and says nothing about the manner of the load.  Therefore
>
>         ldxp    w0, w1, [x2]
> vs
>         ldxr    x0, [x2]
>
> must record the same metadata so that either may pair with
>
>         stxp    w3, w0, w1, [x2]
> vs
>         stxr    w3, x0, [x2]
>
> Fix this by ignoring cpu_exclusive_high except for 64-bit LDXP/STXP.
>
> Also note that we were not providing the required single-copy atomic
> semantics for 32-bit LDXP.  This is trivially fixed alongside the
> cpu_exclusive_val change.
>
> At the same time, exclusive loads require the same alignment as
> exclusive stores.  For 64-bit LDXP, this means adding MO_ALIGN_16;
> for the others adding MO_ALIGN.
>
> Reported-by: Alistair Francis <alistair.francis@xilinx.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 65 +++++++++++++++++++++++++++++-----------------
>  1 file changed, 41 insertions(+), 24 deletions(-)
> ---
>
> I have not yet constructed test cases for all of the combinations
> listed above.  I wanted to put this into your hands so that you could
> test against your existing code using LDXP/STXP.

I can test it on Monday when I'm back in the office. I'll let you know
what I find.

>
>
> r~
>
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 58ed4c6d05..f3643ac8dc 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1853,29 +1853,45 @@ static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
>  static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
>                                 TCGv_i64 addr, int size, bool is_pair)
>  {
> -    TCGv_i64 tmp = tcg_temp_new_i64();
> -    TCGMemOp memop = s->be_data + size;
> +    int idx = get_mem_index(s);
> +    TCGMemOp memop = s->be_data;
>
>      g_assert(size <= 3);
> -    tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), memop);
> -
>      if (is_pair) {
> -        TCGv_i64 addr2 = tcg_temp_new_i64();
> -        TCGv_i64 hitmp = tcg_temp_new_i64();
> -
>          g_assert(size >= 2);
> -        tcg_gen_addi_i64(addr2, addr, 1 << size);
> -        tcg_gen_qemu_ld_i64(hitmp, addr2, get_mem_index(s), memop);
> -        tcg_temp_free_i64(addr2);
> -        tcg_gen_mov_i64(cpu_exclusive_high, hitmp);
> -        tcg_gen_mov_i64(cpu_reg(s, rt2), hitmp);
> -        tcg_temp_free_i64(hitmp);
> -    }
> +        if (size == 2) {
> +            /* The pair must be single-copy atomic for the doubleword.  */
> +            memop |= MO_64 | MO_ALIGN;
> +            tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
> +            if (s->be_data == MO_LE) {
> +                tcg_gen_extract_i64(cpu_reg(s, rt), cpu_exclusive_val, 0, 32);
> +                tcg_gen_extract_i64(cpu_reg(s, rt2), cpu_exclusive_val, 32, 32);
> +            } else {
> +                tcg_gen_extract_i64(cpu_reg(s, rt), cpu_exclusive_val, 32, 32);
> +                tcg_gen_extract_i64(cpu_reg(s, rt2), cpu_exclusive_val, 0, 32);
> +            }
> +        } else {
> +            /* The pair must be single-copy atomic for *each* doubleword,
> +               but not the entire quadword.  It must, however, be aligned.  */
> +            TCGv_i64 addr2;
>
> -    tcg_gen_mov_i64(cpu_exclusive_val, tmp);
> -    tcg_gen_mov_i64(cpu_reg(s, rt), tmp);
> +            memop |= MO_64;
> +            tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx,
> +                                memop | MO_ALIGN_16);
>
> -    tcg_temp_free_i64(tmp);
> +            addr2 = tcg_temp_new_i64();
> +            tcg_gen_addi_i64(addr2, addr, 8);
> +            tcg_gen_qemu_ld_i64(cpu_exclusive_high, addr2, idx, memop);
> +            tcg_temp_free_i64(addr2);
> +
> +            tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
> +            tcg_gen_mov_i64(cpu_reg(s, rt2), cpu_exclusive_high);
> +        }
> +    } else {
> +        memop |= size | MO_ALIGN;
> +        tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
> +        tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
> +    }
>      tcg_gen_mov_i64(cpu_exclusive_addr, addr);
>  }
>
> @@ -1908,14 +1924,15 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
>      tmp = tcg_temp_new_i64();
>      if (is_pair) {
>          if (size == 2) {
> -            TCGv_i64 val = tcg_temp_new_i64();
> -            tcg_gen_concat32_i64(tmp, cpu_reg(s, rt), cpu_reg(s, rt2));
> -            tcg_gen_concat32_i64(val, cpu_exclusive_val, cpu_exclusive_high);
> -            tcg_gen_atomic_cmpxchg_i64(tmp, addr, val, tmp,
> +            if (s->be_data == MO_LE) {
> +                tcg_gen_concat32_i64(tmp, cpu_reg(s, rt), cpu_reg(s, rt2));
> +            } else {
> +                tcg_gen_concat32_i64(tmp, cpu_reg(s, rt2), cpu_reg(s, rt));
> +            }
> +            tcg_gen_atomic_cmpxchg_i64(tmp, addr, cpu_exclusive_val, tmp,
>                                         get_mem_index(s),
> -                                       size | MO_ALIGN | s->be_data);
> -            tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, val);
> -            tcg_temp_free_i64(val);
> +                                       MO_64 | MO_ALIGN | s->be_data);
> +            tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);

Now we aren't ever checking cpu_exclusive_high. Is it even worth having?

Otherwise the patch looks good, let me test it next week and I'll get
back to you.

Thanks,
Alistair

>          } else if (s->be_data == MO_LE) {
>              gen_helper_paired_cmpxchg64_le(tmp, cpu_env, addr, cpu_reg(s, rt),
>                                             cpu_reg(s, rt2));
> --
> 2.13.4
>
>
