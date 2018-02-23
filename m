Received: by 10.28.71.27 with SMTP id u27csp1195320wma;
        Fri, 23 Feb 2018 15:59:41 -0800 (PST)
X-Received: by 2002:a17:902:6b83:: with SMTP id p3-v6mr3221899plk.18.1519430381492;
        Fri, 23 Feb 2018 15:59:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519430381; cv=none;
        d=google.com; s=arc-20160816;
        b=rDzThQ00EvUMk+65eFx/eLB6JJuqRGbLdXeJSYhpyhSmVe2Wse+BfMUi9R3WqSELqh
         bFb/yU+b8S7skrGIFllE6QSKisH3O/K8fhUA3yAonpMmrh90GBCicKyPpvHBn9mXdUaQ
         A/vNTShjCT+4P1Hzw+yZRBkkB3qq5+qkLEBWT4Mtvf+nO4Icq0LhFRZiwsbJqLIA18OI
         rkLAjzOIpXRJyVq0zB67dYwVRP3EFwEZqH7Fe1khdeawWcruO4x6fv4HXGROV7I03e8o
         7BDTx3DKwxRNYERd9uNTli17eSt27TxUdEYipAmGpzllCi6xIJuotdCrdLDWKj4LKO+f
         qJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=oEgd2XtoTSUYzni7RtM2dQKPkkUNt1pOt6N9OhAX73s=;
        b=XMldZhtW+DrBboXNH1d9nzcazjAY4cXVo0hE420cPiuO/rXYppcsxZXUGyCrFgtKgt
         5zAS7LNCM1+jptS7IXooJiSa/2s4fjyRGwW/LBj5Qcs2UQv77urB+NsC3uVJRb8MDZyJ
         rJxWrfy2LzzBU168lyEUoikUftfE327lHH5HFozUlMdA/VZPPcB5xRITW6Lya51aJMNt
         gVyT4E+3dA1tEBPDnBgIpj9c+4XcP/+Kb44lHveBkQ7ng+th4UKlzTaPWkZv7Xea96PF
         29vA68kSeFoFdfKoBCokr2Tt6kVgYZSjvgATxIXWBIyqzmDCmePMr1f/rNy7j5Y99NvC
         OC2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eoPNAYko;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y96-v6sor1303248plh.53.2018.02.23.15.59.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 15:59:41 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eoPNAYko;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oEgd2XtoTSUYzni7RtM2dQKPkkUNt1pOt6N9OhAX73s=;
        b=eoPNAYko0LVLE7L2DoglCvVCplDltoYkkARz7SI/SFrWFBNWUdMipG4EeAsjGN5QAe
         erv2KVWj2enzBzuYMokkEXFJgwMX7/zQpnFgogdKH0oB97kLUr3PTwLA+NQ0cIMeBoLr
         eU4V47eaIN1WVzR+dPhfnDwluqIP+k3Wlnb7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oEgd2XtoTSUYzni7RtM2dQKPkkUNt1pOt6N9OhAX73s=;
        b=BBiKvYDpfZnS9ozqu/DeZOFD2ZwS4ElxfNxLkoHB86w6w5cZDLlpewyKgvgenZFafQ
         o1v2S2WMkpBG4ZmfG9m6GLTtwMqSB030m1DV+LzTGk/dGmsJx5XAB+0RkcN+oPvZ2IIr
         HeMUhidP8EaC4z2wRDYCxEWLKOYYmGHNtTQUbiSjVbHIs25g3YTsQ/oHXrHqMvqNKQCC
         ZvBY7KZkBEs1F71Ox3xWggbgsOgIjMJXEqZmtXtqJEguYiQJ7ey1tdMEIf9yOyTeFKFm
         avFpimR95QbAKalY4Bkots6OrRX475i3HrKUQ+Dsi+RGrLtueDomjRdjBI8lgYq1Pace
         UXCg==
X-Gm-Message-State: APf1xPAhSyvfmf7yaCnAYXsogY9UY1cDnqcspXCTioMZ7s5P9lewZ0nh
	1P23TRCgVSQV91EZAtP/6P1C+hol
X-Google-Smtp-Source: AH8x225m8wsBTaSmxn9+HnVfl8MbN8omQtdr6oAE7620lJF3UN4c6ucQg+P4Wr/pZJHwlP00HA0VZA==
X-Received: by 2002:a17:902:7f0b:: with SMTP id d11-v6mr3349417plm.350.1519430381047;
        Fri, 23 Feb 2018 15:59:41 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id 14sm4257497pga.53.2018.02.23.15.59.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 15:59:40 -0800 (PST)
Subject: Re: [PATCH v3 13/31] arm/translate-a64: add FP16 pairwise ops
 simd_three_reg_same_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
 <20180223153636.29809-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10368265-15cd-a473-f8a6-83c075bce825@linaro.org>
Date: Fri, 23 Feb 2018 15:59:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ZotoUdsulWXY

On 02/23/2018 07:36 AM, Alex Bennée wrote:
> This includes FMAXNMP, FADDP, FMAXP, FMINNMP, FMINP.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - checkpatch fixes
> ---
>  target/arm/translate-a64.c | 208 +++++++++++++++++++++++++++++----------------
>  1 file changed, 133 insertions(+), 75 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
