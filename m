Received: by 10.28.71.27 with SMTP id u27csp4825374wma;
        Tue, 27 Feb 2018 05:31:05 -0800 (PST)
X-Google-Smtp-Source: AG47ELsdsL4TjqMeWCvgcNF66Lxrj1KAmVfrWBHMgt9bUj8XIObi/1mYJq3A9+YXsHmQVLY8wBtx
X-Received: by 2002:a25:8b0b:: with SMTP id i11-v6mr978232ybl.213.1519738265087;
        Tue, 27 Feb 2018 05:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519738265; cv=none;
        d=google.com; s=arc-20160816;
        b=nx04r72qEYLSn04dldpl9ULit3VwhghRO9a3Q2aY6Lg98UqopCBKGeLgRRt5gBVMuD
         eZFdGxQkVsjeBQMEyANiqXC9DOAAshWVkGYqH+lPAHPh2GD8gLQu0DI17jtHxYG60l4u
         U/LvwJ09I3LhgqomYU99QlxMcMOHaf5qsDvRzxLQ5qz1B+5UfaZZiaf9ni7SLy7mjmGa
         OkvOtE2pD4uLk3Zryto0+Pm16h7E/cYC9+0x6thI70HdwxG4TcXQHra/bnRydtnqNaIZ
         iPtZ756O0nEKXhbxHab86Appld09VzEhebYqkudckvIb04p0hOHAHZDP0KaF663ttjow
         qhQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5VzP+v6QsHGEVT3g4eIyHYo96SrcAkyD8txi42rd43c=;
        b=K2NVkkh8k2l5tOnNri7WaSF4wI5NubFTy7nDuuiTi2A6kZrF0Mb3WYkg4WagJdEj9Q
         kM9ISx4ITa69boCLwGnCV9PR4Av8tNi4o7aqOUIxyG2oQtxckgdV0XET9Dp7Vit6wMKr
         7WfLIxok2kAfWjj349QhDow4RxONiPRcwNs59dYdYD0dmniDVDCdDlp0yzWwjaJySJG7
         XdjGTYL5/CuNkIj1csMQBR9jqDB0Nl7j/xF3MG5L61ic8+nJwO+YNViS6GIpuQZ441o9
         sXEtvfnmR8zoumim2rw1FwHivrN44IM/2UDukzzStNf262fSK6DBU8S6/prYwaht6CXR
         JAvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cfiZNYu9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p184-v6si1912368ybc.649.2018.02.27.05.31.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 05:31:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cfiZNYu9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqfLU-0004hs-CD
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 08:31:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfDv-00065r-Fa
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:23:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfDq-0000H8-Et
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:23:15 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:40602)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqfDq-0000Gi-AE
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:23:10 -0500
Received: by mail-oi0-x244.google.com with SMTP id c12so12831427oic.7
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 05:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5VzP+v6QsHGEVT3g4eIyHYo96SrcAkyD8txi42rd43c=;
	b=cfiZNYu9K++OSgZ719Su2KELhap3oZO3qbp+zHqn7gyAxDEtoSNHUJs2u3rgsQ+j4/
	iYRC1Tm/tLrUQ9pJto8d9+YD7LFe7nO0f3H350XLYQCTR7bNZUj/RNeXY6SxN0CHE9nb
	eogBwRhoyr3c0pgGg5Uvep7BEnUM990r3fwbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5VzP+v6QsHGEVT3g4eIyHYo96SrcAkyD8txi42rd43c=;
	b=YkhuwcpS6dlEUpySF50KmeD5oMXSI6iMndRjZ+8gyTOR9HoAV7BM7e/GRWEWgYN+F+
	U7kMHdLo0KOrSKnffnMss/b+fmQI0r3rWQpfxv4f3TbwTP6SaeTTyObAkoSIMm8+AyCr
	fW+HNQch0FL4zLL16M89QWzK/nLwUpJy8yG8vfcTEu8FQyMriZr6D6Dvxx5ianviwxk8
	TQb8OvaCPjSsWfHMqCLQnQ1El3i93IyRFYPYnqax6wxBDktN4veGyvW7fl+Mn3g2TdCz
	RSS3lxxFUQWEfawvqXVNYlMJFAiLcaNDdCjkqz5ZiaRYCtcWNq8EE4f0HdQuNu//3owa
	xJiw==
X-Gm-Message-State: APf1xPCLWD6811/QjoQ+DJHj7mfjl3w4GApahFzy83V0HWpO1LD7G/wS
	YNdktzf22vTZE5u6N81xCsYPiURgzOoCeT0idqtB/A==
X-Received: by 10.202.61.198 with SMTP id k189mr6530113oia.252.1519737789552; 
	Tue, 27 Feb 2018 05:23:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 05:22:49 -0800 (PST)
In-Reply-To: <20180217182323.25885-46-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 13:22:49 +0000
Message-ID: <CAFEAcA_x-=F8R20MQW_Ao86+_3eE80Mu-i387JYGr4utaSKtEQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 45/67] target/arm: Implement
 SVE Memory Contiguous Store Group
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
X-TUID: 7yro0IPRvxfx

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  29 +++++++
>  target/arm/sve_helper.c    | 211 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  68 ++++++++++++++-
>  target/arm/sve.decode      |  38 ++++++++
>  4 files changed, 343 insertions(+), 3 deletions(-)

> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index aa8bfd2ae7..fda9a56fd5 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -3320,7 +3320,6 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
>
>      tcg_temp_free_ptr(t_pg);
>      tcg_temp_free_i32(desc);
> -    tcg_temp_free_i64(addr);
>  }
>
>  static void do_ld_zpa(DisasContext *s, int zt, int pg,
> @@ -3368,7 +3367,7 @@ static void trans_LD_zprr(DisasContext *s, arg_rprr_load *a, uint32_t insn)
>          return;
>      }
>
> -    addr = tcg_temp_new_i64();
> +    addr = new_tmp_a64(s);
>      tcg_gen_muli_i64(addr, cpu_reg(s, a->rm),
>                       (a->nreg + 1) << dtype_msz(a->dtype));
>      tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
> @@ -3379,7 +3378,7 @@ static void trans_LD_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
>  {
>      unsigned vsz = vec_full_reg_size(s);
>      unsigned elements = vsz >> dtype_esz[a->dtype];
> -    TCGv_i64 addr = tcg_temp_new_i64();
> +    TCGv_i64 addr = new_tmp_a64(s);
>
>      tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn),
>                       (a->imm * elements * (a->nreg + 1))

These changes to the load functions look like they should have been
in the previous patch ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
