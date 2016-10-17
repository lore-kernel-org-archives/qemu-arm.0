Received: by 10.80.166.35 with SMTP id d32csp489423edc;
        Mon, 17 Oct 2016 07:17:37 -0700 (PDT)
X-Received: by 10.13.233.4 with SMTP id s4mr21438123ywe.58.1476713857020;
        Mon, 17 Oct 2016 07:17:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q188si916991ywc.186.2016.10.17.07.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 07:17:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bw8jQ-0005jR-AA
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 10:17:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bw8ZS-0005Rp-MP
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 10:07:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bw8ZM-0000IJ-Rh
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 10:07:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40668)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1bw8ZM-0000I6-Jw; Mon, 17 Oct 2016 10:07:12 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9A90C05681A;
	Mon, 17 Oct 2016 14:07:11 +0000 (UTC)
Received: from kamzik.brq.redhat.com ([10.34.1.163])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9HE77Ps009248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 17 Oct 2016 10:07:09 -0400
Date: Mon, 17 Oct 2016 16:07:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20161017140707.ygezwdokyw4lj53s@kamzik.brq.redhat.com>
References: <1476707466-14300-1-git-send-email-eric.auger@redhat.com>
	<1476707466-14300-3-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476707466-14300-3-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 17 Oct 2016 14:07:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 2/2] ARM: Virt: ACPI: Build an IORT table
 with RC and ITS nodes
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
X-TUID: 5wjOQvn38e3r

On Mon, Oct 17, 2016 at 02:31:06PM +0200, Eric Auger wrote:
> From: Prem Mallappa <prem.mallappa@broadcom.com>
> 
> This patch builds an IORT table that features a root complex node and
> an ITS node. This complements the ITS description in the ACPI MADT
> table and allows vhost-net on ACPI guest.
> 
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v2 -> v3:
> - used sizeof(*iort) as node_offset
> - removed idmap->flags = 0;
> - misc cosmetic cleanups
> 
> v1 -> v2:
> - its_class_name() || !guest_info->no_its now wraps acpi_add_table
>   and build_iort
> - add cpu_to_le*
> - CCA = CPM = DACS = 1
> - cleanup according to Drew's comments
> - remove comments listing tables and spec revisions
> ---
>  hw/arm/virt-acpi-build.c | 71 ++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 60 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index fa0655a..5fc10df 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -384,6 +384,61 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
>  }
>  
>  static void
> +build_iort(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
> +{
> +    int iort_start = table_data->len;
> +    AcpiIortIdMapping *idmap;
> +    AcpiIortItsGroup *its;
> +    AcpiIortTable *iort;
> +    size_t node_size, iort_length;
> +    AcpiIortRC *rc;
> +
> +    iort = acpi_data_push(table_data, sizeof(*iort));
> +
> +    iort_length = sizeof(*iort);
> +    iort->node_count = cpu_to_le32(2); /* RC and ITS nodes */
> +    iort->node_offset = cpu_to_le32(sizeof(*iort));
> +
> +    /* ITS group node */
> +    node_size =  sizeof(*its) + sizeof(uint32_t);
> +    iort_length += node_size;
> +    its = acpi_data_push(table_data, node_size);
> +
> +    its->type = ACPI_IORT_NODE_ITS_GROUP;
> +    its->length = cpu_to_le16(node_size);
> +    its->its_count = cpu_to_le32(1);
> +    its->identifiers[0] = 0; /* MADT translation_id */
> +
> +    /* Root Complex Node */
> +    node_size = sizeof(*rc) + sizeof(*idmap);
> +    iort_length += node_size;
> +    rc = acpi_data_push(table_data, node_size);
> +
> +    rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
> +    rc->length = cpu_to_le16(node_size);
> +    rc->mapping_count = cpu_to_le32(1);
> +    rc->mapping_offset = cpu_to_le32(sizeof(*rc));
> +
> +    /* fully coherent device */
> +    rc->memory_properties.cache_coherency = cpu_to_le32(1);
> +    rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
> +    rc->pci_segment_number = 0; /* MCFG pci_segment */
> +
> +    /* Identity RID mapping covering the whole input RID range */
> +    idmap = &rc->id_mapping_array[0];
> +    idmap->input_base = 0;
> +    idmap->id_count = cpu_to_le32(0xFFFF);
> +    idmap->output_base = 0;
> +    /* output IORT node is the ITS group node (the first node) */
> +    idmap->output_reference = cpu_to_le32(iort->node_offset);
> +
> +    iort->length = cpu_to_le32(iort_length);
> +
> +    build_header(linker, table_data, (void *)(table_data->data + iort_start),
> +                 "IORT", table_data->len - iort_start, 0, NULL, NULL);
> +}
> +
> +static void
>  build_spcr(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>  {
>      AcpiSerialPortConsoleRedirection *spcr;
> @@ -667,17 +722,6 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>                               ACPI_BUILD_TABLE_FILE, tables_blob,
>                               64, false /* high memory */);
>  
> -    /*
> -     * The ACPI v5.1 tables for Hardware-reduced ACPI platform are:
> -     * RSDP
> -     * RSDT
> -     * FADT
> -     * GTDT
> -     * MADT
> -     * MCFG
> -     * DSDT
> -     */
> -

I guess it's still debatable if the above change should be a separate
patch or not. It'd probably be best if it was, or at least the commit
message should contain an 'Also ...' sentence. Anyway, I'll leave it
to the maintainers to decide.

>      /* DSDT is pointed to by FADT */
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, guest_info);
> @@ -703,6 +747,11 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>          build_srat(tables_blob, tables->linker, guest_info);
>      }
>  
> +    if (its_class_name() && !guest_info->no_its) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_iort(tables_blob, tables->linker, guest_info);
> +    }
> +
>      /* RSDT is pointed to by RSDP */
>      rsdt = tables_blob->len;
>      build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> -- 
> 2.5.5
> 

Reviewed-by: Andrew Jones <drjones@redhat.com>

