Received: by 10.223.183.22 with SMTP id l22csp814653wre;
        Mon, 14 Aug 2017 11:25:00 -0700 (PDT)
X-Received: by 10.55.72.206 with SMTP id v197mr31779239qka.133.1502735100873;
        Mon, 14 Aug 2017 11:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502735100; cv=none;
        d=google.com; s=arc-20160816;
        b=UGNhwI2QEBY8PZVh/dWZOzOGU53FmHDj0XjqIe/NBeZmZmjpnlXfkaAnq3vRpsMG9/
         tylVJjDtcEWq3xAWVh8IF2vhccYsrRrd4iQBf3MxkoLCj87IXc/dvB/mYWwdqC6CRAAm
         tRDttYJW8M+IPQATuGhZUYalpjNDHC6mwXa7m7N7dfRcN/gR9rCApZ9gc85egLrPXIvE
         ymdwhf0NADFxA3nwRWLLa5Wh4n4VZbOsP2i4hTvEbPS57rcLInJ5pKYv79+bW1fyXio6
         YqSI7yCgzOJmFv18F8zWo+pxi8c708JzRozgoiTsXCpUbc+Ubccve+1O5fNVI6lnWCJ9
         dsMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gTK2E2gWFGcWYMKnOLbj17OjyL+mT54NlZr17NPhFT8=;
        b=xtf0iCfdihZOmy9OXUcnJhJJnetr+PSHqi9QUqMoxf/CVYvCrHprTVMpYWynVLFsU5
         fVEVnZNs2+QNPLVlAnx6qU0xRmpwrl0g8fzfKK1fFKniad7G5EZAjkp840zsvIrqB8n/
         mbCmipTbEl0l8yC2+Dk10VsZgMTGtjMiTT2nyu4V/x8fNB1GAHySrQMvWBoTEerwx99+
         GgdEFLNC6hRYsIYNSBdOXb2t4XFXoJfxovBpkDe+jv6wpGPEJSGckLG61hYzfiPz/Vhs
         ffXIKeoYj0MNfjlIoxgZBHl4p03/ystOb+lPg2W7MrDY1bjq2U5rihYt3mPSmW0c+xQR
         KIbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rYa4YZmc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b15si7076540qtb.339.2017.08.14.11.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Aug 2017 11:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rYa4YZmc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dhK2s-0007Us-AB
	for alex.bennee@linaro.org; Mon, 14 Aug 2017 14:24:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dhK1X-0006eQ-Q3
	for qemu-devel@nongnu.org; Mon, 14 Aug 2017 14:23:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dhK1W-0007D1-KO
	for qemu-devel@nongnu.org; Mon, 14 Aug 2017 14:23:35 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:36780)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dhK1W-0007C8-AN; Mon, 14 Aug 2017 14:23:34 -0400
Received: by mail-wm0-x242.google.com with SMTP id d40so15318638wma.3;
	Mon, 14 Aug 2017 11:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=gTK2E2gWFGcWYMKnOLbj17OjyL+mT54NlZr17NPhFT8=;
	b=rYa4YZmcx8Dl489AKBVu1ZIVVh9iPqejrjvZ7jZ61fC9PaIty7G4OokOns4NMyrVtf
	i4tsDwzMiPd/Q1ftSNM5QQ9Of4Xef6uGpw8yeVsOukN5CdWWo2d+Qsb1qChEnd+kQAfu
	BFojKbY5ZCBfCigddxMccxbvQ85AuWA+wOXp6deSz21DJm602zvF6+djhpeG0cm/cTeg
	aON5pJ0HTh8Ob0LzE/WjTHd1ChFPp9uQlIVHBHAVbU1C/TYD4Hs3v+S544JS5jCJyM9p
	ZM/Z0lIpXduj2kWMHrGRg5zrBXF2pBIFxJxSSrLd2/eJmOOSVD8o/t9QNdtpFjGPgmON
	SUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=gTK2E2gWFGcWYMKnOLbj17OjyL+mT54NlZr17NPhFT8=;
	b=VXgFQjpqqrhYyVFivmpELYFzWTJzo/BP+vqc3BNH++oboYOWICoF+Mpaab08jS1tPw
	MQBz0LKxqmTznus3Ng40ckAesyMO8F3Ye5YTr0WB9ZJAlzYw+DD1EccCh0Ep5PpYxfJ9
	iu5DH4qdPY9HCJu8cFvaNVTGxI4a2aOb22TDjgr3AzX3/OkYHDK3jz0SKMOuza9/pqCV
	HY3omnl4lXWmQIic76zwIcDCrP68T57FpCcRi+jGzVg2Hl1QE2DepqA7w2SqV3+Hfq/F
	cMdVDkGB68J1SKtAiqgBGH0vILBn87kPMDGhy8voUSAVLSRyABgRLV+GwQmM3PVS3YwK
	n/3g==
X-Gm-Message-State: AHYfb5hIRrwvixWS7iVlAI9IUuLodrTxiu/LE1wqTGxo1kCDwog8qToC
	hm9N4HDbSwGn7HXQtUn1sX+En48I+A==
X-Received: by 10.28.45.211 with SMTP id t202mr4269212wmt.105.1502735011677;
	Mon, 14 Aug 2017 11:23:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Mon, 14 Aug 2017 11:23:01 -0700 (PDT)
In-Reply-To: <20170812154131.29372-1-richard.henderson@linaro.org>
References: <20170812154131.29372-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 14 Aug 2017 11:23:01 -0700
X-Google-Sender-Auth: VjzovvbjQvIDCpZaQnPHvm3WFvE
Message-ID: <CAKmqyKOnfiLhXh7G3jqjv0aF-HHCNHsfHPvy6h1X3g5NUNzXrA@mail.gmail.com>
To: Richard Henderson <rth7680@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-devel] [PATCH] target/arm: Correct load/store exclusive
 pairing and alignment
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n9FvAYLELRTk

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

This passes the same tests that my patch series passes.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Tested-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair


> ---
>  target/arm/translate-a64.c | 65 +++++++++++++++++++++++++++++-----------------
>  1 file changed, 41 insertions(+), 24 deletions(-)
> ---
>
> I have not yet constructed test cases for all of the combinations
> listed above.  I wanted to put this into your hands so that you could
> test against your existing code using LDXP/STXP.
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
>          } else if (s->be_data == MO_LE) {
>              gen_helper_paired_cmpxchg64_le(tmp, cpu_env, addr, cpu_reg(s, rt),
>                                             cpu_reg(s, rt2));
> --
> 2.13.4
>
>
