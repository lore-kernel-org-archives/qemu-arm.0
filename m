Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j10sm1537324wrw.87.2019.07.03.08.03.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 08:03:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F0EEF1FF87;
	Wed,  3 Jul 2019 16:03:52 +0100 (BST)
References: <20190703102208.10086-1-alex.bennee@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org
Subject: Re: [RFC PATCH for semihosting-tests] semihosting tests: add v7m tests
In-reply-to: <20190703102208.10086-1-alex.bennee@linaro.org>
Date: Wed, 03 Jul 2019 16:03:52 +0100
Message-ID: <87muhvw46f.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: kFOOOISf+sVo


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> M-profile has yet another way of triggering semihosting calls using
> the BKPT instruction. To support this we need to add a M-profile setup
> so we use the nice and simple microbit model which has a Cortex-M0 in
> it.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  Makefile         | 24 ++++++++++++++++++++---
>  microbit.lds     | 32 ++++++++++++++++++++++++++++++
<snip>
> --- /dev/null
> +++ b/microbit.lds
> @@ -0,0 +1,32 @@
> +/*
> + * microbit.lds : simple linker script for baremetal ARM-M test cases
> + *
> + * Copyright (C) 2019 Linaro Limited. All rights reserved.
> + *
> + * Memory layout is for the BBC Microbit board which puts RAM at 0x20000=
000
> + */
> +
> +RAMSTART =3D 0x20000000;
> +STACKTOP =3D 0x20004000;
> +
> +ENTRY(exc_reset_thumb)
> +
> +SECTIONS
> +{
> +    . =3D 0x0;
> +    .text : {
> +        *(.text)
> +    }
> +    .data : {
> +        *(.data)
> +    }
> +    .rodata : {
> +        *(.rodata)
> +    }
> +    .bss : {
> +        *(.bss)
> +    }
> +    /DISCARD/ : {
> +        *(.ARM.attributes)
> +    }
> +}

And it would help of course if data was is the read/write area.

-    .data : {
-        *(.data)
-    }
     .rodata : {
         *(.rodata)
     }
+    . =3D RAMSTART;
+    .data : {
+        *(.data)
+    }
     .bss : {
         *(.bss)
     }

--
Alex Benn=C3=A9e
