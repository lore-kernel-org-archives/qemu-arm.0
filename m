Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1419947lfb;
        Thu, 21 May 2020 03:13:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9aBPZEaP6Uq11wWvgXTRscX//4QgxRWLN3mKEZyHaRSmOEqqA5K9s8bjzGq+hHmmfjLOi
X-Received: by 2002:ac8:1c3d:: with SMTP id a58mr10010960qtk.52.1590055997342;
        Thu, 21 May 2020 03:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590055997; cv=none;
        d=google.com; s=arc-20160816;
        b=oIrS4fWkdkDsvy/ueRrh/q+oXBDfuYC72nIXUi/8xY8mVbkiIQtnCULvEzEbhPFYpj
         1i/susnuRuby/c80vtRuKZkWTkVpkC6Vds/EoHLfZKNfP8VTeIaV9kRnN82sHPf7FLIq
         8/E0X0xyUao1i7p01pTvTHXcjOS6mE+Nb4Uwj5abD2VXJqtZYHBWZ9SjNvlrtLWOihpe
         cB5a1ZBY2puX512V2NNRhy6g30VkxKOItiJ7E7MtmAlNCF14fyWJRQcJkzVmAlBMSUyk
         Z5U61eBM58dvdaDaT1MjoO6aYMO4RBvUaJYCoi90a55Qa8G2QkwkFxEOr3ly68R4BVSS
         qiog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=27no0P80r91DE2Pc2fhDviPp6dJhoxNMP9WeHfKyFpE=;
        b=nP7Zm+ZDuDxyKY857Mo5HHnjM7+tsMmh0T0X4xPFtIU8Da3BMh8jPJoDgs0Aa/F1PQ
         OQ5dv7FCPRIdLJYnxaHsYbqoDmiPdjxnSUxJ6hryWqwc2MFvNoggClOZT0BdRVue6NDO
         izgDkd+EIeyQ2pwJWT3uMk0Auo3LA71YgqiT/c0SzAJ6Vu5GMY3MK3VYPcweOH5wZXPI
         JJIgkzd3OHOvHPz0NsWjJv2IJtmYA1OrEg9nk7NnEPikWREt0IkZ9Bd5vvPO5h5Iy1cw
         p7t4m5iBF+b4V2HJHim9oT9JSsvE0NJYGe5WQrr2vQL0yuMQkY8URmv7DKoBgyaYsqvi
         EdVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ey+X1IWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si3250648qkl.320.2020.05.21.03.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 03:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ey+X1IWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbiCS-0003fu-Np
	for alex.bennee@linaro.org; Thu, 21 May 2020 06:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbiCJ-0003dU-3k
 for qemu-arm@nongnu.org; Thu, 21 May 2020 06:13:07 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59319
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbiCI-0000PF-6z
 for qemu-arm@nongnu.org; Thu, 21 May 2020 06:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590055985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27no0P80r91DE2Pc2fhDviPp6dJhoxNMP9WeHfKyFpE=;
 b=ey+X1IWzhzQM5vroTaOCBCGwtAHeTc8w3ymSrLNO/WLm6qi5XvW1oosq5+VwR08qJpvNNz
 HcevxkiF/1LNH73guc2ckJ6/V9vdaRPO4EvYRsmv/+P1D37l3zOwLYyhDUNzXuW+pW1wYi
 rvy2IptIQILvw+S+LkPf0KnPG6OOWC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-TOy59T98OgyrXwsGrVwgJg-1; Thu, 21 May 2020 06:13:03 -0400
X-MC-Unique: TOy59T98OgyrXwsGrVwgJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EE2A835B4F;
 Thu, 21 May 2020 10:13:02 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C619F82E75;
 Thu, 21 May 2020 10:12:48 +0000 (UTC)
Date: Thu, 21 May 2020 12:12:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 17/22] microvm/acpi: add acpi_dsdt_add_virtio() for x86
Message-ID: <20200521121247.1613ff8e@redhat.com>
In-Reply-To: <20200520132003.9492-18-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-18-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 04:44:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ho+OQGDUsk2l

On Wed, 20 May 2020 15:19:58 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Makes x86 linux kernel find virtio-mmio devices automatically.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-microvm.c | 52 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index d2dd024909cc..12060939ff6c 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -21,6 +21,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qapi/error.h"
>  
>  #include "exec/memory.h"
> @@ -32,10 +33,60 @@
>  #include "hw/boards.h"
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/microvm.h"
> +#include "hw/virtio/virtio-mmio.h"
>  
>  #include "acpi-common.h"
>  #include "acpi-microvm.h"
>  
> +static void acpi_dsdt_add_virtio(Aml *scope,
> +                                 MicrovmMachineState *mms)
> +{
> +    gchar *separator;
> +    long int index;
> +    BusState *bus;
> +    BusChild *kid;
> +
> +    bus = sysbus_get_default();
> +    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> +        DeviceState *dev = kid->child;
> +        Object *obj = object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MMIO);
> +
> +        if (obj) {
> +            VirtIOMMIOProxy *mmio = VIRTIO_MMIO(obj);
> +            VirtioBusState *mmio_virtio_bus = &mmio->bus;
> +            BusState *mmio_bus = &mmio_virtio_bus->parent_obj;
> +
> +            if (QTAILQ_EMPTY(&mmio_bus->children)) {
> +                continue;
> +            }
> +            separator = g_strrstr(mmio_bus->name, ".");
> +            if (!separator) {
> +                continue;
> +            }
> +            if (qemu_strtol(separator + 1, NULL, 10, &index) != 0) {
> +                continue;
> +            }
> +
> +            uint32_t irq = mms->virtio_irq_base + index;
> +            hwaddr base = VIRTIO_MMIO_BASE + index * 512;
> +            hwaddr size = 512;
> +
> +            Aml *dev = aml_device("VR%02u", (unsigned)index);
> +            aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
> +            aml_append(dev, aml_name_decl("_UID", aml_int(index)));
> +            aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +            Aml *crs = aml_resource_template();
> +            aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
> +            aml_append(crs,
> +                       aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> +                                     AML_EXCLUSIVE, &irq, 1));
> +            aml_append(dev, aml_name_decl("_CRS", crs));
> +            aml_append(scope, dev);
> +        }
> +    }
> +}
> +
>  static void
>  build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
>                     MicrovmMachineState *mms)
> @@ -60,6 +111,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
>      build_ged_aml(sb_scope, GED_DEVICE, HOTPLUG_HANDLER(mms->acpi_dev),
>                    GED_MMIO_IRQ, AML_SYSTEM_MEMORY, GED_MMIO_BASE);
>      acpi_dsdt_add_power_button(sb_scope);
> +    acpi_dsdt_add_virtio(sb_scope, mms);
>      aml_append(dsdt, sb_scope);
>  
>      scope = aml_scope("\\");

