Received: by 10.25.44.15 with SMTP id s15csp2886207lfs;
        Sun, 23 Jul 2017 07:29:47 -0700 (PDT)
X-Received: by 10.55.74.142 with SMTP id x136mr1114140qka.254.1500820187849;
        Sun, 23 Jul 2017 07:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500820187; cv=none;
        d=google.com; s=arc-20160816;
        b=xbgTpr+nIlkQiuQ1bgXRwOO/w+9o35CfzElPVVvBa+I5641qP8dWtd626XSimhkOeU
         hP278cO1hWH/hO7dXPzizyu89QKpKjbp4l64i/BQoVjj3HwLTkgltNcnss8h++wE/ai9
         ecfKRzJwc8vH+scUxEBFNQPWtk66ZlOl9DVtlkwJ2loCYcPUQtS+C4QooBPDXpD8T+to
         c+7XSvDUf6sBV2zS+r8CUYjNmipqvQGp9Pt1MET7hZKFQWApuw5M0OmnaZwGNRdLZCX7
         M025W9IaRtW7x5EFruRg/HgedFO4jVuqjJ7qak9o6XKa+U1u+ypPKZvLIkNLWwUxecRm
         95/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=xeqemPAP3gg+LlJpqrg9pv1VEdE1zyebRWOV7d1NjH4=;
        b=rfXaf0NPisvM5PsRjeygY6C4XPl2yQYBx5chtWWDdGnta9XsYwi7sB9YxrxNLvQ8Cp
         qKermBV8buk0qPRQK2e9SbUWud18nNhl/dNnRxI/QVvQd2GT4qpBCuPN9DVjyju1oKCf
         MoA2MEBK8ZWdZGmJVaNQRjrqD5CMM9+r6D4hYMol9seal3bKt3+r43gAC/rj81Wb0Gtm
         PiqrlZZo8AVqbrYnnR4oBmX2FNq9NY7/qjRil9RN1qreOQfqSNkvKL23XDYkd7X4fH14
         d1bbkrQSZxKaehcp26InPbb9THiRzCMqa8Hldb73SLkA6K/rOmmdPizlkJJBcEqG0dcQ
         du8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=K9CGeV6G;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com. [2607:f8b0:400d:c0d::242])
        by mx.google.com with ESMTPS id 84si7714264qky.78.2017.07.23.07.29.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jul 2017 07:29:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) client-ip=2607:f8b0:400d:c0d::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=K9CGeV6G;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x242.google.com with SMTP id n43so10184950qtc.4;
        Sun, 23 Jul 2017 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xeqemPAP3gg+LlJpqrg9pv1VEdE1zyebRWOV7d1NjH4=;
        b=K9CGeV6GFJOdN4V4h7OpFxJOu42FBdSG1wcuhqJsr2zcavVrY8Az1qKWUj9qTpvE2D
         qD2aWPmjcwkvJgYZcIsSU11dp+vQ682qWOzddfucUb83zpDmF0rLxSoGLtkx9o0iiFTX
         nHUnbYI/lI3C1p9cmABwUDNIbHVOneKSIGzWs2sJj/dF43SGFhSR3gGyVH2/c29sHgmm
         5JX4COxOv4xoILh9KtESk9aTXg1aN1snnQUpplHdQCwZWybos5ieLycuy2CJKBFj0CL0
         Pubz0jXew/Ykqw2gojRIr9WH8eTSvNYpT3FoVG5rzlfkqcZww/t49LUHm7PgjPNGb9gg
         LElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xeqemPAP3gg+LlJpqrg9pv1VEdE1zyebRWOV7d1NjH4=;
        b=Hwi3lzoqxjdF//j5xwXa2giR/L9NvTmxsBCugYwhMd60tXHaoX2GnciWSkvslBU64G
         lGr1Zh6ChgasGKwFTyQ+hGY8MQrljCDkwCIH4qwPCPsHetQU15BD52jIGDchyyQcOwWO
         eAgPDInO40sB9/Zm4IAvoT5Ily3v8G/oEAgbvEzFSQ2bTHcxMZ3XLZeEZcQpGG1pDSjS
         H+kCY4YggnPYki0Nl566TordRURJVBEi6Z4S5hBV1RP9YFopykH7RZLN5hpYi4zXdc24
         CyJXJYpYMm3hxzbfpSdWa5ZcYeS6kuOgUI4XtGiYVu3Ohzqe5CLmXLYt/RZP0DYogBKl
         GRSA==
X-Gm-Message-State: AIVw113iNxdtdJV3IwQ2X3yS62GrknfrnGMkwER4IFlnPLXmjuy6FCDB
	GXttx+1Qk5QhZg==
X-Received: by 10.237.60.152 with SMTP id d24mr17737070qtf.126.1500820187256;
        Sun, 23 Jul 2017 07:29:47 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.223])
        by smtp.gmail.com with ESMTPSA id p188sm316765qkf.48.2017.07.23.07.29.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jul 2017 07:29:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-arm] [RFC PATCH for 2.11 01/23] softfloat: move existing
 softfloat2a into versioned directory
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Alexander Graf <agraf@suse.de>,
 rth@twiddle.net, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-arm@nongnu.org, Yongbok Kim <yongbok.kim@imgtec.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 "open list:PowerPC" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3ca40089-a5a6-55a5-7df3-5c019e62fbc2@amsat.org>
Date: Sun, 23 Jul 2017 11:29:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170720150426.12393-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: GU/LM2JJC3Qv

Even if some people ever object to use SoftFloat3c and your series, this 
patch fits well for mainline.

On 07/20/2017 12:04 PM, Alex Bennée wrote:
> This is a precursor to importing SoftFloat3c into the QEMU source
> tree. As the two versions of SoftFloat present different APIs the hope
> is to selectively include the version 3 header when required. So for
> this change:
> 
>   - #include "fpu/softloat.h" -> #include "fpu/softfloat2a/softfloat.h"
>   - fpu/softfloat* -> fpu/softfloat2a/
> 
> This is all pretty mechanical and doesn't yet change any capabilities.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   Makefile.target                              | 2 +-
>   fpu/Makefile.objs                            | 1 +
>   fpu/{ => softfloat2a}/softfloat-macros.h     | 0
>   fpu/{ => softfloat2a}/softfloat-specialize.h | 0
>   fpu/{ => softfloat2a}/softfloat.c            | 2 +-
>   include/fpu/{ => softfloat2a}/softfloat.h    | 0
>   include/qemu/bswap.h                         | 2 +-
>   linux-user/arm/nwfpe/double_cpdo.c           | 2 +-
>   linux-user/arm/nwfpe/extended_cpdo.c         | 2 +-
>   linux-user/arm/nwfpe/fpa11.h                 | 2 +-
>   linux-user/arm/nwfpe/fpa11_cpdt.c            | 2 +-
>   linux-user/arm/nwfpe/fpa11_cprt.c            | 2 +-
>   linux-user/arm/nwfpe/fpopcode.c              | 2 +-
>   linux-user/arm/nwfpe/single_cpdo.c           | 2 +-
>   scripts/analyze-inclusions                   | 2 +-
>   target/alpha/cpu.h                           | 2 +-
>   target/alpha/fpu_helper.c                    | 2 +-
>   target/alpha/helper.c                        | 2 +-
>   target/alpha/vax_helper.c                    | 2 +-
>   target/arm/cpu.h                             | 2 +-
>   target/hppa/cpu.h                            | 2 +-
>   target/hppa/helper.c                         | 2 +-
>   target/i386/cpu.h                            | 2 +-
>   target/m68k/cpu.h                            | 2 +-
>   target/microblaze/cpu.h                      | 2 +-
>   target/mips/cpu.h                            | 2 +-
>   target/moxie/cpu.h                           | 2 +-
>   target/nios2/cpu.h                           | 2 +-
>   target/openrisc/cpu.h                        | 2 +-
>   target/ppc/cpu.h                             | 2 +-
>   target/s390x/cpu.h                           | 2 +-
>   target/sh4/cpu.h                             | 2 +-
>   target/sparc/cpu.h                           | 2 +-
>   target/tricore/cpu.h                         | 2 +-
>   target/unicore32/cpu.h                       | 2 +-
>   target/xtensa/cpu.h                          | 2 +-
>   36 files changed, 33 insertions(+), 32 deletions(-)
>   create mode 100644 fpu/Makefile.objs
>   rename fpu/{ => softfloat2a}/softfloat-macros.h (100%)
>   rename fpu/{ => softfloat2a}/softfloat-specialize.h (100%)
>   rename fpu/{ => softfloat2a}/softfloat.c (99%)
>   rename include/fpu/{ => softfloat2a}/softfloat.h (100%)
> 
> diff --git a/Makefile.target b/Makefile.target
> index 2baec9252f..0991847dbd 100644
> --- a/Makefile.target
> +++ b/Makefile.target
> @@ -94,7 +94,7 @@ obj-$(CONFIG_TCG) += tcg/tcg.o tcg/tcg-op.o tcg/optimize.o
>   obj-$(CONFIG_TCG) += tcg/tcg-common.o tcg/tcg-runtime.o
>   obj-$(CONFIG_TCG_INTERPRETER) += tcg/tci.o
>   obj-$(CONFIG_TCG_INTERPRETER) += disas/tci.o
> -obj-y += fpu/softfloat.o
> +obj-y += fpu/
>   obj-y += target/$(TARGET_BASE_ARCH)/
>   obj-y += disas.o
>   obj-$(call notempty,$(TARGET_XML_FILES)) += gdbstub-xml.o
> diff --git a/fpu/Makefile.objs b/fpu/Makefile.objs
> new file mode 100644
> index 0000000000..938b4acbd0
> --- /dev/null
> +++ b/fpu/Makefile.objs
> @@ -0,0 +1 @@
> +obj-y = softfloat2a/softfloat.o
> diff --git a/fpu/softfloat-macros.h b/fpu/softfloat2a/softfloat-macros.h
> similarity index 100%
> rename from fpu/softfloat-macros.h
> rename to fpu/softfloat2a/softfloat-macros.h
> diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat2a/softfloat-specialize.h
> similarity index 100%
> rename from fpu/softfloat-specialize.h
> rename to fpu/softfloat2a/softfloat-specialize.h
> diff --git a/fpu/softfloat.c b/fpu/softfloat2a/softfloat.c
> similarity index 99%
> rename from fpu/softfloat.c
> rename to fpu/softfloat2a/softfloat.c
> index 433c5dad2d..59b9bc9e24 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat2a/softfloat.c
> @@ -84,7 +84,7 @@ this code that are retained.
>    */
>   #include "qemu/osdep.h"
>   
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   /* We only need stdlib for abort() */
>   
> diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat2a/softfloat.h
> similarity index 100%
> rename from include/fpu/softfloat.h
> rename to include/fpu/softfloat2a/softfloat.h
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index 09c78fd28a..0f01edd356 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -1,7 +1,7 @@
>   #ifndef BSWAP_H
>   #define BSWAP_H
>   
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #ifdef CONFIG_MACHINE_BSWAP_H
>   # include <sys/endian.h>
> diff --git a/linux-user/arm/nwfpe/double_cpdo.c b/linux-user/arm/nwfpe/double_cpdo.c
> index 1cef380852..c4824bf4d8 100644
> --- a/linux-user/arm/nwfpe/double_cpdo.c
> +++ b/linux-user/arm/nwfpe/double_cpdo.c
> @@ -20,7 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "fpa11.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   #include "fpopcode.h"
>   
>   float64 float64_exp(float64 Fm);
> diff --git a/linux-user/arm/nwfpe/extended_cpdo.c b/linux-user/arm/nwfpe/extended_cpdo.c
> index 1c8a412292..e2a262b9fe 100644
> --- a/linux-user/arm/nwfpe/extended_cpdo.c
> +++ b/linux-user/arm/nwfpe/extended_cpdo.c
> @@ -20,7 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "fpa11.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   #include "fpopcode.h"
>   
>   floatx80 floatx80_exp(floatx80 Fm);
> diff --git a/linux-user/arm/nwfpe/fpa11.h b/linux-user/arm/nwfpe/fpa11.h
> index d459c5da02..d743a82492 100644
> --- a/linux-user/arm/nwfpe/fpa11.h
> +++ b/linux-user/arm/nwfpe/fpa11.h
> @@ -39,7 +39,7 @@ extern CPUARMState *user_registers;
>   
>   /* includes */
>   #include "fpsr.h"		/* FP control and status register definitions */
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define		typeNone		0x00
>   #define		typeSingle		0x01
> diff --git a/linux-user/arm/nwfpe/fpa11_cpdt.c b/linux-user/arm/nwfpe/fpa11_cpdt.c
> index c32b0c2faa..3b5285d49d 100644
> --- a/linux-user/arm/nwfpe/fpa11_cpdt.c
> +++ b/linux-user/arm/nwfpe/fpa11_cpdt.c
> @@ -21,7 +21,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "fpa11.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   #include "fpopcode.h"
>   //#include "fpmodule.h"
>   //#include "fpmodule.inl"
> diff --git a/linux-user/arm/nwfpe/fpa11_cprt.c b/linux-user/arm/nwfpe/fpa11_cprt.c
> index 04dc2ebb02..f12fa1d593 100644
> --- a/linux-user/arm/nwfpe/fpa11_cprt.c
> +++ b/linux-user/arm/nwfpe/fpa11_cprt.c
> @@ -21,7 +21,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "fpa11.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   #include "fpopcode.h"
>   #include "fpa11.inl"
>   //#include "fpmodule.h"
> diff --git a/linux-user/arm/nwfpe/fpopcode.c b/linux-user/arm/nwfpe/fpopcode.c
> index 6784256d28..0aa603a935 100644
> --- a/linux-user/arm/nwfpe/fpopcode.c
> +++ b/linux-user/arm/nwfpe/fpopcode.c
> @@ -20,7 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "fpa11.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   #include "fpopcode.h"
>   #include "fpsr.h"
>   //#include "fpmodule.h"
> diff --git a/linux-user/arm/nwfpe/single_cpdo.c b/linux-user/arm/nwfpe/single_cpdo.c
> index 21e177baeb..6a5421ac4b 100644
> --- a/linux-user/arm/nwfpe/single_cpdo.c
> +++ b/linux-user/arm/nwfpe/single_cpdo.c
> @@ -20,7 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "fpa11.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   #include "fpopcode.h"
>   
>   float32 float32_exp(float32 Fm);
> diff --git a/scripts/analyze-inclusions b/scripts/analyze-inclusions
> index 14806e18c6..aa3fe087b2 100644
> --- a/scripts/analyze-inclusions
> +++ b/scripts/analyze-inclusions
> @@ -55,7 +55,7 @@ echo $(grep_include -F 'qapi/error.h') files include qapi/error.h
>   echo $(grep_include -F 'qom/object.h') files include qom/object.h
>   echo $(grep_include -F 'block/aio.h') files include block/aio.h
>   echo $(grep_include -F 'exec/memory.h') files include exec/memory.h
> -echo $(grep_include -F 'fpu/softfloat.h') files include fpu/softfloat.h
> +echo $(grep_include -F 'fpu/softfloat2a/softfloat.h') files include fpu/softfloat2a/softfloat.h
>   echo $(grep_include -F 'qemu/bswap.h') files include qemu/bswap.h
>   echo
>   
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 691ac00c0b..c35da9a871 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -33,7 +33,7 @@
>   
>   #include "exec/cpu-defs.h"
>   
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define ICACHE_LINE_SIZE 32
>   #define DCACHE_LINE_SIZE 32
> diff --git a/target/alpha/fpu_helper.c b/target/alpha/fpu_helper.c
> index 9645978aaa..6e4cba70d9 100644
> --- a/target/alpha/fpu_helper.c
> +++ b/target/alpha/fpu_helper.c
> @@ -21,7 +21,7 @@
>   #include "cpu.h"
>   #include "exec/exec-all.h"
>   #include "exec/helper-proto.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define FP_STATUS (env->fp_status)
>   
> diff --git a/target/alpha/helper.c b/target/alpha/helper.c
> index a5c308859b..7ffbea5e72 100644
> --- a/target/alpha/helper.c
> +++ b/target/alpha/helper.c
> @@ -21,7 +21,7 @@
>   
>   #include "cpu.h"
>   #include "exec/exec-all.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   #include "exec/helper-proto.h"
>   
>   
> diff --git a/target/alpha/vax_helper.c b/target/alpha/vax_helper.c
> index 2b0c178274..c3cf119740 100644
> --- a/target/alpha/vax_helper.c
> +++ b/target/alpha/vax_helper.c
> @@ -21,7 +21,7 @@
>   #include "cpu.h"
>   #include "exec/exec-all.h"
>   #include "exec/helper-proto.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define FP_STATUS (env->fp_status)
>   
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 102c58afac..1f565fd503 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -39,7 +39,7 @@
>   #include "cpu-qom.h"
>   #include "exec/cpu-defs.h"
>   
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define EXCP_UDEF            1   /* undefined instruction */
>   #define EXCP_SWI             2   /* software interrupt */
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 4cf4ac65e3..6faab8df47 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -31,7 +31,7 @@
>   #define CPUArchState struct CPUHPPAState
>   
>   #include "exec/cpu-defs.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define TARGET_PAGE_BITS 12
>   
> diff --git a/target/hppa/helper.c b/target/hppa/helper.c
> index ba04a9a52b..7ad874868f 100644
> --- a/target/hppa/helper.c
> +++ b/target/hppa/helper.c
> @@ -21,7 +21,7 @@
>   
>   #include "cpu.h"
>   #include "exec/exec-all.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   #include "exec/helper-proto.h"
>   
>   target_ulong cpu_hppa_get_psw(CPUHPPAState *env)
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 7a228afd04..09953d8163 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -53,7 +53,7 @@
>   #include "exec/cpu-defs.h"
>   
>   #ifdef CONFIG_TCG
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   #endif
>   
>   #define R_EAX 0
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 38a7e11b92..605f4bc4d3 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -28,7 +28,7 @@
>   #include "qemu-common.h"
>   #include "exec/cpu-defs.h"
>   #include "cpu-qom.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define OS_BYTE     0
>   #define OS_WORD     1
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index 5ce4c82657..b3d4055b83 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -28,7 +28,7 @@
>   #define CPUArchState struct CPUMBState
>   
>   #include "exec/cpu-defs.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   struct CPUMBState;
>   typedef struct CPUMBState CPUMBState;
>   #if !defined(CONFIG_USER_ONLY)
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index 4a4747af25..f48970b7cb 100644
> --- a/target/mips/cpu.h
> +++ b/target/mips/cpu.h
> @@ -11,7 +11,7 @@
>   #include "cpu-qom.h"
>   #include "mips-defs.h"
>   #include "exec/cpu-defs.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   struct CPUMIPSState;
>   
> diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
> index 8991aaef9a..4705aaaf85 100644
> --- a/target/moxie/cpu.h
> +++ b/target/moxie/cpu.h
> @@ -34,7 +34,7 @@
>   #define MOXIE_EX_BREAK      16
>   
>   #include "exec/cpu-defs.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define TARGET_PAGE_BITS 12     /* 4k */
>   
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 13931f3f0b..a41a52f752 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -28,7 +28,7 @@
>   #define CPUArchState struct CPUNios2State
>   
>   #include "exec/cpu-defs.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   #include "qom/cpu.h"
>   struct CPUNios2State;
>   typedef struct CPUNios2State CPUNios2State;
> diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
> index 2721432c4f..95d6d2d2cd 100644
> --- a/target/openrisc/cpu.h
> +++ b/target/openrisc/cpu.h
> @@ -29,7 +29,7 @@ struct OpenRISCCPU;
>   
>   #include "qemu-common.h"
>   #include "exec/cpu-defs.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   #include "qom/cpu.h"
>   
>   #define TYPE_OPENRISC_CPU "or1k-cpu"
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 6ee2a26a96..f73598b19f 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -79,7 +79,7 @@
>   
>   #include "exec/cpu-defs.h"
>   #include "cpu-qom.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #if defined (TARGET_PPC64)
>   #define PPC_ELF_MACHINE     EM_PPC64
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 7732d01784..ab7de63c9a 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -40,7 +40,7 @@
>   
>   #include "exec/cpu-all.h"
>   
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define NB_MMU_MODES 3
>   #define TARGET_INSN_START_EXTRA_WORDS 1
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index ffb91687b8..d1445f26e8 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -40,7 +40,7 @@
>   
>   #include "exec/cpu-defs.h"
>   
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define TARGET_PAGE_BITS 12	/* 4k XXXXX */
>   
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index 95a36a4bdc..28fa4cd4ba 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -29,7 +29,7 @@
>   
>   #include "exec/cpu-defs.h"
>   
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   /*#define EXCP_INTERRUPT 0x100*/
>   
> diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
> index a3493a123c..f79f86b858 100644
> --- a/target/tricore/cpu.h
> +++ b/target/tricore/cpu.h
> @@ -24,7 +24,7 @@
>   #include "qemu-common.h"
>   #include "cpu-qom.h"
>   #include "exec/cpu-defs.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define CPUArchState struct CPUTriCoreState
>   
> diff --git a/target/unicore32/cpu.h b/target/unicore32/cpu.h
> index 7b5b405e79..4df9bf8c45 100644
> --- a/target/unicore32/cpu.h
> +++ b/target/unicore32/cpu.h
> @@ -23,7 +23,7 @@
>   #include "qemu-common.h"
>   #include "cpu-qom.h"
>   #include "exec/cpu-defs.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define NB_MMU_MODES            2
>   
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index ee29fb1a14..d84bd86b0e 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -36,7 +36,7 @@
>   #include "qemu-common.h"
>   #include "cpu-qom.h"
>   #include "exec/cpu-defs.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat2a/softfloat.h"
>   
>   #define NB_MMU_MODES 4
>   
> 
