Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp518067ejr;
        Tue, 10 Oct 2023 18:04:10 -0700 (PDT)
X-Received: by 2002:a05:6122:1d47:b0:49d:eeed:3ed5 with SMTP id gd7-20020a0561221d4700b0049deeed3ed5mr14975425vkb.14.1696986250406;
        Tue, 10 Oct 2023 18:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696986250; cv=none;
        d=google.com; s=arc-20160816;
        b=vERZYzASzi5qaLQwSAJNGCQBTBcWiUBXBtKKJSGanuGwj+ZefcMghQoDT9o/WSezrL
         aDCEzUGVwlMHvaIEivER+nCcUsUrUb47nHiWNNv1hTaBkNqzL0gyXgKvAq5hWLHwh9rb
         ohLAXK/HcaRpQ2BwbDAjBiLbekiN2EXwP/lJRE59MXTDf5hwa2/oMjCjduuaPUDbH3n1
         M3ZBfcWdGor7S2XaT8Xz1ZuhV/nJtQFNM6zOV85UOB2LS8wt8Jf//4PdRwdtEiRctefT
         wD6MpWBIeI2hawddz9nv/rlOPlVRH9SFTUG32eM734D0HLp1LrlNkwnfQP5CFxZMm9Lj
         Se3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aqO5ka7tR9qZcNKmHJAXn+ExW6wHOnY5HZ1B8d6xlA0=;
        fh=cqk238ux3/GdOijP7fp8WGbp8VqG0EAAdwsLvgVM+lA=;
        b=J24AYG2O39ZLToMZzjbPnChvaxGB7lAhFxo2XpnXTxpBEFL7VeEEqdNsLQueInAJN2
         kHAN2u4AP/jtd72kJQfuZuXJ58N5R6AyhOrEibRBP2ZI43/RwWFniNfUFH60qZdBpSLF
         U4Gz24jMM/q1ijouvcFDsUJSJB7jo248kQrFkDSsi+8MBxgBg/1TLyIv+rU0qLv19LF8
         s2rh79uoNnXFOfYPoebV/3mL+GNxGe+4Pikhcp+a/5YgdYb9X7TJrOH+7a8qqcujWXMM
         qbs8wd4TOoWWJ23ar3IT2H0ZkauE+rtDFMS2VpnDdBYb5N102jbzHllOKj7WbkLp9gvg
         W1sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=c1HJ424E;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k186-20020a1fecc3000000b0049ab760c198sor2262253vkh.2.2023.10.10.18.04.10
        (Google Transport Security);
        Tue, 10 Oct 2023 18:04:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=c1HJ424E;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696986249; x=1697591049; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqO5ka7tR9qZcNKmHJAXn+ExW6wHOnY5HZ1B8d6xlA0=;
        b=c1HJ424E3Ii23xZXHypHHB3ykVwEhRrMOgE8S6ZJxlYSKapaCNpYX2xtyz0U9VrLzZ
         Yq91xquZxymw+c55EiQ5H6DKS1wDTJ5OgZruPUL89+EkoQhwPFJ6x2Z2SLUJTJfiCOB+
         F25kqpg0vgfiCpHTxb2z0/J94Oq9iv3SrT8IXPD1SvO9UoBduv1Hg7VCxI3G+jMx79SP
         9Rek11AW3VN0ibfJMeVgX0G2reSZ4JkwxLgAYAdx2gWQC4jCTniqwguDX2ABLPX8wcTQ
         H4T58hJsF/56lIXoH3D8qMbwa9KympHhgfVZ86C3oMnfWIDIGzGtJ3T3w6QX8UD2HG50
         RH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696986249; x=1697591049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqO5ka7tR9qZcNKmHJAXn+ExW6wHOnY5HZ1B8d6xlA0=;
        b=HLQvWnpaKonKZ+OS9PRnvDGkDptXXDntZt+bYfOwxkKK8idB4xG6xc7gSJ6PVsqtWQ
         eqnLbNuYavujVQA1UOXziRn6xShUDiPBKw0wDY6wiFTkg/HhNU1uls1/u4NwoOMZJSWV
         d+ubSBPWvB4QXyNVvD7TbDYkhfEPNbA0GHb6+8xWzo2700I6uYYLdREDgO7XbIk16Z43
         Q9NWLMS7XqOxw989+JRgrXUPYfV6VWNsMMrs/PrxI5dWn0zx7/fX/z/ogYmtSxEGqIIT
         f9eEf0xPFqzizjStB2j4BF1dvpg+fgy8rNRyraF6sE/ipuGJp3VImgicGOi+GYEEnsNW
         MDrg==
X-Gm-Message-State: AOJu0YwJYzJOCgDz5FpLGu0rH2rTlGk8Fg01NBJeveHea7R5RqNWdUO9
	Q3CqAh8TS9h/ZBq+yutLt9CtvGhrYYHPd3nSSBd5jfnVjVZysA==
X-Google-Smtp-Source: AGHT+IE+dECs0/kWr7vwAr7Wy9VndFb7DLF3LT2g8gzD4c35dqPtmKLYacBfQzZPQpjsSy45eTmlKRIHhMi98CmdBdM=
X-Received: by 2002:a1f:c9c1:0:b0:49d:3e4c:6168 with SMTP id
 z184-20020a1fc9c1000000b0049d3e4c6168mr15264409vkf.7.1696986249500; Tue, 10
 Oct 2023 18:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org> <20231009164104.369749-17-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-17-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:03:42 +1000
Message-ID: <CAKmqyKN86xUqKMjd6U=2pno962DnMNVVRzfJCycT=S_62+PXVw@mail.gmail.com>
Subject: Re: [PATCH 16/25] target/arm: Remove references to gdb_has_xml
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	Xiaojuan Yang <yangxiaojuan@loongson.cn>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Brad Smith <brad@comstyle.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org, 
	John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, 
	Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Beraldo Leal <bleal@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Song Gao <gaosong@loongson.cn>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: X7f+EmV8YAus

On Tue, Oct 10, 2023 at 3:52=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> GDB has XML support since 6.7 which was released in 2007.
> It's time to remove support for old GDB versions without XML support.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20230912224107.29669-10-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/arm/gdbstub.c | 32 ++------------------------------
>  1 file changed, 2 insertions(+), 30 deletions(-)
>
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 8fc8351df7..b7ace24bfc 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -46,21 +46,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray=
 *mem_buf, int n)
>          /* Core integer register.  */
>          return gdb_get_reg32(mem_buf, env->regs[n]);
>      }
> -    if (n < 24) {
> -        /* FPA registers.  */
> -        if (gdb_has_xml()) {
> -            return 0;
> -        }
> -        return gdb_get_zeroes(mem_buf, 12);
> -    }
> -    switch (n) {
> -    case 24:
> -        /* FPA status register.  */
> -        if (gdb_has_xml()) {
> -            return 0;
> -        }
> -        return gdb_get_reg32(mem_buf, 0);
> -    case 25:
> +    if (n =3D=3D 25) {
>          /* CPSR, or XPSR for M-profile */
>          if (arm_feature(env, ARM_FEATURE_M)) {
>              return gdb_get_reg32(mem_buf, xpsr_read(env));
> @@ -100,21 +86,7 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
>          env->regs[n] =3D tmp;
>          return 4;
>      }
> -    if (n < 24) { /* 16-23 */
> -        /* FPA registers (ignored).  */
> -        if (gdb_has_xml()) {
> -            return 0;
> -        }
> -        return 12;
> -    }
> -    switch (n) {
> -    case 24:
> -        /* FPA status register (ignored).  */
> -        if (gdb_has_xml()) {
> -            return 0;
> -        }
> -        return 4;
> -    case 25:
> +    if (n =3D=3D 25) {
>          /* CPSR, or XPSR for M-profile */
>          if (arm_feature(env, ARM_FEATURE_M)) {
>              /*
> --
> 2.39.2
>
>
