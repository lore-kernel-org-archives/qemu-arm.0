Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2201361njb;
        Mon, 7 Oct 2024 14:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaaFqkgPWtUPPY7EKAzVd5oP9FgJV9my0gDHG9smHzSnnh/0HiDLB0yQq5IvHKJ3Eqo8RqWs5Qlr43gg==@linaro.org
X-Received: by 2002:a17:903:185:b0:205:841d:122d with SMTP id d9443c01a7336-20bfe193471mr192616395ad.26.1728336174472;
        Mon, 07 Oct 2024 14:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336174; cv=none;
        d=google.com; s=arc-20240605;
        b=NBM8du+Y6NAia8/8p1M2TMA0fbGmrtfaXY/ElpdC6Iy2OJ4SLUa1BKq8TK2SvmUGL/
         /KLKiPA58+nWNi6KuvTzxytATpHmoB4Fr8ygeZiYEMjS4fxgNyRcCkHa8kzrJKBQUSYy
         IBGRiTXW/kfHiGZEAMulMRH1Z1/MrkpQ42G6TOBVnlgTbPjWZGBXqTBGwLeYPdHlTySD
         mHOw7Gp3Z2Y41apIB9cmNJgFAHTCLvnNWO7o6CjcmMANyIfDBG+yKL9a0pB6EWZNydvG
         hC+L9dUE2jh/3C5W0KaDwLDdA+QJ8GfCU3hXOK9t9sswGrGi7D0hp+6+jWvYAEGVpPeH
         yn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JQrX4FJYwBpWHhPKiJcQ2GuPdkcdNLrxWDBad3wr5hk=;
        fh=z433JQveAMG7DiUpK52FIv4LJYotvdf3b/dtJx/MHYw=;
        b=MqV90DugEPZceqI8RlJGeKzgtInFTdb3Pm5aaRyuOUlIyVf4t6i5y+fHetFBlQ3DLB
         IB0QSkCsLZ2tNXOXkfwFs6jo2GAtSg0ePzJydJr4J18G59HVBa5szVEQk8AhLXLVIbZe
         JQgBqibKp+MWE0L/5i5nZhQ4uWP0I/jlRq03RWXSTcBerS6RHorQhs59bv300rHhq/vK
         3nTqj8doEPFVIS6iBHp49n17/rg5VAWVkcKSYSAp2rftJS8G5rSE6D2Wug45A2Rvxf2N
         hK27baED4wS77VYJeY+Tar27pwJPTF1VPKJc5XJUwXk19qJUs5gGdLho1AIIp/Cr50Tx
         UHKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dfbES3k9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138f99ecsor33487335ad.11.2024.10.07.14.22.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2024 14:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dfbES3k9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336174; x=1728940974; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JQrX4FJYwBpWHhPKiJcQ2GuPdkcdNLrxWDBad3wr5hk=;
        b=dfbES3k9eCYU4PLG08yiPff0METUmXSUhD2rLoVREiTT1DciaNmhYK/MWIdABvxSXA
         PyqcqaY6tEjdQwS4x2Vt+dFqMyOQ4EOPyFKzMYclz1I7owDs05o91vvs7gMuyo49cDbO
         wcL6tIWAJ6i5LYwUfQYNPO2ohW37294/xiDoOUR0ZBCOdIN22pyKB8vKGSQoBc6L/ndc
         psRH5Q9iG3Xpe/p7i5GYCLcZ6M4YhWk0O73h2kXS8m03UyUcqGAMmcLZAOOQ1i1RLnAu
         Z7XqGvE/ultquJyRDMDJHmGTH8bK8Ma1uU6/op86leFIt5+8F5o7rKNFprqI8S8wghUp
         HV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336174; x=1728940974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQrX4FJYwBpWHhPKiJcQ2GuPdkcdNLrxWDBad3wr5hk=;
        b=kaInwMRZCjh9MBsZRUvPWht0w09+KisMvHrdaS6vWRrfk+QkSgqLlOOKXLc218Ev+P
         W3NmFOFS/YxpIh6yfFg44XpE+vHiMvtGDoyutQDKPiHRROsMkFcfwmSsX7HbvFJn3UKF
         8y3STXGK+VljCyXnWu866V9dbQCUrbpunXsJAxUwWu/IdMoyXTJrW5ehtzw4HF+MK8h+
         Parp7qBfwJYnMDcUUi3JWzYg+xmW5aJAojDsPWu1wD6lWElkd8GNh0icR9IbxAJBP7TE
         b2/EgejVj+45cvEhUdasv31KRtDkBECu8NiWwIjjANicIQbAQkwj9+XCwHpSZzsTXONv
         eLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz9ogpnh8RNNH1U0V0/gEbs/Vmhlp2x2WbxtJvbnKmg22K9d8sSy6mvQ0VE3QrvBO2d6L/F3F27sHi3Q==@linaro.org
X-Gm-Message-State: AOJu0Yx+cp9POXx2zqILtIHoFHxhDl4qt6h66hfGZyhnA4eyGZx66vNz
	VtwV5NZzXYdbN4H+mgQmvqocb4w2Cx1c4CQfEn4BCbKUVOZylo+HARU43sxe9POafA==
X-Google-Smtp-Source: AGHT+IGxE2UXWL4HXQi1bHHYsm1hmlS7OM5d6LOCRdyFm+k4HWWFBQAvPvMKtZKW0dsLxu5nZ9u7pA==
X-Received: by 2002:a17:902:ea0a:b0:20b:9062:7b00 with SMTP id d9443c01a7336-20bfd9b0194mr214054745ad.0.1728336174109;
        Mon, 07 Oct 2024 14:22:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13930e19sm43956615ad.166.2024.10.07.14.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:22:53 -0700 (PDT)
Message-ID: <16613db3-ac69-4999-8506-485416aab571@linaro.org>
Date: Mon, 7 Oct 2024 18:22:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] target/arm: Pass MemOp to get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-19-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: YElnVYi4X4GR

On 5/10/24 12:25, Richard Henderson wrote:
> Pass the value through from get_phys_addr_nogpc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
