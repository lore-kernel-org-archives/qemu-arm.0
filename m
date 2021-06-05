Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2263668lfa;
        Sat, 5 Jun 2021 13:57:10 -0700 (PDT)
X-Received: by 2002:a17:902:b185:b029:f4:58b2:aa4f with SMTP id s5-20020a170902b185b02900f458b2aa4fmr10706704plr.40.1622926630160;
        Sat, 05 Jun 2021 13:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622926630; cv=none;
        d=google.com; s=arc-20160816;
        b=I2XjTftDXw24BU8qPpTFXZp4G6sMaTriQE3axFKqhmkPEk/B7VkGM2CiXm5x+O1kqh
         qP9xd2N1mcz2Mm/9uPwglLiu0kzQGtXtaI6R5fyjDZsSlkPXpy++9G9wR3d/TB3eOmj2
         bPNspCc2D/+GB2yBmsiuThPbVWtmlmQcHqpIZR1lmE1pKUnaFseOf3N0wND4I8KFfmIK
         rvRGSt0ArAvrFVmYCFmK24PcWcXx7Id/2InrO6n75Je61ZL5Lt7Fvq3X8oEGqRVB/mBx
         HDFjbO6MXcVZ5rM1QJVyc5PMCFKNcMbqVCoQlPh/eH1SL6ysTlRRXYQfJJqEUKchM0of
         aXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Pr/vMfXyPKX+6j0tYREdC+SOKczhluNN+TKa74jBLUs=;
        b=GVop13OOusk/YhEhK4GNNqL6AoK7oZJ15Ix7r3r1sVX1spYWYVZiJ20cbw2lKbEUxO
         WIkhBgj4WeP4K6kse5qLXBS5i/0reeVm26oT0fmvyDcjPi9pVfYXPW6lHSABR5YdICZb
         52/s5gvW7mJBj6aLPB/wKbLvCLDARo3ziu3B2jMnvLQpOxE/OxpEzoFJ9DMJPbBGe1zS
         e2fHMS2DwmLcg2Yhjj6ygdXlFoNYaIOaYzdcJSyNnglTWxNEcsWbDztph0LBnLI9hP2S
         R+/4hs3TI/BEY78R98bUwHm03m+EafQd/TyGnPIblNNVk/a6c7wyN9cEs46+hWuw9seR
         NcMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJADl6pY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s17sor831238plr.49.2021.06.05.13.57.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 13:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJADl6pY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pr/vMfXyPKX+6j0tYREdC+SOKczhluNN+TKa74jBLUs=;
        b=GJADl6pY+SZIT7WxpG1osUjzJu45ixv3178nl++DmBQeFN/ozp/yyR2bLQ9VJOWGIF
         fVFTMyGGtUSWGuU2PSqtgXY31zIRd9D/Ah84TSzzG63Rf+eBvceEQmMC057kJ3rXf55U
         f4YVuk9RNM1ts6Hv4SXtPR+33tMx8+lVmBwCSWSo6j7W5hl7KyEj0+9QynrG6Hm4YbT/
         kKEobNB6xtCzl7Jeg008phnITZnzoYs8NqW+q3J5giEcupXeZUQNixHW5BwMRZq4OF8F
         eTl+g3iaCQSdknPwHl0Cvk9qy9COsOqZLFfIzSohXK8jFwTvVAkCwa2IyAY4cSjsf3Cz
         BXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pr/vMfXyPKX+6j0tYREdC+SOKczhluNN+TKa74jBLUs=;
        b=VSlrG+KrPIj7OlsHR/7AYl/KEfWdcqYOE/JYnhUZyaDrmcT0bDxQJhb0UATJOzZFnp
         ZxM51darsYHtW7+kAfiRZPx2P1P3MSMOv5GpicgGUywpt4/zB9Jn71/aBa6tefpwqH/O
         vnnxqOlHhPlsiAN5wlCUmcXwErqd54T2Uh/PzYDAv2Q7QJDK21uDFD1vUyIDLlc7SjvH
         eD8UEc//S1Q8R5Z+TnoDYkE+bLu5X4HgTnPUP4fY+SCuJIbYxYUcE9CgsJkhkFR150me
         6svebA7W7wlq6guheJYkAwmzmRDtSJ/hf/5TuCT4D87RSIm2tvsIILjIJ1BuO84/dPDb
         Gqag==
X-Gm-Message-State: AOAM5318FublH8zHXfjVjpba8IH/YrgBgXtkGA8xQrW7Ol6UCbUGkraj
	sJz1ZEKJxPYCSrtdMOvm4vSLMhNV
X-Google-Smtp-Source: ABdhPJwv+EKaLPSOGc0rfWUuf2oiacJ4qu5X7h76pUpUHC7qQt9JOgsFMyg0jZhQHKdCqZZEWGu88A==
X-Received: by 2002:a17:903:2281:b029:10f:89f:1860 with SMTP id b1-20020a1709032281b029010f089f1860mr10386862plh.55.1622926629615;
        Sat, 05 Jun 2021 13:57:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id o20sm7819919pjq.4.2021.06.05.13.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 13:57:09 -0700 (PDT)
Subject: Re: [PATCH v16 78/99] target/arm: cpu-exceptions,
 cpu-exceptions-aa64: new modules
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-79-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <787a3dff-1cc2-51f2-ce13-ddf84f6ddb97@linaro.org>
Date: Sat, 5 Jun 2021 13:57:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-79-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: AJEWEAjSG6k/

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> after restricting AArch64-specific code to TARGET_AARCH64 builds,
> we can now extract the exception handling code from cpu-sysemu,
> and split its AArch64-specific part into its own module.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu-exceptions-aa64.h |  28 ++
>   target/arm/cpu-exceptions-aa64.c | 276 +++++++++++++
>   target/arm/cpu-exceptions.c      | 445 ++++++++++++++++++++

Oh, splitting stuff out of cpu-sysemu.c is fine, but back to the single binary 
theory, do we gain anything with two files?

> diff --git a/target/arm/cpu-user.c b/target/arm/cpu-user.c
> index 6a1a1fa273..a8e6f28ec6 100644
> --- a/target/arm/cpu-user.c
> +++ b/target/arm/cpu-user.c
> @@ -12,6 +12,7 @@
>   #include "qapi/qapi-commands-machine-target.h"
>   #include "qapi/error.h"
>   #include "cpu.h"
> +#include "cpu-exceptions-aa64.h"

Please point to what requires this include.


r~
