Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1413473wrt;
        Tue, 27 Nov 2018 07:26:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X9Aajnvy3rdhOzzHrVg8JYZKaDhHnGnJMiRr6sTIuSUB6iDp3MqsxpiV6qAW5ljhLwxHHh
X-Received: by 2002:a25:814f:: with SMTP id j15-v6mr33239474ybm.516.1543332372438;
        Tue, 27 Nov 2018 07:26:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543332372; cv=none;
        d=google.com; s=arc-20160816;
        b=RhMxTY5QDRzZXKJ7vjx2UK5OrYWW0JJ918i6eglO5dliU8/Qi2Zas3uYnKfkgQAJEu
         iJLSq9aAVTHGLjaipQLpnRsEKpejmt0KZ3ol0q9CJkuxqPoIECHLBTuHoDugNIrXZKyA
         XMScbG1SyuaMMlcLoMPU3qc7R4L/3jiyg5YgFL+JYkWMIQsvhdW/atlLjgjifVrVmMZr
         WjjUyn/0pGYa0JqnNSk60JyeoXNP59i0p7PnuxRIxlZfjWkOuQ82x/uIV3eHD/0Br4DK
         pj8zrFh28WcX7hE56Iw9c1Il8ByZN6Y0uQdPr/tuZZO9q/a+JIm0c+zBDL+WPldpL0t6
         xntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=euKKoX2g87Yg5uUE9Z8mG4CWkkjEGznOQ8ZrKjyzrp8=;
        b=mGLcJNpLRv4Nhia3eZxifHtko798lI+wDk6dToOJwAkctc4qzmk1nBaOi5rFp9pYW1
         6GuNWBzdQ07tBTcheiXeY5+vrDFBwiMuY3jCZYIcDo/6Pqif6xXC8X2FWmJGFQCC2dpO
         KBTu2uCapOUeJxT/09XPmgAR0+fkeI5bzmZb1qJ0JH1MoTVBUqn2gc6TpPwc07JXZya3
         nnVRztBwSB2RvBLxU/tsM01ExclQE0ljfoLmFj+L6KHCJN/AkvxMDueATrmwW2NCF9Ln
         41oSt+WYgSqrXmHAyPZw33ENR/xIQe53ilEN63xXJCZshb1Os9dDOjXk/D8nYtHtjXYv
         XyBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a132si2900791ywc.360.2018.11.27.07.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 07:26:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRfFb-0007bj-RT
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 10:26:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRfFU-0007bU-Dp
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 10:26:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRfFQ-0000EM-8h
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 10:26:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40000)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRfFP-0000AI-W7; Tue, 27 Nov 2018 10:26:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0ED7D80F7B;
	Tue, 27 Nov 2018 15:25:59 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6B8C608C3;
	Tue, 27 Nov 2018 15:25:53 +0000 (UTC)
Date: Tue, 27 Nov 2018 16:25:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181127162551.29608eeb@redhat.com>
In-Reply-To: <20181126162942.21258-5-sameo@linux.intel.com>
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-5-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 27 Nov 2018 15:25:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 4/8] hw: arm: Carry RSDP specific data
 through AcpiRsdpData
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QYDk4dJqnRLz

On Mon, 26 Nov 2018 17:29:37 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> That will allow us to generalize the ARM build_rsdp() routine to support
> both legacy RSDP (The current i386 implementation) and extended RSDP
> (The ARM implementation).
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  include/hw/acpi/acpi-defs.h | 11 +++++++++++
>  hw/arm/virt-acpi-build.c    | 27 ++++++++++++++++++++++-----
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index af8e023968..e7fd24c6c5 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -53,6 +53,17 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
>  } QEMU_PACKED;
>  typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
>  
> +typedef struct AcpiRsdpData {
> +    uint8_t oem_id[6]; /* OEM identification */
> +    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> +
> +    unsigned *rsdt_tbl_offset;
> +    unsigned *xsdt_tbl_offset;
> +} AcpiRsdpData;
> +

> +#define ACPI_RSDP_REV_1 0
> +#define ACPI_RSDP_REV_2 2
it's one time used spec defined values so just use values directly
in place with a comment, so reader won't have to jump around code
when comparing to spec.

> +
>  /* Table structure from Linux kernel (the ACPI tables are under the
>     BSD license) */
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 0835900052..2dad465ecf 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -368,7 +368,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>  
>  /* RSDP */
>  static void
> -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> +build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
>  {
>      AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
>      unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> @@ -379,14 +379,14 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>                               true /* fseg memory */);
>  
>      memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
> -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, sizeof(rsdp->oem_id));
> +    memcpy(rsdp->oem_id, rsdp_data->oem_id, sizeof(rsdp->oem_id));
>      rsdp->length = cpu_to_le32(sizeof(*rsdp));
> -    rsdp->revision = 0x02;
> +    rsdp->revision = rsdp_data->revision;
>  
>      /* Address to be filled by Guest linker */
>      bios_linker_loader_add_pointer(linker,
>          ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> -        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
> +        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
>  
>      /* Checksum to be filled by Guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> @@ -399,6 +399,20 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>          (char *)&rsdp->extended_checksum - rsdp_table->data);
>  }
>  
> +static void
> +init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
> +               unsigned *rsdt_offset, unsigned *xsdt_offset)
> +{
> +    /* Caller must provide an OEM ID */
> +    g_assert(oem_id);
> +    g_assert(strlen(oem_id) >= 6);
> +
> +    memcpy(data->oem_id, oem_id, 6);
> +    data->revision = revision;
> +    data->rsdt_tbl_offset = rsdt_offset;
> +    data->xsdt_tbl_offset = xsdt_offset;
> +}
> +
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> @@ -810,6 +824,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      GArray *table_offsets;
>      unsigned dsdt, xsdt;
>      GArray *tables_blob = tables->table_data;
> +    AcpiRsdpData rsdp;
s/rsdp/rsdp_info/

>  
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));
> @@ -857,7 +872,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
>  
>      /* RSDP is in FSEG memory, so allocate it separately */
> -    build_rsdp(tables->rsdp, tables->linker, xsdt);
> +    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_2,
> +                   NULL, &xsdt);
It would be more concise to use declarative style without extra clutter:

-    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_2,
-                   NULL, &xsdt);
-    build_rsdp(tables->rsdp, tables->linker, &rsdp);
+    {
+       AcpiRsdpData rsdp = {
+           .revision = 2,
+           .oem_id = ACPI_BUILD_APPNAME6,
+           .xsdt_tbl_offset = &xsdt,
+           .rsdt_tbl_offset = NULL,
+       };
+       build_rsdp(tables->rsdp, tables->linker, &rsdp);
+    }

> +    build_rsdp(tables->rsdp, tables->linker, &rsdp);
>  
>      /* Cleanup memory that's no longer used. */
>      g_array_free(table_offsets, true);

