Received: by 10.223.172.38 with SMTP id v35csp1934683wrc;
        Fri, 8 Sep 2017 10:56:37 -0700 (PDT)
X-Received: by 10.200.2.6 with SMTP id k6mr5534704qtg.180.1504893397731;
        Fri, 08 Sep 2017 10:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504893397; cv=none;
        d=google.com; s=arc-20160816;
        b=SYjto9iX03nMleZKJEEKk3HW5Rql9z7WhlZM2S+1Sizh/3TOg6t00GO7uFmnjF7YwU
         9QTyFQ3QxiCoQpqilGCnFvTp28dTiz5ABh6p6THDJ1aX+UU7xs8q5AJCCtc/NzyHbuHB
         jlS1TpfoyknaZuenaIZTIArv0x3Lp3StcoDPaVWFSFJ2KMbFbW9DFBj3wptVh62lf+nU
         o5gILaOUwDjholl0mnbGBP/XE5XufSd7zcW+L5ZaMRXHzmd47lB7isYj6imwirs7Ue9r
         9djI0TXqLpjPI1IPxkgaXfXUlcI2JPBMZ8KvHJ29tlwHPvddci8petyMrTGFVMXCM97h
         nIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vAJJkZKMPQCyb2d4mneOpzgaFZZrssp+9h9eVjMoQmI=;
        b=f3gyIo1ac6j72bk2TbgETqaV0Zf0hos3f+35i6Ih8cDy4orvhuSn2PkCU8kEqzp5ur
         rtNSOqWwgnXbojilpctDu1WkxRePJ0jsBre7uHmoH2rJBb+0w0A4GFwKHxfEk3V2Vh9G
         iL0Kc9sw/VZR/NxsfWEAoSOC07tmfiGx+UWtBcM8KRKzboVjoCkBftLHQ+gKzkDwQc3e
         BHWQvfUgpMAlXfphGRttoeZMZ3Ht7r55SRNC9NJ0iKBA6rlx/+21oO1tV9rao+p2A93D
         Kilbcy0dGakorg9C7kfgztprFPBGSmAVcgfJr8h9y/QXin6wbmuwJuJajA7GSc4Yi74f
         wW4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d1opRDao;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a47si1144654qte.86.2017.09.08.10.56.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Sep 2017 10:56:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d1opRDao;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dqNW7-0007Tk-GI
	for alex.bennee@linaro.org; Fri, 08 Sep 2017 13:56:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dqNNL-0008G7-1G
	for qemu-devel@nongnu.org; Fri, 08 Sep 2017 13:47:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dqNNK-0007H3-2P
	for qemu-devel@nongnu.org; Fri, 08 Sep 2017 13:47:31 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:34554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dqNNJ-0007GY-SF; Fri, 08 Sep 2017 13:47:30 -0400
Received: by mail-wr0-x242.google.com with SMTP id k20so1547200wre.1;
	Fri, 08 Sep 2017 10:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vAJJkZKMPQCyb2d4mneOpzgaFZZrssp+9h9eVjMoQmI=;
	b=d1opRDao/ybnRhXbRk4SD9a6bsI9T6drHoCbBPmaVqdC/q9dupBP9bpvU1jEQ/IAo0
	fw4q3fvikH2VBnQGpCraDbkEgHYGgq2Dr2ZriFpDmasklbk6gWwyUokzTxMWVmrM+Fly
	Ymo4jMOI0sCcBhf+deUSHUyGG4K8CmcTbEBiKYu3BSbtq9ADsJN/E/55CcpJYBSm4Yta
	yBXsUb5pHTtQur8W+4BArFLvrhZ2ayLQmbJOX8lj5lmLYp/JKe+2EEIEfQjEGTcYWSPW
	6JO+Wni0fQbKpqyJBlkd8aTfMA2hpyK4comv9UoEQVyHMbinami9LXm28jNKuImzruGy
	Z0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vAJJkZKMPQCyb2d4mneOpzgaFZZrssp+9h9eVjMoQmI=;
	b=odRWxE1MZpsYHh1rJDXg4GH/l1pFFNZ2gGMcRVaklC6ZF/Z6jB7an3SFzY04X2nzzw
	DOzsfh1qqV+60I/g8F/UtvEJgKB7HHRFx0SLNoAM9Of0AN3YucOwQAldAiQlu6Fw5kdj
	BdXtVNedp0MlcEhAwOVTxy/pE9ryIQqqwSZJQuBDWw9DpO6IcX0I58um3Kco100IRDOe
	YbZfVpLvBUS7ODA6LjhhQAapeKtIjezH7bVQ7fMRSt1rjXLIgDSPTUaWpZws3jiftM30
	ZAD+xCvIig2qEyIggItenMogsdVEUcyrsfLG5FGIdyI8Rt3F/7JdhHX+iromG0K+FYmr
	8hSg==
X-Gm-Message-State: AHPjjUhrzwjGT66fnrf2e3SZG5Siwlh6TVgmNA5S7zxT9V1XdV46XDDb
	mEUF6vZDWuYe49Q3zt41U8RflpN6Ww==
X-Google-Smtp-Source: ADKCNb4DneqZ2nsAObAVcXC1V7VozceX9Eki12KL3bBzyKmd27+lXtMn6wkZDk78DhyGQBoeauc8ih9lgmry5D3TQ9Y=
X-Received: by 10.223.144.71 with SMTP id h65mr2999286wrh.41.1504892848657;
	Fri, 08 Sep 2017 10:47:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Fri, 8 Sep 2017 10:46:57 -0700 (PDT)
In-Reply-To: <20170908163859.29820-1-richard.henderson@linaro.org>
References: <20170908163859.29820-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Sep 2017 10:46:57 -0700
Message-ID: <CAKmqyKMdfNLtVTnDGVytJKaaoWMkxt+G3+U6Ph5Vm8U2ZGzRaA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-devel] [PATCH] target/arm: Avoid an extra temporary for
 store_exclusive
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FFPfK2pAcGpF

On Fri, Sep 8, 2017 at 9:38 AM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Instead of copying addr to a local temp, reuse the value (which we
> have just compared as equal) already saved in cpu_exclusive_addr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  target/arm/translate-a64.c | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 9017e30510..114e21cc58 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1894,7 +1894,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
>  }
>
>  static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
> -                                TCGv_i64 inaddr, int size, int is_pair)
> +                                TCGv_i64 addr, int size, int is_pair)
>  {
>      /* if (env->exclusive_addr == addr && env->exclusive_val == [addr]
>       *     && (!is_pair || env->exclusive_high == [addr + datasize])) {
> @@ -1910,13 +1910,8 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
>       */
>      TCGLabel *fail_label = gen_new_label();
>      TCGLabel *done_label = gen_new_label();
> -    TCGv_i64 addr = tcg_temp_local_new_i64();
>      TCGv_i64 tmp;
>
> -    /* Copy input into a local temp so it is not trashed when the
> -     * basic block ends at the branch insn.
> -     */
> -    tcg_gen_mov_i64(addr, inaddr);
>      tcg_gen_brcond_i64(TCG_COND_NE, addr, cpu_exclusive_addr, fail_label);
>
>      tmp = tcg_temp_new_i64();
> @@ -1927,27 +1922,24 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
>              } else {
>                  tcg_gen_concat32_i64(tmp, cpu_reg(s, rt2), cpu_reg(s, rt));
>              }
> -            tcg_gen_atomic_cmpxchg_i64(tmp, addr, cpu_exclusive_val, tmp,
> +            tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr,
> +                                       cpu_exclusive_val, tmp,
>                                         get_mem_index(s),
>                                         MO_64 | MO_ALIGN | s->be_data);
>              tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
>          } else if (s->be_data == MO_LE) {
> -            gen_helper_paired_cmpxchg64_le(tmp, cpu_env, addr, cpu_reg(s, rt),
> -                                           cpu_reg(s, rt2));
> +            gen_helper_paired_cmpxchg64_le(tmp, cpu_env, cpu_exclusive_addr,
> +                                           cpu_reg(s, rt), cpu_reg(s, rt2));
>          } else {
> -            gen_helper_paired_cmpxchg64_be(tmp, cpu_env, addr, cpu_reg(s, rt),
> -                                           cpu_reg(s, rt2));
> +            gen_helper_paired_cmpxchg64_be(tmp, cpu_env, cpu_exclusive_addr,
> +                                           cpu_reg(s, rt), cpu_reg(s, rt2));
>          }
>      } else {
> -        TCGv_i64 val = cpu_reg(s, rt);
> -        tcg_gen_atomic_cmpxchg_i64(tmp, addr, cpu_exclusive_val, val,
> -                                   get_mem_index(s),
> +        tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr, cpu_exclusive_val,
> +                                   cpu_reg(s, rt), get_mem_index(s),
>                                     size | MO_ALIGN | s->be_data);
>          tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
>      }
> -
> -    tcg_temp_free_i64(addr);
> -
>      tcg_gen_mov_i64(cpu_reg(s, rd), tmp);
>      tcg_temp_free_i64(tmp);
>      tcg_gen_br(done_label);
> --
> 2.13.5
>
>
