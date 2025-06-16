Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1755397njc;
        Mon, 16 Jun 2025 03:21:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX28E2e35R+yDqOZ19OBCmvIFNo6edAIbLFewEN0hoFx6BCj9mo9/b/wVgOXskMxmSas8NNENPxlBTTgg==@linaro.org
X-Google-Smtp-Source: AGHT+IHoxcg1+NR9Bz8EYJsiUtmp7iuQwm3TpDNLSLlhKD95v3rXEIub5ySaMqh5DZwhpLnfrzep
X-Received: by 2002:a05:620a:4594:b0:7cd:b58:f4b0 with SMTP id af79cd13be357-7d3c6c2094cmr1187953885a.16.1750069278651;
        Mon, 16 Jun 2025 03:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750069278; cv=none;
        d=google.com; s=arc-20240605;
        b=UNiZz5oUN6bkXOccTWRVybPeEzL36+nKh1SLHoXllpBKGcEhIKfmlLAyS30iA/ynbc
         IOHC/KqMJ5T7M3C6NQgigwCtfpSy8SgMQUI11NXgM6thvKlw1rbturPrISTN8jtjM3nw
         98iAD9HFNiUZp+69qPrgwCMklf+4ZbWabHz8l0U1wsC1l2VEM7bRMxK7q2O/hea/zt2J
         C8LEUGWy+O6vmOi4GMF5XdTwp+qe/WolfLBZ+TPdu3q6LqSdM9Nk3Hl1JNprLJwL9ZsR
         yX2OYaZVEPAmAL4Af60o9enW3H8ChC3HKZVfiQd1q6n1/r4Kqm5XTAc+6M5GgMnFjLNX
         YkKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=X7LlBO1lKid2BQ/d0vTvV4lqgIEsWu/+ONCXzn/QOko=;
        fh=aA8gsM5QP8IJIk1ptJlCXNxyLIMaAhKHt/Cf0Wq9DRk=;
        b=h+9JMj6wA0WVHrGTBghdWrYlp4gpQmq+EAOKGHUMe71mxVRY9bp147sc2AMAUGIMrg
         r/xhPxTDS+P4GAMiP9AL9zfGFHcM3io0GXDuRiD+/FuGvSfc7074m4wiv2FWQwEqAj7z
         oKsiwPUEjdH7LP5+/GN76YGiuqWHCksQgppe4kB5gHX0Jt2ZiukIPCWSu2Q5baf0icCb
         Pyb/NYMv1fuyYL+LXJcl/9hj8hOEyfYhwhnofB8LFiYrySOOrdFolU2oz5HZFtG/wAiA
         4t/+YU2i7qJ5pQx+KYvfxoeYd56Bu0fu0/gs0tkDfZgvc4BYbjPIyEzP3DIN0nMoDLCZ
         luBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ece81fsi992704485a.339.2025.06.16.03.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 03:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR6xU-0004vj-Dw; Mon, 16 Jun 2025 06:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR6xO-0004vA-Rf; Mon, 16 Jun 2025 06:20:50 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR6xL-00062i-Or; Mon, 16 Jun 2025 06:20:50 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLQwj6yLWz6M53g;
 Mon, 16 Jun 2025 18:19:49 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id E89AF1402F7;
 Mon, 16 Jun 2025 18:20:21 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 16 Jun
 2025 12:20:21 +0200
Date: Mon, 16 Jun 2025 11:20:19 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
Message-ID: <20250616112019.00003bce@huawei.com>
In-Reply-To: <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ryC0aMmruwyx

On Fri, 13 Jun 2025 15:44:43 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Although this change does not affect functionality at present, it is

Patch title says PCIe.  This check is vs PCI host bridge.

No idea which one you wanted, but if it is PCIe needs to be
TYPC_PCIE_HOST_BRIDGE from pcie_host.h not the pci_host.h one
I think.

> required when we add support for user-creatable SMMUv3 devices in
> future patches.
> 
> Tested-by: Nathan Chen <nathanc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmu-common.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index f39b99e526..7890aa12c1 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -20,6 +20,7 @@
>  #include "trace.h"
>  #include "exec/target_page.h"
>  #include "hw/core/cpu.h"
> +#include "hw/pci/pci_bridge.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/jhash.h"
> @@ -937,7 +938,8 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>                                       g_free, g_free);
>      s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
>  
> -    if (s->primary_bus) {
> +    if (s->primary_bus && object_dynamic_cast(OBJECT(s->primary_bus)->parent,
> +                                              TYPE_PCI_HOST_BRIDGE)) {
>          pci_setup_iommu(s->primary_bus, &smmu_ops, s);
>      } else {
>          error_setg(errp, "SMMU is not attached to any PCI bus!");

