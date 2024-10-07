Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2200970njb;
        Mon, 7 Oct 2024 14:21:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWE+tb5AOe3jcdOenJAK8YO2UYg+eDiGN15A0Fq36wADhlz4460wXFRHM7PKlV5ya9NhsLqrqQ1OSpM+A==@linaro.org
X-Received: by 2002:a05:6a21:1584:b0:1c8:92ed:7c5e with SMTP id adf61e73a8af0-1d6dfa40ae2mr21920080637.23.1728336111974;
        Mon, 07 Oct 2024 14:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336111; cv=none;
        d=google.com; s=arc-20240605;
        b=kfKxTlsinnxvkkk/KL37F5ZTC7AhkelWM4bbySK0vntAaQB20GrurESDDQqDMLolOq
         mP4oiSmW7BMU7rh+Pu4cBp/awa2YyX1Muenjl0OIWPGO7Ot+OUuCXGJlcAFh/C4jUwiD
         q5F/2nzD74fZ+U6u/tgZtmEJM6bedcVv7IEcbkxrtnkwI0joPB3B/h5kp04FXIMTRJ3K
         /naN2adZUxPVmusjiS+Hp8qm4wHpYzh+Vo0qnZvRn4MGrg8vVeVZwRk+p4KZQSjLvvz1
         ejHO6opVAQWuTa4G5hj1EkjYxDlawyImtdR/s9O/zTvpUvIrNkJ8Ut6BflYQO2z+abKm
         Mc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=P8JAjpO8eNde/9AgguZ7yeqp77mIn8hCurGc5RPLjCw=;
        fh=hbtf3DcNCo4i8EHCu1NXe0y2LrJJinyG+NzK4xW5mX8=;
        b=X8H1dKu3sqZYCDZQ22KXHs+4GocngtDGdrSjgbO0J6rh1PqkyMIckoSdtFXBDQiLfg
         KmuiPdo3TD27OtmF8T6dFLpVB9cwKd5//fnDER6ZbPym0V1Pbm/F/GVBlA6OimWRVpgf
         x8Vmbt1DuLBbmsiYfnt2F6gRQQ5zLyDLO3yuLLPzVz4rqOswTYgqOqKXjAaF2DeKVHlu
         5T/Ner68+yli7Vz8xA0pvZMnZTwRs7jpVLhmnf4BhbOfZjT/PTTlr66OV3XF/06xjGX0
         WEKo13OZ3+G4INZCK5EHj78UOsNsEvNw6izj5bsZXQJTIbvrkVy6q4iKpn3WO4dlgqRw
         ZXiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ociB3g+B;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71df0d80d9bsor3172801b3a.12.2024.10.07.14.21.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2024 14:21:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ociB3g+B;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336111; x=1728940911; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8JAjpO8eNde/9AgguZ7yeqp77mIn8hCurGc5RPLjCw=;
        b=ociB3g+BCmM+Bqcx/3SKMBSQN26JzDY4MCiAZ135FSYmMoIUIAf/dreBUDAtufMW3K
         g8IXeo8RzXoEG/mEVkQVR1rLU6904pIQfWOgwc/tviGzZF2CqAsdzw4m9EvG2zWDwMrX
         zVCQFAJ9w859YWbDXIrYm8f8N6udiR9UOoi/rpnjIUV7z+zBs/jJRB82nv24TnW2jLYu
         l3k9FSqhAgZEg6SmNwdkAus+n1vnGzklunj/W5W6Xj9I4xhh+Jg5eBki57vz3hHfVXe6
         Dwz7JWBXSndftHnEzf7Y/jWsMciYHIBzmsfvde5sTZKHPS0ujaer1SFyyBYHHshg34R/
         //cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336111; x=1728940911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8JAjpO8eNde/9AgguZ7yeqp77mIn8hCurGc5RPLjCw=;
        b=ELWuNPIbuMYT+cYLNnrj17Gdh2xxxjtlric0KH9XUlbcCFjpgl/Xk+W21vbyAI3qgr
         E0N/v4hL0c3ysGJ1vUltlTU4cb+Zgf9PHtelkzWU6HNCmWmWnkrJyMiobp9ba9H4igIg
         vA1Uk/HDxaaEDEG7+PkrqJM193J/xm/3Q5a33jfSiQIbNtib4A9W/3JIHACOJUD1+J8p
         MdBxpQ30fJ5dEdUOYWrR2Vy4exVkRqX2+VkZ/aKBunynlM0PcFWxWLWQqsiEB/O6l+hJ
         J1YGAXT3QRcY+rQ6RcCKvua/nWbV290NLWSEeXl0WBkaT83sem8Teozp2++ptmb4RWu/
         BJJw==
X-Forwarded-Encrypted: i=1; AJvYcCUYyUxTzUqvmYnbG5gLf/bSvBWf/vyO62H1uPGECs1Gb8D3Ch3k1aPPZtE/7/ajrSy1nm/upjsqnfVG8Q==@linaro.org
X-Gm-Message-State: AOJu0Ywc6I9pHvh4LdVCWbkB47VJlzkNvZcI3ZjD5VzWg8rq8qi9hNvH
	OZeaf9NM1dF38IFcFjXtAwMZXMSO8MiSvA/+V6DJRmjYwQ6/qgIgUCLPsLCPbKUzbw==
X-Google-Smtp-Source: AGHT+IE7UmUIJiV7Ff/gmSwqOwx7Ayu2TtlDU9/HAF8l9GK45IXC9sM/RYIEv2bsEy1ykPT3Tx8ZkQ==
X-Received: by 2002:a05:6a20:b58b:b0:1cf:6533:5c86 with SMTP id adf61e73a8af0-1d6dfa40a0fmr17450432637.21.1728336111574;
        Mon, 07 Oct 2024 14:21:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d4538bsm4857433b3a.104.2024.10.07.14.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:21:51 -0700 (PDT)
Message-ID: <5b98abbc-8d87-4e99-90d8-9600bd5107cb@linaro.org>
Date: Mon, 7 Oct 2024 18:21:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] target/arm: Pass MemOp to get_phys_addr_gpc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-16-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NsNs90kCzZ2l

On 5/10/24 12:25, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
