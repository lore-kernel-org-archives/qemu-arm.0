Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp101936wrq;
        Thu, 7 Feb 2019 09:38:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IboCfeH8qTM8j4C76oy7aIVwBXThC/0pWAaaAHOpsafVeONMGJYkow+9Y9qbAenYZdX19ki
X-Received: by 2002:a25:74d3:: with SMTP id p202mr2194989ybc.275.1549561138576;
        Thu, 07 Feb 2019 09:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549561138; cv=none;
        d=google.com; s=arc-20160816;
        b=lFVRpZ4qbRmdeAXy0Skgzeqgs7DCM0wDXdSZOh06Xyi856uQl6xW3uph9CCw3x2ao7
         v1mgvSKjg9KOQjv6mRSCkHbaM+v34KtD+7U0Uo2wGI7p2Il44S+/pD+B0/Ty2y6I/uZw
         oNMJvWkrVToyW3dWmzGgBPY/e6AcFN8RULbj4l7ldIuhkc4xNIcEEn4A7l3bB43atK/G
         vG9gaYqHeGHEAnFjYgE1ECaEZDVR9lQE28o4MM4dnzB3xjqiloHMHz0ljcyWJw/6UzJL
         QFj4EDy5IfZNtOra8WMCOocX0voBEduuX8X6TNdgCV1dBTiT63+ima2o8XDKrOD7+/GE
         +03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YAV5OylaCpqsJG7eTmt3JdjZ8Rb4Lo9/TB7vGhJnuq0=;
        b=JOnxQu2DdTdH9dtOcIIFVGvk7Tx7oitt/7lmFFzIyELaJbT9REUD8/csIW/V6v2tss
         HtjcMBNw/dSW0qRsyyM/kCO9XYS3F3A5KVKA2gwDSFgJQxs0QviL7/FCDDqlkFDZo0vS
         QCE6TmW609i7W8r/g1zgPQP3LmHcd7UwHEn73+rR7e6OcoGeH+LhOrs8qvzJMDw5sQjb
         TqEqOGQYptSFGUnsJgb4jHzGJ+NiTnaF0NI7YJL87pKHpQn72SBWdhuqgZp9natOODGO
         rEyQLmpWfP+EI01ta7iO1f5qMZZXL3alfWek9mVJx7ZgThLhMyc0mY4H9bWxO3lL7Ryk
         ze0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=daPGhsE7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l142si1600513ywl.296.2019.02.07.09.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 09:38:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=daPGhsE7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grnda-0000Un-1e
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 12:38:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grndS-0000Ue-Ex
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:38:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grndQ-0002Dn-CU
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:38:50 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grndH-0002B1-4q
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:38:40 -0500
Received: by mail-ot1-x344.google.com with SMTP id a11so1139870otr.10
	for <qemu-arm@nongnu.org>; Thu, 07 Feb 2019 09:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YAV5OylaCpqsJG7eTmt3JdjZ8Rb4Lo9/TB7vGhJnuq0=;
	b=daPGhsE7uFFcTDY/laHpBtFoKHhvQ/ycJfM/Ib7EfrowO8IcxfWZLbk9CeTOyxxquO
	o+FR8tUmWrTAP9ejm3VTGKr8/HXvLZdF5XAjF4pSGoFewpbrbcdKVSGbCGYfPovIeGu4
	Ml6FTFEu/edjqJ1TXGNBGFW1PFjepCsPsyCshv6MmFTVKMkkLZwJRLrylqrXXQLOIJ5C
	bC6G9SYpBLyYkencaq7IaH02YGmowTPsjQjac4l/i99bZuud+60b/uFLYLcQx1BB/qVQ
	EQBRj7M6sltiuarYAMm7nSfBxgPGLJP7AMENAnn/ITqqgd2IOXMjUTnBE18En46w8ARZ
	vTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YAV5OylaCpqsJG7eTmt3JdjZ8Rb4Lo9/TB7vGhJnuq0=;
	b=uNyMdm1But/Ewvg/ozT3LGKuQu7Z7EpWWdErpM6r7UoexitS1rCaElWuRxvspTv42t
	1zHk1gcsG4Sva7imuXX4eZpKc21FudavTq7X0hlVXIvXVMbnuol0aZmkKpAuI5Upkg8S
	2KCMjqIsEO7e9LK8TYOeb2Uqme+ebriuV9+3bl/E3DLkLajm46kr+EhQAFN7aPq2Zd9q
	Oe0c/p+HZH+Tikd04KBiUfNDwxbnpExMwjkxZoOZLbrpuZsaTRAop5FMPmqnxPgVNWz2
	CaXzBhPzbiUCdY//LyClBOa2kXvXos41c64qOgNA5iR3GpvGqxn8DZ5ola6kt9VHazu0
	2Frw==
X-Gm-Message-State: AHQUAuZJKIQUcOGgFAmG0IKvywkvhbpgFZzjb6YeiTjEgYA+/qAGXHx0
	B8ZirC4F44XoXJnwy21JLkjPwsWdVxgXamMV0ANW0w==
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr9404761otc.238.1549561113469; 
	Thu, 07 Feb 2019 09:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-10-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 17:38:21 +0000
Message-ID: <CAFEAcA8LJFuA_NguXbLooebcw6X2-9hpUdgBwSv70evAdR=gQA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 09/17] target/arm: Implement the SUBP
 instruction
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
X-TUID: Yzl+9j9xxY4y

On Mon, 14 Jan 2019 at 01:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 6583ad93b1..98ff60c161 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -5111,19 +5111,39 @@ static void handle_crc32(DisasContext *s,
>   */
>  static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
>  {
> -    unsigned int sf, rm, opcode, rn, rd;
> +    unsigned int sf, rm, opcode, rn, rd, setflag;
>      sf = extract32(insn, 31, 1);
> +    setflag = extract32(insn, 29, 1);
>      rm = extract32(insn, 16, 5);
>      opcode = extract32(insn, 10, 6);
>      rn = extract32(insn, 5, 5);
>      rd = extract32(insn, 0, 5);
>
> -    if (extract32(insn, 29, 1)) {
> +    if (setflag && opcode != 0) {
>          unallocated_encoding(s);
>          return;
>      }
>
>      switch (opcode) {
> +    case 0: /* SUBP(S) */
> +        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
> +            goto do_unallocated;
> +        } else {
> +            TCGv_i64 tcg_n, tcg_m, tcg_d;
> +
> +            tcg_n = read_cpu_reg_sp(s, rn, true);
> +            tcg_m = read_cpu_reg_sp(s, rm, true);
> +            tcg_gen_sextract_i64(tcg_n, tcg_n, 0, 55);
> +            tcg_gen_sextract_i64(tcg_m, tcg_m, 0, 55);

Shouldn't the lengths here be 56, not 55 ? We're doing the
sign-extend of bits [55:0] to 64 bits.

> +            tcg_d = cpu_reg(s, rd);
> +
> +            if (setflag) {
> +                gen_sub_CC(true, tcg_d, tcg_n, tcg_m);
> +            } else {
> +                tcg_gen_sub_i64(tcg_d, tcg_n, tcg_m);
> +            }
> +        }
> +        break;
>      case 2: /* UDIV */
>          handle_div(s, false, sf, rm, rn, rd);
>          break;
> --
> 2.17.2

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
