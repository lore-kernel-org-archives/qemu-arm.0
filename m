Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp286916njk;
        Tue, 17 Dec 2024 07:20:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcKD+6XqhsNyw2CQSWAUh12BISG/ZBQMRznMFFklbfkr4/YJITGH3ktI6p8U1BAVS/jgEJ7JW8nwFjZA==@linaro.org
X-Received: by 2002:a05:600c:3516:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-4364815c7d6mr36013335e9.8.1734448816147;
        Tue, 17 Dec 2024 07:20:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734448816; cv=none;
        d=google.com; s=arc-20240605;
        b=fkFdxUTTSQksYmkwJsnfRXDZkmiYLoURTejczmuUL5yp7Tg4UzUEpVPUcpdc1Gk2C+
         /DWTUwgBEX6QP93U6Bvt/zXDH+UpLDmexvdWM4q5iNnrC0cDCqrZoFXjPxZGQn6dqhLm
         tgnKdLEZoOgFm9G9PmKAV9JdJ6RrlW2pg9odd1IIjdhQT38l/uiGWYb+2Gd/Cw5S1mJH
         hvTQqeMENRh+TkkonX2WY8z793JrmqBSTG8n1zCWUJeNF4JR4fig3mROwBNWTnkSRMMq
         hVoot+N2ZVSD5ieAPp+8jv7HfctLsyGKJNxvxk+bJ/MKtawlXk9tbTIBqndBdtVtrAjc
         r4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3XBk8Jjn5DR2szWJNgkjKw+0Pf3QK5WLRr6yAt6muaw=;
        fh=hSN1iJSS3bODKcfMKiHhk7hcRkEKzu1XmZA2GxOjTaQ=;
        b=LZkuqh5sPo+Mpqp74zqnMKNwJ9C2WjvUkqii0q2zomXPygzC2qBbOF55zXJ3vi6JzI
         fpr2dMI0LncDJzZMd6G68Hq9VcqfRLv8sIsG3zvDCCR+/1cY3UjGv92wQdA82YBTF2I3
         SUquea0c5XOstJTHbZDJlFkzM5QhXl/YcvgheMylJpt7STUfmBId9WMVX8wTd9XXm05f
         PiM4EXalWQ29rPns2myQvENiS9CIyf/ir9RmcCdcCmn6Io6rx42kSebGKupn4UoP2VVw
         axUFxZP+0CQH0MFiCN0HuBAqMZc4tUbe9aKjpreoJz6+BOFuiIWhmO5Hh10M6yr0PuOB
         1uKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=amutnVxF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-436256f5e52sor13389475e9.3.2024.12.17.07.20.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Dec 2024 07:20:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=amutnVxF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734448815; x=1735053615; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XBk8Jjn5DR2szWJNgkjKw+0Pf3QK5WLRr6yAt6muaw=;
        b=amutnVxFzu0pggQVTPjCDxFYAobD3UA0piUQa7VnqsSARiQLw3URxy9iWMWzxoh6hP
         ZDn6ynxogRnzP3roi6nPDWQoPrveldQWh7HPa5037a7BxkY9DIeVo11Z0jMhunzoOIxv
         HyfxtsNnDjSIbdgcwDWGdqoMv8auJ+i3epO0ubf7wqDzwEBT4rJA8UVzsabFV68tpEo4
         8f35siPvL/uHFa1q9xfcvaX1IFedPojDHKBB3tDdU1/18M3Gif7JV5YL7+Fxv6MWK3q/
         ivPVVquF5JLQCHuAavBFg0MlkZQJfGqzKm5zZ+t6Y3iuMsAyvstQDf/slxx7L3W34BqC
         0Dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448815; x=1735053615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XBk8Jjn5DR2szWJNgkjKw+0Pf3QK5WLRr6yAt6muaw=;
        b=EYXHLFCR/zaP4Tar7hw+F5FdJdFy0/aqm328REk+jJUYtMsYDDv081MCFaUqr8KOav
         BrL+gOaPyhCh+GGpm8uT53jPX79XhonPSbWAh4Fk0+v8f4uguP0/Psqt4qiJR50mJWa+
         kNEDesv72m3WMNuptA1kKmX/mxHnOte7BLyXe/JnN3MUs8W5oaASfpaYiCbXrCKLtN6N
         hFvPoQVB8u/oX3/iOJTrZgMGVRlncEHHJzOsXPcddEU3pSRBmsyJ3zL1NHQi5zLCw2cM
         rIwl1rNCXSfXdJX30vzpLUcWGSMyCdPdUGe0Eucs83vfDXcArY9QDPSKk2G/S2JHQrTd
         vmBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4Vb58Nmh1ipu4vcppS6e6xzgk204tZVDw011mLNgcUh5VDqsB2XI8wIBIGqvIKRvBqWqUp5hHpkgY+w==@linaro.org
X-Gm-Message-State: AOJu0YwM4+q2ZqJhh5lHkL8+81K730vfePMMvHUpYaB8UYNprNtrRd2u
	RGEgCFkhUU9W1NjBwN5Xkv7IV3vEvUt6nJDKQJCgwJucaEaB2e+V2y/lLp9HvH0vAA==
X-Gm-Gg: ASbGncul7xC57PP7vdD5IHYr8nWZA64TuYWid8uXxPy3WzhhPPNeJTDY1ds9qdSz40n
	kKPLA83wjvBgRK7m/G03E5uMAYEfMxQCJxqf40I0TLYPsVVzPFxtHH9pUNnTlTO8qPAr/gEFior
	mkMOWudIU8a6tMSnu81oYv9eVuE6lxGUIA6Jgq6HPUbT7dqc5PPE1XoHrlh+VTkxEzcuVI822PS
	zqYC12bkk4X4UU99en32ACI7OF9UgUGl0hcYVpMWApzJKVqGwG9Wd+b5dBgbOk+AgsuHOwj
X-Google-Smtp-Source: AGHT+IEVeqsXuNFGqhhhRpdo+vYacFvNZidciwLuAAkJJnA+nopy+oDMdfNqlV+x/GjuVVn+4XAlqg==
X-Received: by 2002:a05:600c:3516:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-4364815c7d6mr36013015e9.8.1734448815574;
        Tue, 17 Dec 2024 07:20:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.117] ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364a376846sm22946685e9.0.2024.12.17.07.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 07:20:14 -0800 (PST)
Message-ID: <e8b9c9d8-c838-4418-8af0-b1e009b41e3c@linaro.org>
Date: Tue, 17 Dec 2024 16:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] hw/arm: Include missing 'exec/tswap.h' header
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20241211230357.97036-1-philmd@linaro.org>
 <20241211230357.97036-5-philmd@linaro.org>
 <0cd4b1da-eebe-425c-9a6b-b712e0a877e0@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0cd4b1da-eebe-425c-9a6b-b712e0a877e0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7WZvWbL2DWqR

On 12/12/24 00:53, Richard Henderson wrote:
> On 12/11/24 17:03, Philippe Mathieu-Daudé wrote:
>> Some files indirectly get "exec/tswap.h" declarations via
>> "exec/cpu-all.h". Include it directly to be able to remove
>> the former from the latter, otherwise we get:
>>
>>    hw/arm/boot.c:175:19: error: call to undeclared function 'tswap32'; 
>> ISO C99 and later do not support implicit function declarations [- 
>> Wimplicit-function-declaration]
>>      175 |         code[i] = tswap32(insn);
>>          |                   ^
>>    hw/arm/npcm7xx.c:326:26: error: call to undeclared function 
>> 'tswap32'; ISO C99 and later do not support implicit function 
>> declarations [-Wimplicit-function-declaration]
>>      326 |         board_setup[i] = tswap32(board_setup[i]);
>>          |                          ^
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/boot.c    | 1 +
>>   hw/arm/npcm7xx.c | 1 +
>>   2 files changed, 2 insertions(+)
>>
> 
> These could all be cpu_to_le32, since TARGET_BIG_ENDIAN is always false 
> for qemu-system-arm.

I agree, but last time I did that Peter insisted for tswap():
https://lore.kernel.org/qemu-devel/CAFEAcA8Exn0VMzM1h048q4Nm7toxkpaOv4B-ZE4FEXKgHoqy7A@mail.gmail.com/

Peter, was my wording in that previous series not clear (in that case
I can try to clarify) or was it OK but you reject the possibility of
using cpu_to_le32() to remove tswap() calls?

(Here my goal is to have a single binary, so I start removing target-
specific endianness).

Thanks,

Phil.
