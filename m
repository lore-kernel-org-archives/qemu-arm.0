Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp910049ejb;
        Wed, 6 Mar 2024 19:46:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0eJJbDwhpOwTgJoKFQPVhjg4cRmqXISLXqNSvyFY7i6GoK8JWiueOn9Z2C/pm5y+GhWLHxqyJdOmqxKwpWTp5corncAfP
X-Google-Smtp-Source: AGHT+IFgca+m1c8BBt48bWIvjEKU08/ZUAHqo2fQSK0ZHbElgqG1bPgcEX7XOpLrJZR59GpIkmHu
X-Received: by 2002:a0c:ff4a:0:b0:68f:69bb:4b97 with SMTP id y10-20020a0cff4a000000b0068f69bb4b97mr8479880qvt.24.1709783210740;
        Wed, 06 Mar 2024 19:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709783210; cv=none;
        d=google.com; s=arc-20160816;
        b=s0aSaRs55pplWgtD7Eh+vajfcrcI1Gc0ZZofCO7U3OYINSD79/Zdh56Td0j58n+zu9
         SnaolYdf5895GxDf3l1T5ARvrEMZw8Gmzr3h4Xbe3zNXv46Ct0AEVY4KEyNW1LvldXd2
         oWjoaxW10GTIH1CPVXc3TZId2w6+vCHIBq3SoM/XH0stfWgW9UTwmgfLJVfrnSKjc7Mz
         NsCj1NBtrHpMh4b44rdDH5RyRc/oGJDdmgg+b7F0ntaad+UXT4d4mahth5NK6LjBULqc
         ynS3lYAcI5RRnMkkeuGaYpfm1vopNrkOAdVXnpFoLxKk1BhatJJe9Brc+K/+Mhhpg7Pg
         bQ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=CfULBCBfNatDaXtj+xRudvsdZ/mVV9MMq0WpZxve08g=;
        fh=P3kIKstclJM7wSoflwGQ/A9srC8FM9AzyDLguyU+hQQ=;
        b=xgg8XxJzmR62ornAjmKwz0tCOsNx4qSgdwe7rI9OKY3XXQh3tpla9dDhc/k/fBQLhj
         5J3bmZfWv3sIxczGUbHZslxNvhXeI4iTgDOjHAPBQzEjBzta/o2/QoO22MGlxJGAeeh4
         +QC3Da6MCqh0NlCGYnmiI55z4iJqqJOehNlN7tYkeHyscsyRRIMvEgBmPS9a4v1dwmqO
         J5TLBDjlRedrYIH9aO3pRnSfXSqHWv65YprUWzHtCtiFBnV5bZqBhr14YhgzprXpeXZ/
         50IExkcLPvbSp3P0SRe2cuvkTrVMiiYWdGFDHjVlB5nmVIoTFeBHGClufIoA4dZ08jkv
         zUpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="D/4mFgRz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020a0562140ca700b0068fa7211a44si17094432qvs.3.2024.03.06.19.46.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 19:46:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="D/4mFgRz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ri4hx-0002HH-MZ; Wed, 06 Mar 2024 22:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ri4hs-0002Ev-5t
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 22:46:08 -0500
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ri4ho-0003aU-1G
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 22:46:07 -0500
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-59fc2d22cfaso149324eaf.3
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 19:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709783162; x=1710387962; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CfULBCBfNatDaXtj+xRudvsdZ/mVV9MMq0WpZxve08g=;
 b=D/4mFgRzTw0Hj0YJ11ptB94HkrvidgjjFkC5mIpTbwe4kccl3oGg4lYYo1fD9stXeM
 DQUeiQwtY2Z1UdF9NSw9neN0l8PdowNYgKV5aIfvFLeAp7APSE2YfSdIectWGokpc7JA
 BRISDiZ9eUS5g1o8HTmgW+osTQhp4JCLEJNKNSMfSmAe0pO1QhkSQv4ohbahseJ/8yFF
 IFBgYAA/BIAReMPQtKS1qEDcL4TI5oVFa13CE0ZFntXe29oDcq7lciH9/cM8Y1kRyQba
 PoAtJlOrZs/RqFnL2I1trmbkkdOtTwWZR64+3SiGXhufY7S6rJ00ckjNHXgguQfRCAn7
 xctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709783162; x=1710387962;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CfULBCBfNatDaXtj+xRudvsdZ/mVV9MMq0WpZxve08g=;
 b=JkWOGCn9tmdUZctl0LlTaWUM/L42M6eQMSMEsVt+eRKl1hvA1EJ2idyPVOn9Kf9Au0
 6oCokbgUN0gUxRe46Dp176zTCS7oEJbHEYGQJLzjlnkfODDhSSPQiE8q6zi7iZW3qRDO
 lECNjBz5peeYPh3yhg4DkkZ7QVeMH78KELglwSr0acNP31zbVty99P2+sfLv09WjtRSi
 FOYQUUCoVDp7fMuspZYEKr8pd5pQWOPX4rFPARodmTnX1i6ilWPPwE6XiJP5UiRoGyq+
 kpjjuQmiTcbl3kqNwY19wmzh8U3/jxhbWt4VYUXVdMH+c0pyPOWqdS3sPLFVNwgVe0/m
 E+gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKyGGZPWtCEj6FTX1v4UhI0frHQqcKdXvXW/zvmr3ZflcEQYYr1Qa9xCVniqsRfMPxhL74rLd0wyaIQkNHkHnuocVI
X-Gm-Message-State: AOJu0Yw+nNIF8tSfJaR1d/uvAT4iu4vlCEfh42KdE+8PH4vlI9zbCYt4
 8pAYjpf4hU5LaGQrZTbU9SvtVu2S3qMxILmTOwM8C+Lp4Mvgw5Zuf7assOoD3v8=
X-Received: by 2002:a05:6820:629:b0:5a1:1081:260a with SMTP id
 e41-20020a056820062900b005a11081260amr8793488oow.4.1709783162173; 
 Wed, 06 Mar 2024 19:46:02 -0800 (PST)
Received: from sunil-laptop ([106.51.83.242]) by smtp.gmail.com with ESMTPSA id
 n10-20020a4a848a000000b0059f5da15e99sm3201785oog.38.2024.03.06.19.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 19:46:01 -0800 (PST)
Date: Thu, 7 Mar 2024 09:15:52 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v2 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR creation
 to common location
Message-ID: <Zek4cO8ci2O38NFJ@sunil-laptop>
References: <20240116010930.43433-1-jeeheng.sia@starfivetech.com>
 <20240116010930.43433-2-jeeheng.sia@starfivetech.com>
 <49d0d8d3-c7fd-4039-aeed-6c31ba16557a@ventanamicro.com>
 <CAKmqyKPE-ERHShmAJQH3VNc7XqOfOeKYYyCRswJSUwf7hqm1xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKPE-ERHShmAJQH3VNc7XqOfOeKYYyCRswJSUwf7hqm1xA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1ecyBecCmDLt

On Thu, Mar 07, 2024 at 11:33:25AM +1000, Alistair Francis wrote:
> On Thu, Mar 7, 2024 at 4:59 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> > Hi,
> >
> > This patch break check-qtest, most specifically 'bios-table'test', for aarch64.
> > I found this while running riscv-to-apply.next in the Gitlab pipeline.
> >
> >
> > Here's the output:
> >
> > $ make -j && QTEST_QEMU_BINARY=./qemu-system-aarch64 V=1 ./tests/qtest/bios-tables-test
> > TAP version 13
> > # random seed: R02Sf0f2fa0a3fac5d540b1681c820621b7d
> > # starting QEMU: exec ./qemu-system-aarch64 -qtest unix:/tmp/qtest-591353.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-591353.qmp,id=char0 -mon chardev=char0,mode=control -display none -audio none -machine none -accel qtest
> > 1..8
> > # Start of aarch64 tests
> > # Start of acpi tests
> > # starting QEMU: exec ./qemu-system-aarch64 -qtest unix:/tmp/qtest-591353.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-591353.qmp,id=char0 -mon chardev=char0,mode=control -display none -audio none -machine virt  -accel tcg -nodefaults -nographic -drive if=pflash,format=raw,file=pc-bios/edk2-aarch64-code.fd,readonly=on -drive if=pflash,format=raw,file=pc-bios/edk2-arm-vars.fd,snapshot=on -cdrom tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2 -cpu cortex-a57 -smbios type=4,max-speed=2900,current-speed=2700 -accel qtest
> > acpi-test: Warning! SPCR binary file mismatch. Actual [aml:/tmp/aml-9G53J2], Expected [aml:tests/data/acpi/virt/SPCR].
> > See source file tests/qtest/bios-tables-test.c for instructions on how to update expected files.
> > acpi-test: Warning! SPCR mismatch. Actual [asl:/tmp/asl-SR53J2.dsl, aml:/tmp/aml-9G53J2], Expected [asl:/tmp/asl-4Z33J2.dsl, aml:tests/data/acpi/virt/SPCR].
> >
> > The diff is here:
> >
> > --- /tmp/asl-4Z33J2.dsl 2024-03-06 15:40:24.879879348 -0300
> > +++ /tmp/asl-SR53J2.dsl 2024-03-06 15:40:24.877879347 -0300
> > @@ -1,57 +1,49 @@
> >   /*
> >    * Intel ACPI Component Architecture
> >    * AML/ASL+ Disassembler version 20220331 (64-bit version)
> >    * Copyright (c) 2000 - 2022 Intel Corporation
> >
> > (...)
> >
> >   [000h 0000   4]                    Signature : "SPCR"    [Serial Port Console Redirection Table]
> > -[004h 0004   4]                 Table Length : 00000050
> > +[004h 0004   4]                 Table Length : 0000004F
> >   [008h 0008   1]                     Revision : 02
> > -[009h 0009   1]                     Checksum : B1
> > +[009h 0009   1]                     Checksum : B2
> >   [00Ah 0010   6]                       Oem ID : "BOCHS "
> >
> > (...)
> >
> > -[042h 0066   2]                PCI Vendor ID : FFFF
> > +[042h 0066   2]                PCI Vendor ID : 00FF
> >
> >
> > After inspecting the common helper and what the original ARM code was doing
> > I found out that we're missing something down there:
> >
> >
> > On 1/15/24 22:09, Sia Jee Heng wrote:
> > > RISC-V should also generate the SPCR in a manner similar to ARM.
> > > Therefore, instead of replicating the code, relocate this function
> > > to the common AML build.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > ---
> > >   hw/acpi/aml-build.c         | 51 ++++++++++++++++++++++++++++
> > >   hw/arm/virt-acpi-build.c    | 68 +++++++++++++++----------------------
> > >   include/hw/acpi/acpi-defs.h | 33 ++++++++++++++++++
> > >   include/hw/acpi/aml-build.h |  4 +++
> > >   4 files changed, 115 insertions(+), 41 deletions(-)
> > >
> > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > index af66bde0f5..f3904650e4 100644
> > > --- a/hw/acpi/aml-build.c
> > > +++ b/hw/acpi/aml-build.c
> > > @@ -1994,6 +1994,57 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> > >       }
> > >   }
> > >
> > > +void build_spcr(GArray *table_data, BIOSLinker *linker,
> > > +                const AcpiSpcrData *f, const uint8_t rev,
> > > +                const char *oem_id, const char *oem_table_id)
> > > +{
> > > +    AcpiTable table = { .sig = "SPCR", .rev = rev, .oem_id = oem_id,
> > > +                        .oem_table_id = oem_table_id };
> > > +
> > > +    acpi_table_begin(&table, table_data);
> > > +    /* Interface type */
> > > +    build_append_int_noprefix(table_data, f->interface_type, 1);
> > > +    /* Reserved */
> > > +    build_append_int_noprefix(table_data, 0, 3);
> > > +    /* Base Address */
> > > +    build_append_gas(table_data, f->base_addr.id, f->base_addr.width,
> > > +                     f->base_addr.offset, f->base_addr.size,
> > > +                     f->base_addr.addr);
> > > +    /* Interrupt type */
> > > +    build_append_int_noprefix(table_data, f->interrupt_type, 1);
> > > +    /* IRQ */
> > > +    build_append_int_noprefix(table_data, f->pc_interrupt, 1);
> > > +    /* Global System Interrupt */
> > > +    build_append_int_noprefix(table_data, f->interrupt, 4);
> > > +    /* Baud Rate */
> > > +    build_append_int_noprefix(table_data, f->baud_rate, 1);
> > > +    /* Parity */
> > > +    build_append_int_noprefix(table_data, f->parity, 1);
> > > +    /* Stop Bits */
> > > +    build_append_int_noprefix(table_data, f->stop_bits, 1);
> > > +    /* Flow Control */
> > > +    build_append_int_noprefix(table_data, f->flow_control, 1);
> >
> > Here. We're missing the "Language" entry.
> >
> >
> > This diff fixes the broken test:
> >
> >
> > $ git diff
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index f3904650e4..6d4517cfbe 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -2024,6 +2024,8 @@ void build_spcr(GArray *table_data, BIOSLinker *linker,
> >       build_append_int_noprefix(table_data, f->stop_bits, 1);
> >       /* Flow Control */
> >       build_append_int_noprefix(table_data, f->flow_control, 1);
> > +    /* Language */
> > +    build_append_int_noprefix(table_data, f->language, 1);
> >       /* Terminal Type */
> >       build_append_int_noprefix(table_data, f->terminal_type, 1);
> >       /* PCI Device ID  */
> 
> Thanks! I added this to the patch
> 
> >
> >
> >
> > As a side note, it seems like 'bios-table-test' isn't being run for RISC-V. Not sure if this
> > is intentional or a foresight.
> 
> I think you are looking for oversight :)
> 
> I think it's just an oversight, not intentional.
> 
Adding these test cases is WIP. Drew had already pointed this. Myself
and Haibo are looking at it. But I doubt patches can be sent before 9.0
deadlines. Can we add them post 9.0?

Thanks,
Sunil
