Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp512023ejr;
        Tue, 10 Oct 2023 17:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAuyGPl/w7WOzd2GQtSgwNqyTqoNcH/uxKs3Ehq4bK8WV09k8qcRCxKO1gLmF46yEs3DqM
X-Received: by 2002:a05:6214:4111:b0:655:71df:4c7d with SMTP id kc17-20020a056214411100b0065571df4c7dmr27585720qvb.56.1696985266547;
        Tue, 10 Oct 2023 17:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696985266; cv=none;
        d=google.com; s=arc-20160816;
        b=a4Yi4gQA07JdPoa0XLXGFt4WEjWME6ySQSarrnNwaPD69z03gh3oIATuLdg5PlO1ri
         uQIUVmT/hMK8owqV5HJgFymbMPbwBOac/UOsNCWeh4KP9yOIu9hNyZatp8rWrY5kJENU
         AOtGIUePJ2QXOhghsBJC8EBw/gu6N9sDdT5q9MdQ8iJuccgI04E9HDzw+YZoUyq7ml2Q
         Zx/adfj6YCq9nmMgWq+AaHXgH7e67JbZdJnn3T7eGlc64ZU7wPYb4nAGObeiWy2BLs2O
         3DruVEvAzC84xOsOCrU8BgvJSGNOEowr0my88HvwHKdvH2jN/zQIi9f5M647eCqkEMy0
         HLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gAHR2WuVCJ5lpEHqHqIqxiFmRsRdzXEUhWgWbPR6lfQ=;
        fh=GuttRoh/dbc6Ytf4SNNzvTdj2qe+x2ndtpl22x1jDzo=;
        b=LQ6QNLAyE1RvzSlrAB7C4l6M5zuGRK8ezjdkV/PbcTu2zvQuj7i6U3YOmMjfARf1Kr
         M1wMcSAd85Q4jJOphe2+g55Ccbgu2j3OhXbLh0oucMdzhlSHJLt6nR9C+T4EKvpvUxNO
         sRKR0FrEvH/Vg6taFAnoxHdTpBXnjfKKZt/7OSH+PY+r4Duy4AMq3GHq4ASYHvHbEGsz
         sy1oa7+mlLqkkX7qroS8opHwwkCV5s+8F/qoaqtNsUuZyKn+7cFeU9zrVmcohIA0ZfV5
         XZiz4Gn+DMKgJdZC2Fw2bmDnIUJIRTi5Ck1an+gmTA0mj9ytOtGSUEBOruqWpVJH5tgT
         mPhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dIwXCe+T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3-20020a0cf583000000b0064f3f7850d2si8447939qvm.90.2023.10.10.17.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 17:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dIwXCe+T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqNNk-00046a-Si; Tue, 10 Oct 2023 20:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNNi-00045p-8s; Tue, 10 Oct 2023 20:47:22 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNNg-0002ZU-DM; Tue, 10 Oct 2023 20:47:21 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7b5fe8ab5f9so546339241.3; 
 Tue, 10 Oct 2023 17:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696985234; x=1697590034; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gAHR2WuVCJ5lpEHqHqIqxiFmRsRdzXEUhWgWbPR6lfQ=;
 b=dIwXCe+TZML0w2Kp4kJ/xY3xt945ESJEAxRiDN3zJHyUtHOL6M23vtCgxOhP9M6/8B
 obWxJkUtKyYOC3qq3GSgaQs7DjqITn4kUJSnSASV/rALzOuBaeKrFBSPsB6Zx3vyOUZk
 ry7GcBK0+fs9q4a/9++U4ikvgipJb1ykj6Y9MZsx20czUQ3yVuppXmNFNUbnZuQAKFlG
 rOFXdy0auSe5mmhmWs46g17EjSdK3A0TTu2Rl8z0dQ+bprw0pLOQBrXu4by9WRS/aDys
 jTC781XJIRYocA1InlHWCj8WAH3EU6RfhL03xJ+SXCbcFkjWfkVgfz5V5oLjb6IQE3V3
 VtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696985234; x=1697590034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gAHR2WuVCJ5lpEHqHqIqxiFmRsRdzXEUhWgWbPR6lfQ=;
 b=OBjS/6Ayybb4KsyBzKJzq58ASkXrpNn3s6XWNnve5J/eINZ5jP5gFhj9+M3O12zuoE
 pto0Xr9r9IsARDWl7b5PLrOj2MYrPFKX2j/qT8QdRBJa9Icxb0Cp0j8LvY/UC8/qbDdT
 +iNR9kO75FvF8QjFBoHIQhBTTmh88PlUrbDbXBHsw5PEfAGQwz5W8Oq1rpgM2AVoC6yT
 eRbA8UNPrioSUnDTCGoyC9JqvL1rvy8DcWVNl8o8bOs+IYfWxu3T27mhR+frlGsEdFgK
 OXYDxovDYmfThyVCpYoAW5LIneSU/b5czFx+3OaRsgLeNCqDAOzvN5gsb2+uSx4YUOZF
 K7UA==
X-Gm-Message-State: AOJu0Yyu7imUw4aw832qZJ/xmwv2UAaooR5+i/3x9E6SmVJQHKQeEyVP
 WRKE3fHPVKOeW50aR5IOYVnCAY65XdpxEwSWRoo=
X-Received: by 2002:a1f:ca83:0:b0:48d:2bcf:f959 with SMTP id
 a125-20020a1fca83000000b0048d2bcff959mr16438241vkg.3.1696985234201; Tue, 10
 Oct 2023 17:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231010092901.99189-1-philmd@linaro.org>
 <20231010092901.99189-11-philmd@linaro.org>
In-Reply-To: <20231010092901.99189-11-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 10:46:47 +1000
Message-ID: <CAKmqyKOcNPmpTU_egSxjHO5yvM9XjQd3d4+G8XWnxnCrparNaQ@mail.gmail.com>
Subject: Re: [PATCH 10/18] target/riscv: Inline target specific
 TYPE_RISCV_CPU_BASE definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>,
 qemu-riscv@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, Marek Vasut <marex@denx.de>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, 
 Michael Rolnik <mrolnik@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, 
 Stafford Horne <shorne@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, 
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6M1OPqUTEQ7X

On Tue, Oct 10, 2023 at 7:32=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> TYPE_RISCV_CPU_BASE depends on the TARGET_RISCV32/TARGET_RISCV64
> definitions which are target specific. Such target specific
> definition taints "cpu-qom.h".
>
> Since "cpu-qom.h" must be target agnostic, remove its target
> specific definition uses by inlining TYPE_RISCV_CPU_BASE in the
> two machines using it.
>
> "target/riscv/cpu-qom.h" is now fully target agnostic.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu-qom.h | 8 +-------
>  hw/riscv/spike.c       | 8 +++++++-
>  hw/riscv/virt.c        | 8 +++++++-
>  3 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 8cb67b84a4..f607687384 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU RISC-V CPU QOM header
> + * QEMU RISC-V CPU QOM header (target agnostic)
>   *
>   * Copyright (c) 2023 Ventana Micro Systems Inc.
>   *
> @@ -43,12 +43,6 @@
>  #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
>  #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>
> -#if defined(TARGET_RISCV32)
> -# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
> -#elif defined(TARGET_RISCV64)
> -# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
> -#endif
> -
>  typedef struct CPUArchState CPURISCVState;
>
>  OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 81f7e53aed..eae49da6d6 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -349,7 +349,13 @@ static void spike_machine_class_init(ObjectClass *oc=
, void *data)
>      mc->init =3D spike_board_init;
>      mc->max_cpus =3D SPIKE_CPUS_MAX;
>      mc->is_default =3D true;
> -    mc->default_cpu_type =3D TYPE_RISCV_CPU_BASE;
> +#if defined(TARGET_RISCV32)
> +    mc->default_cpu_type =3D TYPE_RISCV_CPU_BASE32;
> +#elif defined(TARGET_RISCV64)
> +    mc->default_cpu_type =3D TYPE_RISCV_CPU_BASE64;
> +#else
> +#error unsupported target
> +#endif
>      mc->possible_cpu_arch_ids =3D riscv_numa_possible_cpu_arch_ids;
>      mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5edc1d98d2..620a4e5f07 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1685,7 +1685,13 @@ static void virt_machine_class_init(ObjectClass *o=
c, void *data)
>      mc->desc =3D "RISC-V VirtIO board";
>      mc->init =3D virt_machine_init;
>      mc->max_cpus =3D VIRT_CPUS_MAX;
> -    mc->default_cpu_type =3D TYPE_RISCV_CPU_BASE;
> +#if defined(TARGET_RISCV32)
> +    mc->default_cpu_type =3D TYPE_RISCV_CPU_BASE32;
> +#elif defined(TARGET_RISCV64)
> +    mc->default_cpu_type =3D TYPE_RISCV_CPU_BASE64;
> +#else
> +#error unsupported target
> +#endif
>      mc->pci_allow_0_address =3D true;
>      mc->possible_cpu_arch_ids =3D riscv_numa_possible_cpu_arch_ids;
>      mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
> --
> 2.41.0
>
>
