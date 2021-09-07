Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4569419lfb;
        Tue, 7 Sep 2021 03:18:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPCpW3n0BMKE6yDqSaC1QeKd/3UBhAyJjzrph+FrI/DjX34gr/zCk4unISmSlPSCO+Hcqp
X-Received: by 2002:a6b:e616:: with SMTP id g22mr13252615ioh.67.1631009906779;
        Tue, 07 Sep 2021 03:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631009906; cv=none;
        d=google.com; s=arc-20160816;
        b=K4KxxzrHAWcM9y1LbVG3gVwVaMor6Eh6M5tpAfFeqnlQM9tTQZSiVJXl7kfo6yIhx7
         M9YUJuhXO0BIbZOT2nG9aap3rBk6GPD/auSZ6TV878ZsXbsIkmH1zg+muSZGv2ly0vgI
         MeiTwBTPQvPy0hNDCv+b3DdceNkrnTJ4SypgGdXDlfskt1GvUtgecZBMBfbWxUEz8Eyq
         L8xDFY/6Q30UEk1gU91+2we8WAEVkTsrW0UsbKjl0ym9Y1Vd7APreGA+LV6bMHB0oXXW
         WUGMP1J7OzZmBNqi0WFX1F6glLYeMapKcpeitAccTQrFCQWYe9DxAcIJuQ51krZ2RVyo
         QpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=K3C4RPhpFvataIaonCqx/aNNACHlIDgxFBxCSr+5faI=;
        b=VNl+PCoV+tJIJSTlEUrvEl94d5cqhOBnl1EyTOZHbbYVV2kRpD6hE78QXbDz0hqZGJ
         31KjoSkp7t+Cr2xlrx3odlnfk2Ihjw4FlUw2YyFZreTRDYvpZmj1RxyqAWXw/Q30Kvl7
         jZy6+e6PKdBXZfXXM97xSa3r2912GTejDtkfSS3dS1rkkS+9fxBHSXnZmzP0txMh3rlh
         mAaSYuMqEkTf1ogpDWa9LRa/x4GJXYV1S/RtaMNOY1HDmm1mKCiq3gnZmFJUKJRezCpv
         oIfL8Hc1qIgkPbEIh9ZyswljYdaYWFd3eB/5BraBHzMxai71MT7Ta/aD7whpFjkbA05A
         f3tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g78eumm9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si8823664ioh.20.2021.09.07.03.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 03:18:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g78eumm9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNYBO-0008Ui-3f
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 06:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNYBD-0008QT-79
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 06:18:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNYBA-0007dr-8V
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 06:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631009891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3C4RPhpFvataIaonCqx/aNNACHlIDgxFBxCSr+5faI=;
 b=g78eumm9qkqbdqY2ZmepFGjxTjEWUmFPIps413BpPGzim/AQeAgeXDBxMAhg0Tw286IqLD
 bOLFaXcAzP71g9oBWXsbMmTI9WK5ASPo2xo9n7N69rfI1BCi+ZNdZd0Z3bFZaBaytJeoRc
 noQQXOwqAgMHkSEEqLjau01uBV6DAgo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-P1M2_9tHM7iRciPBub5Bbw-1; Tue, 07 Sep 2021 06:18:10 -0400
X-MC-Unique: P1M2_9tHM7iRciPBub5Bbw-1
Received: by mail-ed1-f70.google.com with SMTP id
 m30-20020a50999e000000b003cdd7680c8cso40826edb.11
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 03:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3C4RPhpFvataIaonCqx/aNNACHlIDgxFBxCSr+5faI=;
 b=JriEDzH1EXPBuBW6HQt3Zv0F5SGIzCbvwjeXpJ4T2Uds+uhwyydZj9YBYEmyhV359W
 TZ/wIStg+I6pjGkz4KqJswh9pfSklwInnC4E/a0L8+vYUBn3jL9EoUwkzZ8OoUtha3p/
 M1tEsuWG8cEQXy9g8FaX+hjqeetj6I4Jl1ZAxQLutN6IniwhXv7CSAc4FGGSwuE3ICfO
 MZ7Ou28SWULtwMU+XQl/CTDDc6olTANyxpU8f7+DTkNl+NMP2xaJM9FQsjDkYuVOCacl
 bz/y3KxfAHoL5gmAtSXjdMY2I8OppPR/LO6VQpE8qmCuJ4UrSpiFtXfoMBgz2UfxjfWk
 O2AQ==
X-Gm-Message-State: AOAM531HdMx4GxtH93VY5Q4FYdAc4Hasz67rutv+X5DrTebx1qsgpe/A
 ycJbEAE31U2QPybpM8sI6Y4XVeZSoGh5JZaLYgc858XuL99g3QEQvFY4LU8zZ4i8in7YmzYxFcu
 JiU4W9OF0kd7E
X-Received: by 2002:a17:906:9747:: with SMTP id
 o7mr17795206ejy.486.1631009888939; 
 Tue, 07 Sep 2021 03:18:08 -0700 (PDT)
X-Received: by 2002:a17:906:9747:: with SMTP id
 o7mr17795170ejy.486.1631009888579; 
 Tue, 07 Sep 2021 03:18:08 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id bm14sm6272484edb.71.2021.09.07.03.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:18:08 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:18:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 3/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20210907121806.79c74f27@redhat.com>
In-Reply-To: <20210906123139.93593-4-eric.auger@redhat.com>
References: <20210906123139.93593-1-eric.auger@redhat.com>
 <20210906123139.93593-4-eric.auger@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: biziGzkPUeNF

On Mon,  6 Sep 2021 14:31:39 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> ARM SBBR specification  mandates DBG2 table (Debug Port Table 2).
                        ^^ revision here, and possibly a pointer [chapter]
                           to concrete place in spec where it's said.

> this latter allows to describe one or more debug ports.
> 
> Generate an DBG2 table featuring a single debug port, the PL011.
> 
> The DBG2 specification can be found at:
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN

links tend to go stale, I'd use a combo of name and optionally link here:
 "Microsoft Debug Port Table 2 (DBG2)"
    link
 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

table looks correct,
so only style related thing to fix to match the common
ACPI code style.

> 
> ---
> v1 -> v2:
> - rebased on Igor's refactoring
> ---
>  hw/arm/virt-acpi-build.c | 64 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 488ea04eed7..de604e79779 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -512,6 +512,65 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_composed(linker, &table);
>  }
>  
> +/* Debug Port Table 2 (DBG2) */
> +static void
> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +{
> +    AcpiTable table = { .sig = "DBG2", .rev = 3, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
> +    int dbg2devicelength, baseaddroffset = 22, namespace_length;
> +    char name[] = "COM0";
const?

Also I'd move here:
       const int namespace_length = sizeof(name);

> +
> +    acpi_init_table(&table, table_data);
> +
> +    namespace_length = sizeof name;
> +    dbg2devicelength = baseaddroffset +
> +                       sizeof(struct AcpiGenericAddress) + 4 + namespace_length;
                          ^^^^, fragile as it's subject to alignment which depends on target

I suggest following style:
       
       dbg2devicelength = 22 /* BaseAddressRegister[] offset, fixed size table header */ +
                          12 /* BaseAddressRegister[] */ +
                          4 /* AddressSize[] */
                          namespace_length /* NamespaceString[] */;

       and drop 'baseaddroffset' and 'sizeof(struct AcpiGenericAddress)'
       to be more consistent with other ACPI code to annotate where lengths come from

> +    /* offset to the first debug struct */
         comment should be verbatim field name from spec table, i.e. in this case 
            /* OffsetDbgDeviceInfo */
         ditto for the rest of field comments

> +    build_append_int_noprefix(table_data, 44, 4);
> +    /* number of debug device info struct entries */
> +    build_append_int_noprefix(table_data, 1, 4);
> +
> +    /* debug device info structure */

copy from spec, for ease to find it using just copy/past,

 /* Table 2. Debug Device Information structure format */

> +    /* revision */
> +    build_append_int_noprefix(table_data, 0, 1);
> +    /* length */
> +    build_append_int_noprefix(table_data, dbg2devicelength, 2);
> +    /* register count */
> +    build_append_int_noprefix(table_data, 1, 1);
> +    /* name path length */
> +    build_append_int_noprefix(table_data, namespace_length, 2);
> +    /* name path offset */
> +    build_append_int_noprefix(table_data, 38, 2);
> +    /* oem data length */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* oem data offset (0 means no OEM data) */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* port type (serial port) */
> +    build_append_int_noprefix(table_data, 0x8000, 2);
values could be annotated like following, using description from spec:

          build_append_int_noprefix(table_data, 0x8000 /* Serial */, 2);

> +    /* port subtype (ARM PL011)*/
> +    build_append_int_noprefix(table_data, 0x3, 2);
                                             0x3 /* ARM PL011 UART */

it gives checkpatch warning but all APCI code uses this style,
so it's fine

> +    /* reserved */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* base address offset */
> +    build_append_int_noprefix(table_data, 22, 2);
> +    /* address size offset */
> +    build_append_int_noprefix(table_data, 34, 2);
> +
> +    /* BaseAddressRegister */
> +    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
> +                     vms->memmap[VIRT_UART].base);
> +
> +    /* AddressSize (PL011 UART length) */
> +    build_append_int_noprefix(table_data, 0x1000, 4);
                                             ^^^^
at least point out where it comes from or use macro to define
value and use it here and in pl011_init()


> +
> +    /* NamespaceString */
> +    g_array_append_vals(table_data, name, namespace_length);
> +
> +    acpi_table_composed(linker, &table);
> +};
> +
>  /*
>   * ACPI spec, Revision 5.1 Errata A
>   * 5.2.12 Multiple APIC Description Table (MADT)
> @@ -770,7 +829,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, vms);
>  
> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
> @@ -793,6 +852,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_dbg2(tables_blob, tables->linker, vms);
> +
>      if (vms->ras) {
>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>          acpi_add_table(table_offsets, tables_blob);

