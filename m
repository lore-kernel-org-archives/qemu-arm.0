Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp639500njb;
        Fri, 13 Dec 2024 10:08:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXc5tfpN5gX2ksNMkk/13+u+zqWnXtYT2+66LBjPxSoe5xg9iv3NzVZBUZrJVrbg00hHPZYEuJmcP3lLw==@linaro.org
X-Received: by 2002:a17:903:22c8:b0:216:18dc:43b3 with SMTP id d9443c01a7336-21892a59640mr51701035ad.42.1734113292597;
        Fri, 13 Dec 2024 10:08:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734113292; cv=none;
        d=google.com; s=arc-20240605;
        b=Xs7YwQf7NlCyj+HvnPezKEyR0D0X5mSb1QSVbJp2sA1aieLdCef3msAbpNpXFe/IMA
         aHv3H6sXzZZZ+hmI8t3nOqluITJouH05zExuEUwe7sTkdudk2cd+FE8yP5G5buaQ+O4e
         jVDsNOrRfjZFIMSA+MNXJ/I4ND3IkYmoEhUT6PzxJ7CcYm6GWMeNdrCaOCbvBf3XEC+T
         Vz9mac7FU2A97h6R/ystSQcPVwnioTRCi1LU850fNtpLIcXGJpEXxVJhTQ927t/J1uqU
         RCJbasV+h17BcOSF5Ye9UY3Os1UYTXexa3nbkqHqnsrFczoIuayMCyYukwZeJiGvTny0
         reEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=32K7dLQssYS+4P7/hRI0aZ38jcfbfSvmbhPnfFuI2VI=;
        fh=Y6/K1kMIjakkcWQy395Mq6hXQvquuZX1z1M/NKhNckA=;
        b=eOgZ0iwqFG2YsFdQhShx73vTyoHhFdAqiwEoSd4Is3FXmJuQwt6zrmIIB0/gJfKx7b
         LpFrq0HaOd77lcxcnAwQVcD+L/SKcuiKPdbasg63GCxr2iu4AZKAM+ip5NLel8PCjUPE
         uA3O6X3sr3Yi79AObHFTqJQZ4hnKMzg0wEluXsRa/5QgxYWkHLMRPp9QPmWLclul2CNu
         5uz2KqNRsN5Xzv/r50pDYkmZzLf9+l2FVXMup1CwY8SZqTAFdBhfbqnL0TrtYyQgS4M0
         uZnFBbmT/IZehZZLC2pT9nvEP/yy+PBnTKSzhEIRIbWM6EMvxRT2wjI6f9Bst49OnMMX
         YS0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPlvV9WK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-218a1dd69e4sor699315ad.10.2024.12.13.10.08.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Dec 2024 10:08:12 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPlvV9WK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734113292; x=1734718092; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32K7dLQssYS+4P7/hRI0aZ38jcfbfSvmbhPnfFuI2VI=;
        b=MPlvV9WK0hOrArMudBLs2+aN8lfinvJ5lOgEeYiSD43htcqXUvxTmRQxXZDxXYy3Xo
         jWbXcKheVdULnPW8+5zsTf98a1fjr/eBwPAUqiTjIw3XNc3myU+7YUMn5PpgZNBAL4Mp
         3pMYu+lt8grUwXFMDUhf+rICstSpMou8zMCj0P2qVC8wt7sfUNqmxX95q4RKyGLWKKN6
         XKQnNRnkW92FfYhCx2sBuqqfezF4NJOIpV14DIg8LIsCrQ1ZF4lYSNxXP5qNvahESKTA
         GiVTSFAdSCrU0Y/aOMN/CyVeLFONk4g71uCZ13NJawcbuOgbTBv8J+ciPr08MBPW1LNj
         aUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734113292; x=1734718092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32K7dLQssYS+4P7/hRI0aZ38jcfbfSvmbhPnfFuI2VI=;
        b=KC2xwDRNfMmOPTtHdafDoiWlmol9Md2AsGOy6RyxWZg45LHvBKG87Z64V86hov/cML
         kTjCe0oc3ysOReBF5pou6oB7E7GnhPPfbJ5kh5Zcd1ovzjwYTOQ8N389JBI79ah+gZHL
         +HPsOPdGrHftMprRRQ/EYjHndIj+wnLLG+Lm5JcH9BPgbNfAsk/CABfj0WgT4mzyLA/0
         iY0K7okisp/N/zex1pQPeHhIxRQ4uwb6FK6tD3tdZYFIuOsKHC1448NmRualEnamR8T1
         AH5y71/4Vh8Ol7wQ7oWHmMfCh0Iu6TpJhj2zl5FadPwYd2ddmv9uabnRX4v6lQAleM8A
         ElLg==
X-Forwarded-Encrypted: i=1; AJvYcCVwMaIxvfQMH2vkP9WgSjhycmIhUxZXJnKEY/sDYRcnObjoUFi/f0UwsB25Jf+DntPz0kKTeGMVfx5UcQ==@linaro.org
X-Gm-Message-State: AOJu0YzGJ/RbQ68e7PzaiJZ4SvjEbV3gK4eq7b+FNq9IoaVAqskAEpTo
	lWgJizBPERA6nU6d94bskPUf4tGNhk2EJpbSqSeiUE63+dmiQymoERqcGWpC8YMZPQ==
X-Gm-Gg: ASbGncsuP3yzRfZv1NA5vUQa5G+3TOY70AnCTeucXa9mJKcecEEpIvh7YHNhuhQwgHb
	um0nw1ZQguGjuAt603xFYHcv5V09N/maauhXJGdzjrvGJCrHQTSmrNh1ZVgS9tvi/Oa3W4bqe6X
	k1FIxC9yoX/q95J9y0hTmJU0bDzlMv9zHaknqzrZ1q4G0/qIpnM3+y2qizWFf4SIQUlxVpU7QBA
	8TYBjwgrcy5eOIbjqpU6UB2UBm49tF+xGb7d6NgBQN9sqLBx5fdgR5y21F48ej0YaTONjKDP6u4
	tLSWSg32CAsBzfi4QEKVtFeIyccN
X-Google-Smtp-Source: AGHT+IELi90T2T5w4fUGYnNhmKL+wn8t6xo50LzYOQsdbB/wLVUlw75rJ4T6pDaFU048BR2YL3yllg==
X-Received: by 2002:a17:902:fc48:b0:216:239e:f90f with SMTP id d9443c01a7336-21892a588e3mr54978685ad.37.1734113292189;
        Fri, 13 Dec 2024 10:08:12 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dccb0esm631825ad.94.2024.12.13.10.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 10:08:11 -0800 (PST)
Message-ID: <72ea263e-4052-4d57-8d58-24b56545647c@linaro.org>
Date: Fri, 13 Dec 2024 10:08:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Minor fixes for Arm documentation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Troy Lee <leetroy@gmail.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, alex.bennee@linaro.org
References: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
 <CAFEAcA8TKyEJrPcNz3NOzv_LOkh9ENKiyMtBgDmH+xdEwZBqOg@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA8TKyEJrPcNz3NOzv_LOkh9ENKiyMtBgDmH+xdEwZBqOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: kXeLVk42GCsR

On 12/13/24 07:37, Peter Maydell wrote:
> On Fri, 6 Dec 2024 at 19:23, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> Reviewed following things:
>> - system/arm/cpu-features (options)
>> - system/arm/virt (options)
>> - boards documented and listed with -machine help (arm and aarch64)
>> - grep object_class_property_set_description hw/arm: ensure all options are
>>    documented
>> - reviewed boards description
>> - reviewed all Arm features (FEAT_) from: https://developer.arm.com/documentation/109697/2024_09/Feature-descriptions/
>>
>> The Arm section of the documentation is in very good shape, and this series only
>> has minors fixes.
>>
> 
> 
> 
> Applied to target-arm.next, thanks.
>

Thank you for merging this Peter.

> -- PMM
