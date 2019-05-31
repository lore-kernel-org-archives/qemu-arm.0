Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z20sm5325997wmf.14.2019.05.31.01.30.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 01:30:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7C05C1FF87;
	Fri, 31 May 2019 09:30:23 +0100 (BST)
References: <20190530143916.20255-1-alex.bennee@linaro.org> <ced800af-8f00-cc27-358d-57cb0e715e45@vivier.eu>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Riku Voipio <riku.voipio@iki.fi>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] semihosting: split console_out intro string and char versions
In-reply-to: <ced800af-8f00-cc27-358d-57cb0e715e45@vivier.eu>
Date: Fri, 31 May 2019 09:30:23 +0100
Message-ID: <87tvdb3u1s.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gbsKE+ukiYyd


Laurent Vivier <laurent@vivier.eu> writes:

> Le 30/05/2019 =C3=A0 16:39, Alex Benn=C3=A9e a =C3=A9crit :
>> This is ostensibly to avoid the weirdness of len looking like it might
>> come from a guest and sometimes being used. While we are at it fix up
>> the error checking for the arm-linux-user implementation of the API
>> which got flagged up by Coverity (CID 1401700).
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
<snip>
>>  /**
>>   * qemu_semihosting_log_out:
>> diff --git a/linux-user/arm/semihost.c b/linux-user/arm/semihost.c
>> index 9554102a855..b7cdc21f832 100644
>> --- a/linux-user/arm/semihost.c
>> +++ b/linux-user/arm/semihost.c
>> @@ -15,10 +15,34 @@
>>  #include "hw/semihosting/console.h"
>>  #include "qemu.h"
>>
>> -int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, =
int len)
>> +int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
>>  {
>> +    int len;
>>      void *s =3D lock_user_string(addr);
>> -    len =3D write(STDERR_FILENO, s, len ? len : strlen(s));
>> +    if (!s) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: passed inaccessible address " TARGET_FMT_lx,
>> +                      __func__, addr);
>> +        return 0;
>> +    }
>> +
>> +    len =3D write(STDERR_FILENO, s, strlen(s));
>
> You could avoid 2 calls to strlen() if you inline directly
> lock_user_string() content:
>
>     len =3D target_strlen(addr);
>     if (len < 0){
>        qemu_log_mask(LOG_GUEST_ERROR,
>                      "%s: passed inaccessible address " TARGET_FMT_lx,
>                      __func__, addr);
>        return 0;
>     }
>     s =3D lock_user(VERIFY_READ, addr, (long)(len + 1), 1);
>     len =3D write(STDERR_FILENO, s, len);
>
>>      unlock_user(s, addr, 0);
>>      return len;
>>  }

It's a nice clean-up but I've just looked at what was going on inside
with lock_user. I guess g_assert(s) on the lock user would be fair as we
can't fail at this point?

--
Alex Benn=C3=A9e
