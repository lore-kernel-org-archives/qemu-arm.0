Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1246418lff;
        Tue, 10 Aug 2021 04:55:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIJ3MLzrAnAoqHGQmnCdopG343TL0SdBk+DsgGxzEZpL1PelWrV69TPEufqH75808/kh09
X-Received: by 2002:a05:6e02:1561:: with SMTP id k1mr46083ilu.25.1628596530382;
        Tue, 10 Aug 2021 04:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628596530; cv=none;
        d=google.com; s=arc-20160816;
        b=kUX4go/HHMW3bfuZzjVgK6f6ONY8Bk6WHqkVTuP7Bi3xomjHGSf7JgZWSDTa3JX1lg
         gudbtr2rSvCXdCQDXZxCcbSj/HImwcriGY1t2J6unAXiyDJpnszHLBrUquHaSVIL/Upc
         /V3i42UNRM1gdJDE2GmvDEYVhrNV0YSFD+4zXkaKsnFsCOlcMxtzoZNexoSsBTTLXgjN
         TDvOap5aEU9twr9HwjUPqi+UTxeUu02osZucP5I11tQBVKOdMQD1CL1M3i3nEjf+sE4D
         mUI7PYYnWvbfioRswP5OrLX1NbzhKwuvBDAywWaJzZvEzh98uwG0ub/AqT8gT0iv7Hru
         neWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Lrll1cw2JOAbQ+KC4AC+QJPmOk9rxjzqjrhQ8vsXsEM=;
        b=v2by/nPcBkrvwWKFOZYwpH1kvS762B333CaVHL2XP/K3N/Wzw7zkOCBDoIZTPBGCDn
         mkT43c1q/DawP9+PSiburOwy7dNLg368cWxZBtdPjty4oDjSwji0bRIHL9RQFBGlkO23
         uvauv83YkJIILWDr8sQ2st8ghlng3HMYglTnQL593Tv+f3ZO61PdKdzg7g+upJ+uboEb
         2yrRiT4wCN/rQeVyDrC4g4k2VNCabMRmqa/4+iPnol0Dr9TLjGWEekYOZjEAcliJGS1N
         YzlpMvjowBbdpjAutZ3Xre1PZnXSJg7nBTKdcFdivDTplsTr3bhEqxLkkAiZtjoKBBKJ
         4nNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=agfUJH4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si26459758ild.123.2021.08.10.04.55.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 04:55:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=agfUJH4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDQLx-0001fY-Lv
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 07:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mDQLo-0001em-KQ
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 07:55:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mDQLm-0008HX-8O
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 07:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628596517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lrll1cw2JOAbQ+KC4AC+QJPmOk9rxjzqjrhQ8vsXsEM=;
 b=agfUJH4+ZI57OOPt5fgwFR+1LV2S4hTvn8ARZWQlIDCVfnD1WKQcF8SkezJB0E2uHbRAFe
 U7bucOdhqEcUmOEVx20ZS0TD6mwTXm3sbbAYMEP8R/CcR+5buC3ECc0uxbw9A/gbdHI2vF
 y0Xr1pjOSxex8k+KZGAs9Iu+d/sYKy4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-HPCpXvOmO_yraVOzQ4gFjg-1; Tue, 10 Aug 2021 07:55:16 -0400
X-MC-Unique: HPCpXvOmO_yraVOzQ4gFjg-1
Received: by mail-ed1-f69.google.com with SMTP id
 l18-20020a0564021252b02903be7bdd65ccso4925edw.12
 for <qemu-arm@nongnu.org>; Tue, 10 Aug 2021 04:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lrll1cw2JOAbQ+KC4AC+QJPmOk9rxjzqjrhQ8vsXsEM=;
 b=X+qMjFnJekXFoHLeVv3OaK8MCR1Zp3z41khvVIHQqNq6RkwCQ3tCS3UUNYHnKr7OOK
 uPtxPnrQGem6+IKdDJWk5Tu8Ggp8RXqU+WoO8gQDyVemdDQ9rOtLChI9TYmJd+f1Sp4+
 ngUyyDg69MI7HaW0TxFS50Bac7Z0RiMNYbrfPzvcd6G5GSJT8lP2hEDPxHM+TL7QOvZE
 XvOnwA2upL1Qj4GVj2Qj8LpvQFGFQvYKTr06FLYG9UaSZRNmxyGJdbiKO8e5MMxxedhu
 31fzFmK62oHgEPo62c8EmtQpRIQpeJFh2u4pFt+2OW2sRAXXSBJ0Ct474pH8rsq9K9bG
 8yHQ==
X-Gm-Message-State: AOAM533IPYe7Xt7BMJjichYCjqqM2yFhSO6MrSljTeyay2MNTVmWqaA0
 PTrjnTtXO35TRz+amnFi0D6OnuwKGRFOBxaLoS6ZVUp7Hu0cL5ZccypLI3RfcH0nGrO+Z3bMLs/
 ML4wl5PBQ4Ar7
X-Received: by 2002:a50:ee15:: with SMTP id g21mr4445880eds.88.1628596514959; 
 Tue, 10 Aug 2021 04:55:14 -0700 (PDT)
X-Received: by 2002:a50:ee15:: with SMTP id g21mr4445848eds.88.1628596514715; 
 Tue, 10 Aug 2021 04:55:14 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id gl2sm121425ejb.110.2021.08.10.04.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 04:55:13 -0700 (PDT)
Date: Tue, 10 Aug 2021 13:55:11 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20210810115511.oq2wcjgniy7mitto@gator.home>
References: <20210810083057.99651-1-eric.auger@redhat.com>
 <CAMj1kXHie7aFoQ-7aMcckX2OMepbGeE6SLV8x=FDppeZHws5OA@mail.gmail.com>
 <4dae638d-6f96-c036-2a6b-5ef179012029@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4dae638d-6f96-c036-2a6b-5ef179012029@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>, gshan@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Masters <jcm@redhat.com>,
 qemu-devel@nongnu.org, Al Stone <ahs3@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u+IugjihZHT9

On Tue, Aug 10, 2021 at 12:25:07PM +0200, Eric Auger wrote:
> Hello Ard,
> On 8/10/21 11:36 AM, Ard Biesheuvel wrote:
> > On Tue, 10 Aug 2021 at 10:31, Eric Auger <eric.auger@redhat.com> wrote:
> >> ARM SBBR specification mandates DBG2 table (Debug Port Table 2).
> >> this latter allows to describe one or more debug ports.
> >>
> >> Generate an DBG2 table featuring a single debug port, the PL011.
> >>
> >> The DBG2 specification can be found at:
> >> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
> >>
> > Have the legal issues around this table been resolved in the mean
> > time?
> I don't know exactly what they are. Adding Al and Jon in the loop they
> have more information about this.
> How did you resolve the issue for EDK2
> (DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c)?
> >  Also, any clue why this table is mandatory to begin with? The
> > SBBR has been very trigger happy lately with making things mandatory
> > that aren't truly required from a functional perspective.
> It seems there are kernel FW test suites that check all mandated tables
> are available and they currently fail for ARM virt.
> Indeed from a function pov, I don't know much about its usage on ARM.

There's also a bug with getting console output on tty0 with graphical VMs

https://bugzilla.redhat.com/show_bug.cgi?id=1661288

Discussion that includes DBG2 as a possible solution starts around comment
47. I just skimmed the BZ again though and there doesn't appear to be a
clear consensus that DBG2 is the solution.

Thanks,
drew

> 
> Maybe the SBBR spec should not flag the DBG2 as mandatory and test
> suites shall be updated. I think this should be clarified at ARM then,
> all the more so if there are legal issues as its spec is owned by Microsoft?
> 
> Thanks
> 
> Eric
> >
> >
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
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
> >> --
> >> 2.26.3
> >>
> 

