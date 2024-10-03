Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1535359njl;
        Thu, 3 Oct 2024 09:02:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrn+cXQi6FHE2SHNaSKZPJ6byWruscZS9MUstYFqfozuVvTgdQmzXJeolElfj3U4ByO2cQLDr8OrnrAg==@linaro.org
X-Received: by 2002:a05:600c:1908:b0:42b:af52:2525 with SMTP id 5b1f17b1804b1-42f7db474d1mr35344835e9.16.1727971324982;
        Thu, 03 Oct 2024 09:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727971324; cv=none;
        d=google.com; s=arc-20240605;
        b=Zq0Z+CKKLBrwtfC+htfrXQv8qo+gRj5oTy3ejz/7vVijPL5DG32vhY+N+I8m8AQVta
         7JMZ1zjN7u61v10apMJ0Mols3riakrmeKPgZoDg56pRkt35L3mdqHY+J0kE56F/4cO8E
         nqKQy5jNR1vi0L9LyTNJoNDn3GhUJTU6ivGc6NH2Dl52TvD1fV4KOP9DebKrWLPwnG9m
         MqmxFYVrknqvfLMDOW89ljHB+Pcd+4gzt9teX3FUCrGahpbYri5PwCf36k90yC8rMmYQ
         c6UvkuImb4IINHqp1nODbI+fbHFbN7nXyk4mojB9PmWUoHij4DT/Cfah1ZcSk6POrQkN
         YNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZE4Ya70wcZxe1oSW/DEc6u3Q93jhrwN3YL6W9Z4x9pY=;
        fh=gXI/FJYPb9MOMwhDngZeuGjosfybe6Mvp4Cx9w5TtKI=;
        b=YTK2SlO8pQBPbuil4SLderlyUrwD/wwcHUyoawd7MUMxuratopgpdTRRr1zZJDLuJP
         MjEXW/ph4+cIx5H34NPzKaHkW2NH/EFAYKRgM1b0OtA+Ttnd19bYfHSXSp+tPuBJpfGV
         uvLIdHLxmfk/QIVHEXRh/hn7d0vhcgeT1Ju9SkY+0NoZyTNa/Rk8dVKh/1NDHihXNlGE
         x/w3fvFdWJ3aMT25ehJAs2Up2HFQPJNtPAjGWlFBRifYFD2ES67R9j3s88weMsMPyJYd
         SKMyoeJUVGgvSLBmCX7YIFyYaa9gMF6ukBdM4ORghEhxdk3Av4fzlIEiKUWkuqkf4IkW
         x6rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jyWEGrYX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f82f03449sor2499855e9.9.2024.10.03.09.02.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Oct 2024 09:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jyWEGrYX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727971324; x=1728576124; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZE4Ya70wcZxe1oSW/DEc6u3Q93jhrwN3YL6W9Z4x9pY=;
        b=jyWEGrYXuRT6zW9k3doEKmlG8RWqsXcrVoi0K/Zg05QVDTciioJrbgS0Ub2+v06MKw
         Glb4nEYnpg6W0M7LMAN2T6B66Gp9Q+g9Aj4M/iqbN5EnlGs0kzzqxXYj5j8CUKoO3gBA
         DJNTa7lszwYY6RxlFSBCA+mqbrtwEvuuzaR8Yq2J8k7AP26T4gM7yIJOpQYIwkP31chc
         WVGWEAk3+cE++aKPwmHpbUKcntmLgpb0yRsvReuVq6WP2mf2m6sj8GnuxIV+nOVYIx+5
         mlD1HEbwhXkLSFBbr25XJvJawCyNfgGLV0W0YswuDqPNC+iJaB/c/kRO3KUEy4x9Ypww
         Ykxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971324; x=1728576124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE4Ya70wcZxe1oSW/DEc6u3Q93jhrwN3YL6W9Z4x9pY=;
        b=LWrdZlSBqCMcp7wJuz/JK+CIQa7nEynwEY5bgPTjyatRC15R5e3eVUkXBwKBU2nQAz
         byWvvV7UVUV9lnNxj/OIjq1l+qHBiFCvs6fJkSEyUvsumiiGVa+cNeRqZEREXZA/G/Ly
         9BScvRfPbWEwgcWBRbzLP0+6CpOyCntPg51HrbaejWK+c/xmyNJkPbh3BsBpuCOyaPrC
         weLn4CdKVQu5sq5umIMROYm5u3KLsrQP0IZjFrG0k4rqki1yFBjAEvk7kyFSEnH0gu8S
         R/yjkcfMCkVAKAdUvf5DvIZwZ9FXnJz/iz6HiaSCI56dTX3vXN+bcHDUChEwHjFoDNcY
         VdOg==
X-Forwarded-Encrypted: i=1; AJvYcCVPg3vXtOXn1FLvHlEXI9s+FOXPzLnE6kI8VHhKg3bD9lbKJyvIdaxiYCzK5kis0FSP0OGGN2kZCL6g1g==@linaro.org
X-Gm-Message-State: AOJu0YyXpfH0ZxpudXWEy+Q3FZY6UhYZRgVZO7FHf/F0mMBW4BZfwZU9
	ik6LQY/oWSnj1lZuEPol4ehko5OZYpu3/0c2OvMKh6EJdQRBthFEUKXBej/scfpmag==
X-Google-Smtp-Source: AGHT+IHWZQ9mssilUnv4Xjg1bn9DYHYRKV+eMJ7lf6nGkDtF7R8zx35xwHAZJJEsBJqtn/KX7K71aw==
X-Received: by 2002:a05:600c:1d8f:b0:42c:bae0:f057 with SMTP id 5b1f17b1804b1-42f777b9dfcmr61045145e9.8.1727971323859;
        Thu, 03 Oct 2024 09:02:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.13.175] (49.red-88-29-183.dynamicip.rima-tde.net. [88.29.183.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a02eb3csm47907335e9.43.2024.10.03.09.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 09:02:02 -0700 (PDT)
Message-ID: <0c28a435-0af6-450f-8558-14dddc6cb6a6@linaro.org>
Date: Thu, 3 Oct 2024 18:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] hw/xtensa/xtfpga: Replace memcpy()+tswap32() by
 stl_endian_p()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-9-philmd@linaro.org>
 <257b0de0-6744-4ae8-a2c5-f05eec29a3f0@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <257b0de0-6744-4ae8-a2c5-f05eec29a3f0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wBqpk3Y8MlCi

On 30/9/24 16:32, Thomas Huth wrote:
> On 30/09/2024 09.34, Philippe Mathieu-Daudé wrote:
>> Replace a pair of memcpy() + tswap32() by stl_endian_p(),
>> which also swap the value using target endianness.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/xtensa/xtfpga.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
>> index 228f00b045..521fe84b01 100644
>> --- a/hw/xtensa/xtfpga.c
>> +++ b/hw/xtensa/xtfpga.c
>> @@ -438,11 +438,9 @@ static void xtfpga_init(const XtfpgaBoardDesc 
>> *board, MachineState *machine)
>>               const size_t boot_sz = TARGET_BIG_ENDIAN ? sizeof(boot_be)
>>                                                        : sizeof(boot_le);
>>               uint8_t *boot = TARGET_BIG_ENDIAN ? boot_be : boot_le;
>> -            uint32_t entry_pc = tswap32(entry_point);
>> -            uint32_t entry_a2 = tswap32(tagptr);
>> -            memcpy(boot + 4, &entry_pc, sizeof(entry_pc));
>> -            memcpy(boot + 8, &entry_a2, sizeof(entry_a2));
>> +            stl_endian_p(TARGET_BIG_ENDIAN, boot + 4, entry_point);
>> +            stl_endian_p(TARGET_BIG_ENDIAN, boot + 8, tagptr);
> 
> Why don't you simply use stl_p() here?

We want to remove the tswap32() calls...
