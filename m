Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2675266njj;
        Mon, 5 May 2025 12:37:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWx+aeIGMfozrnq3IKJCPzztn+UajUnQrYadW0TEMgYhYcCiX1EITQFF7yta0nIFGH+O8IxyBrqDMnNWA==@linaro.org
X-Received: by 2002:a17:902:db03:b0:223:26da:4b6f with SMTP id d9443c01a7336-22e1e90c0e4mr133569915ad.14.1746473847884;
        Mon, 05 May 2025 12:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746473847; cv=none;
        d=google.com; s=arc-20240605;
        b=Hw6k2mDc0RBVb6ORu1kB2wsR1h4sNKw9Gd/JUDVP82DH47uAe9OfwQD++/Lq6HuCYK
         1x+3uvHx2tEGAc614FQ9co5mfqWYQrE6ZGC8lSh5caiyAMf6qhgKBNtuZUPwgsW5p06l
         jDNuqDZXv8nbsGz/iQccgQiVv0Ji4+QckmFZ93aDrADPPw7EHWROJ1iPRq+aSMLlFvLo
         0+1fIsQ/bX9Qiu6OP0/5EZjypayVJuk8C5ZKtjw3INShThDLhlqjFCZV4CKKv0yw4F87
         qg1+dcGdHm1GH3bTgf103M5NvUNLvrpXr5vUDQd3W2oi6lpw/nMHwG8BtPofR0IzQCEP
         I+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sUKHExp9NbjWGb75YRQTnjHWCM1CTVch8pViq7ExJHs=;
        fh=SxllBe62Y8poI19Kdknr4Ut0aY+7TZRugiOioNHGXgA=;
        b=Vd8+VNDf3eliqtH7EBrAApgZAUl6Zuytjqt2RlbS1ztlEmmcH52rMP59hsvG+9/R6g
         /x83bkbdy/BHcWeSGU3/PUdX1n9AaynPLudnQW312uMT+FCgTv2PoOoo2zvB4VF5GeE5
         fUuKji77ELQQeXJH7yRwA1Pfup62BjM4bujesp+zY0BOoMZg1XlbiIY1N9vuORcTI2wG
         ryFsOR2gM6lYIpZzxywLiOjyqSKHlRP7uBCUbqmSYXN1mCKb/FWm5Z99QJ1ONpsxpczH
         3s6xuwhHyQn9ic5Yj2coTrIOba1bb4BpFIkINpa3gQHZgHVn84EDXZ0FzNWpVkFPRePM
         Cp5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Zc7upV/w";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb06f1csor71221405ad.4.2025.05.05.12.37.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 12:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Zc7upV/w";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746473847; x=1747078647; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUKHExp9NbjWGb75YRQTnjHWCM1CTVch8pViq7ExJHs=;
        b=Zc7upV/w/gnNmD2USaoYSuGrotmWtjVypgqpIANytAaCIKIgs0qmlC/GDzFgi75/Vq
         tQnabdmwXwxcWIofIcQlHlkImr956ItEI1mYhFZyfDmCfqZKMYMt8w6mrv7cexpPOcrL
         KUU7G5G4536DdJaonUePRgkGdlazbo+KEFwxybpnExKzaEwlAmeAPx1wfPnW9cv14TRh
         oEnn2OmU/mqtH4x7GnJXd0j9KuVEXKuq0dfi/uBDyarK3GYCaZppJXeJfl7RJb401vaT
         9xTaVMGzFEkLa/BwuksFALV9wgftC7/KA9snMoBjCuh/8mnPq2AiZIym2e9PPaORCFcJ
         FxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746473847; x=1747078647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUKHExp9NbjWGb75YRQTnjHWCM1CTVch8pViq7ExJHs=;
        b=OPANw946t/89CCvttmnQGcJ6bZGiCkJwub/Tl1jbMDb1wfCoyXu+zRWh60iKDKH/+m
         XOabixzSlecRU7wox41CwST8teE3xUjUOjTMwsNtdajc/3RFI2m7Q+rWQxPKXrMYKhsc
         q+Qyz71R+NYqFzi3Plgq9l0ogBvn7gnBWsDaWpU8IgdJENDVnKgkVOSiy/LLtTd/O2jC
         GmkbIxhszYIwJHs64z8jVTh8u60u2NQHyRGNpLAHeu/cA+GsnHbbstct6uaSxUgl0aTw
         qrNTl8b9S9kXy4O+l+j9PR/c0RkKTBuwzFOBfrp4VXxk7IROeQ+RJPcmreP0qllKeAvE
         +I2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6RcGH4ljE7gXw4cCWsRn/T4axv1/PY2giUmTK4g6OHd+L0aangqf63cPZwPBCE1nIhx6CsKtD6adtvg==@linaro.org
X-Gm-Message-State: AOJu0YylmEqy599Yu1N7ZfNOyQBdysw7WW1l3ROQ1XawOWTlANVvNwcC
	B3GfU2pInKVN/YMNiGsygpDyF/cFQdJXbO736O7zmiFi6YQR6thd7q+YPpaUVUGNRw==
X-Gm-Gg: ASbGncsJlu/5HEI0hzWJQ3UQbxPSRDPJZ0+KlIYBRQOUFFbalQF1uQe32D2x9LqMCbh
	pImH9jVPLuMbOrHd7JMMvrU/nGsEC554hVWBxuF3+d5g2X2t9FzR0iLnIgZc5P6K/VNXwKFNOzQ
	qVRN3x9ddTnE7/jsOUa7Ol5JNoqhKbk6WSE2JrNALIyzvl1f6LdIo7EZZqLCEwboTIQaqyDbxPK
	BXxFphbnU5lTToxEbR8dg25cSf3t6ZTG03rsXFh6fc4esXpcaRwo3Ih2eJHqLtTpE5BgMG/pzmz
	LleKA+8fBWJs3KEOhM0WNbc6B8oG4I53Epsq/1bnGVMeGGwoDFQoWECdD8nRksXraOWcI+lu7k1
	FLMAdIDey8GIq6rjcyQ==
X-Google-Smtp-Source: AGHT+IFHLGCTkJAIaTz0cBKQi5KISLaAoM4Rjvto0c/ddqPAd97jaswHhD+/NkXo6Xt1EUBJR2FFEA==
X-Received: by 2002:a17:903:41c4:b0:223:52fc:a15a with SMTP id d9443c01a7336-22e1eaab925mr125088655ad.33.1746473847458;
        Mon, 05 May 2025 12:37:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a136esm7258019b3a.167.2025.05.05.12.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 12:37:26 -0700 (PDT)
Message-ID: <bd48b05e-34cf-442b-a645-e955d82e6732@linaro.org>
Date: Mon, 5 May 2025 12:37:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 47/48] target/arm/tcg/arith_helper: compile file twice
 (system, user)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-48-pierrick.bouvier@linaro.org>
 <e8eee40f-3785-4816-b96a-af022b3031b1@linaro.org>
 <85513f8e-232c-4d66-ad03-15c4f697dbae@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <85513f8e-232c-4d66-ad03-15c4f697dbae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: YNZpTtq5GWvN

On 5/5/25 12:33, Pierrick Bouvier wrote:
> On 5/5/25 11:54 AM, Richard Henderson wrote:
>> On 5/4/25 18:52, Pierrick Bouvier wrote:
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    target/arm/tcg/arith_helper.c | 4 +++-
>>>    target/arm/tcg/meson.build    | 3 ++-
>>>    2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> This one doesn't use CPUARMState, so we can probably drop the cpu.h include, and thus
>> always build once.
>>
> 
> Done.

Thanks.  Preemptive

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
