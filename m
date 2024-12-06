Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp696840njb;
        Fri, 6 Dec 2024 00:35:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVqwRX7yNOcP5CvcqgQ4NTmBjQG3dSXzIp4ihCmonviiNZy8svTRKNrl2zkO6sx0Jl2WT6WlE4sJgQLQw==@linaro.org
X-Google-Smtp-Source: AGHT+IFQGdXA8HtUgFrANZhmQ8kWPxbNWsTK8IK1o6U2HKKlvY+bzhphi0XqUhjHkyZkunULQKC4
X-Received: by 2002:a05:620a:199d:b0:7b6:6cd2:b54a with SMTP id af79cd13be357-7b6bca0c60bmr393390585a.0.1733474133688;
        Fri, 06 Dec 2024 00:35:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733474133; cv=none;
        d=google.com; s=arc-20240605;
        b=Ht36jo/INITgwA4rNwsgMY+9PV2ct7mitzs7Juhl3naX/OHQf1ohW51cEf3Y4OptPR
         w7MLtiar8rNwbtcfaHnPOctEkZ3v/VEL31tOxG3YyTo9ohlhRum/uUpE1fKwhPxne1gu
         gSBXR59p1zUicMC5uwaVJh000lipq5pAwZL6+5iJQZ3GJg1wJ5O8kTVnUZlvhZ8uZh4Y
         MvO0+x8fqHz5N6zktXoJhQdyvnK1StFFr/Xe1s2MxpXQ/ait57Ky9venv+Qf8AVhCOEs
         /iYqU9fBHD/48P/W5rysUll0eiQu68GQYZjZle6uR0ez06mj8/fztP5lkx15HopaboRK
         8Ykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bKtoVP5oIpK8eKjtCKbNP6VuvrQ1xGcCJuh+XBFYC9g=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=Ujx09U+ykVZZ5W1qLZJdpu7mAJUpFDTmbrk9i3klZa1NL548x2Kugo5eabJxERvBUs
         sexeBtXCqLgEKEHLZA9PRSh5mh2uKE+boG8HdGS0gtONZ2PixoE7SnnPfKXHnrKMOOnI
         /ViVNHL8gOdevbHVQr/LyeLbicdZeQq6m7HgCLvo4KNBl0UpPM9xZvMRMsMvx68cL/9j
         mct2SRlRMOrbNgPhCaa0yJzD+pmtaqvDdJoQf6X+P1bGZ79Vdo6smrTO5WJLwZaxtv8D
         o8KAsVxEzn3cf2MZz6kb7wQVD99tS1nrX+I2FXF0bPg54E/m9qvoXQw8hJuZBqpgRMLc
         Vliw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=znxcYKfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a8fe9bsi401973385a.251.2024.12.06.00.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 00:35:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=znxcYKfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJTo6-00086Y-5E; Fri, 06 Dec 2024 03:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTo3-00085t-Iw
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:35:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTo2-0000SR-4z
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:35:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso18983315e9.2
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 00:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474120; x=1734078920; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bKtoVP5oIpK8eKjtCKbNP6VuvrQ1xGcCJuh+XBFYC9g=;
 b=znxcYKfB6nR+Ge3CN8MS4qZbvvlmSclXhnmwa0WbL+n8Qb1WAtfRfmb6CobbSmG0pG
 R7vYcAJJwzVojONiIyyj0nhj0O1qnsGYGT4pbE2mAKzbcj6G9GEpVG3AUGRRUbDZXxJa
 2Wha9uw7Ny6JV2YBtEGiXsj4dD1iRlsGD+0rHjmvGd5p57HrH27tqnUEUMc1oHg/HQHI
 uh1pJlYVfAu9IkX4CNu5sswyWSCgJ+Fy1rEq4ICHx/A3cnBtvejF+bjtq7mickZAw6Mn
 oj591daZZw1w8cYLyFKP6d9CjGeRLLr36P/HRAuxF3sK6B2HMTW9czDOkSfd80zVzQo8
 Xg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474120; x=1734078920;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bKtoVP5oIpK8eKjtCKbNP6VuvrQ1xGcCJuh+XBFYC9g=;
 b=tzCs5VZDayEfqQ00rDoUQPXkl1Qvff+/4SGYRxuMFWZCoco8WQKpcyYrpbNF+dIcLy
 2LekEV6HSDjyTdSjGpyd8LUUzspobeCMl0V5w9Qu20ulF14ZuAwGoV/Ra1Hwzv6lebRw
 1kpsqlo2fDpJthZb1xjQ9FAu6EDDDiK6LsDfPnCMhc5AUrpUPY/fKsOJhZuAKB6WWPav
 SqYcYJ3LEFWkiW3/nNO5TwsgQE1QZd6NTlsN25bFohuqKkv7EpiNwmn+Tc8qBHDm2FnD
 QvrxWbwfL2j2ZFA8f3BjnIRECSyEWdOJHKRsj53jJxTEve2ZALl/AG+9TnBH9fqrrOjI
 B5mw==
X-Gm-Message-State: AOJu0YzXJ0EBBvApXvIlx8WdIUkY8LhICOypHyXq+WX67Xr0VCuo5NFZ
 gsqdl0ns4jtsJc5HoJqf3+TfFOtRgs/Vr1+bL2dgLp3fI/WQ66cziH4M19icSUC0x8KHWqGkp/u
 J
X-Gm-Gg: ASbGncuyC8fJgW/0L9kKdl578aoz5LJx5mXXZdeQbTIbIOdScAvtdr2loACpteAWD/5
 ErXrD0GD9OExTJeKa21YSkww/MACln3woiiQ4z5gX3utjf+dNnsEBc3QBNauB/ec5EEM50Ympw/
 mAviKJ0EWIrCA3M5ZB/BjKXWed3MzmCmfMTWvyMaYjaqUbYDjpol3bdzSKzgPgSH87no4ERZGy+
 tEt/4rJB9o8IErB5xvN1//q9Wmd56lYgl3ab3LwjyYecSjpIGyhu0PdaElfq9u61ScwxTZq6ttT
 WQIYvagIEcFqpyfMGQ==
X-Received: by 2002:a05:600c:1f81:b0:434:a7e3:db5c with SMTP id
 5b1f17b1804b1-434ddeb48aemr17501015e9.11.1733474120111; 
 Fri, 06 Dec 2024 00:35:20 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da113508sm50732425e9.35.2024.12.06.00.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 00:35:18 -0800 (PST)
Message-ID: <c0e6f8e7-00d6-4f6f-96c9-829419ce86ed@linaro.org>
Date: Fri, 6 Dec 2024 09:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] target/arm: Convert vfp_helper.c to fpst alias
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <20241206031224.78525-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241206031224.78525-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5hfPXUIkTr90

On 6/12/24 04:12, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.h     | 268 ++++++++++++++++++++--------------------
>   target/arm/vfp_helper.c | 120 ++++++++----------
>   2 files changed, 186 insertions(+), 202 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

