Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1928666wro;
        Fri, 2 Nov 2018 03:29:08 -0700 (PDT)
X-Google-Smtp-Source: AJdET5feaqkhVjOXw/U6gYAnLicnNHt6r+x6P/bFH8Zget/oW80XvdjZ4/nxbkt49tWTPFA8AFFR
X-Received: by 2002:a37:ae87:: with SMTP id x129mr3501520qke.15.1541154548034;
        Fri, 02 Nov 2018 03:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541154548; cv=none;
        d=google.com; s=arc-20160816;
        b=1B9TNXrQlbeGtIJV2KuDSoYFg8Q+JecV5jqrpfI1ntRy9wjPrwKanZPbu9LNS8T3Rc
         exujGlkRiVOtEvvNcosBEwvRXDENFVwCREVxUsiOGcw8+wBvI30nlx9YqvpkwxH5RjAx
         QAIocM4/WeNTSi0OEhCygh2GoPteTeCai1Zu7XWc+4Uihd5aCkdDugajsn3/S7coNaJq
         sskN7kltZRJu0e4hFZqcQ3+xaf2iKKnQaQiS4CU0hFDECue2+unmICqf0co8XJEwPnFI
         ExrD8OvkZV3pyvzqyasRC1J4B1MhAaOgdXlzuScsqA86+tfpjKQNdAdRCb+fFT8QtB8w
         kFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=TUatIr+uN9c09RV4Rr9qCT9NvRoOAcxVtPpQOYwAw+U=;
        b=JWUFgN+GmvwB66/hsh8hr9UV/GD5t+3NC37jiKSHBbQzZsrhqtUJPMKb4+/Q0VQb7c
         npoA6DpzP6HeKk5msE366htlQ/sErpBK1Eys4vcvAzwd4mI8u7IvV344cdez6vNpzjLB
         xCSTHibqYljbnLjZ2D5tOWvexKQD1Ev58lw+w8XXvNn0aWbsBEBSlX+59i5uocxLNXk6
         jG5vox4z+DjVDFGVs22a8kQvOHVNAazPJZp4+wPOH8AZrRnKj+gNB/DpPYBdQw9IHKDU
         h94qIWEu/xSbAJmOYPeAP8v0ajBkE4+3DQtR6ZZQj27GMo+6CXwUusCAsKnVDa04dw4t
         k4pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7-v6si4039242qtr.249.2018.11.02.03.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 03:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIWhP-0000mr-I5
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 06:29:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gIWhE-0007xf-HQ
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 06:28:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gIWcL-0008P6-PN
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 06:23:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58256)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gIWcL-0008Oo-G0; Fri, 02 Nov 2018 06:23:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EEB3F307EA8F;
	Fri,  2 Nov 2018 10:23:51 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EB3760C47;
	Fri,  2 Nov 2018 10:23:48 +0000 (UTC)
Date: Fri, 2 Nov 2018 11:23:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <20181102112347.7af1cdc5@redhat.com>
In-Reply-To: <c88b4769-a517-36da-b181-e59a4380bcea@gmail.com>
References: <20181101102303.16439-1-sameo@linux.intel.com>
	<20181101102303.16439-6-sameo@linux.intel.com>
	<c88b4769-a517-36da-b181-e59a4380bcea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 02 Nov 2018 10:23:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 05/23] hw: arm: Switch to the
 AML build RSDP building routine
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3xDx7NXUxG0y

On Fri, 2 Nov 2018 17:35:06 +0800
Shannon Zhao <shannon.zhaosl@gmail.com> wrote:

> On 2018/11/1 18:22, Samuel Ortiz wrote:
> > We make the ARM virt ACPI code use the now shared build_rsdp() API from
> > aml-build.c. By doing so we fix a bug where the ARM implementation was
> > missing adding both the legacy and extended checksums, which was
> > building an invalid RSDP table.
> > 
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > ---
> >   hw/arm/virt-acpi-build.c | 31 +------------------------------
> >   1 file changed, 1 insertion(+), 30 deletions(-)
> > 
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 0ed132b79b..0a6a88380a 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -35,6 +35,7 @@
> >   #include "target/arm/cpu.h"
> >   #include "hw/acpi/acpi-defs.h"
> >   #include "hw/acpi/acpi.h"
> > +#include "hw/acpi/aml-build.h"
> >   #include "hw/nvram/fw_cfg.h"
> >   #include "hw/acpi/bios-linker-loader.h"
> >   #include "hw/loader.h"
> > @@ -366,36 +367,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
> >       aml_append(scope, dev);
> >   }
> >   
> > -/* RSDP */
> > -static void
> > -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)  
> Note: here we use xsdt table not rsdt for ARM. After your change which 
> assigns xsdt table address to rsdt_physical_address, it doesn't work.
Hi Shannon,

I do not really like how this series organized/split and doing refactoring
backwards but that's another story and I'll do suggestions how to make it
better on per patch review later.

But as far as I see this change should only add legacy checksum over
the current rsdp, which is bug fix and makes table spec compliant.

Could you point out why it doesn't work and what exactly breaks?


> IIRC, we discussed this before that ARM virt uses xsdt while pc/q35 uses 
> rsdt. So this patch is not necessary I think.
> 
> Thanks,
> Shannon
> > -{
> > -    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> > -    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> > -    unsigned xsdt_pa_offset =
> > -        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
> > -
> > -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
> > -                             true /* fseg memory */);
> > -
> > -    memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
> > -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, sizeof(rsdp->oem_id));
> > -    rsdp->length = cpu_to_le32(sizeof(*rsdp));
> > -    rsdp->revision = 0x02;
> > -
> > -    /* Address to be filled by Guest linker */
> > -    bios_linker_loader_add_pointer(linker,
> > -        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> > -        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
> > -
> > -    /* Checksum to be filled by Guest linker */
> > -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > -        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
> > -        (char *)&rsdp->checksum - rsdp_table->data);
> > -
> > -    return rsdp_table;
> > -}
> > -
> >   static void
> >   build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >   {
> >   

