Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1200049lff;
        Tue, 10 Aug 2021 03:52:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW1bJUDtiy9LTpueQApxpyPAv/IIZGxOdgz940Ja+7yCyJD+lsDzg+Yxk5oAR4mUS7vPwm
X-Received: by 2002:a37:a783:: with SMTP id q125mr27301074qke.137.1628592758235;
        Tue, 10 Aug 2021 03:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628592758; cv=none;
        d=google.com; s=arc-20160816;
        b=vzaMF6XM2zNHoMBGRPd6ekx4f0vqzaU+6QeViuKujq84SaLezg5fvW4DoJvytWBckA
         QBMWprYmXW5cBoF/4SRZ5Kvev7RWwuyvgkN0qp7RFcA+z+6xF506+HNgmwo0uOvd/25K
         IFx3Lx5k+qTk00fbvi650yc+Lc1GQm6f/MrvdyNYv9IPS3/C2UqxNTGCP75NkMWStb/l
         45nm5wV5+nLc747sPN2hynaAuaRb46PaGAcnsx7CldpCbcUEZm03nb8qk/yONguB0FZA
         Dtz0uqT+lAJPZW7TC0qtZEvGOJIztiSN31JOY8b+tN46wL0ncB3sHUbf/bWojhUpfvYi
         g1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=jMzXcZwPo+PiRQDri1HYvLKMvjLU3OOpAQYPMIih+Q8=;
        b=aFI8LcRWHLoWe2cqrVv63Ha5SKjcAunSPFHb3SLrkRta5/KxEvqkyrMokOFuRWya9c
         6dGjvQYTZ74VnV3fCx+mhXfLeP6Vgr1L8cOhzGTWc+qkOetOsn9M5spdjcoDDe5/ZNIy
         yvXJHJ7WnX+v2AOVVMEyrT9gRukBAwBKLOLlUpT2xtnwagNFEOPNblcHOO4vcIPvSo6n
         DPvW3ITZDc6QEIHVoTNHoUwFAFkeSxeP4r5INsLkgLJRGXCu/1YlR8JRf2/WJLAch3HY
         JfIylcpNdj3zjexzPMJQ69W91/mddu6yFnesZyXT1ptVp07qGMhJJndwc9aer0wHzbiM
         vRZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c4uikgVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13si12861319qki.168.2021.08.10.03.52.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 03:52:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c4uikgVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDPN7-000306-GA
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 06:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mDPMy-0002zq-UE
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 06:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mDPMv-00050v-Bq
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 06:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628592743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMzXcZwPo+PiRQDri1HYvLKMvjLU3OOpAQYPMIih+Q8=;
 b=c4uikgVm5kC8JfwqhGd8qclDHw3T9T1fueWFjvWLU8tGgxMXfxtvAjrOPPC3iYoZkhekPY
 iz35MAgRNs/lUM+O6F961Ho5BkH8BfBBGsR3oVR3ca71qUOBm/KAdKZlmj57lG/pMxY1iB
 UaSQSJHcia9x8c/Lsc3L77MHzU0p8YE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-5QwJS5VANcatUpex3J6Qug-1; Tue, 10 Aug 2021 06:52:22 -0400
X-MC-Unique: 5QwJS5VANcatUpex3J6Qug-1
Received: by mail-wr1-f69.google.com with SMTP id
 q11-20020a5d61cb0000b02901550c3fccb5so403321wrv.14
 for <qemu-arm@nongnu.org>; Tue, 10 Aug 2021 03:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jMzXcZwPo+PiRQDri1HYvLKMvjLU3OOpAQYPMIih+Q8=;
 b=jXqkoXhiYnx7a+zjvOcO8arIqxR50b/waJ6DrlTZWLF5tGbEXl6ymPES5Vh+5Mw52V
 pzgmsBFjBQiWVc/FDROjZSQA/3qSJwXvpLgjHGsGbM0dDwGg1OMXqbYzyoaG0hTRj1/8
 CjbzFgY1HhBc+Jd3oi6mptpRDcsUuCGmHycrio73mUjJaFaJOTIPpX85sfexDIp37Bu1
 BKXc+xMaQN7/akXUMCiGz6ruQ3FwP7fCtNWYPUAKjBICkwADFoQ9voyPmYCxPRhNwYD3
 sN4tsflBWvt7TepZjnOtsBY906oXmbB6vAFnbwYc3rDIe6T3pBAHX9BuyoiPSXb39fek
 fB0w==
X-Gm-Message-State: AOAM530rgZ3egQMFUxHCF9QhCqMyX2V8/5d4uxk0xg6qFNuSaT1Dllea
 4d1/VzWUvA1BWTEN4rliK11eMQyyu/Paax9cVmCZTGYC6DYQg959Ftm9exMbAxKSdnt41JBjeSv
 05Kxdkrs52eVa
X-Received: by 2002:a1c:4c05:: with SMTP id z5mr3923142wmf.145.1628592741438; 
 Tue, 10 Aug 2021 03:52:21 -0700 (PDT)
X-Received: by 2002:a1c:4c05:: with SMTP id z5mr3923115wmf.145.1628592741159; 
 Tue, 10 Aug 2021 03:52:21 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id w9sm20220708wmc.19.2021.08.10.03.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:52:20 -0700 (PDT)
Date: Tue, 10 Aug 2021 12:52:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20210810125214.7dadd76b@redhat.com>
In-Reply-To: <20210810083057.99651-1-eric.auger@redhat.com>
References: <20210810083057.99651-1-eric.auger@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
X-TUID: Itp1W6oVrrZV

On Tue, 10 Aug 2021 10:30:57 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> ARM SBBR specification mandates DBG2 table (Debug Port Table 2).
> this latter allows to describe one or more debug ports.
> 
> Generate an DBG2 table featuring a single debug port, the PL011.
> 
> The DBG2 specification can be found at:
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

using packed structures for composing ACPI tables is discouraged,
pls use build_append_int_noprefix() API instead. You can look at
build_amd_iommu() as an example.

PS:
Also note field comments format.
/it should be verbatim copy of entry name from respective table in spec/

> 
> ---
> 
> Tested by comparing the content with the table generated
> by EDK2 along with the SBSA-REF machine (code generated by
> DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c).
> 
> I reused the Generic Address Structure filled by QEMU in the SPCR, ie.
> bit_width = 8 and byte access. While EDK2 sets bit_width = 32 and
> dword access. Also the name exposed by acpica tools is different:
> 'COM0' in my case where '\_SB.COM0' in SBSA-REF case?
> ---
>  hw/arm/virt-acpi-build.c    | 77 ++++++++++++++++++++++++++++++++++++-
>  include/hw/acpi/acpi-defs.h | 50 ++++++++++++++++++++++++
>  2 files changed, 126 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 037cc1fd82..35f27b41df 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -563,6 +563,78 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                   vms->oem_table_id);
>  }
>  
> +#define ACPI_DBG2_PL011_UART_LENGTH 0x1000
> +
> +/* DBG2 */
> +static void
> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +{
> +    int addr_offset, addrsize_offset, namespace_offset, namespace_length;
> +    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
> +    struct AcpiGenericAddress *base_address;
> +    int dbg2_start = table_data->len;
> +    AcpiDbg2Device *dbg2dev;
> +    char name[] = "COM0";
> +    AcpiDbg2Table *dbg2;
> +    uint32_t *addr_size;
> +    uint8_t *namespace;
> +
> +    dbg2 = acpi_data_push(table_data, sizeof *dbg2);
> +    dbg2->info_offset = sizeof *dbg2;
> +    dbg2->info_count = 1;
> +
> +    /* debug device info structure */
> +
> +    dbg2dev = acpi_data_push(table_data, sizeof(AcpiDbg2Device));
> +
> +    dbg2dev->revision = 0;
> +    namespace_length = sizeof name;
> +    dbg2dev->length = sizeof *dbg2dev + sizeof(struct AcpiGenericAddress) +
> +                      4 + namespace_length;
> +    dbg2dev->register_count = 1;
> +
> +    addr_offset = sizeof *dbg2dev;
> +    addrsize_offset = addr_offset + sizeof(struct AcpiGenericAddress);
> +    namespace_offset = addrsize_offset + 4;
> +
> +    dbg2dev->namepath_length = cpu_to_le16(namespace_length);
> +    dbg2dev->namepath_offset = cpu_to_le16(namespace_offset);
> +    dbg2dev->oem_data_length = cpu_to_le16(0);
> +    dbg2dev->oem_data_offset = cpu_to_le16(0); /* No OEM data is present */
> +    dbg2dev->port_type = cpu_to_le16(ACPI_DBG2_SERIAL_PORT);
> +    dbg2dev->port_subtype = cpu_to_le16(ACPI_DBG2_ARM_PL011);
> +
> +    dbg2dev->base_address_offset = cpu_to_le16(addr_offset);
> +    dbg2dev->address_size_offset = cpu_to_le16(addrsize_offset);
> +
> +    /*
> +     * variable length content:
> +     * BaseAddressRegister[1]
> +     * AddressSize[1]
> +     * NamespaceString[1]
> +     */
> +
> +    base_address = acpi_data_push(table_data,
> +                                  sizeof(struct AcpiGenericAddress));
> +
> +    base_address->space_id = AML_SYSTEM_MEMORY;
> +    base_address->bit_width = 8;
> +    base_address->bit_offset = 0;
> +    base_address->access_width = 1;
> +    base_address->address = cpu_to_le64(uart_memmap->base);
> +
> +    addr_size = acpi_data_push(table_data, sizeof *addr_size);
> +    *addr_size = cpu_to_le32(ACPI_DBG2_PL011_UART_LENGTH);
> +
> +    namespace = acpi_data_push(table_data, namespace_length);
> +    memcpy(namespace, name, namespace_length);
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + dbg2_start), "DBG2",
> +                 table_data->len - dbg2_start, 3, vms->oem_id,
> +                 vms->oem_table_id);
> +}
> +
>  /* MADT */
>  static void
>  build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -790,7 +862,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, vms);
>  
> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
> @@ -813,6 +885,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_dbg2(tables_blob, tables->linker, vms);
> +
>      if (vms->ras) {
>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>          acpi_add_table(table_offsets, tables_blob);
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index cf9f44299c..bdb2ebed2c 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -618,4 +618,54 @@ struct AcpiIortRC {
>  } QEMU_PACKED;
>  typedef struct AcpiIortRC AcpiIortRC;
>  
> +/* DBG2 */
> +
> +/* Types for port_type field above */
> +
> +#define ACPI_DBG2_SERIAL_PORT       0x8000
> +#define ACPI_DBG2_1394_PORT         0x8001
> +#define ACPI_DBG2_USB_PORT          0x8002
> +#define ACPI_DBG2_NET_PORT          0x8003
> +
> +/* Subtypes for port_subtype field above */
> +
> +#define ACPI_DBG2_16550_COMPATIBLE  0x0000
> +#define ACPI_DBG2_16550_SUBSET      0x0001
> +#define ACPI_DBG2_ARM_PL011         0x0003
> +#define ACPI_DBG2_ARM_SBSA_32BIT    0x000D
> +#define ACPI_DBG2_ARM_SBSA_GENERIC  0x000E
> +#define ACPI_DBG2_ARM_DCC           0x000F
> +#define ACPI_DBG2_BCM2835           0x0010
> +
> +#define ACPI_DBG2_1394_STANDARD     0x0000
> +
> +#define ACPI_DBG2_USB_XHCI          0x0000
> +#define ACPI_DBG2_USB_EHCI          0x0001
> +
> +/* Debug Device Information Subtable */
> +
> +struct AcpiDbg2Device {
> +    uint8_t  revision;
> +    uint16_t length;
> +    uint8_t  register_count; /* Number of base_address registers */
> +    uint16_t namepath_length;
> +    uint16_t namepath_offset;
> +    uint16_t oem_data_length;
> +    uint16_t oem_data_offset;
> +    uint16_t port_type;
> +    uint16_t port_subtype;
> +    uint8_t  reserved[2];
> +    uint16_t base_address_offset;
> +    uint16_t address_size_offset;
> +}  QEMU_PACKED;
> +typedef struct AcpiDbg2Device AcpiDbg2Device;
> +
> +struct AcpiDbg2Table {
> +    ACPI_TABLE_HEADER_DEF /* ACPI common table header */
> +    uint32_t info_offset; /* offset to the first debug struct */
> +    uint32_t info_count;  /* number of debug device info struct entries */
> +    uint8_t  dbg2_device_info[];
> +} QEMU_PACKED;
> +typedef struct AcpiDbg2Table AcpiDbg2Table;
> +
>  #endif

