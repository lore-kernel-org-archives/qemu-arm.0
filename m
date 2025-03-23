Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1563897njc;
        Sun, 23 Mar 2025 12:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpLzJUNteKF/ArsCrIxYZtkxK18uxUZ4Wtkps3izYeaF9kF1ua6auwPSuJNOfC5ZvtADZvSFBOBOOEog==@linaro.org
X-Received: by 2002:a17:90b:528b:b0:2fa:17dd:6afa with SMTP id 98e67ed59e1d1-3030feb1d3dmr18825186a91.17.1742759461894;
        Sun, 23 Mar 2025 12:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742759461; cv=none;
        d=google.com; s=arc-20240605;
        b=D9gUapsEZt2dKUNf60S1KEUTA79/vjxN/XamyTrq5i/5T3mh42hmWT7RSfEpuy3gTN
         YvRt/f8sVNpot2KYER38csoDpfhlPv8apk2V2N08X2TSdresfEOkZRE6pWMmBAvzxRcr
         jkhOAUwgnUp8q/M+x6eAewmGZ9Tr8n6oYne/HYRyEULf4B4Ei08i1lTf6vlUTKaPIoyZ
         EDLDgLUFCgDLaR9MVhKJDCzEgH+guCe1Flzts7yAxUJbOT54Y54SE9LfdLAPUzITIjjk
         4yny7CUmPKsGwToNtsA/d5j3mwChwKOi8rSAyX8NhNwJcsN77LT/xAV1+oDOxAzCjH4B
         vftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1cACQA11NUfjHlZKukc9yFXklQ9Z28sUCMFdeYvHLg8=;
        fh=BKtOJDQ6Bx4hAZyKzLWO5zNq/epPCpdoLn+/HEkJTUM=;
        b=O1PmnCxnMYGy107oZ1N1zlczD04Aq0wICJbuK3AdN/tGYvxHiDjBiBS6371KDasIEB
         99ilu4UcaGbOenvy4ZJierH1te5fPVpz+qI/zfGBTji4YzQbz2ADbKvNT6hHJEhXZXF4
         ZeE3gMgO8aOyL44qfDVV10B6EEjdWr5C1TselC9i1fDD6jMprjtN6n7wEgWW67XRknKt
         CaXVwF8qNdydv4nWhI93CFsMyToorM9upYAzgyyE211FwupvlayERbX6g5lCL3OveWO6
         2gunZBysusbghWlYfDCMulTj9KFJgDLKVvThGzo5kRURE/q3tLXCXlYpqjSZjapm7DvE
         xRAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LiZIi+Tu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f5c6fc5sor5486223a91.1.2025.03.23.12.51.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LiZIi+Tu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742759461; x=1743364261; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cACQA11NUfjHlZKukc9yFXklQ9Z28sUCMFdeYvHLg8=;
        b=LiZIi+TuKJr/WuZYqx3FxVTl7PB9Tef6jZ+22gOpEipAlqExHbWRv0+POSHK6ArWeX
         vr/hCxy06WqOfm9aC4pQZzjdOsq5vlrK9H8oPUDJv5I2WCi2lDWamliVykVfHfb4p+zg
         RDLBAknHyvI/SoIK9Z3diOqv32UBDzLNxHTsM/MxfSXvX6ZNoofvtjDpnigcVt0MnMVM
         XzzCvxdl6EyCHgUzCZMsb1Ov8rYBVl4tRLpFHfPYnNFJK9kXudadOo9bA4nrUFqxdckg
         isZxd4KuSo+HN4DJK9jPd/e8n6pnzVaCsogLTsZfZx+OeuTmyVQ/2UOmK7eNMZ6zLbG2
         XC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742759461; x=1743364261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cACQA11NUfjHlZKukc9yFXklQ9Z28sUCMFdeYvHLg8=;
        b=rymPwJU/vzOF3eFhkxy1CZQFmn9/rugaRYiLf/7dOPtBethG0f/bI5KFJwvS+2KLZE
         KyuhSGfGTfRr70hj8z/N94AA77LgaOd81nUVdn++cjvjx6gtA/mpQWey/O7thuf2oBLL
         mgptFaufYZQ2th/UEkVsqJDRZBmRUAGWgTrU+R6QxkMVEMm87lMs0q9IE75Mdi1XpcNU
         EddC5aUhYqY12zmSkPjUAzsIe/AJ/b47i5YcJIoITMKHoCKqIdkoV47RgNWaNWOaNfjk
         uo9QQhNKdXyMpMTSdndrHBKGdGpA4oRVFo+Y9mCXaVT2E91XqIeKWVS0+yHlnTVoTzr8
         YGaA==
X-Forwarded-Encrypted: i=1; AJvYcCW9dRGoKE/cUzqDxrzjhBxmj/7kRtDqKfS4Nkyqcht+VQcENUfpuT0Qyb7IPBvb8QEHjGwJuSCixrV8KA==@linaro.org
X-Gm-Message-State: AOJu0YwrSzkEWPWPPFPaz5UaiJuzSTrCBaqgCupWp1Z2AtpwtxfEHCzj
	gjd4QkAL7LovbQ5ZYm3lMpHKTgvffEzhO4lyLhVk+rdcleAf20Nx5qSgMecj0oEDx+VOuaBtnVn
	d440=
X-Gm-Gg: ASbGncvMxTbu0s7btUkI4OB0yUNRR/HCIKBVMSHrPnZOy2i9C9HbCcMtRApkCcPpNmm
	mS70tY7xX0zTG7VANROYE2MxRG0A/wFnFiDPRd2sT7zYnl9mhs6PLpCg5kMHyBdQpOp0ck1Vwi5
	nlG3IHREM6SKjEekZ0d6/3T9Itw9XqzhdpIEuIk+a263Ckw96BhliY9aoBfi+Q7tZHRLNv8ZItb
	AvqU83NRIqiRHry26+uFqu4KJXxJ8ct96TJYb+cHM5i29GOYCwYDyyU/F8WKcLxUne1wTwtC1j3
	u5wBGxagI9Fg9zu69IflQ9mI2LKpGPvB8pVD61Ms3R09xjtriaN47wVif4EKpK13k+AiJWLWA4w
	yVWONdrJM
X-Google-Smtp-Source: AGHT+IF9tILNR/1q7pcFaBhzR1mDJV3PWl9v+xc/N3wMTWCmiaYVNWI+gppKnB8IdDZBX6M6C/fgGw==
X-Received: by 2002:a17:90b:4fcc:b0:2fe:ba82:ca5 with SMTP id 98e67ed59e1d1-3030fe9c927mr19623821a91.11.1742759461401;
        Sun, 23 Mar 2025 12:51:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d8287sm6390252a91.15.2025.03.23.12.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:51:01 -0700 (PDT)
Message-ID: <c65629bf-dcd0-463e-8d72-5f8e5fba2f63@linaro.org>
Date: Sun, 23 Mar 2025 12:50:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/30] hw/arm/xlnx-versal: prepare compilation unit to
 be common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-30-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-30-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9ImX93qXSESx

On 3/20/25 15:30, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/arm/xlnx-versal.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 278545a3f7b..f0b383b29ee 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -17,9 +17,7 @@
>   #include "hw/sysbus.h"
>   #include "net/net.h"
>   #include "system/system.h"
> -#include "system/kvm.h"
>   #include "hw/arm/boot.h"
> -#include "kvm_arm.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/arm/xlnx-versal.h"
>   #include "qemu/log.h"

Likewise, re unused headers.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
