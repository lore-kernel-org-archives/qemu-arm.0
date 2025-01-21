Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp185769njc;
        Tue, 21 Jan 2025 07:56:51 -0800 (PST)
X-Received: by 2002:a05:6a21:7891:b0:1e0:c30a:6f22 with SMTP id adf61e73a8af0-1eb215ec9f4mr29981462637.40.1737475010845;
        Tue, 21 Jan 2025 07:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737475010; cv=none;
        d=google.com; s=arc-20240605;
        b=A0jyJQcaDqbQD8NsASkPksGwpEatXmIbrrDQlb8phvhnw0YJ/CmdvinvCHOAqhDSYQ
         qU9RSThHmiXamo9AFw7hWDwnFXJub3qu+cVg2EDrg2YuaMo58TjGVS4ZS2mKYltua3Q1
         M3htOPrZPjs6CTJDlqIJF+1prMKMOpsHTrg9dSliZTdceB3l/LIq4w3vw20DQtCQk9cM
         1loxIWd0tGoMc1HBXestT5SUEpsBNWLQNWav62l9W/SzEihFApjKaVgDab3cyTb64d7S
         TvB30MlV4CRMtxkCrgvJ1XPFm7X7TMtk4m8rKiYL4+/r9DmPuUwVGiA4ZY6D5rvScZX7
         AbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qg+eMyl81WrVGGIzyuSGBmLQWgX+/+QpXEAprIteRMM=;
        fh=Z9TgYPPhehYnX+a9Hr43JWxW1r67Po2B1YCtGvGrEy4=;
        b=XfGx/6n2BfrFDL+vwZY/PcSpA0UGw52Y4boAGPs72sVO4DVrv5lnsMNT/eKhjs1Vji
         gbmHGoMIdHqF7cAGSHWeChtMbVpvnfqW/V+RZZaHddK0Y2EkUlpaUUsyX0WDvwA9Ds6s
         4Bmm1VAPGTMZksDUa8cjdAFhgZnI3jTpNlBC3Vr+kUJWvqEpVsg11LJ6STmxPRoqy5x5
         oWHGB0nwwE3Hmnyr9jHWCWX0tvp5c50wCEkgtdDnTo0wp8cMf+lQjvpSllf4b7clhgf6
         VyQcCYjTKVgKhNIZUQrEAXuiWaWbsgSp5U9IUMJlUXEE1sXXQYfmov1kv2wYc/a32vWs
         h1iA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gvg3g/wT";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72f4fd3fe2dsor1850339b3a.1.2025.01.21.07.56.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 07:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gvg3g/wT";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737475010; x=1738079810; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qg+eMyl81WrVGGIzyuSGBmLQWgX+/+QpXEAprIteRMM=;
        b=gvg3g/wT39mYu8ZcjCeNo01tVvi+aJ0vdly8J8nLdYJRq5ETBAHCWlDs9BEddDH/4i
         QHU9+sIj4ITZY0iTuM8KxoSHYYr3uX4iotQHDtVu7YcksV2UelYDZ1Q2tZCs4KhKkWbr
         PQeF/FCUNsJ+T9r5jbbgS7GahaEuMYnV6f/YuDCXV8LR3mbpJYTNCu0fn9R/fmXjHwYn
         CwH0xX9w90ASZp6zgy9F4J3BNaHflz3xk78kY4r4bWhaJDXb8kgO5YwPrhV782pZTvsG
         N2xmZkWliWp5viCV5zDgcrCitST/vPw2cvnXvpyPTEKFh7endOOFHce11hjjr9OvXHfg
         LGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737475010; x=1738079810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qg+eMyl81WrVGGIzyuSGBmLQWgX+/+QpXEAprIteRMM=;
        b=b0/F92Ktt3XJjOmljagM9bob63BFqCKTqu5wNJOWVVoP5DKVZhXbsDpuB7It/AWviT
         wUTrlrQDlrby8eId3P7C6q5a2XmqVd77dh3mP7n0DiUwTvSjDxVnjl1rHh0mv/GvR45S
         iJqwy0LShZOwZ+8LCMmmHpv8cNaqYCLltPt2EmTZU6KMi0J1+SV8KijZiXsENxitCYWA
         K78Qok6yRTYvW99sdPcV5cOcHwbY0WZaGiblnoBj7RhuYr0x3KqdzSRINh1tI0YOheFI
         s40QhBatNIS9cU1I7oSv0hlCus4jE6A1SjRRJzjF90HNx/+U2BhaXn0PcDD5OBk/kucF
         ah6g==
X-Gm-Message-State: AOJu0YzXMsiFCJtOg6Y2pGWSmOoKmwysxdn58I9v2AWGEIKHAnbwE1/5
	RVb0xDmmO4axMigucy/iD67MKuO5svnuEag/T6sle41HqlPQfJIIcFi81tYR0F7wnz7kk01xN1E
	ME9Y=
X-Gm-Gg: ASbGncs2j2kaZxkWUmjhjGpdHqFzKdMC1w2phW2mTx+0A/tHHJDppFGvwtX3tjQhVkc
	GnTt+QrJxJrp/jVu4g672F14pkGvffItfnbz1652Gy+nKddsWnJIIscxk2k0GqgXzvEF3OLVYbA
	hesIne/fsh5m8Z8fH3ZMelif1MJOqg5oCkKmGS3363jpdDeBpUFAAoys+llL3ZoIy/jdw0aNxuB
	A1gqTHnvCVIim3RP35qB8wfjyEQxSrYwK5YD3evR4BgfW+hDCo/ltLZeBpn+BHNPpySpmZVY3YO
	bWM1zrf0UdWt7h6kk1+U1osecxVVaHWGmOh8
X-Google-Smtp-Source: AGHT+IH6J4jHo/2DuR1/IaLNHQEiJ+NFzD7gbhJO/IkSgTXbrsxE6zy+uKqW9eJTYUVAjWxRpL2UIg==
X-Received: by 2002:a05:6a00:2443:b0:726:c23f:4e5c with SMTP id d2e1a72fcca58-72daf9be6a8mr22642936b3a.1.1737475010374;
        Tue, 21 Jan 2025 07:56:50 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcbd5daa5sm9085935a12.18.2025.01.21.07.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 07:56:50 -0800 (PST)
Message-ID: <0404f7c8-c50b-4dc0-b65f-c00a95424334@linaro.org>
Date: Tue, 21 Jan 2025 07:56:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] accel: Prefer cached CpuClass over CPU_GET_CLASS()
 macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20250121114056.53949-1-philmd@linaro.org>
 <20250121114056.53949-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121114056.53949-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 43H3z9fYVrc0

On 1/21/25 03:40, Philippe Mathieu-Daudé wrote:
> CpuState caches its CPUClass since commit 6fbdff87062
> ("cpu: cache CPUClass in CPUState for hot code paths"),
> use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/accel-target.c      | 12 +++++-------
>   accel/tcg/tcg-accel-ops.c |  3 +--
>   accel/tcg/translate-all.c |  2 +-
>   accel/tcg/watchpoint.c    |  9 ++++-----
>   4 files changed, 11 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
