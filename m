Received: by 10.223.172.38 with SMTP id v35csp3690117wrc;
        Mon, 18 Sep 2017 05:23:48 -0700 (PDT)
X-Received: by 10.25.115.210 with SMTP id h79mr3410383lfk.203.1505737428225;
        Mon, 18 Sep 2017 05:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505737428; cv=none;
        d=google.com; s=arc-20160816;
        b=mJkTB0LhCorzizvGQ5dyzVIvAhqYEn3nCfkNbn/iPM6KyEr77GiHQAN6sO/jR64aRm
         qg5AjvHNjPdW/kD3258iBOh8CR2PiHckC49gDfqm53OZ0aRXcw8T4RSAgIMbT5GkNeSE
         LWl18X5d+uMnTH50aFlZ7xhMl8fSNCf/9pRvs2QS/B9h12sPbZgrZ9UXSGBKY5jXaTvD
         13I5WwAd6LBnHrQXKs1MP6XSscIzGb6qN5mzsUp09yxDxWlbcUEQx19fkv3oZ1VEAccc
         EGs+M2glqV46CmqnGu8qjIlzA7DvrHrtpwX+liKYs5bypV1iJw4QkIfRK/QyCF8fGWfi
         rXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=7Om74lzAv8GucsQlIg0RZntauq4LPeW5n54mwFSfdFE=;
        b=z4MB74amHFadNsr8PgRcWz5U9ML/5VHgxYR+sYUAYo6v1Ad+I9OVG0Y6brV6JmQP2l
         jGZ6s0BLY8ldfxwXqVDYKUB7OEqfq71xVhBtcSXkbBJVJSihz4EVucDJ2fW5riJN72IG
         NbHl79LFLA0VJxvozixFn5VBrZJWt2uT8OcOXBHVVhsedDpg8eWmI4p1xot7CS9iUGgo
         aGGPuxSIS8mjN/fCrb1wghV2JkF5/k435qTSGg2lDyVEIzOPecCU4tObs4FmnMcApZQR
         7NO2Dj8Vr2v3OunOst9DokHW4ov+ZhvLILVHwb4qisWM+kqcdbr7n4gcFqBVTQ52NrqH
         7s3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=o4ySbc4F;
       spf=pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=digetx@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <digetx@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o14sor1239299lja.28.2017.09.18.05.23.48
        (Google Transport Security);
        Mon, 18 Sep 2017 05:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=o4ySbc4F;
       spf=pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=digetx@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7Om74lzAv8GucsQlIg0RZntauq4LPeW5n54mwFSfdFE=;
        b=o4ySbc4FN/kvPKnbYtUyFDjKuYQzhhrzrVu5YoBOrUNfvJnfEaV9R7/mR4PDJMJkA8
         RMBrhEf4SlHvu97rpw/5nUQKb3yP9cFPInYpNtaHdM9dAG7FIP8ZHggI/3AsYlgq7Hw9
         ON9hgXKNBrtUgxNLVaW+S9QrU7XMYLB8bi90/ZYZMV1GU9oUYxOadXRqM8R5kcKjgAvc
         i43J0H6EEHWQoAc2ELMGklggApqet3ez8yAc01kFNTtArDIsupD+q/W6Ujoud+3lEblh
         qQlkq76OXNtTpnlYLkxUPBS/nYIIKelY/hWN4RUOZH450sgOMwUEKwd+yFzk9u749VCl
         brmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7Om74lzAv8GucsQlIg0RZntauq4LPeW5n54mwFSfdFE=;
        b=Hc5EjlIA03S+vwit9sxszI01XpDlV253efM6e4G6AIV/A4XZkhHZFlk8v6U0k2b0UK
         m7ZXd8sDaah9sR69bC+cDqOAZ2zAOHxj6y7WxVYr0KyR8fvAPLSLUiZ/bpS6gqzCubyg
         OPP7AucY6EKUuTzPLB45mpaeWTwq5yOeSOIzQd/xBk16ZGeW4PaEjuL8/bVRly9cGLz6
         ieFkmFq2aOeVdlI/DDPQrQa300cdOkEwEBtIjdF2J6b3e21QVxxA6R3BLIZgonO+CDRB
         XMLkxs6Z1gyblJrv2YUGYsPrFI66HdN4SZ4M00tgCx35Z+EDz6gcwsKo3PWAEYBjxclD
         Mlfw==
X-Gm-Message-State: AHPjjUif1h0JQ+XR9wFVJH16xTl0Ing+h1nGbREpt59DtWISlu/Z8FjP
	qiVls6g24zk0fhIMpOg=
X-Google-Smtp-Source: AOwi7QDXUMvHY7ShoV3dH0FACK08CzM+1QVDEAmav73m2GHA2QI3V3heyEvJkp7F7rY39Tz4DH5sUw==
X-Received: by 10.46.85.91 with SMTP id j88mr4616319ljb.109.1505737427884;
        Mon, 18 Sep 2017 05:23:47 -0700 (PDT)
Return-Path: <digetx@gmail.com>
Received: from [192.168.1.145] (ppp109-252-91-7.pppoe.spdop.ru. [109.252.91.7])
        by smtp.googlemail.com with ESMTPSA id 19sm1818170ljs.34.2017.09.18.05.23.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Sep 2017 05:23:47 -0700 (PDT)
Subject: Re: [PULL 22/24] target-arm: ensure all cross vCPUs TLB flushes
 complete
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, "open list:ARM" <qemu-arm@nongnu.org>,
 qemu-devel@nongnu.org
References: <20170224112109.3147-1-alex.bennee@linaro.org>
 <20170224112109.3147-23-alex.bennee@linaro.org>
 <7468f944-914c-de89-66fb-f8ad49eb59c1@gmail.com> <87poapbgt0.fsf@linaro.org>
 <e511a895-b1e3-150f-6555-12ba1fa16273@gmail.com> <87a81sjp15.fsf@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <70057789-ab76-1150-ab2e-b5a3239a0209@gmail.com>
Date: Mon, 18 Sep 2017 15:23:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <87a81sjp15.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: EtB6SZC6w29q

On 18.09.2017 13:10, Alex Bennée wrote:
> 
> Dmitry Osipenko <digetx@gmail.com> writes:
> 
>> On 17.09.2017 16:22, Alex Bennée wrote:
>>>
>>> Dmitry Osipenko <digetx@gmail.com> writes:
>>>
>>>> On 24.02.2017 14:21, Alex Bennée wrote:
>>>>> Previously flushes on other vCPUs would only get serviced when they
>>>>> exited their TranslationBlocks. While this isn't overly problematic it
>>>>> violates the semantics of TLB flush from the point of view of source
>>>>> vCPU.
>>>>>
>>>>> To solve this we call the cputlb *_all_cpus_synced() functions to do
>>>>> the flushes which ensures all flushes are completed by the time the
>>>>> vCPU next schedules its own work. As the TLB instructions are modelled
>>>>> as CP writes the TB ends at this point meaning cpu->exit_request will
>>>>> be checked before the next instruction is executed.
>>>>>
>>>>> Deferring the work until the architectural sync point is a possible
>>>>> future optimisation.
>>>>>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>>> ---
>>>>>  target/arm/helper.c | 165 ++++++++++++++++++++++------------------------------
>>>>>  1 file changed, 69 insertions(+), 96 deletions(-)
>>>>>
>>>>
>>>> Hello,
>>>>
>>>> I have an issue with Linux kernel stopping to boot on a SMP 32bit ARM (haven't
>>>> checked 64bit) in a single-threaded TCG mode. Kernel reaches point where it
>>>> should mount rootfs over NFS and vCPUs stop. This issue is reproducible with any
>>>> 32bit ARM machine type. Kernel boots fine with a MTTCG accel, only
>>>> single-threaded TCG is affected. Git bisection lead to this patch, any
>>>> ideas?
>>>
>>> It shouldn't cause a problem but can you obtain a backtrace of the
>>> system when hung?
>>>
>>
>> Actually, it looks like TCG enters infinite loop. Do you mean backtrace of QEMU
>> by 'backtrace of the system'? If so, here it is:
>>
>> Thread 4 (Thread 0x7ffa37f10700 (LWP 20716)):
>>
>> #0  0x00007ffa601888bd in poll () at ../sysdeps/unix/syscall-template.S:84
>>
>> #1  0x00007ffa5e3aa561 in poll (__timeout=-1, __nfds=2, __fds=0x7ffa30006dc0) at
>> /usr/include/bits/poll2.h:46
>> #2  poll_func (ufds=0x7ffa30006dc0, nfds=2, timeout=-1, userdata=0x557bd603eae0)
>> at
>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/thread-mainloop.c:69
>> #3  0x00007ffa5e39bbb1 in pa_mainloop_poll (m=m@entry=0x557bd60401f0) at
>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/mainloop.c:844
>> #4  0x00007ffa5e39c24e in pa_mainloop_iterate (m=0x557bd60401f0,
>> block=<optimized out>, retval=0x0) at
>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/mainloop.c:926
>> #5  0x00007ffa5e39c300 in pa_mainloop_run (m=0x557bd60401f0,
>> retval=retval@entry=0x0) at
>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/mainloop.c:944
>>
>> #6  0x00007ffa5e3aa4a9 in thread (userdata=0x557bd60400f0) at
>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulse/thread-mainloop.c:100
>>
>> #7  0x00007ffa599eea38 in internal_thread_func (userdata=0x557bd603e090) at
>> /var/tmp/portage/media-sound/pulseaudio-10.0/work/pulseaudio-10.0/src/pulsecore/thread-posix.c:81
>>
>> #8  0x00007ffa60453657 in start_thread (arg=0x7ffa37f10700) at
>> pthread_create.c:456
>>
>> #9  0x00007ffa60193c5f in clone () at
>> ../sysdeps/unix/sysv/linux/x86_64/clone.S:97
>>
>>
>>
>>
>>
>> Thread 3 (Thread 0x7ffa4adff700 (LWP 20715)):
>>
>>
>> #0  0x00007ffa53e51caf in code_gen_buffer ()
>>
> 
> Well it's not locked up in servicing any flush tasks as it's executing
> code. Maybe the guest code is spinning on something?
> 

Indeed, I should have used 'exec' instead of 'in_asm'.

> In the monitor:
> 
>   info registers
> 
> Will show you where things are, see if the ip is moving each time. Also
> you can do a disassemble dump from there to see what code it is stuck
> on.
> 

I've attached with GDB to QEMU to see where it got stuck. Turned out it is
caused by CONFIG_STRICT_KERNEL_RWX=y of the Linux kernel. Upon boot completion
kernel changes memory permissions and that changing is executed on a dedicated
CPU, while other CPUs are 'stopped' in a busy loop.

This patch just introduced a noticeable performance regression for a
single-threaded TCG, which is probably fine since MTTCG is the default now.
Thank you very much for the suggestions and all your work on MTTCG!

-- 
Dmitry
