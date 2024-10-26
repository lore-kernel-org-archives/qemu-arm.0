Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp254181njf;
        Fri, 25 Oct 2024 21:39:47 -0700 (PDT)
X-Received: by 2002:a17:902:d58c:b0:20c:ab2d:a664 with SMTP id d9443c01a7336-210c6cd11f6mr22983535ad.59.1729917587437;
        Fri, 25 Oct 2024 21:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729917587; cv=none;
        d=google.com; s=arc-20240605;
        b=T1Tx1KtA+AalBJR+rOD0iTmRgdgO9G+jqe+fnHM+0DLd+GY8avbMBGpJK1j40+15qN
         mhG9Vg3XKpfCRBEfG1NBs5E8aB9arBgnuuq+h/v5zPZqLTTWnoY1IA6PClcC6RYNZpG2
         /Hi+UzyWZazEwY8ZSpbjICLOnFaMrO7JwVjewmIzxAdbOw8cjeN2FLSXVRxIyvemC1gR
         ybziGFeRDFJf2Yatht+wHdLRvcwNsO8Kef95NT36XspKZyZ3gRXzt+zTLTiSthkrsinl
         SWC+BDVXVQYwNwoeR4X0JXoczEukqV9mnz+piICiQ4yWMsg7FsbQnbJtukYcULzj/qVR
         kkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Hvh0+NDIIxNrTt03RW0CfWwHElN89DGa3qT5CiLqnG4=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=A/9Jrks36OJeGSI6P6hbsI34fOTnJTu3ExH/NUV3DBm+aoPWw4o+NuQ1KHx5Y7YpLY
         PuxeshoMsfOEf3T3xBsHtpf4o0TH7a7yGyiQF8AHRFKg1ZY0Yd3i1g6vx/7La/417RMz
         wFY4ikihhYjyQ0qZJ0JaYPBRM7w40gysjRSdTnoaIvIXA0JcoK/KmTw3yzcxMG+JJhdL
         S7qd7o4X2fDlEmz9qmQ5foKQH1wPFX6+oYL69Lbip7Yahm3EpAo1lnrNClGQQBK+35f5
         KqNVWH/6dPtcO2Hkrv9zNaNhWFdudBClURlzyggv6SokSg4P483m595e1HkWEoSWhqXQ
         haHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4zgxe+r;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-210bc19202csor17979945ad.16.2024.10.25.21.39.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 21:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4zgxe+r;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729917587; x=1730522387; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hvh0+NDIIxNrTt03RW0CfWwHElN89DGa3qT5CiLqnG4=;
        b=r4zgxe+raFSWUQ3ES8Le4+OWJt9C32hKyC9SZqZCCdMe8pT8KTHRlWu8qeoSRe3oaB
         WiP2QHLkP9JFV9RbBTjVTEcR90FFDGiGQ3gJzWoAtj0iRrzrfRQWwKVWYAQF/S/CuwKs
         SV0WCSapLHlhN09YJerNySp/qGfPLm3/X1eXNhTT+2gi2LC5k372NNvxJ4jhp6gDHDaC
         FOT8/DHRffFiuh/3irTxtPz1SYbclGOfVPFQT+qcmSGXbbAEMbnxXQ9Cxm5qUyFIxquT
         WFmBofx6gJl/koy1QdXvW8t0lmbJBxeXkv22Qwcl1WqTZVHUvyZcbk5QNBa93hKzIptm
         0TYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729917587; x=1730522387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hvh0+NDIIxNrTt03RW0CfWwHElN89DGa3qT5CiLqnG4=;
        b=bhQI91zZ5+ohdRUmaMmejJtDfF7aapWglR5AgJ/RxQWBWLcGte1X0kC3fo7diz/yuF
         WUFCqn3vpQMzXvgrKLqhrsZdjppbFjWqiW3TafMTMZnyj5kMghNkP0J1fDpP1gXcmfWX
         5HnhM0z8vbWy3tgHIhH5LmSgHqGJJ8U+QinQbc6HWP67mHAQMJWk3pkWGg6D+Qle9Bco
         Njga7fmhDvuqo6JgP0ZZLt3QpDXkD5UtsOk40MsabAZz/ng3zD8263OelI3rcYqNqNeg
         RIEhC2NEJ2IlmCK60SvYH+G+x80606ruH3IymPyBPqakdGRGTRuJQFxU5CTVI8iyyEe1
         51Tg==
X-Gm-Message-State: AOJu0Yyd85W06U9SThJ4rnUrB0IERfW7t753D/91bvHQ/Jtd4zWyGOm9
	Hlzw9xlGg/AlXVJAEuGTxTzaa2kjcsFu+vgiYq17NrRMllO2vxDO/JMBArA2YCPCTw==
X-Google-Smtp-Source: AGHT+IERE2I9p7BYU8mcWHw1Y9HBtji07mvDioX8gLcSgkE2Ih4vfKxRDTW61yw34cHGdRD7Ux5/5Q==
X-Received: by 2002:a17:902:e5d0:b0:1fb:57e7:5bb4 with SMTP id d9443c01a7336-210c6c6b978mr15380225ad.37.1729917586966;
        Fri, 25 Oct 2024 21:39:46 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.120.226] ([45.176.88.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02eee6sm17342875ad.219.2024.10.25.21.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 21:39:46 -0700 (PDT)
Message-ID: <33ed109e-5221-43f0-8f1c-e188187c581b@linaro.org>
Date: Sat, 26 Oct 2024 01:39:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] target/microblaze: Explicitly set 2-NaN propagation
 rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-19-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Uuf676nzm3R/

On 25/10/24 11:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly for the float_status word
> used in the microblaze target.
> 
> This is probably not the architecturally correct behaviour,
> but since this is a no-behaviour-change patch, we leave a
> TODO note to that effect.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/microblaze/cpu.c        | 5 +++++
>   fpu/softfloat-specialize.c.inc | 3 ++-
>   2 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
