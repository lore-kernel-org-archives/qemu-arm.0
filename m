Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp628873ejb;
        Wed, 6 Mar 2024 09:03:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWs0Ivcra2K9wZZqaS/6TN6x40Z+I4JR4FZpPZuJr1LO48vPA4eQ9WEPUZabXZz3gJO4+6jNIjf/fhp5xl9Zs65WLEG9jN4
X-Received: by 2002:a05:600c:5114:b0:412:b95d:ba47 with SMTP id o20-20020a05600c511400b00412b95dba47mr10800597wms.27.1709744591406;
        Wed, 06 Mar 2024 09:03:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709744591; cv=none;
        d=google.com; s=arc-20160816;
        b=kwrGn/weiPpbwvWGqp++LiGnB2NtaRF7b/WIfZDZxFKxC8XFuLHcpJDvdc7kmQYlgQ
         5zQI/vpdqigC0geXanyLEp8gMlW3RMg4twAitYUOHzlAPi1JdyZzeaeVUfbvd/mri6Qi
         tFDygreVciVchOo0SzE0KIJ2UMIjK4gpLEOy2txsEV+v77T9o6SnYgJ6nb0Ee4VZyKyH
         BA8Q7ol0yBo5Rqehr//vBvmT1t409ioyF4t9cN15i5HnADpaic+DqHNd1B8RJF/+CGDe
         mlU1AoU+Anu3rJP//G3WPKT0E7W5ycdzhGz/FJhcA2PuS6NfTN7GnxPOgeNQS7kZT1Pg
         ccJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=r2aSHjVP+Xu8BA7aiHVPv6ilPDdzaBKFNJurg14KCaA=;
        fh=Wc6u6OIAxvnPlpueCNWXe7/qgZGvXor33ThyjQfcW9Q=;
        b=LQbULOmu00T9lJ+mqtR6FRXVLMbaIwv+JxJ4UZA6KkNKsaIaFyNMd2F1u7PMqAQ7us
         2kTbTyvTj7HIwRKlMdNnqiw2iYM7iADFgwHKtanCZr+SF1h2nX18Qxg+r1A+r4a9eV48
         lfL4YaZKlqiFhi8u4pjhacfGmFH7jY0+vYExrwaAiBoHvmOJ0s14wry+IH/CKXMXXVvY
         vrZLUNLzCghlU2KHW1lQxgZat0WRNJY0X8XtuwscnM+Zdqe9WdHephnyW6D20ZAbHIAR
         QgyN37POrWHUkDfW60MojwrxtO2mqzkipt7sISUpzLKrVotLFOeXTdj72TTBRhHMDEg5
         pz0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gUOedqzH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l23-20020a05600c089700b00412dd4c9dfdsor2712566wmp.4.2024.03.06.09.03.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 06 Mar 2024 09:03:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gUOedqzH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709744591; x=1710349391; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2aSHjVP+Xu8BA7aiHVPv6ilPDdzaBKFNJurg14KCaA=;
        b=gUOedqzHrls229kc9LcjzGgfOITZcSCnkz9/rTV0MeNQbgxtx5L+ZuZ3T065ZNn4da
         xfPAew/Zzbs3v3/uMRhg6DNPIOeh9BcXHCGIHlSJHI1b6XNvNACn8MQ9f8VFTaZ4vFS2
         VLS6dU09aXnLS9J+SODPhxm7WVPlHoX/JhBevQ+3nlQfRfp7mXG2NHeLNzOg3bSOjEOi
         3KKCgSqQdnMaczOPjfyME7J5mg8XzIbWVf3Qg2OoM0fbgT/iBdeCbwoOe/JEvP13XqWu
         mPwfoFHTFP7gIvvhm/cDgmfmv1svUYRqVwWOqpjOUnHFfcKEQC4HwmyRKAw+pdD6ju2A
         I26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709744591; x=1710349391;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2aSHjVP+Xu8BA7aiHVPv6ilPDdzaBKFNJurg14KCaA=;
        b=DRZWqYRFvxA02A6dhDEEZL2nCHpckNhdjAB2Q0lJvdZIavu2k6meWFc+5mG4NCapCT
         UHyhaU5+wnKF71lwWmV6nohPE9Y+ajd3NCy3ik5VDFcjndP/7Use4b1O1xLqo8BSX/NE
         TCqXj8mm45nQZ8jYRawJEDvtS1BE4XpyltMc9j3G8ONcuPif5sUkW70aBI96SlJ3o363
         EmlQVMK3g2Xh580eCwuSP46MHmfMvj4k416bk3LsvNgX7bs56A+p32EZiGXo6FBIrgpd
         OLZeJqCsDGB2IwLj89uCTAMw73q064n56n1HT4y96Qj35losUIZveuChdiCGnoOMv+mW
         NcTw==
X-Forwarded-Encrypted: i=1; AJvYcCUrC2dI0yiEc0VTVwUZkKL0b202bSxS3d7TIv/7g7gfY7tmOZgdsr0ePUSU30hT5FN7IqEx7iHjHvnakadR4a+9Ey7OrWUM
X-Gm-Message-State: AOJu0YymKA3ThJuNFfzWQdwDRHzZCgjEGOgNCdj3snv5K8wjzP8EMp7c
	MfyY+pJmcSMxTeq6MtUtNTZNF1PFNl35I01/598hQNgvzcbw6JxeA/JuDRumBgNZRg==
X-Google-Smtp-Source: AGHT+IEsDTdAWujgDph7eInjSucsXEx2XwJLDZSG22OQUW1INRiZK92/ydMK1V2qWC2wu4aeYu1cUg==
X-Received: by 2002:a05:600c:1d9e:b0:412:ef25:aaa5 with SMTP id p30-20020a05600c1d9e00b00412ef25aaa5mr3453077wms.36.1709744590971;
        Wed, 06 Mar 2024 09:03:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (vau06-h02-176-184-43-100.dsl.sta.abo.bbox.fr. [176.184.43.100])
        by smtp.gmail.com with ESMTPSA id u21-20020a7bc055000000b004129a1097e7sm24003609wmc.12.2024.03.06.09.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 09:03:10 -0800 (PST)
Message-ID: <fdb970ba-0b15-4a59-a5ed-f9df1430ddd8@linaro.org>
Date: Wed, 6 Mar 2024 18:03:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.0 0/9] hw/xen: Have ARM targets use common
 xen_memory_listener
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org
References: <20231114163123.74888-1-philmd@linaro.org>
 <0064f684-793e-4954-90cf-d39c21385a43@linaro.org>
In-Reply-To: <0064f684-793e-4954-90cf-d39c21385a43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kJMbkjL0N4Lb

ping ^ 2

On 13/12/23 18:00, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 14/11/23 17:31, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> While looking at Xen target-specific code, I noticed some
>> generic code used by x86 which is not implemented for ARM.
>>
>> Maybe ARM machines don't need it, I don't know. But I
>> wanted to see if I can get this common code target agnostic
>> and build it once, possibly bringing smth useful to ARM.
>>
>> The changes don't break CI testing and Avocado local tests.
>> If this xen_memory_listener feature isn't required for ARM,
>> I'll send follow up patch that keep this series with common
>> xen_memory_listener but with a runtime flag to disable.
>>
>> Patches do the usual "change target-specific API to a
>> target-agnostic one", in particular using "exec/target_page.h"
>> at runtime. Then non-x86 code is extracted, then merged to
>> the generic xen/xen-hvm-common.c.
>>
>> Thoughts?
>>
>> Regards,
>>
>> Phil.
>>
>> Based-on: <20231114143816.71079-1-philmd@linaro.org>
> 
