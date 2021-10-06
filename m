Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp96675lfp;
        Wed, 6 Oct 2021 02:16:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzwgWXML7taBEOI2XXfq0F4HUkqxXk2TJ7iYu0VoDs3xzz+OyxQAdEo2HnNtYDQGXYwW6c
X-Received: by 2002:a05:6e02:160f:: with SMTP id t15mr6782437ilu.267.1633511762661;
        Wed, 06 Oct 2021 02:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633511762; cv=none;
        d=google.com; s=arc-20160816;
        b=OWQRKt9Y9NR4y3n+hIKJvVORn7IlWBYH44bUAdXG6AOqJdLP8fw2x3Vf0tL98AzK8z
         /aR9UEBGajpOJiWTg9S+AVDSoYV3Na+hPAlMXnbhEpSoTjrAVYqLx+xM92XOH98Cj3TX
         9rATkKhbGKZkUay+lgXh8lNGFG7rN1854pFQ40ZD6kZTSthP45VxCekI5erq5+dZtbRy
         YyumTcettJ+9rUs5ifieVsVW/nxB7ZyjOagh8isHuKhf+F6jpOJ+yWLTi4EU0qXJvTwM
         8EiGPh+8X21fUVoID6X4xCEy6mWLlZM7hAsAYryP0q5ZDobOxvgFDFdqHo+BQBVHdx50
         hsNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=pOwd2fwHlalGwz4/ydMPMXtNe7WE4CbgIn3yWBztgqw=;
        b=CEv9zT9YEQJMaCC76lzlEtnpS6taeGHyBrvzIACK2FDjKJ4N/u7il0GTwQaYL1C88e
         ekwGz464GdnmfrX3uQNcZL6uK5U4tV5wB+17bcw9OGqm1aUfxhdeqG2Jr10VKcT2Fe8g
         6DZoYXFMWWNkhZqhySP0DscG5IgZxjWTQ8zU1OHLd2zoOvS4QI6f/nIOx3fQZZUjD9bo
         rssQ2gz6iOyTbOvOCvq+nBj5/yDTufuRejq5Km1IGQo7FHvDtUad9wnkpvFn8RnMKzPK
         w1iU6y2B7gLjXb0BMK6iS4EFIdqljMHr0elfPmTTLaJ+N25qiUbfnfhOR2Q2aQSUO3VX
         pYMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W3CTTXwG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h24si23583925ioe.67.2021.10.06.02.16.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 02:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W3CTTXwG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY31t-00060W-UX
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 05:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mY31T-00060E-6B
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 05:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mY31P-0002zA-Fq
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 05:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633511730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pOwd2fwHlalGwz4/ydMPMXtNe7WE4CbgIn3yWBztgqw=;
 b=W3CTTXwGqxokhsrgio1fiXVSd/+Yb8Zqp1jQDJIEKI8rmXOyMT6/sSBXI48veuG/EB9olP
 SBUheQca78/TYBBv6Gu9+q3UChp+87xJeMCBT1IAkBUfyHuBpMoGGo32jSunQj8fbzvr9Q
 pD7zik0/bwHQJbv9DbIR0GijzkGbbc0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-8J5XH0CKPDuYQJlploWTeQ-1; Wed, 06 Oct 2021 05:15:27 -0400
X-MC-Unique: 8J5XH0CKPDuYQJlploWTeQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso1988997edj.20
 for <qemu-arm@nongnu.org>; Wed, 06 Oct 2021 02:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pOwd2fwHlalGwz4/ydMPMXtNe7WE4CbgIn3yWBztgqw=;
 b=HY5FdGjMQIVa34X8T1FuqR2tHVIVTXiCDQp+pOYzvkO3QnFSzc1RJNZEAB670nxq5g
 D0qhGvRuvWMjmuSvUigec+kvmzrYnx1DBbKwMVGocwEi+1ZeJZx27ozy/66fvvu/bWCl
 ozquAmGxyouwypbgBQGNLaPqkgrx4UN1H51bHWkEFPGI1sBz3n50yIwM6+aBD+jshkuP
 7g2LRPZUR1rrL20cg16v6TOtrqba0QezkgVAybnXWT6x/42vOmguE4UCuLdkZytIY4AF
 QvmTSRaILyDg3krI3M7fudKCPCIYd1DsQ5WFmWpKSVN0YYBvws7LWC4EWj9M8MSgOYO6
 vtRA==
X-Gm-Message-State: AOAM531GbEl0mYGPGlJiuwq6lIgqD7DFX84uP1/sTrQj0xh7se2CmYYO
 n5aEAkF3+y2nSvFUtD6Qk+UkRPuDHJVfHC3UztBSibntELuucCrvFjWLaoMsoccLXtqnB9stFU+
 Enpok5b9vQ+G8
X-Received: by 2002:a17:906:3805:: with SMTP id
 v5mr30243717ejc.440.1633511726001; 
 Wed, 06 Oct 2021 02:15:26 -0700 (PDT)
X-Received: by 2002:a17:906:3805:: with SMTP id
 v5mr30243694ejc.440.1633511725701; 
 Wed, 06 Oct 2021 02:15:25 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id r19sm9776468edt.54.2021.10.06.02.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 02:15:25 -0700 (PDT)
Date: Wed, 6 Oct 2021 11:15:23 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20211006091523.qaub5xg3kxuwjmlh@gator.home>
References: <20210927131732.63801-1-eric.auger@redhat.com>
 <20210927131732.63801-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210927131732.63801-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, gshan@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Df0YeHZD56rY

On Mon, Sep 27, 2021 at 03:17:31PM +0200, Eric Auger wrote:
> ARM SBBR specification mandates DBG2 table (Debug Port Table 2)
> since v1.0 (ARM DEN0044F 8.3.1.7 DBG2).
> 
> The DBG2 table allows to describe one or more debug ports.
> 
> Generate an DBG2 table featuring a single debug port, the PL011.
> 
> The DBG2 specification can be found at
> "Microsoft Debug Port Table 2 (DBG2)"
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> Took into account all comments from Igor on v2:
> mostly style adjustment, revision references
> 
> v1 -> v2:
> - rebased on Igor's refactoring
> ---
>  hw/arm/virt-acpi-build.c | 62 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6cec97352b..257d0fee17 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -616,6 +616,63 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_end(linker, &table);
>  }
>  
> +/* Debug Port Table 2 (DBG2) */
> +static void
> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)

nit: I didn't think QEMU liked this style, i.e. QEMU prefers

 static void build_dbg2(GArray *table_data, BIOSLinker *linker,
                        VirtMachineState *vms)

Eh, I see that hw/arm/virt-acpi-build.c is full of the format you have
here, so never mind.

> +{
> +    AcpiTable table = { .sig = "DBG2", .rev = 3, .oem_id = vms->oem_id,

Can you explain where the .rev = 3 comes from? The spec says "For this
version of the specification, this value is 0."


> +                        .oem_table_id = vms->oem_table_id };
> +    int dbg2devicelength;
> +    const char name[] = "COM0";
> +    const int namespace_length = sizeof(name);
> +
> +    acpi_table_begin(&table, table_data);
> +
> +    dbg2devicelength = 22 /* BaseAddressRegister[] offset */ +
> +                       12 /* BaseAddressRegister[] */ +
> +                       4 /* AddressSize[] */ +

I'd personally prefer the '+' before the comment, but maybe Igor has a
special ACPI code format preference here.

> +                       namespace_length /* NamespaceString[] */;
> +
> +    /* OffsetDbgDeviceInfo */
> +    build_append_int_noprefix(table_data, 44, 4);
> +    /* NumberDbgDeviceInfo */
> +    build_append_int_noprefix(table_data, 1, 4);
> +
> +    /* Table 2. Debug Device Information structure format */
> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> +    build_append_int_noprefix(table_data, dbg2devicelength, 2); /* Length */
> +    /* NumberofGenericAddressRegisters */
> +    build_append_int_noprefix(table_data, 1, 1);
> +    /* NameSpaceStringLength */
> +    build_append_int_noprefix(table_data, namespace_length, 2);
> +    build_append_int_noprefix(table_data, 38, 2); /* NameSpaceStringOffset */
> +    build_append_int_noprefix(table_data, 0, 2); /* OemDataLength */
> +    /* OemDataOffset (0 means no OEM data) */
> +    build_append_int_noprefix(table_data, 0, 2);
> +
> +    /* Port Type */
> +    build_append_int_noprefix(table_data, 0x8000 /* Serial */, 2);
> +    /* Port Subtype */
> +    build_append_int_noprefix(table_data, 0x3 /* ARM PL011 UART */, 2);
> +    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
> +    /* BaseAddressRegisterOffset */
> +    build_append_int_noprefix(table_data, 22, 2);
> +    /* AddressSizeOffset */
> +    build_append_int_noprefix(table_data, 34, 2);
> +
> +    /* BaseAddressRegister[] */
> +    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
> +                     vms->memmap[VIRT_UART].base);
> +
> +    /* AddressSize[] */
> +    build_append_int_noprefix(table_data, 0x1000 /* Register Space */, 4);
> +
> +    /* NamespaceString[] */
> +    g_array_append_vals(table_data, name, namespace_length);
> +
> +    acpi_table_end(linker, &table);
> +};
> +
>  /*
>   * ACPI spec, Revision 5.1 Errata A
>   * 5.2.12 Multiple APIC Description Table (MADT)
> @@ -875,7 +932,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, vms);
>  
> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
> @@ -898,6 +955,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_dbg2(tables_blob, tables->linker, vms);
> +
>      if (vms->ras) {
>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>          acpi_add_table(table_offsets, tables_blob);
> -- 
> 2.26.3
>

Thanks,
drew 

