Received: by 10.223.188.70 with SMTP id a6csp2102912wrh;
        Thu, 24 Aug 2017 06:06:42 -0700 (PDT)
X-Received: by 10.99.97.66 with SMTP id v63mr6275223pgb.254.1503580002687;
        Thu, 24 Aug 2017 06:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503580002; cv=none;
        d=google.com; s=arc-20160816;
        b=h8BtTPpVKZ/VzQGUhQE5G+7/rR5YphozXYX4o2sJOUMry1lkFefbU2CuW8aY+KaOSE
         JGUwg4OHPS8ToXVmF2sCf0/G4hvMDBFGeB8hK528zkXIIrPT2Onx1owb8hVM5DifISZc
         T7VrQ+Xc85Tr7JQR/BDgtUdWJ6B1e8ZH7Ll5T0fGwxoT1eJUw6N9dkCAsYoJxslf+8Cp
         weGNAkooox2q7FxvUCImnjyAqXP3BnFCn1ot2ypAjLEm8AE1oJrOhl0yN+F91qAC1RBw
         ob6x/OEGmSsa1ZIFGbzTLhEa110sNFdgcUm9Qz9UH6Y4cgu5w4eV943Eei2hTBdlU/95
         BpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:in-reply-to
         :references:subject:cc:to:mime-version:user-agent:from:date
         :message-id:arc-authentication-results;
        bh=oB0SvIYAMAU0xkxUwKp1hk32qZeeRH96cSM8tqtBimY=;
        b=dyTPgcIZOOGeccPDiaI5/EjcQBFTe3l3ARG2J3pjGzicAhPB/DAeE0x4q7AnFwJgNS
         61tHQnyx/+KMLVKYfqN4/eMP2/9vYRb3ahn7dMsm7yTEq+5AwzXFp9r7panaTKqiheX4
         CUY32R8Sx1lp62aVYJDp/KWJoStHkFz7IrbrO6Lq0+Qi2qwL/nxEHZNjyiibgPVdmiT2
         uILsRHBghdEz4J5C/BtAI+66YMILELCSswoU+7BvZpsxXCcveWDPVNWq3wMZxt/msIK8
         U4Qmp9bUbc58XoLKPnQjRakjmhCxT2IpOssqGiUiuhpZ+FOyl9JUC3HCU5+ceS3arf7R
         roeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t61si2934127plb.24.2017.08.24.06.06.42;
        Thu, 24 Aug 2017 06:06:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753104AbdHXNGk (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Thu, 24 Aug 2017 09:06:40 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4566 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751601AbdHXNGh (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Thu, 24 Aug 2017 09:06:37 -0400
Received: from 172.30.72.58 (EHLO DGGEMS414-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DFW40217;
        Thu, 24 Aug 2017 21:06:18 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.301.0; Thu, 24 Aug 2017
 21:06:09 +0800
Message-ID: <599ECEF3.80001@huawei.com>
Date:   Thu, 24 Aug 2017 21:04:51 +0800
From:   Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To:     Dongjiu Geng <gengdongjiu@huawei.com>, <mst@redhat.com>,
        <imammedo@redhat.com>, <peter.maydell@linaro.org>,
        <pbonzini@redhat.com>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <kvm@vger.kernel.org>,
        <edk2-devel@lists.01.org>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <will.deacon@arm.com>,
        <james.morse@arm.com>, <tbaicar@codeaurora.org>,
        <ard.biesheuvel@linaro.org>, <mingo@kernel.org>, <bp@suse.de>,
        <shiju.jose@huawei.com>, <zjzhang@codeaurora.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-kernel@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <devel@acpica.org>,
        <john.garry@huawei.com>, <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>, <huangdaode@hisilicon.com>,
        <wangzhou1@hisilicon.com>
CC:     <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <linuxarm@huawei.com>, <zhengqiang10@huawei.com>
Subject: Re: [PATCH v11 3/6] ACPI: build and enable APEI GHES in the Makefile
 and configuration
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com> <1503066227-18251-4-git-send-email-gengdongjiu@huawei.com>
In-Reply-To: <1503066227-18251-4-git-send-email-gengdongjiu@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090206.599ECF4A.00EA,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7e0f88feab02fe4188c23b25bdb7134b
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: O+TnBb0n2vWz



On 2017/8/18 22:23, Dongjiu Geng wrote:
> Add CONFIG_ACPI_APEI configuration in the Makefile and
> enable it in the arm-softmmu.mak
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  default-configs/arm-softmmu.mak | 1 +
>  hw/acpi/Makefile.objs           | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index bbdd3c1..c362113 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -129,3 +129,4 @@ CONFIG_ACPI=y
>  CONFIG_SMBIOS=y
>  CONFIG_ASPEED_SOC=y
>  CONFIG_GPIO_KEY=y
> +CONFIG_ACPI_APEI=y
> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> index 11c35bc..bafb148 100644
> --- a/hw/acpi/Makefile.objs
> +++ b/hw/acpi/Makefile.objs
> @@ -6,6 +6,7 @@ common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG) += memory_hotplug.o
>  common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu.o
>  common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
>  common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
> +common-obj-$(CONFIG_ACPI_APEI) += hest_ghes.o
>  common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
>  
>  common-obj-y += acpi_interface.o
> 
Fold this patch into previous one.

Thanks,
-- 
Shannon
