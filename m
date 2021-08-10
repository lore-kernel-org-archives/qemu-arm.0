Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1267662lff;
        Tue, 10 Aug 2021 05:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/BYLyzhnJ/T9cwiFHmssy4lRGpa3nBTLGyEqcedkUDZYfKzO2aF5Au0dt1+ly1dbpjL2D
X-Received: by 2002:a1f:55:: with SMTP id 82mr17873087vka.5.1628598057119;
        Tue, 10 Aug 2021 05:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628598057; cv=none;
        d=google.com; s=arc-20160816;
        b=m5R1VoQ9Y6F6olhvJpOIChSg+EbEpYKzvkKQ1qEDqezmwsPOcZrj5+Njdg8VBWSjSG
         eogEj5gf01fTKwEYThYIINT0KIRePsg//d15Og04Zm2asvyYHSP/flDEvc3JZFK7K7JR
         z8MZYAfpeblOL2bq4CNU1RSqlplJpBl8GMG3rnNACG53Hb3LCUjMUtgHLmozAJ/Y+aro
         GJ4qC4MXfCvqbOK6pCLv8y0ObNqZEWzORQfY5pOUWI2bQVTFLZ9M/G2swNND2kUFnxhw
         Ad5ojWgQCCPDLjp3Tgbs6dzAIbjEBX1bNkkjmbFkhRd8zXdS6DFuPfLpb7HBrAVQmW6y
         rkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=V1RkxYizCmQ49ZnyUjK95dICifCsXwjZVdmZrmO/zDM=;
        b=XUgl6XNPLs/WcGOVQxGlxJEV8a9eg/jc5WVZUOzIgnFXYTWAS5wXwg2NU9H9p25x0R
         RlCNSH7Sw3JM+/sfP6b+L+FL71ViA4QkZU6nFkCBmHqVI6V7ZU3eBkkF18BhCp44u4/P
         tUvkeK8V7hCMe/5/0TSdAg9z67g32we1iz2U1AAhBL5DQx6dvczkfT5FoVfy9MtQrN4p
         LCUA6H8fBljZNows+903aKBGBTTScqkM10G3846VNN7VISe8QrvmGgdYzH+kZQ8IoiaU
         L5JEILG++vRYbFwi5YhK2el5ltiQzTdy9S7/lr0H/OOKe7BiKM3D2HK7YtSldYzaAEqV
         Nfpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RrB3Elnm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y193si1147624vsy.341.2021.08.10.05.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 05:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RrB3Elnm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDQka-000204-61
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 08:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mDQkI-0001sA-QO
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 08:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mDQkD-0001VY-14
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 08:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628598032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1RkxYizCmQ49ZnyUjK95dICifCsXwjZVdmZrmO/zDM=;
 b=RrB3ElnmgqZcSFzrc5szl0mF+zwPZkZ1MFwosTgWhFQzWVzxn14eN5rWApUyIa9avzyDJ/
 2I3RODnRKfZ21xa5jFpgR6IIZ5Ze/cLKZG3XLMBbAtPPQS1wIiEPrQCMjK38Pni0ssqOJD
 CIoXe9bqx8iFMbc8zFlo8Zv0lPIz8nw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-Ee-tzBWTN2Okva-3J_eIKg-1; Tue, 10 Aug 2021 08:20:30 -0400
X-MC-Unique: Ee-tzBWTN2Okva-3J_eIKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r21-20020a05600c35d5b02902e685ef1f76so957741wmq.5
 for <qemu-arm@nongnu.org>; Tue, 10 Aug 2021 05:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V1RkxYizCmQ49ZnyUjK95dICifCsXwjZVdmZrmO/zDM=;
 b=blP8O8oK74q+oMZaWLp4kJ0E9wFJEDD6oRn12/Q6dgyO/2kn4gXNn2cplg6QuG0kvV
 KEf9gA2b5OgSWu0yw95lM3XPDRLV8svXGqPnQ/MPPUn4eQAbDNURmbhq4XlXvs7JUxA7
 Kq45Nfem/5j46elB3FdnMDFAnnPa1IMPecKCQPPcPB1a3+Sj997WyeUXsq8rkj9+UVPB
 sNpcB8iFS03k6yXKXgaaW74WIEa3UEAwdRTP9ZB/UFecEsp9b1ucNl4z3yZEsldgpVx5
 WN7EuoytWgWUIX62BV4enpcdcdFWxViwQ6JZu3Vc3GOa+GVg8nem9HHkM9hjAs2iDbfO
 maDQ==
X-Gm-Message-State: AOAM533pVf0JjNzWHJsYiC7upPGwS7ktlRloaTTWo2S5SCskxKffnTfQ
 g/KTH4W7ZDRR4KGQVumHT9BC1Qv3ZYDiMF7B5pjvikc6d8PTvz7RZydOnaxMa4lmooxR05xVTSh
 aZsaC4j28U4p8
X-Received: by 2002:adf:ef4d:: with SMTP id c13mr30464161wrp.281.1628598029219; 
 Tue, 10 Aug 2021 05:20:29 -0700 (PDT)
X-Received: by 2002:adf:ef4d:: with SMTP id c13mr30464134wrp.281.1628598028984; 
 Tue, 10 Aug 2021 05:20:28 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id u11sm22843809wrt.89.2021.08.10.05.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 05:20:28 -0700 (PDT)
Date: Tue, 10 Aug 2021 14:20:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20210810142000.03fffdd4@redhat.com>
In-Reply-To: <09fd10e1-8952-8ba7-2467-d3545a08bddf@redhat.com>
References: <20210810083057.99651-1-eric.auger@redhat.com>
 <20210810125214.7dadd76b@redhat.com>
 <09fd10e1-8952-8ba7-2467-d3545a08bddf@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
X-TUID: bSWkAVNwxdiV

On Tue, 10 Aug 2021 14:05:40 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 8/10/21 12:52 PM, Igor Mammedov wrote:
> > On Tue, 10 Aug 2021 10:30:57 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >  
> >> ARM SBBR specification mandates DBG2 table (Debug Port Table 2).
> >> this latter allows to describe one or more debug ports.
> >>
> >> Generate an DBG2 table featuring a single debug port, the PL011.
> >>
> >> The DBG2 specification can be found at:
> >> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>  
> > using packed structures for composing ACPI tables is discouraged,
> > pls use build_append_int_noprefix() API instead. You can look at
> > build_amd_iommu() as an example.  
> 
> I understand this for new code outside of hw/arm/virt-acpi-build.c.
> However build_append_int_noprefix() is not (yet) used in
> virt-acpi-build.c so this would bring heterogeneity. So does it mean
> that any new ACPI description introduced there should also adopt this
> new style? Drew will suggest to migrate everything but well ;-)


new style should be used for any new ACPI code.
There is a series on list that converts old style to new style across tree
(currently planned for merging into 6.2)
https://www.mail-archive.com/qemu-devel@nongnu.org/msg822151.html
So I'm going to push back any new patches that use old style
to reduce time on rewriting others code when it could be written
using preferred style.

PS:
Perhaps you'd like to review ARM related patches.


> Thanks
> 
> Eric
> >
> > PS:
> > Also note field comments format.
> > /it should be verbatim copy of entry name from respective table in spec/
> >  
> >> ---
> >>
> >> Tested by comparing the content with the table generated
> >> by EDK2 along with the SBSA-REF machine (code generated by
> >> DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c).
> >>
> >> I reused the Generic Address Structure filled by QEMU in the SPCR, ie.
> >> bit_width = 8 and byte access. While EDK2 sets bit_width = 32 and
> >> dword access. Also the name exposed by acpica tools is different:
> >> 'COM0' in my case where '\_SB.COM0' in SBSA-REF case?
> >> ---
> >>  hw/arm/virt-acpi-build.c    | 77 ++++++++++++++++++++++++++++++++++++-
> >>  include/hw/acpi/acpi-defs.h | 50 ++++++++++++++++++++++++
> >>  2 files changed, 126 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 037cc1fd82..35f27b41df 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -563,6 +563,78 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>                   vms->oem_table_id);
> >>  }
> >>  
> >> +#define ACPI_DBG2_PL011_UART_LENGTH 0x1000
> >> +
> >> +/* DBG2 */
> >> +static void
> >> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >> +{
> >> +    int addr_offset, addrsize_offset, namespace_offset, namespace_length;
> >> +    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
> >> +    struct AcpiGenericAddress *base_address;
> >> +    int dbg2_start = table_data->len;
> >> +    AcpiDbg2Device *dbg2dev;
> >> +    char name[] = "COM0";
> >> +    AcpiDbg2Table *dbg2;
> >> +    uint32_t *addr_size;
> >> +    uint8_t *namespace;
> >> +
> >> +    dbg2 = acpi_data_push(table_data, sizeof *dbg2);
> >> +    dbg2->info_offset = sizeof *dbg2;
> >> +    dbg2->info_count = 1;
> >> +
> >> +    /* debug device info structure */
> >> +
> >> +    dbg2dev = acpi_data_push(table_data, sizeof(AcpiDbg2Device));
> >> +
> >> +    dbg2dev->revision = 0;
> >> +    namespace_length = sizeof name;
> >> +    dbg2dev->length = sizeof *dbg2dev + sizeof(struct AcpiGenericAddress) +
> >> +                      4 + namespace_length;
> >> +    dbg2dev->register_count = 1;
> >> +
> >> +    addr_offset = sizeof *dbg2dev;
> >> +    addrsize_offset = addr_offset + sizeof(struct AcpiGenericAddress);
> >> +    namespace_offset = addrsize_offset + 4;
> >> +
> >> +    dbg2dev->namepath_length = cpu_to_le16(namespace_length);
> >> +    dbg2dev->namepath_offset = cpu_to_le16(namespace_offset);
> >> +    dbg2dev->oem_data_length = cpu_to_le16(0);
> >> +    dbg2dev->oem_data_offset = cpu_to_le16(0); /* No OEM data is present */
> >> +    dbg2dev->port_type = cpu_to_le16(ACPI_DBG2_SERIAL_PORT);
> >> +    dbg2dev->port_subtype = cpu_to_le16(ACPI_DBG2_ARM_PL011);
> >> +
> >> +    dbg2dev->base_address_offset = cpu_to_le16(addr_offset);
> >> +    dbg2dev->address_size_offset = cpu_to_le16(addrsize_offset);
> >> +
> >> +    /*
> >> +     * variable length content:
> >> +     * BaseAddressRegister[1]
> >> +     * AddressSize[1]
> >> +     * NamespaceString[1]
> >> +     */
> >> +
> >> +    base_address = acpi_data_push(table_data,
> >> +                                  sizeof(struct AcpiGenericAddress));
> >> +
> >> +    base_address->space_id = AML_SYSTEM_MEMORY;
> >> +    base_address->bit_width = 8;
> >> +    base_address->bit_offset = 0;
> >> +    base_address->access_width = 1;
> >> +    base_address->address = cpu_to_le64(uart_memmap->base);
> >> +
> >> +    addr_size = acpi_data_push(table_data, sizeof *addr_size);
> >> +    *addr_size = cpu_to_le32(ACPI_DBG2_PL011_UART_LENGTH);
> >> +
> >> +    namespace = acpi_data_push(table_data, namespace_length);
> >> +    memcpy(namespace, name, namespace_length);
> >> +
> >> +    build_header(linker, table_data,
> >> +                 (void *)(table_data->data + dbg2_start), "DBG2",
> >> +                 table_data->len - dbg2_start, 3, vms->oem_id,
> >> +                 vms->oem_table_id);
> >> +}
> >> +
> >>  /* MADT */
> >>  static void
> >>  build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >> @@ -790,7 +862,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >>      dsdt = tables_blob->len;
> >>      build_dsdt(tables_blob, tables->linker, vms);
> >>  
> >> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> >> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
> >>      acpi_add_table(table_offsets, tables_blob);
> >>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
> >>  
> >> @@ -813,6 +885,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >>      acpi_add_table(table_offsets, tables_blob);
> >>      build_spcr(tables_blob, tables->linker, vms);
> >>  
> >> +    acpi_add_table(table_offsets, tables_blob);
> >> +    build_dbg2(tables_blob, tables->linker, vms);
> >> +
> >>      if (vms->ras) {
> >>          build_ghes_error_table(tables->hardware_errors, tables->linker);
> >>          acpi_add_table(table_offsets, tables_blob);
> >> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> >> index cf9f44299c..bdb2ebed2c 100644
> >> --- a/include/hw/acpi/acpi-defs.h
> >> +++ b/include/hw/acpi/acpi-defs.h
> >> @@ -618,4 +618,54 @@ struct AcpiIortRC {
> >>  } QEMU_PACKED;
> >>  typedef struct AcpiIortRC AcpiIortRC;
> >>  
> >> +/* DBG2 */
> >> +
> >> +/* Types for port_type field above */
> >> +
> >> +#define ACPI_DBG2_SERIAL_PORT       0x8000
> >> +#define ACPI_DBG2_1394_PORT         0x8001
> >> +#define ACPI_DBG2_USB_PORT          0x8002
> >> +#define ACPI_DBG2_NET_PORT          0x8003
> >> +
> >> +/* Subtypes for port_subtype field above */
> >> +
> >> +#define ACPI_DBG2_16550_COMPATIBLE  0x0000
> >> +#define ACPI_DBG2_16550_SUBSET      0x0001
> >> +#define ACPI_DBG2_ARM_PL011         0x0003
> >> +#define ACPI_DBG2_ARM_SBSA_32BIT    0x000D
> >> +#define ACPI_DBG2_ARM_SBSA_GENERIC  0x000E
> >> +#define ACPI_DBG2_ARM_DCC           0x000F
> >> +#define ACPI_DBG2_BCM2835           0x0010
> >> +
> >> +#define ACPI_DBG2_1394_STANDARD     0x0000
> >> +
> >> +#define ACPI_DBG2_USB_XHCI          0x0000
> >> +#define ACPI_DBG2_USB_EHCI          0x0001
> >> +
> >> +/* Debug Device Information Subtable */
> >> +
> >> +struct AcpiDbg2Device {
> >> +    uint8_t  revision;
> >> +    uint16_t length;
> >> +    uint8_t  register_count; /* Number of base_address registers */
> >> +    uint16_t namepath_length;
> >> +    uint16_t namepath_offset;
> >> +    uint16_t oem_data_length;
> >> +    uint16_t oem_data_offset;
> >> +    uint16_t port_type;
> >> +    uint16_t port_subtype;
> >> +    uint8_t  reserved[2];
> >> +    uint16_t base_address_offset;
> >> +    uint16_t address_size_offset;
> >> +}  QEMU_PACKED;
> >> +typedef struct AcpiDbg2Device AcpiDbg2Device;
> >> +
> >> +struct AcpiDbg2Table {
> >> +    ACPI_TABLE_HEADER_DEF /* ACPI common table header */
> >> +    uint32_t info_offset; /* offset to the first debug struct */
> >> +    uint32_t info_count;  /* number of debug device info struct entries */
> >> +    uint8_t  dbg2_device_info[];
> >> +} QEMU_PACKED;
> >> +typedef struct AcpiDbg2Table AcpiDbg2Table;
> >> +
> >>  #endif  
> 

