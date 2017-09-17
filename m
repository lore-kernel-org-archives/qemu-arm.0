Received: by 10.223.172.38 with SMTP id v35csp2806948wrc;
        Sun, 17 Sep 2017 06:46:44 -0700 (PDT)
X-Received: by 10.46.20.21 with SMTP id u21mr8008998ljd.87.1505656004137;
        Sun, 17 Sep 2017 06:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505656004; cv=none;
        d=google.com; s=arc-20160816;
        b=pHFA254CfpL2qJ7a19JlfApQlR8UzV4hF29BINUInVTsJ+a++ak6vd6wNMqYv2loAp
         TUD0sNf43qkN4ChMffAjbSimCxiao23WtjN9bsDRZOGCY0Mpub52AHCmmqumhnmmt+xt
         KHAEY4+Mx1NZ3kMmjt4wGmIyoMpz7xmZQu/N74oM5JVS0Ixsis1bj3xMH52yRGYvJ6ur
         kLZ6kuMa0lgXnsc5SYKbuWxhWSTBqDUraB7gTRQbFAFn6zJfRe4bnOZNlNgSMOAAKvgU
         io1V2THV2xre8Z2I541hGiVE4K0mXGpgPtlwrFfUqhFvKxLFi9pRWXQxdgLUjMfR0Ub6
         2oVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=yugkV6rg37xYJrr9yMFlYU7NQlre0qyZjIn+EnzVpcg=;
        b=T67OxUbJ6O7tNm5Wc3PSsscuOwz07wFOJurVCoPPl6JfmmWnc/GmCSsqNkmtmEI2rH
         SITKgwGkXQNrApjWIonW9EwdDFgFNvgOJw7ZHgBJcBVswpYLTlSpZsTIkbqv+2NLbedp
         g5BJ0vSakVuq+cpLyEV9iRjG+wyI8LYnJ2YL4pD2LBPn6EY8vWEWagAfm5lE9czeq+7f
         gIkYxDZC9gh3/jJFXisY2oViNMsIus+Dbd1x4UqEdszH8l2jPMMRBhhv5J9ifPxE58aj
         eZbMbCIWzgkHCv8lp7NgLZEMr+Mf1/4ub1+ZRsdIu3aeRyI5DbcbgVgqu+wJDGN/PJFa
         10nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rOPpg1kT;
       spf=pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=digetx@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <digetx@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l12sor1079698lfl.64.2017.09.17.06.46.44
        (Google Transport Security);
        Sun, 17 Sep 2017 06:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rOPpg1kT;
       spf=pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=digetx@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yugkV6rg37xYJrr9yMFlYU7NQlre0qyZjIn+EnzVpcg=;
        b=rOPpg1kTIe+55w3LCvOlICiqRiC3q0x/BSulL747H4K5x8ZBeu281YAFZUzgv+96RS
         xMFbRUxOtcB1zBh8rFExPji7Id6qJyAZWheGr2SWeyl4Y9x7uq4oTkMnIvQHlc66fU0d
         /m6Cef6U8pZcS1qU9trJ06Bu0+osIKMS6RgyYum5crN7/fPszSrBTiOBdlt7moT+RE2v
         wXvJigaLiEoZ1xvJLgB7NxdxGlMHxKBb77bVjUG4/uhOlHjzEOBFn5p0SQ+6YOYJsi3M
         z1CMWCPNNHQvvo47qG5X961ymNZNPZS+P2Tq+L94OcY5qtq4W/HXlHLzjoKbSa7Xsec5
         z/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yugkV6rg37xYJrr9yMFlYU7NQlre0qyZjIn+EnzVpcg=;
        b=bPTpOH8ONq97kpEbHhbZyjCsbJmIey6A3rJlh+2CZFWX7q1eCKqtyLky/jHfyrKaay
         NVTy6NgSfb9NaFbbkuMqa76jkhzSqF9lfNssLbN9QCrX5NpQEMisjCA5cqjZC6jed4F2
         H8z+9+JXeMTidYAPwarcqOO7ZzW+kKOyoxAy+1go3D9GQue4m6EL25ogfJjRpwyF9Hkq
         qVdBo360jUvNYMyoeMVsFdZXKUHpS0FEWJFFZN7hew2ThtR55HLRpg0bAk5dQQMLAY0i
         pvi7P1A6F269PQi6ayWQi8AfNOY98PMQXslGZlJ5AA25S8EQqbCFMqPSmjXgI4RcezBk
         MjyQ==
X-Gm-Message-State: AHPjjUijjmaSM1IzfekZAutWXX3Oktup2fY97UFIECEv7DO//CUphyp2
	09kUhpW/XihqLC4uQyU=
X-Google-Smtp-Source: AOwi7QCXFmvtVtvOeOK3MGb6CrLgP+XhBd0lbgC4VK0WyaxSo0agHuejHxT3AzXTgR7gGCN8iUCWiA==
X-Received: by 10.25.142.215 with SMTP id a84mr2832323lfl.25.1505656003788;
        Sun, 17 Sep 2017 06:46:43 -0700 (PDT)
Return-Path: <digetx@gmail.com>
Received: from [192.168.1.145] (ppp109-252-91-7.pppoe.spdop.ru. [109.252.91.7])
        by smtp.googlemail.com with ESMTPSA id x20sm1055306lfd.59.2017.09.17.06.46.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Sep 2017 06:46:42 -0700 (PDT)
Subject: Re: [PULL 22/24] target-arm: ensure all cross vCPUs TLB flushes
 complete
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, "open list:ARM" <qemu-arm@nongnu.org>,
 qemu-devel@nongnu.org
References: <20170224112109.3147-1-alex.bennee@linaro.org>
 <20170224112109.3147-23-alex.bennee@linaro.org>
 <7468f944-914c-de89-66fb-f8ad49eb59c1@gmail.com> <87poapbgt0.fsf@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e511a895-b1e3-150f-6555-12ba1fa16273@gmail.com>
Date: Sun, 17 Sep 2017 16:46:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <87poapbgt0.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: PkTg51IRangU

On 17.09.2017 16:22, Alex Bennée wrote:
> 
> Dmitry Osipenko <digetx@gmail.com> writes:
> 
>> On 24.02.2017 14:21, Alex Bennée wrote:
>>> Previously flushes on other vCPUs would only get serviced when they
>>> exited their TranslationBlocks. While this isn't overly problematic it
>>> violates the semantics of TLB flush from the point of view of source
>>> vCPU.
>>>
>>> To solve this we call the cputlb *_all_cpus_synced() functions to do
>>> the flushes which ensures all flushes are completed by the time the
>>> vCPU next schedules its own work. As the TLB instructions are modelled
>>> as CP writes the TB ends at this point meaning cpu->exit_request will
>>> be checked before the next instruction is executed.
>>>
>>> Deferring the work until the architectural sync point is a possible
>>> future optimisation.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  target/arm/helper.c | 165 ++++++++++++++++++++++------------------------------
>>>  1 file changed, 69 insertions(+), 96 deletions(-)
>>>
>>
>> Hello,
>>
>> I have an issue with Linux kernel stopping to boot on a SMP 32bit ARM (haven't
>> checked 64bit) in a single-threaded TCG mode. Kernel reaches point where it
>> should mount rootfs over NFS and vCPUs stop. This issue is reproducible with any
>> 32bit ARM machine type. Kernel boots fine with a MTTCG accel, only
>> single-threaded TCG is affected. Git bisection lead to this patch, any
>> ideas?
> 
> It shouldn't cause a problem but can you obtain a backtrace of the
> system when hung?
> 

Actually, it looks like TCG enters infinite loop. Do you mean backtrace of QEMU
by 'backtrace of the system'? If so, here it is:

Thread 4 (Thread 0x7ffa37f10700 (LWP 20716)):

#0  0x00007ffa601888bd in poll () at ../sysdeps/unix/syscall-template.S:84

#1  0x00007ffa5e3aa561 in poll (__timeout=-1, __nfds=2, __fds=0x7ffa30006dc0) at
/usr/include/bits/poll2.h:46
#2  poll_func (ufds=0x7ffa30006dc0, nfds=2, timeout=-1, userdata=0x557bd603eae0)
at
/var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/thread-mainloop.c:69
#3  0x00007ffa5e39bbb1 in pa_mainloop_poll (m=m@entry=0x557bd60401f0) at
/var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/mainloop.c:844
#4  0x00007ffa5e39c24e in pa_mainloop_iterate (m=0x557bd60401f0,
block=<optimized out>, retval=0x0) at
/var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/mainloop.c:926
#5  0x00007ffa5e39c300 in pa_mainloop_run (m=0x557bd60401f0,
retval=retval@entry=0x0) at
/var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/mainloop.c:944

#6  0x00007ffa5e3aa4a9 in thread (userdata=0x557bd60400f0) at
/var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/thread-mainloop.c:100

#7  0x00007ffa599eea38 in internal_thread_func (userdata=0x557bd603e090) at
/var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulsecore/thread-posix.c:81

#8  0x00007ffa60453657 in start_thread (arg=0x7ffa37f10700) at
pthread_create.c:456

#9  0x00007ffa60193c5f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:97





Thread 3 (Thread 0x7ffa4adff700 (LWP 20715)):


#0  0x00007ffa53e51caf in code_gen_buffer ()


#1  0x0000557bd2fa7f17 in cpu_tb_exec (cpu=0x557bd56160a0, itb=0x7ffa53e51b80
<code_gen_buffer+15481686>) at /home/dima/vl/qemu-tests/accel/tcg/cpu-exec.c:166

#2  0x0000557bd2fa8e0f in cpu_loop_exec_tb (cpu=0x557bd56160a0,
tb=0x7ffa53e51b80 <code_gen_buffer+15481686>, last_tb=0x7ffa4adfea68,
tb_exit=0x7ffa4adfea64) at /home/dima/vl/qemu-tests/accel/tcg/cpu-exec.c:613
#3  0x0000557bd2fa90ff in cpu_exec (cpu=0x557bd56160a0) at
/home/dima/vl/qemu-tests/accel/tcg/cpu-exec.c:711

#4  0x0000557bd2f6dcba in tcg_cpu_exec (cpu=0x557bd56160a0) at
/home/dima/vl/qemu-tests/cpus.c:1270

#5  0x0000557bd2f6dee1 in qemu_tcg_rr_cpu_thread_fn (arg=0x557bd5598e20) at
/home/dima/vl/qemu-tests/cpus.c:1365

#6  0x00007ffa60453657 in start_thread (arg=0x7ffa4adff700) at
pthread_create.c:456

#7  0x00007ffa60193c5f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:97







Thread 2 (Thread 0x7ffa561bf700 (LWP 20714)):



#0  syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38



#1  0x0000557bd34e1eaa in qemu_futex_wait (f=0x557bd4031798
<rcu_call_ready_event>, val=4294967295) at
/home/dima/vl/qemu-tests/include/qemu/futex.h:26


#2  0x0000557bd34e2071 in qemu_event_wait (ev=0x557bd4031798
<rcu_call_ready_event>) at util/qemu-thread-posix.c:442


#3  0x0000557bd34f9b1f in call_rcu_thread (opaque=0x0) at util/rcu.c:249



#4  0x00007ffa60453657 in start_thread (arg=0x7ffa561bf700) at
pthread_create.c:456


#5  0x00007ffa60193c5f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:97







Thread 1 (Thread 0x7ffa67502600 (LWP 20713)):



#0  0x00007ffa601889ab in __GI_ppoll (fds=0x557bd5bbf160, nfds=11,
timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:39


#1  0x0000557bd34dc460 in qemu_poll_ns (fds=0x557bd5bbf160, nfds=11,
timeout=29841115) at util/qemu-timer.c:334


#2  0x0000557bd34dd488 in os_host_main_loop_wait (timeout=29841115) at
util/main-loop.c:255


#3  0x0000557bd34dd557 in main_loop_wait (nonblocking=0) at util/main-loop.c:515



#4  0x0000557bd3120f0e in main_loop () at vl.c:1999



#5  0x0000557bd3128d4a in main (argc=17, argv=0x7ffe7de2a248,
envp=0x7ffe7de2a2d8) at vl.c:4877

>>
>> Example:
>>
>> qemu-system-arm -M vexpress-a9 -smp cpus=2 -accel accel=tcg,thread=single
>> -kernel arch/arm/boot/zImage -dtb arch/arm/boot/dts/vexpress-v2p-ca9.dtb -serial
>> stdio -net nic,model=lan9118 -net user -d in_asm,out_asm -D /tmp/qemulog
>>
>> Last TB from the log:
>> ----------------
>> IN:
>> 0xc011a450:  ee080f73      mcr	15, 0, r0, cr8, cr3, {3}
>>
>> OUT: [size=68]
>> 0x7f32d8b93f80:  mov    -0x18(%r14),%ebp
>> 0x7f32d8b93f84:  test   %ebp,%ebp
>> 0x7f32d8b93f86:  jne    0x7f32d8b93fb8
>> 0x7f32d8b93f8c:  mov    %r14,%rdi
>> 0x7f32d8b93f8f:  mov    $0x5620f2aea5d0,%rsi
>> 0x7f32d8b93f99:  mov    (%r14),%edx
>> 0x7f32d8b93f9c:  mov    $0x5620f18107ca,%r10
>> 0x7f32d8b93fa6:  callq  *%r10
>> 0x7f32d8b93fa9:  movl   $0xc011a454,0x3c(%r14)
>> 0x7f32d8b93fb1:  xor    %eax,%eax
>> 0x7f32d8b93fb3:  jmpq   0x7f32d7a4e016
>> 0x7f32d8b93fb8:  lea    -0x14aa07c(%rip),%rax        # 0x7f32d76e9f43
>> 0x7f32d8b93fbf:  jmpq   0x7f32d7a4e016
-- 
Dmitry
