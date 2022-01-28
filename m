Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp66931lfk;
        Thu, 27 Jan 2022 19:15:10 -0800 (PST)
X-Received: by 2002:aa7:8a14:: with SMTP id m20mr6209778pfa.63.1643339709832;
        Thu, 27 Jan 2022 19:15:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643339709; cv=none;
        d=google.com; s=arc-20160816;
        b=AHPhAWSO9aIiVO+Ql6DzG4Rbdb6ZjHi4RN770Etk2IiM4EU3uCbux67lzK+ST2fN1B
         PrER3b2V87XOiOF9mT+Zvpk0/pSHb4M1pL3LyK6dJEGUrPhGOZJ7RZqvX5p0cMkN02GX
         fT8Y0IeaYWJQeR18GPi1cyaD9G+e5n6/2cWuFllBAyzkuB4BIponX3pLHrj+l8kVIqio
         cdKpz5O9V02KMWPuAssMyXFEcgwJInGFlYSRFMplSPUKNGg15pbRmlqa8cPAyC+EitkE
         rGDGL6cHhAUktqip6cIGQcW33sPIDkCCClx4BZwvA+KIoC+p8/4fFmof4+Fta1yijjD6
         TSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4O7WF2dNEv6+T07efh0scbDlUd0TBIs/BbpZ7LzoPl4=;
        b=oLE0byn2ddZRSMfnRX9ofOW+HCLrnnJSpxkjyv8txMT0xMqu3XDC3OhN6BmRHg5VW9
         ibTIYlL8CjzHykAq3XxhAqBJwvrUpv0YDfqGm733oWm5TFRYMZApQPnjQzkiU7/Hv9qP
         5ejH70U8tga6cPMX3ePaE3NgtZwB54Hoq3r8HQdltHCEGOsumTJTABpyy++uRdwoJE4F
         gqxqOm+px13yj6XZieqfDdwpIugfaKVd+BjC1IO+xQVpVkfSw6N6bm4hKF5y/bVTPOLy
         tGReChDsxTrWIBIY6x8bMvPZ+lb0YWPAaJnYf5VjobhKjlH9loNt6Nsp80tBv2CkgK4P
         uCvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwUVNmtE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d6sor1923634plg.26.2022.01.27.19.15.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:15:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwUVNmtE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4O7WF2dNEv6+T07efh0scbDlUd0TBIs/BbpZ7LzoPl4=;
        b=GwUVNmtElfFlEPjs3OzypA5TaiD4VpgNuMMFKtOuPbLKAuSkx58ztQWRPpmuK2OrSQ
         vLK1LzQ8qw++VUxjX4O3z71qr+kVshRPxzwUhU41Y8uMJG2+rO/TjsM0YhvW8YV7dLxc
         VWoLX4RdSBc28Nmg42zfPs1NJ+miYK3U4DXQfoNoZ7/E3dN16k3nP8SMDJj5k7N3Gfd5
         dbr9YNKcCvxK4EuLlaDZjTb9LdoAp8gq3j3IHlvaQ4d75HSI/MbmS1awSZtelM16pc5Z
         k93iHz+JLyCTSbjkgWBrDPBeS01xUT1WHSHoyHmhb4lyM76GBEcgm3q9OnyKoZbqZrXC
         sVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4O7WF2dNEv6+T07efh0scbDlUd0TBIs/BbpZ7LzoPl4=;
        b=muHlhe4X2z12TrtVqT9GzvIS+npvkp6KRQkMqmEj4Q8x+zVvWYJpxsorg6ZK/I6r5+
         vnOmBPOuEK2/YDV5KCnYJn/BykqVLOTmlDscHrRFqUFyagmh4i6sbC/LSTeLCL3mCLVe
         +n4BSwMAo+V0Q+I3PChPYhrtxy5Z6iLP5dxDwBxjhingjUpiJ6IhfxDLmWT2+2zOaFWv
         rRk/YJ0C+elqhbXngR4HiSOjvMi5LY5gChwtBQRu8hD3MCwpZGAwXm8G+xuGJ7AdjXHS
         xJ2BuoA3OxW3eG1n+zslIji7NuruZE6GjF8wnyZZREjACJx1/nfX1Q5b+1bCL+FGRBX8
         sveQ==
X-Gm-Message-State: AOAM533XCpjMH6yL5FTe/2o1pAC141kKPNQra6YI+dJx0IbLCvC5YSwg
	5TVBu25vazuv70TpRkZ9UFqLnj3h
X-Google-Smtp-Source: ABdhPJy0fwmWYfps28f4W3rnt1XKZQD3n05W7vvOhsQaCL7hEhHLquN6VsendhnAnHV3JV2+NPQLcw==
X-Received: by 2002:a17:90b:4b05:: with SMTP id lx5mr17391743pjb.128.1643339709320;
        Thu, 27 Jan 2022 19:15:09 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id t14sm662954pjd.6.2022.01.27.19.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:15:09 -0800 (PST)
Message-ID: <b3df3bed-104a-0a64-501e-a4216b663a45@linaro.org>
Date: Fri, 28 Jan 2022 14:15:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/14] hw/intc/arm_gicv3: Honour GICD_CTLR.EnableGrp1NS
 for LPIs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: JPsA25znL8zO

On 1/23/22 05:24, Peter Maydell wrote:
> The GICD_CTLR distributor register has enable bits which control
> whether the different interrupt groups (Group 0, Non-secure Group 1
> and Secure Group 1) are forwarded to the CPU.  We get this right for
> traditional interrupts, but forgot to account for it when adding
> LPIs.  LPIs are always Group 1 NS and if the EnableGrp1NS bit is not
> set we must not forward them to the CPU.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
