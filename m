Received: by 10.28.71.27 with SMTP id u27csp4905174wma;
        Tue, 27 Feb 2018 06:51:06 -0800 (PST)
X-Google-Smtp-Source: AH8x2262FLGOyZOLX6Gtr3nHnto1Ym9WQmeQVjdGiAd/vQIxoxmDQfmIfjdhm+3lab31sO72neXp
X-Received: by 10.13.202.6 with SMTP id m6mr9233711ywd.351.1519743065717;
        Tue, 27 Feb 2018 06:51:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519743065; cv=none;
        d=google.com; s=arc-20160816;
        b=btb/zE/TAvuan88rtJjd4y6xgFuXu4+tB2u/pFvNsqJLE/ZNL+24Qpwt/rFinVwhP+
         RoVxR1j08TFBGJB4Dd4GEf7FX8W8a5tEQE9fpjVMmb8BOdKqgkou9IDTxFbP0vr6ew8G
         knJku6+YyztRpLH7n7a94qzUm8apUpU7/UZTrRha+aLFMB16/3+AvqrrfjyJt3DovImS
         Z9s7+B+J4TTAAnQDaVL29jlKh46rYrRZHngB8aLTBdM46CngW129J3KviiMN7ukfxSy9
         XoYpQYa21MnI/I64D1tVhHEVLi1nCGWRTlSF57KV8YfyEmqxPcUmdyMKeRTT54iK40Kg
         9wsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qkKaem/LleLJK0hNdut7wwxSvsnp9803ExnPtcwyHH4=;
        b=z9jGu+RhPHeWJ/oUSS8Gw2kLIh3wzBcrbUy85T/ZpLIHYpkOBEhaSq4oWvjwf97j10
         lgGKjBc8PFKPI0nO6AITSWUvV5gfyeNEHxD0cwoZgQwmpj33Qc/hLe5gh66iLc97Vc7R
         5bMY+DulDQwW8PuTvh3N9XAGbNaeZkgrf2/pFJztgF+RxNm4lSH9lan2MvQQ8ugxoxPu
         bGQTdTMJ/cD2RRywNHkMG5Mv7bC7ElNXq/feuhH32so6OExvRX+X/PVVCCXqbwOINH2v
         LiubuCDQaN/llZ0PiLnWt98nxXZrrlo6selk46u1ECiwW2y5hVgFrqvg9pC41922vWCs
         5lvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kI6RlkgR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b199-v6si1806072ybg.753.2018.02.27.06.51.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 06:51:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kI6RlkgR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqgav-0005Hr-5u
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 09:51:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqgTU-0007hx-IB
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 09:43:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqgTT-0003WC-ME
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 09:43:24 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33584)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqgTT-0003V1-G0
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 09:43:23 -0500
Received: by mail-oi0-x241.google.com with SMTP id j81so11087911oia.0
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 06:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qkKaem/LleLJK0hNdut7wwxSvsnp9803ExnPtcwyHH4=;
	b=kI6RlkgRo3wNO/03vC93sN1IAfazDVGw9yQm/OFWgflaLK6wlsunZcbjjvqCPKyGSm
	2ndUM66GEmcEo0IfSdj4sS63CoDbe+g/XTs6I4SKVqQz6r8as4Ylg81Smw9bVPXBG/ZI
	qwXKUabnTJpAFaq5hFbzN+WmAPVF/SyLoQD88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qkKaem/LleLJK0hNdut7wwxSvsnp9803ExnPtcwyHH4=;
	b=bgAg9sqiO3CEHINNlFbaxTEpjwDzXleFzYgcJjpzHzMrJkUirwCuNafWIBDaA/XxBh
	x0+fYDFgxDyF6I5aB1m2k/4GGny7RBFO9q4tSCp8IGHOfebdd+dg3OedNzLmDtqsGoBJ
	T7CY8QA/LE9Fhwz6bWu/7W3x7C6CebLDjeQC5R7Y9WpI0B7sfztuYJORp/iJ36kCr6Yj
	iga2ZDWlg2jsATir4PRK95pIDxnATQXkvq1WBbC5lghfXop6LQ7Y5R4z3MidNuBEpnWE
	tIcXewu/41KievBgu08q+fU2KvHWi0lWl1W54142JPjAo8PIufdpfGdeyU2EKR/uY3gJ
	hL0g==
X-Gm-Message-State: APf1xPCuL+HAPZz0wI8xgBzN6/s4CVWvPMCOUYPVzIo6iUwlyKY9s0jP
	l+iyqCedVjIlq9fOrThL5ui3SLqf/rYVUtNC9Muqag==
X-Received: by 10.202.97.87 with SMTP id v84mr3677321oib.12.1519742602714;
	Tue, 27 Feb 2018 06:43:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 06:43:02 -0800 (PST)
In-Reply-To: <20180217182323.25885-55-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 14:43:02 +0000
Message-ID: <CAFEAcA_w-KRu6-eu6iPQmro72URL13AvyMwCK0b3d1T-RKV1ag@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v2 54/67] target/arm: Implement SVE
 prefetches
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bJv5jCMG80Sa

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c |  9 +++++++++
>  target/arm/sve.decode      | 23 +++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index ca49b94924..63c7a0e8d8 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -3958,3 +3958,12 @@ static void trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
>      do_mem_zpz(s, a->rd, a->pg, a->rm, a->scale * a->msz,
>                 cpu_reg_sp(s, a->rn), fn);
>  }
> +
> +/*
> + * Prefetches
> + */
> +
> +static void trans_PRF(DisasContext *s, arg_PRF *a, uint32_t insn)
> +{
> +    /* Prefetch is a nop within QEMU.  */
> +}
> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index edd9340c02..f0144aa2d0 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -801,6 +801,29 @@ LD1RQ_zprr 1010010 .. 00 ..... 000 ... ..... ..... \
>  LD1RQ_zpri     1010010 .. 00 0.... 001 ... ..... ..... \
>                 @rpri_load_msz nreg=0
>
> +# SVE 32-bit gather prefetch (scalar plus 32-bit scaled offsets)
> +PRF            1000010 00 -1 ----- 0-- --- ----- 0 ----
> +
> +# SVE 32-bit gather prefetch (vector plus immediate)
> +PRF            1000010 -- 00 ----- 111 --- ----- 0 ----
> +
> +# SVE contiguous prefetch (scalar plus immediate)
> +PRF            1000010 11 1- ----- 0-- --- ----- 0 ----
> +
> +# SVE contiguous prefetch (scalar plus scalar)
> +PRF            1000010 -- 00 ----- 110 --- ----- 0 ----

This one needs something slightly more complicated, because
Rm == 11111 has to be UnallocatedEncoding.

I checked the others and they don't have any unallocated cases
lurking in their decode pseudocode.

thanks
-- PMM
