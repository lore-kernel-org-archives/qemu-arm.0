Received: by 10.28.71.155 with SMTP id m27csp1487017wmi;
        Wed, 11 Apr 2018 21:53:44 -0700 (PDT)
X-Received: by 10.46.153.13 with SMTP id v13mr4425212lji.145.1523508823930;
        Wed, 11 Apr 2018 21:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523508823; cv=none;
        d=google.com; s=arc-20160816;
        b=zOxMUt3S0mvuu+ZXLpOCAx0LWsLEL6h0povg7UI4nwcEhu6mRoGXf2wzCtCQCCWe6A
         4ZK+/aEB4MMj9pnqO0qp6RXOxRzeMFt4PGllJ4vmQFNNV47GIlZ3Xmz4E7PPnmd+uK0M
         ZUrnyhgr31TxMgbpjRyVtzQJRH6hwRxvZsZw0HVyK05Iy2TCzKTAvYaryAVxjfFiqVlY
         GC92/IzOcfxgy3TbQe/FRA2ga/PwZraYAuNTaanr7SbwuDbTvY3FNbr/kXKqQkg7jXjv
         XNCHgbLZYPKIiJC9ufZfavEp572l9vS5YvRGwQct7f5hHgbGODwYOxEAnNS7ia2dW+3h
         wVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Md50rOukI8w6WtPr22LSXlLXJ2mHETuX7WC9yf0gOW0=;
        b=g8IajdSbOgpas/kFzv1lvJ+yHYw7786YUErqBDe1qCI1mEKdOGjSU+8zPKxDBEAiAG
         eEuwFeibp1NXXgJgeSVMT9oNENN1T1nJn6+oAgGXvtIoyO53o5Yun9p9TaB6v+AyzrOt
         PSRFnZ790N4sFngUw5UpNgYGpbC+KA8alYA3Z3FQJ/hmfxbVf6KUzKOLuYCn3yUgMrAe
         jQEhsNdBeZoDPKQdGDa+w5bfDy1kWsDSHMixBp97xd1xmMPio/g4c3ZgGyJQ0f+9ZOJS
         j0OVCQA2Wg7LkY74zMoJ7Ad1J5W2yPWZ6s41Pc/cqOfeT7D5Qyh5hxDiGVpfD8z6XUmk
         VMmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XP6npEf3;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <ajaygargnsit@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n74sor742077lje.97.2018.04.11.21.53.43
        (Google Transport Security);
        Wed, 11 Apr 2018 21:53:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XP6npEf3;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Md50rOukI8w6WtPr22LSXlLXJ2mHETuX7WC9yf0gOW0=;
        b=XP6npEf3n41oPXnSD1yCk7wmFXU0iv/418SoA+MRgurA+4ckFZim/YhfMyNQKIgOwU
         r5XIRwOOC2XDcP9Y9QPJP/wrqRuFhNaoaxzKebHguUPpbWbH4xB4zkhBQmZhZJdxQMzZ
         i5emkC+e403X33Z9AuyubPKpEZIhxKMyquqTfHNz7pYu0Aaqe/VWWypHsRfisHUfK/Fn
         zAu7blnxmdWBjcaVkndVb2LqWqImayMGdyl4gWHvXj/sg0mOxbNlKLKfIvxG9XOReX/M
         wBnib0sg07F/vX/E0UgXLKBQArAldOf99gbqULuc84chq9+d/YFUOXZdNjznSQZ8bkH1
         YH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Md50rOukI8w6WtPr22LSXlLXJ2mHETuX7WC9yf0gOW0=;
        b=eCFEaJ9xoZ/+fqB/MHeMZ/BbQgY3BgL3VXqsR+PZBkVk9IUT71jYBBSwYCpK7kaQyI
         P1BQfC/oaaspOmG8b3i71aHR+zL+hJjKelS+RQVXoGtIucokg4/QoLOu3cp0Doy8+zvF
         ll99vATZwlppb7GaIiwAMxHzbhc499l9VyNX8zA/6TRmpQrnLxl9kbbTE35yVc0/LMOy
         vYl69i5ca1LjO7nxiqfmfWgq7q9rYS0B09OZB9p+rHrfciVRxSOWQWlEe2ybFfOokmdw
         yi15hCROs40SDT6AfICBlu7s+gcC+ADyjNJavgGnL4n3Zd1B0IIsHOMDjC552ktDwkqk
         hEuA==
X-Gm-Message-State: ALQs6tAah8soe6SU3Y12XlB6kbT7ZL/iL3eicZKUeadQA4rhuPjglsB/
	eG2Jbrd/o2AZW7qPATgyS5BLGcXUDprNjarrTxAEnQ==
X-Google-Smtp-Source: AIpwx48T0SUHVvGUJnG6uI+jGAWmkmIMIS4Vs44lVAN/8c/QfOn3VBFil4uOCf5ngJTI+hyrwDG/zre0VG5HiST0HJU=
X-Received: by 10.46.144.153 with SMTP id l25mr4858589ljg.55.1523508823251;
 Wed, 11 Apr 2018 21:53:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c64a:0:0:0:0:0 with HTTP; Wed, 11 Apr 2018 21:53:42
 -0700 (PDT)
In-Reply-To: <CAHP4M8V_NBFS9T_+TQzAPgw56n9THk-phqUiLuRw6DJRn+UQAw@mail.gmail.com>
References: <CAHP4M8VnuS5KijfVw9eDz41KPwaT4rJ+4VEU==EbBgdwgFKJhA@mail.gmail.com>
 <87efjov999.fsf@linaro.org> <CAHP4M8W-WuBmJUdb6LGR1t3tPayrnaS+b1ZZ1zew71aM==-imA@mail.gmail.com>
 <87d0z8v78e.fsf@linaro.org> <CAHP4M8VSzm4L6oS06J-e93FwjuHM=weJf2MegCaDNH8MPbsqgA@mail.gmail.com>
 <CAFEAcA91iNyUnahri9EdL7Th1Q9v44765z0OJexxMrNUD_DXEQ@mail.gmail.com>
 <CAHP4M8ViS=O4R+sMmR=CmkbgQtwd8RHGxLwNb5m_aMS_M++f6A@mail.gmail.com>
 <CAFEAcA8xG_GrVL5zgZqN26OQGj0UHWFNZ9xWEmHJyaiUFZLH8Q@mail.gmail.com>
 <CAHP4M8WEuR5JJTV_KggwJok0Pzbu8=4BifLuFOjhv3T9hfjUUg@mail.gmail.com>
 <CAHP4M8UESYxeJOd5Y+Hj1K26QUb2D1UJJoBTh9SYCsvuwBP95w@mail.gmail.com> <CAHP4M8V_NBFS9T_+TQzAPgw56n9THk-phqUiLuRw6DJRn+UQAw@mail.gmail.com>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Thu, 12 Apr 2018 10:23:42 +0530
Message-ID: <CAHP4M8VYmpm2paarNJjMtiVtkZk5imZixHHmoqZmggdeyRRW3w@mail.gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] Crash when running hello-world unikernel
 for ARM
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	rumpkernel-users@freelists.org, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: TRHmFcnTIdaP

Is "integratorcp" the same board that rumprun is being built for
(https://github.com/rumpkernel/rumprun/tree/master/platform/hw/arch/arm/integrator)?

On Thu, Apr 12, 2018 at 9:56 AM, Ajay Garg <ajaygargnsit@gmail.com> wrote:
> Actually just realised that qemu does support integratorcp as one of
> the supported-boards.
>
> Unfortunately, when I use
>           qemu-system-arm -machine integratorcp -nographic -kernel helloer.bin
> the shell just hangs :(
>
>
> Following are the details when run through gdb :
>
> ##########################################################################
> GNU gdb (Debian 7.7.1+dfsg-5) 7.7.1
> Copyright (C) 2014 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
> and "show warranty" for details.
> This GDB was configured as "arm-linux-gnueabihf".
> Type "show configuration" for configuration details.
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>.
> Find the GDB manual and other documentation resources online at:
> <http://www.gnu.org/software/gdb/documentation/>.
> For help, type "help".
> Type "apropos word" to search for commands related to "word"...
> Reading symbols from qemu-system-arm...(no debugging symbols found)...done.
> (gdb) r
> Starting program: /usr/bin/qemu-system-arm -machine integratorcp
> -nographic -kernel helloer.bin
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/arm-linux-gnueabihf/libthread_db.so.1".
> [New Thread 0xb388f290 (LWP 596)]
>
> Program received signal SIGUSR1, User defined signal 1.
> [Switching to Thread 0xb388f290 (LWP 596)]
> memset () at ../ports/sysdeps/arm/memset.S:50
> 50    ../ports/sysdeps/arm/memset.S: No such file or directory.
> (gdb) bt
> #0  memset () at ../ports/sysdeps/arm/memset.S:50
> #1  0xb65e1c6c in ?? () from /lib/arm-linux-gnueabihf/libglib-2.0.so.0
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
> (gdb)
> ##########################################################################
>
> On Wed, Apr 11, 2018 at 12:49 PM, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>> Hi All.
>>
>> Just wondering if there is something specific that needs to changed at
>> https://github.com/rumpkernel/rumprun/tree/master/platform/hw/arch/arm/integrator
>> in order to get a hello-world app run on "virt" machine?
>>
>> If so, I would request the rumprun-guys to kindly throw in some light,
>> on what needs to be done in order to have something run on a "virt"
>> machine in qemu-context.
>>
>>
>> Thanks and Regards,
>> Ajay
>>
>> On Tue, Apr 10, 2018 at 3:49 PM, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>>> Thanks Peter .. my sincere gratitude.
>>> You pin-pointed the real issue ..
>>>
>>>
>>>
>>> On Tue, Apr 10, 2018 at 2:50 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> On 10 April 2018 at 09:16, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>>>>> On Tue, Apr 10, 2018 at 1:08 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>>> What hardware (what CPU, board, etc) is this "rumprun" software
>>>>>> expecting to run on?
>>>>>
>>>>> Yep, just to ensure that there are no cross-compiling issues, I am
>>>>> building rumprun on the pseudo-real hardware itself.
>>>>> In our case, the pseudo-real hardware are :
>>>>>
>>>>> a)
>>>>> An ARM32 "virt" hardware/machine in a qemu environment
>>>>> (https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/)
>>>>>
>>>>> Once I start  this machine, all environment is arm32, and I compile
>>>>> rumprun within this environemnt without any cross-compiling.
>>>>>
>>>>> b)
>>>>> A beaglebone-green-wireless.
>>>>> This is a arm32 machine bottoms-up, so no question of cross-compiling
>>>>> whatsoever here :)
>>>>>
>>>>> In both cases, I then use qemu-system-arm (on the "virt" machine, and
>>>>> beaglebone-green-wireless itself).
>>>>
>>>> That's telling me what setups you're trying to compile in,
>>>> which doesn't correspond necessarily to what the guest
>>>> OS is built to run on.
>>>>
>>>>> One query : It is apparent that there is nested qemu-virtualization in
>>>>> step a), could that be an issue?
>>>>
>>>> Why are you running this in a nested setup? I don't understand
>>>> the purpose of doing that. It would be simpler and faster to
>>>> just run the guest on a QEMU running in your native host system.
>>>>
>>>> Assuming this is the source for the guest you're trying to run:
>>>>
>>>> https://github.com/rumpkernel/rumprun/tree/master/platform/hw/arch
>>>>
>>>> that suggests that the only Arm board it supports is "integrator"
>>>> (which is an absolutely ancient devboard with very little memory,
>>>> no PCI and no virtio support). You need to confirm what Arm hardware
>>>> this 'rumpkernel' is actually intended to run on, and then give QEMU
>>>> the right command line arguments to emulate that hardware. I can't
>>>> really help any further, I'm afraid -- you need somebody who knows
>>>> about this guest OS.
>>>>
>>>> thanks
>>>> -- PMM
>>>
>>>
>>>
>>> --
>>> Regards,
>>> Ajay
>>
>>
>>
>> --
>> Regards,
>> Ajay
>
>
>
> --
> Regards,
> Ajay



-- 
Regards,
Ajay
