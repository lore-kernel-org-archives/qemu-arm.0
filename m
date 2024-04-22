Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4099154ejd;
        Mon, 22 Apr 2024 02:05:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWF5V0IlXuZTi2Oe/TN1x1/zshnVt2wp/U30QSzPbQhQFvLOjdk8QjzNxCKBsJ6/rbnHiId4d02LzvpdQPMtZBYgLgdacSG
X-Received: by 2002:a05:6000:124f:b0:34b:3ef6:55b4 with SMTP id j15-20020a056000124f00b0034b3ef655b4mr474674wrx.7.1713776720544;
        Mon, 22 Apr 2024 02:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713776720; cv=none;
        d=google.com; s=arc-20160816;
        b=C8bMRboXse+ewOm+5LRsZqX/gG5cmUCPG9V+0WjmKYwRPe09mM6tX11P5qg8dhMW41
         nYS5YSpZue3sSuMK3f3+15V1RYfFS3vKgX4FiPtdGq4lxlwu90P3Tcq4Wz+loGYZjSS+
         xPf+MEojqYOKmuVrDFQPoIJrJxnow6Z5QEOG/DB4bcZ6MLBzmp+e6KT6MANBmNWq863A
         R90H3KZQjhgse/rO3x8arQJxdR036vWNoYUAsVdGqnmmabPm6ay42JUYraBsdUXZ4oKO
         zlG/sGm0uZx7rC3ZX1hqqmTiGj8IH1Mc22HAoTWtLROjbzSKRQwQzPqRT/sXMdHdzw5t
         J0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6bku35Pa23hx7jlKF3U6gFrNWhDJqMIVbU8YTHxAROc=;
        fh=eJfsaQPHk00G9sXO1JCbhnhkDg2K0QrLdQThGo6Ket8=;
        b=nnf0WgvroMJjFSRsDACbsxx9zlYs6M/9fejFfV9nUUaMvF71HlKRNUCKwNu5fINdC5
         omLIs54wk8i49uS12XxuwQ9NIy/byekDxQzMKdv007hcPRmm1iGtRC27AR8bxnq8YBfi
         nNylkE1REN64Hg0WAgMgDPT7d0iI129g6tlmH5z0saqjQv3utIPV5u6RQ2bUr0CsPc8F
         M0VACyqMiCQ1eXtzXH8C6DSqSk5PoOaj2DbgRJ/LDNJRHvp7nu5BDjOvihFyk7D+VuVg
         R+M/J0GdcuMjLtPx0aYD8HxXleuoRhgv56OLpfsiJpLOZrm5dVbHZE6ZIlfY9LW5AQ/1
         qnUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T0D6Ee6o;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q26-20020adfab1a000000b00343c40821e9sor2498668wrc.8.2024.04.22.02.05.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Apr 2024 02:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T0D6Ee6o;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713776720; x=1714381520; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bku35Pa23hx7jlKF3U6gFrNWhDJqMIVbU8YTHxAROc=;
        b=T0D6Ee6oZSDzFBQNgph5usqQENs/v4ujOkv38GLlecVoQdJkAmOsvTo8T0vcn/UYJ1
         WsbKe8IG5UiLz9EZhcNB1MIsqg/8yQRXU5+iRPp3vzsxMTaVtM3axKQhq2FAHfT4EfnG
         uD5Wvkw5cnrzXLdrJzGWQ1nmrLLNpa8+uYhsA7dw8VuN2o6xc7nXcjI04u762YqMw+py
         JbC5braVXMjnZ/6eChHNbNeaHEwAbXBT9pm1xbYq1s9i/I14Sx0aJIF6QcHP/SP/doKP
         k70+MEPwY8+6CzTYkbjvIFMAy1v9snMVYzju2AAgQeMD55ZygrFNqieHsmSjapx764ax
         43MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713776720; x=1714381520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6bku35Pa23hx7jlKF3U6gFrNWhDJqMIVbU8YTHxAROc=;
        b=Ca3rxpmvqCDZ6yqQEvjPJVxquxLyjEfcIm2bu5G2ONOjalZeJX2cHUPpuwL1WL9Wek
         ZytlqSgt27bVwlaOCh+B5oJQTYVSrY3LjK/jlgzDVjm8pafCufdRY7h23ncRWIQNok9K
         DSNvtnhLIUOwUTpLdnUb+be3dkUgbty00gmTywMv/dS/FZajiDsXXgAdoxRGKF1gaCnC
         nbscq0aQ6jDYVW1t6d2wF4t5hlwOEqO8TxsmDbZ7JIAMF1pmOXPMUml/FDm464FCQnge
         wbIpLvUTc2wvsM5ayMI/dBwFS4Fwv9EiRvPOZS4Dnl/uszw5+FUwHEtnULTiwgoB5Gf9
         fVbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW71s04lQ8yYJ8HLnCDPTQgjNMcHfKQ1LJr2/r/Ikd/6lWdz8kKt9SS60QKb7QjpAn6mI0pUW6GN5F6dFbe0PN7Vz1Czpp
X-Gm-Message-State: AOJu0YyxMp0Mk9X2oF411qRQloOeSjQC3d0/sezyQI3tF1PNtRjmfCiH
	v1NyJc4RYz5RKwUEnVP8t7GViS3n6zlZ5Os0vVB9/iSRs66TAGrwLFe2zPFsBOzzjg==
X-Google-Smtp-Source: AGHT+IH0bW441SeuH4pzB1JOInkylQKy7UFVU+26AbFUsLZxLebVBbEZ1E84FAsT/enoZ+PA/mOzjQ==
X-Received: by 2002:adf:f6ca:0:b0:346:72f4:c805 with SMTP id y10-20020adff6ca000000b0034672f4c805mr5044587wrp.66.1713776720049;
        Mon, 22 Apr 2024 02:05:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr. [83.193.250.196])
        by smtp.gmail.com with ESMTPSA id r30-20020adfb1de000000b00343e392829dsm11578896wra.97.2024.04.22.02.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 02:05:19 -0700 (PDT)
Message-ID: <50a43668-4a21-4f3e-a306-133dd1d54594@linaro.org>
Date: Mon, 22 Apr 2024 11:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] exec: Include missing 'qemu/log-for-trace.h' header
 in 'exec/log.h'
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-18-philmd@linaro.org>
 <76d68cab-7b28-43bf-89a6-bb39a7fdb131@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <76d68cab-7b28-43bf-89a6-bb39a7fdb131@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FBz5zb6AwOkv

On 21/4/24 18:44, Richard Henderson wrote:
> On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
>> "exec/log.h" accesses the qemu_loglevel variable,
>> which is declared in "qemu/log-for-trace.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/log.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/exec/log.h b/include/exec/log.h
>> index 4a7375a45f..e0ff778a10 100644
>> --- a/include/exec/log.h
>> +++ b/include/exec/log.h
>> @@ -2,6 +2,7 @@
>>   #define QEMU_EXEC_LOG_H
>>   #include "qemu/log.h"
>> +#include "qemu/log-for-trace.h"
>>   #include "hw/core/cpu.h"
>>   #include "disas/disas.h"
> 
> I disagree: qemu/log.h is the main file; log-for-trace.h was split out 
> for other usage. That shouldn't mean that log-for-trace.h needs to be 
> spread around.

Good point, I haven't noticed we can just move the qemu_loglevel
declaration.
