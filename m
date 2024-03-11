Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1262971ejc;
        Mon, 11 Mar 2024 08:20:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQmEvLA/725st2TcAC/0RdRzJ5tohFhirTul+kylh0PTSETSUWJq4ki2Isz69ZlBbXsYBiSUWkGhkWpiejh+xVa0dfJCkO
X-Google-Smtp-Source: AGHT+IGnFkMzu5+CHAP3gQWf2pCYTNCU56a2Dslz6ghWFAx0sD2CNoZEL29wVWZuBnaBm0pS5YI/
X-Received: by 2002:ad4:48c5:0:b0:690:ae50:780b with SMTP id v5-20020ad448c5000000b00690ae50780bmr6706796qvx.34.1710170438795;
        Mon, 11 Mar 2024 08:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710170438; cv=none;
        d=google.com; s=arc-20160816;
        b=bNshAoVjgCO5kC6ns64AsYqTLrpWGVC3OG0KL8bkdR41YpurZw9Z3twDKWTYdv20Lj
         AFSjbvYhzvqrWonPaPks9J47KZQZmbfyotfcXOmPEBJAeTayrm25mFpafF/8j7waJIqI
         pJOKXrbI9qvsOYME/qNY/WQs7z9eTLW4tPRvtIm+FWXkaFY1qNAOGaBlMGKaw0DnxEOv
         hiYKmgENUk/VDNb/ICrb+m248cPwB2mMJWteqRdK+bPu9X1XkE+xDHH0ktDzWeFF+YmL
         MknifAr6oADG77AelDIg+71EULgbBpPX+shhu2Pv6yJRekR895gWd6oqVSnH0DqI622a
         OeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=wKe6WiAa8fTIKz6bYWjFJ0+Bgd2jXkoh9wJMjJ/H93E=;
        fh=KTPwn2I4KGukbzLnnC7krxOBFz/2vGPvWF748kXQmKc=;
        b=j85oLUkcxoUjhNntlToklm6m1Q/R+BfMBTOXaeiPfYYpjGCdyu5t9ryutg7wwDvPS0
         +BUwRwfq+wQ7F7tVFWcA1Kf3yyMkHNbQotRRbMSkaS4lUqIBB1+heTqwrjGvvbmg/QoC
         IUX/UK5worvyclY58ABshEA8j9/wgWv5tsOM/e8jK8NqJ/ANlphReeNjpw7G3o3euJYP
         +csRUftb6en6i9ratYSOzKrRVPbCfAMHMoNwqDbWOLfVzoIjn9s/unw1Q8tkEJgaovw+
         3b2qn3ggF1fqQntq2/r6reqKRJrjLi/zPiZgS1VJY/4spGolKM4gJj1eZOE0Nlu7bMCN
         vldg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mf14-20020a0562145d8e00b0068fd0486f10si5428667qvb.51.2024.03.11.08.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Mar 2024 08:20:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjhRn-0000sq-7T; Mon, 11 Mar 2024 11:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rjhRk-0000ry-Tx; Mon, 11 Mar 2024 11:20:12 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rjhRi-0003HR-DS; Mon, 11 Mar 2024 11:20:12 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TtgRx496wz6JBV0;
 Mon, 11 Mar 2024 23:19:41 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id CD5BF1408F9;
 Mon, 11 Mar 2024 23:19:56 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 11 Mar
 2024 15:19:56 +0000
Date: Mon, 11 Mar 2024 15:19:54 +0000
To: <ankita@nvidia.com>
CC: <jgg@nvidia.com>, <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>,
 <wangyanan55@huawei.com>, <alex.williamson@redhat.com>,
 <pbonzini@redhat.com>, <clg@redhat.com>, <shannon.zhaosl@gmail.com>,
 <peter.maydell@linaro.org>, <ani@anisinha.ca>, <berrange@redhat.com>,
 <eduardo@habkost.net>, <imammedo@redhat.com>, <mst@redhat.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <david@redhat.com>,
 <gshan@redhat.com>, <aniketa@nvidia.com>, <cjia@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <vsethi@nvidia.com>,
 <acurrid@nvidia.com>, <mochs@nvidia.com>, <dnigam@nvidia.com>,
 <udhoke@nvidia.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v9 3/3] hw/i386/acpi-build: Add support for SRAT Generic
 Initiator structures
Message-ID: <20240311151954.00007144@Huawei.com>
In-Reply-To: <20240308145525.10886-4-ankita@nvidia.com>
References: <20240308145525.10886-1-ankita@nvidia.com>
 <20240308145525.10886-4-ankita@nvidia.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ObKPquNR9cIN

On Fri, 8 Mar 2024 14:55:25 +0000
<ankita@nvidia.com> wrote:

> From: Ankit Agrawal <ankita@nvidia.com>
> 
> The acpi-generic-initiator object is added to allow a host device
> to be linked with a NUMA node. Qemu use it to build the SRAT
> Generic Initiator Affinity structure [1]. Add support for i386.
> 
> [1] ACPI Spec 6.3, Section 5.2.16.6
> 
> Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  hw/i386/acpi-build.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 1e178341de..b65202fc07 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -68,6 +68,7 @@
>  #include "hw/acpi/utils.h"
>  #include "hw/acpi/pci.h"
>  #include "hw/acpi/cxl.h"
> +#include "hw/acpi/acpi_generic_initiator.h"
>  
>  #include "qom/qom-qobject.h"
>  #include "hw/i386/amd_iommu.h"
> @@ -2056,6 +2057,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>          build_srat_memory(table_data, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
>      }
>  
> +    build_srat_generic_pci_initiator(table_data);
> +
>      /*
>       * Entry is required for Windows to enable memory hotplug in OS
>       * and for Linux to enable SWIOTLB when booted with less than

