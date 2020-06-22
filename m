Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3089621lfm;
        Mon, 22 Jun 2020 04:27:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEGtb5hMfjpZvPUzYdBlgk+QNQMbMC4Ojlbe9mC+SvZbdcL0BnrDt/UQzrwwiECP0/+OCM
X-Received: by 2002:adf:aa94:: with SMTP id h20mr17647011wrc.327.1592825249787;
        Mon, 22 Jun 2020 04:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592825249; cv=none;
        d=google.com; s=arc-20160816;
        b=BqIijMEDBO7M5NrGqcTxekPpL9KDnz4xywn8FiJtaPfBGrHqN0nkx9XZrUnH3008Ib
         8xPOqqFxin/Wz5V9FUAFwcl66xdKEt+MJZmdGtExdA1zSxhnoM8lRB8EAQzNw+bop1PE
         98RRjBsOUJRVo9s8/Ms1lEdUwq+RwfBPo1URIl/eYFWEYbnR54vSPL/FREdAMXoRoJ2y
         gB1pVcMYBnchrTYXG/Cu+S2xbAi3g25hfwg56FCsJ6Imz7DoCyjVxkWyOmxu5uqm5nQ0
         rmk8dp8NO0d5U/oi0Lp863nX74hrAWU4V4zJv+QaSwpxR7Nz3MxEUhC9R9UEfWvRUN4B
         wTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=6ZlgKKAAjraXgWb9IEx0/LMVepAa772zbfgHk6/+/fU=;
        b=AQ42GKFv4iZyN1RXkGwzwBxTVFh+4SeJ7B/nfMi9kYa0nHs4mQt+W7d8SuIcni6tQo
         6CwBAmOJAhkHI1WbFY6O1wX5Df5PtnpeO+/C1bkMkeP9RHKw3RvyIzvLTh6lY7zVodE9
         yewB42p66YotbNzPhNv7E4SrMizVfEV8rtnANE5iG0MXKRt5ZP8WFBDSRKhvtVEUV4g8
         XDhrBzA0lk6UoHWahrhst4aap0hYsHV+1XUpesMl/L1qglvrGq8wm/l/hacX/CxXCzgw
         KbNe4UIjUy/+Qz/8oIVJ1vHhDj2aYtg4hI8fDtJ0xXulx/kZwzME0UBCx1Gu47HizhRU
         l7iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) smtp.mailfrom=v.dupaquis@trusted-objects.com
Return-Path: <v.dupaquis@trusted-objects.com>
Received: from mailex.trusted-objects.com (mailex.trusted-objects.com. [149.202.244.204])
        by mx.google.com with ESMTPS id s205si15754512wme.122.2020.06.22.04.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2020 04:27:29 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) client-ip=149.202.244.204;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) smtp.mailfrom=v.dupaquis@trusted-objects.com
Received: from [192.170.0.219] (82.233.132.60) by S76918.EX76918.lan
 (2001:41d0:117:dd00::95ca:f4cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.1913.5; Mon, 22
 Jun 2020 13:27:28 +0200
Subject: Re: Role of qemu-arm
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: <qemu-arm@nongnu.org>
References: <20200619170324.12093-1-peter.maydell@linaro.org>
 <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru>
 <e0fc64ab-b36e-99d1-90ea-8877c00f8c0f@trusted-objects.com>
 <87o8pba35w.fsf@linaro.org> <7e057989-56b8-195d-247d-9ab0522ff23a@amsat.org>
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Message-ID: <56ffc60e-f458-e9d4-d89e-4ca70b1ed4e2@trusted-objects.com>
Date: Mon, 22 Jun 2020 13:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7e057989-56b8-195d-247d-9ab0522ff23a@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
Return-Path: v.dupaquis@trusted-objects.com
X-Originating-IP: [82.233.132.60]
X-ClientProxiedBy: S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc) To
 S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc)
X-TUID: +duoryqI2yKv

Philippe,

    It looks very near from what I want to do indeed.

    I essentially work on Cortex-M0+/M3 devices and I will have a try to
your proposal !

    Now I have a couple of hints, I'll probably be able to understand
more how to do this :)

    Best regards,

        Vincent.

Le 22/06/2020 à 11:29, Philippe Mathieu-Daudé a écrit :
> Hi Vincent,
>
> On 6/22/20 10:57 AM, Alex Bennée wrote:
>> vincent Dupaquis <v.dupaquis@trusted-objects.com> writes:
>>
>>> Hello,
>>>
>>>     I am using qemu for doing simulations of code, and currently find
>>> qemu-system-arm convienient.
>>>
>>>     But, I cannot understand how to use qemu-arm. In fact, what I am
>>> searching for is a way of simulating only the ARM core, not any
>>> peripherals.
> You can start a machine with only a CPU core using:
>
> $ qemu-system-arm -M none -cpu cortex-r5
>
> The core will start running at full speed looping taking
> exception because there is no memory on its bus to fetch
> the code to run:
>
> $ qemu-system-arm -M none -cpu cortex-r5 -d mmu,int
> PMSA MPU lookup for execute at 0x00000000 mmu_idx 33 -> Hit (prot rwx)
> Taking exception 3 [Prefetch Abort]
> ...from EL1 to EL1
> ...with ESR 0x21/0x8600003f
> ...with IFSR 0x8 IFAR 0x0
> Taking exception 3 [Prefetch Abort]
> ...from EL1 to EL1
> ...with ESR 0x21/0x8600003f
> ...with IFSR 0x8 IFAR 0xc
>
> You can use the '-m <size_mb>' option to add memory (mapped
> at the 0x00000000 address).
>
> You can use the '-S' flag to start QEMU with the cores not
> running.
>
> Example of use is via gdbstub, filling some instructions in
> memory, set $sp and $pc and singlestep.
>
> You can also use the 'loader' device to load a file into
> memory (it can understand ELF/hex format, see
> docs/generic-loader.txt).
>
> Finally I also recommend you the -semihosting option.
>
> For example you can run an RTOS Fibonacci test displaying
> progress via semihosting calls, by using something like
> (mapping 2MB of DRAM at 0x0):
>
> $ qemu-system-arm -M none \
>   -m 2 \
>   -cpu cortex-r5 -d in_asm \
>   -semihosting-config enable=on \
>   -device loader,file=fibonacci.elf
>
>> There are two modes:
>>
>>   - system emulation (CPU + board and peripherals)
>>   - linux-user (CPU but with a Linux syscall interface)
>>
>>> I can work with qemu-system-arm, and could not find a way
>>> to use qemu-arm.
>> If you are installing via your distros package manager you probably want
>> a package called qemu-user. You can build the only the user-mode
>> packages by issuing --disable-system to the configure script.
>>
>> The closest thing to being a "pure" just the CPU is probably a
>> standalone usermode binary that uses semihosting calls rather than a
>> libc/syscall interface.
>>
>>>     Would anyone have any pointers to a documentation or a tutorial
>>> using this tool ?
>>>
>>>     Best regards,
>>>
>>>         Vincent.
>>
-- 

*Vincent Dupaquis*
Software security & Cryptography expert
06 24 58 17 05
/Europarc de Pichaury Bâtiment B8 1330 rue Guillibert de la Lauzière
13290 Aix-en-Provence/

www.trusted-objects.com <http://www.trusted-objects.com>
