Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2666242njj;
        Mon, 5 May 2025 12:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWexYmTu0CfDiUcrUBBxod73twmn9IiCqZutBH0n8XqykLaMb8qoyfrx1tz8Q/GiC/mK7u+G1WEre6ocg==@linaro.org
X-Received: by 2002:a17:903:244a:b0:226:3392:3704 with SMTP id d9443c01a7336-22e3278790amr10130045ad.12.1746472714673;
        Mon, 05 May 2025 12:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746472714; cv=none;
        d=google.com; s=arc-20240605;
        b=AUe8BKMgp5yATOns0jp/oMF34Lh67+k/w8f8Q72Yxp0DABh7vBsv6+LFM6fxzy/S36
         JD2x+cGxyhbthi4SQ63HFT7nV3qXXNS6bEtmzUDFd/tKgN72TTjKuVV/KHCSCY1b2wR5
         J1UfhAh5wbrJKMHcsOsv6yXoI+2hnxzNHC5IP9J54aXMNiO8HeD4ys/un+s0Fs9ZT0dk
         2AFEbMlbKxkSM0u+FwwDHPPQ2izNehwELh41r1dQM62KWgPh4v9yedcMzoxPBsULklym
         vWAH99LHzggH6vjHBelq3646c+gKwIEEd7xGsYT5VEfTWdHURhrg3++9faOA5RBkb7Wi
         Qf5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qgUGiM/DYUpZaxD+L893gwF6KdedTU2Fc07gbGMU5x0=;
        fh=lrrbgAhyj7WnTU0lG0GLkKNWlpgSDwaCwpmqO117Msg=;
        b=Sjj9lf6/lP7doXDi39hxgmpGiuB4Dbz2eE6nYEIDxgt/tyiltoDkjGGK9fsFEIZM8u
         xnWwxtXAmUXpWoEvAqkSYvADjrzOSzf/fPe4t1LeMs52dMYvsj14/jJ3PqD83e/tLIRr
         f3UBn3hH0PdfoLJGOP53t1p2HlxCZhtMM2zxevlsHnKkkizgGzDniy+QUPOXlmcM2beD
         rPUl3x8RJ34S974SRlnC23QbXak4YmMjiqrmMD1XhkjUKE7a304V2yToeQBk42zeMvzK
         EIFPzV8v4cd0EbLcDnTzJNP9+pTqvJzQGiUPM1/7cmQEAGqx2/EN7Z20Z4FAX5ifjMBy
         L89w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q0KFCZL+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb6c100sor45644355ad.5.2025.05.05.12.18.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 12:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q0KFCZL+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746472714; x=1747077514; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgUGiM/DYUpZaxD+L893gwF6KdedTU2Fc07gbGMU5x0=;
        b=Q0KFCZL+nNR/5JpJ32aDtrcgDcZie8q0PW7n4rEqe3OuEEUIe+Jc6g/BpYpg3KKkkb
         FH1hPL06Jo1l/xdiMqc0WkQ2WHqW6nYMxwubXtXjyQYOH9QIVZ8RFUow8Z/XBW99sEWc
         RKPBF59X+AETFOdNnHbAdewPULi6qjUjazA9U/4C2uEovudQym68/nhnxCKEkp/TFsZj
         dWnE61GaD0Xi9bnq9yXUqmbHvHW2qUF4zGKz5GsxtrfmWy2xolo7fbAboDm5zepDJnaq
         ytFfnjkNXDYiA3NCcYLhlCfkgDN4WlU48KyrysoJMAU9ENVWrOlL1PHrk4JKG1nK7BBM
         Nmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472714; x=1747077514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgUGiM/DYUpZaxD+L893gwF6KdedTU2Fc07gbGMU5x0=;
        b=V4Y6Nj612iLLGcbod2AN4ckKjDiSQzKVe22t0XsZ8zFIX0H7IB3AjqcvJ3YDe/KEuj
         ABy/w+03Dv5FMG8EpJpwXpkuKTYq4afdI7JKabQLOyysOBNdF6Ak7TPQIrnUR/SQEkCs
         yn4EAnOWvCSJsdQRCr1eX7Zm7JPMBZk5fy9atoG2mph7MEbdT11TTIzc+1ybHVs3gcLa
         1fLzMLyAFRjY0IpijLQdQM0PLSakOC+DgKDGW4o2VQv0d6YpTVKeq+48mQIfTua0Dmbm
         UOH3/UPY441XbY04pnfd0W+bSqqNzNhLAxOL8pEDZBRg5ZP4QY2zhYYT4w+BwVnTObkL
         TycQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+ySR/cfwfRHxf5dyPoyB9+OCWL/MbiK4yY/W9hH2A79yy/IeV6AuKQJtsPdtz5PiDgO3H4EO+ZJtXFg==@linaro.org
X-Gm-Message-State: AOJu0YxhXETOTmomu/jy8F7mT+QJbn+MZ1JiyFG9q9yEKpWonGA+qKGr
	zR6XY+nqeilVMiKBMocX2Us7fpDyeVJyB14cFWaBZOEqJMBzuUAf9Iu/aplDtPbxLxAjv8mRCFt
	MPPDgQw==
X-Gm-Gg: ASbGncuCzpo5s2FHfbK+ZB5UfDRyzv8vellxSkB5elNEUq3T54LwiwyUo1BRt3PKso/
	TSBjlco3MI8H0hqOTQ7yY/6AxS/oBmwZzrhWUNlivMwnZiY3frTzpzstJKBmIvvAOM5XwX6LF01
	VF+1X6uCU9hh07UWU2H6J8kxnz1DLhRyxgWSEcEbc+7mZXT3U0yQ5YlJ2YsrOBHd/OedQxRSAn3
	sLU9hYkNX9F+eYShdgK6+SRzqyey2skTLrFBM3KWuVzZ85ymzOKqpGJIHL5l25J8lqGGIdjs9u1
	9LEbUfNInjW62zmmkilY7QJ5vEFQOAoLiTUUQGKYGQ6Hu+n0hpd86A==
X-Google-Smtp-Source: AGHT+IHIZp9iXH90LNiEVwJbpi1Wd+mM2hRGG2JijV+Y1BkDIa/U6IW8Pa8ko2+EKFWM6e6m28nelw==
X-Received: by 2002:a17:903:110f:b0:221:1497:7b08 with SMTP id d9443c01a7336-22e328cc817mr8874575ad.23.1746472714255;
        Mon, 05 May 2025 12:18:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b7c5b8sm4963587a12.39.2025.05.05.12.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 12:18:33 -0700 (PDT)
Message-ID: <45230c51-4fc1-4953-a914-eb61dd6add99@linaro.org>
Date: Mon, 5 May 2025 12:18:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 43/48] target/arm/tcg/iwmmxt_helper: compile file twice
 (system, user)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-44-pierrick.bouvier@linaro.org>
 <2c005b5f-1308-4c7e-9b0c-9640aef294e9@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <2c005b5f-1308-4c7e-9b0c-9640aef294e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: peYpfBk8rxIP

On 5/5/25 11:43 AM, Richard Henderson wrote:
> On 5/4/25 18:52, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/tcg/iwmmxt_helper.c | 4 +++-
>>    target/arm/tcg/meson.build     | 3 ++-
>>    2 files changed, 5 insertions(+), 2 deletions(-)
> 
> It appears iwmmxt_helper.c could be built once, like crypto_helper.c.
> 

It needs to access env->iwmmxt.cregs, and ARM_IWMMXT_wCASF define, so it 
pulls cpu.h, which contains CONFIG_USER_ONLY ifdefs.
So we need to compile it twice for now.

> 
> r~
> 
