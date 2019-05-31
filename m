Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z193sm9151478wmc.20.2019.05.31.04.08.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 04:08:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 802091FF87;
	Fri, 31 May 2019 12:08:06 +0100 (BST)
References: <20190514155301.16123-1-alex.bennee@linaro.org> <20190514155301.16123-7-alex.bennee@linaro.org> <20190531091204.tjmq622gw457xbdr@lws.brq.redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Miroslav Rezanina <mrezanin@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common interface for WRITE0/WRITEC in arm-semi
In-reply-to: <20190531091204.tjmq622gw457xbdr@lws.brq.redhat.com>
Date: Fri, 31 May 2019 12:08:06 +0100
Message-ID: <87sgsu51bd.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4RM9WUgVZeTq


Miroslav Rezanina <mrezanin@redhat.com> writes:

> On Tue, May 14, 2019 at 04:52:56PM +0100, Alex Benn=C3=A9e wrote:
>> Now we have a common semihosting console interface use that for our
>> string output. However ARM is currently unique in also supporting
>> semihosting for linux-user so we need to replicate the API in
>> linux-user. If other architectures gain this support we can move the
>> file later.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
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
>> @@ -6,4 +6,6 @@ obj-y =3D main.o syscall.o strace.o mmap.o signal.o \
>>  obj-$(TARGET_HAS_BFLT) +=3D flatload.o
>>  obj-$(TARGET_I386) +=3D vm86.o
>>  obj-$(TARGET_ARM) +=3D arm/nwfpe/
>> +obj-$(TARGET_ARM) +=3D arm/semihost.o
>> +obj-$(TARGET_AARCH64) +=3D arm/semihost.o
>>  obj-$(TARGET_M68K) +=3D m68k-sim.o
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
>> +int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, =
int len)
>> +{
>> +    void *s =3D lock_user_string(addr);
>> +    len =3D write(STDERR_FILENO, s, len ? len : strlen(s));
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
>> -                return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,1"=
, args);
>> -          } else {
>> -                return write(STDERR_FILENO, &c, 1);
>> -          }
>> -        }
>> +    {
>> +        qemu_semihosting_console_out(env, args, 1);
>> +        return 0xdeadbeef;
>> +    }
>>      case TARGET_SYS_WRITE0:
>> -        if (!(s =3D lock_user_string(args)))
>> -            /* FIXME - should this error code be -TARGET_EFAULT ? */
>> -            return (uint32_t)-1;
>> -        len =3D strlen(s);
>> -        if (use_gdb_syscalls()) {
>> -            return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,%x",
>> -                                   args, len);
>> -        } else {
>> -            ret =3D write(STDERR_FILENO, s, len);
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
> this patch breaks build for softmmu target when CONFIG_SEMIHOSTING is not=
 enabled as qemu_semihosting_console_out
> is not defined in such case - neither linux-user/arm/semihost.c nor hw/se=
mihosting/console.c compiled and function
> is not in stubs/semihost.c

How do you do that? I tried ../../configure --without-default-devices
and that still builds for me.

But I suspect what's needed is to change:

#ifndef CONFIG_USER_ONLY

to

#ifdef CONFIG_SEMIHOSTING

to the relevant headers and helper bits.

>
> Mirek


--
Alex Benn=C3=A9e
