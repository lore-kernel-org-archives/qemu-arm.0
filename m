Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp821405ejc;
        Thu, 10 Aug 2023 10:08:29 -0700 (PDT)
X-Received: by 2002:a17:902:db0c:b0:1bc:6c8:cde3 with SMTP id m12-20020a170902db0c00b001bc06c8cde3mr3996245plx.57.1691687309326;
        Thu, 10 Aug 2023 10:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691687309; cv=none;
        d=google.com; s=arc-20160816;
        b=hKrdWaTc6h9ca9T/xxT5pSS1K5j4dYtgG/ehKu/D6yRVTWlxUW96a+Y9Fz0uCc+Vx0
         a0TAoMtm9u8FeA8Ft9XE85u7yn5I28zVKst5VYwJmvK2FAURBFDdIoAm0gJ46sFrH4kT
         At2RA1MtfFaO/gb7q8QOU1WxD+CW2D+9+vJ5rSbi0jRbX4XqhAsmEYKE94vKoMeYuRIn
         I+LN+SsUAp4TyrwuCGIQiRoYUvwFgUypu/EUdSb/poi9FP9LL26kDYiAHSdQZHP2L1F4
         MzzPTU/HGE3UoNlvnPhgEaJZiRQAQplM0DIlK5LfJAdMpQwfCj0T5t28r5COK6RgZBEz
         MbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=X2tiTK8ShdSEvcy2YLmekvQATEtwugllbbTpIbnRq3Y=;
        fh=ihiwTNv69pUMQ2yLjv7oagE4C9JLaoKJ/y7zQfEq0ec=;
        b=C4jZ3W9+zjJauqB2Me86nxzSXgg8ArEX1+72lzU4b79E8jXL2eFk6amVFWRo0Cv3h3
         sNPcDZqlSL2/twk5OH6OHH/+As+4pcoq3ji0nZwrg2ps5KNwdPJtmG5zqwD3JdmmX2Ic
         J3w2td4V43MzeoNGg9yXZBMHso9VlhjjJOrruVm5C/UEg+/ndCPqX1k9GbWHG5+1UG8n
         /6/nxYGHKQ3xEpl84pQG4cClIhGo0KvAHkvVwVXFfBCyMJpoegecjLKSNlyPGAaenFAQ
         NNukaBm3XFdCXTuntwtcGelKFwTXvqfBivlgNbJOZosHqcrWVtwb+lAfGsuMCvlh1J55
         Fsow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XQZg+G8v;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m1-20020a170902d18100b001bb8cb67653sor1205686plb.20.2023.08.10.10.08.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 10:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XQZg+G8v;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691687309; x=1692292109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2tiTK8ShdSEvcy2YLmekvQATEtwugllbbTpIbnRq3Y=;
        b=XQZg+G8vyHX9x67QHIhW6cqv2s6eISiJvGkwsB9yJ2a0X4HiSktOpD3IXRz12dB2Ob
         nOI0zFCAPvm8H1lFvt4lSx4vDo/N5AqNzdWWdnSwVoDA6GkrKedN6We2d9E91WqIGuha
         zevQkJnITn69i2MeYMe5AJrmxpg3hl+JerbHMNCtReoN7QE/fbCQgVLv3VTfTbtyZS6Q
         pMSf4t6uYyOrf0wZdJx/TnbsZoIRLYIqtGNMm31UUkc2T2xfny8wgt8QJLxJz7nL4bKM
         kxsGKAUq3DA2w0JZTrdi/sjBrtcm84Z5cdG/6/7f31ea/cvgIQt5cQe+ZOHStQkhdfFj
         N+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691687309; x=1692292109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2tiTK8ShdSEvcy2YLmekvQATEtwugllbbTpIbnRq3Y=;
        b=RFbn6NUJqedYgktQboBlJHadeYqLTFE9cViIbK/VpqbSywajQUdLkyjLatKGci3Yg4
         pnv/nOxcgkg2NQVTKBexVODhpOJV09fWiGp99AIfq8liYBcLuunQXM+Zju3mWXbq5+gu
         AQbqGobA4EQF9ygU7dNUqXZ5KcuM0MXXHdhpXwvEEdD4ZkN+ULcG6eYOzTIKLElM184O
         TviH2PL8eSXto5QQf43kI3+VBoKHW5Bq3aebuhftSq3/6B2s0Tu7873YhFMVTPxYPUzC
         eX+1BQRGC1NMkMcZv9wd06GrM6GDWfk6M+SUFcvc+jPE8+dlkz4WDiWmuxYFOg2Jxtta
         oqJQ==
X-Gm-Message-State: AOJu0Yydw0tKmtub9tBXRpuTfWXcPaCQB9PI78t9WMowZcifji3Pc6Nw
	O/3+90R8dQb5BVemhDrvVFRoE8iv6xvq2PAoi/5DBQ==
X-Google-Smtp-Source: AGHT+IH/+htUrMjIai+o1C86lI2M0kpD6ffvqWy8yt1pcyI17vGdDUxkXvADFxtnJ5oA+TyuYYeaYQ==
X-Received: by 2002:a17:902:7d92:b0:1b8:6cae:3570 with SMTP id a18-20020a1709027d9200b001b86cae3570mr2564262plm.11.1691687308795;
        Thu, 10 Aug 2023 10:08:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d483:7301:9e4d:b830:d4fd:9164? ([2602:47:d483:7301:9e4d:b830:d4fd:9164])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902728c00b001bbaf09ce15sm2024261pll.152.2023.08.10.10.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 10:08:28 -0700 (PDT)
Message-ID: <d4593d2a-e0f2-4421-2451-e46017ca492a@linaro.org>
Date: Thu, 10 Aug 2023 10:08:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] tests/tcg: ensure system-mode gdb tests start stopped
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Yonggang Luo
 <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <20230810153640.1879717-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230810153640.1879717-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: N7C7B959JAek

On 8/10/23 08:36, Alex Bennée wrote:
> Without -S we run into potential races with tests starting before the
> gdbstub attaches. We don't need to worry about user-mode as enabling
> the gdbstub implies we wait for the initial connection.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/guest-debug/run-test.py | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
