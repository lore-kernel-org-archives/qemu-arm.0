Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp3705919lfq;
        Tue, 22 Feb 2022 10:05:45 -0800 (PST)
X-Received: by 2002:a05:6000:3ce:b0:1e4:b2ba:e3e3 with SMTP id b14-20020a05600003ce00b001e4b2bae3e3mr20416673wrg.204.1645553145091;
        Tue, 22 Feb 2022 10:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645553145; cv=none;
        d=google.com; s=arc-20160816;
        b=bkA/8gv9TxebfNB9pQ0IZz+khfI0FCc+EarBieK6pjKbahQDm5dIP2dqVz828pZ2g4
         0JCc3aDg7utQuI8l/3n1q5O9gTd6W1U9YDXwsCh5Vb/6oOK/JQuHHhaidtqraPs7ZcCN
         JQDBPMrILz7IZRRE3oqzzyao92MP8tmbf61HpLduZRP5uWcZZNUQh/MebOm8RdTm5liS
         IeLcNr/JP5nmUDkTTXQzVGYXxXvBIBpN/sXqGGZ4gsGcFUkxcMQU3WrpdR5U50JcdY1H
         5k2iV7oDv0PYkbpTtWfOPAm0yTgZw/p9Ay2aVDYTXshDV+mzrLN3inVVGoCLClEwlDCE
         e3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mRAZx+qBLptrMsABYuCHJiK2Ruy1YgoCHlrcO7wjtFo=;
        b=hFGPFldTFDKIwpp8uI7srGxOQIWdm2K77tDbQTI5Nu6WdEb8po2gV+SlgZL6G6OzZW
         XfswEAnGvJrNLPDjSoeHPj2L6GAh/UTdMObcHm35YAA9rk1eC622Jg8350rds+fFzIBw
         no04l2j/+1BdNIWnM6fsp61mV3plm1TllLiWJW1U84AJXP3I1ju4S02fv5VO4GheqT/C
         goSdnmnvR4xQ6xD60TInMwl6rdpdqaFFyXwD013nJrDX77h02NGvcaaWFRTigacvV5N4
         uvL0qmjzJ5E0T6BrjQBcVwpG9SoVhdaCraANV98Bb7AsPgJx0VG6r22Il49qbIqNPL1e
         64+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=g1Ezq218;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l20sor1506215wmq.27.2022.02.22.10.05.44
        (Google Transport Security);
        Tue, 22 Feb 2022 10:05:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=g1Ezq218;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mRAZx+qBLptrMsABYuCHJiK2Ruy1YgoCHlrcO7wjtFo=;
        b=g1Ezq218nbiTSWOkvPTUMFNE9+eYyNPAlzRd+nPtGUnd5Gn/9zQf7w1ITKU0Jl3p6w
         rVwHZvrDXWAwXleZzOBNxqxqj9i04+AS3b33c3VBlq4EwpfWe/djlXnNiZTtquL2h3eN
         ppNcEvqCqLBQEwrV/zvdC0yEgFcz9u9tl8ZBfV6mIrcGhsqrkUUfP97O9owdgRt9iR+e
         PGqjhei1zwxCqJ9cHTAHERnyod5yhXEW/VTgzIU920MYeSjec3SiQb6JJRAniE96X6LN
         aQJrW2GFQ6kqyKQ6f0GGeA7TEXUxKupGf2HyEyW1HCjja3E2+cs9fSkoAEt+ZZyH/4nM
         TILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mRAZx+qBLptrMsABYuCHJiK2Ruy1YgoCHlrcO7wjtFo=;
        b=18/kKeK85+ojp98fuBzdZuV8E/q0ZpXuOfN77s0NCIm6impVUJF7mSKKa8lkeWzxm/
         mK98HVtGJ/mE8xf4kkwB3R5G13CdhyRkgd9ktggKBtOyGFM+0GL59ZlTPmgmEOpazKgc
         i3jD3nbpMgsUkjC7w8hl6YBUXHSp6IToVZ9r9u4hwRyYsLCrfebs7ywTJ3CC62Lm/Inc
         EajkdcRvhOHUx9f+poNLUos74mFz7mYNM/gvJu33ZttKS+8btAxp1KGhtJVaMol0XEAz
         WO/H+0KT2hW+Vpzk/UwLlBX2SM4rH4AmopAK6EcxmIt/YGnjA6O+H5Mhj92oCg5n5mN3
         5b+A==
X-Gm-Message-State: AOAM532PYY3r2YD8IBdvXHTmrKrlfU54RMZciiDVgqEDKapbuI0ygVKz
	QyUNcsdGyFbPRqbFodKZTZvIhrNV2z8=
X-Google-Smtp-Source: ABdhPJxPMVmWeKIk1PnivZ4ueeSi4igbIxxqxP5arTICVF7BgnRTnffslpr44ezg4UsOdPEeGjBvkw==
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id o24-20020a1c7518000000b0037c07ebf255mr4378114wmc.29.1645553144317;
        Tue, 22 Feb 2022 10:05:44 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net. [83.50.68.71])
        by smtp.gmail.com with ESMTPSA id f7sm47199807wrz.40.2022.02.22.10.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 10:05:43 -0800 (PST)
Message-ID: <d26a877d-f3ad-6186-6a22-1e09f93a3fae@gmail.com>
Date: Tue, 22 Feb 2022 19:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa
 <cleber@redhat.com>, Beraldo Leal <bleal@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laszlo Ersek <lersek@redhat.com>, Oleg Vasilev <me@svin.in>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Idan Horowitz
 <idan.horowitz@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8ggE0HHXwLAu4vCA=kLwo4moN1CvTJbjph=OTmnfOONg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA8ggE0HHXwLAu4vCA=kLwo4moN1CvTJbjph=OTmnfOONg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: e2ykINHhK8G7

+Beraldo

On 22/2/22 18:37, Peter Maydell wrote:
> On Tue, 22 Feb 2022 at 17:33, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>>
>> +Igor/MST for UEFI tests.
>>
>> On 22/2/22 17:38, Daniel P. Berrangé wrote:
>>> On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
>>>>
>>>> Alex Bennée <alex.bennee@linaro.org> writes:
>>>>
>>>>> Hi,
>>>>>
>>>>> TL;DR:
>>>>>
>>>>>     - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
>>>>
>>>> Laszlo,
>>>>
>>>> Would it be possible to do a less debug enabled version of EDK2 on the
>>>> next update to pc-bios/edk2-*?
> 
>> We need the DEBUG profile to ensure the bios-tables-tests work.
>>
>> If you want to boot a guest using EDK2, you should use the images
>> build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
>> not these images.
> 
> But we're booting guests using EDK2 as part of our avocado tests:
> if we say "booting guests with EDK2 should be done with non-debug
> images" we need to also be building and providing those in
> pc-bios for the avocado tests.

Then we should add edk2-aarch64 and edk2-ovmf to lcitool, to have
the distrib images in our generated Docker images.

Cleber, you added this test in commit 6fd52d671d ("Acceptance test:
add "boot_linux" tests"), can you have a look?

Thanks,

Phil.
