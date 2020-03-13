Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2609477lfc;
        Fri, 13 Mar 2020 13:01:44 -0700 (PDT)
X-Received: by 2002:a67:1601:: with SMTP id 1mr9899168vsw.176.1584129704405;
        Fri, 13 Mar 2020 13:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584129704; cv=none;
        d=google.com; s=arc-20160816;
        b=INEfKmWpUUwsYKDMDfz3rmObzGBEmAXcKSBkCp5FxP97Q1vprE3CvY8BvG4fompxP1
         hSTHd/EJHtzO5SiufETdPaQv5Gum1kOcamvnVIMgDLsD2x0tT83PCFySHOvxWIaEJryd
         06dEbSTMlgELczoJkK175MHL/UBbcCotSrN8kxzZ8VESAPSqeFaDhmjNK7bkEHIypYNo
         m4hGEviKF6eqDpBkraPwoGPGgsuLnEckoXhMabBmwq6YJEl46aosDio9MnFoVYBYPUvS
         UxKNfscb7SVpJTL0EsHOhBal7zkeiDBqhyjXdeWMyNEsKcfVNdqnm/2wp03dvGL3TG5f
         aVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OxHoNj73ij1tyjuFJTobIkE6lc8SgWazEItycwi/oTI=;
        b=YiUCXUr2KloRrq16dGWt5iClwirbYsZ36OX79h3tN1sBWdzmiBlZfI6ypmiTsFK8Bm
         I3+o4qt7r6my14ZpbA/L5JdQgvYkJKuc2h7scE2RZ13X854Ao3/b4S1ufVlYAlVkdvXE
         5Waaa1AcDS6gulDdLtgiO2q/VuuTq37mo6m6MWpHbk/dDNmq1ildSM9SkOp+9AkwZWit
         7JK4gqfwH44dINK07apT62U45f6q9lJzfT74VQZZ/eGgSdKedrIF01ClCpANKSw9EbSZ
         0MGnLACV1jD9THVtYVLSGcpFlfOL7gs/0ku+HG2cDUvqABWZcrtcnGySMXm3kULhphv7
         bBNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dh6JAb0p;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y85sor4753642vkd.52.2020.03.13.13.01.43
        (Google Transport Security);
        Fri, 13 Mar 2020 13:01:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dh6JAb0p;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OxHoNj73ij1tyjuFJTobIkE6lc8SgWazEItycwi/oTI=;
        b=Dh6JAb0pEAJRVSGkkqX+4JIQnLsTxop/96GbXIcrRMAGHx38SoGu8BeCIcR1yzlku1
         0u6auTWKl2S1G7+QAgUqW1m1jamXPO/nW41Dzn9J98ulPHx8erTJt0CLzaNX4Y4rYqt5
         obVGZUWzXH1XdNa7Jf0IUibDPCyWhMCP6ljoioyiLoD99c29ne2LLhEgvQw0vbYPZAqd
         L6qkWigBeyksawJObFPZHou6NYizKgHEd2EwY7w2v+BS77DXsnboF4eZ2OEXbgU8ZTBv
         NLA8gcT0EGoAx4jhKxBcJxOGyYvaVpIbagUkfGWgURILI3u3QH/RAQNOW27wshzYdzA/
         oBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OxHoNj73ij1tyjuFJTobIkE6lc8SgWazEItycwi/oTI=;
        b=Eqqfp0UK3/8DeB4vs3+GiF6sUXZ7uF+b4j/zcHkWMpLdfVinSSOp0ChlMSdTqJ6rNJ
         2ypryhgLfX5x5IPeW0V25cuj/ba1hiXxQzhcqEzc8jfVSHrLFSEICfCHXbw+fgK9eD01
         MI/EZojCVpmaP1FPX1p8RYMB1OUAG4F5xF7BwGmSnT7HXjQG95YVFpySKyGHosBU0EUK
         M9hGnV66ZJFFqGu7h5EDlli5+XMP361nDTpr9A/L+aqJHw4Kw3hCJPV/O7UEyzQjGuvZ
         kBjyDrzrNbPAo5VGN9KjUgHQDGYHsMDJ4kfoYiYYyyiCyfl7kAbGqi5KAkqKaRrJ50uB
         Jq4g==
X-Gm-Message-State: ANhLgQ2KUGt5pb+LvJKxcVjfoSoowOWbW/ErvtD1gWk89EUG9Hn8NuEf
	PQHbjXRbQxrBw5TkWSQhqVOZm7+IBoyBlAOSQLs=
X-Google-Smtp-Source: ADFU+vsEoXiHJ0spy87aO28SJvhnPFTV77ByNwGPD2NaiebUdXeCq6Qe/izPKfPyiVd4BFGmI4bxRsh+HaG3eHWNrwo=
X-Received: by 2002:a1f:c786:: with SMTP id x128mr9958917vkf.77.1584129703525;
 Fri, 13 Mar 2020 13:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200313183652.10258-1-philmd@redhat.com> <20200313183652.10258-8-philmd@redhat.com>
In-Reply-To: <20200313183652.10258-8-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2020 13:01:17 -0700
Message-ID: <CAKmqyKO=f=on17SBu8OmbdJ4SQ=L6==E-tr=ekQuHPkiTzct6Q@mail.gmail.com>
Subject: Re: [PATCH 07/14] target/riscv/cpu: Restrict CPU migration to system-mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, David Hildenbrand <david@redhat.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Cornelia Huck <cohuck@redhat.com>, 
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x <qemu-s390x@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: mILkFLpqjC+7

On Fri, Mar 13, 2020 at 11:39 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c0b7023100..b59e09209e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -475,10 +475,12 @@ static void riscv_cpu_init(Object *obj)
>      cpu_set_cpustate_pointers(cpu);
>  }
>
> +#ifndef CONFIG_USER_ONLY
>  static const VMStateDescription vmstate_riscv_cpu =3D {
>      .name =3D "cpu",
>      .unmigratable =3D 1,
>  };
> +#endif
>
>  static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
> @@ -534,13 +536,13 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>      cc->do_transaction_failed =3D riscv_cpu_do_transaction_failed;
>      cc->do_unaligned_access =3D riscv_cpu_do_unaligned_access;
>      cc->get_phys_page_debug =3D riscv_cpu_get_phys_page_debug;
> +    /* For now, mark unmigratable: */
> +    cc->vmsd =3D &vmstate_riscv_cpu;
>  #endif
>  #ifdef CONFIG_TCG
>      cc->tcg_initialize =3D riscv_translate_init;
>      cc->tlb_fill =3D riscv_cpu_tlb_fill;
>  #endif
> -    /* For now, mark unmigratable: */
> -    cc->vmsd =3D &vmstate_riscv_cpu;
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> --
> 2.21.1
>
>
