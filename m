Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp347586lfc;
        Thu, 21 Oct 2021 06:51:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8Ey7dlgJElXXebismTxPXFAhwvTpepxydMMJ9WvMFceD55bOelCjT+ZWaHfQGRuRbnKs+
X-Received: by 2002:aca:3bd4:: with SMTP id i203mr4606751oia.69.1634824262281;
        Thu, 21 Oct 2021 06:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634824262; cv=none;
        d=google.com; s=arc-20160816;
        b=dBsszEX5e4R2ghbM0sE30DKL6mHlD2dVKgdUGWV2mYJaC7g2/ZzHnieWViN7rr07+1
         UWsB2VeCae9qlnwJO1gPBC6Ob2cP+MzCXHvUv3ERpbcO7PMQB0XfzqmqdhIoT1KH40LS
         DrNeXX5F61hZF4RB1loUJXfe8oDqWHro6bCJC13fI3WqELVkZB5wb1VzF4BpqDmBwlH9
         ba6RviwlAexlh/NTg/hdEuq+btg5Gd4i8hAv+D4AOYNZTeCS0NLJy1IXKe2Nxpw6sTpM
         QWuLhEJAyK3+9sKQGzKcPCH9lrrDZ7pwKIzjrTSjyMI1pvYYwOhQ6596xJaktOD5fKNJ
         gYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=3pz3qWhl9OL8SpuRlRZ3gWKEiV1rRdSSNcUt1+su0Sw=;
        b=beWvXhsVv5vzVe2PPayncjSDaQGy0z396m7DknRg/zIklATh0IQ7CqW8Q/ctW2ndGU
         kTom7AJyh79IVkr45blMm2sNMEUTxoF3KUypnNdfUOQ7/dpTJdJHpx4ejQVm5TifHbWU
         fS48M4Qf6gEgQrEPPKusHjf6zEqTxJLVPQJwTvZJPx9360vq4ibP7TLYylEk+AN1T2Ed
         BchIOFAkBkv6ZZac0bHN1ShWlRIxeSuAP/cyUJxurD4X286s+ClRrjME6JqPSUPu7Fil
         dRyCsGfBd7G6BsKm7j0PI++uBF1S402kCgZ3KDjNP2XwT9BsziVRVgXnv6uJUAtWjqBE
         n9xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NHC4GeHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s185si6260997oig.198.2021.10.21.06.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 06:51:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NHC4GeHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdYTF-0007WB-Ay
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 09:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYSM-0007Up-A0
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 09:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYSK-0003Oh-1y
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 09:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634824202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pz3qWhl9OL8SpuRlRZ3gWKEiV1rRdSSNcUt1+su0Sw=;
 b=NHC4GeHwZgbr2UEy39zbM8odByCKGOQUjb7nReqEKXAvSPRUpsFk6wcsGlbkCrpAVSB0wt
 c62ScbENFP00UXgmz6THTeQW4V4lw7EQUSvg9vQWD5kXxD9UcM2rwMN9q2Na+YSLXDUQ9f
 ICUwmDYGQoIgVBV9UJhF9LF+b1MkPLo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-Nys5I-_4NL-sjMpO0YXy-Q-1; Thu, 21 Oct 2021 09:50:01 -0400
X-MC-Unique: Nys5I-_4NL-sjMpO0YXy-Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 z20-20020a05640240d400b003dce046ab51so380208edb.14
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 06:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3pz3qWhl9OL8SpuRlRZ3gWKEiV1rRdSSNcUt1+su0Sw=;
 b=yFCFQbTPLigZoaIqTxzjBatVScY/GDwegp1LHrLoombQErJI19WZ9kOJGWKSaMEkeM
 IPDjT9Sg3i0E1Mn0oGp6eYp4kJNqkIF3VsnrtyKIalML/wux23AIxvJP25hq3WJ4W/Zy
 S5IZQ4WJePKrv6yZiQvQLsCqOIlsgKq04fpAz6UnZpa1x4ytf9nBZ5Ox4cEQQ9n8gGT4
 QBVpQZaJa+m0hCnAS+sWtx2Ovx9wQ2o7QGZhZEqInW2Ki1vzqS9Y+lMWcxVbYuNnCvpg
 +CH/DIlwQEP1OOcqzzOXdZiWC/dqohKlzgxnmN4NZQE9cv8gPtmXtajDuNrT3mUNoAy/
 cGLw==
X-Gm-Message-State: AOAM532y3Wbf4vNwZQDP21Bwq9pJ3YTgdOYAW6Nk/SxED2+8+HqHBqmP
 1E5GHum+MbU3Lr7xWnM/D+ov++ZxsPZS8cSfd2trJ4cD3YUXImfcp0fnTekETWValjiWyTzbtAk
 aZptQ5TLb44eg
X-Received: by 2002:a50:950b:: with SMTP id u11mr7902997eda.121.1634824199869; 
 Thu, 21 Oct 2021 06:49:59 -0700 (PDT)
X-Received: by 2002:a50:950b:: with SMTP id u11mr7902969eda.121.1634824199683; 
 Thu, 21 Oct 2021 06:49:59 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id g17sm2924151edv.72.2021.10.21.06.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:49:59 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:49:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 05/12] hw/arm/virt-acpi-build: Add VIOT table for
 virtio-iommu
Message-ID: <20211021154958.6ca48692@redhat.com>
In-Reply-To: <20211020172745.620101-6-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-6-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, ani@anisinha.ca, pbonzini@redhat.com,
 eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q8JPrPX7Ip8c

On Wed, 20 Oct 2021 18:27:39 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> When a virtio-iommu is instantiated, describe it using the ACPI VIOT
> table.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 7 +++++++
>  hw/arm/Kconfig           | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6cec97352b..e26639e1e1 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -55,6 +55,7 @@
>  #include "kvm_arm.h"
>  #include "migration/vmstate.h"
>  #include "hw/acpi/ghes.h"
> +#include "hw/acpi/viot.h"
>  
>  #define ARM_SPI_BASE 32
>  
> @@ -934,6 +935,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      }
>  #endif
>  
> +    if (vms->iommu == VIRT_IOMMU_VIRTIO) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_viot(ms, tables_blob, tables->linker, vms->virtio_iommu_bdf,
> +                   vms->oem_id, vms->oem_table_id);
> +    }
> +
>      /* XSDT is pointed to by RSDP */
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2d37d29f02..e652590943 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -27,6 +27,7 @@ config ARM_VIRT
>      select DIMM
>      select ACPI_HW_REDUCED
>      select ACPI_APEI
> +    select ACPI_VIOT
>  
>  config CHEETAH
>      bool

