Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3225645njb;
        Tue, 18 Mar 2025 14:41:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzsp2h1pxcsEZxjRoQusLzwJoZkpMH2zN5hcZ8zy+a1oc8UpYSO18jVT1mdTQYpQAUFJzUJTyWQO8Elg==@linaro.org
X-Received: by 2002:a05:6a00:1701:b0:736:5dae:6b0d with SMTP id d2e1a72fcca58-7376d5fedddmr452688b3a.10.1742334092679;
        Tue, 18 Mar 2025 14:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742334092; cv=none;
        d=google.com; s=arc-20240605;
        b=J1ZOdVaAa5hsmfljxpWfrMTN2GRMuQDF8wYxrOeAaehkwBgbaeDpEAtcf+4IJ7GBaY
         yJ/tVh9vwfV4rn9XManxpXFfaVUBMDGeEHsc12W+NXAMk2xa1O4UoC/18whSj7rUe5FH
         QV9iUt7MxhIZyRzm+mpG907AAGHnhgl/X9AKs0Sz4ZVSlar/4AiJv0WdE2rUrwiRmRh4
         ITUN/iUiIUw4Gw8d+MoacYBcQTr26b9UuSeOjLF/uI72CA65ZanO5Vs0tKsOLxKwrsVd
         nKHWmqNMQOo1sMhy9xq0t7n0MbE6F6wT8j2VrHFZO6ktP4SoNe6NBnjhV5FWpBywQLHL
         umXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=STjGlaJoL8peYNcrAd1LJeFiqwC5QN4avED5wEwNQ90=;
        fh=V7wdy7wHXex9rCW8OLcm2ga19b6iBjGzroyjdrH5uAk=;
        b=AmU0ZFEWfLE1BcpGgbG3gEh3k0Y5dVzodRZR5ajGsfelr+pEr6fLIMJLF+mSg++UCj
         E5IyhsjZZptIUxLu2Z5LO3fhF6ugeuV7Tp0xotGyCXKUQZLo2M6tfN5vNpURAounZnXk
         ZLFtIswXFEEeByHnufhq1RoUw+7nG7+aGtGKw3C7ZPI27J7vxEhZJlOhrF/FB3KLY7dP
         7VG+EjAgF5vbOqHl8PgfsWua/BTzRAXbCXARoSeRHsy24u/Ui+Pkr90rkoRGv9/cjgtI
         EM+WuOvMFXvc24OXMgqLlwwfn/nl6W9/IkTTcpiQl1uGyQyxxU5zL1QnugukGsRXV4bi
         gN6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RngQ0SqK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7376d518499sor117659b3a.5.2025.03.18.14.41.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 14:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RngQ0SqK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742334092; x=1742938892; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STjGlaJoL8peYNcrAd1LJeFiqwC5QN4avED5wEwNQ90=;
        b=RngQ0SqKMId0Pn+W9CnM9LTESC+LYLlNmfQRn8X595qWBFgh0xBnDkKWbgMM5+lpCu
         xww6ELgvF7/a0xM1UcIfOLw3d+wK0VDMy8B9Wn16vg0OQ4HFDlRllU6UOI30mdKau+A0
         wIjvchQvE6XyFuSAg9/yVByQ5qjUmsWcblRymdpDLstWaRtsQMx+Onkh7GdV4NA46TZz
         eaa3e4TOd2AnMw5XJOLrfjGKehjIfrPnw47YvDXUYfAbG4GP18FNwKqXADneP3FbwEVM
         54BxRguOIP+dxOOZRbyoGCUNyzY0MN3GxYcND3IcDpGLMUIMQuO8Cp3tFKBGscHz+7M4
         jguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742334092; x=1742938892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STjGlaJoL8peYNcrAd1LJeFiqwC5QN4avED5wEwNQ90=;
        b=qPslAzb4hm9X/DgaKb031TnCOzWUZRwkUIUSo4D7LWDP3ewncByrzgCZHFGl6/aC+7
         3W7I8olQGWnHpOALOJkPcfEiad4CtXzKGahSY8J5OshDRGtulc32mBVRs84ez2eMcVoe
         2a0BjKB98DvkFsHQHcSv19KrWk9HgmedQ+Pr7Z/CAkoSO3bjJBaPk8SxbXhtAQZxbGxi
         b87nfUnTk8pMU9XQXbHcJEN0y9cBDbjkLZ1MTqSVUcTNS82iBDkozLKsXTRnyY3GZo9I
         mKoW2p79ErK9ombVnJ45Grdv/8MvXDa/1EtcCktO5D1oLnhaGvam6N7uOAUO/eow41sS
         +BzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9xXkmsiHQS0ELZiT8nI9TNbHfeKfN9XPrnG6kHIgXVDWzuesaMfHalHr838SgPX+dtjYZH25z8/p8tQ==@linaro.org
X-Gm-Message-State: AOJu0Yw7s+vqk8dB0U0Yhiq63B7xBWHPSEnyVocc583A4kFZrJTNlTVR
	FqBNfbb2g6PO4ACmD/YqkTL2VEHxhQJQAszGNnZYoBjkZySRe3bgypFD/tEGjCYL7rpeLtSLkNW
	u6Bw=
X-Gm-Gg: ASbGncu1mmXLVgkRHd2U3fR0IKuxhCJYoErs0JjAwrQO7unPR9juhGUt9+fhs/nI24e
	4ZTW5o32JJz9B/pAz9C5zp+Z2zvVInSkZRehH3ktaRXW9HYL5oFZKXortHZpzWt3cPSKCM4g4nF
	HwNimLrN+PJHYlExaT2EHApjpkyW6qgG8g2w7ARiaOWtQqQY+kC3+OWonu3Wa+GC+y9n2RnSJdE
	Ta2qn0k4MjRdO6zq9m0hXhHVPf26QEdj4FMk4woqvg0ftZRplXHYRget0rCCkYAlOpC8zr/5E0Y
	CHa7kU2ICrAjrORiYnIoai7taFRhZ60CjYkvkIvj9vfLMjzsUIudXK8WbbNOViF1WEO2O/RDUx7
	n8iLXaH10
X-Google-Smtp-Source: AGHT+IEvjE74CFsm4MscUePIeChNuRGSVzaxg4KMJo3HjCDFURh6xUnSaRyz1CmLeVtwy7Y/lOF0tw==
X-Received: by 2002:a05:6a21:6d85:b0:1f5:64a4:aeac with SMTP id adf61e73a8af0-1fbed313382mr312364637.33.1742334092205;
        Tue, 18 Mar 2025 14:41:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116944easm10408525b3a.134.2025.03.18.14.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 14:41:31 -0700 (PDT)
Message-ID: <2766725c-9287-4ba6-9e14-e84616d5fd17@linaro.org>
Date: Tue, 18 Mar 2025 14:41:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] exec/cpu-all: restrict BSWAP_NEEDED to target
 specific code
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-2-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250318045125.759259-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: MrfoT+jGj9Kd

On 3/17/25 21:51, Pierrick Bouvier wrote:
> This identifier is already poisoned, so it can't be used from common
> code anyway.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

I'll give you a
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

because it's quick and correct.  However, there are only 8 actual uses within the entire 
tree (discounting comments), and all could be replaced by

> +# if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN


r~
