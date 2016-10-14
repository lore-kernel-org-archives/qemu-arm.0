Received: by 10.80.166.35 with SMTP id d32csp157105edc;
        Fri, 14 Oct 2016 01:25:33 -0700 (PDT)
X-Received: by 10.200.36.154 with SMTP id s26mr11466809qts.0.1476433533794;
        Fri, 14 Oct 2016 01:25:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a68si9026742qkd.23.2016.10.14.01.25.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 01:25:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buxo5-0004gN-8n
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 04:25:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1buxmz-0003wQ-2b
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 04:24:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1buxmu-0001Vq-Mc
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 04:24:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36888)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1buxmu-0001VV-C3; Fri, 14 Oct 2016 04:24:20 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57D9667EC2;
	Fri, 14 Oct 2016 08:24:19 +0000 (UTC)
Received: from localhost.localdomain (vpn1-4-131.ams2.redhat.com [10.36.4.131])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9E8OFY9012252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 14 Oct 2016 04:24:16 -0400
To: Andrew Jones <drjones@redhat.com>
References: <1476356143-10577-1-git-send-email-eric.auger@redhat.com>
	<1476356143-10577-3-git-send-email-eric.auger@redhat.com>
	<20161013151153.i2pdbaijo2k32nns@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <657b1338-d093-a0bb-aadc-46fe4a7c8c78@redhat.com>
Date: Fri, 14 Oct 2016 10:24:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20161013151153.i2pdbaijo2k32nns@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 14 Oct 2016 08:24:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] ARM: Virt: ACPI: Build an
 IORT table with RC and ITS nodes
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
X-TUID: QcG0OIEsP7fe

Drew,

On 13/10/2016 17:11, Andrew Jones wrote:
> On Thu, Oct 13, 2016 at 12:55:43PM +0200, Eric Auger wrote:
>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>
>> This patch builds an IORT table that features a root complex node and
>> an ITS node. This complements the ITS description in the ACPI MADT
>> table and allows vhost-net on ACPI guest.
>>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 71 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index fa0655a..373630a 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -384,6 +384,73 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
>>  }
>>  
>>  static void
>> +build_iort(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>> +{
>> +    int iort_start = table_data->len;
>> +    AcpiIortTable *iort;
>> +    AcpiIortNode *iort_node;
>> +    AcpiIortItsGroup *its;
>> +    AcpiIortRC *rc;
>> +    AcpiIortIdMapping *idmap;
>> +    size_t node_size;
>> +
>> +    /* at the moment if there is no its, no need to build the IORT */
>> +    if (!its_class_name() || guest_info->no_its) {
>> +        return;
>> +    }
> 
> This should wrap the calls to acpi_add_table and build_iort down in
> virt_acpi_build, like what is done for the SRAT.
OK
> 
>> +
>> +    iort = acpi_data_push(table_data, sizeof(*iort));
>> +
>> +    iort->length = sizeof(*iort);
> 
> Missing cpu_to_le* here and many places below.
hum my bad
> 
>> +    iort->node_offset = table_data->len - iort_start;
>> +
>> +    /* ITS group node featuring a single ITS identifier */
>> +    iort->node_count++;
> 
> Let's just set node_count to 2 at the beginning, under a
> comment describing what's being built; an IORT with two
> nodes, one ITS group and one RC.
OK
> 
>> +    node_size =  sizeof(*its) + sizeof(uint32_t);
>> +    its = acpi_data_push(table_data, node_size);
>> +
>> +    iort_node = &its->iort_node;
>> +    iort_node->type = ACPI_IORT_NODE_ITS_GROUP;
> 
> I think
>  its->type = 0; /* 0: ITS Group */ 
> would be fine here.
Well I just keep that define. Looks clearer to me.
> 
>> +    iort_node->length = node_size;
> 
> As mentioned in the previous patch this separate struct for the
> node header isn't necessary, and it's actually making this code
> confusing.
Indeed I acknowledge looking at the code now. thanks for the hint.
> 
>> +    iort->length += iort_node->length;
>> +
>> +    iort_node->mapping_count = 0;  /* ITS groups do not have IDs */
>> +    iort_node->mapping_offset = 0; /* no ID array */
> 
> These assignments aren't necessary and just reproduce the documentation
> in the spec.
OK
> 
>> +    its->its_count = 1;            /* single ITS identifier */
> 
> The comment here just describes the code, I'd drop it.
OK
> 
>> +    its->identifiers[0] = 0;       /* ID = 0 as described in the MADT */
> 
> Might be nice to point precisely at the madt 'translation_id'
> in the comment.
OK
> 
>> +
>> +    /* Root Complex Node with a single ID mapping*/
>> +    iort->node_count++;
>> +    node_size = sizeof(*rc) + sizeof(*idmap);
>> +    rc = acpi_data_push(table_data, node_size);
>> +
>> +    iort_node = &rc->iort_node;
>> +    iort_node->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
>> +    iort_node->length = node_size;
>> +    iort->length += iort_node->length;
>> +
>> +    iort_node->mapping_count = 1;
>> +    iort_node->mapping_offset = sizeof(*rc);
>> +
>> +    rc->memory_properties.cache_coherency = ACPI_IORT_NODE_COHERENT;
> 
> cache_coherency = cpu_to_le32(1); /* device is fully coherent */
OK
> 
>> +    rc->memory_properties.hints = 0;
> 
> No need to explicitly zero hints.
OK
> 
>> +    rc->memory_properties.memory_flags = 0;
> 
> I have a feeling we'll be revisiting these flags some day, resolving
> cache coherency issues... Hmm, actually it appears per Table 15 of
> the spec that this configuration is illegal. We can't have CCA 1 and
> CPM 0. When this gets sorted out I think we need a comment explaining
> how whatever the final selection is was selected.
You're right. Did not pay too much attention to that since the
functional behavior looked ok. Looks like CCA = CPM = DACS = 1 is the
preferred solution then since DACS == 0 would rely on an smmu override.
> 
>> +    rc->ats_attribute = 0;      /* does not support ATS */
> 
> Can probably just drop the above assignment.
OK
> 
>> +    rc->pci_segment_number = 0; /* MCFG _SEG */
> 
> Maybe comment pointing precisely to mcfg 'pci_segment'
OK
> 
>> +
>> +    /* fill array of ID mappings */
>> +    idmap = &rc->id_mapping_array[0];
>> +    idmap->input_base = 0;
>> +    idmap->id_count = 0xFFFF;
>> +    idmap->output_base = 0;
>> +    idmap->output_reference = iort->node_offset;
>> +    idmap->flags = 0;
> 
> Comments for all the above would be good. Why base of zero? Why count of
> 0xffff? "output reference points to the offset of the ITS group node"
> Why 'single mapping' flag is zero?
single mapping flag == 0, that's the spec ;-) I guess we don't want a
single RID output per input RID. I will add a comment saying that this
corresponds to an identity mapping covering the whole input RID range (16b)
> 
>> +
>> +    build_header(linker, table_data, (void *)(table_data->data + iort_start),
>> +                 "IORT", table_data->len - iort_start, 0, NULL, NULL);
>> +}
>> +
>> +static void
>>  build_spcr(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>>  {
>>      AcpiSerialPortConsoleRedirection *spcr;
>> @@ -676,6 +743,7 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>>       * MADT
>>       * MCFG
>>       * DSDT
>> +     * IORT = ACPI 6.0
>>       */
> 
> I think the whole comment block above should just be removed. I'm not sure
> what it adds besides a burden of maintenance.
OK
> 
>>  
>>      /* DSDT is pointed to by FADT */
>> @@ -703,6 +771,9 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>>          build_srat(tables_blob, tables->linker, guest_info);
>>      }
>>  
>> +    acpi_add_table(table_offsets, tables_blob);
>> +    build_iort(tables_blob, tables->linker, guest_info);
> 
> As mentioned above, this should be where we have the !its_class_name()
> guard.
OK

Thanks for the detailed review.

Eric
> 
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
