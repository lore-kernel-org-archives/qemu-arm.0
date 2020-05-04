Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp72246lfb;
        Sun, 3 May 2020 22:21:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypID+gdom4qeSK4be3/F9b2TCcHXS7uCeIRxs6EpRCUNxNtScHhvy5tAtpjDLnAYORju9dR5
X-Received: by 2002:a05:620a:166d:: with SMTP id d13mr13702877qko.448.1588569704360;
        Sun, 03 May 2020 22:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588569704; cv=none;
        d=google.com; s=arc-20160816;
        b=K4EcHVmarvGgM3Hvy1ejqabgS3lbovYavSyzNUxXXybKv8JzrRm9MSvvOzHHK6bs+p
         hmvt69w1XLZttYhQdcZ+wf3PKU0fFJCPBOcwawsFmQu0Y/200pEjbMCOemNKbFu+US9i
         71vcPpPRA3psxBTafqVzuBJqMbjd3suqSx92UH+mMGsgrYA0MWfCPgTjjENcX0CXHbh6
         vNN7QegDJbQCyE5RvFBMW46MAmuUy0c4lhwjb0dICunwchCVq03GVsyke77r49GGi+sl
         7mUJ/rfn6l5rMOjJL150L9A1oKHsU8guoatkW3WxQk6aFcnQiSE33XVzlERowJiHQiXX
         MIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=9lVqxyBk75HwNGZENcHVduBzI17YMLdle2c3mnZrB+8=;
        b=FZYPvbHZ3K2Q3x9EuAOICglpVhCaR+H5fZCL2TaSSlkWQghvScKJJVPhNG4LGplUV3
         FbWtWUjyIC1K1axuDbAIfTzS6DuTp4QUZmBf6vpFvCLQDaTYK/1vQjVOTBcFJJ69Xbnd
         VQH6dtFHbP0jmO+75tds4aQ76fRJYy7BrS7jx98Z+RGYYukCFnsIeVbne80sxzi0n4kZ
         OvXBbNQd7jAnm0xEUw4XO09YwHE71iYjO0pBpYSlkj7xJT1Gh9Q25bHznrtjNlHJQkbb
         YI2WxiTrvI6p0G4VA7Zb8PMwHihHsX+wVn5qiVn95AqhtV+XU8tE56pQb793geF2QgjC
         WxZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AVSnEu7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id x7si5592304qkn.142.2020.05.03.22.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 May 2020 22:21:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AVSnEu7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVTXz-0002ED-PN
	for alex.bennee@linaro.org; Mon, 04 May 2020 01:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVTXs-0002Dd-2A
 for qemu-arm@nongnu.org; Mon, 04 May 2020 01:21:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33053
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVTXq-0006f3-9e
 for qemu-arm@nongnu.org; Mon, 04 May 2020 01:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588569692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lVqxyBk75HwNGZENcHVduBzI17YMLdle2c3mnZrB+8=;
 b=AVSnEu7WRdFAxM1Ej7A5E2woloyEU8irM4DguGKYc0m00JI5idu9GrBITr+rPi+GmNYEgH
 I0cUznbRQCZdQnkwImGC1JwIWNpFIerlbHel/815hrP/m1Z7bcoMaUHthkGYPUMNLiyZAD
 B6JyxLTk+DnM8nPvE5UUZqefhR9u4Tc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-mkPwZUU9OrW4yhCoy9J9QQ-1; Mon, 04 May 2020 01:21:31 -0400
X-MC-Unique: mkPwZUU9OrW4yhCoy9J9QQ-1
Received: by mail-wm1-f70.google.com with SMTP id h22so4268539wml.1
 for <qemu-arm@nongnu.org>; Sun, 03 May 2020 22:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Za/E9RQPajz82vsaW1sAfD7tIhOVgcZ9GFqKv3Oy1Eo=;
 b=NcSxI5ALh9NrySPBBND0WrLCm4kqxtF5tWx0fPVp07rJ91zWb6nJh0V70pR+Cp4FSh
 KwMx2bh1MsyQUUdTXHPIQSSYrD5ODWavGQJ38drS2sBXz5cuD2iWJB86ZIfeexm8ajEj
 A3kG4crKFj2siTukol2G6Fv48ybvwoT7JHKBXgnvoSebISBXJkvwNc9tvk5BTeHiRqOV
 8yIs24XJFTHhgGbfRAA5F4IVyzOP/B+CRJXzwr3BXbhON205zz3sudqla9QMKzAwy+5k
 b4na6cBKpGUbiuJb9PntToNFglcNxDYwXbKOlODDkDt1mNHr6nGTcAfAmRJp2/Nyamfq
 roEA==
X-Gm-Message-State: AGi0PubuGJkfDoS4+cVJWTIjadvg8iA9rgxyL7FrafY+lAM2aVPIDqpr
 vOWoUqrj84ebjPdbp8BLdnmVQZrfxLlB22WOby+ubFG35UQ0i9Y23Ms0lvEnl9dlzT1HWmSxFnO
 rKT6ZSll0H8A7
X-Received: by 2002:a5d:5224:: with SMTP id i4mr16995991wra.1.1588569689938;
 Sun, 03 May 2020 22:21:29 -0700 (PDT)
X-Received: by 2002:a5d:5224:: with SMTP id i4mr16995953wra.1.1588569689529;
 Sun, 03 May 2020 22:21:29 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 v16sm11492450wml.30.2020.05.03.22.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 May 2020 22:21:28 -0700 (PDT)
Date: Mon, 4 May 2020 01:21:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/2] arm/acpi: Add the TPM2.0 device under the DSDT
Message-ID: <20200504012048-mutt-send-email-mst@kernel.org>
References: <20200502203536.15011-1-eric.auger@redhat.com>
 <20200502203536.15011-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200502203536.15011-3-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, imammedo@redhat.com, eric.auger.pro@gmail.com,
 lersek@redhat.com, ardb@kernel.org, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yCJsxUU00JXn

On Sat, May 02, 2020 at 10:35:36PM +0200, Eric Auger wrote:
> In case it is dynamically instantiated, add the TPM 2.0 device object
> under the DSDT table in the ACPI namespace. Its HID is MSFT0101
> while its current resource settings (CRS) property is initialized
> with the guest physical address and MMIO size of the device.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index cc5863eaf2..0cb9cdb2ce 100644
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
> @@ -362,6 +363,38 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>      aml_append(scope, dev);
>  }
> =20
> +static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
> +{
> +    hwaddr pbus_base =3D vms->memmap[VIRT_PLATFORM_BUS].base;
> +    PlatformBusDevice *pbus =3D PLATFORM_BUS_DEVICE(vms->platform_bus_de=
v);
> +    MemoryRegion *sbdev_mr;
> +    SysBusDevice *sbdev;
> +    hwaddr tpm_base;
> +
> +    sbdev =3D (SysBusDevice *)object_dynamic_cast(OBJECT(tpm_find()),
> +                                                TYPE_SYS_BUS_DEVICE);
> +    if (!sbdev) {
> +        return;
> +    }
> +
> +    tpm_base =3D platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    assert(tpm_base !=3D -1);
> +
> +    tpm_base +=3D pbus_base;
> +
> +    sbdev_mr =3D sysbus_mmio_get_region(sbdev, 0);
> +
> +    Aml *dev =3D aml_device("TPM0");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    Aml *crs =3D aml_resource_template();
> +    aml_append(crs,
> +               aml_memory32_fixed(tpm_base, sbdev_mr->size, AML_READ_WRI=
TE));

I don't think you are supposed to poke at memory region struct internals li=
ke
this.


> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms=
)
>  {
> @@ -785,6 +818,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>      }
> =20
>      acpi_dsdt_add_power_button(scope);
> +    acpi_dsdt_add_tpm(scope, vms);
> =20
>      aml_append(dsdt, scope);
> =20
> --=20
> 2.20.1

