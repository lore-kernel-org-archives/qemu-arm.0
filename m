Received: by 10.25.208.211 with SMTP id h202csp2937261lfg;
        Thu, 25 Feb 2016 09:41:19 -0800 (PST)
X-Received: by 10.31.182.18 with SMTP id g18mr38070582vkf.73.1456422079882;
        Thu, 25 Feb 2016 09:41:19 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com. [2607:f8b0:400c:c05::22d])
        by mx.google.com with ESMTPS id q207si5945133vkq.126.2016.02.25.09.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Feb 2016 09:41:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22d as permitted sender) client-ip=2607:f8b0:400c:c05::22d;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22d as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22d.google.com with SMTP id c3so54431761vkb.3
        for <alex.bennee@linaro.org>; Thu, 25 Feb 2016 09:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=RRUqGMXJIq9jamX0vORLzwEKCTpZDjxbO+OCzjHJfUs=;
        b=H+l8usd4ZUGfH4Xn84X2er5QMaVnnIRp2KptGLQItPXpBNhP6qX3gEW15ODF0DkCit
         pR5wzIdcaNjyyColn8GvOBpx0dUgIC6zh0woAZgDNeurUhMx6kDGac9dsaDTpCgbfOWq
         QI2i99lFEcF9fT93k4SE7BgWKrEfZeFD8Xxds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=RRUqGMXJIq9jamX0vORLzwEKCTpZDjxbO+OCzjHJfUs=;
        b=QCpt3RtzZ3O/mWEWvnNGmWnqCKDp0I3G8WCn4qM1yTuDmKPz+b3aQXx4CT/1AQ3EFR
         h/8b7sT+vwGwx3oUSg+Fv3Hrug0lPq2FNEvG1cMUUnoViPZ6rVmDv9KGGDjxzFT2jdKF
         VpmXcMgTGrdkSR6iVGqyfhg5WiFyWLwwiqIOivz4GGoeuTSOrABjwjxnqRWXk/OBrTCm
         fVzxRzVgNobzn9wW5AW7zXMDUBWwU65ZJhQlq/hmB7URwLTkr3HfNykFmHFQcGQKeG1c
         pUCJvvYadOVJVxLVxtKa1UsqssrYNsdahvXufiJB/UqBziPAQ5jXtRYflER1L7fMKkbs
         zM3Q==
X-Gm-Message-State: AG10YOTZ34h2H7fwsbLqi5cZChTOfFDufBiS9Lpu5AYiCnAj3xowFC58dupJiIfHuxE0F+eXnM8i9VlGMYrWwgDECu4=
X-Received: by 10.31.194.130 with SMTP id s124mr37079639vkf.92.1456422079487;
 Thu, 25 Feb 2016 09:41:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 09:41:00 -0800 (PST)
In-Reply-To: <1455912292-23807-5-git-send-email-edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com> <1455912292-23807-5-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 17:41:00 +0000
Message-ID: <CAFEAcA9c7OAF1Lqw1=xd3n+ipuYvo_9AW42wW0JwXM+L4e8iww@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] target-arm: Add more fields to the data abort
 syndrome generator
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: FRVoei3EBNS7

On 19 February 2016 at 20:04, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add the following flags to the data abort syndrome generator:
> * isv - Instruction syndrome valid
> * sas - Syndrome access size
> * sse - Syndrome sign extend
> * srt - Syndrome register transfer
> * sf  - Sixty-Four bit register width
> * ar  - Acquire/Release
>
> These flags are not yet used, so this patch has no functional change.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target-arm/internals.h | 20 ++++++++++++++++++--
>  target-arm/op_helper.c |  8 ++++++--
>  2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/target-arm/internals.h b/target-arm/internals.h
> index 34e2688..4e9d9f5 100644
> --- a/target-arm/internals.h
> +++ b/target-arm/internals.h
> @@ -383,13 +383,29 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
>          | (ea << 9) | (s1ptw << 7) | fsc;
>  }
>
> -static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
> +static inline uint32_t syn_data_abort(int same_el, int isv,
> +                                      int sas, int sse, int srt,
> +                                      int sf, int ar,
> +                                      int ea, int cm, int s1ptw,
>                                        int wnr, int fsc,
>                                        bool is_16bit)

Everywhere we call this (both now and once the full patchset has
been applied) isv is a constant (either 0 or 1). I think it might
be cleaner to define both a syn_data_abort_with_isv() and a
syn_data_abort_no_isv(). Then the no_isv version doesn't need all
the arguments that are zeroes.

thanks
-- PMM
