Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp452681pjq;
        Fri, 31 May 2019 03:42:48 -0700 (PDT)
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr5198371wmc.45.1559299368634;
        Fri, 31 May 2019 03:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559299368; cv=none;
        d=google.com; s=arc-20160816;
        b=EbZ5Fsz/dR+sCDFk/sbeJETedhOJlCjM3BsaZLq1QuA+sfS835j46oGoQGkdNaKMvL
         Nel9mzDddU6dp8rzVvV4Tv2zdliz8Qd+w8NfglfeSJneVsgQCvNVbeY+JSh57YbzhkTp
         WQvyjxvVa00K6WtUkdVfnpfUKi4UawZzQMc0Rrf3dPLnjljH/7O2kxsIGy52Cp9XmYEo
         mbulgAk6BbvKH9fIxzODJqkBopgWKNZWozKjiTSUkCWKgPDC+mR8M2gRCs3R90HlDueH
         pDOR5dZi9DjQUqWI+vxjAtXVC4FmO19PTiizdADFXIkOC5mG4uDfo6QQLleH1FgmvN4p
         /oSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=vO1Ew/ZqISYVIX5HEOx51Yc6znbw8xHoNHe4b+X75QI=;
        b=RSSG8ogWbqH/lKP91L9lFnS8QS8Uq57cYYR/nQbsLNKLeCizIXVU0Xn4rA07L+fted
         PF32nuMvlty1/5eCaTIkwsJ9i6ZhHneWvJy8WSftFzQ3GUx3swNAfBsnNHmdybDXmgsM
         zLVzvfzecEdpRA+r3hSovoYwvokGUUA2knB8f7ZntjG/5teiGybjoPbs+lyEZ7hkjNCh
         RDEYTlrhPG6nEcVI75ZXsy3G/YHDslFDqkUlrz4RE8AfOyZo/SjlcO69k1GGbX49/Q6P
         LzlZupyBpav1Kc320Ll3V/PEt3Z9pm1u2mmHC7FzLQ7Fp2WtzHsvrCcGF7723DuZbFuc
         1TWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g8sor3186978wrm.43.2019.05.31.03.42.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 May 2019 03:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vO1Ew/ZqISYVIX5HEOx51Yc6znbw8xHoNHe4b+X75QI=;
        b=YpyTpUqykReY5AzH09P2lD4H08xGxR+v22CzRaEVK24WsptoHc4vBDyiG2TwZm8nRG
         oCHpGmyUH+LebTOn+z/IaPRyXdfWfAC0xjMUFF24cqsqcpR2mC2dUxBZKD1BSIiOUu+b
         M6WxzTvp9FTBAgPQ7t8Y8tBmzOyAenVOwSRyfsJ95KjKeWqhdvz/WN5wkpa/L1E4t7eF
         CsszeZOKXlCjcBr9tB010nxm9+ZP5Uoddi0Wr6jw2Z4aVjzDpHrgwF7TyCW9pTbphiAU
         4B58NHCl70atJeVz4U1jyZZ4Tz6ZKb3ePDDozhZ3YAvpJ3yQ1n1jyN2/W2fMf8zyxGRZ
         q7Yg==
X-Gm-Message-State: APjAAAW7aN1zKtkRmNraCyewuPJwEp020ypEIV+KGfonHl5ABKGcRxHd
	4nubualLrjH7qaS72DtinZTEAg==
X-Google-Smtp-Source: APXvYqwOABhGPhI58u49aJcFB7gDWUQOcnrBA8FwVEAbTOeZBTv2VWZEN6kEottdx6cZ/dr3VB+h1Q==
X-Received: by 2002:adf:90e7:: with SMTP id i94mr5221529wri.213.1559299368264;
        Fri, 31 May 2019 03:42:48 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.43] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id z20sm5766965wmf.14.2019.05.31.03.42.47
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 03:42:47 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common
 interface for WRITE0/WRITEC in arm-semi
To: Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio
 <riku.voipio@iki.fi>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
 <20190514155301.16123-7-alex.bennee@linaro.org>
 <20190531091204.tjmq622gw457xbdr@lws.brq.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <891973f7-2f2b-ad59-70bf-6069382fd977@redhat.com>
Date: Fri, 31 May 2019 12:42:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531091204.tjmq622gw457xbdr@lws.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ScsQXjuSN+AR

Hi Miroslav,

On 5/31/19 11:12 AM, Miroslav Rezanina wrote:
> On Tue, May 14, 2019 at 04:52:56PM +0100, Alex Bennée wrote:
>> Now we have a common semihosting console interface use that for our
>> string output. However ARM is currently unique in also supporting
>> semihosting for linux-user so we need to replicate the API in
>> linux-user. If other architectures gain this support we can move the
>> file later.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  linux-user/Makefile.objs  |  2 ++
>>  linux-user/arm/semihost.c | 24 ++++++++++++++++++++++++
>>  target/arm/arm-semi.c     | 31 ++++++-------------------------
>>  3 files changed, 32 insertions(+), 25 deletions(-)
>>  create mode 100644 linux-user/arm/semihost.c
>>
>> diff --git a/linux-user/Makefile.objs b/linux-user/Makefile.objs
>> index 769b8d83362..285c5dfa17a 100644
>> --- a/linux-user/Makefile.objs
>> +++ b/linux-user/Makefile.objs
>> @@ -6,4 +6,6 @@ obj-y = main.o syscall.o strace.o mmap.o signal.o \
>>  obj-$(TARGET_HAS_BFLT) += flatload.o
>>  obj-$(TARGET_I386) += vm86.o
>>  obj-$(TARGET_ARM) += arm/nwfpe/
>> +obj-$(TARGET_ARM) += arm/semihost.o
>> +obj-$(TARGET_AARCH64) += arm/semihost.o
>>  obj-$(TARGET_M68K) += m68k-sim.o
>> diff --git a/linux-user/arm/semihost.c b/linux-user/arm/semihost.c
>> new file mode 100644
>> index 00000000000..9554102a855
>> --- /dev/null
>> +++ b/linux-user/arm/semihost.c
>> @@ -0,0 +1,24 @@
>> +/*
>> + * ARM Semihosting Console Support
>> + *
>> + * Copyright (c) 2019 Linaro Ltd
>> + *
>> + * Currently ARM is unique in having support for semihosting support
>> + * in linux-user. So for now we implement the common console API but
>> + * just for arm linux-user.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "hw/semihosting/console.h"
>> +#include "qemu.h"
>> +
>> +int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, int len)
>> +{
>> +    void *s = lock_user_string(addr);
>> +    len = write(STDERR_FILENO, s, len ? len : strlen(s));
>> +    unlock_user(s, addr, 0);
>> +    return len;
>> +}
>> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
>> index 9e5a414dd89..253c66b172a 100644
>> --- a/target/arm/arm-semi.c
>> +++ b/target/arm/arm-semi.c
>> @@ -27,6 +27,7 @@
>>  
>>  #include "cpu.h"
>>  #include "hw/semihosting/semihost.h"
>> +#include "hw/semihosting/console.h"
>>  #ifdef CONFIG_USER_ONLY
>>  #include "qemu.h"
>>  
>> @@ -314,32 +315,12 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>>              return set_swi_errno(ts, close(arg0));
>>          }
>>      case TARGET_SYS_WRITEC:
>> -        {
>> -          char c;
>> -
>> -          if (get_user_u8(c, args))
>> -              /* FIXME - should this error code be -TARGET_EFAULT ? */
>> -              return (uint32_t)-1;
>> -          /* Write to debug console.  stderr is near enough.  */
>> -          if (use_gdb_syscalls()) {
>> -                return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,1", args);
>> -          } else {
>> -                return write(STDERR_FILENO, &c, 1);
>> -          }
>> -        }
>> +    {
>> +        qemu_semihosting_console_out(env, args, 1);
>> +        return 0xdeadbeef;
>> +    }
>>      case TARGET_SYS_WRITE0:
>> -        if (!(s = lock_user_string(args)))
>> -            /* FIXME - should this error code be -TARGET_EFAULT ? */
>> -            return (uint32_t)-1;
>> -        len = strlen(s);
>> -        if (use_gdb_syscalls()) {
>> -            return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,%x",
>> -                                   args, len);
>> -        } else {
>> -            ret = write(STDERR_FILENO, s, len);
>> -        }
>> -        unlock_user(s, args, 0);
>> -        return ret;
>> +        return qemu_semihosting_console_out(env, args, 0);
>>      case TARGET_SYS_WRITE:
>>          GET_ARG(0);
>>          GET_ARG(1);
>> -- 
>> 2.20.1
>>
>>
> 
> Hi Alex,
> 
> this patch breaks build for softmmu target when CONFIG_SEMIHOSTING is not enabled as qemu_semihosting_console_out
> is not defined in such case - neither linux-user/arm/semihost.c nor hw/semihosting/console.c compiled and function
> is not in stubs/semihost.c

Kinda funny, I noticed the same issue at the same time, and was chatting
with Alex about it.

I prepared a patch expliciting we can not disable CONFIG_SEMIHOSTING on
the MIPS arch. Would that work for you?

Regards,

Phil.
