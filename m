Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp321689ejb;
        Wed, 14 Feb 2024 19:30:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXmIMbPihmxEtsdwOUJofTmDevh0E0n5ibPeJWupwE2mibaeQUV8p+wBehl4pB+5/NgMfljfxwOB2g3dvsFPq0jhq8rw1ew
X-Google-Smtp-Source: AGHT+IGxarNCd40xFfDPxELngNF7vPm25/gJAXnfu/UB2ywdHPm0DbY1FLf3m0dWjU3nJ87NZq+N
X-Received: by 2002:a05:620a:51d8:b0:787:1c36:4fc5 with SMTP id cx24-20020a05620a51d800b007871c364fc5mr652534qkb.64.1707967823941;
        Wed, 14 Feb 2024 19:30:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707967823; cv=none;
        d=google.com; s=arc-20160816;
        b=cdkruKrEHZHG1KWtelj269wKnO83DYioMUnDy4St/EueovIX96UwGHsVjDg7kcytPL
         lSQtqWREZIybQ042DiWxCtAAM99+hUx7N3rDiQ31gLV6bqPe/OSyvHmWvvDeL7h0HNY1
         FOVoc0HOL9pMz9C29YcW9L+oozgm/y2raSelk+rGbBMrgP/jF6pEYaslJ23FEEgXuqK3
         sp0YAqsCXP6KXqoj8sllLSkhkmMd+DNM/k4pBzQMJOpIhgWueWLy5wc/387GC7aeN4TI
         h69NAG4K7BZkFw65UB4nreEjeVxf37gIkwmtZt5AeAuqIe7AWDew7EsKk+pmI+I0GaLh
         KSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RNGomPDX6/n0GPJQ2om3EaZPlyvRLiZOS+MVM+WRFv0=;
        fh=ODzBmRKY0PMbnxrm44s9mAHvuYsrR6969FfzvOh9Yis=;
        b=X9nFfmjzI9/IyiK6V3WwmpKOzmgLjRuzHIJwIUS/asYF60qC5qBd6xghPs4nFCfRnC
         rwth0fq9HJqUW4g0oFoYnP7aiV7PqdmL+wdHCRdybv09NBxE7Vc6IMv3fcs1msYE8lhI
         gOveeENTE09IPNj5xCxG2e9xaDefv39N5WBmqWl4bbT2xB1atsdvFsuKgJPvOaSbMdG5
         Dn8PxLmvDyApLZF+LofnEDeFtXCcxR9Lx5PEpdMwvrkwzGiOAHJ50td+0jFkA9Lw7x7G
         km8RdXwHnH8SgICRK1DBH+vODH86dczHxb2O0Fs5V1VHbL3YPsfDv0dielT2FpktV/ip
         xxKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LV1YdWHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk2-20020a05620a1a0200b00786cb786cb7si657002qkb.499.2024.02.14.19.30.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Feb 2024 19:30:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LV1YdWHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raSRx-0001du-Vk; Wed, 14 Feb 2024 22:30:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1raSRw-0001dH-BK; Wed, 14 Feb 2024 22:30:12 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1raSRu-0001Cd-Sh; Wed, 14 Feb 2024 22:30:12 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4c02be905beso161658e0c.0; 
 Wed, 14 Feb 2024 19:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707967808; x=1708572608; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RNGomPDX6/n0GPJQ2om3EaZPlyvRLiZOS+MVM+WRFv0=;
 b=LV1YdWHSBotaS4iOrtqCHquFaCqloVASduAMXBjb1KEOAn5kAV8Esssdnd9oXgkhuD
 KVz+SjnYaGdLY2vOYQjg2yH6e9RDfUrGYpHsdIzmt/PbFqetNIZEW/VEmww7hl57swAH
 Lezotm9HkCQjdLB1WzltqgKPhI4uAnpi/Hm40cy/k+hRvrj5BBINUO/2Zo+Jn6+QFVrF
 +GSrlP9gH3t0CSVX6zql4nOcmeu4nP6YgPONK9ORHUB3aC3ycuU4wNppj+zm5KX4uKye
 heG/5xatGJrf1Bd2iTm9lPZQpkFfCkUhSDlVE04zfqDFqqUH3zNrbgz1NxmiP/LY2HCE
 qTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707967808; x=1708572608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RNGomPDX6/n0GPJQ2om3EaZPlyvRLiZOS+MVM+WRFv0=;
 b=B6hJvjBhoGqb42DrgwofKQ4Pm+FJSjWXA0rem2TBvdwrxIM6H4/LyirGYJ80taKMd7
 JoFuqv+RbFm3iIxJ0+O/LJvtefcy/KcShLHA1jVnlI5SQdpDmioMriMQ34v2Zc1LWXlc
 0tyZZcaoLbXs5Gdf/ru2j+x2WjVXjHKkRSSyyNzVTyWLYCp5emGKIyQplshyCgaZPefg
 XyUbKvr6LJCa2U3S/7iy8yD15fOcEGGEabfI6mvcG2NHRI2ttTJhtcnMWtv9laQIPAHO
 NQoYFwyF+sqYVo4j0AVVinn3it/BlhI0ZN0pOWbKWq2KEm4WHmuPSay8KuZ1vcS8w8uh
 pU9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXroDL8mFwhAiCBJh3rg0oDeSOvBEhriYeFTFDNCUD2kXaPe3SIkRgaekuFhbF+dPurWLQvPU+UNlrbahaYjb4ZA0smHjMWlPi5JHz/dad9gyJhfpAHs+tijPksSQ==
X-Gm-Message-State: AOJu0Yxv/ILeICMpItSsnVuAgxnhki/rK7ycZ274WEGSojPDoDHHioSY
 Vx18Sqm7Vvf0pIVBsznDixUWJ6l20Hc8G7KA+RtNHnrS40GJF75MCMiEkXuZ3JbqhibklqpTAOW
 AxWu3i2v/jHAx+jRh5LGCHmusAAU=
X-Received: by 2002:a1f:ccc7:0:b0:4c0:21c4:3a9b with SMTP id
 c190-20020a1fccc7000000b004c021c43a9bmr371309vkg.15.1707967808536; Wed, 14
 Feb 2024 19:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20240116010930.43433-1-jeeheng.sia@starfivetech.com>
 <20240116010930.43433-3-jeeheng.sia@starfivetech.com>
In-Reply-To: <20240116010930.43433-3-jeeheng.sia@starfivetech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Feb 2024 13:29:42 +1000
Message-ID: <CAKmqyKMNma6GM6xBMH7Ywbb1CxkbyACK0yx+8jYoGqdGd=4AzQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/riscv/virt-acpi-build.c: Generate SPCR table
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com, 
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: py1OmLdXP/iF

On Tue, Jan 16, 2024 at 11:11=E2=80=AFAM Sia Jee Heng
<jeeheng.sia@starfivetech.com> wrote:
>
> Generate Serial Port Console Redirection Table (SPCR) for RISC-V
> virtual machine.
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt-acpi-build.c | 39 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 26c7e4482d..7fc5071c84 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -174,6 +174,42 @@ acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *ua=
rt_memmap,
>      aml_append(scope, dev);
>  }
>
> +/*
> + * Serial Port Console Redirection Table (SPCR)
> + * Rev: 1.07
> + */
> +
> +static void
> +spcr_setup(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
> +{
> +    AcpiSpcrData serial =3D {
> +        .interface_type =3D 0,       /* 16550 compatible */
> +        .base_addr.id =3D AML_AS_SYSTEM_MEMORY,
> +        .base_addr.width =3D 32,
> +        .base_addr.offset =3D 0,
> +        .base_addr.size =3D 1,
> +        .base_addr.addr =3D s->memmap[VIRT_UART0].base,
> +        .interrupt_type =3D (1 << 4),/* Bit[4] RISC-V PLIC/APLIC */
> +        .pc_interrupt =3D 0,
> +        .interrupt =3D UART0_IRQ,
> +        .baud_rate =3D 7,            /* 15200 */
> +        .parity =3D 0,
> +        .stop_bits =3D 1,
> +        .flow_control =3D 0,
> +        .terminal_type =3D 3,        /* ANSI */
> +        .language =3D 0,             /* Language */
> +        .pci_device_id =3D 0xffff,   /* not a PCI device*/
> +        .pci_vendor_id =3D 0xffff,   /* not a PCI device*/
> +        .pci_bus =3D 0,
> +        .pci_device =3D 0,
> +        .pci_function =3D 0,
> +        .pci_flags =3D 0,
> +        .pci_segment =3D 0,
> +    };
> +
> +    build_spcr(table_data, linker, &serial, 2, s->oem_id, s->oem_table_i=
d);
> +}
> +
>  /* RHCT Node[N] starts at offset 56 */
>  #define RHCT_NODE_ARRAY_OFFSET 56
>
> @@ -555,6 +591,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBu=
ildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_rhct(tables_blob, tables->linker, s);
>
> +    acpi_add_table(table_offsets, tables_blob);
> +    spcr_setup(tables_blob, tables->linker, s);
> +
>      acpi_add_table(table_offsets, tables_blob);
>      {
>          AcpiMcfgInfo mcfg =3D {
> --
> 2.34.1
>
>
