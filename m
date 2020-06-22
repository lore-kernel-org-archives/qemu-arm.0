Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3009905lfm;
        Mon, 22 Jun 2020 02:29:43 -0700 (PDT)
X-Received: by 2002:a1c:4086:: with SMTP id n128mr11456438wma.118.1592818183774;
        Mon, 22 Jun 2020 02:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592818183; cv=none;
        d=google.com; s=arc-20160816;
        b=nUach5JtXREKEK6LAFEI2LiDuLDIwcRWtYZXr3d7ZliqS3A+lbvcjfmmNYoE+H3Org
         RTGXRCD/6ecCOjqlQm+lmQh4pb77S0r8iT6M1W7IWOK1wOssCKisWcyCQgfEFYUFNB5U
         I7mTBB77AO4z52u7Q6E3cewLbhpzyb7uhWx5fPG3naDmhBJzdLRsP3XnRevFRtVy7oXf
         2wkgG0AI0S3TLwROJhooHutZBEmiOXhjGL6XUR/US9Urel2Xv0KpI9SJRh7VWZllQlUs
         XbYhHbqI0indqBMWQLgTmGmKl919ov7hinEnYw+SZuiwmeNPIMJsBjlbITiDxHFPtR/D
         weQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=Ca6XJxPThXv+9bzwTR0Smz2z2ccwVBiqvYCA5LXuO5g=;
        b=R2J4FVfd4TUSDbqeJD+JPX6xAimslg0M4nXa/zRmazSKluWpvc3TCd33TUfhcQI/nn
         GGsK72xXdgvkH7K0y4t4rT1kP8IhEu/08TbdA5d6tSSvZkcJN1oUuQilZ7AfFEWwCbIX
         bDMMa75xLh6cwjXqD/0xhSFthA/DO3m6QUDVzvIDNJoKGDX0a2/myfv0Ev2LWmoEuRm5
         tyRoMWNcTL56LtSIduRAn/q9tIwaojKNyCBjOhRR7lvRHA4tj7BVyYnxtPlpxj2eqLoo
         d+b+LyrVII97t5CiOYEoDDl1s/fKbrTafoUv2mA+yYckhottQuKxdA8tlHXoliM8dnS7
         zEsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XHd1GroC;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y24sor1488307wmj.1.2020.06.22.02.29.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jun 2020 02:29:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XHd1GroC;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ca6XJxPThXv+9bzwTR0Smz2z2ccwVBiqvYCA5LXuO5g=;
        b=XHd1GroCvsPFT47grE71rL1EQTapy9qBfX5uuDm1HSZfNguTKNaUNuuDCoGlCio7ac
         A5RYrW0HDTfI3zv0YQUY5/BhacYtcVyVtph4JjvbxzneIKUayQa0Zktrf4tiTNO1TlzP
         /fgXK6MoN6rKI6MlPoTBk+3VFXIdrFNMVIk1gi3IZF72zCTwHkZO9EEhOfcu8+a1V0l6
         5xKw/Kw5woAnXatMExnrRIQbqzNR2cquryX3mV2HoeF2ic3BUA+DRzKxvG65MF15tGZ5
         XqayIV2AnJfkAMlD393GPNpOjYtA3pDHCJARGC80xhNDmAGD9WL3r62T3N08EBfsHLOQ
         XMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ca6XJxPThXv+9bzwTR0Smz2z2ccwVBiqvYCA5LXuO5g=;
        b=OYRGj365rIo5cGSfA0BegsepmTyObeGYHMD5sSpjqgXPCGIsucfFpGg6TIsxiPqRkM
         yLPvtjg4NZ9jgKSpDecaII+2XgXjCIdHf3Eh7x6ffDwV0jPYv4WI2ikJlWRCZl46P4tH
         s0FQ9M8f6Odt/XR8XGIbcwlJ/bxJll7f1xwYlW6F4LSDh7C4fDHlRI5zMn3JUSMQ0+mP
         gwgeRU3yrcXK5+hvoGM/MvWcfhOou+IAY72EJF6/tO0nQI/jgHgqsI+4652kDhYs0d3h
         89a5kMun2CexFqRoqP5hzcwQwojYxvq9Srplf6YouNIZpP+PFNOhJ/OzdKHgOW/UL2lB
         HKcw==
X-Gm-Message-State: AOAM531S5rNBzOGqbnqIltHXI9h6lZNKBA4r8MCBQEZqIaXKWiIxASgs
	+QcNyHjb0XExyz+5E/dLvSU=
X-Google-Smtp-Source: ABdhPJy2dOGhMqPpvXMM1Ag9INNbe57fDkhac6d24pi+WWOVCM2iKIFRmg9k7Y5aRsMmZ5Hgff7ZLA==
X-Received: by 2002:a7b:cb0f:: with SMTP id u15mr14068717wmj.34.1592818183492;
        Mon, 22 Jun 2020 02:29:43 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net. [83.51.162.1])
        by smtp.gmail.com with ESMTPSA id u10sm3862140wml.29.2020.06.22.02.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 02:29:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: Role of qemu-arm
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 vincent Dupaquis <v.dupaquis@trusted-objects.com>
Cc: qemu-arm@nongnu.org
References: <20200619170324.12093-1-peter.maydell@linaro.org>
 <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru>
 <e0fc64ab-b36e-99d1-90ea-8877c00f8c0f@trusted-objects.com>
 <87o8pba35w.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7e057989-56b8-195d-247d-9ab0522ff23a@amsat.org>
Date: Mon, 22 Jun 2020 11:29:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87o8pba35w.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: TnAi9Je1zs5w

Hi Vincent,

On 6/22/20 10:57 AM, Alex Bennée wrote:
> 
> vincent Dupaquis <v.dupaquis@trusted-objects.com> writes:
> 
>> Hello,
>>
>>     I am using qemu for doing simulations of code, and currently find
>> qemu-system-arm convienient.
>>
>>     But, I cannot understand how to use qemu-arm. In fact, what I am
>> searching for is a way of simulating only the ARM core, not any
>> peripherals.

You can start a machine with only a CPU core using:

$ qemu-system-arm -M none -cpu cortex-r5

The core will start running at full speed looping taking
exception because there is no memory on its bus to fetch
the code to run:

$ qemu-system-arm -M none -cpu cortex-r5 -d mmu,int
PMSA MPU lookup for execute at 0x00000000 mmu_idx 33 -> Hit (prot rwx)
Taking exception 3 [Prefetch Abort]
...from EL1 to EL1
...with ESR 0x21/0x8600003f
...with IFSR 0x8 IFAR 0x0
Taking exception 3 [Prefetch Abort]
...from EL1 to EL1
...with ESR 0x21/0x8600003f
...with IFSR 0x8 IFAR 0xc

You can use the '-m <size_mb>' option to add memory (mapped
at the 0x00000000 address).

You can use the '-S' flag to start QEMU with the cores not
running.

Example of use is via gdbstub, filling some instructions in
memory, set $sp and $pc and singlestep.

You can also use the 'loader' device to load a file into
memory (it can understand ELF/hex format, see
docs/generic-loader.txt).

Finally I also recommend you the -semihosting option.

For example you can run an RTOS Fibonacci test displaying
progress via semihosting calls, by using something like
(mapping 2MB of DRAM at 0x0):

$ qemu-system-arm -M none \
  -m 2 \
  -cpu cortex-r5 -d in_asm \
  -semihosting-config enable=on \
  -device loader,file=fibonacci.elf

> 
> There are two modes:
> 
>   - system emulation (CPU + board and peripherals)
>   - linux-user (CPU but with a Linux syscall interface)
> 
>> I can work with qemu-system-arm, and could not find a way
>> to use qemu-arm.
> 
> If you are installing via your distros package manager you probably want
> a package called qemu-user. You can build the only the user-mode
> packages by issuing --disable-system to the configure script.
> 
> The closest thing to being a "pure" just the CPU is probably a
> standalone usermode binary that uses semihosting calls rather than a
> libc/syscall interface.
> 
>>
>>     Would anyone have any pointers to a documentation or a tutorial
>> using this tool ?
>>
>>     Best regards,
>>
>>         Vincent.
> 
> 
