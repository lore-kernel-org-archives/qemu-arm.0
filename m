Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp474529ejk;
        Mon, 29 Jan 2024 14:48:06 -0800 (PST)
X-Received: by 2002:a17:902:d486:b0:1d8:dd64:ff2 with SMTP id c6-20020a170902d48600b001d8dd640ff2mr3077017plg.88.1706568486035;
        Mon, 29 Jan 2024 14:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706568486; cv=none;
        d=google.com; s=arc-20160816;
        b=E+wegdaG+3webfjo6trZ1GubDchMcVJnyAjl7MvdEiN+bYJ5zeRTrAw5CXgYeKL9G5
         FzkeYECcxHVdqBKrJFAmQZCluz0ZcclFgRhX0lJVt43Dub1bQNIdDq8GT2A0Jz8qzGrg
         pnapxNAsOWR1K4oX7NsxZNu1XUvUe+bjKhPDkdk9i0ToNOG7CydplT8kb/ptjghUiSkl
         X74OHkdS4iSE1Wa00orplgjRgZzj5iV6SnB+Qc7cvmvEm7u1RIcP39hjcBv/yLlPbpzX
         1xAmpMcnUUF6as4LDMHdHUilNuJKk4mZ8A0dorsi8bI1ugTDmUzlDJK6Jvkl2nHyIpAg
         AvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0Jwr6rwK11cTf5xxmEGIzOjgYNqW4oVhNbXojQiD15g=;
        fh=Ust3Z5lEqTJ9Y7WVle18FXNn0Uig129Qp0ZeNBxRwsw=;
        b=S1A6Ort0DJgFQOVb2o8MU46/OoNc+uUOK+VFPHhLRkTVnwBauHHozO6S0Uhg2BLUcW
         FqLpqX5PGaaM/jX1ZFqvCmCL6FXK5NizLQd1qfIF9KJAveGQXjJ1qAPyKwyZGvWrzWL3
         izTOG/swRZCKAlJnAlpHXES4G+JNsDDAWIQOQpmvi3EWBpRSsUjG5XS+L3E1849cFSsr
         2UivfaqHvW7eGeBniSFPWTdyeA5rIdw1r5oKVH1VWt6NO75XdGpjYkhBBZoVNWo+gIO8
         sUrMo8VhTl28lICZ5pXd/4pHw6OTWBww3xJHKwC5+fbdsXxMjOio63OItbj+IwDu7qnx
         0pGA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nLIT5SR2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWyBlwck+cWssSejSjICYCkJDSIlMOwG6yWzczW6Omp1PFIt2m4jDvI9RXRgt9DAAaI7O0/Zhfm7FiI2DOJhr5qXhT1s8lo
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c21-20020a170902f31500b001d8d7d98140sor1158455ple.10.2024.01.29.14.48.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jan 2024 14:48:05 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nLIT5SR2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706568485; x=1707173285; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Jwr6rwK11cTf5xxmEGIzOjgYNqW4oVhNbXojQiD15g=;
        b=nLIT5SR28CDB6EBqDogEH8/fAn/H6aeANMymI+tLHoB0OE1JZS/MSD+MtZUb+n3vZ8
         E8BOMVLtIn56FHO8n2K0WZewd/jV1Rr7TR8buEfGsAgmfW6NiBpIoDmtPtGR5YxYiAlP
         ujxn+fXJk9XTdPj1tNXTm/COpXiXhTAhdJpKr/Gwd1XOEkCVg42Vx9wL4C0zNyXCWtUL
         el7NIxj5sg6AMjMQGXM09h/HFTzFAy2CKNJEbiA7zMeFAytcfICGsesL2bmj5QN0OjTo
         DsBDAsaU1/KO416pLPxbqZ72+LT4UMNo6v02n801bZBPLBiscmXa4HynEwj/3OGM07Y/
         1BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706568485; x=1707173285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Jwr6rwK11cTf5xxmEGIzOjgYNqW4oVhNbXojQiD15g=;
        b=X7/QxfVBiQjE9QGQi5PONSL2sE3Bica/qQUBDDnZ5QlmGv5znwtAsZ13VnaCUVIF8T
         NxeAJanIrfCXZp8IY4ph8IQlYOFluO89JELCQ+UM23iVuPyF/fvgZnj/+Lk2abUpV/47
         uBsczZO1YG/c0dUpRX0qqYlqhlBBuRxmCnBmSvHcqQbkhdEanJRKeizRd0mAO7FIVJkH
         rr2ksMBkSj9zrsI/4fZZJUCSD2QP+LlLYMYLhitRG9HbX+5ALEtaPwsHi7X4FK78v+iV
         gBuX8nFACciRKedxhRYqBXUycKgksRV8XXax7sTpJ5Z6Y/+eYhMeIqpq9Fk1qm3AcUwF
         fvXg==
X-Gm-Message-State: AOJu0Yy8nSTpnR2urMquwwiU4UNZZ8Gim+W8mmY387aazN8Cv6AoyRNV
	yN1icB7jiE8EumNjrAMpCeiqQzfUFkNXHFSR89jN78o/yWNiDFbyf74YAudyvPYtvg==
X-Google-Smtp-Source: AGHT+IFlo4O6DWF8V3uQrSiNv+oND85B/Z2B9W4cPLnrqfo23bPn1IE1TE7XjK4pyXJBM64/wZ5fZA==
X-Received: by 2002:a17:902:dac2:b0:1d8:fb06:b8f2 with SMTP id q2-20020a170902dac200b001d8fb06b8f2mr1772038plx.0.1706568485483;
        Mon, 29 Jan 2024 14:48:05 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.103] ([103.210.27.218])
        by smtp.gmail.com with ESMTPSA id w18-20020a170903311200b001d8d3b94404sm2980468plc.137.2024.01.29.14.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 14:48:05 -0800 (PST)
Message-ID: <34f79da6-739c-4a64-9598-7d1337cc3be2@linaro.org>
Date: Tue, 30 Jan 2024 08:47:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] linux-user: Allow gdbstub to ignore page
 protection
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20240129093410.3151-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240129093410.3151-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: RzNVQe9WWQKM

On 1/29/24 19:32, Ilya Leoshkevich wrote:
> v3:https://lists.gnu.org/archive/html/qemu-devel/2024-01/msg02907.html
> v3 -> v4: Hide InteractiveConsole behind QEMU_TEST_INTERACTIVE (Alex).
>            Probe /proc/self/mem in the PROT_NONE test.
> 
> v2:https://lists.gnu.org/archive/html/qemu-devel/2024-01/msg01592.html
> v2 -> v3: Add Richard's R-b on [1/3].
>            Fix printing the architecture name and the number of failures
>            in test_gdbstub.py.
>            Patches that need review: [2/3] and [3/3].
> 
> v1:https://lists.gnu.org/archive/html/qemu-devel/2024-01/msg01314.html
> v1 -> v2: Use /proc/self/mem as a fallback. Handle TB invalidation
>            (Richard).
>            Test cross-page accesses.
> 
> RFC:https://lists.gnu.org/archive/html/qemu-devel/2023-12/msg02044.html
> RFC -> v1: Use /proc/self/mem and accept that this will not work
>             without /proc.
>             Factor out a couple functions for gdbstub testing.
>             Add a test.

Thanks, updated tcg-next with this replacement.


r~
