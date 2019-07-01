Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2763664wru;
        Mon, 1 Jul 2019 08:19:53 -0700 (PDT)
X-Received: by 2002:aca:450:: with SMTP id 77mr7289620oie.114.1561994393326;
        Mon, 01 Jul 2019 08:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561994393; cv=none;
        d=google.com; s=arc-20160816;
        b=NzhO8ZhREn5LuJW23BcX7Fu52OVLJGoeaA8TG1IED40mdj4BmGbGe2I2u1gDs5YLvn
         BTrjH45/mbtgn/5SKGXZC7wp3kYLfG1ZlRrK3hEoSWAO1jrHmxT/FXMtWQF25xsuQwnC
         fQEBDEbSk6HNJwUKyevCwzJ51yRFhSc4hlKDV0n64WBeBDtPPWOf3mAuXbw50H0yJvNr
         NrHF4OGIyBnH/+3IDV6PDP5/Qakqk0u1/0fDoMAHGjIQZbJbUHkUIrasCAhWBxAcUOhk
         hNxV5dJHsf44xdeEjqafB6MDzUPxuxTKAqOyQ7WP1VhymgX7aOL3RMWIosbZaK+kkvzp
         K1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=88izuRn6GLm/EmQGtulJZg1i2yfV9ZeB3PdO+YNXXoU=;
        b=k92DJfywCx3uQNKuV3p1DDewocJxK59qAPTDfyUfqenbD/3SVyJuXc0hacgLanaixF
         4qfe6qQStaHK9ygB/PfeY8JAEwXCAPAc21OPm0m0e6MPmRKL6VvWDchh3xnlg2d/iXnv
         J+1RAXEfbNIxFfKFm6juKYsask5TSqxCZanfm5zUovqBrZW5q50sa0xtpz4aO1TBf66P
         QQ4W3ysBzs/JdBRa8IYpeoyU3qB62LV9KFhUxXzb8SDoIwQlFtxIqTkI/mBSGx+v/9hi
         0ImDKFKxUpX5lfNnPtSWvTG73Jk5kqq3ii4LivC4XSC3vVMEodjOPzM9lC3IMwSfuGoC
         m+og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UaM9GUSN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u132sor4899358oia.27.2019.07.01.08.19.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2019 08:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UaM9GUSN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=88izuRn6GLm/EmQGtulJZg1i2yfV9ZeB3PdO+YNXXoU=;
        b=UaM9GUSNRSvLuWgOHYBV3RGaMM1ltC/hXydAor6EgaNxD5KG8SEx2lmQcejuO+zGfi
         qmzh0BDMx9QnJff5b9hLUXBNCA7liO7xvYKClBi52IiCGh3pTJmWWLmrK7mwzfZ8lmWX
         NwDEpBFOnexaECf96dCvA9ECUycHtGm8r/FzQCyxiKpHLcvSA9aaqOhXIVdx7M06NDoK
         z/ul2/6ulK1UZEz6bdzERyWkzthUIq7JHkN+CKmdlvnzrqqmj+ELvJFQdIeq0ct66hnq
         bEykwNL6Ss21fU6lSUYG8c072iHKbzVhn8Q5YwDR6SZRyrtwyIOix2aP5PIEp8yzT+rT
         hItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=88izuRn6GLm/EmQGtulJZg1i2yfV9ZeB3PdO+YNXXoU=;
        b=hKEDaMADNgK+9c7c8Ch0ndDHdmv2yJFy8LVg7MLLL4XTTL+65xMY1t+59IOuTVCkgE
         Bg8Bq/K5F2ea0gYdWLdkMPZyag2BI832T3DLe9dGTHbWkcSZG7gjXBK/wfXT8Lw6+xDI
         UOeWJURP2D/35xRB3yeVCtEzZu4aHiHd2M2wJ3HTAmv0SE7+LgQ/P1IHKkhwV+vD0cj7
         vXnGdgihLLZdXAXQZWkRC5UityW+/VTSrbjTY/oUn+DGtnN2iO6zzoHIG4q5e4mJl4Oh
         iXodtvooIMc4+RWH5fSbI0ZiPOOUKsOXTdyH7LPbAEnrCPP0yW7xOGVD8RQoIGR+D0Z7
         INLQ==
X-Gm-Message-State: APjAAAVh9+waKwYCA62/0opNGo7T2yNprtk27re0/xk/rNrS2xMKPpT9
	jYeDvrit2w8h0CxyDlU542Kwsoq7jKOdXuCbhCGsUnHd
X-Google-Smtp-Source: APXvYqzbYS1BvCZjBSoFBGwSGjTzA8eYsybKPAmnmyGxcieu+hxANClVrQ3+0NJjwHxNaaj3jxAds2AASfCrKJ14JZo=
X-Received: by 2002:aca:6185:: with SMTP id v127mr7352429oib.163.1561994392862;
 Mon, 01 Jul 2019 08:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190701132516.26392-1-philmd@redhat.com> <20190701132516.26392-14-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-14-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 16:19:42 +0100
Message-ID: <CAFEAcA8GtFqxRnWS+Gb2GZresBXuJFzXbnEWTnOkUfcumdje9w@mail.gmail.com>
Subject: Re: [PATCH v3 13/27] target/arm: Move debug routines to debug_helper.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Yang Zhong <yang.zhong@intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Rob Bradford <robert.bradford@intel.com>, Samuel Ortiz <sameo@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: H+mtWniRgvk6

On Mon, 1 Jul 2019 at 14:26, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> These routines are TCG specific.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/arm/Makefile.objs  |   2 +-
>  target/arm/cpu.c          |  11 +-
>  target/arm/debug_helper.c | 334 ++++++++++++++++++++++++++++++++++++++
>  target/arm/helper.c       |  23 ---
>  target/arm/op_helper.c    | 295 ---------------------------------
>  5 files changed, 339 insertions(+), 326 deletions(-)
>  create mode 100644 target/arm/debug_helper.c

> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2566,7 +2566,6 @@ static void arm_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      cc->gdb_write_register =3D arm_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
>      cc->do_interrupt =3D arm_cpu_do_interrupt;
> -    cc->get_phys_page_attrs_debug =3D arm_cpu_get_phys_page_attrs_debug;
>      cc->asidx_from_attrs =3D arm_asidx_from_attrs;
>      cc->vmsd =3D &vmstate_arm_cpu;
>      cc->virtio_is_big_endian =3D arm_cpu_virtio_is_big_endian;
> @@ -2578,19 +2577,17 @@ static void arm_cpu_class_init(ObjectClass *oc, v=
oid *data)
>      cc->gdb_arch_name =3D arm_gdb_arch_name;
>      cc->gdb_get_dynamic_xml =3D arm_gdb_get_dynamic_xml;
>      cc->gdb_stop_before_watchpoint =3D true;
> -    cc->debug_excp_handler =3D arm_debug_excp_handler;
> -    cc->debug_check_watchpoint =3D arm_debug_check_watchpoint;
> -#if !defined(CONFIG_USER_ONLY)
> -    cc->adjust_watchpoint_address =3D arm_adjust_watchpoint_address;
> -#endif
> -
>      cc->disas_set_info =3D arm_disas_set_info;
>  #ifdef CONFIG_TCG
>      cc->tcg_initialize =3D arm_translate_init;
>      cc->tlb_fill =3D arm_cpu_tlb_fill;
> +    cc->debug_excp_handler =3D arm_debug_excp_handler;
> +    cc->debug_check_watchpoint =3D arm_debug_check_watchpoint;
>  #if !defined(CONFIG_USER_ONLY)
>      cc->do_unaligned_access =3D arm_cpu_do_unaligned_access;
>      cc->do_transaction_failed =3D arm_cpu_do_transaction_failed;
> +    cc->adjust_watchpoint_address =3D arm_adjust_watchpoint_address;
> +    cc->get_phys_page_attrs_debug =3D arm_cpu_get_phys_page_attrs_debug;
>  #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */

I don't think get_phys_page_attrs_debug is TCG specific -- anything
that wants to do a virt-to-phys translation will use it, including
for instance cpu_memory_rw_debug() or the monitor gva2gpa command.
target/i386/cpu.c doesn't put its cc->get_phys_page_debug assignment
inside a CONFIG_TCG ifdef.

thanks
-- PMM
