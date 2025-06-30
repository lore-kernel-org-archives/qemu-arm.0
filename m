Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2273738dye;
        Sun, 29 Jun 2025 23:12:10 -0700 (PDT)
X-Received: by 2002:a05:600c:8b46:b0:453:1e14:6387 with SMTP id 5b1f17b1804b1-4538ee954bdmr109512215e9.32.1751263930219;
        Sun, 29 Jun 2025 23:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751263930; cv=none;
        d=google.com; s=arc-20240605;
        b=bODSvpZPuNcx4CODB5cslcz3nKyhkam8hjhGuvkeCexKB4ykBhWQbmk0PrHIqavGLp
         r4f1FMJ0VM4im6pbBySlNQDZaiPAbiOma6JMNUYSdK/DuQ2hHNTMjhnKIlPleC6B3WGw
         L/pUcyO/RfEdlfMu+1KXBY06s0aQouM1ywEf+o8/mk2P7XX6XO2WDxheFNXdoXWLdSRk
         zWLrbtAzHakFcTeXdJ461Ktl+N66e85RftMqwaNftstA7th8KF5MeG8NLVb5ZxmAiqDu
         KeZ/KsCSM2jTplNvZLXQSOLlkLOjs20IWMEwyqtjqw+jOj5ob08Du7dZ93FbeFDiV1SH
         OjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WunxR0k+nmp3qdd6gRV7DzcKlEagnW+dxdSX1BM/0gU=;
        fh=XZt/dlIh/egsV3Wytea//V7dPvLO+/t1xvUWdx5hQYY=;
        b=YtDQ6rCRad0EKCuF3cRnRi6N8tytTiq1O6+0umFbMYj3CODD/bqAPMJnreSoJnBb/O
         ZQxhEf/1v7vQzIbdMoQV+B6LmDKko2oG+WJJcVdQh8kpsogeAStvPvmfbQdjQ+5Y2Z6V
         n04AeWLDBov/YIUbpSmvyg9auFktg7q404f1wSvdvJzq/aGnGFhLO6Hjec5sQCNa8IQq
         HzHNmLSdt430lvdDpKPsok3AVFt+unfqDgjrWpW+ainS3kAWdyuTPM4vUuW/GeiKka5q
         1XMWHQnmxMC81/zVliWO5DOpEZPHmYoC9yI8RPsDcDi8MbHr7/XUWhQn/7I2++977O/9
         ljgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v+3TkHYd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4538a40a1f1sor35633225e9.8.2025.06.29.23.12.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 29 Jun 2025 23:12:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v+3TkHYd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751263929; x=1751868729; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WunxR0k+nmp3qdd6gRV7DzcKlEagnW+dxdSX1BM/0gU=;
        b=v+3TkHYdl9fFTPUprHAVNdODuy5KImGBsElFY+Aj9JV2UYj5A4FI8lOYE0BGHPqPWX
         HulKRLFaorFihGAKN+lKMWW7SwgFa7HgeGeNiVKWIo5nX3+/BWUY/gpkZx1M1rXPn+7O
         kZlHB4F3w/aOFOAfuS0V+har6c0prK6prg/TgpKp4TGBPLD4ZWe3XmMDqAtgHVJzT2UB
         UfHJSMN0bqyw8XwcoAWeyeipYO1pdUBl/9fMxCFDDJYcfQFw8f/J3lxEtNzUhQDGSbYA
         LKGkEvpnoZudGubCToUpYHdmgeXMX7WMBEM1+7QRjfX6ugFeTPjzF22UgDsn+NCAdoD8
         tBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751263929; x=1751868729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WunxR0k+nmp3qdd6gRV7DzcKlEagnW+dxdSX1BM/0gU=;
        b=HZ5JRwq3xb+q73AFmIDzWJj22tfX9BbInLrYgOayTjSdV5bAMTtJ7RXegfPBsUepnK
         pScSb+3jtinaYbC5qCoHePOV9lm3Y0V27YuV1GY0iJmqZ6f/h3Q9w6tfWdMTE9FD7X1f
         SGvpJjhUpmGO60EJbpdKI6JlsJ6Ov2DGD2raGiXqrdOdPY2KcMGHEfKBkXYKrEyzMtUN
         pvj+b/l/nLcX0DBgeHQ4P/z9fOrSeVftlVXHBzeJJclvrinbFWNV+yJDjIrASknUsHDv
         +QTfCwbNcO+OxE9Qge9m43/7MK/7piroxYbJFVjnJtI3CDTNQcRpwA/yAIYst8qafnIK
         tkBg==
X-Gm-Message-State: AOJu0Yxg21WGjoBB/V9ncOnp3m5ckvEBJV9pvRXsj/Y1m+jnQlmLzOQ5
	Ml0/wxxNGgJjQbCWN4ieulO2k4px4YK3+kScATrI+cEPhmcuPbzUsIQKNC4XJ9ZGyQ2+KIyQ3zQ
	PFPvKEcw=
X-Gm-Gg: ASbGncuVapi2Avvrs2GC+zXThkCEEcWsZdcrBOg3CxgDauLF3t1ZladcmHLOKvqWZU9
	JVWvA9pNb+oJv075m9zGp8KznqOqbEk15nYrw63fFboBZcBvu3iH+3+Oi0xKu4J2FNRVBSiTKvR
	b6PiiYIsOoHxeGMqFikpI/bi7KvRcEc9Z5ZXUEmK/i+qnyV6mZCs+LoYCM6nUi4PJRP67MxD5iF
	3XS5f5M2nPhI7olQVInI+J43N17EbH8vcUYFf1nDvl1v1mk6Ou0I03fCifuCrtytgS/jLjO4C6G
	JGeOVzM/YOycgyvtxUC5+zq+da96lwJdx17Pt1KilH3MG1QVbhaUOD5BDycSn6NTqnUT9ejHD+W
	8jBhD7A9DLoRJBLS4m08fq8av+b2hOQ==
X-Google-Smtp-Source: AGHT+IHdwlVYc3MN1G9DYUrSMe7EHVx6HFhKzlk0nOPKRkraWic6oCUm2fbM3LvnrEgW+8hrfUragA==
X-Received: by 2002:adf:e181:0:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a8feb844cemr9309903f8f.53.1751263929308;
        Sun, 29 Jun 2025 23:12:09 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59736sm9399485f8f.74.2025.06.29.23.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 23:12:08 -0700 (PDT)
Message-ID: <d02f590f-5085-453e-91cc-beccf936d0b7@linaro.org>
Date: Mon, 30 Jun 2025 08:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] MAINTAINERS: add myself to virtio-gpu for Odd Fixes
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-s390x@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Zhao Liu
 <zhao1.liu@intel.com>, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>
References: <20250627112512.1880708-1-alex.bennee@linaro.org>
 <20250627112512.1880708-14-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250627112512.1880708-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DpcoIf0GUNM5

On 27/6/25 13:25, Alex Bennée wrote:
> Seeing as I've taken a few patches to here now I might as well put
> myself forward to maintain virtio-gpu. I've marked it as Odd Fixes as
> it is not my core focus. If someone with more GPU experience comes
> forward we can always update again.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-ID: <20250603110204.838117-8-alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
