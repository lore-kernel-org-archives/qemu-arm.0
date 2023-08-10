Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp794462ejc;
        Thu, 10 Aug 2023 09:26:49 -0700 (PDT)
X-Received: by 2002:a17:90a:2c0f:b0:268:10a3:ceaa with SMTP id m15-20020a17090a2c0f00b0026810a3ceaamr2385948pjd.21.1691684809592;
        Thu, 10 Aug 2023 09:26:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691684809; cv=none;
        d=google.com; s=arc-20160816;
        b=RKIv7PzxLK5d4loZhGICZHY0E1eblU0MnqI0nlw3Z2P4vVmBBQMq3QyT+JM/7JZjLu
         CyRAPuVNd72K3bVpLwrw191R9NIaCUzSbEmY/Ph0f8NKx6juB3ow18lFrljvb0Okupm8
         jLY6nJY+iR9OEQAY1hz47VZ5q3Spy3u/LNQzEd8Xrh+1CC4ygOs7QMtgRaODsTVCqNcR
         7jjJ1UKEaX43CWSG0ZRMgmR24N+LZ+GZjMYgtyGickU6YDZX811u79R18VYvEti22nDi
         IY8F+IS9mAfyjS+9a7U1BaOJXgxmJU1srCyjdhVO1l+Re+Ot/rQ2Hq+TflEySrRKrtgp
         4c2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=px4jMCORn8BkTnGqbwmcdQPd6+jq/StZOLagI2oIQ6g=;
        fh=x3rIgb6pR76UcwmIiKFS64lv55q8E/mgwU5uoS8O4yU=;
        b=ARQtckKOwKxHJVpY0nSpflQNe8gol/qD8N418+e1cb2IsTsAodgU74xJJBHOab0LcA
         qw8FXPLDYZ/KQJ+ASjORKy7GWYtCqxvH6IV7Mimibw3YvBmpIJ28CDNdbDcSmOQb/edK
         YxGJUMqTYn1ANkYrPYiUSk+h192VJF4/CARkDs2NOWYZw9rgDZEW1lPrxjAoHpHrIOV3
         unGBS2BaEZMWWcLzp9JUnaTkFZPWcXrJxV0PZbYZs/ZjWmiXweBw4HLc+rnXbz+CcA3a
         dKl8fkQuMonJILYy7nEXYZq1E7RkJoy8YpwftYSoHgu7Qj/I79raVb/UP8+XzBNRG+zQ
         O5aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g67sP9wh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d12-20020a17090a628c00b002681dd9aaf6sor825518pjj.5.2023.08.10.09.26.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 09:26:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g67sP9wh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691684809; x=1692289609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=px4jMCORn8BkTnGqbwmcdQPd6+jq/StZOLagI2oIQ6g=;
        b=g67sP9whDCA1vrgY2/P/A0GabJVA4ISYYoogp/kUSnW5XTYDA7jUg+o3lUzhrGAv59
         iovEGUXoa9eY+JGhYr1FhkbZ198hI43R9diAXcYEQtXSLu0O65gJVAaic+mBjAclK50t
         8vYGkCOCUZkrmiXP282P1qNp43zZ1ZjUvqAxVp6V+qmGb+hAZqhzXFsCrHExfIRdghbp
         K91NAZJkN78xXfFNkTKus9I0QpRqenKIhrYVlF1nt4sj+kKECJcxy36wB0iH0a5+TMfm
         qcsf0krOvZ0CSL+sggUD1bKFijuJs1hSubzUcv4OtkwlGqvv7H9NwHUUBWQkKqVO4Ag/
         RCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691684809; x=1692289609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=px4jMCORn8BkTnGqbwmcdQPd6+jq/StZOLagI2oIQ6g=;
        b=J7KJSS7Ac6hWeYGlSrMiG+3qExr5g1M/uCVdvzSckxFioXzExlEZy45gytgfHl6bsw
         e1l5gCQPAbiHGaAFv0JoQb0vF8bFPX4q3x5uhqYFgYpUjUbbRhemto0VkNacm01d1Cmv
         zr7t0200vcuxvD2/zy3yBLiXg+f3zLAG9N6aEwJLsIy/Shv47oCs7d5mL59FzCiFPrl4
         hIwqwM6Rwu4S59XYRBEX9npVfKqFauUxvckOJCvDlMkagMH2fBNwP/+N913I7dimmgGX
         X3i0ssxtnPVkJ96hKK4jQF6EYLliOpl1BGT/Tu8c/fVF2efSl2Fp6KOAx5v9kZOUbhac
         i52Q==
X-Gm-Message-State: AOJu0YzEBEObpmNwk29etfXgy9AzIYjlVUWEdaiGffB7KQJmy8REpgka
	jqnu7sGBubmCOGDxDRUWpy1l/U9iniI7MkXZ/pEUAA==
X-Google-Smtp-Source: AGHT+IEcKIVYgPm/YHDHpCTz19NMa0Y8hxmBQOrDAG9CU8MhoDKTAl71gw+b522eJ1nUtp9/Tv2mDA==
X-Received: by 2002:a17:90a:a88b:b0:263:e133:b9c9 with SMTP id h11-20020a17090aa88b00b00263e133b9c9mr2396592pjq.34.1691684809096;
        Thu, 10 Aug 2023 09:26:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d483:7301:9e4d:b830:d4fd:9164? ([2602:47:d483:7301:9e4d:b830:d4fd:9164])
        by smtp.gmail.com with ESMTPSA id v10-20020a17090a898a00b00263fc1ef1aasm3565912pjn.10.2023.08.10.09.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 09:26:48 -0700 (PDT)
Message-ID: <ea1034db-68b6-8644-7fc0-309596ede0e1@linaro.org>
Date: Thu, 10 Aug 2023 09:26:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/8] gdbstub: more fixes for client Ctrl-C handling
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Yonggang Luo
 <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <20230810153640.1879717-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230810153640.1879717-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: doLcoDaB5pon

On 8/10/23 08:36, Alex Bennée wrote:
> The original fix caused problems with spurious characters on other
> system emulation. So:
> 
>    - instead of spamming output make the warning a trace point
>    - ensure we only allow a stop reply if it was 0x3
> 
> Suggested-by: Matheus Tavares Bernardino<quic_mathbern@quicinc.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<456ed3318421dd7946bdfb5ceda7e05332da368c.1690910333.git.quic_mathbern@quicinc.com>
> ---
>   gdbstub/gdbstub.c    | 5 +++--
>   gdbstub/trace-events | 1 +
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>


r~
