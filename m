Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2665573wrt;
        Mon, 17 Dec 2018 08:05:56 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VAKFFmRcJLCzPKBrjfm72RsEsVzBmtahejjwV2a/eY5P6Reuc4hdN0yWjM6IPOr6TuQufv
X-Received: by 2002:ae9:c20b:: with SMTP id j11mr13243277qkg.211.1545062755979;
        Mon, 17 Dec 2018 08:05:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545062755; cv=none;
        d=google.com; s=arc-20160816;
        b=FSvOX8zX1zcwupdL5beRTzV94obnMiRdVUna0OZyGESoNE1dyWtFFmT2/BaQWi63TG
         UcnHCOhb1lsGy5LkOAt+kuZW4564okHaW04Bk2LuuQ9w9TNIbu9OaB6SPyLcHcYnpqlM
         +Qzm3EgQ11z+f4ytobuDeU6x39IuquQYKrcQPhDJuBP1m/7m7C8gmwFbor+PZhur3/e4
         h1DHDF+zMfptttQqEDo3BPWn4QVwPd1Ttx6/p5Q3hx9hq1wtP2BXKQZXAWXd9dbaTbJd
         WULyT2Q60u3eOFSIaZB7ecQdG9+bLYrca9Hy9UeT1V4ZOXAnzS7+F34J1V5WjdigKjB8
         u+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=/2q7qLaTMqstL0681rR299KDjfgsOjHu/RHPjPZFav0=;
        b=BFsSOomnE+rJQG4rd6/S0pVFffEBM7Z+v/XTSMbImJ2SlqnCNeMkNaXC9v1Ajkqj9S
         yk7vNINm+Jt9idY65lhJVRT+l8u4d3PePn3GV+TdZl4xwF+U7gePTbUnDit24DjokHIQ
         SMrccxXBe4bLMv0V1sAIIxo1zF6T/KQ+0fHXj3RoSYqGLFiFNqsoCuf6heHQYJg+Wq+Z
         Rxc/thNqPj0GXgFPUF3aGlBbzRB+7L680mC/PRIRS8QOsYD5uPMGlZtGpCcI6dxQHLvc
         gR5PPSKKhVvUvXibN8UyNV2yUd+fSxCfTl5MRyXJ+3RuO6cGVAqHdjEeEJTq5Blg7TlC
         Huqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si5605403qkx.42.2018.12.17.08.05.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 08:05:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYvP1-0000CC-8a
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 11:05:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gYvLh-0006cT-24
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 11:02:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gYvLZ-0002Gb-K9
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 11:02:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45268)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gYvLZ-0002Fz-Dw; Mon, 17 Dec 2018 11:02:21 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4699D81DE9;
	Mon, 17 Dec 2018 16:02:20 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B750E6012B;
	Mon, 17 Dec 2018 16:02:10 +0000 (UTC)
Date: Mon, 17 Dec 2018 17:02:08 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20181217160208.uhz5pjr2yxxosljw@kamzik.brq.redhat.com>
References: <20181206170733.7469-1-eric.auger@redhat.com>
	<20181206170733.7469-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181206170733.7469-2-eric.auger@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 17 Dec 2018 16:02:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.0 v2 1/2]
 hw/arm/virt-acpi-build: Set COHACC override flag in IORT SMMUv3 node
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6HjnAfOy2Wvr

On Thu, Dec 06, 2018 at 06:07:32PM +0100, Eric Auger wrote:
> Let's report IO-coherent access is supported for translation
> table walks, descriptor fetches and queues by setting the COHACC
> override flag. Without that, we observe wrong command opcodes.
> The DT description also advertises the dma coherency.
> 
> Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> ---
> 
> - change the commit title
> - addition of new fields (pxm and id_mapping_index) done in a
>   separate patch
> ---
>  hw/arm/virt-acpi-build.c    | 1 +
>  include/hw/acpi/acpi-defs.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 5785fb697c..aa177ba64d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -448,6 +448,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          smmu->mapping_count = cpu_to_le32(1);
>          smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>          smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
> +        smmu->flags = ACPI_IORT_SMMU_V3_COHACC_OVERRIDE;

Flags are 4 bytes in length, so you need cpu_to_le32()

>          smmu->event_gsiv = cpu_to_le32(irq);
>          smmu->pri_gsiv = cpu_to_le32(irq + 1);
>          smmu->gerr_gsiv = cpu_to_le32(irq + 2);
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index af8e023968..532eaf79bd 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -628,6 +628,8 @@ struct AcpiIortItsGroup {
>  } QEMU_PACKED;
>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>  
> +#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
> +
>  struct AcpiIortSmmu3 {
>      ACPI_IORT_NODE_HEADER_DEF
>      uint64_t base_address;
> -- 
> 2.17.2
> 
> 

Probably not necessary for this series, but we should really switch all
table generators to the aml_append* API.

Besides the missing cpu_to_le32(),

Reviewed-by: Andrew Jones <drjones@redhat.com>
