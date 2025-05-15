Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1768361njb;
        Thu, 15 May 2025 04:05:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMvjNheWmq5rB1BTlsNzs8ry6e5SbjdsHKHI0ztG0TVUg/g0Or5SjLKt4Ir5xVZHo8mIk+veNf5K0mKw==@linaro.org
X-Google-Smtp-Source: AGHT+IHZAvls8B8ZEb61d5W6RI7oowW+Yafl8PzfmwTEr7EbMYmPb5ieRtNwK6rbzNnk1WcSNh4+
X-Received: by 2002:a05:620a:4512:b0:7ca:f3f7:e617 with SMTP id af79cd13be357-7cd287faa4fmr965376785a.1.1747307149889;
        Thu, 15 May 2025 04:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747307149; cv=none;
        d=google.com; s=arc-20240605;
        b=VS4PSPFsaG0tFF6Sez4YIPpQoiWZOa/bK7aHZ8ZPc0yUscBburZDZba+F5ws7wR+vJ
         ctNXJEqasXkUDr3TWNnd2JXyMORd+GCyZczFVHi5KLfBwQvrVbGF8js1/jqTvXDqA0As
         Ii2we8MsQ3RJpL8uPoMX17WMe5QHG89iJtnSQJgLO0GAiubbl116lGlFpQeUfNlw5CYw
         pAc4S/CO7SfUx8fZwPUcUqR8rV5MLM0p8vU92iBEcCuvDLFXb5DwE5IafyCkdOhntxJ8
         DGprhmFdfMAzPDDDLpjP4r6oVxuFW3D+rytgi5BkkdzOzkhmEYDGFOhFJdFPZF+hvddb
         4O5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dfCJ6+34DY18K/VCdoXvsoJY953SvtWUZZNRIUlvllU=;
        fh=FTv4aZDaQeMAdMgTILYFFSIXF28f9+bxx9pOuF5vxqU=;
        b=BkSJUh6ZIS26NLb9TrukKxn0rI4Yozn96DF+1MVejxwT+QPyt0OWjgxzTFgpT9po4L
         VPch6dZkbLrgCdls4rkqEkmb1vrLIRp2ZdQOZW0jhd4+JlEYHEpldshPicEr4gjJgoOl
         e3rXqm4oHJ17SoPnZokTZ+vK8Y+1pfxSxNC4/VVUAmu8JI3Cw/slsHrj1l51JLJw8uGz
         /QVGfSxQT36JSYjQRaykfsd9+yqM/v+Z4dxwgAqD1hA4Pbs+pV2UODrqxOvle26macoA
         af2pnrHGXxHkuRwkpVf4xyRhJttuotXVt/UnUHgj9cofMYsHX0l2csnxjVnB4tTpXVUz
         HvDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSdU8D8S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fed6adsi1582190385a.536.2025.05.15.04.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 04:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSdU8D8S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFWP6-0000mU-Aw; Thu, 15 May 2025 07:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFWOv-0000iP-11
 for qemu-arm@nongnu.org; Thu, 15 May 2025 07:05:21 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFWOq-0004MG-NV
 for qemu-arm@nongnu.org; Thu, 15 May 2025 07:05:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so5925245e9.1
 for <qemu-arm@nongnu.org>; Thu, 15 May 2025 04:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747307111; x=1747911911; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dfCJ6+34DY18K/VCdoXvsoJY953SvtWUZZNRIUlvllU=;
 b=BSdU8D8SaO0lcErjlHeFvUWPtM8VEa6h6L/io9G2ifnDarjIFqn0Nh9jXhG9FM8+05
 n1EKoXUcbpAWL34gIFC2sJn6BKoZG6Qbow+pssUBmpbnizBSjR0Nfz4zV7bzqtlwEYLE
 fyR+nzfO4LntQy18MRcYyvOe63faRq4hhChl5XbqKN+1iCcMLVC4TohqCA04TVgSVvCl
 kt9Le0E0G3agvbTdS2mPEv5TZHSrt09aGnxDWs36E0/dV/D4eeRiqfo6XAczkweEv5wb
 +p3Mc0QymYsUMzSFdV7ZXZMw1Q8LVd/l9dV3V35WFbb1zh4Z5BupzliPehGCKoX1ts6j
 OAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747307111; x=1747911911;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dfCJ6+34DY18K/VCdoXvsoJY953SvtWUZZNRIUlvllU=;
 b=o94CwrOPKHBf6oS+fYm8sFIk9qU6HcurS6LiJeCrqj/MXlVxl9oZTjuXn6i2MOqxVX
 M88sbE6jIVbRrhHGnA1DyDEystXr8hUAj4b60TMnsYGbAQ8lEzqkSmk8j4GnbIkdENpF
 PE4Y8W3hOhqlziMH6nXBjZOJDh6/BWhJ621I55pNB1+SQiUS70yYdcG3Zph3hoKpKfrC
 yjkalubai6s4IxTT3CyHdfq/3KTMzdvj+w2iUlIMAimgydOus1nk/VxSesKACtatyDmr
 iKKNBX5o0xjzisZKahsSd1LczyAcETpTYNWnzN15m2Ct7w4cqmSMPFpKBUxkIdbmNasG
 TCsA==
X-Gm-Message-State: AOJu0YyAKkgLfkxaSYW72Bx6tZp8ERiHGX1DCd11ALTWLPRccxs+0jRO
 R2ww5eUsQbdQhHTAeRoixS4fWkAcSANIViKfFDSzvFPN7eTDOrYt2smtW724WLo=
X-Gm-Gg: ASbGncsTRkjDk0YKUwILw+As7+lhvR0tUaF7an2KqtwhLSAT+YUgI42Mk0VDNJem4Bk
 erKnuI8Pmhwwj20k0Kvb0KK0X0ZfiDPFv3eXgDUT8qrjDfwEHZ/QsYr+M91SZwYNlnxdI8Js8Nj
 twGpIl9O31qvopTicZUYjM1lcSnr0GPpHcDInlEgNR/zOtvpCDTA29dfrJqyPWorN6AJMilNPum
 RzVmUA4XDd17tcPZ8/X7mdoDnajUPOvlnoCXW4napiDkg9ZiduPJxz7DAULbxyM+PLKCOvx6cOu
 foU1p2UJ0phh442z4aDYJgQ7D3wt0dzEQpBhAiEQVoaHYX26WD5rrd9TyGhSsGTANCSOkn9cPVJ
 ZpbEGfdbDoG/y
X-Received: by 2002:a05:600c:1d27:b0:43b:c857:e9d7 with SMTP id
 5b1f17b1804b1-442f84d2003mr25673115e9.5.1747307111258; 
 Thu, 15 May 2025 04:05:11 -0700 (PDT)
Received: from [10.61.1.248] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951b62sm67170845e9.22.2025.05.15.04.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 04:05:10 -0700 (PDT)
Message-ID: <eff0b1a9-5267-4290-a9d4-da95179289b9@linaro.org>
Date: Thu, 15 May 2025 12:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] target/arm: Add arm_cpu_has_feature() helper
To: Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
References: <20250513173928.77376-1-philmd@linaro.org>
 <20250513173928.77376-17-philmd@linaro.org>
 <b6c81748-091b-4d61-8d34-beaa0442aab3@linaro.org>
 <f7bcd8b2-2c0c-4907-8a0e-af172c235d56@linaro.org>
 <59b1ccbe-9ddb-43f0-98c4-8000a08d27b0@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <59b1ccbe-9ddb-43f0-98c4-8000a08d27b0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gDeA84eXxsxv

On 14/5/25 18:59, Pierrick Bouvier wrote:
> On 5/14/25 9:53 AM, Philippe Mathieu-Daudé wrote:
>> On 14/5/25 10:24, Richard Henderson wrote:
>>> On 5/13/25 18:39, Philippe Mathieu-Daudé wrote:
>>>> arm_cpu_has_feature() is equivalent of arm_feature(), however
>>>> while the latter uses CPUARMState so is target-specific, the
>>>> former doesn't and can be called by target-agnostic code in hw/.
>>>
>>> CPUARMState is no more target-specific than ARMCPU.
>>
>> ARMCPU is forward-declared as opaque pointer in target/arm/cpu-qom.h,
>> so we can expose prototypes using it to non-ARM units.
>> CPUARMState is only declared in "cpu.h", itself only accessible by
>> ARM-related units.
>>
> 
> Maybe we can simply postpone introduction of arm_cpu_has_feature() when 
> it will be really needed.
> 
> Patches 17 and 18 are not strictly needed, as cpu.h (which resolves to 
> target/arm/cpu.h implicitely) is perfectly accessible to code in hw/arm 
> without any problem.

OK.

Peter, would you be OK to take reviewed patches #1 up to #15 (the
previous one) or do you rather I respin them?

Regards,

Phil.
