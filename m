Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3144222njc;
        Tue, 5 Nov 2024 14:14:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWnlTN00mk9nV+/3adnM/uoQiQShkdNeL3nqvYL3R23V/0jyYBiwp2RVqK+r5GKgAiF34KYbi5q7LYG5g==@linaro.org
X-Google-Smtp-Source: AGHT+IFUNDL0HZp0LRoLboXlM7PLHmUqQj7vaob+Dk5z4PKjLmUqsaplxOlO0BsPldHpOfNPRoS5
X-Received: by 2002:a05:6214:4585:b0:6d1:8672:fd71 with SMTP id 6a1803df08f44-6d351a8f5b0mr330270846d6.6.1730844877766;
        Tue, 05 Nov 2024 14:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730844877; cv=none;
        d=google.com; s=arc-20240605;
        b=Fvi7CptPgUpdMcLq4agd7uwNx4YZvw8r16FNO0T53M3/czT6GkNDaFDJs/dPAKc9sK
         m7jtqR19Ko0lNTBysnRmc9eIZzkoz0uRC42zVxo0cAcNU7rZ+81FavZmwR57hhNaCN8+
         0XehpQfVPsgd+AsPQ/H0zmvX1UTXu5l7XkTZ0EBhr26O8sG7459P3dWH8COU2Pt8vwuA
         OXPJARP6ILQUJhS3c+9UgUqNf/IXt9i7klqq1fUceSlyhYrdx5aUXf63YVrBPfoCmtVI
         ZlvNS2AyG2nLWKDo9DhrclAPVbXeGJNUq2avEYAZN9lLuhg94Ke9+kDLmQnCV/ah9dCg
         OEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0AxF33yov5xMnc1Sy0Cc/fToN7BpkNuv1fqGM0EUXLw=;
        fh=E1bfdoZqDILqaAIAziddPCjcFVhSKjcNypQMHX5Secw=;
        b=TYfyGpWqnOg0Nc2yi5CwVO6QoVCzFw6kC0lXbjeWjMm7Y+YdOzStAg+4GCUQ+thiRx
         JPSSA/Atq7bOVaO7SEtA+dGXhH5yeG3qRTlMkqzsdyXeQMcWFrAE1tVugeaTLbuqKBd7
         au39PwXmbOSDnJXVeB3iFgz+4ZEDS5L5eHRyUAqVaTHK2DAIIqRIjxkHe0jMBarjaub6
         NdYYU0fgT2akxJGU34Hj7IS7PUi3J3qPc58vTbIWurYhLK6GyTIycwx3r6PMKqmGwN9/
         P0RTaK+Rv6Ym63Khi+I/2VrL81ZvOZOA6/Wx11l8pplIbN3V3y/Ch47h1W2cna2ABGsN
         LDjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=I1jL5LeM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fd073csi141685686d6.155.2024.11.05.14.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 14:14:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=I1jL5LeM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8RoK-00088J-K3; Tue, 05 Nov 2024 17:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8RoI-00087j-Q1; Tue, 05 Nov 2024 17:14:02 -0500
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8RoH-0006my-0N; Tue, 05 Nov 2024 17:14:02 -0500
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-512259c860eso1792355e0c.2; 
 Tue, 05 Nov 2024 14:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730844839; x=1731449639; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0AxF33yov5xMnc1Sy0Cc/fToN7BpkNuv1fqGM0EUXLw=;
 b=I1jL5LeMpOmS+DA/WZkiYJ74aigfpZbXwnW+0ukd7IFlA+kX8Bn5/l4DXVXV6AwKPn
 YwpErdK3WoQOkcqrMEdk0/zlUt8lalMgrYGEwbnhWP3LBUlLrj9TmxH+OobLBVj++QLr
 1YO+pwPl0mH5HdWKzTUVZpPs1M3e1ZkYO3xX8k9kIFIqyXtNl3UGPzPS8hpzm85tnYKP
 AeXCJVrVwgzn4WTEZjjYyNDBrlQF3guVREYZpnmTpdhSY+YMiWecSEFZZDp0xRSl/+sm
 GeTLsaOetwWUOqXd3MCOpjbcIq5GTb9/SwrgxBk7GGnZKEN1kE5EUC3dq2bh6QDMPtQB
 mAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730844839; x=1731449639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0AxF33yov5xMnc1Sy0Cc/fToN7BpkNuv1fqGM0EUXLw=;
 b=DWvjrUDiPmoYAlQ991p+In+O8Ic2qp0fXsvJosYkNUhwNoboshhUflIJ4AzPzXOl/T
 4ysDr1OM9G4udvQFmy7BnxPHBdq2y+/vUW/UxuPBi8rTfnTXYZddYv17yTeiJoT/L2hl
 FWiSqGTOYLIzz01thpRX2n3cbLkIBmiN+d+bZeh53WH0XA4r8oVkr3pc0V2a9RbGwo6G
 Nj7ZR9FEejy+CBhdl42C5jQ6A1Z2/f7n0uhedWQx2Y/old71LbCGLuZIE5R5zDq+8iaM
 QaFUQk9sIYG1NrWEuw3YU9txrabXtoBSsLMEuCnk6zmGAikCA8uwGGgaEITkG8lo127q
 VfRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVApSQQKt3M67C6jl9xR/M3KVSRwSEze1YVKJc1nWS6G/vWDZIdUEUtGrEU198OkkBpVyOqNrePgg==@nongnu.org
X-Gm-Message-State: AOJu0YxZS+nn2bB4nnM3SU85qbrmWvCtNvuvygGldDr6Gh4qtcZziKo0
 Tz0aiC3VFQkpUOsFPzo9ymvvCScapzWQlJWvoDE+2JmPfPNBOJuyeqKpbP3/e7EbE2vC9RmY6IU
 ThKdxzLDFHHfNFXHO3bjA3rb9Dkw=
X-Received: by 2002:a05:6122:1d4c:b0:50d:a31c:678c with SMTP id
 71dfb90a1353d-5106ae6d944mr21304116e0c.2.1730844839208; Tue, 05 Nov 2024
 14:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-9-philmd@linaro.org>
In-Reply-To: <20241105130431.22564-9-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Nov 2024 08:13:33 +1000
Message-ID: <CAKmqyKP-hyLzhLV9hzVrtByxOd1Wtcvv14YNmdRDJcmX13fLXw@mail.gmail.com>
Subject: Re: [PATCH 08/19] hw/microblaze: Propagate CPU endianness to
 microblaze_load_kernel()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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
X-TUID: Dci6R+mhDfnj

On Tue, Nov 5, 2024 at 11:06=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Pass vCPU endianness as argument so we can load kernels
> with different endianness (different from the qemu-system-binary
> builtin one).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/microblaze/boot.h                     | 4 ++--
>  hw/microblaze/boot.c                     | 8 ++++----
>  hw/microblaze/petalogix_ml605_mmu.c      | 2 +-
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 2 +-
>  hw/microblaze/xlnx-zynqmp-pmu.c          | 2 +-
>  5 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/hw/microblaze/boot.h b/hw/microblaze/boot.h
> index 5a8c2f79750..d179a551a69 100644
> --- a/hw/microblaze/boot.h
> +++ b/hw/microblaze/boot.h
> @@ -2,8 +2,8 @@
>  #define MICROBLAZE_BOOT_H
>
>
> -void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
> -                            uint32_t ramsize,
> +void microblaze_load_kernel(MicroBlazeCPU *cpu, bool is_little_endian,
> +                            hwaddr ddr_base, uint32_t ramsize,
>                              const char *initrd_filename,
>                              const char *dtb_filename,
>                              void (*machine_cpu_reset)(MicroBlazeCPU *));
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index ed61e483ee8..3675489fa5b 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -114,8 +114,8 @@ static uint64_t translate_kernel_address(void *opaque=
, uint64_t addr)
>      return addr - 0x30000000LL;
>  }
>
> -void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
> -                            uint32_t ramsize,
> +void microblaze_load_kernel(MicroBlazeCPU *cpu, bool is_little_endian,
> +                            hwaddr ddr_base, uint32_t ramsize,
>                              const char *initrd_filename,
>                              const char *dtb_filename,
>                              void (*machine_cpu_reset)(MicroBlazeCPU *))
> @@ -144,13 +144,13 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwa=
ddr ddr_base,
>          /* Boots a kernel elf binary.  */
>          kernel_size =3D load_elf(kernel_filename, NULL, NULL, NULL,
>                                 &entry, NULL, &high, NULL,
> -                               TARGET_BIG_ENDIAN, EM_MICROBLAZE, 0, 0);
> +                               !is_little_endian, EM_MICROBLAZE, 0, 0);
>          base32 =3D entry;
>          if (base32 =3D=3D 0xc0000000) {
>              kernel_size =3D load_elf(kernel_filename, NULL,
>                                     translate_kernel_address, NULL,
>                                     &entry, NULL, NULL, NULL,
> -                                   TARGET_BIG_ENDIAN, EM_MICROBLAZE, 0, =
0);
> +                                   !is_little_endian, EM_MICROBLAZE, 0, =
0);
>          }
>          /* Always boot into physical ram.  */
>          boot_info.bootstrap_pc =3D (uint32_t)entry;
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogi=
x_ml605_mmu.c
> index 61e47d83988..d2b2109065d 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -204,7 +204,7 @@ petalogix_ml605_init(MachineState *machine)
>      cpu->cfg.pvr_regs[5] =3D 0xc56be000;
>      cpu->cfg.pvr_regs[10] =3D 0x0e000000; /* virtex 6 */
>
> -    microblaze_load_kernel(cpu, MEMORY_BASEADDR, ram_size,
> +    microblaze_load_kernel(cpu, true, MEMORY_BASEADDR, ram_size,
>                             machine->initrd_filename,
>                             BINARY_DEVICE_TREE_FILE,
>                             NULL);
> diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/pet=
alogix_s3adsp1800_mmu.c
> index 6c0f5c6c651..8110be83715 100644
> --- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
> +++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
> @@ -129,7 +129,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
>
>      create_unimplemented_device("xps_gpio", GPIO_BASEADDR, 0x10000);
>
> -    microblaze_load_kernel(cpu, ddr_base, ram_size,
> +    microblaze_load_kernel(cpu, !TARGET_BIG_ENDIAN, ddr_base, ram_size,
>                             machine->initrd_filename,
>                             BINARY_DEVICE_TREE_FILE,
>                             NULL);
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-=
pmu.c
> index 567aad47bfc..bdbf7328bf4 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -172,7 +172,7 @@ static void xlnx_zynqmp_pmu_init(MachineState *machin=
e)
>      qdev_realize(DEVICE(pmu), NULL, &error_fatal);
>
>      /* Load the kernel */
> -    microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
> +    microblaze_load_kernel(&pmu->cpu, true, XLNX_ZYNQMP_PMU_RAM_ADDR,
>                             machine->ram_size,
>                             machine->initrd_filename,
>                             machine->dtb,
> --
> 2.45.2
>
>
