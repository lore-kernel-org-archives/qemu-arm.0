Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1559678lfk;
        Wed, 2 Feb 2022 18:58:17 -0800 (PST)
X-Received: by 2002:a05:6a00:984:: with SMTP id u4mr32319825pfg.67.1643857097099;
        Wed, 02 Feb 2022 18:58:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643857097; cv=none;
        d=google.com; s=arc-20160816;
        b=E8KPESC787TACq63XBTR/93N/HI2IHnH+y5s91/GdDOyEsvrZ/MLSRvMtD+U5AQtqJ
         JmIbrVo+QE2wk3DCyWHF5u9mBOEeDOxlJ8YgOr+FaVEMv73e3l9eeCE8JqOActPUW3fQ
         uH6zrha8UTjEg3TT2fkR9ca9t1JgcISj+THQ01Wa9Z3dwNZOfMzAbTN+wbJ+loWDtMup
         7+Rjy1sROsQjlWG+raLbZjKg53pl47jlYXdDB0leeqODokQ5yD0K9MnwzgrCFfzAC86Z
         4blPQLTfmJbpzveXYgr4v6ObphFqtz/MKX4TLt5miZGXpHTctxQM4pRELEMqObrH926p
         X80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OwMiNcFpEV9TQ18cpTwtoblYfWItwdN8HP6ecwJ3UBY=;
        b=YM9QmZEKNcj8JQdJgOdN2S7X4q2kk6g/tBrSe2Kaxf9W7FvJ2lcIU5zWGaVZ1nwAUY
         eY9fKtn133RBgEkn15yuEYVVUrNQjfzMKTo2UAnZkIYCZj2sPzkXuiWeSl3QXJca7GH1
         7/msxiXU4Znk/sKeBLj1eSkxDPFaM7HGTn6eyt+C5jjr9oIEqL/Kv7rFWus8+ntyioSr
         l6eZGBUBTHdXxayoKmwMHEiHNecAc1KGxBdDVm6JLz1BcqMVRNgumeAtYhfc8zNe+VZ/
         hisddCbazkP0i6v+DzatRjDaJVJMCeFAJ16flu80n56x7A2MZpQk/g0QvZ8KsELihEti
         md+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXHAOfN1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y15sor746137plr.144.2022.02.02.18.58.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 18:58:17 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXHAOfN1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OwMiNcFpEV9TQ18cpTwtoblYfWItwdN8HP6ecwJ3UBY=;
        b=PXHAOfN1bYQBdBKpPx16vywgyPQxyum4QCSmXGIIl8XaRFoqcSoJxAWZyMdc2WhGPX
         vfaT+36xeb1sW8/oEZFQyhtHHhH9IpXKzcGKx7fy/V/DKdtUKW+SSM67kwpteHLCPpQI
         lpZcCJasJ3LNGc97xjRcFHsTCUzvgabXO3SuoOounJpdUlLSsk1Wq290103iaBBghjn1
         QRMSAdRjvaCyOwyobQMx4jbpckES4vhZTeqMHwMXTCrz0Q0xg5a1WGHQBNJ/u49FI73G
         zCx3WHx1luTgrc2ysiI7MH7/NL2we1qlt20obsv87/ivUa4vzQID0IXifhKbHubkVm/a
         x9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OwMiNcFpEV9TQ18cpTwtoblYfWItwdN8HP6ecwJ3UBY=;
        b=dMvI7hxLUnFiHeSGaUz4DnxE/Kp5TT9RdUgOjzwCl3PXiRMY3J3/tGhXgps68W81Sb
         NDRHasFTQ6TaMaoc49CTRJHJeivqdmis/3vt3ZXvO7WN3WCd4X5YM5+z0OTJS4/aEo4k
         hXJwlHhBrn/tcigr/W0aaJxlBGuRoyxT5DvBVYOuvb7Oh/qtAnrSGNLokxRENtJL9YrI
         /2Ld19ZeAqtr/f2XlDtaLStz77o9+O7NVojeTXN16NjLtbHHlA1EqMD+tqRbICRJTSV/
         IT2CK4BWtiKIx0/ydhjWYCESTVKN1ehvHulqj3bN1TaZ6FK9DcIt4rHH+TdPSTSjKidh
         uGtA==
X-Gm-Message-State: AOAM533/cU905IkvilNnwJ0/XGjuKiuifRJjew9PO06yoBinkZ0uK3bZ
	1WMWeP3lQo4AjSDtfBdZWEtlF7kK
X-Google-Smtp-Source: ABdhPJwm/rLJsgReeusNU8lvOtCtpGbCXhiOVKkZ0xEWHpxFZwP51/Hu9KqNalk1K7rcUEm+TF16+A==
X-Received: by 2002:a17:90a:df0e:: with SMTP id gp14mr11596392pjb.57.1643857096540;
        Wed, 02 Feb 2022 18:58:16 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id na5sm8872752pjb.23.2022.02.02.18.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 18:58:16 -0800 (PST)
Message-ID: <36c9ebd7-69d9-f64d-4612-b519c1c40204@linaro.org>
Date: Thu, 3 Feb 2022 13:58:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/13] hw/intc/arm_gicv3_its: Keep CTEs as a struct, not a
 raw uint64_t
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: IUAuNzMBhd5Z

On 2/2/22 06:31, Peter Maydell wrote:
> In the ITS, a CTE is an entry in the collection table, which contains
> multiple fields. Currently the function get_cte() which reads one
> entry from the device table returns a success/failure boolean and
> passes back the raw 64-bit integer CTE value via a pointer argument.
> We then extract fields from the CTE as we need them.
> 
> Create a real C struct with the same fields as the CTE, and
> populate it in get_cte(), so that that function and update_cte()
> are the only ones which need to care about the in-guest-memory
> format of the CTE.
> 
> This brings get_cte()'s API into line with get_dte().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 96 ++++++++++++++++++++++-------------------
>   1 file changed, 52 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
