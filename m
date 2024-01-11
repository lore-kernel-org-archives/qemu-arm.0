Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2031233ejs;
        Thu, 11 Jan 2024 15:29:44 -0800 (PST)
X-Received: by 2002:a25:dfcd:0:b0:dbe:d53e:757d with SMTP id w196-20020a25dfcd000000b00dbed53e757dmr17475ybg.47.1705015784314;
        Thu, 11 Jan 2024 15:29:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705015784; cv=none;
        d=google.com; s=arc-20160816;
        b=nnuRYBUeQSKMeF2BPqUIJzJv2ehPS6WXBJhJ7SqkYfl7fY9I0qL20AUOqwMlLimuZt
         ICdBnBrOnJli6bnz9/dYiMuZI1UdNcjmcZiGfYj7z0c/gjFZFUzQnqUaUMdXZRhaa5Ti
         GnWsmFr4r2eJ3Rs1d7Bh8SKa89k6pZkj/A23SyHXnaGLrA7gytXrFyW3DNA+HQxtNwJ7
         gYiKd3y33wertTO65NoAkeCtXZxYjwLHqBpe9TbqnUx3Au0e+YyGTZ6qQhYwDJ8pINsC
         an8lb1d3WZHdgA/4ltPXw/pL5hJdHJb6y5U9kCGOCmcUgjsbqqGepvkapDVsa2NubR43
         tOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=du1IavJIWBdDP20xh4ONlQiRPjaJ1D2XqOF3jy6wAQc=;
        fh=67lMzTnSrKLPBk4euRnhO7GRQWAORjYfT+oLTqL3XMA=;
        b=RTCVYox7IJUGeI5rNjl06RVzH1LdJkOXl7hFSoGFgtTSSdbw0iIr4wYOYjxqitczJq
         1krAcWSgteCrqysjGI4X1td7FN8fQ4Vp+88gVG+zPyPvwdLH6x1k9SQrchNkQYtlWtG7
         xyWF6Xn9xffACWHCcA3H+4E7dV2R591FG17K0gTWVRMKoD567Dij8gJwZiplc+YUx6M1
         6YyQRGwCfpjHXoCEN3BJvgc8qugUDacYd+X2v519TOpz9OZ8Nn9xd5XoiOoOJyldxoBd
         8zPyLGyfOfmSGKMGSUoKdif0mhjKKmgawkF3HSZxDOJgoR+J4NYwI+wJE4I4OkhUoUpQ
         gKJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=apbtua9J;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n134-20020a25d68c000000b00dbeac141f70sor1106882ybg.18.2024.01.11.15.29.44
        (Google Transport Security);
        Thu, 11 Jan 2024 15:29:44 -0800 (PST)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=apbtua9J;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705015783; x=1705620583; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=du1IavJIWBdDP20xh4ONlQiRPjaJ1D2XqOF3jy6wAQc=;
        b=apbtua9JpE0/KWT56iM/HCs9ODehJ6yv7N4ep6zFRZrjWNlBwTZHwSPyKReDQGWtdP
         MefClbEsdLPEQiPbSKROQc6XQucNCKHk35otybV/Jdm1MUI9K5PPMIKjv8yR8hfIdmko
         i1keZtpjPcjFKc/3hqphTXfsmvlTfUqEAbgwjG81fXyPiwag/fvHzHiFsav+kFSFFget
         oyCLCBL41yUa7YG0tjsjNVjkLzZrWVG+KDh3wGYJUQEdKveSc5ya/ZCTtT93wDGnUEWr
         nJFX90+nlR1AnDdSB5ZPRmAPmH909u7qXKutWyUzf4sjNtANaS5BYI4HPbtHCCPJJLZ3
         hcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705015783; x=1705620583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=du1IavJIWBdDP20xh4ONlQiRPjaJ1D2XqOF3jy6wAQc=;
        b=bR/tHvTkdFNP+OW4+cf4oQLF1TgXAsM74FL/xCdhhn+ZE5Y9kx74m77p1yiV9fa0lV
         2h7FLi4RgUN++sjG2TzilsTIBpPz45oInOI6ixsKn12iQAs2cuoSUZbikV6GCP9Hr6V3
         xJTZpqwR2ow78y0hFGZ9LV2v3BdBvoPbLZmG0Hmx4ZVodbb1tNBEJpCaDfKvzo5zPM58
         R1C4p2VycMWnu6RqomWfifol7COVbWI382BHl9dZyswFC14tyyjIrzw6AvjRNKdxs2E8
         IQXr55FCO7ENEpGZHHVr75PDSUwWJCOCb4txhetlVQFKMiKZxIFoQEG3KfBBzPZhrnR+
         tAFg==
X-Gm-Message-State: AOJu0YyZ9rzlv5UnwhYVd1ZklKl67H7a4i9ThYjAfTgvbJhNhEsIvFeT
	4d4KQkKvdBOlH34dI6BYPadRbe3+DJgEHJuXoNRLrcDalI9PQg==
X-Google-Smtp-Source: AGHT+IHBbOhzbyunGMknfXiMMQitbHDlBWritE8c6YY3dLnEUY/sdXf9eyO4l64E/4J5cTd0z270xybVnE8JxuI3mU4=
X-Received: by 2002:a25:dccf:0:b0:dbc:b48e:6426 with SMTP id
 y198-20020a25dccf000000b00dbcb48e6426mr2837ybe.110.1705015783478; Thu, 11 Jan
 2024 15:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20240103173349.398526-1-alex.bennee@linaro.org> <20240103173349.398526-26-alex.bennee@linaro.org>
In-Reply-To: <20240103173349.398526-26-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 09:29:17 +1000
Message-ID: <CAKmqyKMLTLw37HzHhEdmQdd+WRYs603jm7w30k5HLNmZNYGacA@mail.gmail.com>
Subject: Re: [PATCH v2 25/43] target/riscv: Validate misa_mxl_max only once
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Song Gao <gaosong@loongson.cn>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Yanan Wang <wangyanan55@huawei.com>, 
	Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
	Michael Rolnik <mrolnik@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	David Woodhouse <dwmw2@infradead.org>, Laurent Vivier <laurent@vivier.eu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Brian Cain <bcain@quicinc.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org, 
	Alistair Francis <alistair.francis@wdc.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Rezl0n4jcWCQ

On Thu, Jan 4, 2024 at 5:04=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> misa_mxl_max is now a class member and initialized only once for each
> class. This also moves the initialization of gdb_core_xml_file which
> will be referenced before realization in the future.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20231213-riscv-v7-4-a760156a337f@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 21 +++++++++++++++++++++
>  target/riscv/tcg/tcg-cpu.c | 23 -----------------------
>  2 files changed, 21 insertions(+), 23 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2ab61df2217..b799f133604 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1247,6 +1247,26 @@ static const MISAExtInfo misa_ext_info_arr[] =3D {
>      MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
>  };
>
> +static void riscv_cpu_validate_misa_mxl(RISCVCPUClass *mcc)
> +{
> +    CPUClass *cc =3D CPU_CLASS(mcc);
> +
> +    /* Validate that MISA_MXL is set properly. */
> +    switch (mcc->misa_mxl_max) {
> +#ifdef TARGET_RISCV64
> +    case MXL_RV64:
> +    case MXL_RV128:
> +        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
> +        break;
> +#endif
> +    case MXL_RV32:
> +        cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  static int riscv_validate_misa_info_idx(uint32_t bit)
>  {
>      int idx;
> @@ -1695,6 +1715,7 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>      RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
>
>      mcc->misa_mxl_max =3D (uint32_t)(uintptr_t)data;
> +    riscv_cpu_validate_misa_mxl(mcc);
>  }
>
>  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 7f6712c81a4..eb243e011ca 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -148,27 +148,6 @@ static void riscv_cpu_validate_misa_priv(CPURISCVSta=
te *env, Error **errp)
>      }
>  }
>
> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
> -{
> -    RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
> -    CPUClass *cc =3D CPU_CLASS(mcc);
> -
> -    /* Validate that MISA_MXL is set properly. */
> -    switch (mcc->misa_mxl_max) {
> -#ifdef TARGET_RISCV64
> -    case MXL_RV64:
> -    case MXL_RV128:
> -        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
> -        break;
> -#endif
> -    case MXL_RV32:
> -        cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -}
> -
>  static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
>  {
>      CPURISCVState *env =3D &cpu->env;
> @@ -676,8 +655,6 @@ static bool tcg_cpu_realize(CPUState *cs, Error **err=
p)
>          return false;
>      }
>
> -    riscv_cpu_validate_misa_mxl(cpu);
> -
>  #ifndef CONFIG_USER_ONLY
>      CPURISCVState *env =3D &cpu->env;
>      Error *local_err =3D NULL;
> --
> 2.39.2
>
>
