Received: by 2002:a05:7022:3841:b0:7a:7256:a3a6 with SMTP id pk1csp2675624dlb;
        Mon, 22 Apr 2024 04:44:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjszbprvCm36gWMGlV4fjtN4tMvcZZaKKoiXVb5VFKoPf5fxqmlWx3MMMhdRBjLP44QhL6Q2GqiDH4L5norbYFjW/AfUJ9
X-Received: by 2002:a05:600c:1d8f:b0:41a:408b:dbd4 with SMTP id p15-20020a05600c1d8f00b0041a408bdbd4mr2669598wms.7.1713786284569;
        Mon, 22 Apr 2024 04:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713786284; cv=none;
        d=google.com; s=arc-20160816;
        b=cHq56ESuQdMQuy+bOOWqKFjECsB12A2ZzjsHIaLd7YFpZrYomAktYKHLoLdqeU87Hq
         XDrEz32Enjl3URemIPaJjgG7mXFB/smPzxzDFmSKxVzRxTkX40Y9bgQzLBpCGmGVN0yT
         c0/cvnYzXn+wbX7/NHAFrqvvm0H+qsSL7TvcZ1uFVDhTIOTGLgXFpNPTt8r58c8Gx2II
         6rZl4dENCTMyTcm+BuRDddEjpfxsPi6Vq1efewWZm0T5zJClCnKxKmQfPybRDu6ccxtY
         MtAiajUGcGFIvkG3KPM74r3Jn8MBmgh9o8aG1yQLvcmK+ZzfIqnhmhH7AkIwAmzOupA7
         hJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rQyqkO5rBtVr2l90561BkaV6H3PIbJfSNkwtRwVJ0Ek=;
        fh=F9XmarM2CoqPPemCMNFl2uJ5B4Ltqr1u23VqH19VRTk=;
        b=dNqD8QD2zrqSaiEFoMbVc6JK8RKs2wqoq8GIJf7Ouy48Bfb7BbJVER6JNsZO34JUnM
         gUqMiRXu3W/4VUuxAsPEhICFSyeo57bS5Nak69rIXC5JA17/bi0saLTNcLOUJmcDlvJT
         MMNxk6vYtU2wC+gTunBrNpar9bAee4C5m0V1d3Uu4M1gVTkyIes81dxkzdKypEPAzOi1
         1YVMvUa7fEq99A0NGS0dd6qFtEzUwEe4EKfdzwBx0PH2Igf6Nsmo6YzKlq3FJTft+Ils
         4xPbuD7czoJKB/7FE0efn+L6k9orIAoV4ayfk8CD/NVqKiyADf3Yt9YRc3TQgsOvnMf6
         iDjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p5AOznZt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t48-20020a05600c32b000b00419d52e6233sor1432053wmp.0.2024.04.22.04.44.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Apr 2024 04:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p5AOznZt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713786284; x=1714391084; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rQyqkO5rBtVr2l90561BkaV6H3PIbJfSNkwtRwVJ0Ek=;
        b=p5AOznZtcf7lZfZcI8yp+6MYXhu1JNsVRO38Zsc3IjTO5PqC3IZttV94hh0DWi+dU6
         J7PXZzzuZyBdoZJ1sIOP7rMJvEi2CInhixe9aw+U3/r0NKFlH+pzpYs4cRE0h7BrcWHA
         7ZFnFT2KKE9flyXJ40Wmcr5oDiruzU+GBc+LYmG4FmYAp+sgNOxFDJd0xmj5l93R0NIO
         NjpPaqNvl1VuUsAcUE3CZ1QGsnpnU9pCg9oGQwJzGG+S/SLqHgVXJOhUgdJWDt8btzA4
         ox23mZce0n3r6Y6g84kZNkTH3YwnqqETekUEcDRvmTBbzbwCNsoAQqBndvhIKviPDmSL
         rHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713786284; x=1714391084;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQyqkO5rBtVr2l90561BkaV6H3PIbJfSNkwtRwVJ0Ek=;
        b=jDC6VO/OkfN58Yq9DKpKLL17nySsZYTWG8wO18yP8Amy457PN6O31c0p1AzOEmY1Mh
         kiyp70exIyfMjsFyxoWmpmKJZy1xdxBeYoa0IMFzialyKQ2Fs00W556K1mkl/uW2nK9G
         4B/QLlYJgTJAmnMYlRUGBA1SH0DlvFOP+GuhDrQTaoCzM4msD46gQyfgZyQi7j+t6NZj
         GKU24xTLikdn4BOPDNW3kazS62WDfE415ijFzz0rdo+xly06POxzRf+QbAmfA2LLA3to
         lbS6DjJNMIGjiPdW77RNYYjwaZcTdTkjJnQRJCCgwh9wq3jmjUvJWBvmjVV+gyNRGFev
         8l1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUo5wY8HmCimj+dH1+NjY9cnp/b1VN1GHqc8wZ0773B28hrlJ//61SoEMccoy6C419UxVS+2UuA+eDxCBPZJ7CZCj19kcqA
X-Gm-Message-State: AOJu0YxF6sPCjGjHf90pL9c3lvBJHfZszh3v6pJDWyOlU4TSgwIBrTng
	8PbeCABMAuWvB82raIe16sOKhP7uo1OjV8ivIoNtwO/x6IIibByxPLM37fynWDQ1yv+1ItcyyeT
	etpk=
X-Google-Smtp-Source: AGHT+IGm2cDFOYgMIbZm0eI4/PNyMTOAT6fdJzXfqBLD2oHpxa+uqBaIn5ZRqy9rTLlKSXVvSErKTQ==
X-Received: by 2002:a05:6000:1b8f:b0:347:9bec:9ba3 with SMTP id r15-20020a0560001b8f00b003479bec9ba3mr7424132wru.66.1713786283963;
        Mon, 22 Apr 2024 04:44:43 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr. [83.193.250.196])
        by smtp.gmail.com with ESMTPSA id a12-20020a056000050c00b00349ac818326sm11855526wrf.43.2024.04.22.04.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 04:44:43 -0700 (PDT)
Message-ID: <a9a7f5d2-9fe1-4160-ac2e-b55f53945c22@linaro.org>
Date: Mon, 22 Apr 2024 13:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] exec: Include missing 'qemu/log-for-trace.h' header
 in 'exec/log.h'
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-18-philmd@linaro.org>
 <76d68cab-7b28-43bf-89a6-bb39a7fdb131@linaro.org>
 <50a43668-4a21-4f3e-a306-133dd1d54594@linaro.org>
Content-Language: en-US
In-Reply-To: <50a43668-4a21-4f3e-a306-133dd1d54594@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Edp0+M5+WQef

On 22/4/24 11:05, Philippe Mathieu-Daudé wrote:
> On 21/4/24 18:44, Richard Henderson wrote:
>> On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
>>> "exec/log.h" accesses the qemu_loglevel variable,
>>> which is declared in "qemu/log-for-trace.h".
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   include/exec/log.h | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/exec/log.h b/include/exec/log.h
>>> index 4a7375a45f..e0ff778a10 100644
>>> --- a/include/exec/log.h
>>> +++ b/include/exec/log.h
>>> @@ -2,6 +2,7 @@
>>>   #define QEMU_EXEC_LOG_H
>>>   #include "qemu/log.h"
>>> +#include "qemu/log-for-trace.h"
>>>   #include "hw/core/cpu.h"
>>>   #include "disas/disas.h"
>>
>> I disagree: qemu/log.h is the main file; log-for-trace.h was split out 
>> for other usage. That shouldn't mean that log-for-trace.h needs to be 
>> spread around.
> 
> Good point, I haven't noticed we can just move the qemu_loglevel
> declaration.

Now I'm confused, I don't remember why I ended doing that, since
"exec/log.h" includes "qemu/log.h" itself including
"qemu/log-for-trace.h.

I now notice commit be0aa7ac89 ("log-for-trace.h: Split out
parts of log.h used by trace.h"):

     A persistent build problem we see is where a source file
     accidentally omits the #include of log.h. This slips through
     local developer testing because if you configure with the
     default (log) trace backend trace.h will pull in log.h for you.
     Compilation fails only if some other backend is selected.

     To make this error cause a compile failure regardless of
     the configured trace backend, split out the parts of log.h
     that trace.h requires into a new log-for-trace.h header.
     Since almost all manual uses of the log.h functions will
     use constants or functions which aren't in log-for-trace.h,
     this will let us catch missing #include "qemu/log.h" more
     consistently.

Let's drop this patch.

Thanks,

Phil.
