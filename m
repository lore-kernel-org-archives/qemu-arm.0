Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1239405lfb;
        Tue, 12 May 2020 08:04:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypI/b5yRhRY2ZWLX1bFEEFo/5MGOmaL0+eg/sqPFF0B5cmfXdFmno+EeL6yp9DZrmFrTTnrB
X-Received: by 2002:ae9:e80a:: with SMTP id a10mr21919927qkg.192.1589295895480;
        Tue, 12 May 2020 08:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589295895; cv=none;
        d=google.com; s=arc-20160816;
        b=zkcbyJsAjwXqksR9qIf6HCkGOFFkbDyGpo0uUNhkHBEVRrpqyV5sbFGnCrlWcUhapr
         TOzLhnEETyIk2bMGhwXWB2zA6hZE4FQcPbrGn4G7arH7j2cgvQLVAc9Vl7VaV0hovz3g
         vWM3VJ/VGJNHkI+adUZTMf08eFi/QLRX2zEBQ8uYlnVh4iPAFsbhR+bmf15ord3rOuHW
         kW1DbNvo71qA9t1WzRmVzLUViYpMyBkylwfoffYZitmfPsx0JA1T9aaq2qckt5TrOyXk
         r2FjbgggdPigEQ55FhaKDWss3GT8FigS5TTCeUJge6dN99tN56jt7OoB/2PtRkVaVfMh
         u5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=mOXnCNtAmb/z2WUKK25eJ9arm9yFEw2/sy7QLsqaVaE=;
        b=miqnce9Gv4bbneTCKU/SY1FCfdplboZaujOBRa7dIip4mBQFyM/FMq5mFdS8rffG4/
         yxN0wivm05v91gjSNcfvPPrtO5fL7JEcL3X70FiFACpN/PUuM2NL1P62TtOpzbrbCH0H
         cbiZEfVCJ1awRYywFG7gsjgspbpZJYe2+vGEgTHzo1HiayR2efRGTsjCFJQ8Z6V52GIQ
         ksG5YdEHbMbfeiSeK0A0PeV2P9tpVbhVTvzDs0egpI6EtEkhYfifuUXP93Nm3UdkbRQj
         XV9V2IklswoecWJqhskLePfJeofs1xXz7pdW7S3DoQtZzk9CEGQQS+zdYRjsdT5yNcjr
         Velw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yu1tuvt4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k27si6947955qkk.141.2020.05.12.08.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 08:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yu1tuvt4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYWSk-0000x8-Pk
	for alex.bennee@linaro.org; Tue, 12 May 2020 11:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYWLk-0005gb-3E
 for qemu-devel@nongnu.org; Tue, 12 May 2020 10:57:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26861
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYWLj-00079t-8i
 for qemu-devel@nongnu.org; Tue, 12 May 2020 10:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589295458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOXnCNtAmb/z2WUKK25eJ9arm9yFEw2/sy7QLsqaVaE=;
 b=Yu1tuvt4w9wtyIHJlukgus8HfzzJi9sEPfy21A95F6ienjMcg5A6VqOsH/5s9uqzlv0D1X
 jlNnZ1WLxJ8Yz2UH24Oqb+WjpbhLHo+2nKDKvhz1APV5ltsGbEW63/HDv4kaPQWOfqxhcW
 NfytvgtJZRcQ/ZPTcpN5QnymXr6/N2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-fNKtj_JeN-u_MAnLnC-Qiw-1; Tue, 12 May 2020 10:57:34 -0400
X-MC-Unique: fNKtj_JeN-u_MAnLnC-Qiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BF9C473;
 Tue, 12 May 2020 14:57:33 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 398475C1B5;
 Tue, 12 May 2020 14:57:20 +0000 (UTC)
Date: Tue, 12 May 2020 16:57:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 3/3] arm/acpi: Add the TPM2.0 device under the DSDT
Message-ID: <20200512165717.0aecfda7@redhat.com>
In-Reply-To: <20200505144419.29174-4-eric.auger@redhat.com>
References: <20200505144419.29174-1-eric.auger@redhat.com>
 <20200505144419.29174-4-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 01:41:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcandre.lureau@redhat.com, eric.auger.pro@gmail.com,
 lersek@redhat.com, ardb@kernel.org, stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9LdMYhdRv/4f

On Tue,  5 May 2020 16:44:19 +0200
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
> v1 -> v2:
> - use memory_region_size
> - fix mingw compilation issue by casting to uint32_t
> - added Stefan's R-b
> ---
>  hw/arm/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 1a2ec10c8f..8534d14e20 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -45,6 +45,7 @@
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/arm/virt.h"
> +#include "hw/platform-bus.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/tpm.h"
> @@ -362,6 +363,40 @@ static void acpi_dsdt_add_power_button(Aml *scope)
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
> +    sbdev = (SysBusDevice *)object_dynamic_cast(OBJECT(tpm_find()),
> +                                                TYPE_SYS_BUS_DEVICE);
SYS_BUS_DEVICE(object_dynamic_cast())
      

> +    if (!sbdev) {
> +        return;
> +    }
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
> @@ -756,6 +791,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      acpi_dsdt_add_power_button(scope);
> +    acpi_dsdt_add_tpm(scope, vms);
>  
>      aml_append(dsdt, scope);
>  

