Received: by 10.223.172.38 with SMTP id v35csp3888043wrc;
        Mon, 18 Sep 2017 08:32:50 -0700 (PDT)
X-Received: by 10.25.225.135 with SMTP id l7mr3049858lfk.81.1505748769981;
        Mon, 18 Sep 2017 08:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505748769; cv=none;
        d=google.com; s=arc-20160816;
        b=RuNO5cW2EERPkg1Hf4X48WHyrEIrFMPwEdfU8VHQS6DlEJF+zRGgpwROgLPgLDHMy9
         em6jEkci6iLrQaSbfbewh2gtWeaPFlOG8DeAHZxy6UpPZuvZrpj1/snaA7vd1uFRYciB
         QG77pNEheIRawwJv8Mf2P73WDQRAxvu/kB5imuBn//fmOA8GHNknoR6MwuUikbyrlzGG
         coc0rEQ+i7Su7pRn8PoTJAJbI8igFZj0frq7XDdkMtXhkhAj8cdjXdynB4TrVzOCUvzG
         4NwOqEUTkcbw+g1RXvAISWofcEalK3/2wI3mpF409F8pIfiMCwBzDonnsKsCMdirX4q0
         GN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=2fRJSWuIfsF/XtEgwjj/BMC6HTtEj+FzevgwnaiWnCc=;
        b=HJhXncAv+FGO5FK2trMwzZXTVvC4F3bId8cHKzncevD7TXa3IBAixGTZY53k+96pT3
         z4YFHcIGeJvwTMwTbNqmNLnlG3eHBEE7A/CIN72FOSWQ74Wx9cES91fdfpfQTiyAfK14
         K0vV/IScEL8YTvBax+I1viGwF+7vWHOgzoTydh4P1i36DxSFUd44g3i7HPiCe4+s2Tm0
         Ze+k/MMaMf43QKhIoFtT+7Hes68/jz324KA3FReS6RMvF7iAx/iWlFw5/j3QKjYrz3lz
         YWaOJuHdChPisps5EZ6yRWA0TBRMunHQ+CeXYa66rewWW8xMNK/5Sw1vUnTt19gOX4nd
         FJsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=C6GHPEwH;
       spf=pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=digetx@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <digetx@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b68sor1590716lfb.109.2017.09.18.08.32.49
        (Google Transport Security);
        Mon, 18 Sep 2017 08:32:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=C6GHPEwH;
       spf=pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=digetx@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2fRJSWuIfsF/XtEgwjj/BMC6HTtEj+FzevgwnaiWnCc=;
        b=C6GHPEwHQMV0MblkEFDp7F/J0wSFvRlrvJZzrWC0axYbSTxAmV3nFsvmhTAN0rNtnj
         VT5GNTKOv0I8GCC+y3zMeQsxfh5UzgBrQ1K0dD9zJ/OCWGX7Zn5mWd2nAikjs8QQRFn1
         sTgyy1IB7c4boEV9hRkTgs/FgskjrF56w1AdouD+pNF4lr5aQ+bSCSNZtmDy+ENnEEvN
         mhB2i891q3DI+tCo08+cJh4bZvL/HUTj4RaRGV/81AOFql6Zfg8iPX5bknn9BHKpIsGK
         5Fe67HT/Cj7MymiWUQtkaftOjOdNFgEt0m0RBvEHBCvlobms9CX+LCFPBlZHuULEKeiu
         WiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2fRJSWuIfsF/XtEgwjj/BMC6HTtEj+FzevgwnaiWnCc=;
        b=NNXNVs0LF1aujeBMkFaT3vy08EB/sd6SF9EaTs9drNyDOF1GRidvNBGThrGAT+wR5/
         X9ltK7Pip68QmOzt8fPHB18h877axIfvp0p/e6uvKXP5gYRlmBNr4bFhm6nrRSCdOI90
         nukN8INNHc8txlilb3aSzcW1G12r0aMuS2eW/2fGJ1QIIrzCzcGol3s47fXj/88cFCsS
         3a6wDGjLiQH0asfvepge2si1BQgpPN5KSxTG9RgeP/0N5APkbbLxFSEk6Qr12k19ILyM
         Pswbbhwv0DjjWSdSYacb8xvT9BmcS23bnn9KW0fF1ekcsPW4fxcSPKnG2uXZJBXuRl9R
         Ua4Q==
X-Gm-Message-State: AHPjjUirBYiBEAgLRG83yfJwR+vCAGDv8AYBiY8TKpvC0AINJfB/bqz+
	cwlBZFNDCuVBuV2A6r4=
X-Google-Smtp-Source: AOwi7QABJJNcI6886/2zMoLo/vz3O4IcPdeG8tkOWhmqUVPBQIlmJJ0aIXiXOyYVGJDN1uIM9Rxjzg==
X-Received: by 10.25.41.67 with SMTP id p64mr3821454lfp.200.1505748769348;
        Mon, 18 Sep 2017 08:32:49 -0700 (PDT)
Return-Path: <digetx@gmail.com>
Received: from [192.168.1.145] (ppp109-252-91-7.pppoe.spdop.ru. [109.252.91.7])
        by smtp.googlemail.com with ESMTPSA id t84sm1499795lfi.21.2017.09.18.08.32.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Sep 2017 08:32:48 -0700 (PDT)
Subject: Re: [PULL 22/24] target-arm: ensure all cross vCPUs TLB flushes
 complete
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, "open list:ARM" <qemu-arm@nongnu.org>,
 qemu-devel@nongnu.org
References: <20170224112109.3147-1-alex.bennee@linaro.org>
 <20170224112109.3147-23-alex.bennee@linaro.org>
 <7468f944-914c-de89-66fb-f8ad49eb59c1@gmail.com> <87poapbgt0.fsf@linaro.org>
 <e511a895-b1e3-150f-6555-12ba1fa16273@gmail.com> <87a81sjp15.fsf@linaro.org>
 <70057789-ab76-1150-ab2e-b5a3239a0209@gmail.com> <87d16ods3s.fsf@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <17f6550a-cb60-e15b-1723-b3a5ce7a43a1@gmail.com>
Date: Mon, 18 Sep 2017 18:32:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <87d16ods3s.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 8PCg23t28l99

On 18.09.2017 17:00, Alex Bennée wrote:
> 
> Dmitry Osipenko <digetx@gmail.com> writes:
> 
>> On 18.09.2017 13:10, Alex Bennée wrote:
>>>
>>> Dmitry Osipenko <digetx@gmail.com> writes:
>>>
>>>> On 17.09.2017 16:22, Alex Bennée wrote:
>>>>>
>>>>> Dmitry Osipenko <digetx@gmail.com> writes:
>>>>>
>>>>>> On 24.02.2017 14:21, Alex Bennée wrote:
>>>>>>> Previously flushes on other vCPUs would only get serviced when they
>>>>>>> exited their TranslationBlocks. While this isn't overly problematic it
>>>>>>> violates the semantics of TLB flush from the point of view of source
>>>>>>> vCPU.
>>>>>>>
>>>>>>> To solve this we call the cputlb *_all_cpus_synced() functions to do
>>>>>>> the flushes which ensures all flushes are completed by the time the
>>>>>>> vCPU next schedules its own work. As the TLB instructions are modelled
>>>>>>> as CP writes the TB ends at this point meaning cpu->exit_request will
>>>>>>> be checked before the next instruction is executed.
>>>>>>>
>>>>>>> Deferring the work until the architectural sync point is a possible
>>>>>>> future optimisation.
>>>>>>>
>>>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>>>>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>>>>> ---
>>>>>>>  target/arm/helper.c | 165 ++++++++++++++++++++++------------------------------
>>>>>>>  1 file changed, 69 insertions(+), 96 deletions(-)
>>>>>>>
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> I have an issue with Linux kernel stopping to boot on a SMP 32bit ARM (haven't
>>>>>> checked 64bit) in a single-threaded TCG mode. Kernel reaches point where it
>>>>>> should mount rootfs over NFS and vCPUs stop. This issue is reproducible with any
>>>>>> 32bit ARM machine type. Kernel boots fine with a MTTCG accel, only
>>>>>> single-threaded TCG is affected. Git bisection lead to this patch, any
>>>>>> ideas?
>>>>>
>>>>> It shouldn't cause a problem but can you obtain a backtrace of the
>>>>> system when hung?
>>>>>
>>>>
>>>> Actually, it looks like TCG enters infinite loop. Do you mean backtrace of QEMU
>>>> by 'backtrace of the system'? If so, here it is:
>>>>
>>>> Thread 4 (Thread 0x7ffa37f10700 (LWP 20716)):
>>>>
>>>> #0  0x00007ffa601888bd in poll () at ../sysdeps/unix/syscall-template.S:84
>>>>
>>>> #1  0x00007ffa5e3aa561 in poll (__timeout=-1, __nfds=2, __fds=0x7ffa30006dc0) at
>>>> /usr/include/bits/poll2.h:46
>>>> #2  poll_func (ufds=0x7ffa30006dc0, nfds=2, timeout=-1, userdata=0x557bd603eae0)
>>>> at
>>>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/thread-mainloop.c:69
>>>> #3  0x00007ffa5e39bbb1 in pa_mainloop_poll (m=m@entry=0x557bd60401f0) at
>>>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/mainloop.c:844
>>>> #4  0x00007ffa5e39c24e in pa_mainloop_iterate (m=0x557bd60401f0,
>>>> block=<optimized out>, retval=0x0) at
>>>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/mainloop.c:926
>>>> #5  0x00007ffa5e39c300 in pa_mainloop_run (m=0x557bd60401f0,
>>>> retval=retval@entry=0x0) at
>>>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/mainloop.c:944
>>>>
>>>> #6  0x00007ffa5e3aa4a9 in thread (userdata=0x557bd60400f0) at
>>>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/thread-mainloop.c:100
>>>>
>>>> #7  0x00007ffa599eea38 in internal_thread_func (userdata=0x557bd603e090) at
>>>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulsecore/thread-posix.c:81
>>>>
>>>> #8  0x00007ffa60453657 in start_thread (arg=0x7ffa37f10700) at
>>>> pthread_create.c:456
>>>>
>>>> #9  0x00007ffa60193c5f in clone () at
>>>> ../sysdeps/unix/sysv/linux/x86_64/clone.S:97
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> Thread 3 (Thread 0x7ffa4adff700 (LWP 20715)):
>>>>
>>>>
>>>> #0  0x00007ffa53e51caf in code_gen_buffer ()
>>>>
>>>
>>> Well it's not locked up in servicing any flush tasks as it's executing
>>> code. Maybe the guest code is spinning on something?
>>>
>>
>> Indeed, I should have used 'exec' instead of 'in_asm'.
>>
>>> In the monitor:
>>>
>>>   info registers
>>>
>>> Will show you where things are, see if the ip is moving each time. Also
>>> you can do a disassemble dump from there to see what code it is stuck
>>> on.
>>>
>>
>> I've attached with GDB to QEMU to see where it got stuck. Turned out it is
>> caused by CONFIG_STRICT_KERNEL_RWX=y of the Linux kernel. Upon boot completion
>> kernel changes memory permissions and that changing is executed on a dedicated
>> CPU, while other CPUs are 'stopped' in a busy loop.
>>
>> This patch just introduced a noticeable performance regression for a
>> single-threaded TCG, which is probably fine since MTTCG is the default now.
>> Thank you very much for the suggestions and all your work on MTTCG!
> 
> Hmm well it would be nice to know the exact mechanism for that failure.
> If we just end up with a very long list of tasks in
> cpu->queued_work_first then I guess that explains it but it would be
> nice to quantify the problem.
> 
> I had trouble seeing where this loop is in the kernel code, got a pointer?
> 
The memory permissions changing starts here:

http://elixir.free-electrons.com/linux/v4.14-rc1/source/arch/arm/mm/init.c#L739

The busy loop is here:

http://elixir.free-electrons.com/linux/v4.14-rc1/source/kernel/stop_machine.c#L195

Interestingly, I tried to attach to a 'hanged' QEMU another time and got into
other code. That code has the same pattern, one CPU flushes cache a lot in
shmem_rename2()->need_update()->memchr_inv() and the other is executing something.

So seems busy loop isn't the problem, it's just the TLB flushing is very-very
expensive in TCG. On the other hand I don't see such a problem with MTTCG, so
not sure what's going on with a single-threaded TCG.

-- 
Dmitry
