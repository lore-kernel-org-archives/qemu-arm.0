Received: by 10.25.77.65 with SMTP id a62csp561866lfb;
        Fri, 3 Feb 2017 03:23:10 -0800 (PST)
X-Received: by 10.28.64.213 with SMTP id n204mr1046355wma.12.1486120990322;
        Fri, 03 Feb 2017 03:23:10 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22c.google.com (mail-wm0-x22c.google.com. [2a00:1450:400c:c09::22c])
        by mx.google.com with ESMTPS id w84si1851652wmg.121.2017.02.03.03.23.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2017 03:23:10 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) client-ip=2a00:1450:400c:c09::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22c.google.com with SMTP id 196so13822320wmm.1
        for <alex.bennee@linaro.org>; Fri, 03 Feb 2017 03:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cvWiRebYrDY00Te1nN+i2s3BbgYiull7gMtQC62q2Os=;
        b=fikO3X6OZ0rIbn+AjfiM4DTUUhOGkWJz187oeRkbEcDdKBqGspcv3bgnqAsrnQoZvH
         0xZc8sJgI7iJeVEH2LdI9MdgJPgDiGzFevGZksIyfnDDrkiDVuYOhdvniZxjloDlimtM
         KuwX3lgeS57X8rttIOgEJVJcfnthlnHc/klbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cvWiRebYrDY00Te1nN+i2s3BbgYiull7gMtQC62q2Os=;
        b=o3yHC/L6TX4y1gER+BzBAFNCaPnrn+RALJcHD3B6JhFNBKYVIkfUCP3sgzdbSWqJzg
         2hGkdKRKnPS2MEUfmyX6w9LWZDgHScpVhri1PVhihI5/S7296etGOmX8Vw2yjXUoH9xt
         o1611ElO22ZuKNd6oV5D8qGAqtOqlQ/9SxUXJOe4R7InzIxg9d8L9QyxuRXQhDITspos
         vYb3T9wDalRNbd/zbH1xqaiDeysoIMPmkB1+wGOMZvd+UUen4iv9c4h1bhwqpNlJ8rC2
         2nduv0MLHHtqmlpxRiG3a1qcvZrQM7XOhZpI2GQWSw0V9WswsRJR+0YgmOx4P4JnLao8
         PgsA==
X-Gm-Message-State: AMke39kG4UvwG/0wTOzg9qmtLZhSmrIQoj9e5/ndfAG0Iut7Vew56FWI8cKQXPWAHpJubkU6vyxRYSUSFQOvkOxtLK8=
X-Received: by 10.28.189.135 with SMTP id n129mr916741wmf.92.1486120989892;
 Fri, 03 Feb 2017 03:23:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 03:22:49 -0800 (PST)
In-Reply-To: <20170201150553.9381-24-alex.bennee@linaro.org>
References: <20170201150553.9381-1-alex.bennee@linaro.org> <20170201150553.9381-24-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 11:22:49 +0000
Message-ID: <CAFEAcA9J4KgFLD5QiEjarw6HZY-T5WX4eSeSdGY6G2Y9ZAMOqQ@mail.gmail.com>
Subject: Re: [PATCH v9 23/25] target-arm: introduce ARM_CP_EXIT_PC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CTg2uv9H3MNg

On 1 February 2017 at 15:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Some helpers may trigger an immediate exit of the cpu_loop. If this
> happens the PC need to be rectified to ensure the restart will begin
> on the next instruction.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.h           | 3 ++-
>  target/arm/translate-a64.c | 4 ++++
>  target/arm/translate.c     | 4 ++++
>  3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d61793ca06..a3c4d07817 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1465,7 +1465,8 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpr=
egid)
>  #define ARM_CP_NZCV            (ARM_CP_SPECIAL | (3 << 8))
>  #define ARM_CP_CURRENTEL       (ARM_CP_SPECIAL | (4 << 8))
>  #define ARM_CP_DC_ZVA          (ARM_CP_SPECIAL | (5 << 8))
> -#define ARM_LAST_SPECIAL       ARM_CP_DC_ZVA
> +#define ARM_CP_EXIT_PC         (ARM_CP_SPECIAL | (6 << 8))
> +#define ARM_LAST_SPECIAL       ARM_CP_EXIT_PC

This shouldn't be a "special", because those are for
"this is a special case that is handled entirely in the translate
code", not "I need some extra behaviour on the code generated
for calling the helper functions" (which is what the
plain non-special ARM_CP flags do). Notice that all the other
"special" cases completely define the behaviour of the cp that
uses them, and the code implementing them ends the case
statement with "return", not "break".

Missing documentation comment change.

That said, I'm definitely becoming more strongly of the
opinion that longjumping out of this helper is not the
best way to implement this, so these remarks are a bit moot.

>  /* Used only as a terminator for ARMCPRegInfo lists */
>  #define ARM_CP_SENTINEL 0xffff
>  /* Mask of only the flag bits in a type field */
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 7e7131fe2f..98d4fac070 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1561,6 +1561,10 @@ static void handle_sys(DisasContext *s, uint32_t i=
nsn, bool isread,
>          tcg_rt =3D cpu_reg(s, rt);
>          gen_helper_dc_zva(cpu_env, tcg_rt);
>          return;
> +    case ARM_CP_EXIT_PC:
> +        /* The helper may exit the cpu_loop so ensure PC is correct */
> +        gen_a64_set_pc_im(s->pc);
> +        break;
>      default:
>          break;
>      }
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 24faa7c60c..e1f4a48720 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7510,6 +7510,10 @@ static int disas_coproc_insn(DisasContext *s, uint=
32_t insn)
>              gen_set_pc_im(s, s->pc);
>              s->is_jmp =3D DISAS_WFI;
>              return 0;
> +        case ARM_CP_EXIT_PC:
> +            /* The helper may exit the cpu_loop so ensure PC is correct =
*/
> +            gen_set_pc_im(s, s->pc);
> +            break;
>          default:
>              break;
>          }

thanks
-- PMM
