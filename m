Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1267626lfp;
        Thu, 7 Oct 2021 04:09:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF2IlszU49U1QOffEhSU5tSzxF95wXgiOUUwgZEcxD+c9ur5GKoBMEosAgtJReS8WA8VC/
X-Received: by 2002:a1f:9ec3:: with SMTP id h186mr2789460vke.5.1633604997142;
        Thu, 07 Oct 2021 04:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633604997; cv=none;
        d=google.com; s=arc-20160816;
        b=QcA+2d43N4HE3YXFyvwuewBm27L/wBS9ZMhizTnabTI+k1M/0iqM/HQzqTFPHzM9bL
         b3Q6UC/FAwqsYIFq783vvLHdL9VnpdR/TlSvCs7jaB0IxM4t8bGatT6Tif5PoL9EyITX
         m0y3/O0TSMSK2V/RXdFPoqDXFkAnIP+xnOXYxl2UXwlvPWABaTdnfWIX+VzZ3W4MjpzE
         qFXZRW/qRRzmmKwrIKfBKYy68ZFeBshIFW5LQVZLXkXeQAflju4L73EOshebHqrmL/6H
         D9Tbg3GMglYvP8AdtkFP+Couc1kuvFKScItok3+uYGlmFy+c3lnUEorNIZOv2Cen9gVL
         SElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=37jVCLtiWIcTOaLes31gpJA4yIbvxPRqQeRkOSGMNK4=;
        b=NYXIYpF8PlNi2BB27QVAi/T0oM5v+jdqafYE4jZ7y41GxKlQ/uz9tYEwBg7ad6u66G
         dRXzjWsr6wEcx7wcV8IJnz4De3E5ihA9I6JsFi/43KL89oRV5gLN3c8XfcKZ48UCFQW9
         W2V+T24xMr/u2YH64L4yTuOvLG8Ncs+fhcde6wvfPd1GowybiMQd5cwVCAxRLNrJO9aj
         6Y1NLjTiy6Ezf3uBbieEV/2h/WgESKQw79ekNyZiu0+SDSv9zwUFyLh2dIAH+LgxoHKY
         010VMDox3K9nwvk6qkZ5tXp4iZ3ipuY87HEtpgHt1UX2pVO+tzzXWFms0zvh3zkS+S41
         mF+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BlyInefo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si8655951uar.115.2021.10.07.04.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 04:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BlyInefo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYRHg-0001Xy-CA
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 07:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mYRGR-0007uZ-Lr
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 07:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mYRGL-0001XN-PC
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 07:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633604912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37jVCLtiWIcTOaLes31gpJA4yIbvxPRqQeRkOSGMNK4=;
 b=BlyInefoGyn6zf2gLzu0YWeOK4BrqUtiap7UVbn+C/9rU574wLaTEF7H96S1bQhsBnHq5G
 0JDnged17kVsdoUMtSWuK3Iv8zfb/UrOfoYP0I+qLqq2S7cmzYdb5Sslu2D2V9iBzZDGPQ
 0aV0rZNRDBEv3g/7o1LCJtoPx+KXu9Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-FgzB1BAGMFiFwPkZJ5pFZw-1; Thu, 07 Oct 2021 07:08:31 -0400
X-MC-Unique: FgzB1BAGMFiFwPkZJ5pFZw-1
Received: by mail-wr1-f69.google.com with SMTP id
 o2-20020a5d4a82000000b00160c6b7622aso4308187wrq.12
 for <qemu-arm@nongnu.org>; Thu, 07 Oct 2021 04:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37jVCLtiWIcTOaLes31gpJA4yIbvxPRqQeRkOSGMNK4=;
 b=uW0A4WiG+bqwxiMhR7PNsttLrF2D7qKsbTZvCaURXr27v7HR7vEiv7p3mOlHvE2SSo
 NRIiUBC07sVoNcniH9FDeYZjnODCP2z2Gu3rC4zpIgLuXho6s0FBjcIUYFGsTcTGvRjG
 VGq7KT6QgQbRwbI721dvYKj1iUeY2IC/yDuKgKvayDspnaGAQVlqgyQaif1OqfsujjwJ
 KxHhjWD41dhPcJZPFFz0o4Quo3rNJUvb5oNJMkBdhUk6tC7Z7V0RuRSksbvvUZkUPvTO
 VzGm8Sy2jewJ1hVXagH1o0/yhXTHYI6wPQ7f9WzoXvNOXfRJC/DQ/TEcpXdvQrkwpYXB
 rv5w==
X-Gm-Message-State: AOAM533a6EhMYFyz0I9HZpldFYVV8q4Cp9CrafVRvujoqEcALIXVAjMO
 pUR61KgQG6M6cDYtJczK5/VD/BlAblA7yn+/sPD7CwkHv2PHKt8A/yb0HVJ6MZlXsgYiEdxpN1g
 9dRlEY0Jl1jde
X-Received: by 2002:adf:9084:: with SMTP id i4mr4571973wri.304.1633604910756; 
 Thu, 07 Oct 2021 04:08:30 -0700 (PDT)
X-Received: by 2002:adf:9084:: with SMTP id i4mr4571953wri.304.1633604910552; 
 Thu, 07 Oct 2021 04:08:30 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id 36sm21823832wrc.92.2021.10.07.04.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 04:08:30 -0700 (PDT)
Date: Thu, 7 Oct 2021 13:08:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 2/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20211007130829.52bf119c@redhat.com>
In-Reply-To: <20211007072922.655330-3-eric.auger@redhat.com>
References: <20211007072922.655330-1-eric.auger@redhat.com>
 <20211007072922.655330-3-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EzATXCz6TvN9

On Thu,  7 Oct 2021 09:29:21 +0200
Eric Auger <eric.auger@redhat.com> wrote:

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
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> 
> v3 -> v4:
> - Change the revision in the header (0), + vs comments,
>   s/0x1000/vms->memmap[VIRT_UART].size
> - Added Michael's A-b
> 
> v2 -> v3:
> Took into account all comments from Igor on v2:
> mostly style adjustment, revision references
> 
> v1 -> v2:
> - rebased on Igor's refactoring
> ---
>  hw/arm/virt-acpi-build.c | 63 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6cec97352b..dd17a48c00 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -616,6 +616,64 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_end(linker, &table);
>  }
>  
> +/* Debug Port Table 2 (DBG2) */
> +static void
> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +{
> +    AcpiTable table = { .sig = "DBG2", .rev = 0, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
> +    int dbg2devicelength;
> +    const char name[] = "COM0";
> +    const int namespace_length = sizeof(name);
> +
> +    acpi_table_begin(&table, table_data);
> +
> +    dbg2devicelength = 22 + /* BaseAddressRegister[] offset */
> +                       12 + /* BaseAddressRegister[] */
> +                       4 + /* AddressSize[] */
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
> +    build_append_int_noprefix(table_data,
> +                              vms->memmap[VIRT_UART].size, 4);
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
> @@ -875,7 +933,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, vms);
>  
> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
> @@ -898,6 +956,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_dbg2(tables_blob, tables->linker, vms);
> +
>      if (vms->ras) {
>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>          acpi_add_table(table_offsets, tables_blob);

