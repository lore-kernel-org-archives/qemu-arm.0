Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp973297wrv;
        Wed, 17 Jul 2019 07:51:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9zwOV/nMUTfQKqZUR//sIQGrThrKaLCUF7m84W2Y7r1AMWurKala/+2c2dsn3kRA2AliF
X-Received: by 2002:aa7:d058:: with SMTP id n24mr9900104edo.143.1563375083727;
        Wed, 17 Jul 2019 07:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563375083; cv=none;
        d=google.com; s=arc-20160816;
        b=BIxNyJjePzH/ghM/W3P0wn0el0KYl6IXiAHA2B97vOiloxNMnm2/D4lskmBsiyDYoj
         VVG1rg8uKAB1L0dUBal3sOxruy9ZUjrnbQGWNkiG01U5qavjAjeHceCD33nYb/oQ9cHl
         LEzy8fYKKijNW+K78bXxesgBt+PRfhDErISyxLlVb5w+ZAIjrTqZ34fD3g7WptViuuha
         lMQfEj6AauhTTRozpaOrXZop1jqSG450xv+05eOXEPbyOmuSTtqrfz42eprKoqa9EQCC
         dl5SueGlCYnWznh/X9PnGoAy+bxURM7b5hKjy0LAhLYFTcWJMPGQDZbh3D+VXu0WVZV4
         S57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=11dNTPwMbxSeAtJfgGtl57uF3lLec09tN8bksP3rTRg=;
        b=ZBM7lEAl5Zh0WF+fMpOtxI4Kbn/v17dhPCAfsab9KiAk5dO0C9hbsLpXgp2ocs9hmq
         lBwN/okeKcUf4UQPeV59WDR2ZmRwiZ2u3A9ZRTuHKKebwUXqFWX8LyvfBk+5LK8eCbt2
         L8AAqq2baW8oqozo/GXiyQ0amoi+si16xoxHAKHQ4gjLIfZk3rW4EDEiJmFnwX+XR7j0
         dzCnge/DkdYx6/rjNng5ZbLpG3YzfEote5+XLfiRwM4cILWUHynsVUeIzA2iTMW5h4fn
         v4yjWAbk04kbymlrhqs8u86rUAoduT+B1yhIcUOG/N6tfv6fFN+/G5cFIH5/blj1FsC5
         iw5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f30si14392259edb.390.2019.07.17.07.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2019 07:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnlH8-0001T8-QQ
	for alex.bennee@linaro.org; Wed, 17 Jul 2019 10:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46863)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hnlH5-0001Sp-5k
 for qemu-arm@nongnu.org; Wed, 17 Jul 2019 10:51:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hnlH4-0005LD-2A
 for qemu-arm@nongnu.org; Wed, 17 Jul 2019 10:51:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1hnlH3-0005KL-Qq; Wed, 17 Jul 2019 10:51:17 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 68D8859440;
 Wed, 17 Jul 2019 14:51:16 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83AC219C4F;
 Wed, 17 Jul 2019 14:51:09 +0000 (UTC)
Date: Wed, 17 Jul 2019 16:51:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190717165108.237c1926@redhat.com>
In-Reply-To: <20190716153816.17676-6-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
 <20190716153816.17676-6-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 17 Jul 2019 14:51:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v7 05/10] hw/arm/virt: Add 4.2
 machine type
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
 ard.biesheuvel@linaro.org, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xSyKR9byxjH8

On Tue, 16 Jul 2019 16:38:11 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This is in preparation to create ACPI GED device as we
> need to disable it for <4.2 for migration to work.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c       | 9 ++++++++-
>  hw/core/machine.c   | 3 +++
>  include/hw/boards.h | 3 +++
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 907fb64bb9..bbe156dc35 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2095,10 +2095,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_4_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(4, 2)
> +
>  static void virt_machine_4_1_options(MachineClass *mc)
>  {
> +    virt_machine_4_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(4, 1)
> +DEFINE_VIRT_MACHINE(4, 1)
>  
>  static void virt_machine_4_0_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index c58a8e594e..a79d4ad740 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -27,6 +27,9 @@
>  #include "hw/pci/pci.h"
>  #include "hw/mem/nvdimm.h"
>  
> +GlobalProperty hw_compat_4_1[] = {};
> +const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
> +
>  GlobalProperty hw_compat_4_0[] = {
>      { "VGA",            "edid", "false" },
>      { "secondary-vga",  "edid", "false" },
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index a71d1a53a5..d9ec37d807 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -317,6 +317,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_4_1[];
> +extern const size_t hw_compat_4_1_len;
> +
>  extern GlobalProperty hw_compat_4_0[];
>  extern const size_t hw_compat_4_0_len;
>  

