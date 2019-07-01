Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2768947wru;
        Mon, 1 Jul 2019 08:25:17 -0700 (PDT)
X-Received: by 2002:a9d:6042:: with SMTP id v2mr74260otj.73.1561994717222;
        Mon, 01 Jul 2019 08:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561994717; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/UUgDPvJpDXh8IlXfBppjRIOQVQSrgAsVlD2N+WiSBK+MvcURqVMlNfAQn0RrckFr
         GGHGg3vLYlW2QaolvlafTXF8pIrvM4bykY/hkpTwDpArdQyyLNvS8HGe5niw0yekoF3H
         gf8JXIzh8aUPOKJNmJxVu5C5MRlltRHwpN+62iw7MgPqSzjovtj7MDrxb1riEqmQlUXc
         InVRPUYrQaBWoo9Ez6s2pvQzL4OnVTp5xv809c2b60EsWYs2zDvmiYdh2rcr2GgvkNmt
         Nzsr/MyGWz/ZBRhd1gPucHqfDz0SxrrX85VMZ0NSm3DR4Ahg2IEIRPbGjQOnK9ZM77xj
         gdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J5jnrBC9B7cp43w6ntAwQwU4yHdDx/YqgFts1lQu7Uo=;
        b=PokK+PIUF3Nnt0v1Vo+YlJxTChimUFP3pjfxwLGn4aZSd7/VTQMh/LBkcasdbnoaBY
         vm7zV1QFlnA6DNa78NPGC9A3dwKYeJRNXv5fYfMrSk1LsNI1FXT8bYsTAj3TzJZCoJGO
         KED5oEMcC2xAs0UZmViZSty7fSPeSUX0E8RZWuBeRNFANAcCdU3hcBFN2bqmjYAw0ETp
         2O4t1E4KFDeQ272V6hTmAIrRdRUUCgPcBJHfuPt0yjRb9W/Fn3cgCuhkbk6V0fY1ULDk
         xpzwUdWNDuMoqEugriIKxa3a36ggZAvhMQNBZQh021pxjjTo1k0YrIm55ENFtt5Zg0K/
         PqYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ohk9nY15;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q25sor5989032otl.168.2019.07.01.08.25.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2019 08:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ohk9nY15;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J5jnrBC9B7cp43w6ntAwQwU4yHdDx/YqgFts1lQu7Uo=;
        b=Ohk9nY154Yem1mRA47Lb5WWFoOrU6Ba3968gI6L278x7B5TLWmAxQNX2j6AnxaGph1
         ox6OqEldxnjaPawZpMQE+eusDveCeEL/gQv5DmthLfjeAD0R7JYh5M51ag7elgRQDOhj
         Zh3ZvNKpya3Ec4b+Je+Hgra5sRFacpBU9Ccz1sGkHEbSFFafIuqdXUXUCGZ8RimnGGtP
         l4sI0z0qG3okgdihVYGhL9J/J4C5V1n18q0j+Axc4YGdB0LjWuq4MWTEu3Kos1QNNwnc
         xfJxWxc7l6DzStnPbLmhDuaXhRjlQl/tdvje++Dxu8YvZZGH21pV2GyUsDq4R2EdWqWp
         +0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J5jnrBC9B7cp43w6ntAwQwU4yHdDx/YqgFts1lQu7Uo=;
        b=SfADb66YbM1WEv+0OyIZkBgfdVI/BmknOUhHAZ3gOK/xunvnBlK1ZJDHcOmadsbjN8
         4GYP1BgMIP80rCPgX1I515nSGOe4M0nUdOzdBAF5q0OmR4x7AQENIqAADdUoRHgAB0kO
         ylKtlwT5sR0x1rGt5IRKomUmqn02nYroT+NcBJP7vk0mfgJSyDh3Ss1mXKUjNmE7/JO1
         1qWMSyo6gui9HiwkIxcqeYt9SHYF/NwxqdH14RlUb5TFHbHKrh3jNXhit2dx9Nfg14Ds
         VxmaXpBDJZA6M8Tc2mKfxjWF3xsbfAm1b7DKsGpLBh5R5QKRNafNO7oUQithR3s0sCHH
         zhXA==
X-Gm-Message-State: APjAAAWvz2k/ayhDdZQH5yC3ZBJ1P4X6Vy6/7tXO2ul+waQSDeO8qEKl
	bVAMhi3maFbjaZcmnXzBUCwdID5yjLicZmXj0qHNhMPmL3wI/Q==
X-Google-Smtp-Source: APXvYqwBDvgV0wSok7dNdW22AVjUeonoxb/GklKK6myUa7/jS2k5VHGs+XQETEZz0CEFfeiVG4Ki/qpApmJ37G8jyqI=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr21015232otk.232.1561994716772;
 Mon, 01 Jul 2019 08:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190701132516.26392-1-philmd@redhat.com> <20190701132516.26392-19-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-19-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 16:25:05 +0100
Message-ID: <CAFEAcA_XGuB5x+m5zmdBSE3bQP=jBdfWDzj_v0iBeqWmrETsng@mail.gmail.com>
Subject: Re: [PATCH v3 18/27] target/arm: Restrict semi-hosting to TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Yang Zhong <yang.zhong@intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Rob Bradford <robert.bradford@intel.com>, Samuel Ortiz <sameo@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: AxACgn44uwwh

On Mon, 1 Jul 2019 at 14:26, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Per Peter Maydell:
>
>   Semihosting hooks either SVC or HLT instructions, and inside KVM
>   both of those go to EL1, ie to the guest, and can't be trapped to
>   KVM.
>
> Let check_for_semihosting() return False when not running on TCG.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v3: inline call to g_assert_not_reached if !TCG
> ---
>  target/arm/Makefile.objs | 2 +-
>  target/arm/cpu.h         | 7 +++++++
>  target/arm/helper.c      | 4 +++-
>  3 files changed, 11 insertions(+), 2 deletions(-)

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 49a0f05cd1..1b4da7aa45 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -20,7 +20,6 @@
>  #include "qemu/qemu-print.h"
>  #include "exec/exec-all.h"
>  #include "exec/cpu_ldst.h"
> -#include "arm_ldst.h"
>  #include <zlib.h> /* For crc32 */
>  #include "hw/semihosting/semihost.h"
>  #include "sysemu/cpus.h"
> @@ -29,6 +28,9 @@
>  #include "qapi/qapi-commands-target.h"
>  #include "qapi/error.h"
>  #include "qemu/guest-random.h"
> +#ifdef CONFIG_TCG
> +#include "arm_ldst.h"
> +#endif

Should this ifdeffing of the arm_ldst.h include have gone in
another patch? It doesn't seem related to the change described
in the commit message.

thanks
-- PMM
