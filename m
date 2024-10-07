Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2199475njb;
        Mon, 7 Oct 2024 14:17:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnlbkjpqdlQNNce6/xdeAJ/nMmEDu4M8c6GLyp8Cko0Z3rXHy6nOoLjsDo6tYw5G+zmVYWVEFxaEwH6A==@linaro.org
X-Received: by 2002:a17:902:ecc8:b0:20b:7784:27a2 with SMTP id d9443c01a7336-20bfe07c8aemr214533855ad.27.1728335870406;
        Mon, 07 Oct 2024 14:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728335870; cv=none;
        d=google.com; s=arc-20240605;
        b=Rxu0omYVsXkXXrvAjbiPPSvidxaDG+0p82w3NyVD2QtLgftlmslfbJA8+nd1nG5jkc
         f3LzS/ZErCjtn36Q8HeaxTClvsuDoFCvPD5LC4siur2Wiqp7YX1vAsDrraRZ1vQFWd0c
         9N0QG1dMKF5FGJIs/hObIi+2y/HUNsDZjiXqFv/UBKTRCNB0AURcewS7WVjTDNjbTPmS
         krcxzMq0ZKwXCtmYYO1s+wQSR+E4a5hmu4/CBntaOzoeJFfEVMjonZT9/1XYPIJGizRu
         BGqlkPvdH1GHiIagTFvgnzI8ppC5clChO4FNXkg3zCfpsTHunERjXI2s3eKPOM2N2wLi
         UyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fEczIr49pHVDmhTYxLG19feKRvTV2OhUJFNmzSuMIOA=;
        fh=ohhHQ9kQj8++hC9DcpnvJZ0mb0sakQ+zuuni9baXYsQ=;
        b=HRq8CymmAXAO8jJIYlfdgv7U/Y74xjNFMuBX6KUe3kdpbL/eIjemTbKFX3cgCJogNa
         7Kv1SfxAlsYJhtEf5rsvybpiTSMrJT8sD1uSaoYcqQt7FmI2h+Eny1sAHjljyeCztCsd
         0H8jjYOFEGrpB0GqRC3sRabIcNrikO+ljLVIt9OY3vH8yKAR7F7I3zVZF06KERQNE/fx
         665MV01PmeykuTb1s2x9VR6lP5JAIEm6luuNdwllJKmt5b+nXHjvpQpw6YoSMT2NcRkF
         VBt78+ZzeuDkla0rbPCXn0wAWYqtIoTUc6XGg3FJnciQDJjr+8gsxzvAKzG1KfC+eiII
         btQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rraDnuPF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c139730a7sor35050265ad.14.2024.10.07.14.17.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2024 14:17:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rraDnuPF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728335870; x=1728940670; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fEczIr49pHVDmhTYxLG19feKRvTV2OhUJFNmzSuMIOA=;
        b=rraDnuPFNmOj7DlWOcyKtYAtvTJ2+kqb0MJqXOH+THLkupoqYA9gibFiogA6Mzl1/r
         Ks4rqdMhOfgDStav241iUpqyQdF4yEKI8N17n8vb0936XYkG8dNdVNCEf9U2a0+iYy9/
         26/QQalOck1s7/jl2WEJUrvuLMOXFpGIbJ66tkAbtoxSQFsqWiVRR2mkDvcUZ5AF3s+i
         9XL/OjlQgBpVDVxzAKn2qW5igIHEzBOubA41iYPuPOt8B/NdfTezzLxJxBPu8DgUcK6M
         T7dGwpYH+IjidE0JLCqcwSPdMfaw0/jRVk/qHV4DuK3f1O+3L/MeQxRvknQDw5FES/Pd
         bxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728335870; x=1728940670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEczIr49pHVDmhTYxLG19feKRvTV2OhUJFNmzSuMIOA=;
        b=jG2eotTBSz88Yd5VozsPfv2O/nzzOM+9LjL25HmDO0eVYJWnlekA8jXOIpK4kyqHgE
         0E2SP6Ft3gvOyngpT79BQDIk76p8M1Kf5ICW5kcN5U+bYT+u8uwNpy+Ag2AhdKYtwGQp
         WFwCg80Wv+/mz+q4luSxqEV6sVpAK9wHtZX2af6qoLWZey+Z4G2etM3BTZMsVHjweIfl
         nmVdFixntKk/cY6k0QUm7kp1hZ5hOOHpbtB4sZni9TjhHNdUKNW/5c1gMK+uvm4YgZHG
         HfVFx0mlGHArTRS2FNSfMtsQXdr0lSDKcoHVy7o+t0xOPfCQrkn2fvAHFmF/lQ51aBME
         UW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpEcdCPe0BzPJaptjXgykoDJTuxcEpyDfknc8hsonpKd+yD34abe7YKZi5+5ao7ywaDzDnABmxCTfgjQ==@linaro.org
X-Gm-Message-State: AOJu0Yyqe6zN6UdRvW+ffhVB5EZd8eUHcYCqQEQlFI9DtQgMUXG8koXV
	cZqD8xTDI2LnmCMxbzvB60NJVJ42IukxH7n4tkMFzztSGeVmX1l23KSM9D7GBI8Xtw==
X-Google-Smtp-Source: AGHT+IF+iFo3nBQNt0M8YZHcNiHTBYDMbNha0m/y303BWu+LZ6fyagZobPptPmMv/9P7CxHL+SpzJA==
X-Received: by 2002:a17:902:f691:b0:20b:af36:eb3 with SMTP id d9443c01a7336-20bff047d4fmr190816015ad.40.1728335869923;
        Mon, 07 Oct 2024 14:17:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13989814sm43541095ad.269.2024.10.07.14.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:17:49 -0700 (PDT)
Message-ID: <5c98fb68-df29-43e4-a759-a4b8f9a6bf0e@linaro.org>
Date: Mon, 7 Oct 2024 18:17:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] include/exec/memop: Move get_alignment_bits from
 tcg.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-4-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sudncP6Y3v7o

On 5/10/24 12:25, Richard Henderson wrote:
> This function is specific to MemOp, not TCG in general.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memop.h | 23 +++++++++++++++++++++++
>   include/tcg/tcg.h    | 23 -----------------------
>   2 files changed, 23 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
