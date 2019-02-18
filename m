Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2129358wrx;
        Mon, 18 Feb 2019 02:31:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3IahZ5h+nX8WUirhE6RIA7d1BMPpWFCSwGy5DN3hMDpMckj/k6V6mLg/Di3VmUpj7rHcDqo7
X-Received: by 2002:a81:9190:: with SMTP id i138mr17763982ywg.75.1550485891997;
        Mon, 18 Feb 2019 02:31:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550485891; cv=none;
        d=google.com; s=arc-20160816;
        b=wd9xtJW5jssWvrdr5PtVnaISBEf5xMz/WdiHEz+Bf/T29y5zZ+BdNNUvVHAawPKoB0
         4ED8F980n58R7mSGY9egZGpy+dE6iwZEx2GO5jd7b4T3A59D2nzakf8LrZOmQQRNtrK/
         P2MUqKfXFNEkQz7aylo5kiP/4097tQDUDaOymBakK9jSiffgs6smQI2ji3oWUPE0npLP
         afbSdUvdjuFcGb4W3stFbG14FzS7ZW4rbDzye5LugF/OkYmYObNGX+a8DwxxXQ/w7k8y
         VjDKxRc2mEPCGG0z5buTvtQZL6SMVxa0jTOiAjME6fIrSaAV2wOPps/RnCGDAVs9n91Z
         v59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=fsV2+158U00HIanK1tUpWoWu53tIPbu8ki+cFctn9WY=;
        b=VFi8+7YpjmN+oTxrCqImwvybZI97JqRqIjvhtL1XkidLIVKy6RZl8+Q4FVa/A/IjLk
         PQbcFBoa8Kfc5R5Hg3VAH8yA14Hyue2IvDClP+cRQ2KhB6j8+SsRbjGTfAE3QxYIDlLC
         5IN4V6HWsIJYaowzjJ36C2WPy36st2KCLbNrhGnYhn2Njj96yizySbwPXkImhwL2KN7b
         cqacs5crErjzZRbqb+TQd3n0F02HdnJPhnlxtH2cccJVxWnjueKh7Ig+jWDPMl6HOgn5
         JoGQNyIqPGegPKEVWBg8DL5Dlmvdf3x0Xn3GI44I1najNK413OHwEAGpd4ly3yjjpJ/2
         erKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26si7834232ybj.483.2019.02.18.02.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 02:31:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvgCx-00026R-E9
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 05:31:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvgC2-0001dv-Oa
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 05:30:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvgC0-0007Wl-Cc
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 05:30:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gvgBw-0007PS-Up; Mon, 18 Feb 2019 05:30:29 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 530EBC04BD22;
	Mon, 18 Feb 2019 10:30:20 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-22.ams2.redhat.com
	[10.36.112.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B147F608DA;
	Mon, 18 Feb 2019 10:30:11 +0000 (UTC)
Date: Mon, 18 Feb 2019 11:30:08 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190218113008.18ead6cb@Igors-MacBook-Pro.local>
In-Reply-To: <20190205173306.20483-17-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-17-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 18 Feb 2019 10:30:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 16/18] hw/arm/virt: Add nvdimm hot-plug
 infrastructure
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9AsAPlbiS57/

On Tue,  5 Feb 2019 18:33:04 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> From: Kwangwoo Lee <kwangwoo.lee@sk.com>
> 
> Pre-plug and plug handlers are prepared for NVDIMM support.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> ---
>  default-configs/arm-softmmu.mak |  2 ++
>  hw/arm/virt-acpi-build.c        |  6 ++++++
>  hw/arm/virt.c                   | 22 ++++++++++++++++++++++
>  include/hw/arm/virt.h           |  3 +++
>  4 files changed, 33 insertions(+)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index dc4624794f..ddbe87ed15 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -162,3 +162,5 @@ CONFIG_HIGHBANK=y
>  CONFIG_MUSICPAL=y
>  CONFIG_MEM_DEVICE=y
>  CONFIG_DIMM=y
> +CONFIG_NVDIMM=y
> +CONFIG_ACPI_NVDIMM=y
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 781eafaf5e..f086adfa82 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -784,6 +784,7 @@ static
>  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  {
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> +    MachineState *ms = MACHINE(vms);
>      GArray *table_offsets;
>      unsigned dsdt, xsdt;
>      GArray *tables_blob = tables->table_data;
> @@ -824,6 +825,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>          }
>      }
>  
> +    if (vms->acpi_nvdimm_state.is_enabled) {
> +        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> +                          &vms->acpi_nvdimm_state, ms->ram_slots);
> +    }
> +
>      if (its_class_name() && !vmc->no_its) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_iort(tables_blob, tables->linker, vms);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b683902991..0c8c2cc191 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -132,6 +132,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
> +    [VIRT_ACPI_IO] =            { 0x09070000, 0x00010000 },
where does this range come from and is its size sufficient?

>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -1637,6 +1638,18 @@ static void machvirt_init(MachineState *machine)
>  
>      create_platform_bus(vms, pic);
>  
> +    if (vms->acpi_nvdimm_state.is_enabled) {
> +        AcpiNVDIMMState *acpi_nvdimm_state = &vms->acpi_nvdimm_state;
> +
> +        acpi_nvdimm_state->dsm_io.type = NVDIMM_ACPI_IO_MEMORY;
> +        acpi_nvdimm_state->dsm_io.base =
> +                vms->memmap[VIRT_ACPI_IO].base + NVDIMM_ACPI_IO_BASE;
> +        acpi_nvdimm_state->dsm_io.len = NVDIMM_ACPI_IO_LEN;
> +
> +        nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
> +                               vms->fw_cfg, OBJECT(vms));
> +    }
> +
>      vms->bootinfo.ram_size = machine->ram_size;
>      vms->bootinfo.kernel_filename = machine->kernel_filename;
>      vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
> @@ -1822,10 +1835,19 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>                               DeviceState *dev, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>      Error *local_err = NULL;
>  
>      pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
>  
> +    if (is_nvdimm) {
> +        nvdimm_plug(&vms->acpi_nvdimm_state);
> +    }
> +
> +out:
>      error_propagate(errp, local_err);
>  }
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index c88f67a492..56d73b0e86 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -37,6 +37,7 @@
>  #include "hw/arm/arm.h"
>  #include "sysemu/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
> +#include "hw/mem/nvdimm.h"
>  
>  #define NUM_GICV2M_SPIS       64
>  #define NUM_VIRTIO_TRANSPORTS 32
> @@ -77,6 +78,7 @@ enum {
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_ACPI_IO,
>      VIRT_LOWMEMMAP_LAST,
>  };
>  
> @@ -134,6 +136,7 @@ typedef struct {
>      hwaddr high_io_base;
>      hwaddr highest_gpa;
>      bool extended_memmap;
> +    AcpiNVDIMMState acpi_nvdimm_state;
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)

