Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2198995njb;
        Mon, 7 Oct 2024 14:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqa2MmFfF3bBkHM0Je5Jk1jVd02k1Xt5NYin9wBNppRVHgKEokpJ4b7vbi0Hs4OTo0phyCAb/HcSlUKA==@linaro.org
X-Received: by 2002:a17:902:ce12:b0:20b:8aa1:d53e with SMTP id d9443c01a7336-20bfe297f27mr192372425ad.44.1728335794300;
        Mon, 07 Oct 2024 14:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728335794; cv=none;
        d=google.com; s=arc-20240605;
        b=CmnBIQJ1I4ebEtB8RdYv6dqOws1W7dAFVeaqu0RmipaLu2O72iztgYYJKOZPr9PNQ/
         72Bl4McrvQtTWbUsI2XJkKtuXY0dODiCCcYDfE8geIVnGL6QWSxChuSLgXk0T0lONhaJ
         hX0VcvVl2sOypGWNOvmkxHkgoZP24wWPWSDMVw556AD+xWAUaGzxrVj/JL8VE2LGlBzU
         P3cVRHbZNH3nn5WMitgNiJjIgwPnYWiohTVHRRcJGW29Gu8j7t8aC40EXiHLrhN97gtg
         8jOFkp26Je0s0LPGX3v+KokAVEU1hqmixURVq7geF/nsnQG1XKZ+vFIM0ZAfUbM3BSh1
         sejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ln56M5/7Z1rmHy7R8GToxjq0I6NsCa+9Vyn2pPN8Shg=;
        fh=7Bge18MXuESzTdmhfsjsKQq1NU8OnM5VsXbx1bJrll4=;
        b=AQOg+B/iDGHUrbktOvCVu86f79gBW0a4FwHLwaUEWNNKswmMpfeydATd/3rW4Uawe7
         PrQyU2GOdS6o4NTHCpNZFPXS4TFePiQ63tYP2QpmBxYhVYVxlZ0T/Acap4YvGb+U10iq
         FioDMIebu9WBgvv6IqBmLXo+phWdx3ZT9DYcx2d2taFp9HoRRyZmAo0+Df/PZ1yrayYQ
         x6Lf66t6w2oprhSu4NBCUs5Siyf5x3n8mxL8dBy+9A4uo151vQIdjC4rRIXKKO+eSQfO
         HV7IfELU7jYVziKeF2/IHTPGsXttuFtoXMQOB62/8SOviUPduBdF5/4fuBR+lDSDWpYO
         QUKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U4pE9S4K;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138d0bd9sor46596115ad.6.2024.10.07.14.16.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2024 14:16:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U4pE9S4K;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728335794; x=1728940594; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ln56M5/7Z1rmHy7R8GToxjq0I6NsCa+9Vyn2pPN8Shg=;
        b=U4pE9S4K0B+xGmmNhfxS6D2aqzGGQn++nbREixvICQ0YyZQ9mgNwry3sSYCvk7T6HS
         rWPkoutPR2LS9+/uXdhvWU2ZXxJgl9kobIhH5tEn/V5onHj7VSZAjgpB+Hu/IRIpC89f
         3C3XTxtsYLn4MureZXy38ijklBGAeV8pt6bukrAjdB9MmvQemXE2nG03uUiJak1Btj93
         JIW5p1XOPqqzADseZZBVwCPhfn+u3U3y2U/wzBj/pACvIUq2z2ngsRPJcpjnjYvnES4h
         h4wme8uFt5xqZt5BsijM5Dxvquj3IrjNMLH8K5f/YqLR8CndEp99eTvvBZhNEELPPdI6
         DaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728335794; x=1728940594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ln56M5/7Z1rmHy7R8GToxjq0I6NsCa+9Vyn2pPN8Shg=;
        b=kEFtqme2kPmafD8wj1bxpcsxPnIhsv4+ezEkYAylzb0USWd29puK7l4ltsCzMx7rMT
         QFY7hlT9J3ym7slE7UmhlluhXo4Zf7iMwWoWKL3Z5bjWei3OfuDclVabboDZHUPF5OhO
         eCwx1dyVN2Dzddb/cGfz0n8570rpI+hqYjgp7SiRznvOCquyXlhcZ0/XlGAgI81M0PJo
         ES56SbY7U++9q7qCS5twJSigyKfA5E8TnUt4TydXSUfj+fZnBOGBt5pbBWe/9hpeptbf
         I7eJXBzLgNR7jcIu7HaoBaoXU8ZheE90mRz+abbzjFqsm0ROcezpvoohD+rjxjtLS3L3
         KSPA==
X-Forwarded-Encrypted: i=1; AJvYcCWRWQJr1folSnc2croyOabs11gwvaT5BSh5pcb0fs6MWt7SyEXUtCatxT4Mp+Jewcvzh4YYgU7hlg5pQA==@linaro.org
X-Gm-Message-State: AOJu0YzCuoaI/i0H0IGxXj8T8WEFZDzdGq/qz3SPPFSUjtyrV0klhWWk
	srKrcuKxlLFRWKWJ24xLN3dVw6YinQgYU7uxW7i0IzKjEr9YRCJWTKnW/0t0+zVBQQ==
X-Google-Smtp-Source: AGHT+IHPuRyqkW3x2ZbtoTRay8gCRNWuUIYkLU4KnH8VRU/arghyojj9cCqZi2hzJs01mmAwKrWTkA==
X-Received: by 2002:a17:902:e802:b0:205:810a:190a with SMTP id d9443c01a7336-20bfde65a66mr158141555ad.2.1728335793937;
        Mon, 07 Oct 2024 14:16:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c139391dasm43728525ad.124.2024.10.07.14.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:16:33 -0700 (PDT)
Message-ID: <77f6c925-651a-4b90-ba41-f5f1dbf583c6@linaro.org>
Date: Mon, 7 Oct 2024 18:16:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] accel/tcg: Expand tlb_fill for 3 callers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1LADVpbk+SOz

On 5/10/24 12:25, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 33 ++++++++++-----------------------
>   1 file changed, 10 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
