Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2235003njc;
        Mon, 24 Mar 2025 14:23:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJsbR3fAljUd0Xydujo0Nu6s1Al0oDH62u55jT7jZqxEuxxtnoK5oISoFsxiEGrh15Glcf+uLc7LIYjQ==@linaro.org
X-Received: by 2002:a05:6a21:2d84:b0:1f0:e706:1370 with SMTP id adf61e73a8af0-1fe43435c1cmr26110342637.35.1742851438649;
        Mon, 24 Mar 2025 14:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742851438; cv=none;
        d=google.com; s=arc-20240605;
        b=f4BhHilax4EC5rTI98YT5LX7D2gXMLsZCCOgyGdPKxDyXzyfzCyjqiEToYQ5Wa6qVk
         SO2fpQAxfBTtw89sEtJzzAPzz233RCci6sqdS9Yrt/c22a2cZp3fGU7c/8BKFWf2Ofrt
         LlS4Z6ObZ3ifzFk5ogqMzOiREC8zlc0zx/9M0YKYezl7LInCeFj7Ab7Ohm7X4RTpTsE/
         dN/z2lEplWP1bOyarba+hPiAN4x0l8o6h7Ke8oyUZv81itIvX1aCD5Y9pgiNZmsqWCsm
         GC3F4EJQ8OZ7QNtSjoYvGlE/C6XQ4ujP/GwFBiD91sP3rwcQckxvtOH4OPFtZeWcsnzu
         z7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YFDA0JeDDrgv1GyZMFNeItH4CS9p72cfNWmfFzJWQlc=;
        fh=q0jebNMRu3jKbeNC5lPSO+bss26sbDlsOWB86D4uLNU=;
        b=hKM8K16pEbfs4MRcI1lRcCFD5+WgVAStZfB00dzsYpnDVprHS5UmTyYcH7W0HcSrly
         QvRb+KhKblp0RtMEOQ8GediqtsBby03pFNHyamLnrpyO1HLq3b8zs1Hct8ysmYLBOKGZ
         cQzlJgfdLiH5XS5isFf+QXYk8V1vYg2VvTGlqjIEx0VsJHgXoJSAOgVf+mi+VgEcEfNl
         xyjNmIi8uDUYpke4gYoOKMHhknEMkzCXyIX18vChUMzeU3tfxlc/Wf2vAhTK8An124AW
         xQL06jKuMizuVDVU1G7YzVRcRqKyeBv2XBOs6ElXeO+vCM9LNaViXsWjMQjmWESNnq1o
         ikrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XYphRvpA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2a804ebsor4759391a12.6.2025.03.24.14.23.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 14:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XYphRvpA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742851438; x=1743456238; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YFDA0JeDDrgv1GyZMFNeItH4CS9p72cfNWmfFzJWQlc=;
        b=XYphRvpAInB3OkFTAVVfUTesh6L8Y6nWuSgf0KVhTjZtey8+1O59PXHfCktGU79e1B
         nrhlNdLmtCTv3/N3s9006PltK23BKnFadNBv0F0BnCdH0ZAHuqVxvRK+07LSAQ2IWizc
         yaDIVOO2vE0ciUd2yRNuLXdnkWzsrS5O7PALhyPPBtjq6j+sErJ/2FOh+uqhC/9Z6aH1
         tLTlqo3UQqna1YwLcUfi0WAbci4PioNtLFqBgzGD5u4c3SvB7dPzqch8HjnxR2sOErQr
         YM9b63BGdW06aX+6zM1ghFbwNrvovFZQRUdMB+zthTANpJdUDM1aIs4YSjwKADF8kzTC
         LrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742851438; x=1743456238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YFDA0JeDDrgv1GyZMFNeItH4CS9p72cfNWmfFzJWQlc=;
        b=mbk5+H+PYSI2wWXDIiJ2fFiJScxtwV1MMOzox1HqxcNK1gxdmFjODahBPgPQNl6Aji
         QVjh3mi2Jae2VtfXxX7fdUq/O5Il6wPoRC1Kb6c2x33+R8aOJaT2Y4k1H7/PMHXd0dY0
         aNT/uEzt6F1T9IP5b+KeuvWHd5lXQtPQGkI9zAE51jsK5MzKqeXdloQf3/v84cS0qn8Y
         M8MIYnz/fb5ZcTM2Mg59dTZ8AQVfWm1YOE+mV7SDgH3CGuh/8bP+NyH6M66kpAule9pH
         u1ePN8Ydc0VKZW9kD2l4tquozkX6E3e+6J19K8Sl+ZueK9UTN7LTXzgR0e+DAdFHgT3B
         8nPg==
X-Forwarded-Encrypted: i=1; AJvYcCWJoj8FxdY6sLUZ7lo9vINJZ8ed0SufiI3mkvMpvQzqkxNdrCs8lmQ9qTD4+K/NvVBqfLWPhT41xwwk4g==@linaro.org
X-Gm-Message-State: AOJu0YyEQxxY0sIi7Dy5J/tscCEGtfZGs4RfM2p1a1g7pxMVgvCjXoum
	QDhW795OCXPlNFE1AJaPIwbGgX6Pb7NVF/hMLovXiAwCKgMijLSJtriyq7nq6JPcqg==
X-Gm-Gg: ASbGncuW+rk7mBohaZWVTd32Dk7Bl1c918M5UygvxVKyDnLsRuYeN0Kuq9gj2A74tHd
	l/CeJ5yR48k6z/nm5z9Sp/zF2e7osNnO+OIz+LSZDbDBICy1aEFI4IlVSIxj9uag11XX+DWV9Cp
	wl0Fi3rxJj4guIeojL7EGufFtxbrItqIeYJgeqiiy2StvvnbwrzrtZ/1I6NyciVbYDM1vfANBGG
	mwy+fj3lLFVjSMsOYUAegFVKw0WZrH+ugc/VxGKrwd1QBmhdcN2ZkVMVIlaGlDHSB/GWb4uxt5f
	is/6ugtTGFjGG9a5ymOQjp/vg7fL/s/vgcGXMICLpuuEKzxQIm30PxVcAQ==
X-Google-Smtp-Source: AGHT+IHB6vBc7OKIKXxCYp0nll+Xe+XOOJIvF5rYK/LZ5u7+okuz4kyrpEKI3McVEYD3sWnzIOGaLQ==
X-Received: by 2002:a17:90b:2688:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-3030fe93ef7mr24860497a91.11.1742851438122;
        Mon, 24 Mar 2025 14:23:58 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5b7891sm8763029a91.1.2025.03.24.14.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 14:23:57 -0700 (PDT)
Message-ID: <314709e0-3b1f-410d-bafe-37031629eed1@linaro.org>
Date: Mon, 24 Mar 2025 14:23:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/30] hw/arm/xlnx-zynqmp: prepare compilation unit to
 be common
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-29-pierrick.bouvier@linaro.org>
 <2a7a2a78-02cc-4954-85cf-b72f37678f36@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <2a7a2a78-02cc-4954-85cf-b72f37678f36@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XBniabCcPjeH

On 3/23/25 12:50, Richard Henderson wrote:
> On 3/20/25 15:30, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    hw/arm/xlnx-zynqmp.c | 2 --
>>    1 file changed, 2 deletions(-)
>>
>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>> index d6022ff2d3d..ec2b3a41eda 100644
>> --- a/hw/arm/xlnx-zynqmp.c
>> +++ b/hw/arm/xlnx-zynqmp.c
>> @@ -22,9 +22,7 @@
>>    #include "hw/intc/arm_gic_common.h"
>>    #include "hw/misc/unimp.h"
>>    #include "hw/boards.h"
>> -#include "system/kvm.h"
>>    #include "system/system.h"
>> -#include "kvm_arm.h"
>>    #include "target/arm/cpu-qom.h"
>>    #include "target/arm/gtimer.h"
>>    
> 
> Is a better description that these headers are unused?
> 
> Anyway,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Yes, I'll add this to commit message.

> 
> r~
