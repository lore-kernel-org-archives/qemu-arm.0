Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp474260wme;
        Fri, 18 May 2018 08:26:41 -0700 (PDT)
X-Received: by 2002:a37:b384:: with SMTP id c126-v6mr8750172qkf.160.1526657201159;
        Fri, 18 May 2018 08:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526657201; cv=none;
        d=google.com; s=arc-20160816;
        b=JCoNqBg3EQt+6m9KzvRvFN6/eeVdd9nKzT5GsN0GXenZLngIayyYVTBnuF0dh8WMNm
         wVaJk+YJNKjQ1cMD8yLWo4QeWFzJJH3gJxXG57KLdk7BzKI2ASBMhTaRqoltbp6zRyEt
         vzQDoTJMpg4+iyaqWiHUveNDK85zjfHumOJzV2EFoFPjV4llgN/G5s36+WBvn3XaLZiy
         O84ei7ieGKk71rv8NtRFcxsgYXGUCiYMtxnaRkCNiKGh15zsqrshg8uBjNou7dJJEf+2
         ONmXra7A1OXPSfLjqjfaJSVTS7KAGUHwdPz2TIJmCKPHAgJdZF4qaEg4mARW5lJwNrQ3
         HnpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :sender:dkim-signature:arc-authentication-results;
        bh=A1wtX+jV/MRDhRm1Wb57MXrVbrY1ZfYrqwSXV1elxcI=;
        b=f7GSAVrItb2AyCYXege9fpBtqgaulSBzIyfYEtbLZL7pwjCpqoY4c8Ku6ccRCkkXiC
         tKC9sLvHCzUu0DEYfZu/N0Km8a+Fh+7Ip5saD2Dh15hIfqKzjSbIS+0K55OblPxPuPQA
         7NyIdszUjoZSTWpjBEb1/D07EmByDPqPIcwoADlhzOuasbu18z0xMjj66f2ih6So+YcT
         jPkYb/lwZThLBk/F8q1LFENMsL3thCPtjJmC1kt9ZvmXNt7iOk3bwHF5p5EBmbOpqfbH
         Pbk/kkQmnlYKuDd19UwvTecZ3U7UCiYZHUecVhjdEfTP4F0CgER6puO1TyleNHOQfpt4
         HH+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=adoueyn3;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b100-v6sor6261702qkb.69.2018.05.18.08.26.41
        (Google Transport Security);
        Fri, 18 May 2018 08:26:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=adoueyn3;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A1wtX+jV/MRDhRm1Wb57MXrVbrY1ZfYrqwSXV1elxcI=;
        b=adoueyn3geTJSmTDmYX3J2xo09yk9yoya7FZSFCW8UWeSR0cSk5YyzSxN7XDALU6Th
         2iRae6yPaC28fTRV4y12C0+H+yREQW/owl57HWhCYBU+5ObTOgHO94OozjppM1czPLxA
         pV1Oyg29ZtR9p4VGN/klGA5ryBMSh+N0V25LvCEFxAcnWk2tqsH1kG3FjolctwEFUd74
         YdCZdgxdfS5pjW5d03wozS5D1yjXAB7Mv+cmcE7cF/LgUvhx2hmtNSDrHLQZUYZlpFfL
         icbueV+znqXt3oGvuABeasjpn7XPmIYZ46TQ+/QPK+1Rhf2V41gYUSnLvU6vFIEtNWpY
         TD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=A1wtX+jV/MRDhRm1Wb57MXrVbrY1ZfYrqwSXV1elxcI=;
        b=TPKwncEgeMqMGTDB+zTNEDwCYv1OElDv+T3ntymqO1JrPw+yYcPbFfrCXGcTQy2wtO
         QPrHD9qP/Q1UKxVMwkXgM7xWNhF6+NVALf8ymG2+jz7RNlgs0C0evBuitwmVQXReMr8j
         ta0OGX11F/NKvvedB/2+VeSsgZYftfCTWxPrHMgtoQFMHktKByGQbjnfwGM9tctK1AAc
         JZID1VceHHdKsk7xcyoUTR5d9CElQXbROw9mLxenY6/fvE2nghLmbS0CE2L4oXkwrC0M
         jccA3WRwAXsbrEyYsCZnSWsOd3yGzpf9O2hQDUBgkRZwsOIOxLeTKV440IYD+nAJoNjC
         tNQA==
X-Gm-Message-State: ALKqPwejv++yrwBgZZxq/p4El2nPm9kBLNC13gLwqcoG0ETMzusYtaJA
	QQZE2CdfWyHNPzY6HlSbff4=
X-Google-Smtp-Source: AB8JxZpiSqqsn/0mTleH/V6x3Ws0fCb2zXKD+o+5VhjIngmaVd9yJgY2mpHgC4YBVDWZrIz3/KqpHA==
X-Received: by 2002:a37:c40d:: with SMTP id d13-v6mr9111568qki.340.1526657200762;
        Fri, 18 May 2018 08:26:40 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.11] ([138.117.48.222])
        by smtp.gmail.com with ESMTPSA id e56-v6sm5735357qtc.61.2018.05.18.08.26.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 May 2018 08:26:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v4 26/49] tests/tcg: move ARM specific tests into subdir
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, richard.henderson@linaro.org,
 balrogg@gmail.com, aurelien@aurel32.net, agraf@suse.de,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-27-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <578dacec-2d74-6e6d-fbd2-091e46e21803@amsat.org>
Date: Fri, 18 May 2018 12:26:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180517174718.10107-27-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9uW6IrAlK7Bv

On 05/17/2018 02:46 PM, Alex Bennée wrote:
> These only need to be built for ARM guests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> v2
>   - do VPATH manipulation in tests/tcg/arm/Makefile.target
>   - merge with fix hello-arm test
> v4
>   - update MAINTAINERS
> ---
>  MAINTAINERS                           |  1 +
>  tests/tcg/README                      |  9 ---------
>  tests/tcg/arm/Makefile.target         | 13 +++++++++++++
>  tests/tcg/arm/README                  | 11 +++++++++++
>  tests/tcg/{ => arm}/hello-arm.c       |  0
>  tests/tcg/{ => arm}/test-arm-iwmmxt.s |  0
>  6 files changed, 25 insertions(+), 9 deletions(-)
>  create mode 100644 tests/tcg/arm/Makefile.target
>  create mode 100644 tests/tcg/arm/README
>  rename tests/tcg/{ => arm}/hello-arm.c (100%)
>  rename tests/tcg/{ => arm}/test-arm-iwmmxt.s (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 17b9fc0fbe..4e331c4db4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -135,6 +135,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: target/arm/
> +F: tests/tcg/arm/
>  F: hw/arm/
>  F: hw/cpu/a*mpcore.c
>  F: include/hw/cpu/a*mpcore.h
> diff --git a/tests/tcg/README b/tests/tcg/README
> index 469504c4cb..625f2326e6 100644
> --- a/tests/tcg/README
> +++ b/tests/tcg/README
> @@ -5,15 +5,6 @@ or they are architecture specific.
>  
>  
>  
> -ARM
> -===
> -
> -hello-arm
> ----------
> -
> -test-arm-iwmmxt
> ----------------
> -
>  MIPS
>  ====
>  
> diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
> new file mode 100644
> index 0000000000..bc6962ecc6
> --- /dev/null
> +++ b/tests/tcg/arm/Makefile.target
> @@ -0,0 +1,13 @@
> +# -*- Mode: makefile -*-
> +#
> +# ARM - included from tests/tcg/Makefile.target
> +#
> +
> +ARM_SRC=$(SRC_PATH)/tests/tcg/arm
> +
> +# Set search path for all sources
> +VPATH 		+= $(ARM_SRC)
> +
> +
> +hello-arm: CFLAGS+=-marm -ffreestanding

So we are only testing the ARMv7, but linux-user provides ARMv5 and
ARMv6 cpus.

There are still boards shipped with those cpus, so I think QEMU will
still be useful nowadays with those older archs.
Can we consider add tests for them?
If so, I volunteer to prepare Docker cross images :)

arm-linux-user/tests$ ../qemu-arm -cpu arm926 -d in_asm,op sha1
----------------
IN:
0x000102ec:  f04f 0b00  mov.w    fp, #0

OP:
 ld_i32 tmp5,env,$0xffffffffffffffec
 movi_i32 tmp6,$0x0
 brcond_i32 tmp5,tmp6,lt,$L0

 ---- 000102ec 00000000 00000000
 movi_i32 pc,$0x102ec
 movi_i32 tmp5,$0x1
 movi_i32 tmp6,$0x2000000
 movi_i32 tmp7,$0x1
 call exception_with_syndrome,$0x0,$0,env,tmp5,tmp6,tmp7
 set_label $L0
 exit_tb $0x563aed6cc043

qemu: uncaught target signal 4 (Illegal instruction) - core dumped
Illegal instruction

> +hello-arm: LDFLAGS+=-nostdlib
> diff --git a/tests/tcg/arm/README b/tests/tcg/arm/README
> new file mode 100644
> index 0000000000..e6307116e2
> --- /dev/null
> +++ b/tests/tcg/arm/README
> @@ -0,0 +1,11 @@
> +These are ARM specific guest programs
> +
> +hello-arm
> +---------
> +
> +A very simple inline assembly, write syscall based hello world
> +
> +test-arm-iwmmxt
> +---------------
> +
> +A simple test case for older iwmmxt extended ARMs
> diff --git a/tests/tcg/hello-arm.c b/tests/tcg/arm/hello-arm.c
> similarity index 100%
> rename from tests/tcg/hello-arm.c
> rename to tests/tcg/arm/hello-arm.c
> diff --git a/tests/tcg/test-arm-iwmmxt.s b/tests/tcg/arm/test-arm-iwmmxt.s
> similarity index 100%
> rename from tests/tcg/test-arm-iwmmxt.s
> rename to tests/tcg/arm/test-arm-iwmmxt.s
> 
