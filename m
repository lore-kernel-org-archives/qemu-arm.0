Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3839623eje;
        Thu, 13 Jul 2023 23:47:18 -0700 (PDT)
X-Received: by 2002:a05:6870:9a01:b0:1b3:db4a:9701 with SMTP id fo1-20020a0568709a0100b001b3db4a9701mr4767155oab.41.1689317238215;
        Thu, 13 Jul 2023 23:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689317238; cv=none;
        d=google.com; s=arc-20160816;
        b=b/DPj3u+VH+MEix1ppaNKRyIkHCSLoTKtHADmQyh0HYY9hWj/X/TGHX+L+iPnbHkAv
         CdjETXEqv8Btq4citffHCYypHW3SbjyPSUeIokvIM4PgRWRaf/09DyLSwuZ5MH10ljKF
         o1J5XMvqV3XArNUt03FyokGg/Yz5f+51gRlhotOkIG1Gyb/2v2Knd9PJ8ZrwLBdWWTek
         NRfd9uQ+EHaRxMcXHQp4ad0320aTbJ5Jv9WiQ2XOpDwpursiJRsDIgcJ7bAezj5QAjm/
         /Gf4wSncxQF4ppSj2pU7pR+UqOE9y35J/n2mTnKX3oI8aqFS6xi7hId5l6JzaLnghR4P
         jLAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yDjzcZy8Ij6agTjcnO8RJE91E87MJmyjcuZF/llx978=;
        fh=7xRdbyAJIZ4GsNLuMi8tzUCGyvR1ri+VlSyqfzUHa6k=;
        b=Jpjfsv12rSwrk82EV+KrF6B+ZRzxVrVVwgYLA6Mf3kUtE3UEI3mzMOaXEpndb7ic/a
         qe8V0w92nf3KMdaxed3G6/B4skxyY6GvvtQK53F6CyEJaTgX/sxl+zz2CZPB2J1FdT86
         rKjMgm+BgNNFiglrjdsR39NHY59scffGycoN2Y/tNkKHoPmWXCovQMHUK4UKIQtiQ88x
         CdZ3txNaVgZKWBKq82N+VThhKKxMbw+zOQOHI6cCCSFHgmbkoNUqxcHuyp8RxoUsX4zP
         T32VJx5bYoMuesfI/Clg8jyCqLdpKIGTUxSgQ4y0Z1TFu/+sncYxZQq2s9pWAoYbgvlP
         K6Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqbcLRK9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dx23-20020a056870769700b001b375cb0e53sor5133163oab.20.2023.07.13.23.47.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Jul 2023 23:47:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqbcLRK9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689317238; x=1691909238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDjzcZy8Ij6agTjcnO8RJE91E87MJmyjcuZF/llx978=;
        b=kqbcLRK9qiJER6PQVcpXDVLWiTGeHAe6aPU1CyMjNl3gBfa5zj9+BLQT5x6FaDUTIO
         XUv4zuzsale2yncTosPGkNQprBQ9cyGWLITZYm8VTh6d2FGNoseP5/pByVmw58ISau2i
         NLHzQ4/66vGlFqOm31U0xeelCbeG8wIAulfJnN7Klfo/vAfWe2MBBdYdp7KPjB8B+pI6
         FLLbQSplSxmN/tOA27/KoRv4oLHyx2Ku0lfzb+x8H5H/JtanM5yRWoNUWOzR1waEX3fG
         v27B60yQ7vvnVQRvpPVpiuDOd6c6d7UB7eL7Wmm+JpGAeX7XCsrz7zl5qxE5s067S/+7
         tgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689317238; x=1691909238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDjzcZy8Ij6agTjcnO8RJE91E87MJmyjcuZF/llx978=;
        b=hFDgWpAFQHimzbhvhU7GPQW8NoCj76Nbz5XuVGY5wKGpreeJNa2OLkAQXd4obAkfsE
         sFmJgNVRS53lzJSGAom1BQzw/60zvC4IFjW6At87LZXbz7S4Q3pUiznbtyrzcK42iAtt
         G+EL0wfJV0NnO7izimyLE29yA5lCVdRijrv3ZEG57Q1VXcvOIRR3tiqqW17Ba2Wmb6Mz
         ACfMSP4eflodmamss8U2kyKwCUNteISRaMHE+kzm7VhVtm6WleXMmOYs5zHmKLLNRxem
         nq6iWWwET1dIrRuNxBGyohZOK1IrPcMS/aHQSMbo8UB+aSwjX+2F+ow2mieGEiZrxNbI
         EHSQ==
X-Gm-Message-State: ABy/qLZJ7UzvuJE140jr5CgZvNDvbbJMwdqEFCb2b2pHcrPLvUq4F2QN
	haAo/95LEhIUsMnxOUT5vQqC8gbM
X-Google-Smtp-Source: APBJJlHFEkdgHFUzAa9er6RXCBjdttLOm0PKhf3PFMjRUV01Thd1PsClOTZGC5N1mHLfVcRMzvY79Q==
X-Received: by 2002:a05:6871:91:b0:1b7:2261:e5b3 with SMTP id u17-20020a056871009100b001b72261e5b3mr4366597oaa.31.1689317237742;
        Thu, 13 Jul 2023 23:47:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.149.227] ([172.58.27.104])
        by smtp.gmail.com with ESMTPSA id n10-20020a63b44a000000b0054fb537ca5dsm6038489pgu.92.2023.07.13.23.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 23:47:17 -0700 (PDT)
Message-ID: <8a7dc0d3-8489-7f1d-0e77-0050b5775bcc@linaro.org>
Date: Fri, 14 Jul 2023 07:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 01/11] hw/char/pl011: Restrict MemoryRegionOps
 implementation access sizes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710175102.32429-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tThETtIfufe1

On 7/10/23 18:50, Philippe Mathieu-Daudé wrote:
> The pl011_read() and pl011_write() handlers shift the offset
> argument by 2, so are implemented on a 32-bit boundary.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/char/pl011.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
