Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2855656njb;
        Mon, 12 May 2025 09:53:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLsf7/Iu8CqCvzcaoeg6WLJjc6e8VKl4IlsTICXOHVfYJ6ZhUzHeYyqCmw0AhFeviNvXXVxZb3IJV+qQ==@linaro.org
X-Received: by 2002:a17:903:2286:b0:220:c86d:d7eb with SMTP id d9443c01a7336-22fc9185e38mr217980345ad.36.1747068837131;
        Mon, 12 May 2025 09:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747068837; cv=none;
        d=google.com; s=arc-20240605;
        b=eFL2Epj+7PiqaRmQx/Sab/f1jC0yr1wv8eIp9Q+PCsgOa+67qFiOCq5kt5YJFdnW1/
         u20/r5Xr4qh4WLknH3bvzTseTGsFmAgUmqgsXmt+yA6wEyc3HiNCdmfEda0qjPYSLrp4
         gNWJEYrB8nf9S09ipbNZeNwgGWQIvHRvH2UrPievW/0N85LQwXKQFVgPtyyb7rc66IXt
         LpupxKhg7v/qyvntthyvjf8BpK1+Gcuv0GGxOjt8hGxWS0od6+6nn6/d3CfQNKJ58EwC
         s6GnwhGc33XGYC2Fn2YaJbotulwZe46wTVSeuNx6fOb8RsYa6tIk5RAkb9engLTT56L4
         r9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5qv97JEWqOyn2RBAQVy3o+mtOcNrHF+oRB2lO8yK+3g=;
        fh=1/4ci+BYRavBzxlJsYx6fnqkhdaPQ7VnCYRn0Qs3vKU=;
        b=BN/N8fIC9Y9UwqoEYbbPHJo5CGR06xxmeQpafWQrSUTxX/SZXTT6Ix7il6cvknR8Rm
         +MIZNEmichVmEWLl8k4Pl6faQQkCe4u6rW4Nvrsm3rdnFwxY3pOBuoQaqlqEFMn8FG9j
         0t6cakSyYeuowe1QD0eW8+U17+n7CmIBXU0t6BRKOxsqHBuvYLT3nq4PPrLqoe46vBD8
         hRU5sCjRN829X0bt096qrD7VDXNEt5O/PV+gmG8tX75TmvtTh2Gg4irv7aOL4Q9Syjd1
         qD/2Ahqlb+kZS3iiw2BSLOyEgV6bDZtFsN84EHbggjz2jsqqwXzPe9/YB9GpGGRqt3jM
         ZeSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vx8L9Bnj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5a2994bsor71402695ad.5.2025.05.12.09.53.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 09:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vx8L9Bnj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747068836; x=1747673636; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qv97JEWqOyn2RBAQVy3o+mtOcNrHF+oRB2lO8yK+3g=;
        b=vx8L9BnjE1035c3LdaL1W081TClrE4SKrNnAGiXFNbuEQer/aAh2TkXwv1qAQDjTLW
         dEPi119blnlhCbVkXbEGyngEHJne7xnar18XBBLB0ROt3lLb2/Dcmxm03T75pP87DpY4
         f9C4+1e90DoJrmaT9rSXhFm/xE7z1RYZXAYsU6IFt6p5gvOgxhi9qxmYkzk2MD2gkuGh
         bBRaHvAdSSyyM5CFkJI3MwAP/LoD2I7TqFWWLxHSj3sDuIjWDgOvyDK7FbFiBUr1u8Sp
         vQDNjq9FrQZiFKCV8sV3neDNQfgvwjTZMZ23BEcoVBZfuRPzB+yHdFYYk181WV7WQt/2
         GvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068836; x=1747673636;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qv97JEWqOyn2RBAQVy3o+mtOcNrHF+oRB2lO8yK+3g=;
        b=YJ9J0AXvL0PdX8xiSY8OnCtvZvVvmwSuoB1NOnC+z3wUPuH/7FjrjxNusBlA0e/WZu
         D8PVd9gs/eF+C1zpL8hngl1bZADl4q63gTfcFVQ25f2gb4Ugkt3eRjooiJN7ob0AgzQV
         TkjdfzVYa/j0SQccHGK2vv72ND5AWrIZ1FHkB9pxJOe8oY0hhAxELhWlmYo/+oPmQaa8
         Ix/e7wyTp2HqfTTyelPC53fTUY79ekNFYVcojXBKhxfi+5xDTR3ctC94HrkFjEZ1p8n2
         JGE89k98PdX6jlnJl1gX0V127rblnafPgjY3GkA3x0vk8GceDR/vLKR4T/8P/w1jBZc8
         JPww==
X-Forwarded-Encrypted: i=1; AJvYcCValUseWBqxu2VTRRkJn6E318VEEt1bTfcqNOoc1tlkjkPaykvo3MTWC/WpdgoYBwju/0vvvvv6Qwg6pQ==@linaro.org
X-Gm-Message-State: AOJu0YwBo0m4E/c9p8RoClvXiGJRLtfw/6Exh7Yk1KY3mrp4wLcvtp8b
	r2bvVkSx0o/hjwy3BMZUou3Ks1QTJQVDhyWyhgB5IsseJSN2hq1VsHYewXuMoYg7vA==
X-Gm-Gg: ASbGncuFofq09wxeFNW+AG37eTc+ep/wJhr7eOEhFAlweT+EVPkoANvF+ja7Ed29t/Q
	xLHoFqGR1pJC9/NpYGx3rHgZFjQ7pZ2B+ZgtZHIM+zob/ebaL2LpYOoysfSaDGILWSJo2OPXZwe
	WxKxaQfBAIJstq49CCxfjrhgrJIJbfKb37Q0G4HTg23UzsAn0KQkecOw9XMlKvmtpGGKotvLbLD
	CpL8h4RZv9bDr/3M6mmnRW1RbVXQV5oYyHDcK4evmnUlDpA2m0FTL983NdaJ/lOF+SEp8Ehsptk
	Hbp1aSsp9/euXwi2AxGpKJFay6awqpzfWdxwk7BsLsICiBY0sKxlPURQPaBgaFTjVmaeiKh8/XY
	=
X-Google-Smtp-Source: AGHT+IEOn8CN414mVktJ1vMBGRSWrkkrE+hsDBQ68HIHv+XPldWZKBuYvuSfuI1+1GV0jBqItHroGg==
X-Received: by 2002:a17:902:d581:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22fc91a7375mr222155015ad.43.1747068836640;
        Mon, 12 May 2025 09:53:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc764a536sm65723905ad.66.2025.05.12.09.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 09:53:56 -0700 (PDT)
Message-ID: <726ecb14-fa2e-4692-93a2-5e6cc277c0c2@linaro.org>
Date: Mon, 12 May 2025 09:53:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/49] single-binary: compile target/arm twice
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, anjo@rev.ng,
 Richard Henderson <richard.henderson@linaro.org>, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
 <CAFEAcA_NgJw=eu+M5WJty0gsq240b8gK3-ZcJ1znwYZz5WC=wA@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_NgJw=eu+M5WJty0gsq240b8gK3-ZcJ1znwYZz5WC=wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: sy0Axls+01sO

Hi Peter,

On 5/11/25 6:40 AM, Peter Maydell wrote:
> On Thu, 8 May 2025 at 00:42, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> More work toward single-binary.
>>
>> Some files have external dependencies for the single-binary:
>> - target/arm/gdbstub.c: gdbhelpers
>> - target/arm/arm-qmp-cmds.c: qapi
>> - target/arm/tcg/translate*: need deep cleanup in include/tcg
>> - target/arm/tcg/cpu*: need TargetInfo implemented for arm/aarch64
>> - target/arm/tcg/*-helper*: need deeper split between aarch64 and arm code
>> They will not be ported in this series.
>>
>> Built on {linux, windows, macos} x {x86_64, aarch64}
>> Fully tested on linux x {x86_64, aarch64}
>>
>> Series is now tested and fully reviewed. Thanks for pulling it.
> 
> Do you/Philippe have a plan for how you want this to go into
> the tree? I know Philippe has been taking a lot of the
> single-binary related patches. Let me know if you want me
> to pick it up via target-arm.
>

During the release code freeze, we mostly used tcg-next.
However, now everything is back to normal, we simply work upstream, with 
a simple "first pulled, first in" strategy, fixing the occasional 
conflicts on our respective sides.

So if you could pull this, that would be appreciated.
Thanks!

Pierrick

> -- PMM
