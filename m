Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp371415ejh;
        Wed, 3 Jan 2024 01:12:51 -0800 (PST)
X-Received: by 2002:a05:600c:35ca:b0:40d:5f8e:21f3 with SMTP id r10-20020a05600c35ca00b0040d5f8e21f3mr373816wmq.85.1704273171010;
        Wed, 03 Jan 2024 01:12:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704273170; cv=none;
        d=google.com; s=arc-20160816;
        b=YLvLnRVGxci0Ww4DAUn6EdiPFTsc9C8Sw8GsHgZ8WG+hWt7mu2QfSyguipQopGwSVe
         LFmSyiHHETxnc0GylN5kQfbXb3jnHPV8SUq5PSVawVwPBoiY3N764+Vh1BTvbcnJHddy
         Me4hjFIeQJpURu4q2fmCbSbgsMytKFrcsXbDg7sMyfERo4CkIeZQr8t9wOVAKMuYwsOE
         GcbI695N+kN5qtiobTz3wFXYbSN8delmrU3D6CCsoqWsMkQjnQAKWukLNEDyePPWo7rQ
         XaciqBV9nfU1BHVNwTPLw6+/2u5O/XAec/eTG1Q7TV1Jtm1910qXeVmLWYn1mNPS+Tic
         fEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=L9Eixksq3Xn36FakjeuKx/Xz/4gtKrZOPm2deTJNUdc=;
        fh=qpo5ZUgLDMvXg0lTsyGWdkSsP7S3ynbXFiQE193Mcp4=;
        b=UjIqyTkq+Ax+CnInnjBdZPkWJqnbazxTSDSP7vSEWfAXDCTQZzLFBLMm1oWj99Au8v
         MQtHBKZM8n1d5uHj6QjKPnKCX0nCB8nQ3Z+ytgFuR8zIWmn1g0tc2SQlwjTFlULiK+r0
         w4/UE41ZybektUtFFkKJzK6PhIUzX8LbcRjFAuJc9VWUqZlAK/9FO6Y0w9p56tszTInw
         jlBBCYPmnD8FLq/hIf28xGDiq/XV6ZKRpOi1fBmGb8IVEG9ley5YH1w5A8t+nFW0qgv0
         m0AohR/tDaX/je2r4RcIMJjwFIoG338ox5p6v9/4tLeZNIvyjpyyt/vAzE/67M6ke9Tl
         ok8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgmU7ehB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bg40-20020a05600c3ca800b0040d87192b66sor226983wmb.6.2024.01.03.01.12.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jan 2024 01:12:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgmU7ehB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704273170; x=1704877970; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9Eixksq3Xn36FakjeuKx/Xz/4gtKrZOPm2deTJNUdc=;
        b=mgmU7ehB6SPxKXNVo6Bfo26OaDGeIaodx5IUmiG0hEgVinOF2YNNhMNu4Ivy4hbFvZ
         giP6JPgaw8urk7iB1ZpvXm8YnyS2emP79pptkOiHYPSZP48+Je3fWW45pbtpvODNWnpd
         Xm4e1O9uLA8TdFTyayvgOUBJcl0G4AyAVGx71Teza8tP8b7kJk0Kbim+bqX7GwYxp7gn
         lSn1CwJUEMb80z9b8V7mZxHd4YTc6PFKROjKvKKeL3kc+DEKDIOnCmX4lWw2B/3Ba32e
         tmJu+TcDFveGND2dwiJ6Q3ekBXiwS2+LQsEz7EOdRwFmayN+Q7UDcxSF/Qm0vl1uV7+P
         EBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704273170; x=1704877970;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9Eixksq3Xn36FakjeuKx/Xz/4gtKrZOPm2deTJNUdc=;
        b=Fku1BoD9WHJy6feYF0KUTMdmlphvydhUWxwpThRqN2DPMTePtuOnAtQpIm+q9VsIiK
         okD4Z3ssTO3d3x36cGh/7sM6UhLLwvj3UovLaxr/uCm9WExfE7rAgLJOYcEE+EgcpeFS
         zYlXO4IAIg9ouzgdWL81hSaUFtEr591z78Lxou0INt6hLgm7BnSr5b9wo+6smAtqIHB3
         Ndjp8Xr2szf0JA4FBujumzpDhcj4Gbhl6QAh94x7WPFteNvC9sh1MnFkPQZz1LPo5+w6
         GCXL638T/3Yfp922PT2vQM5RGskg9yX0xVinorU+45L6aaZvPSCUMaGtlU+8wnPNrbDs
         3YAw==
X-Gm-Message-State: AOJu0YyPnMdVrDNrEKh2naQ4C546O7zbnMYzMbGHFNcbFQDiwhItAPjB
	O6J+VFBRE9gqn9kF979muC6AFdLb+dLlRyuJ
X-Google-Smtp-Source: AGHT+IFOxQHsk8T9C7S9DE6YBLFNsBeuI1SEwKFlCZKhqeftFM40CIO81lfYEkGLcE0xIUcgPsHHMw==
X-Received: by 2002:a05:600c:5254:b0:40d:887e:fc85 with SMTP id fc20-20020a05600c525400b0040d887efc85mr327781wmb.32.1704273170665;
        Wed, 03 Jan 2024 01:12:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (tre93-h02-176-184-7-144.dsl.sta.abo.bbox.fr. [176.184.7.144])
        by smtp.gmail.com with ESMTPSA id df2-20020a5d5b82000000b00336be33649csm22921284wrb.9.2024.01.03.01.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 01:12:50 -0800 (PST)
Message-ID: <02f710cd-6118-4521-93b1-598f98a843c0@linaro.org>
Date: Wed, 3 Jan 2024 10:12:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] qdev-properties: Add OptionalBool QAPI type
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Luc Michel <luc.michel@amd.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, Frederic Konrad <fkonrad@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20240102160455.68612-1-philmd@linaro.org>
 <20240102160455.68612-3-philmd@linaro.org>
 <c4e0c179-0fe3-4b16-9a7d-1298e018dbb7@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <c4e0c179-0fe3-4b16-9a7d-1298e018dbb7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: J3c2dZoWaPPm

On 2/1/24 23:44, Richard Henderson wrote:
> On 1/3/24 03:04, Philippe Mathieu-Daudé wrote:
>> To be able to distinct whether a boolean qdev property
>> has been set or not, add the DEFINE_PROP_BOOL_NODEFAULT()
>> qdev macro based on the tri-state OptionalBool QAPI type.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   qapi/common.json             | 16 ++++++++++++++++
>>   include/hw/qdev-properties.h |  5 +++++
>>   hw/core/qdev-properties.c    | 10 ++++++++++
>>   3 files changed, 31 insertions(+)
> 
> How is this different from OnOffAuto?

I am trying to not break CLI which expects true/false and not on/off.

We could extend OnOffAuto to parse true/false if preferred.

(The particular device used as example in this series is not - yet -
user-creatable, so this doesn't matter there).
