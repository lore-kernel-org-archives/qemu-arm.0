Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2223076ejo;
        Mon, 8 Jan 2024 03:35:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYPr7muQyreva4I3YbYZhvGEVTQ5+QDHCa5cwMkxr0Cm6VSgaD5TdKHqusm6fllEF5h9Pm
X-Received: by 2002:a05:622a:304:b0:429:8218:f9d5 with SMTP id q4-20020a05622a030400b004298218f9d5mr4586594qtw.11.1704713710245;
        Mon, 08 Jan 2024 03:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704713710; cv=none;
        d=google.com; s=arc-20160816;
        b=AX+8J6FK7XvxxJo0D34moCd82V+gHw5N97hE50z7qQZ7VyBOe/p0j8ifnVRKkb8qfG
         +gjJor7AjAFNp4hcHBHH+6Kkw4g2S03CoRFcRpfOQNHlbQShQ4/97ktNp9Sq3xoMGfDg
         kR6gHfPGt5WVHmXTrq0MeKXf1vLDR6aCeYhdLW5YsqlJjs73C/TQh/QwIIcVhrQw8i6+
         cca+5z98IjNnEc5dNS6YM8FfDLiRBOOCKoWYJPHpL5hH4sRTDQSn3nX7l5ZIeNhsBR29
         LugmZTGXhdnMZkt5OAU3xX2LQlT3pEwNbJ1+O+tv6wEFQvT8TzxZdtw5z6Q75p5MN5D1
         vm3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ykj9rb5faTIAKtTXYqY6/zCYcpj8jVy1GLb0MO00h10=;
        fh=kv6Jf0pw1WY3asWg4h2YxETjvawAmIzYBKRuDZhHxDg=;
        b=PdHgHVd5/K+aYEFrZmFVR6uXAFkRMXmakSfYmBmj7BREy975jK3BDMLITx4WE79seR
         x+qhW65n45e0sgr5rFEiKf90zcFEMRS6lCMA5i7K4jwSXJbItZpAUzcWHH0Cooq1UBCc
         s1kESPOWuBYfUxtMPytvIw9dxX5TnPtoLwQmo2F3Lkpbv0GTsOD/DuriRPYR3pC8tvu3
         4mAFufsKBIhAs1I9EuUsmWhCrbssdtwKLPeyM+PZC6IpM7HmbDStSydVjSOW/3Y3l0iB
         z77ozHOooRi5w44wQCoKrV30b5DWZ45afl8AsSPPz0+aiitijYmqAv13elBJTSZkNGzX
         uyCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Vsx0eRjr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fc24-20020a05622a489800b00428301e1bfbsi7941602qtb.8.2024.01.08.03.35.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 03:35:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Vsx0eRjr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMnu9-00027V-Kt; Mon, 08 Jan 2024 06:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rMnu7-000267-Dd
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 06:34:51 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rMnu5-0006y9-54
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 06:34:51 -0500
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5ce2aada130so296320a12.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 03:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704713686; x=1705318486; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ykj9rb5faTIAKtTXYqY6/zCYcpj8jVy1GLb0MO00h10=;
 b=Vsx0eRjrIzolNbNxwD8cV1w5n4L6RMeRNmObCi14yQ/90ZVRUEiwR8PzuV+y1kOjCj
 Xbo4v/eOqOraevFhLrnIYhkgAO/E5ai0GF/UKt3EqG5/lHFQcRRndNgiZRoDPnH2AXYC
 qjfI2352fqvjFej0QkhxVWBc6FxcmoF7lGEk00xgdAGdMi0a16IAM2CLIB6LAzXioJ8f
 LXt6TAVMXBWVVv7Cvlcwpw2i2xwmIPsEx431+WdpJ0352AbiUxow2lSBEJJLU3BjZs4J
 b6jqPVJ0+DHV0hmWahNSYxPCL0e3apUxrtelf+okQ1YNWF9EeJs+YQXLbUxusrRnJhBr
 /B/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704713686; x=1705318486;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykj9rb5faTIAKtTXYqY6/zCYcpj8jVy1GLb0MO00h10=;
 b=IMTIqmx9/wt/wjUyiJocGfz5bYVYKbc2FyKE47Jp7kC10I9MhhKP+3Y42OmOLRXQh9
 KCNj0ZcR2R+3U2HD9/GSY6SRE39ES4v5s2BwK4nDLjtUs6TDod25d03noJtgttDW7/ol
 0TF3P8SDh9ZcBjLGsksDk0sbqGWpckoenAPvFKeyCM4Jj4/MTcuwTwVA9uki7QZl8jwU
 0Drwwb8SX2GQ1RVKdLEfjiZ33vddVgO6mJRLtIm+1ln31TBtqyzL5GZqyZaWccBza1cU
 ehmDFCr6H+saQz2JmoIA2XvGAAS6PvwB9hcuXsCuydTpCYnw4wp3g/ROQnsI6zCoSm2Y
 GOgw==
X-Gm-Message-State: AOJu0YwXUIng2AgYRMf4hvLB8YTM2sdQgdR7fY3xTCFsVoVBj5b+JVNo
 gixIolwtIhmqw+zUHaPbL46sfUfEnxsPcA==
X-Received: by 2002:a05:6a20:13d1:b0:196:d90:aa62 with SMTP id
 ho17-20020a056a2013d100b001960d90aa62mr887356pzc.121.1704713686162; 
 Mon, 08 Jan 2024 03:34:46 -0800 (PST)
Received: from sunil-laptop ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a17090aeb1700b0028b89520c7asm5986211pjz.9.2024.01.08.03.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 03:34:45 -0800 (PST)
Date: Mon, 8 Jan 2024 17:04:36 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [RESEND RFC v1 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR
 creation to common location
Message-ID: <ZZvdzOjQBbxfmuRJ@sunil-laptop>
References: <20240105090608.5745-1-jeeheng.sia@starfivetech.com>
 <20240105090608.5745-2-jeeheng.sia@starfivetech.com>
 <7cb2ab36-811a-477f-b2de-1f581150a595@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cb2ab36-811a-477f-b2de-1f581150a595@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x52f.google.com
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
X-TUID: sbGpeL4/zrO9

On Fri, Jan 05, 2024 at 09:19:14AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 1/5/24 06:06, Sia Jee Heng wrote:
> > RISC-V should also generate the SPCR in a manner similar to ARM.
> > Therefore, instead of replicating the code, relocate this function
> > to the common AML build.
> > 
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > ---
> >   hw/acpi/aml-build.c         | 51 ++++++++++++++++++++++++++++
> >   hw/arm/virt-acpi-build.c    | 68 +++++++++++++++----------------------
> >   include/hw/acpi/acpi-defs.h | 33 ++++++++++++++++++
> >   include/hw/acpi/aml-build.h |  4 +++
> >   4 files changed, 115 insertions(+), 41 deletions(-)
> > 
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index af66bde0f5..1efa534aa8 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -1994,6 +1994,57 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> >       }
> >   }
> > +void build_spcr(GArray *table_data, BIOSLinker *linker,
> > +                const AcpiSpcrData *f, const char *oem_id,
> > +                const char *oem_table_id)
> > +{
> > +    AcpiTable table = { .sig = "SPCR", .rev = 2, .oem_id = oem_id,
> > +                        .oem_table_id = oem_table_id };
> > +
> > +    acpi_table_begin(&table, table_data);
> > +    /* Interface type */
> > +    build_append_int_noprefix(table_data, f->interface_type, 1);
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 3);
> > +    /* Base Address */
> > +    build_append_gas(table_data, f->base_addr.id, f->base_addr.width,
> > +                     f->base_addr.offset, f->base_addr.size,
> > +                     f->base_addr.addr);
> > +    /* Interrupt type */
> > +    build_append_int_noprefix(table_data, f->interrupt_type, 1);
> > +    /* IRQ */
> > +    build_append_int_noprefix(table_data, f->pc_interrupt, 1);
> > +    /* Global System Interrupt */
> > +    build_append_int_noprefix(table_data, f->interrupt, 4);
> > +    /* Baud Rate */
> > +    build_append_int_noprefix(table_data, f->baud_rate, 1);
> > +    /* Parity */
> > +    build_append_int_noprefix(table_data, f->parity, 1);
> > +    /* Stop Bits */
> > +    build_append_int_noprefix(table_data, f->stop_bits, 1);
> > +    /* Flow Control */
> > +    build_append_int_noprefix(table_data, f->flow_control, 1);
> > +    /* Terminal Type */
> > +    build_append_int_noprefix(table_data, f->terminal_type, 1);
> > +    /* PCI Device ID  */
> > +    build_append_int_noprefix(table_data, f->pci_device_id, 2);
> > +    /* PCI Vendor ID */
> > +    build_append_int_noprefix(table_data, f->pci_vendor_id, 2);
> > +    /* PCI Bus Number */
> > +    build_append_int_noprefix(table_data, f->pci_bus, 1);
> > +    /* PCI Device Number */
> > +    build_append_int_noprefix(table_data, f->pci_device, 1);
> > +    /* PCI Function Number */
> > +    build_append_int_noprefix(table_data, f->pci_function, 1);
> > +    /* PCI Flags */
> > +    build_append_int_noprefix(table_data, f->pci_flags, 4);
> > +    /* PCI Segment */
> > +    build_append_int_noprefix(table_data, f->pci_segment, 1);
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 4);
> > +
> > +    acpi_table_end(linker, &table);
> > +}
> >   /*
> >    * ACPI spec, Revision 6.3
> >    * 5.2.29 Processor Properties Topology Table (PPTT)
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 510ab0dcca..a31f736d1a 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -431,48 +431,34 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >    * Rev: 1.07
> >    */
> >   static void
> > -build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > +build_spcr_v2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> 
> Nit: I don't understand the '_v2' in the name of this function. Is it just to not collide
> with the now public build_spcr()? Or does it have to do with the SPCR table being
> '.rev = 2'? Because if it's the latter, you can name the common helper 'build_spcr_rev2'
> (since both ARM and RISC-V use SPCR rev 2), keep this local build_spcr() initializing
> the AcpiSpcrData struct with ARM attributes and then call the common build_spcr_rev2().
> 
My suggestion is, keep the build_spcr() generic and take version as the
parameter.

Thanks,
Sunil
