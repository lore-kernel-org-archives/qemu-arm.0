Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2518037lfc;
        Fri, 5 Jun 2020 07:45:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/i5HPylLX9EGRd+IQfKV4uufQSL7jP0/LIyu9NET8/VCl0LSLvOvg91UKmOLVApw2d+0F
X-Received: by 2002:a25:c286:: with SMTP id s128mr12129946ybf.52.1591368356373;
        Fri, 05 Jun 2020 07:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591368356; cv=none;
        d=google.com; s=arc-20160816;
        b=KLEV3UQIvl2s4ajjq+A5PgudULh9nHo3tcVW+A5W71DirD+w99fXY7sGsRDxOYFX48
         CgW9wCtL/fWyfh3EHMvKtvTHD36NBfPWgfqSmWLh36AEvgbx7XXcLyKTAUjJQfvhJKC4
         wtPmLYu6yoq2TQE6KNDj6cQ9SbHADuwjdIpg9xlEzYGJLpJ3thmoVaGf0uLA5VDdtx39
         1FZax5u1JkBcKPtoiJxWNvFiNFm/L3w3pOCmJk5hqRZWM9r/i14nlGndVWnjaXVvVJmw
         M42W2/JPwxia4Ggbt2jkWXVRX2/+0bDXJtzbs8L+sKCC5cG/k2OcHU2UMhweoESdp99l
         jzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=P/A3bdeYECLA7EBrRatwpB1cRern/h6cMD2fjxdYBW0=;
        b=ita6DVA8buoYf10OVxpFjytc3GpyScp4qGNbCS/5TYI9th1tzHSu1XfljviOhVFJV0
         KUfEVWeSPDH/5Cl2iAnqNeB9XS+STHCR/aBqAaoU6aPfp2M8rIeINlIVTy2zOgSrcbKt
         4uXYvdP+8KSi5zTgnkY7v9sYRcnVT1wFfV6eu1xKtrYwZ+eMB6D8hKkyj4fy9/t/JkDJ
         Oarz4Ab3/Kuj3NmwXEHDbmX8h+K+MVEeZmBlmo7+i+HLPcO0w8YMwVZTqsEx7Tvmz0d0
         OqtjybHtrhLF5Qs2U6VvJvN0yiCFKog273PhmunZJsgmWYVGOu6eBz7GxOcP+lGCdD3K
         JD0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UwfqoeeN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d205si991501ybh.435.2020.06.05.07.45.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 07:45:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UwfqoeeN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhDbX-0005dq-NG
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 10:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhDbI-0005as-QG
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:45:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22657
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhDbG-0004oY-Ji
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591368337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/A3bdeYECLA7EBrRatwpB1cRern/h6cMD2fjxdYBW0=;
 b=UwfqoeeNIrvlCh0HgJfh4yvXWIZNZL/7dF1vxJ7jI3RU7gSoETEBMoRQKnYeV7ACL2SfZj
 YSfI/8a8zbNdBZvt36XDzi09s1fYHz2EhZAPhSRC4DjDOoPt0RTB2t+OMTQYRvbkdOTG8G
 p8ddfh6fz3aik8SuNeYvFrjoB0PDaKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-gFMCwqKnMOuefTsfJpt_QQ-1; Fri, 05 Jun 2020 10:45:34 -0400
X-MC-Unique: gFMCwqKnMOuefTsfJpt_QQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2364108BD11;
 Fri,  5 Jun 2020 14:45:32 +0000 (UTC)
Received: from localhost (unknown [10.40.208.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F7117B5F3;
 Fri,  5 Jun 2020 14:45:19 +0000 (UTC)
Date: Fri, 5 Jun 2020 16:45:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 4/4] arm/acpi: Add the TPM2.0 device under the DSDT
Message-ID: <20200605164517.25e6521c@redhat.com>
In-Reply-To: <20200601095737.32671-5-eric.auger@redhat.com>
References: <20200601095737.32671-1-eric.auger@redhat.com>
 <20200601095737.32671-5-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, marcandre.lureau@redhat.com,
 eric.auger.pro@gmail.com, lersek@redhat.com, ardb@kernel.org,
 stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aQteBAwhgMsx

On Mon,  1 Jun 2020 11:57:37 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> In case it is dynamically instantiated, add the TPM 2.0 device object
> under the DSDT table in the ACPI namespace. Its HID is MSFT0101
> while its current resource settings (CRS) property is initialized
> with the guest physical address and MMIO size of the device.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> 
> ---
> 
> v2 -> v3:
> - use SYS_BUS_DEVICE() instead of
>   (SysBusDevice *)object_dynamic_cast(OBJECT())
> 
> v1 -> v2:
> - use memory_region_size
> - fix mingw compilation issue by casting to uint32_t
> - added Stefan's R-b
> ---
>  hw/arm/virt-acpi-build.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6d152ab481..05a3028500 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -46,6 +46,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/arm/virt.h"
>  #include "hw/mem/nvdimm.h"
> +#include "hw/platform-bus.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/tpm.h"
> @@ -364,6 +365,36 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>      aml_append(scope, dev);
>  }
>  
> +static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
> +{
> +    hwaddr pbus_base = vms->memmap[VIRT_PLATFORM_BUS].base;
> +    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    MemoryRegion *sbdev_mr;
> +    SysBusDevice *sbdev;
> +    hwaddr tpm_base;
> +
> +    sbdev = SYS_BUS_DEVICE(tpm_find());
> +
> +    tpm_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    assert(tpm_base != -1);
> +
> +    tpm_base += pbus_base;
> +
> +    sbdev_mr = sysbus_mmio_get_region(sbdev, 0);
> +
> +    Aml *dev = aml_device("TPM0");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs,
> +               aml_memory32_fixed(tpm_base,
> +                                  (uint32_t)memory_region_size(sbdev_mr),
> +                                  AML_READ_WRITE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> @@ -758,6 +789,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      acpi_dsdt_add_power_button(scope);
> +    acpi_dsdt_add_tpm(scope, vms);
shouldn't be this guarded by check if TPM device is present?

perhaps pass found here tpm to acpi_dsdt_add_tpm() as an argument

>  
>      aml_append(dsdt, scope);
>  

