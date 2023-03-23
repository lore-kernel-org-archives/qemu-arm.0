Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp32266ejb;
        Thu, 23 Mar 2023 10:48:34 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c6:b0:23d:2e22:17c9 with SMTP id kb6-20020a17090ae7c600b0023d2e2217c9mr9146709pjb.5.1679593714521;
        Thu, 23 Mar 2023 10:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679593714; cv=none;
        d=google.com; s=arc-20160816;
        b=LoufrYaJQa1gudyjRfynG5Y9RiUp8GKT+e3VZG4IA/dWDBeS2RQprw8H0kVv9wKXjI
         g3IFrazBY2vxQjwpppy1PSOnknxls2ty/wWZnJ444qKA+3J2Cxi4WT6fxdrud1ibg2lJ
         +aNCe/V28OTXqaSpm6EIX3B0uuyf1XVIZY7vJ3gmzq5mZtz40sMJUTTwIBiJklxgy7Xj
         kuho56Ceke0AOYY7CRhLvOikYTxjMAh5tHq7NHDJqY2SJK1T1ujdKnFarla0r+R7e5/s
         odCO9a5wQ7Qxb1Vx6JASBFSXazz8YmmPUDvDqqaoLypgnEmbXfwj31MgbexpOSFa4mhD
         n+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tpSHgag7oDF7b3XX7frMCFiFI0qk+MEf1++jYO8FlS0=;
        b=tsHywByKFkkziBrKUEDlqB8VhLYrU4KLQ/rYHfT+gS1Ldq3Kss232/cZhoFQFefu0H
         Iwct8uH9bORuZRvhNeG9R3m37b1AFfohuRJxydjyxvNvhTa3lTlvdvnlJfiHNPC7YLU9
         P8SR2SDKnnNr+m5ildyZLp9paV9N+zntisQb7FjDTA+yMKSXfOjO2tPUo30/mvDeTfUQ
         1qh9oMR0Vju0tOutFlIH9BN29PSqbABjtSAIb42XFZ+2OaDtYaABv8Fh7PwpKXNjgmZ4
         x1Uwb8ieGuzEfzgZWFM/XM1NcPyWhge1i0gtx2S8QtJ9dX4Qtq/SbsGFlefJp7GXa7qY
         ubDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FuCwYF0P;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h15-20020a170902f54f00b0019ec46acc5asor7819398plf.180.2023.03.23.10.48.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Mar 2023 10:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FuCwYF0P;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679593714;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tpSHgag7oDF7b3XX7frMCFiFI0qk+MEf1++jYO8FlS0=;
        b=FuCwYF0P/8mjjMlF6KC7Z9X6H87xu7PPkoIJ8Jw1A7i8bviOPz2XehGLxIryNHaAT5
         1+/ugreR8S6aXmnL5q0Jnu3NuM/XTeUVWpD16uACvMWN/Ytn7rvSpaGMiuDaXooJ2HIQ
         +h4+oXUdMp54tFtgRnMKZmxr1JbUlo+v4+xvekR3JkaIKVocy1sAH8UVNTUhuu1PJ32O
         /dtHR+qOWn1FpLbcFErR3V+VmEDS3CWquPXvzqV4oS41GTQf3DPN0hLp83Pi3owioXM+
         TcN8Od42U05eWyZYscts5yNKLQ+ODg0trqDgK6JzEqq1fU+Xjg/s71HC0yAuzdR35oSg
         yHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679593714;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpSHgag7oDF7b3XX7frMCFiFI0qk+MEf1++jYO8FlS0=;
        b=6KH0abOZC/7XNybypMCvUd8WIfq+eL1YXYFkW2cq3A7F2fymrlUz2qTQMYXQGULbZo
         +AfT++HcwTvQNI9M296EjGovB4izXl95d5lS0R82cHnLiFvTwekce6jR2ZZyFhSNM1AF
         ywA/PVdgykGowu2jss1l0pKh7kQUUl7XT1tKh6aqFIuYC/7oG0ERbt63VZlO+hDoEjbl
         yffgon1219lS40TP/myKEqtqAyD5zMFVSNvNEQsZPEqOh9+r8bt4006SW0GcVgr2HAZE
         XlYT2cSP6KGPvgX4YW0MzQ8mKx21qW6OVAS5rjRDKn1pu50WQNgvX3AVAhzyTFo/8m1N
         a5UQ==
X-Gm-Message-State: AO0yUKXlmLKnJbO++BRv1388XKwqye7zfvPnazMGKh2kCZ4c/6yRclKm
	udPTUCPVMJoySNocJE4yTpisVMuZ
X-Google-Smtp-Source: AK7set+iBaXID/Fa2gihfLgX6ZV5kRNAtORGK+e77cVhXOZ/b37dFwxJwi8p4wxPb+0+4mG5HugN1w==
X-Received: by 2002:a17:903:d2:b0:19e:6e00:4676 with SMTP id x18-20020a17090300d200b0019e6e004676mr5698835plc.61.1679593714065;
        Thu, 23 Mar 2023 10:48:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957? ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
        by smtp.gmail.com with ESMTPSA id b14-20020a63eb4e000000b004fb5f4bf585sm12020021pgk.78.2023.03.23.10.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 10:48:33 -0700 (PDT)
Message-ID: <f5c385b0-9d84-f8e0-704e-fe7d9ef1747a@linaro.org>
Date: Thu, 23 Mar 2023 10:48:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 7/8] target/arm: Implement v8.3 FPAC and FPACCOMBINE
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
 <20230322202541.1404058-8-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230322202541.1404058-8-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: fThqGKnMCGfi

On 3/22/23 13:25, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay<aaron@os.amperecomputing.com>
> ---
>   target/arm/syndrome.h         |  7 +++++++
>   target/arm/tcg/pauth_helper.c | 16 ++++++++++++++++
>   2 files changed, 23 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
