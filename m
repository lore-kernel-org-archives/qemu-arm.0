Received: by 10.28.71.27 with SMTP id u27csp1210309wma;
        Fri, 23 Feb 2018 16:19:04 -0800 (PST)
X-Received: by 10.98.19.146 with SMTP id 18mr3405300pft.3.1519431544351;
        Fri, 23 Feb 2018 16:19:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519431544; cv=none;
        d=google.com; s=arc-20160816;
        b=GJc3rzIBojUro172+cpaduXXs4mS0tYj39OGXB53wDjtXG5wWHcpff09PTDM1A/2Tm
         ovOcI5wrlCgRpxaAf14FoBerhbdXY8lF0+QToQcA5cBQMTxftp9lsrPf1pN4x5oJI22H
         LIgWzjfh71S49ilMIknZB3Y/skZpDSL8ck9I7K11X1EOgHjEvzV5Q4qENwG9j5ZMI7/m
         pNqzcI5tmm5xl670Sa3UD9LVpOQyOtMtPyEuKZ/Ma+go+iD+73WG651KkNb8ugLCWppz
         +FCXqrWHsGinMkml3eOujQvSTIrKTJ6OQGjbRhyJJiU4fqZHq2+ZVxMCx2YAh5vg4JPN
         rpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=LnRWh5mP+hpD1DCV2QDBNCnXRFHHYuQ3kyd9kZWd/Do=;
        b=GCwwrNB54IiIvYGW/MIYRMMlmcPbh1QS159zJXe8B9y0/AIe4+kDO+Kz8nmAmNsF0V
         teaoN/ALYDCuMc/GAqBX0cfLdkqQdc5ZX398I8F0jHRhrOOCyEgYIDQVGzMXWmZzEgJh
         k5n17isQVVkGMG2+gRlsTUP8kOmT0zkmfWHsOZGPW48wvfTNDVXiSWzByRpIn93zUl7/
         rRzDnnQXsFJz2X88g3YGStC2qLDbV3ZpUjjK33hOjeUwaTzk3yip/mP1iY82/gvsxbik
         B8nx5Fqhhl5zJdaGlvCV1ZHcVFzqNgiXiWeqrjzk8OUTFJrIqSUB9RPeFAuKUihnNjqg
         ZVJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kq+C+tIF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u13sor809118pgc.5.2018.02.23.16.19.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 16:19:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kq+C+tIF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LnRWh5mP+hpD1DCV2QDBNCnXRFHHYuQ3kyd9kZWd/Do=;
        b=kq+C+tIFv9oLFJ5Vpo5MsZJVeU192ed4kRiXDjYMdLG9WUM/u0tgwcQ4xTtbHm3Ooz
         W3zZJXHkcBRdWOlpt9K2KjOgiprJsQAhigTIrpX5FJGWTXbbdMSgkfyvNyAuV+50cM+f
         ovlJTrKUGo8eiiORnEfUFr6hVp0Cm9FUGy/KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LnRWh5mP+hpD1DCV2QDBNCnXRFHHYuQ3kyd9kZWd/Do=;
        b=ha71meoNwUgWkVyKnb3LeSiAESJSeehEhHDODnjYNkhdmipp9cCJmqF9xeDpaudims
         /7cF7T11Uq++OgzCZzbHbFioJ8hWrxjhhGzCBtqFhH1/OQjNEBpi87OlNWCHYe+GmAPA
         NAtIsLHZgAgiCG+6ENEGlMhLv19Bx7nRz9SiXaap4k8b10jCM9sDDBUETxUUkjy0AKes
         o/hkunyjv2OjeCCOBT7AoA88NffWBTDVdVGK3pRo60+0bjvzeBqrPulpiPM993Lkf210
         FaEh23/AlNIh942O/gPXTAHxXdHJesKzYIrZUrEyWOADlwnPg/QPz/YEWIkoW0o9TfJj
         ixvw==
X-Gm-Message-State: APf1xPC2GKhqZrr57HKd8Jy0436JKYFUPQFEkdnz/tbzLQ05B8oFzG9o
	IQhgXlGZlja0xyIcgDxi3zHVHvS/czoHIQ==
X-Google-Smtp-Source: AH8x227nJSkElTSzanXWuhiPHQScGrinNmDcR4jadA+nRChx7r7YUzqUGH8njp/Z2RF8brPoMqNtgw==
X-Received: by 10.99.174.66 with SMTP id e2mr2721525pgp.269.1519431543881;
        Fri, 23 Feb 2018 16:19:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id z17sm6429880pfh.183.2018.02.23.16.19.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 16:19:03 -0800 (PST)
Subject: Re: [PATCH v3 19/31] arm/translate-a64: add FP16 FCMxx (zero) to
 simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
 <20180223153636.29809-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5042c1c1-2831-493a-ba80-13593b3a3a29@linaro.org>
Date: Fri, 23 Feb 2018 16:19:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 3am8KeNlb/44

On 02/23/2018 07:36 AM, Alex Bennée wrote:
> I re-use the existing handle_2misc_fcmp_zero handler and tweak it
> slightly to deal with the half-precision case.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>   - use size directly wuth read/write_vec_element
>   - drop unneeded break
>   - WIP: mess with calculating maxpasses
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
