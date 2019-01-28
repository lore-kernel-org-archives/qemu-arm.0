Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3153346wrt;
        Mon, 28 Jan 2019 03:14:35 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6Yia8mP/+mBdaPyozj8piRAWqPqxCp7uEOWO6Zcsxy5TfrIuNjokECJBWyDOwSsQm1VI+l
X-Received: by 2002:adf:f888:: with SMTP id u8mr20542065wrp.297.1548674075519;
        Mon, 28 Jan 2019 03:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548674075; cv=none;
        d=google.com; s=arc-20160816;
        b=wiXWG8bEpKEX1wRFwLEuDy5PFgMsrYf3u9bvmsnCjXvaV/MmgHeiipyoSH/R/mgNT1
         UMs9/DfIDgTuU9BjtafOuwIJiqHs9LT9SSZSKlR1LtWIM2GWLYcP0UjKELY28rgdSIuc
         jpOC00vYyzAqwJkx7oOr57MfJwUb32HZHr4UElTjY3p6HYC4ttLrPA2sXwX9bbK9lKIM
         qd27vPHcIZzSALXx1NJI9EEju3Gryz1KqIvHh4P5ChF0QSQQvUXqteujBjSDzdYGJWrE
         RM+QqIsjKVBbBjFt5DruUQB8BgK1n0Q2BZrxG/tSctBdmcn+kuJx8GBpI4pZofzz1nKx
         KofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXxNY1L6MK8QAuis1xW9bgvQT7OBrF8Y9qpUOWby/Ec=;
        b=FSrUeYIOGYetvUWGxyCWC04ATQOmnb8mWYDDt9b7v4/h5CRtSdrNn0d5ecqkrHgPRm
         cEPmJe79WAN6fsGxNj2k3jMRjyhQrupEcEnO/9uDaegaxWzbXgFCWys+NfOKfOQITudT
         LPCaPARi0/QTUMHgAzMDtlkX/XjEWeiAW0P8pzw3kWkZljQ1zVz1uQnUthtd1zXS4EGQ
         OyONK8BkEu0hfRNxoC1e8VORGEvfMlfTPJvtMMxcrYdtZxJ9EG3alt1Xjaa9366wcnr/
         i5QCTgpdcpi7arDvnQ0+qgwPC1RlxJjwC/sFdqNe9TzyO77TwcNYlJFSytfDwN83hlLV
         pPUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Dw/yZ2sl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p74si37088868wme.91.2019.01.28.03.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:14:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Dw/yZ2sl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4s6-0001TS-KB
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:14:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4qw-0000am-SP
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:13:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4qv-0006ru-TT
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:13:22 -0500
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142]:55586)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1go4qv-0006rn-PW; Mon, 28 Jan 2019 06:13:21 -0500
Received: by mail-it1-x142.google.com with SMTP id m62so19968342ith.5;
	Mon, 28 Jan 2019 03:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pXxNY1L6MK8QAuis1xW9bgvQT7OBrF8Y9qpUOWby/Ec=;
	b=Dw/yZ2slR9TH5/fuhoc6VqendD70AE2YEfUtNDAmijKQ1hs1IkAD5AS4zhF3qbPkM9
	0ECmazmYIGWIEYY/VzeHBYdng9AYNf9Wwo2yQygsyHQwg08bUZc6AdQI+e0Y30tXwfMa
	r+b9/uwuBJBpUwd91wo5i/iteEYICw130yfcvkyGiUmdWQRJhoL/scRs4bD2aOhAUbWw
	WJ5ojEntPMT6fif6tJtJraVwqd4PNocFshhNTfgsjPSB4AI85GGPWZ+pF71wyPO6kSTx
	rNaQdo7Hghwv07x7BMru2+WulE5Pp9BEkorlrKpEJlyDV8i4EFV/6v/6kqLuzBCIyNrY
	zsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pXxNY1L6MK8QAuis1xW9bgvQT7OBrF8Y9qpUOWby/Ec=;
	b=OL5mmZMoNBx4Lw994qliDR8x/fHHf+whFZTnMkGugXkhH/Q7v5ZZb7MURiPffIkAP+
	ziPM71va7713wh9fZ0p87VS3Bhs3COMzaYfVoEjROpACQ97duW/c8Ex8yp2EGNYGXCJr
	8ZPcZ0y+yDcp/Iuu+o1hUIIZA7LlKmfj4HzcuDb/2RYvKpgYWIhd6/uAXS2U6DmvWiVp
	UIz6b911j7/nOABfUcm/KSKAZFU/GTvhrOHeXXHDPib0bOFWB752UFhq2+/Njx83sSbY
	rLK8w+oU+5Cmf7GkrqfIJX3wHvg5lNhU09J1/jDoAgfzXUTYFd8yqyEk7cyfpwrGGGMX
	X2cA==
X-Gm-Message-State: AJcUukcLkpUCF6uFTNqtaYMpJXk5fccsUbIzyoCemB+lVcxuhTx3OZN3
	mqNJI+P9FVRxEEv8ccgoJbp0Ss3mqPgs8jCGjoQ=
X-Received: by 2002:a05:660c:fd2:: with SMTP id
	m18mr10037623itn.1.1548674001176; 
	Mon, 28 Jan 2019 03:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20190125182626.9221-1-peter.maydell@linaro.org>
	<20190125182626.9221-5-peter.maydell@linaro.org>
In-Reply-To: <20190125182626.9221-5-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 28 Jan 2019 12:13:31 +0100
Message-ID: <CABoDooMXYPCgXbwPRVtpbtEpdeewiRx8dStCaheFMf5rwJQ2pw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::142
Subject: Re: [Qemu-arm] [PATCH 4/7] target/arm/translate-a64: Don't
 underdecode SIMD ld/st single
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iO/faNVsrHCg

On Fri, Jan 25, 2019 at 7:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the AdvSIMD load/store single structure encodings, the
> non-post-indexed case should have zeroes in [20:16] (which is the
> Rm field for the post-indexed case). Bit 31 must also be zero
> (a check we got right in ldst_multiple but not here). Correctly
> UNDEF these unallocated encodings.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/translate-a64.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index c1f0cad7691..2cade64ed25 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -3409,6 +3409,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
>  {
>      int rt = extract32(insn, 0, 5);
>      int rn = extract32(insn, 5, 5);
> +    int rm = extract32(insn, 16, 5);
>      int size = extract32(insn, 10, 2);
>      int S = extract32(insn, 12, 1);
>      int opc = extract32(insn, 13, 3);
> @@ -3424,6 +3425,15 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
>      int ebytes, xs;
>      TCGv_i64 tcg_addr, tcg_rn, tcg_ebytes;
>
> +    if (extract32(insn, 31, 1)) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +    if (!is_postidx && rm != 0) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
>      switch (scale) {
>      case 3:
>          if (!is_load || S) {
> @@ -3501,7 +3511,6 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
>      }
>
>      if (is_postidx) {
> -        int rm = extract32(insn, 16, 5);
>          if (rm == 31) {
>              tcg_gen_mov_i64(tcg_rn, tcg_addr);
>          } else {
> --
> 2.20.1
>
