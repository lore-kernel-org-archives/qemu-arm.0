Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3171502njc;
        Tue, 19 Nov 2024 02:40:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAAJezOtk9Un7lWOvLLKQ29d+TFmXIkEH/N9Wun1r35EjlBNjLKbVgbVcqHtABoN07u4K2RMf74duRgQ==@linaro.org
X-Received: by 2002:a17:907:2d0a:b0:a9a:4120:c107 with SMTP id a640c23a62f3a-aa48354d8a7mr1547417666b.60.1732012812014;
        Tue, 19 Nov 2024 02:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732012811; cv=none;
        d=google.com; s=arc-20240605;
        b=dQzDeKNnNjFyxMQc7cnUX98TsS+lWK5vAFaMOd+QbbUdb+WakHsFMXkgl15YjxhMNl
         HXFtAtCfPJD4f+gFMFsCsk48IYVK1BlqJjy8DqNGP6O5tcuFlySCifeAG31bNtGJtO0B
         lhT2VWNrvUUs/ofXndj6WkTIRwPJc+w8v9Bk1SZbmF+Q+YvmakzotB9WtEUXgZ3P1G/v
         T4el4XdG+7tyWS5HDE8Fu87oWDQM2JnyLQHLutoxzvyDi5ALdS+x7JITuOZLrpdyYpwy
         d0hvGxAKMVSimg365zQXNksU+E8aWqoizZCUwWCGo+p8wR0GRv/aZzyZzYtVJV/JpUVK
         K0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=THtpbfJdln95maIr7ixA/yr0koffmRe+qHEjDjkjA8c=;
        fh=R6OTSfUbB7je2qpT3roS4UUamRH/nzW35A8ZcnSjU8c=;
        b=WL3lHopRx4jXOHF5tOVbMGQV5if4h1tdB0CYbK+aoUOCE0xeCqI+2T9ptKpLpUHBow
         quhBg08Ru/5B/CphlQbVShUcVU9pktM9Q4qwivnG8SldyWhkDOeK+ZdWTnL3k90hGKKY
         BTKv7mc5lOFolYptSTbDQVMjC9FWyHSkZ7yflie0U44CVUHIenTyM6WjPIbI8McCmAvm
         2V334LcYDkeME94PU+YU/NCQpNOnx8oRh8lvtVd1JaUguZ1WvOhcwVraffZW9FC2PXU7
         QrBchJLPf9YOQbSzXanarlZQj6XYNa36hRR992pX6PlCa9JWjBFFwNTbDReMyevL/ksm
         qlxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGPw3DVM;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-aa4c7ea722asor61224066b.0.2024.11.19.02.40.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 Nov 2024 02:40:11 -0800 (PST)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGPw3DVM;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732012811; x=1732617611; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=THtpbfJdln95maIr7ixA/yr0koffmRe+qHEjDjkjA8c=;
        b=eGPw3DVMpClZLvt0ntid3HHekZlIvffN14qvmaHRAP3f8LoLhdn/GbVHDZrZaK883q
         udSU10BNnyuG2YamPWDNQlDMJzqEIeqNgLttWgaKW2afZvZrGY4wQc5NRJRhP8aARyF3
         s7pToo0hXuXL2XVuKDyRkv7erHlvztY9v+a9vRzV6z/+I7uMfaCHVHEfu71ErKneKlsg
         QUCZ0upOnQ7fTLUyyPu8JvHXmWzQtd4Bl86JQqv2R6tSOcrFysj1ZAId8xLpBRAw1iiY
         ILjalEwkIIp6Iq/tpB1R+noZr1iLr7rt5w/xWVAUL3u210pocG+3i9lfn/DT3431dKCA
         xLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732012811; x=1732617611;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THtpbfJdln95maIr7ixA/yr0koffmRe+qHEjDjkjA8c=;
        b=ZcJRHYz+nEpPn7wFZo8WrqLozsrcfwDWjiWQRkQsrpZ+3XYk4FcC8/nrQ1dGLQ2j30
         jdKa9DDX+lS3V98URUXw9jANL7aPZj5/nvsTSOOCjjsSiRER+65sQMDe1FDOdPKn8tOG
         C/cjndfWc3I04rJXVliLWK4yiyXmoSLmQB15gZPk+3RP81rxcXL1DYj/ewThIOzttyUN
         3cKq0831rlH08xafhP+HdboJH5PdR0CuWxfDYjjzngmhy4ue/6KxRAz2w2X8zWIzOGb7
         iXVSDDDjd+AstkYB7BSQKQfOftjlF8hZgVd7gjY7vKukoRUXLXpGAv+ZKyCkvm2rIbR2
         94zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFyADjfAUZXDxWdJzL2UXZWp3yBaSXOWmqkEI7eK+LAZEWkWDfAv4pP4rFjpcmHk/Gp8DNTXCHb3j1Mg==@linaro.org
X-Gm-Message-State: AOJu0Yy5gzN1X1EIvjl55xZIpFDfj7iTlWZyqNjcynosgMR/kmc/reUj
	nT6cwkola51Q4KbeKQ93qdqJbvQ5XlXfLUSF0cQXd9Y22T5m/K7oDBpB9eYp3WpOxA==
X-Google-Smtp-Source: AGHT+IG0lQcj0gAaodVVWuBBo0NDzm1D1vtzciBlmBFGIGoFGj580jCq0HIZquTD3Mr1ulBx9UIiVw==
X-Received: by 2002:a17:906:c081:b0:a9a:c03:ebc8 with SMTP id a640c23a62f3a-aa4a2d0a3d1mr710289766b.37.1732012811506;
        Tue, 19 Nov 2024 02:40:11 -0800 (PST)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.210.26] (83.11.2.232.ipv4.supernova.orange.pl. [83.11.2.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e0016a7sm636826466b.116.2024.11.19.02.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 02:40:11 -0800 (PST)
Message-ID: <58dbb4ef-62d3-445e-b891-04a9027d63d8@linaro.org>
Date: Tue, 19 Nov 2024 11:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] docs/devel: add b4 for patch retrieval
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-4-pierrick.bouvier@linaro.org>
 <ZzxXAtuRowg8hp9u@redhat.com>
 <47831adc-26f7-4633-a371-975c97e8dae7@linaro.org>
 <ZzxjciUGNIVoUuVC@redhat.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <ZzxjciUGNIVoUuVC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HFKxO+epn79c

W dniu 19.11.2024 o 11:07, Daniel P. Berrangé pisze:
> On Tue, Nov 19, 2024 at 10:56:36AM +0100, Marcin Juszkiewicz wrote:
>> W dniu 19.11.2024 o 10:14, Daniel P. Berrangé pisze:
>>
>>>> +    b4 shazam $msg-id
>>>
>>> I'm wondering how b4 knows where to find the mails for $msg-id  for QEMU ?
>>
>> It goes for https://lore.kernel.org/qemu-devel/$msg-id by default or checks
>> b4.midmask in git config.
> 
> How does it figure out to look at  '/qemu-devel/' by default  ?

Sorry, was wrong. It goes to https://lore.kernel.org/$msg-id as this is 
enough to get mail.
