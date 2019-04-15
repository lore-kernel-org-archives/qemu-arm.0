Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2712659wrx;
        Mon, 15 Apr 2019 07:01:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVWI8GRrocUe/9+BxIdnUJbuKYm6n7cMP37fFrb6VgN5T5VWlwqbHrxMD/+bqFr6h5T/Qq
X-Received: by 2002:adf:afe1:: with SMTP id y33mr49558667wrd.288.1555336862430;
        Mon, 15 Apr 2019 07:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555336862; cv=none;
        d=google.com; s=arc-20160816;
        b=kkvmXja20ZvzBlT1fmWwr+A732IRavsqdTY+OAheTFtjWovgbRgsp95Afe7jOYXqNk
         FuXPTHLV41jr9ZSn9D2Ztd4zyC7ofx/TpfjBbE0rsCbgCPkono7aljjAQP0DMoFK9N2d
         C4d7TdthXpsonheEnpK+3E5ygGZ289HdILMtqEzWtTx9gxAPf1wzIK1hj2umUidObuMT
         aMAcFVtTCP9dd/NKXdv4hvvomMx4Ig2zsIe3FPIRhuDGH+lZVWiJ8slr4gMqLzmXQjcI
         EN/QIDgC604WEER9GZs2V9N7OMYsorQBAWb+i/dzd09WumHAblJFkfeCQpO6mdAhJe/t
         t65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=ct3fXQ8yh1bJnvoSg8fHpChx6r5JAbAiVM2L1mychDo=;
        b=X75BuPsMgjYm5kYYDcgCvWuWQyaXy/YqM5IbaY/jKY4Fww3VOvbeKSZMVat7/JGD2v
         Yk+UHiLluNpPqKmzLB+TJr4lt4BsQpYNV84TjpXnsPtcILfewzLGu78mp+A54N9KbOXX
         e7bcIV4ZkiD8Mit5lGS9pe6bPBkwSllBAicss1gVyM3jJlfVeWYSvVXSFUKLauYxRGFG
         4dQ5n3Zs2+2kmGxW9GXdumTWtgAqpSxvc6Tx/atJs65J4hKAudp9WHDNAsRKRcxsWHuZ
         7gpK5pVChCZ9771Oj/6bjwmzii4DvxLzOk+VMBpW9ypQmbmkcqdMgAJQS/iPVI9GKZat
         AYvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r185si11884183wma.22.2019.04.15.07.01.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 07:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50666 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hG2AP-0007Mp-J3
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 10:01:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hG2A7-0007KO-9H
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 10:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hG2A6-0000r4-8V
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 10:00:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54402)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hG2A5-0000qa-W4; Mon, 15 Apr 2019 10:00:42 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F79D307D932;
	Mon, 15 Apr 2019 14:00:41 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-37.ams2.redhat.com
	[10.36.112.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6B1A177AC;
	Mon, 15 Apr 2019 14:00:38 +0000 (UTC)
Date: Mon, 15 Apr 2019 16:00:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190415160036.53bed360@Igors-MacBook-Pro.local>
In-Reply-To: <20190415070307.13668-3-richardw.yang@linux.intel.com>
References: <20190415070307.13668-1-richardw.yang@linux.intel.com>
	<20190415070307.13668-3-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 15 Apr 2019 14:00:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 2/4] i386,
 acpi: remove mcfg_ prefix in AcpiMcfgInfo members
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r0xv9fr9COxD

On Mon, 15 Apr 2019 15:03:05 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> This is obvious the member in AcpiMcfgInfo describe MCFG's property.
> 
> Remove the mcfg_ prefix.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d009176072..f0d27bffd6 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -87,8 +87,8 @@
>  #define ACPI_BUILD_IOAPIC_ID 0x0
>  
>  typedef struct AcpiMcfgInfo {
> -    uint64_t mcfg_base;
> -    uint32_t mcfg_size;
> +    uint64_t base;
> +    uint32_t size;
>  } AcpiMcfgInfo;
>  
>  typedef struct AcpiPmInfo {
> @@ -2404,11 +2404,11 @@ build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>      int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
>  
>      mcfg = acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
> +    mcfg->allocation[0].address = cpu_to_le64(info->base);
>      /* Only a single allocation so no need to play with segments */
>      mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>      mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
>  
>      build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>  }
> @@ -2577,15 +2577,15 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>      if (!o) {
>          return false;
>      }
> -    mcfg->mcfg_base = qnum_get_uint(qobject_to(QNum, o));
> +    mcfg->base = qnum_get_uint(qobject_to(QNum, o));
>      qobject_unref(o);
> -    if (mcfg->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
> +    if (mcfg->base == PCIE_BASE_ADDR_UNMAPPED) {
>          return false;
>      }
>  
>      o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NULL);
>      assert(o);
> -    mcfg->mcfg_size = qnum_get_uint(qobject_to(QNum, o));
> +    mcfg->size = qnum_get_uint(qobject_to(QNum, o));
>      qobject_unref(o);
>      return true;
>  }

