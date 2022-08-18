Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp123417ejf;
        Wed, 17 Aug 2022 21:20:19 -0700 (PDT)
X-Received: by 2002:a63:80c8:0:b0:41c:62c7:abd7 with SMTP id j191-20020a6380c8000000b0041c62c7abd7mr1124651pgd.570.1660796419461;
        Wed, 17 Aug 2022 21:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660796419; cv=none;
        d=google.com; s=arc-20160816;
        b=L3SqFw1lKUMTZQp0c2UHliJOBzKQlNv8MXgud0BU2Da3cVMAeQ0cnqVE5+52IJu3N4
         mX6/xMgiK4RM9+zSoSBLCrEmEabQ6kUlfkqhvpIOLkDKSVCGP0nYUKsLak6qPIWcy6xy
         nPaOIetID4yb3CNny7j4weUwEbOcMzyDEpH5zH1GORA310QTrRLImevgMudsbdwte7kI
         XHa25i+x2MmIeqUL1HNCv9exhjZRbIKBlfmhJUyuko9t8lhvX7uYYkPI5SohWbnfxzFF
         +08L1DsSqrSW09d9w19BCsp+458o/d+EUbRQEl3NwMELgCMQp0udsalzo98ky4chfQKb
         0fvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q9zHFdXtwZj59sNvfehjBtTTfnpeXLm1QDMCzQKW5WE=;
        b=pUqjzDQCTW5aBcd1i7brDRnVhWcVPZR+OZkDrow7wFk6DDTzgsKUo80j/ubjyg0nkM
         8az+wuldssqXPCLul6jGm7sV/lveWuSESliVVqZ5JA/H8m/IBuSo1KWXDDqr3b+Ecz/4
         /GkYKNqjLm1MJ+SwLdoFyfBg/2ePIb/hjJ4fv0C314JaqJJKljyjGYs6T5pt4wehhLQH
         uI8eFBtcfX3ewPzhBMAmIJ6UbfGTPCl0Jes6whETFPpehHfukMAjLZbcUvpdVpcL/Xv9
         hPB59pi3F3SbKZTxlZF+smXD6fFphVcaZtUNH/UvxfrCo9bttGc5whFy9S9PlznlWfzT
         AWMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QV7FAPhW;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cp27-20020a056a00349b00b0052d51bd80e7sor386209pfb.47.2022.08.17.21.20.19
        (Google Transport Security);
        Wed, 17 Aug 2022 21:20:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QV7FAPhW;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=q9zHFdXtwZj59sNvfehjBtTTfnpeXLm1QDMCzQKW5WE=;
        b=QV7FAPhWoKak9044wR72V/gRftd8B/N5IvqHggyrdZVFU2NwsUyoXE9FbVViIZ/9Hp
         soLPDqYamAXvJEBBuXB/OwHuRUnMEWKzKqoCIn1KChyaLXY/kw+DHGwps1uV7/Fxnc3f
         37FjdtPyk5NIMYd/meCm6JXq2E8UgwGnh5MjpP6a3SzNSh16dUwCqyvawJ6fh3GwDJkg
         +XS8lTe77mzSWWfd4XLChr63ZsxGgOLpf78Cks1I0Uk7i0EKrqu21i8K8ULciNlJNlCM
         8ruwEWk20T23p3zXwclT2dBW3d2hXWvSTo6hkOIbG6eYHp2Wse5BIy+1HwjQyWA2CUdj
         sZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=q9zHFdXtwZj59sNvfehjBtTTfnpeXLm1QDMCzQKW5WE=;
        b=Vt68MzqPHOvTFDtgQ4UCRwCMrbHAVrn8rAQ5BP2uBYz3dBd/ZHiAzRLea5IUwtJPH2
         FTEfF1A6jeCC5hxAszebKIaHX4VbuiI50YKTFgskqvGvniPp6Kn8USUsBg2i6EikmkXi
         2dqtsxPNC7YBcf1Ner6zyALunxtNmGEaMNHM2scooXkXiw/+GnrpPUoOkpn83NEZp/3Q
         pDVKh5RZNl724m3mdKGQkaRjkGZXdA38c1Dc1wRnN+dYO7ZRnsCoKc8E9G4bOW8tllVz
         6sx2Zp3sv2qgO2sUp46ZPZlm9mXuJqRsNm/fkcyQyOvWoq57xkVhYOWDEdRBdAdJqWUC
         VpCg==
X-Gm-Message-State: ACgBeo3975BVy8tkyonOi4dPO08nyiTccoEfCb7b9ZrKLh3kowKjSH3O
	ipuxpvHuUobHFrDvkI7uHO68HSfesLdYeWZK0lTe3wptuDc=
X-Google-Smtp-Source: AA6agR4Z2DXM3tvy5n3bSxbQkRdqMMevtses0VQNq0tW0fO6tTAM0cUx6Bzcx1JJoNKue+EIohSFpamSi4bCmwozeNg=
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr1225279pfj.83.1660796418824; Wed, 17
 Aug 2022 21:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org> <20220815190303.2061559-8-peter.maydell@linaro.org>
In-Reply-To: <20220815190303.2061559-8-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Aug 2022 14:19:52 +1000
Message-ID: <CAKmqyKNo15Kz6-FtXL3C2wC7+aHHLTyGG5tOKQTpnM-c-kJO=w@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Furquan Shaikh <furquan@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 70Q4bFTSGqkM

On Tue, Aug 16, 2022 at 5:11 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The riscv target incorrectly enabled semihosting always, whether the
> user asked for it or not.  Call semihosting_enabled() passing the
> correct value to the is_userspace argument, which fixes this and also
> handles the userspace=on argument.
>
> Note that this is a behaviour change: we used to default to
> semihosting being enabled, and now the user must pass
> "-semihosting-config enable=on" if they want it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I agree with Richard that a check in translate would be better, but
this is also an improvement on the broken implementation we have now

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 59b3680b1b2..49c4ea98ac9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/exec-all.h"
>  #include "tcg/tcg-op.h"
>  #include "trace.h"
> +#include "semihosting/semihost.h"
>  #include "semihosting/common-semi.h"
>
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
> @@ -1342,7 +1343,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong mtval2 = 0;
>
>      if  (cause == RISCV_EXCP_SEMIHOST) {
> -        if (env->priv >= PRV_S) {
> +        if (semihosting_enabled(env->priv < PRV_S)) {
>              do_common_semihosting(cs);
>              env->pc += 4;
>              return;
> --
> 2.25.1
>
>
