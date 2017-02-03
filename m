Received: by 10.25.77.65 with SMTP id a62csp560696lfb;
        Fri, 3 Feb 2017 03:19:25 -0800 (PST)
X-Received: by 10.28.218.4 with SMTP id r4mr886112wmg.105.1486120765567;
        Fri, 03 Feb 2017 03:19:25 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com. [2a00:1450:400c:c09::236])
        by mx.google.com with ESMTPS id y65si1854388wmb.78.2017.02.03.03.19.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2017 03:19:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) client-ip=2a00:1450:400c:c09::236;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x236.google.com with SMTP id b65so23741315wmf.0
        for <alex.bennee@linaro.org>; Fri, 03 Feb 2017 03:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PR9JysGIsX3sZHQ/JJ1K9Z7yvLSfgQUQivCMmK9JYHk=;
        b=TWXY9pNwzgvWV8Lag73XbTdaBNWfuYhp2n81deaDpZelRGawbAWD8T680efXsPZ4Lw
         Ne8meEKXiVCp8uD83H+htR6+UW0ezyEwVcBVeJZtTjahPQklPqRVy7BcB8XdVltZSXhT
         g6Op/5ptVjPV0xPasP9tKJOx5vR34V0POPPsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PR9JysGIsX3sZHQ/JJ1K9Z7yvLSfgQUQivCMmK9JYHk=;
        b=YafarpD+n1T8A5sHfGQHb3xNdZaBWjKVMmW6xJetkNM4N1H/2UiSflNIK6RoFHUUb/
         Lf0q+iLdKbLN2o64bFP38XrSoY5pJzQjKI7Mfm24IvUomwe+lFtLOpBtMRTx/Oa0to+8
         JRGqo83o6PVBGGCGE9+N+RE5pSogLK/yF+AxLNCv4QtoOhuTwkRoBC+pNWxIdtD7MOYt
         esJUfyClvZnN7oAc57jcnLW9YtDOP39sEArUmZ55GgmB/LTVievZsNagkicPZxlnf036
         IcPAlyX6sIjVosHvlqGHU2iOpXvfOA37FtRmhkOWG3Gg1eWwWDZ9rnglh2rIctM9Pcn2
         l79w==
X-Gm-Message-State: AMke39mNjNXGxXnYhq6nkBTXJ2IWynZSblneiX7a70cTu6hznnDAIN4deXnXos04E1zlC/7T9YnUgZ8g0bhFcSinhPc=
X-Received: by 10.28.91.16 with SMTP id p16mr897336wmb.111.1486120765270; Fri,
 03 Feb 2017 03:19:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 03:19:04 -0800 (PST)
In-Reply-To: <20170201150553.9381-23-alex.bennee@linaro.org>
References: <20170201150553.9381-1-alex.bennee@linaro.org> <20170201150553.9381-23-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 11:19:04 +0000
Message-ID: <CAFEAcA9JqYs06T5QdP8jADFNJsuDQfY_xWWJqJkMm1Zar=wOmg@mail.gmail.com>
Subject: Re: [PATCH v9 22/25] target-arm/cpu.h: make ARM_CP defined consistent
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
X-TUID: V7UiM+G6DpiM

On 1 February 2017 at 15:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> This is a purely mechanical change to make the ARM_CP flags neatly
> align and use a consistent format so it is easier to see which bit
> each flag is.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.h | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 39bff86daf..d61793ca06 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1452,20 +1452,20 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t c=
pregid)
>   * need to be surrounded by gen_io_start()/gen_io_end(). In particular,
>   * registers which implement clocks or timers require this.
>   */
> -#define ARM_CP_SPECIAL 1
> -#define ARM_CP_CONST 2
> -#define ARM_CP_64BIT 4
> -#define ARM_CP_SUPPRESS_TB_END 8
> -#define ARM_CP_OVERRIDE 16
> -#define ARM_CP_ALIAS 32
> -#define ARM_CP_IO 64
> -#define ARM_CP_NO_RAW 128
> -#define ARM_CP_NOP (ARM_CP_SPECIAL | (1 << 8))
> -#define ARM_CP_WFI (ARM_CP_SPECIAL | (2 << 8))
> -#define ARM_CP_NZCV (ARM_CP_SPECIAL | (3 << 8))
> -#define ARM_CP_CURRENTEL (ARM_CP_SPECIAL | (4 << 8))
> -#define ARM_CP_DC_ZVA (ARM_CP_SPECIAL | (5 << 8))
> -#define ARM_LAST_SPECIAL ARM_CP_DC_ZVA
> +#define ARM_CP_SPECIAL         (1 << 0)
> +#define ARM_CP_CONST           (1 << 1)
> +#define ARM_CP_64BIT           (1 << 2)
> +#define ARM_CP_SUPPRESS_TB_END (1 << 3)
> +#define ARM_CP_OVERRIDE        (1 << 4)
> +#define ARM_CP_ALIAS           (1 << 5)
> +#define ARM_CP_IO              (1 << 6)
> +#define ARM_CP_NO_RAW          (1 << 7)
> +#define ARM_CP_NOP             (ARM_CP_SPECIAL | (1 << 8))
> +#define ARM_CP_WFI             (ARM_CP_SPECIAL | (2 << 8))
> +#define ARM_CP_NZCV            (ARM_CP_SPECIAL | (3 << 8))
> +#define ARM_CP_CURRENTEL       (ARM_CP_SPECIAL | (4 << 8))
> +#define ARM_CP_DC_ZVA          (ARM_CP_SPECIAL | (5 << 8))
> +#define ARM_LAST_SPECIAL       ARM_CP_DC_ZVA
>  /* Used only as a terminator for ARMCPRegInfo lists */
>  #define ARM_CP_SENTINEL 0xffff
>  /* Mask of only the flag bits in a type field */

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
