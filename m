Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2331560njb;
        Mon, 17 Mar 2025 08:35:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZM3y8nW2SG4QT3H/tcUfdqAskr7QsC9Ne3HT6lTnLWrpDEy5Y9y9BT7k3n9n/zVBCip8aAsw8wHvAFA==@linaro.org
X-Google-Smtp-Source: AGHT+IH1J4VfhTeUrDxT8MkllDFuwsqtZgoLPbgBFmXU5VNw1JMcn0+5ZBaNGZLjifw/7bHoABps
X-Received: by 2002:a05:6122:2205:b0:51f:fc9d:875d with SMTP id 71dfb90a1353d-52480fb368emr415848e0c.8.1742225756534;
        Mon, 17 Mar 2025 08:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742225756; cv=none;
        d=google.com; s=arc-20240605;
        b=W6ma/nzV0HW+ix5dWJYYKF7H3YXOMvee6xIOPlyJuRVVO6CWKxUEEFfB52Gqh93thu
         p9lgx3Fkc0teOKaNqf+w5ytIcsPPmFaISPlG5T+CIyMSoBalPIt8hOapThulllL20XCL
         wmEO+TBpkvZ6r/Yp+SzPwrGnRKLufZwMuQBIuB+qT5OlUZ1LlOTsaNI9F9ysTpryzUIu
         HJEk3xxTKi+5BZSd8gd+BfF0dqg9ntZftQlzzd4vClB+vy6r/Rc3axPszuB97IS69/qZ
         YrOdCs9RSLzUKy49/bIgojDa2LrfQhCte+bRYEl/nKufEmGRl6sv6qs/4HB109+CGzp8
         w2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=TWuw0WakOcmJIBItiI2Wy4xhbLSSM6RN2OaaQmE5prM=;
        fh=OIGxhtTmH6QVmiUEqQC/KlxNFFI3YXAtjGrfrMlq3Fg=;
        b=ZWJZGqC8PF4cL19QeRtt2HOya5sUbSWfzB2h98gXVYL9jq2MGJHVjAr9s2lExi9llb
         0oMXH9TwvksxH59S+6+gH8vkuMzt7mejCC0fpz5Row/r8YLEmy3Ry5L5vOE3ufqHoSS0
         0v/gn15VR33Ix/e2+hRNP+0lj7B15ZGQ2nzIzcHt8rYpSaYg0gGbjrfVpmdm0I1cx0zi
         Lp3NpQfL+MBLxu/IH34QgLm1kHVbyspeEZL+rapzok6a9UkL9TigGdp3qLCx/mwyC2e5
         LEYCMJhx+aeEKR9yk2qy1liB/xiOG/hPJgCLuRiME+RAPdMJNIAY4sTxWpEKFYobPsP9
         Lg3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h1b3M9z/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5243a57fca1si2670496e0c.4.2025.03.17.08.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 08:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h1b3M9z/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuCVM-0007XT-Va; Mon, 17 Mar 2025 11:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCUi-0007N8-5W
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:35:13 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCUd-0005F2-Nt
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:35:10 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3913fdd0120so2400656f8f.0
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742225703; x=1742830503; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TWuw0WakOcmJIBItiI2Wy4xhbLSSM6RN2OaaQmE5prM=;
 b=h1b3M9z/G6wgoFWSl++KAKZnsBjh5yr18SwasV8N9+28hbwcUAA3FWZ/QXE2R5FEXz
 NM8YKYLGGYMt9W8Rdx6+Y6zdaRITu8RNMqmp04oc5jdLjwOC2rQlX04bzud+Y8joef9l
 +gQRLBP3KPObEgPzXfX6J8/19WZ8ITK+LFZJfRIY3gNhnsyFz3bFRhtBPDuASGhAOgvh
 AzK2ypoH9hHVr4TUH4yyc6vT7q2F995LjVl9/7FSl/VPfLHFq8uxwmvuEzwP/XZGxwoX
 WMHZZxHgOxzOG30N1TkzZYNmPw/skkolk1lmXs+3Feec63BzvLEWki441B7Ci7vGJ2WL
 PC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742225703; x=1742830503;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TWuw0WakOcmJIBItiI2Wy4xhbLSSM6RN2OaaQmE5prM=;
 b=ResPGqqDM33K+o2NgnVKR5h9TQyR9Gf97DFNNKQYqS4Ez67Gze+2eBeq9CMiruXbNh
 0hovVkbw/Yek16KhCQFkGVlmX8tacEKUlmLnmKXvoUJnwIJpPccL5xPDNhB2tIN/SxMX
 +winb7eMg+xog9UFQjxxhIBjgxLLrm/vVEn/58aUonlInX9SmCpwW5ma/eNkMwfJvsfb
 Qy1lI1yFkuUQPjM4KKzJ6uU5XF+BhBsM3IM33iDJ+5PSOuxZQyqD8HKppKYZrHobcc0C
 ov9lYkTe44c3njn1bn6rC1pD5lwqiFx0zo+iG6DRWueCKPKAtMCJ9FbIv2R7uAdPOoTV
 ouPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWBnadQOofUl/Jw0hiwMMnOD12S3gnPT1YjFHn9JvoOk22g4pysftxPLqro1Oi3jKFSsbA+WYANw==@nongnu.org
X-Gm-Message-State: AOJu0Yyy2TeqxhxxvQ9gF2ZfwBMl0zPM84UgV3FP040/VSFPkcuqacf1
 W01kuD5wrsK8wknvLxQ5EZqbiad+mtbgolmMvIOzu/zg8BfvbOUbUsh3rHTU80E4A3pVaSZ0LE/
 d
X-Gm-Gg: ASbGncvIYSvSIH9InGK0w+Rghms+Vwu0QQzLdHNKs/w02y84DQGv3G8R6VHN1cUirNG
 RZjx16aY6P+Vn5NutnemYPt+gCiSi0/ljTqWjVy9YT8oHuHTxee/KHexiqaEIsBT+GPawKR3QKY
 PncfVyRC2ttCbAluIlBW4rk2JjX1rBV4vdh0QQY1LxoZVQqOt7dPKw8NjdhFjyiS8Q4TTgKX7+B
 a3OpU/9LHpSTgrZ/brd6GdTPCeM96Z7YnAlrIspqQcMZYpMWBhl0kRjHYoeka719UXbKJGrSU9r
 F7CB7+UCCr08i+OeT/uWfLDsUuHXTRV0pu6PjuFKV0bfrTHhOYXWwzAyEHhjlZuRQOB75EQNsId
 3Sv9psxv86Q==
X-Received: by 2002:a05:6000:1fa2:b0:38f:483f:8319 with SMTP id
 ffacd0b85a97d-3971fbd4242mr15884201f8f.51.1742225702891; 
 Mon, 17 Mar 2025 08:35:02 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975b09sm15567309f8f.57.2025.03.17.08.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:35:02 -0700 (PDT)
Message-ID: <5fba822e-e375-460f-a65e-7358417fed5a@linaro.org>
Date: Mon, 17 Mar 2025 16:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.0 1/9] core/cpu.h: gdb_arch_name string should not
 be freed
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250317142819.900029-1-peter.maydell@linaro.org>
 <20250317142819.900029-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250317142819.900029-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: 12XgPQbjlf71

On 17/3/25 15:28, Peter Maydell wrote:
> The documentation for the CPUClass::gdb_arch_name method claims that
> the returned string should be freed with g_free().  This is not
> correct: in commit a650683871ba728 we changed this method to
> instead return a simple constant string, but forgot to update
> the documentation.
> 
> Make the documentation match the new semantics.
> 
> Fixes: a650683871ba728 ("hw/core/cpu: Return static value with gdb_arch_name()")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/core/cpu.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

