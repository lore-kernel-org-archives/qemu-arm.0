Received: by 10.28.71.27 with SMTP id u27csp4891651wma;
        Tue, 27 Feb 2018 06:36:49 -0800 (PST)
X-Google-Smtp-Source: AG47ELvHQZmDm3gsJtJVBg6YUHrzd9ePka5jQAZr5tkMPaF4akZxRFyqXQX8pDEVuPLtpY5OeF6Q
X-Received: by 10.13.254.199 with SMTP id o190mr3162183ywf.8.1519742209538;
        Tue, 27 Feb 2018 06:36:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519742209; cv=none;
        d=google.com; s=arc-20160816;
        b=zx30QD45SrjmwiDfhjXzzAI5BkBTd6TycMjjMi8imIqToDaYkF9SwA1F37ZbcCqYKf
         L4bssHELsc+l9WrWRhcwGxeNuHr4jUCIyIP1jVN8gNhqdQhhxNE2mEh1bSuA0jsc/+Gv
         a+IpAoHBs0I2kgIA5zaEZf18NlSQUhKRR5wjWT4H9W0sA4dbmAD925pHqhNZi+RU5QyR
         8RyrRG1An+F6kIMQLop/c9/+EMu/sL24Q9rmA66WfhK5+OHUMPi9WFgbpdyrWhGMNGCA
         wWi49yAfpadxxOToo0NvBcPf6aUdemLEWiRyoj+CuBZqJfwUzP/UpJxSpAoLuZPkXCcu
         EYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bMwm9mwDEEmdyYQc6kDGS7KslmCi4X2AtXS+M5OwBf8=;
        b=VW3L/g1dOdp74n4g0c/8Qmaa5SF9LKUJ2of175hsgvIl7/6W/ZALx/zRMEIGlVgzDd
         /m0FX5uoHU3vzgi0Lx5MJdnP1jEcwL7SPBb/MtNe0bew9PifTaiLVoordFy3gwdSarVC
         zNKSbQUJvB5iU1/hMG30RBl1cNnXfKzu4HAUINUDZWL2ORF2r3yaOZbFdOmsHEyKg8Bj
         RqKM9eqJcwNvm1k+L5fumizuh5XEK41+0wJualrTaD0kH7ReHMIpdztnNlyha66QqbWB
         /8orKkp0FBrFXmXf9SGfRQJP62vQj4Ro1q/9V97uD0nL2MwEQwN9Q6tTqdWl/Nz5e2gJ
         Onlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QvCU67Sy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7-v6si1888552ybj.768.2018.02.27.06.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 06:36:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QvCU67Sy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqgN7-0001jf-0r
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 09:36:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqgMx-0001it-F4
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:36:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqgMw-000726-AQ
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:36:39 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:35216)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqgMw-00071i-1g
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:36:38 -0500
Received: by mail-ot0-x244.google.com with SMTP id w2so1384309otg.2
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 06:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bMwm9mwDEEmdyYQc6kDGS7KslmCi4X2AtXS+M5OwBf8=;
	b=QvCU67SybCAHApoBxel+gxpGuAc0MmXnQKir/szAIP2+KHiKgzQBDhhtnQAg3j4ft0
	qe6gS/PB1DiQzNDLzMKg77VW+lEf/nNmHLpZiFTWL/CHRW+wZK94UC40V1AO4QAuUg4j
	FZknti3itwyY7013byfl+HQ8CxDNAVIdYtNFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bMwm9mwDEEmdyYQc6kDGS7KslmCi4X2AtXS+M5OwBf8=;
	b=Mq/ngPMhjEdquYBk54NFYcTogf6YAnAHs17545aCwy3jjcPm8G9FWnX/Y9lMY3xn1i
	cAvZuhqKHlQGuwbSklns48HQUk0HVBboTRgwUkyqRC2w6OucUQb9/olgwG0hx/nvAzUU
	gUf0zOQbxSOict/h7BPzUBq2R7mPhaTdvqX1CxW0BLUdfraIerFNoWpNQJ7pfT0uU4yt
	ifNUFAEQvY3YG7vQ2WZKsGF1149InjUwkTBVnWjR7vtLcOHfer0lOQCK9RQj+qHYWJ5z
	fgKK2zqDspqrU+Qfrhh/vrxCmXpaX4jdiEYDmG4wjHAvmxaJDwtlGsv4xbexJB8tsNMq
	GRpA==
X-Gm-Message-State: APf1xPD9kAunzo8IBxZcvIyaVhbw9IBnhEGy7ngGv28pjHu4tc+/gLKH
	IQyz0cQqY7k2yyABSt3VjdIIhiKaS5x+78vB0ExGkA==
X-Received: by 10.157.23.34 with SMTP id i34mr11110542ota.210.1519742197048;
	Tue, 27 Feb 2018 06:36:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 06:36:16 -0800 (PST)
In-Reply-To: <20180217182323.25885-54-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 14:36:16 +0000
Message-ID: <CAFEAcA8Zt6S2x=bZ6Vxs8T07D6fpMGoYZP38csaKvKsYjyvjxA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 53/67] target/arm: Implement
 SVE scatter stores
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
X-TUID: XJ6p7XKqcUGW

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 41 ++++++++++++++++++++++++++
>  target/arm/sve_helper.c    | 62 ++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 39 +++++++++++++++++++++++++
>  4 files changed, 213 insertions(+)


> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 5d8e1481d7..edd9340c02 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -81,6 +81,7 @@
>  &rpri_load     rd pg rn imm dtype nreg
>  &rprr_store    rd pg rn rm msz esz nreg
>  &rpri_store    rd pg rn imm msz esz nreg
> +&rprr_scatter_store    rd pg rn rm esz msz xs scale
>
>  ###########################################################################
>  # Named instruction formats.  These are generally used to
> @@ -199,6 +200,8 @@
>  @rpri_store_msz     ....... msz:2 .. . imm:s4 ... pg:3 rn:5 rd:5    &rpri_store
>  @rprr_store_esz_n0  ....... ..    esz:2  rm:5 ... pg:3 rn:5 rd:5 \
>                     &rprr_store nreg=0
> +@rprr_scatter_store ....... msz:2 ..     rm:5 ... pg:3 rn:5 rd:5 \
> +                   &rprr_scatter_store
>
>  ###########################################################################
>  # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
> @@ -832,3 +835,39 @@ ST_zpri            1110010 .. nreg:2 1.... 111 ... ..... ..... \
>  # SVE store multiple structures (scalar plus scalar)         (nreg != 0)
>  ST_zprr                1110010 msz:2 nreg:2 ..... 011 ... ..... ..... \
>                 @rprr_store esz=%size_23
> +
> +# SVE 32-bit scatter store (scalar plus 32-bit scaled offsets)
> +# Require msz > 0 && msz <= esz.
> +ST1_zprz       1110010 .. 11 ..... 100 ... ..... ..... \
> +               @rprr_scatter_store xs=0 esz=2 scale=1
> +ST1_zprz       1110010 .. 11 ..... 110 ... ..... ..... \
> +               @rprr_scatter_store xs=1 esz=2 scale=1
> +
> +# SVE 32-bit scatter store (scalar plus 32-bit unscaled offsets)
> +# Require msz <= esz.
> +ST1_zprz       1110010 .. 10 ..... 100 ... ..... ..... \
> +               @rprr_scatter_store xs=0 esz=2 scale=0
> +ST1_zprz       1110010 .. 10 ..... 110 ... ..... ..... \
> +               @rprr_scatter_store xs=1 esz=2 scale=0
> +
> +# SVE 64-bit scatter store (scalar plus 64-bit scaled offset)
> +# Require msz > 0
> +ST1_zprz       1110010 .. 01 ..... 101 ... ..... ..... \
> +               @rprr_scatter_store xs=2 esz=3 scale=1
> +
> +# SVE 64-bit scatter store (scalar plus 64-bit unscaled offset)
> +ST1_zprz       1110010 .. 00 ..... 101 ... ..... ..... \
> +               @rprr_scatter_store xs=2 esz=3 scale=0
> +
> +# SVE 64-bit scatter store (scalar plus unpacked 32-bit scaled offset)
> +# Require msz > 0
> +ST1_zprz       1110010 .. 01 ..... 100 ... ..... ..... \
> +               @rprr_scatter_store xs=0 esz=3 scale=1
> +ST1_zprz       1110010 .. 01 ..... 110 ... ..... ..... \
> +               @rprr_scatter_store xs=1 esz=3 scale=1
> +
> +# SVE 64-bit scatter store (scalar plus unpacked 32-bit unscaled offset)
> +ST1_zprz       1110010 .. 00 ..... 100 ... ..... ..... \
> +               @rprr_scatter_store xs=0 esz=3 scale=0
> +ST1_zprz       1110010 .. 00 ..... 110 ... ..... ..... \
> +               @rprr_scatter_store xs=1 esz=3 scale=0


Could you write all these with the 'scale=n' part picked up from bit 21,
rather than one pattern for scale=0 and one for scale=1 ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
