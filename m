Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp908379njb;
        Fri, 31 Jan 2025 23:31:12 -0800 (PST)
X-Received: by 2002:a5d:64e6:0:b0:38c:5c7a:dfb8 with SMTP id ffacd0b85a97d-38c5c7ae276mr6925861f8f.47.1738395072374;
        Fri, 31 Jan 2025 23:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738395072; cv=none;
        d=google.com; s=arc-20240605;
        b=P8XeHiZw4rHyZO3xMX99yMKV2BWxVpK/u7kI6H0C5AlH/OA6jLOgr1t2ULd2QwujrA
         r+sk4yzwB1/dM/IFzle33YbS7MtG5qGWJa74b/80BY983khXyVSXQsszLBhEFOPnpHuW
         r9j+6ZbkUI9dFrT8R0HZk1jNcM/3QuY8Gze4T6YG9YwgqU9ydjG6dnOSlaZ1MTKzZmcK
         yvhkBohbKDF1nOuxO5Lv+PLTBC+8OatsBFgpQDdN1jNrkRxNXpFRLu2Y5EoGzxNvunTw
         p9Apppdd4gih21pnTpRIUNMuYnJsMANPcGmbOZiS0gtLR+IkQztLQVZz9BTjU9Pl61dg
         3EoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/WhZsq896KEikgXl3hrYIDN1TZJxEljMBSUI/at75Is=;
        fh=NlbtwF/BrJE1471IcGe+Edy7aeNNU+lgvbgPDcZcnYA=;
        b=JNDbySO75OL2NGY54XxUuKyJJEp2JQIefSYnqF/zr4zbYpMUCaLgU4e28Yhce3ddyn
         aF8pcdzyy7uILLgxRMUixm8IzUw+oc1P83UuEzBen+yvMlm3vCSW/Ap99a8XEb+RonZA
         m9rqyWspV7edFSDdBI6n3YW5rAN6ySvHWcQiPZIxKWfbdV00D2CsQcg6h3RowWk7Bpo+
         D6M+ErotTeH6doz4bxbUJSx8uDQiUzczbAnoMFSSkEHQ8QaeomVUE7nWOvijCpm6OHu/
         zt/K/68cwi9NjaI/w5KiJ3px+rKHs5RDDNyDP3CxQ1FXg5F/ZmZQk2Tkbf9AtTd6+FWt
         E3bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=in3pqbP8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e2460840sor22204985e9.8.2025.01.31.23.31.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 Jan 2025 23:31:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=in3pqbP8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738395072; x=1738999872; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/WhZsq896KEikgXl3hrYIDN1TZJxEljMBSUI/at75Is=;
        b=in3pqbP8FL+twdkMRm6S/wPC7hoqrpPcDFm2z2afKGGZImE9BOiEeYfcS6oqN03wde
         upLEjlwT/GdQRb/x72sDAewXW8L3CZyr/JNLp8sv7/a/E8yYa50AEirp7lvu8Rz2Sm2r
         Hg+hVQjbe1h0FIPo6q1yOIps6Woxy75ENZdq4CpYfl+xQf82RylKSFF+bksUfJeLavrO
         PPXXi9pAzxSQoFbUvWnn0guH2dZeIA3qmXkJhaP4lS/a1J6MX9eRRiYTYUvsNZRfS4xt
         dbiPJQ5z/l45qnYN8HdGFRnK0qSHUydIdLlwqN2Fo47xvzzM99SiumsiCz201Tqhx8Y+
         kxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738395072; x=1738999872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WhZsq896KEikgXl3hrYIDN1TZJxEljMBSUI/at75Is=;
        b=FvxOTYdrexNWnnNoE2+g2vKuNld7AG77yc7xuQYc/JL0pUG9jzR2OUHknww4W+F0Ya
         nve0jwnBNqNjrNTSBB/nWv9qIC3OZbXJPIyWhK4SpLdC1ZtNDs8kIYkTfM2SUkrl9KLW
         DMKqjl+WxXwgo1Rm2ieCpfS7uzik6GAGHRCgj1x8JkmXqv2cm6A0V2MvtMK+xhjvkOsR
         s2kpQUqKFRMik1jqFj1OA/L2F0dNbJmsYND53lUrWk5EaL5FnyV5qvX4f5ET3hH4Xm5T
         kuK7/0FP/UAdxqfE1UYNBOUlzfv1QR/LbfmVOcK1ipRisGuHRGlZiEED5AePKNHQ0Tex
         Qxzw==
X-Gm-Message-State: AOJu0Yxc3yxsdbfQyDGyzTjYw48xkE0Kyz+wRcq4pR/7MRqscYgH0wSh
	5U3SO6txH5jY7V2DnNTy7I9lckb0oWZvZB4srE2fSdr+9InVybN+x4Qj5UgP2SidcA==
X-Gm-Gg: ASbGncsV/RsiYoJsA0nxxxruffwZXwjgfJwAwK6y3kAxrUCh1Tv9kbc3Z6h4HEOTl7p
	nQs2qv5xVWeU5muqVuA39m5RfFsQpnCOZDvHVtHMPbA+/DkUIUGAAFixUlj6hQrTH5bQ86VMW2J
	Fx+g2KawXZlaQ/Jma9TLUgW9Vd7Fj6ciFZ+1S59c2O4odwjSCg0ypSGb/BgUXb1K58sc13zVMz7
	E0GzhhyUPT6xJgFZqmpwplu8QigG0mCmCi3aBepmiECQX33IHP8rGbQ920IEvwLvRXS68O23/qs
	d27sDsLFiqsiUegxj2YTx5rajz9A
X-Google-Smtp-Source: AGHT+IGjabXuScDPjcoDKpFrRUYnVXvwEh04prGOGfnHkHtIytvXzcm1iOH3aPHCt1Go52whE58Agw==
X-Received: by 2002:a05:600c:1c1a:b0:434:f9c4:a850 with SMTP id 5b1f17b1804b1-438dc3c4623mr138572325e9.10.1738395071810;
        Fri, 31 Jan 2025 23:31:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [10.1.1.154] ([45.93.146.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d4456sm80051125e9.7.2025.01.31.23.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 23:31:11 -0800 (PST)
Message-ID: <5272691c-9bda-4f9a-a79b-88d8d3d7c7a4@linaro.org>
Date: Sat, 1 Feb 2025 08:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] target/arm: Use TRAP_UNCATEGORIZED for XScale CPAR
 traps
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
 <20250130182309.717346-12-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250130182309.717346-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: xlYox4TsnbHH

On 30/1/25 19:23, Peter Maydell wrote:
> On XScale CPUs, there is no EL2 or AArch64, so no syndrome register.
> These traps are just UNDEFs in the traditional AArch32 sense, so
> CP_ACCESS_TRAP_UNCATEGORIZED is more accurate than CP_ACCESS_TRAP.
> This has no visible behavioural change, because the guest doesn't
> have a way to see the syndrome value we generate.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/op_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
