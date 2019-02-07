Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp18247wrq;
        Thu, 7 Feb 2019 08:22:45 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZP2mLp+KUK4K5Mx2Kq6fXmeAu+QjQFBBV8tRuCqR5JHXBVZ8QVfqGxJFQdo01t6WTk2FT1
X-Received: by 2002:a5b:8:: with SMTP id a8mr6823080ybp.75.1549556565356;
        Thu, 07 Feb 2019 08:22:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549556565; cv=none;
        d=google.com; s=arc-20160816;
        b=jNzw6ROy11ZyS+EBEx7rfqHTa8VtlKFNuQnNp2ylXKoMr/RQJDCG/bHFMsRQs9sYUT
         e5chtkdxaJcH8wSIzTd5lD0fPlJ54/v27TvoEBhk1Yo/HLNOzOmeRRjbMr5GUDaIJtsy
         N9ZV7SDXNcJINz7orflWnqVAbKJsqFD7PlKteqZxW/fdiQ3VFJ2YXLXtlcbaaMpaHR5T
         PkgrJE4UTyvGaiV/v6+N65SLHAiRU+BPXFsyN4Db1Qkkizj4sCPOWALIYV69wZUKjV8H
         HpzcF7nPnk4DHe/yjuYDbBh0tGQxvUar6bxMjI1VivrOd56wij+9tn8Iz8UYEp34aRDV
         kFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fF94GIXjCbNPx20SwLvGEE7ICaB4nuGJBJKWEV2mbN8=;
        b=SkPi4i9bYny8OxxHrRn5xQ5K3gtlld2Us9Rb4m5xkZ9xz6PxgJOEzYvREOSzDQRtzd
         wz3onwWIAc0zLVTP7SR2riHgLQmmvrbIDBOg2NhPI/osNz2bWm4GK6WAhX49IB6ULFbt
         Fjq4TFD8xL83i/nchIoOqGzHisPsq5y01bVqymEVcCaOOluIlA98BmKXodrn8NK+BgNt
         Sgw+TBAD+vwQhSW00YgkJ/8wU5f1VG/Nqr1QGA+eemVLGQ19CeVG1KykFpc8BDyEDi9V
         a1dT2U+XTcI+K1wex6SDNBlA6dBYS7JzfTOHcUubCePbDphcFozd35eYl7rTD3b4QAtN
         ljlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fnhhpsX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si5747968ywe.195.2019.02.07.08.22.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 08:22:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fnhhpsX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grmRo-0003Sl-OO
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 11:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grmNB-0008UG-Pg
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 11:17:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grmNA-0006Up-QR
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 11:17:57 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grmNA-0006Bf-Es
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 11:17:56 -0500
Received: by mail-ot1-x341.google.com with SMTP id a11so646103otr.10
	for <qemu-arm@nongnu.org>; Thu, 07 Feb 2019 08:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fF94GIXjCbNPx20SwLvGEE7ICaB4nuGJBJKWEV2mbN8=;
	b=fnhhpsX7mFJtWS0JhN8uC+LVNZ6UtBlqL59trdFuKy/SEz/aQFtdytzHlhY+tsqUn8
	BwL+vK6kO3kKEpBEr0j3tf0O8+snTzU87Ffbk89U/ggxWUO1kZhqvLF2GA+g6eHIjTqj
	7qdoSn6z3TIVfd08mtvUSZ4SX9QNeVqkfiT5bHzpAyXGET1shr4HxwA+sYHw2v7cCm6/
	e1nHWdAdkVEYpnEwb8hQQEV/cxSvHUqBJk0FSE461jr3gWXtGOW3gugvTZEQZcKh+j9A
	N7iRh1qpqzGo9j8F28kHmz9sIf2j4tLCmMvrmtTbJ+pS89cMP2mfqhTPKxcEiaDGduEk
	dTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fF94GIXjCbNPx20SwLvGEE7ICaB4nuGJBJKWEV2mbN8=;
	b=lyTL/d0j1U3wPPx/yy58P9SB1owqXH0ka9PXBwp1wknFcIzNRdvwNJxCNtEeC+grCL
	ttmEIVhjpQoHUkKcxJYK2ntFAO9cE5A0rTnLPh8lH9C7AkKPo8QX0HaXbe8o03R8KpZd
	hlbeqwIpkSEi8JuEPslUxkEpAr3Uws7H8Zg5Sb6Edg1HywEjc4JdCw1BoEOA9KY7d37V
	jbGAtJd7bF4YMXXLM1J9p9AMTOqW7WP4BaayABG8jJmv/8GWTubT4ftlBxxjPNBI3qF4
	ShG9X3BACkntHmBVM8NJt+QcdndmKtAes/Cf7eUVXu6cB4rOeJPTmrMwd2ZMqcI7F8cl
	oZDw==
X-Gm-Message-State: AHQUAua/+BdILitGPo7uT0GCBSceC+u7UnBilNJF0l4JWiTTt69VqfB+
	YPsxpX88Yx4/O7EigtBdEWvjYQK5aWNTayp1KOpmnQ==
X-Received: by 2002:a9d:7d18:: with SMTP id v24mr1445848otn.352.1549556245927; 
	Thu, 07 Feb 2019 08:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-6-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 16:17:14 +0000
Message-ID: <CAFEAcA-EA9DHLiuJc=GBjQo6ajN_nU7EhEY_yniEbke5NgWK5Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 05/17] target/arm: Suppress tag check for
 sp+offset
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
X-TUID: 4Z9Erd7ovHn8

On Mon, 14 Jan 2019 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> R0078 specifies that base register, or base register plus immediate
> offset, is unchecked when the base register is SP.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 37 ++++++++++++++++++-------------------
>  1 file changed, 18 insertions(+), 19 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 5c2577a9ac..ee95ba7165 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -336,12 +336,11 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
>   * This is always a fresh temporary, as we need to be able to
>   * increment this independently of a dirty write-back address.
>   */
> -static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
> +static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr, bool sp_off)

I think sp_off is not sufficiently general here. For instance
if you look at the pseudocode for LDR (immediate)
 https://developer.arm.com/docs/ddi0596/b/base-instructions-alphabetic-order/ldr-immediate-load-register-immediate
we do the tag check if wback || n != 31.

That is, when the spec says "base register only, or base register
plus immediate offset addressing form", it is referencing the
list of addressing modes in the v8A Arm ARM DDA0487D.a C1.3.3,
and "pre-indexed" and "post-indexed" are separate from "base + immediate".
It looks like your patch is treating pre-indexed and
post-indexed the same as base+imm.

thanks
-- PMM
