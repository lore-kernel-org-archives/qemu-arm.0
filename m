Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp253420njf;
        Fri, 25 Oct 2024 21:36:50 -0700 (PDT)
X-Received: by 2002:a17:902:f647:b0:20c:968e:4dcd with SMTP id d9443c01a7336-210c687852cmr24807695ad.7.1729917410231;
        Fri, 25 Oct 2024 21:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729917410; cv=none;
        d=google.com; s=arc-20240605;
        b=GZI11g3qvigROqKsDC1s5FFV4U8GHxT+MebaeQuyfF6H4zo8lYUnDtJ4EKYIZN1izH
         xDlR7lZum5pqn4ciHK7v8OPXejc6B66hUgQCbXu34qy7SZb54vzBRz84KQKcDXDp5lO/
         GkAra32pPc95uE94mhB1czm7XLc8K9OagkznNIjSO9giB9t/mNmczREkS8dPyi3UpxFD
         6ysT1OVt4Y8duB6FM8OgA2hikn7cy+piX4jECAmfTyFl2QdlevLezgLlYJNthKv9pmvv
         ISJK9oOMAre9TYqoXoXfzCYWWMJ+sq2wFMi/wxInOg4s1oa7FUYQRkK8ifl6QpzhmL75
         fhmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ICl9dgED/m16kjHsCSPmAdWqNiBPiZRJM/ggx0AVya4=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=loDdh2xPEvlIg4bELEeC/LccKB2YtjgOyrprIQYh/mzsmAnxUjWRwBIXVgI1gBlnDA
         qyNfDRn7n9MYN34x0eRAIXhuXRePrXEY8YLcwZeLKtKmAAoMKxxnTbHQW0iqIdA34yDm
         GPOENjaDmYpwUiyuqfpQke0Ukjw9sU0ECDZeP0Eic4nu6AyIH5UIQJNzN1fJrXGTOW61
         kaQ7UMJEX/Y7SqD+jH/drXtQr61bcl8NB1ai0SQ5F/Rz60P49J2X7BTeDmCSSPq5C5/g
         ba9QRBMEH1wkI3zCkym0AcYH8YJBJ5cfYdk01fFQweBMZUhSx89txIuNuGsy7uBhkJ3p
         NYOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oSJpO0ZX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-210bc1a55dasor16243315ad.18.2024.10.25.21.36.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 21:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oSJpO0ZX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729917410; x=1730522210; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICl9dgED/m16kjHsCSPmAdWqNiBPiZRJM/ggx0AVya4=;
        b=oSJpO0ZXM4hINg+Rq0QudIgiX+5C8OwX4sedKblMrGjJWzKKpiOfxDU/Jr29PmvBse
         CAJWDa1535/9tNWwd5jICLYOh7H0hO4tSF3rpwS1Yzhyb5mKMznVwnv6DV/OGDC+YCfh
         pHiJ0ccIqG/k9bfqwpFzQ5qGy3hfN3nxWvaScQJrRx1SHvmQ+OoZnWDL/BzItgYnhEEg
         a0HYDxzdn+MOj1qvDVXS/Af9ywPOvJ1U3+ex3romUl9QLgTJo0G+mEB0QeHeI94mFcTM
         +rpaKpCDOcga5u+mCaWVa+9Aaq4u7Mu70McdWlsMHeNIOncd3X6zRMHq/wwfV1chQsXf
         Od5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729917410; x=1730522210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICl9dgED/m16kjHsCSPmAdWqNiBPiZRJM/ggx0AVya4=;
        b=eRTxwxy9VLdWZpVWkOIczdbSr4OxO7+UcFAoMs9VoCwTFhudQAZTQF5j9O+O7+Fz5a
         cqBg8CSKYExP3KMmqkUGS1a0PZ6ps3gfd2xgjcRD7ECsH7ace0kgunTAAR+/8HjrEHOs
         sXQbZRfJ+ijAbJV/xSiG5hyj5dmRggZ6QE3MLaOrR3WL/09ZitSW0N5SEOQ4Wxm4WZxE
         OAG8bWkRvZ+SLOxI2rbd2+++eoWJl7v/MI1HQ0j1xAN5jfN+4SW0rmgXPm5DdcP8ZR4o
         LVciKaybdnE8m7L9EpsM8V0AdbpTSl/K/GLF5My3CJ5zOjTIa/n9hi2VkGZIqTAVUKkV
         iIWA==
X-Gm-Message-State: AOJu0YwkogGpPjF5YsUIN5IwmFSv9jAAUifPzpjMkNRssrf5xHNuCYdk
	zOCjhmKGxIE1/HCZNw//e+WpPD56hxPJsPQpXfQE5m8089xs/ofkFrAtWmFi6VNRCg==
X-Google-Smtp-Source: AGHT+IEcy+oxRwkEEptkJNLNAOJpYSaTSplfcqHUoCdQPufiuDiNH7cqgQVdYSWihL9xgm8ISsGiLQ==
X-Received: by 2002:a17:902:e892:b0:20b:5aff:dd50 with SMTP id d9443c01a7336-210c6c19c8cmr20680645ad.31.1729917409779;
        Fri, 25 Oct 2024 21:36:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.120.226] ([45.176.88.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf46ceesm17491325ad.44.2024.10.25.21.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 21:36:49 -0700 (PDT)
Message-ID: <5e0d668a-13b6-4361-bf38-660b9bb7bddc@linaro.org>
Date: Sat, 26 Oct 2024 01:36:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] target/m68k: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-10-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: j3jM6TvwIvur

On 25/10/24 11:12, Peter Maydell wrote:
> Explicitly set the 2-NaN propagation rule on env->fp_status
> and on the temporary fp_status that we use in frem (since
> we pass that to a division operation function).
> ---
>   target/m68k/cpu.c              | 16 ++++++++++++++++
>   target/m68k/fpu_helper.c       |  1 +
>   fpu/softfloat-specialize.c.inc | 19 +------------------
>   3 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
