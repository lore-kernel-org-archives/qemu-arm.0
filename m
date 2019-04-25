Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2285135wrx;
        Thu, 25 Apr 2019 14:48:37 -0700 (PDT)
X-Received: by 2002:a1c:2e45:: with SMTP id u66mr3376401wmu.111.1556228917619;
        Thu, 25 Apr 2019 14:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556228917; cv=none;
        d=google.com; s=arc-20160816;
        b=viel9uTYsv8PJUlZvAIb9Qi68MvofMm311+sr6WAv/59qbvtHHEMjqVaglEy46bj7p
         pQ0qDMUNRsmNuBgLF6vw88t2TLk9ZQ2/VPDcLytDltIrJuSJVh7nJVHhFy/bAhV4g7rQ
         pO5fFYcTZ2bF2/cxLivzsvjtPXEdMXBoZZncH/oGYow+uHL+iJPaQRl0uliAH00RaRyM
         Jh1bI/Pd+WW8FfFzl8VuZW3DikpHgJ0U21Aig5VO1Yu9xYOtd9vq8UqTcsbWkH0vljXo
         HYaTWNIe1Viv0NeVhVxrJfjiqNV6mgremUb0L17uQufQo5ks2euPOkcE5fqJ7KQgFeLX
         eC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:cc:to:from:subject;
        bh=hJatKdPVxanwTTmFXYxtRR78VeW99Db8Ei/S5bsheSU=;
        b=eyzNy8AFpCpqHpikhAhMBvkoQhmNnBKhF7PSQ8+URN8h/mnQbDjlNwRLvPwMlpphNG
         njgMtiwMjVsOcb6TewH3Q4uK9GvDEgLjG9fJ/5SMHKC/0KILf0uNaepNxCjMBl1S2H5b
         oSuwUX8+MZ1ZOIxHaBKYFnENliklskX3qsHHg6+z6XyLOZsMUH+MNEsAWBGBj8dKd1t+
         8vYYuuTSorMVC86stpATOOjFI+aIc91GgT9a0h9X/M4cR1RGMvf63Vo6fGE2bZ/+jWr1
         AstPG0cwPP/0g7eRXnhR4QrHMOMzPu7In0OjatMEZVjZRZSrAkf0XNHmAzHfgp28jYav
         KKlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f187sor10100059wme.18.2019.04.25.14.48.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 25 Apr 2019 14:48:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hJatKdPVxanwTTmFXYxtRR78VeW99Db8Ei/S5bsheSU=;
        b=W95vbP2tpZUO1Y41zRnNRd0KivOyIfH6r69tvOF+TaYxowupXv53gakmdLLGhmvLmX
         50EfSQoc0QucNoOke6yNn3aIhMj2mKx6brtVB+sqdQRa5jrCLXxmyRh2Jgt2cha+Cwcz
         YYIdHKvjJpLqt9T9U46TaAyVJaGjahUz2D12BUI+d9MULNfwq/khhc+vQE4lq429LQCV
         Ls0bYSMxl0r1GKbkNDt6O9tVVAUo/vssv+AcNF9lKXKfOrX61QwQ433H3eHguHqDZZ4Z
         zLQ/pxShH/s2xYIly6qTJVMs+4deWrRoV9cUgqMMtQmCQQ7HMYJ3DRDiC7+acOh8oSt3
         Bxjg==
X-Gm-Message-State: APjAAAX59JlTg54qyYqPHgFLOwF1jhiZ9qujuNyHP3HtGgzUz7caBZEr
	Ef7hjV+3dqgFggxw4/drNn/bEK9VjBZc1Q==
X-Google-Smtp-Source: APXvYqxfpTEvMrYqi1gROtQzpjxoeuoz6SMSQOyPeRxZqt0O+Njk7hjmI9my4KIiK4Pc7MpfeqgDLw==
X-Received: by 2002:a1c:6c17:: with SMTP id h23mr5046170wmc.122.1556228917367;
        Thu, 25 Apr 2019 14:48:37 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr. [109.222.216.122])
        by smtp.gmail.com with ESMTPSA id r16sm19186256wrx.37.2019.04.25.14.48.35
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 14:48:36 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel
 argument"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: Jim Mussared <jim@groklearning.com>, Julia Suvorova <jusual@mail.ru>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20190103144124.18917-1-stefanha@redhat.com>
 <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
 <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9f20517f-dea4-cbc9-86ad-bab5c66d2d5c@redhat.com>
Date: Thu, 25 Apr 2019 23:48:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: pmglBn3WKnW1

On 4/25/19 8:07 PM, Philippe Mathieu-Daudé wrote:
> Hi Peter, Stefan,
> 
> On 1/4/19 4:16 PM, Peter Maydell wrote:
>> On Thu, 3 Jan 2019 at 14:41, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>
>>> This reverts commit 01fd41ab3fb69971c24a69ed49cde96086d81278.
>>>
>>> The generic loader device (-device loader,file=kernel.bin) can be used
>>> to load a kernel instead of the -kernel option.  Some boards have flash
>>> memory (pflash) that is set via the -pflash or -drive options.
>>>
>>> Allow starting QEMU without the -kernel option to accommodate these
>>> scenarios.
>>>
>>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> Previous to this commit (v3.1), we have:
> 
> $ qemu-system-aarch64 -M netduino2
> qemu-system-aarch64: Guest image must be specified (using -kernel)
> 
> Now (v4.0) we get:
> 
> $ qemu-system-aarch64 -M netduino2
> qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1)
> 
> R00=00000000 R01=00000000 R02=00000000 R03=00000000
> R04=00000000 R05=00000000 R06=00000000 R07=00000000
> R08=00000000 R09=00000000 R10=00000000 R11=00000000
> R12=00000000 R13=ffffffe0 R14=fffffff9 R15=00000000
> XPSR=40000003 -Z-- A handler
> FPSCR: 00000000
> Aborted (core dumped)

(gdb) bt
#0  0x00007fd14f39457f in raise () at /lib64/libc.so.6
#1  0x00007fd14f37e895 in abort () at /lib64/libc.so.6
#2  0x000056286da2695c in cpu_abort (cpu=0x5628705c43c0,
fmt=0x56286dfdc450 "Lockup: can't escalate %d to HardFault (current
priority %d)\n") at /source/qemu/exec.c:1282
#3  0x000056286dada4ea in do_armv7m_nvic_set_pending
(opaque=0x5628705a5030, irq=3, secure=false, derived=false) at
/source/qemu/hw/intc/armv7m_nvic.c:632
#4  0x000056286dada568 in armv7m_nvic_set_pending
(opaque=0x5628705a5030, irq=6, secure=false) at
/source/qemu/hw/intc/armv7m_nvic.c:650
#5  0x000056286db3ae1b in arm_v7m_cpu_do_interrupt (cs=0x5628705c43c0)
at /source/qemu/target/arm/helper.c:8822
#6  0x000056286dad2e9e in cpu_handle_exception (cpu=0x5628705c43c0,
ret=0x7fd13d9fbe2c) at /source/qemu/accel/tcg/cpu-exec.c:504
#7  0x000056286dad350a in cpu_exec (cpu=0x5628705c43c0) at
/source/qemu/accel/tcg/cpu-exec.c:709
#8  0x000056286da77497 in tcg_cpu_exec (cpu=0x5628705c43c0) at
/source/qemu/cpus.c:1431
#9  0x000056286da77caf in qemu_tcg_cpu_thread_fn (arg=0x5628705c43c0) at
/source/qemu/cpus.c:1735
#10 0x000056286deb5dce in qemu_thread_start (args=0x5628705ea850) at
/source/qemu/util/qemu-thread-posix.c:502
#11 0x00007fd14f52a58e in start_thread () at /lib64/libpthread.so.0
#12 0x00007fd14f459683 in clone () at /lib64/libc.so.6

Running with -d in_asm,int:
----------------
IN:
0x00000000:  00000000  andeq    r0, r0, r0

Taking exception 18 [v7M INVSTATE UsageFault]
...BusFault with BFSR.STKERR
...taking pending nonsecure exception 3
----------------
IN:
0x00000000:  00000000  andeq    r0, r0, r0

Taking exception 18 [v7M INVSTATE UsageFault]
qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1)

Since I didn't provided anything to bootstrap the guest, the bootvector
in flash is obviously empty.

> 
> This is confusing.
> 
> (same happens with emcraft-sf2, microbit, musca-*)
> 
> Regards,
> 
> Phil.
> 
