Received: by 10.80.166.35 with SMTP id d32csp240718edc;
        Fri, 14 Oct 2016 05:03:37 -0700 (PDT)
X-Received: by 10.237.35.136 with SMTP id j8mr11878108qtc.117.1476446617095;
        Fri, 14 Oct 2016 05:03:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v201si9457163qka.130.2016.10.14.05.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 05:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bv1D6-0003lZ-K2
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 08:03:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bv1Cz-0003lR-Gb
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 08:03:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bv1Cu-0007L2-Du
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 08:03:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bv1Cu-0007Kh-48; Fri, 14 Oct 2016 08:03:24 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32FFCC04B332;
	Fri, 14 Oct 2016 12:03:23 +0000 (UTC)
Received: from localhost.localdomain (vpn1-4-131.ams2.redhat.com [10.36.4.131])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9EC3J61026707
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 14 Oct 2016 08:03:20 -0400
To: Andrew Jones <drjones@redhat.com>
References: <1476435295-21885-1-git-send-email-eric.auger@redhat.com>
	<1476435295-21885-3-git-send-email-eric.auger@redhat.com>
	<20161014115723.zot2hd3vabqtb65p@hawk.localdomain>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <29e0a28e-1876-2a50-ea06-9a7853fbe978@redhat.com>
Date: Fri, 14 Oct 2016 14:03:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20161014115723.zot2hd3vabqtb65p@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 14 Oct 2016 12:03:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] ARM: Virt: ACPI: Build
 an IORT table with RC and ITS nodes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, tn@semihalf.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org,
	prem.mallappa@broadcom.com, christoffer.dall@linaro.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ABjF6Vaj8+Jm

Hi Drew,

On 14/10/2016 13:57, Andrew Jones wrote:
> On Fri, Oct 14, 2016 at 10:54:55AM +0200, Eric Auger wrote:
>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>
>> This patch builds an IORT table that features a root complex node and
>> an ITS node. This complements the ITS description in the ACPI MADT
>> table and allows vhost-net on ACPI guest.
>>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - its_class_name() || !guest_info->no_its now wraps acpi_add_table
>>   and build_iort
>> - add cpu_to_le*
>> - CCA = CPM = DACS = 1
>> - cleanup according to Drew's comments
>> - remove comments listing tables and spec revisions
>> ---
>>  hw/arm/virt-acpi-build.c | 73 ++++++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 62 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index fa0655a..5fc0fd7 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -384,6 +384,63 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
>>  }
>>  
>>  static void
>> +build_iort(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>> +{
>> +    int iort_start = table_data->len;
>> +    AcpiIortIdMapping *idmap;
>> +    AcpiIortItsGroup *its;
>> +    AcpiIortTable *iort;
>> +    size_t node_size, iort_length;
>> +    AcpiIortRC *rc;
>> +
>> +    iort = acpi_data_push(table_data, sizeof(*iort));
>> +
>> +    iort_length = sizeof(*iort);
>> +    iort->node_count = cpu_to_le32(2); /* RC and ITS nodes */
>> +    iort->node_offset = cpu_to_le32(table_data->len - iort_start);
> 
> table_data->len - iort_start = sizeof(*iort), I think the later would
> be nicer to use.
hum yes looks sensible :-)
> 
>> +
>> +    /* ITS group node */
>> +    node_size =  sizeof(*its) + sizeof(uint32_t);
>> +    iort_length += node_size;
>> +    its = acpi_data_push(table_data, node_size);
>> +
>> +    its->type = ACPI_IORT_NODE_ITS_GROUP;
>> +    its->length = cpu_to_le16(node_size);
> unnecessary blank line
OK
>> +
>> +    its->its_count = cpu_to_le32(1);
>> +    its->identifiers[0] = 0; /* madt translation_id = 0 */
> 
> /madt/MADT/
> can probably drop the '= 0' in the comment
OK
> 
>> +
>> +    /* Root Complex Node */
>> +    node_size = sizeof(*rc) + sizeof(*idmap);
>> +    iort_length += node_size;
>> +    rc = acpi_data_push(table_data, node_size);
>> +
>> +    rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
>> +    rc->length = cpu_to_le16(node_size);
> unnecessary blank line
OK
>> +
>> +    rc->mapping_count = cpu_to_le32(1);
>> +    rc->mapping_offset = cpu_to_le32(sizeof(*rc));
>> +
>> +    /* fully coherent device */
>> +    rc->memory_properties.cache_coherency = cpu_to_le32(1);
>> +    rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
>> +    rc->pci_segment_number = 0; /* MCFG pci_segment */
>> +
>> +    /* Identity RID mapping covering the whole input RID range */
>> +    idmap = &rc->id_mapping_array[0];
>> +    idmap->input_base = 0;
>> +    idmap->id_count = cpu_to_le32(0xFFFF);
>> +    idmap->output_base = 0;
>> +    idmap->output_reference = cpu_to_le32(iort->node_offset);
> 
> I'd still like a comment for output_reference stating that this is where
> we're mapping the output of the root complex to the ITS group node.
yep
> 
>> +    idmap->flags = 0;
> 
> I think we can drop this flags assignment, otherwise we need to comment
> it.
yep

Thanks

Eric
> 
>> +
>> +    iort->length = cpu_to_le32(iort_length);
>> +
>> +    build_header(linker, table_data, (void *)(table_data->data + iort_start),
>> +                 "IORT", table_data->len - iort_start, 0, NULL, NULL);
>> +}
>> +
>> +static void
>>  build_spcr(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>>  {
>>      AcpiSerialPortConsoleRedirection *spcr;
>> @@ -667,17 +724,6 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>>                               ACPI_BUILD_TABLE_FILE, tables_blob,
>>                               64, false /* high memory */);
>>  
>> -    /*
>> -     * The ACPI v5.1 tables for Hardware-reduced ACPI platform are:
>> -     * RSDP
>> -     * RSDT
>> -     * FADT
>> -     * GTDT
>> -     * MADT
>> -     * MCFG
>> -     * DSDT
>> -     */
>> -
>>      /* DSDT is pointed to by FADT */
>>      dsdt = tables_blob->len;
>>      build_dsdt(tables_blob, tables->linker, guest_info);
>> @@ -703,6 +749,11 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>>          build_srat(tables_blob, tables->linker, guest_info);
>>      }
>>  
>> +    if (its_class_name() && !guest_info->no_its) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_iort(tables_blob, tables->linker, guest_info);
>> +    }
>> +
>>      /* RSDT is pointed to by RSDP */
>>      rsdt = tables_blob->len;
>>      build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
>> -- 
>> 2.5.5
>>
>>
> 
> Thanks,
> drew 
> 
