Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1597057ejf;
        Mon, 15 Aug 2022 22:39:19 -0700 (PDT)
X-Received: by 2002:a17:902:b18e:b0:172:5c92:d8db with SMTP id s14-20020a170902b18e00b001725c92d8dbmr13627705plr.140.1660628359077;
        Mon, 15 Aug 2022 22:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660628359; cv=none;
        d=google.com; s=arc-20160816;
        b=lRYB3lnmyU7wq9CPTN76vEjD8MAMrVRIM8HX4N4hqboHd1w1n2D9BQcC3GX6qeq6Z2
         3WKjqvsdOLul1etT1i07/8LtW3ufPRQyUm/LlLRxDNqY8Z/3X4/iYrVqn7wKqkia+mxz
         01jzp3aQBs4q+nFzVkBjduhaEtomUPdJvcrvuaa5Cf/e+3qx6Fq/Ld1odwJgm/IFw9g9
         nXiPzF8PxGMACBlyl3yP0YaF0TaqIwbDHgGPO7FDwr8TrguOG9EeVWYeCD+lp/NTFYfH
         44vda31sNcxkIN33bVfr70wOjv6L2a31bP28gPCg+6YVNDyd0A9WmKVL4sFSQi7ArxET
         HChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oPI32NRdEuu65J89pNAl9YxqkxREdXP271MOrnzfAC8=;
        b=qYPtNlqxSYLhxoTPdGIgUFXCJ0X33nHbF0LH9d5CHn3DCnqe1KtB84agZDXRIYJx2m
         3vy9V2wTypk7bCsFVcWyk8SNFqrOpq21JeV4XHpFZxEStTuucJjUIE6CUFWRm9XDfRRf
         FQf7OIi9WAo+MjUQJmBQ4joH50DuYvx8sp1C6PazePiXIorUg5q6pI8YNzBZmcZugfgV
         YSQ2VLFcYgUrt2t829py7L3L5q1leGkWqnd+8kVgh2vRrQEWwN7giVhMUwMf398jKoHx
         EIyhz/ES13dG2pBUnxOQaV1/cX1+j6KZK9P2HOTjwcnyJM4xlPSH0aPYGRAB4MgrJyCx
         yNSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rivosinc-com.20210112.gappssmtp.com header.s=20210112 header.b=AbcZzQsa;
       spf=pass (google.com: domain of furquan@rivosinc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=furquan@rivosinc.com
Return-Path: <furquan@rivosinc.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c17-20020a62e811000000b0052d290c8561sor5348447pfi.69.2022.08.15.22.39.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Aug 2022 22:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of furquan@rivosinc.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rivosinc-com.20210112.gappssmtp.com header.s=20210112 header.b=AbcZzQsa;
       spf=pass (google.com: domain of furquan@rivosinc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=furquan@rivosinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=oPI32NRdEuu65J89pNAl9YxqkxREdXP271MOrnzfAC8=;
        b=AbcZzQsaVJ/o9mpLLvHgrYLRZp23uCwhGr7N78OvCO+DTfvlWlMPXa6wQZ10zJADKN
         zVjajT/K7TBqIzrR84NqcAf+Q/7u9QTLuzoNv+U3K2QQGqwnWt7PjXt5yy8+DZVKxAf1
         eIWms7QZ56KluxvemzTscvsh8IObjLdO0B+/R0+44SXCKXG4BKh+wyKUivG9v1t6dtAu
         MRIBWZSGZB+MjGttl5gz/93J3VoORit73I9tVeqhUJquHCUNsWaisLNjSx+/kjezxyS7
         gpuLadugcLv1+gteGbA0EiComt5HrXlMA1ijDVXqeG6191XSPZmAXSykTvso9POSS7jG
         oiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=oPI32NRdEuu65J89pNAl9YxqkxREdXP271MOrnzfAC8=;
        b=npC8TL9mz6DiipfECJnMW0rqcLw4IFZGhiHKlG8/AuejZNOiSrcIRumB8tTTa6m3y9
         RBhpd4l0kKI3BKX7vMSKiDIT/L/MAz1WPJQLOsaKhb+IjRW2Hpihi1gRq3/UkkAAZI4H
         zfvMhxT/7YlRR/ldxqwmtYl9C4fceEzV2HjjUfwp8cV6iDDKYOBhoih/SLoWe/QaOL+P
         4SKYoEmmyGy2xPB0gAryIxGsL4chZ6bqcoy6nSqOhzoVsU8w36ZaxFK98aAdD2WjZ5VV
         0diex6fUtQbev9Ea7m+KK+fMQfZjRcRft/9riJmQUUBrPuQQYVB0HcDinl38kplE+8Vh
         /KrA==
X-Gm-Message-State: ACgBeo0gwLnuDmUnfuHZ9cP9JnF7XofFIviXy0lGwUGOEXPTjoqD5j05
	qyIWlDyxM5TbG7szIwJPV77fXln+VrutTlFwhBgDNg==
X-Google-Smtp-Source: AA6agR7VKuuXf2bVs+ahRggr80t5ngK204T/A5ROc5pjXf98Vz2YFwrE+7WPlMvcypFd8oeZBf9ZcqV5FNViMTn7/yc=
X-Received: by 2002:a62:79c4:0:b0:52d:cd3d:2027 with SMTP id
 u187-20020a6279c4000000b0052dcd3d2027mr20054985pfc.71.1660628358460; Mon, 15
 Aug 2022 22:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-8-peter.maydell@linaro.org> <08d41c28-728a-0ef2-c528-b55c4984ca2b@linaro.org>
In-Reply-To: <08d41c28-728a-0ef2-c528-b55c4984ca2b@linaro.org>
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Mon, 15 Aug 2022 22:39:07 -0700
Message-ID: <CA+tJHD6pdQXBdeF_t_qmqhkae9sJdRUustAsKqeiWmu5WuCb2w@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: AcO0RJ1a4kVG

On Mon, Aug 15, 2022 at 1:26 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/15/22 14:03, Peter Maydell wrote:
> > The riscv target incorrectly enabled semihosting always, whether the
> > user asked for it or not.  Call semihosting_enabled() passing the
> > correct value to the is_userspace argument, which fixes this and also
> > handles the userspace=on argument.
> >
> > Note that this is a behaviour change: we used to default to
> > semihosting being enabled, and now the user must pass
> > "-semihosting-config enable=on" if they want it.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/riscv/cpu_helper.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 59b3680b1b2..49c4ea98ac9 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -24,6 +24,7 @@
> >   #include "exec/exec-all.h"
> >   #include "tcg/tcg-op.h"
> >   #include "trace.h"
> > +#include "semihosting/semihost.h"
> >   #include "semihosting/common-semi.h"
> >
> >   int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
> > @@ -1342,7 +1343,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >       target_ulong mtval2 = 0;
> >
> >       if  (cause == RISCV_EXCP_SEMIHOST) {
> > -        if (env->priv >= PRV_S) {
> > +        if (semihosting_enabled(env->priv < PRV_S)) {
> >               do_common_semihosting(cs);
> >               env->pc += 4;
> >               return;
>
> I think this should be done in translate.  We should not have the overhead of checking the
> three insn sequence around ebreak unless semihosting is enabled.  Note that ctx->mem_idx
> == env->priv, per cpu_mem_index().

FWIW, the current series worked fine for my risc-v use case. Thanks, Peter!

>
>
> r~
>
