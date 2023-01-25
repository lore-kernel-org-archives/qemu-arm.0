Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp328256ejc;
        Wed, 25 Jan 2023 04:18:33 -0800 (PST)
X-Received: by 2002:a05:600c:4451:b0:3dc:191a:3b13 with SMTP id v17-20020a05600c445100b003dc191a3b13mr3165077wmn.8.1674649113203;
        Wed, 25 Jan 2023 04:18:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674649113; cv=none;
        d=google.com; s=arc-20160816;
        b=f9ITkRyM953+i5nbBy9kCG6acdatjfAKxeFNuuS1NGlqvdyVViE0DHX9aMySqQqMHe
         y8MwyxSemqedqLNr1ZWjABEUh724mSIGhak1ID2MV4s6QB4x8BpODl58myvd2W2Puiqn
         Eh12Jyq+Hxey0vWa++ruc72+GF4UNQZoK4DAaDFIMY51VYlSowJfgqbelgSdo7d07LbG
         Wsdj+0uqu0+l7KHOhU4I1vdpwJAoUKO1DtCZ9YXw4+dbEJMnVU73FFMB5dxsvkuKxnwa
         DYdC2C3E/SPCMNHPxDgDQy4dlCKDDkUjts/V5h65BW1FmC1Ks/Xr0N8WNP7WVOkhLFMc
         YRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3sEN5kbOw+2jZmdBXHhxE/xNu6E2VOYJgZaT+5A393Y=;
        b=UQZr4W/kI6VW5ca/wmKnk5OyA5bbGUFT5uHypREwnvXhIyo14uoqnYYvUP8dH6RhYl
         dpq1hk/2K1l6yD1/oysHkrAbJSTfiYGBO3Hb5Pmx9PiCIP/5s2B1v8GXTIw2TY+9V3ev
         nb7YccZYsQRA2SepnuH5dh3txrpGEUh7biiMKAC+1EwKVZzTmE6tGCkSVpxarw/caPio
         ntIpNJsB8uftq1/jCtM3+epBroytofLES35KayZ5Yv5ii7ehbCrRqzSzHXdILGAyT+xq
         2NSRLVtyG3083z8AHlvwCxTtW3xLLiy6SDzMnPvcIeNtIGO6aGrQyeex93C0/fjlqRkv
         FRpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PeEaBvn1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p9-20020a05600c204900b003d23eed82a4sor587658wmg.29.2023.01.25.04.18.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jan 2023 04:18:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PeEaBvn1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3sEN5kbOw+2jZmdBXHhxE/xNu6E2VOYJgZaT+5A393Y=;
        b=PeEaBvn1A+CuZOOl384nszACPDSoESPoZNyEc3XHj2jPL9ksAdJ9NJZ7gyxtjLFxxP
         JoMEqQopYMPYXppJDiitUGoSUFsB+RMuQvWWk8XLmZnOB2N48eaVIkDhmrPRGhI5JmCz
         pjUjQw2XAvHy8UPCuBsGAQrWpVurk/Vs+Q5ZDJCThXkuefhKNthEjWlZz+vAMQV+KPlZ
         FPHDnv2R1YBJ0GgxcMKi82MMQxvG5Gd3MrhFRkwz/D4Zw5ls/JTbAD9Uz/cUmS7vYVeZ
         yi2R0V7YlAl0DWVEc8uwFtZvAYKTFaGurybkSQ042FdwZIUEQl/+1fRYLhHtJY6SXq6k
         quCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3sEN5kbOw+2jZmdBXHhxE/xNu6E2VOYJgZaT+5A393Y=;
        b=MGcqAlkFbkZN+V5iDNqyT/yF8PdJfzy+3v23yc1cvgV+HKdda5D17fDEPR2j2jfJ5S
         2shfFNHCsUpiqEPNbI5tORtuW5ZvRNk28+/EMWNbHpDcGKw62KfQFbev6smUBHWBRPIw
         lryB/IxvkXqjJl352Lgktu3g+3R2Se7VkyzxEDbLb+iJt9ZAfVqDDam2kjKW93rJRm20
         4W19fG7SD2MHf9zrFf89xxYc+AuY/yCIk14jwr8Eb90JCwEo1adc3QAXNYfYpOmIV+Cn
         0uNhY77qsF3OVXX3zs89rYBkxMkoEdzA/T4TdUT5b82nYUwF3RX0w+mMQjNPGbcfKjan
         KJjQ==
X-Gm-Message-State: AFqh2kqQtXeu6gVrGzEi2pgAvNqSJSrp60jdmiLPqyUpF5cLGk1SyLU7
	LZbgTRYE9rD/QpxUDN51vYTGJK2c
X-Google-Smtp-Source: AMrXdXt7XkHFK1LEuV+HW/WcP62139yPIHwOM54QfkhWj0JHlHdg1E0en53gD9xbVxcOEu3MWDSEkQ==
X-Received: by 2002:a05:600c:4d98:b0:3d3:5c7d:a5f3 with SMTP id v24-20020a05600c4d9800b003d35c7da5f3mr39226897wmp.37.1674649112918;
        Wed, 25 Jan 2023 04:18:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.0.114] ([196.77.22.181])
        by smtp.gmail.com with ESMTPSA id d24-20020a05600c4c1800b003db0cab0844sm1603947wmp.40.2023.01.25.04.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 04:18:32 -0800 (PST)
Message-ID: <8c21fc0a-de49-60e3-60b1-bd9f805e3d5f@linaro.org>
Date: Wed, 25 Jan 2023 13:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 20/35] docs: add a new section to outline emulation
 support
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-21-alex.bennee@linaro.org>
 <f21ac8e6-911f-b156-18ff-3929d89ba3d1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f21ac8e6-911f-b156-18ff-3929d89ba3d1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tiU42GwzlJ+B

On 25/1/23 08:58, Thomas Huth wrote:
> On 24/01/2023 19.01, Alex Bennée wrote:
>> This affects both system and user mode emulation so we should probably
>> list it up front.
>>
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> ---
>> v2
>>    - HPs -> HP's
>>    - MIPs-like -> MIPS-like
>> ---
>>   docs/about/emulation.rst      | 103 ++++++++++++++++++++++++++++++++++
>>   docs/about/index.rst          |   1 +
>>   docs/devel/tcg-plugins.rst    |   2 +
>>   docs/system/arm/emulation.rst |   2 +
>>   4 files changed, 108 insertions(+)
>>   create mode 100644 docs/about/emulation.rst
>>
>> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
>> new file mode 100644
>> index 0000000000..bdc0630b35
>> --- /dev/null
>> +++ b/docs/about/emulation.rst
>> @@ -0,0 +1,103 @@
>> +Emulation
>> +=========
>> +
>> +QEMU's Tiny Code Generator (TCG) gives it the ability to emulate a
> 
> I'd maybe rather say "provides" instead of "gives it".
> 
>> +number of CPU architectures on any supported platform. Both
> 
> I'd maybe add a "host" between "supported" and "platform.
> 
>> +:ref:`System Emulation` and :ref:`User Mode Emulation` are supported
>> +depending on the guest architecture.
>> +
>> +.. list-table:: Supported Guest Architectures for Emulation
>> +  :widths: 30 10 10 50
>> +  :header-rows: 1
>> +
>> +  * - Architecture (qemu name)
>> +    - System
>> +    - User-mode
> 
> Maybe just use "User" instead of "User-mode" to make the column smaller?
> 
>> +    - Notes
>> +  * - Alpha
>> +    - Yes
>> +    - Yes
>> +    - Legacy 64 bit RISC ISA developed by DEC
>> +  * - Arm (arm, aarch64)
>> +    - Yes
>> +    - Yes
>> +    - Wide range of features, see :ref:`Arm Emulation` for details
>> +  * - AVR
>> +    - Yes
>> +    - No
>> +    - 8 bit micro controller, often used in maker projects
>> +  * - Cris
>> +    - Yes
>> +    - Yes
>> +    - Embedded RISC chip developed by AXIS
>> +  * - Hexagon
>> +    - No
>> +    - Yes
>> +    - Family of DSPs by Qualcomm
>> +  * - PA-RISC (hppa)
>> +    - Yes
>> +    - Yes
>> +    - A legacy RISC system used in HP's old minicomputers
>> +  * - x86 (i386, x86_64)
>> +    - Yes
>> +    - Yes
>> +    - The ubiquitous desktop PC CPU architecture, 32 and 64 bit.
>> +  * - Loongarch
>> +    - Yes
>> +    - Yes
>> +    - A MIPS-like 64bit RISC architecture developed in China
>> +  * - m68k
>> +    - Yes
> 
> Would it be possible to link the "Yes" entries in the "System" column to 
> corresponding target-*.rst files? E.g. docs/system/target-m68k.rst for 
> the m68k entry?
> 
>> +    - Yes
>> +    - Motorola 68000 variants and ColdFire
>> +  * - Microblaze
>> +    - Yes
>> +    - Yes
>> +    - RISC based soft-core by Xilinx
>> +  * - MIPS (mips, mipsel, mips64, mips64el)
> 
> The table renders very badly for me, the last column is cut off and you 
> need to scroll to see its contents. This seems mainly to happen since 
> this MIPS entry is very long. Could the information in the parentheses 
> maybe be shortened to "(mips*)" or be dropped completely?

Or "32 and 64 bit".
