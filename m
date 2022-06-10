Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1233342lfb;
        Fri, 10 Jun 2022 09:03:33 -0700 (PDT)
X-Received: by 2002:a0d:cb17:0:b0:313:caaa:7839 with SMTP id n23-20020a0dcb17000000b00313caaa7839mr1755612ywd.10.1654877013261;
        Fri, 10 Jun 2022 09:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654877013; cv=none;
        d=google.com; s=arc-20160816;
        b=ABsxmr7sXWMH9dDH9+zI7uhToo2Bv4kvg9i5ANO5zpW47MyCQUuxW2YS/Yq4rH9T02
         geq49EJ4wF3Vtut5MP2YNDGWDbOVlMtWklzA4KhpH6LrMB8QU5kt01AnsYmpMukafOgg
         56NL1l1C9CTuslwEfQwgT96LWfCtpwbmukiSlso+7ExR7XPNTxI1Pitl591IMyY8UQTb
         xiZsuVfG4yaiJPgJ3yZc6ypTZXZBOAL+NWY8zDfsLqh9rXIjpr6SZkbGPsyyG03HHlSk
         /k7BlZ6ZyB+MH0O6B6LCrzJGEi/GsvMGSgrleEusKSaTXG6n45HqYD780hVEdwnVLm0D
         nBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDLHMZIPgdmwO9gpUPBaTey1FMyJ0vxqN5vtllRnXt4=;
        b=j/OzkKhHpVaBguUUWfJL4xtasXMCNfTZoEW7BtxKVETo5JGfaw0U3pkdWVjAXgLeGb
         iP66E0o2ddUtY6KjNp2PHR9rqZdQCQFMUyeV71XBZk2JMNSxL/2gp8/gQCEN3mJK1oT2
         MNqRYZihLtY1c5vbJmc1l9653OU1ez1hsTQtzaAs+c4OsG5jReQ3xS7oxP/m7fh2rsz6
         z7wyAPtF/JwRk3qG7iRIdeuwFLJT4oOHUQdJ5B2entnSMxuRk6Ja+8G3hc75YH42JFnr
         YtfWjHzIug09PT0XoaqYEBQw/EQn0jy6Tz3Y9hO83PorEazBL/BmnqQfYW1kKiCQbLYD
         Kwtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k8G75+Vc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e7-20020a811e07000000b003132da32f56sor4282853ywe.37.2022.06.10.09.03.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jun 2022 09:03:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k8G75+Vc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tDLHMZIPgdmwO9gpUPBaTey1FMyJ0vxqN5vtllRnXt4=;
        b=k8G75+Vc5IwNjUutMandQoLQ/RE3jisXUbU6OaKGdIoqSuCpiZ5KN68TXD3LTJgwFV
         dnCv282szREWA7HFk8gRQ9wQQPHUYPt1bzb6Gqo5XYF7dqVoaAhuXvRGReySGlNFdQMR
         iYw6Vd9rPFOzAba4fV1chCbYRMkDbbKyomNiZcVjH9gU5alP+Iq0P6ED+VzbdMAjB6LR
         XbJg6LvUtYJyd9qBGNvYinRfSo0/xKehUQ2Fd6EiIImKjMZEEIa53q67M/wLGIvBLqXS
         bAH/kM/baJ/Tx1f7tMZPLpdXsuyQw2wzsJj0NjD1hxKf/xq9iJsnc3ryCGkWTiFFrXfn
         ZhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tDLHMZIPgdmwO9gpUPBaTey1FMyJ0vxqN5vtllRnXt4=;
        b=XdkQvL5UgfS49h36GwjtIfye3BmGeyjFttL9s3IccSCS/NCx7Hc8BqpJz3TsXpeTC5
         eWzKXVvx6BHW3N4mjcTv5skzotOOcxzDe7c/HkEMtVTrB8sLSJfydJARGxdUsuWlXsjB
         2HhDvbH56wYI6t8rnktwX1OqN+v4nuJLkKKGfOGV+Gig7HDcMz7ftw/CmzuXU2KLM7gp
         N+SmBrrxpB57OigBMtgJXRZ6sEZ11yypmGI5/jUkwxW30JpMUfg11aQTYJPe6uLOehwt
         /fTYcle7DmC7cFBwMMuHPs4z+rWnnsRY4mvEb/XlP4ZKatqAm6NhqXLERlYpUWl5DTfw
         I0hg==
X-Gm-Message-State: AOAM533p+UGTiU6OYQuuIrepbohrpcREii75mP/BtfAYHovm4TddN1wZ
	FmoKTZI+fzZU8JA5khLaGfk2daaThyaMQKSayw8FJHg4zFf+3Q==
X-Google-Smtp-Source: ABdhPJw0zA9LzuYrUvgXHQ/BcgMM7Issa0TwnTGmisaRf97DbH8nHNl0S3rxyxjPee9Uj9dJVyZG81WTGOC/yp8POFc=
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr47584116ywb.64.1654877012686; Fri, 10
 Jun 2022 09:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220610154036.1253158-1-alex.bennee@linaro.org>
In-Reply-To: <20220610154036.1253158-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 17:03:22 +0100
Message-ID: <CAFEAcA9B1NJs4F_LVQ6FomJ0KMVZ-OFwYNjd5_=veYCNTd8tiw@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: de-duplicate our register XML definitions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, agorglouk@gmail.com, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FkoLvJbqjZak

On Fri, 10 Jun 2022 at 16:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We generate the XML for each vCPU we create which for heavily threaded
> linux-user runs can add up to a lot of memory. Unfortunately we can't
> only do it once as we may have vCPUs with different capabilities in
> different cores but we can at least free duplicate definitions if we
> find them.

How big actually is the XML here? 400 bytes? 4K? 40K? 400K?

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1070
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Can we defer the work until/unless gdb actually asks for it?

I have some details-of-the-code comments below, but first:
does gdb even support having the XML for each CPU be different?
Our gdbstub.c seems to always ask for the XML only for the first
CPU in the "process". If gdb does support heterogenous CPU XML,
does it require that different XML descriptions have different
names? We always call them system-registers.xml and sve-registers.xml
regardless of whether different CPUs might have different contents
for those XML blobs...

> ---
>  target/arm/gdbstub.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 2f806512d0..85ef6dc6db 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -318,7 +318,24 @@ int arm_gen_dynamic_sysreg_xml(CPUState *cs, int bas=
e_reg)
>      g_string_append_printf(s, "<feature name=3D\"org.qemu.gdb.arm.sys.re=
gs\">");
>      g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, &par=
am);
>      g_string_append_printf(s, "</feature>");
> -    cpu->dyn_sysreg_xml.desc =3D g_string_free(s, false);
> +
> +    /* De-duplicate system register descriptions */
> +    if (cs !=3D first_cpu) {
> +        CPUState *other_cs;
> +        CPU_FOREACH(other_cs) {
> +            ARMCPU *other_arm =3D ARM_CPU(other_cs);
> +            if (g_strcmp0(other_arm->dyn_sysreg_xml.desc, s->str) =3D=3D=
 0) {

If you check whether the dyn_sysreg_xml.num matches first, that will
probably be a much faster way of checking in almost all cases than
doing the strcmp on the however-long-it-is XML string: it seems unlikely
that in a heterogenous config the CPUs will manage to have exactly the
same number of registers.

If you have a setup with, say, 4 CPUs of type X and then 4 of type Y,
for every type Y CPU this loop will do the strcmp of Y's XML against
the type X XML for cpu 0, then again for 1, then again for 2, then for 3,
even though in theory we already know at that point that 0,1,2,3 all
have the same XML and so if it didn't match for cpu 0 it won't match
for 1,2,3...  But maybe the comparison against the number-of-registers
saves us from having to try to optimise that away.

> +                cpu->dyn_sysreg_xml.desc =3D other_arm->dyn_sysreg_xml.d=
esc;
> +                g_string_free(s, true);
> +                s =3D NULL;
> +                break;
> +            }
> +        }
> +    }
> +
> +    if (s) {
> +        cpu->dyn_sysreg_xml.desc =3D g_string_free(s, false);
> +    }
>      return cpu->dyn_sysreg_xml.num;
>  }

-- PMM
