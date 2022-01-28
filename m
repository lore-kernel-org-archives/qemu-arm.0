Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp66275lfk;
        Thu, 27 Jan 2022 19:13:34 -0800 (PST)
X-Received: by 2002:a05:6a00:14cc:: with SMTP id w12mr5782975pfu.47.1643339613898;
        Thu, 27 Jan 2022 19:13:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643339613; cv=none;
        d=google.com; s=arc-20160816;
        b=NVXLROTmSjJVDyaUNcfGOyfUpnfNCQkhDfmKKeYKlZIM7h0DHd/3WZPStJ7Ev0xCsj
         12hACqkQifeWFYBM4BepDt2s5rZOIcfVwHSgISKcAfS0RfRRFpT7xIvXgNBOsMzxY+Xd
         KlykbEN/hoP1PMxDw2VMY2YuZRvHsV9rKq5M2bA0j7bAWNZvLMfqqP3AA8Z618JHM4yB
         rvmr7NMD5q0grL3gaO2yTmpuTVvlBTTI78xrlzFokRSqBlZadNjRfpYihndUenKXIyL8
         8TGZqz6jrrXeBvP4wNbM+Iz6tziX1MR9+XlkUyxqvcINDiYLIZ7SzYlv0yjLNcf6Vpp9
         YLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3K+4lle4h7ZxfhRPe2bNcHfgVN9W4HgPpRjtuWY5m/g=;
        b=hO6WnasuGKbf6DQpLKVUr+u7an1VM2H1ky5Vde3Ux+4mekMuwR1xyC3pbHwOkaJHRR
         e4OTdCmc/qZ/lQR8nHwVimvybVopToeYe/yrIThkC/2JkAFxsaGwO5DSN7VhtWbmQwt3
         5avrLujcQq5lHFoyXEz8HI00yEyVE4PsKZKRocP/UScCa6+uutIzW27WtPUqxhAsehgB
         jteph4Q6DcXZ5r3K4QrQNbekjgTPlCBIZlQoKEPpGiqCr1uIspwNtkUfULaa+CMZzM6Y
         4/MZk6BAiqLhkyHdTVJvz6sCRHO3LXcHi1txPQXyrtASHVvdv4Yt9iEAzs0+84AR/2I6
         g8qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yuw4CZHY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y17sor1987486plh.187.2022.01.27.19.13.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:13:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yuw4CZHY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3K+4lle4h7ZxfhRPe2bNcHfgVN9W4HgPpRjtuWY5m/g=;
        b=yuw4CZHYj5L84H5+lAsZaa1upvgDD8wQhKdXG7rdm2LqWdzfDGdzxqRsIWLwcCQObu
         JB7q/fGNzlfD3zPlsAiJcUqRcsy7ItM5+ZpAsRevcp2KEhCkm7V3e18U+b47F1BE+9Yc
         KcBiWIOre9XEddRLvbW+QuU4JZadUIRDA7QtPpGH6naMl37i5D6SzgqUHzXujdX+jEPv
         XUAW/TaqZLhIR0XcBPRZV+s6C7WoUGL8k0TcOmUFTapcsMxzLECPkeHebPn+0OUKb139
         virHpXllQf1R4QO/x7ApKjOlp7SeQT2aFZIeDu9nu5PevYUTBLOShqVkKPDwj1bEOhhM
         iD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3K+4lle4h7ZxfhRPe2bNcHfgVN9W4HgPpRjtuWY5m/g=;
        b=MJ5smvrz7AtMt7JsIGTjE2Y6JL/nnp54AJiMLFGhXFBl09IKXelQz2XwHUyFqU2Hsj
         fS3M3YRZLW8abQ0myt1hO2MCSRolWbPNoE+n+gVobniGu2hjdGAEqWaDX1Ea5gCE4Seb
         uynKmX3PZ97k9rilN3BodNTSnTtD5rzAhA93njxLVVYw36iZYgQtrMfGGyyINGsyVaOl
         qtAS6W0IvzHImy+8J4wKIHtRhFROUde8E4/MPoWEZrcdp9EFpUEX60jY9omLxqVBhSul
         fqQDXdn2wA0gki+eBYai7iW2iCwhXcTTAWDOzwnQv1s0UuRIa+u8IotLBh1xjtJuoYsp
         n8Bw==
X-Gm-Message-State: AOAM531MgacYulOtT60V1OE5OC0E81FKwkHGeFLMoyFx9QN1X4Z3dEiJ
	Fg5ev4QSjDd2oIMBEeQe59mpbOM7
X-Google-Smtp-Source: ABdhPJw+QHzaoGGNKl6zYWX4uQCr5+j+5NFw1Jk6YbL9xyWhl+lvwGDB1DtHxLEbzZVEwulebSXgaw==
X-Received: by 2002:a17:902:7618:: with SMTP id k24mr6397991pll.169.1643339613466;
        Thu, 27 Jan 2022 19:13:33 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id g9sm4348757pgi.84.2022.01.27.19.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:13:33 -0800 (PST)
Message-ID: <f80fd5e1-ccd7-29fb-5a5c-ada7f593214e@linaro.org>
Date: Fri, 28 Jan 2022 14:13:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/14] hw/intc/arm_gicv3_its: Don't clear GITS_CWRITER on
 writes to GITS_CBASER
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: MX+pxxv9NVPc

On 1/23/22 05:24, Peter Maydell wrote:
> The ITS specification says that when the guest writes to GITS_CBASER
> this causes GITS_CREADR to be cleared.  However it does not have an
> equivalent clause for GITS_CWRITER.  (This is because GITS_CREADR is
> read-only, but GITS_CWRITER is writable and the guest can initialize
> it.) Remove the code that clears GITS_CWRITER on GITS_CBASER writes.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
