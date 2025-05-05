Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2651090njj;
        Mon, 5 May 2025 11:51:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhaPTa5GzxygKQCn08GJq8EK+HFIyH/Im1WvWR11pATiACvE5giibWyn7UmzLZ5QGC6JY++HT6Qj/r0Q==@linaro.org
X-Received: by 2002:a05:6a00:600d:b0:736:2d84:74da with SMTP id d2e1a72fcca58-740919e16d9mr294158b3a.10.1746471109479;
        Mon, 05 May 2025 11:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746471109; cv=none;
        d=google.com; s=arc-20240605;
        b=lzPTaCekpufws/gvCkwDGbqWa94eeM5J3a7cbzeJwtDqhD2JUi1ciO8dKzWzsK+Hg5
         mZCyiOUV/1Wu0YBX8tpdTIilylKvVyoUQEjJYxkQfddBQXAJXjXPJxCcLFxUbvd774DD
         gfLDGIPxRv/KehFXxqu0Zz8f+vzz72f9mBOk2Km3UW70ZOydajNVDyLdOZEnE0uFKB/4
         2wXj2vruIBXrBqiOwhrbcABA5RhW0Tn1sMxhJs0bsGLjs96M2AFrfWXFojyJN9BqR22G
         WX70+DHrnYesElPTL2ruaytH2fCfJZZ49+IDV/9uKDAW3Xuvmq3TAr3iCYhIf8RMHqlV
         5fqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wFa5afTFllsh88Fa9jTh0JeUcoNick2xFbmV1V5kyxg=;
        fh=/QlyEqJs9BycWRXFLyIe5n7BkJdoP3WcL21dKQbLBGw=;
        b=FrjR91b6ZpJIMMwX8WLdi1OLChrIFEvIHu/U1WA+5qmltYgbKkalUuYQ+xtGSxRM7x
         DYkKo8+NhWCnUj8ZkwdCeYMrMSDcMlq8ujSz9fmijhW0IaKLJftgPQXyOY5KiuE7Kvc+
         vL2YdxssJPQuqX06njA3Qft2OPxF1Fq5AYhw+gn4OXGhWjJylHQCjgxVS/HBe6vXxLEY
         TUtwuwh/z844/ObV+oTgHfVH49H7Kd+JEY71/ScdQUCWqNc72A0GtT+oewATNoSH4BVm
         NPC0kQ/GY9QwRQiJCBwVoRYolk6AA2oEz3NpHs4qrZAUTMxQkhZLE8NPpN3AIaZRonep
         Qqlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H9NH4fS+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d5c74b4sor4736772a12.3.2025.05.05.11.51.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:51:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H9NH4fS+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746471109; x=1747075909; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wFa5afTFllsh88Fa9jTh0JeUcoNick2xFbmV1V5kyxg=;
        b=H9NH4fS+AwuDBEV5Dp1Ok2K0WxEjyclbOPqsX91HpOssLF2wxUfiKtkxcVHny2t3Xq
         PT7vK1FCv56c3FJzm+RyCVKF1W1Mp9UlMCoe3GY2RmuSLPYmBnC5c/Q3lBZMbuRthBtb
         8+9QRLwD4ZQugauX1l8ITN5Bb9AYOknj971yKm6Szo3wMz5wshsRsmahk0D+HuTFqIh4
         sjgmRUDsTRhlFEc3oDm5gkhSXnOHxyNyI9nI/AdY6XNlyp7iHrjyZL6rtmmnZeU/CYOo
         ei4nd30xIfrJsS0K/cQhOKk8L7cFYwtCIQJCrHJqG2E+XuNlshfMP7isPAJxwjNcD8Uv
         OXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471109; x=1747075909;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wFa5afTFllsh88Fa9jTh0JeUcoNick2xFbmV1V5kyxg=;
        b=TvfZScUM38K0qVBA9TfdEOFRRctqm1uXRE4aqcadRzkJpnsS6Jz8jg1do1iqQK7cJV
         gvXZGLwPdiaqnF1poYGvgi9mebPHp070olvMx7PvU3rieQ6arBJrjVuQmTtmnmcG9Mt0
         L9JnMwBIbdy9Cf3Ro6XalTXUm3bxWv1uxflUlZ73n4JaSvqW8pM7GyxKjNgkJlT1dttw
         i/TBjYpOVyE/hu6uk+tDUGOwe3JN2cKWnVJbWnFPAE4fIzzRnYt9ri31FTFCdcLu7DXK
         y2PFDi1u/b70HBt9wTlhgoztN0o3h2uiO8SYNd357c1pnTSaHe/c3cJB7598kicZZfK2
         QZWA==
X-Forwarded-Encrypted: i=1; AJvYcCWZLnsUWnAq+0ZZP2aMhdKO/Sd/jfO6SjGCrb78cEoKHGLjKYyhIW+EPIHuICnMGzIVWfZZtWVlllzj1w==@linaro.org
X-Gm-Message-State: AOJu0YwKJu5rsOTZzwAeQqvzYUO391PH3vj7/LnRLpKcHFXyH0QaiYKP
	VY3MAzBj/6ERAYZj46Y93SYN9/s5NSPagi6BmP0Ngk40byd0GaFSCASaNGTV2N5UQQ==
X-Gm-Gg: ASbGncs8h1dU1vXjO7BEXJefACvGmOH460wllujhLUPakRezHxFSAXQRTDhyf4y7k2M
	2tPriMTVfn7pUyDfSZ7RjBXCbtaMre/IdCdYfrZoUgmf5bNAVCblL1gCrkoOkaq10gik4r2pwqD
	DJhZ7xil/GzgBhMFFlQILhl1nAT+eRo3FNZmTCnDQUbwd3m6AycSzv5bgJFFDmSscD3AunzAD5i
	V6U0yzMqbvp+PrOUpkr/3CP0Iq0JcyJQv29Cscslo7haiFVNH9GQy2s08xrvG3ENHu0xYfbmJo9
	3ITO8n7M4Pyg+z6Pk9p4SYv9ArPpgLLCIQIszFHw2OCo2y8mw3u9eh/cwhLibYdVohsuJJSnj6Z
	n2VWSJco=
X-Google-Smtp-Source: AGHT+IFT2VC3lXxrH5o9hFQWMnOfnze8kfwxQwH28m537ex0rGytUEYd+B6nwd6awF4Y2DFyjfxf5A==
X-Received: by 2002:a17:90b:2dc1:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-30a7c0de480mr668649a91.31.1746471109072;
        Mon, 05 May 2025 11:51:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a263ea6e8sm16512549a91.1.2025.05.05.11.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:51:48 -0700 (PDT)
Message-ID: <7129b772-cd75-4b55-b660-a75d176ab059@linaro.org>
Date: Mon, 5 May 2025 11:51:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 43/48] target/arm/tcg/iwmmxt_helper: compile file twice
 (system, user)
From: Richard Henderson <richard.henderson@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-44-pierrick.bouvier@linaro.org>
 <2c005b5f-1308-4c7e-9b0c-9640aef294e9@linaro.org>
Content-Language: en-US
In-Reply-To: <2c005b5f-1308-4c7e-9b0c-9640aef294e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LIMSUZM8zXJc

On 5/5/25 11:43, Richard Henderson wrote:
> On 5/4/25 18:52, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   target/arm/tcg/iwmmxt_helper.c | 4 +++-
>>   target/arm/tcg/meson.build     | 3 ++-
>>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> It appears iwmmxt_helper.c could be built once, like crypto_helper.c.

Based on the crypto answer,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
