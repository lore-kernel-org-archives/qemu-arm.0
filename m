Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1576997wrs;
        Wed, 13 Mar 2019 05:14:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxCnnExai4ksMoihO1JJKHFI2W4Czy/AJBHQ9YZhU6i0ERWdf6rHnb6Wzhk/JGYsAudXWOd
X-Received: by 2002:a81:9301:: with SMTP id k1mr6621087ywg.494.1552479293465;
        Wed, 13 Mar 2019 05:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552479293; cv=none;
        d=google.com; s=arc-20160816;
        b=vPxCPCMqi4xaHGTzpIkSAiaWFF3XH8vn4y4DMm8JeELYvWOzQS3IOX0vzDqYjjO1xI
         qWx8/vciB6KYGywvmxhEHsZrJ2SRHEOwVuPOWJKXbh9bjUeu5Pcsn7TODlqRuaCUuj9Q
         f5Ab32ufUv9Kdrzk4vBeOu9wiln0rD4ATdz8pGCPbA1U/8U6etuet1ffSS4c0weJr+Zs
         a4b1qb4eBALzgsAxm6zdHO4i8k5yEF2DVaZyOLIIkQUX7DzlGGZgZ+7ux/NPK3MrphdP
         aKOfbnasauwJ37j4k/DJZhQ8LvlMpr3uVWIPPsqe1205zMTC5MaiG6SgYUGshFhqclJU
         cC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=SkS9baj84I1sWXzLzMp+70pyXwq61S+U/0KhSNXWqqY=;
        b=Y7qZRuggJvifS95/B29FgXBLn3NUvK2CYieL9T9m2J8byGOmQA2QOqj/LX/NUk1czY
         SneQuKrGFurvfFsft1ioqAMOw4pWYaFgivumRQfb9UVRIa1Z21d+t2QSz1B8scl06AN3
         /uhkj5MCcSXXvAPvXWs0ttKgotfCLX4ZvVUKkiWa8yTT/rUJC/AN58dF6zQgrP8JXoNS
         chXMmhDuvwKCOXGUHhLokdV+CXe7ncgOv3MoBIRGlT/zDGISWRh7FXYlxYekMqy0GnZM
         00jXhwUhsaDDungQ3HCu//f1Qa2ywwN0M9HK07ysvJWRZUmpy7PM3AOERhO+tfPm06UB
         GPoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si5882837ywm.110.2019.03.13.05.14.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 05:14:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h42ma-0006D9-Th
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 08:14:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h42eK-00070f-EB
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 08:06:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h42eH-00084A-8z
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 08:06:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h42eG-0007zp-Fm; Wed, 13 Mar 2019 08:06:16 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C476E1EF4;
	Wed, 13 Mar 2019 12:06:11 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA53217D13;
	Wed, 13 Mar 2019 12:06:07 +0000 (UTC)
Date: Wed, 13 Mar 2019 13:06:06 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190313130606.79e8fa5c@redhat.com>
In-Reply-To: <20190313044253.31988-3-richardw.yang@linux.intel.com>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-3-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 13 Mar 2019 12:06:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 2/3] hw/arm/virt-acpi-build: remove
 unnecessary variable mcfg_start
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gq0v2HgLwl3o

On Wed, 13 Mar 2019 12:42:52 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> mcfg_start points to the start of MCFG table and is used in
> build_header. While this information could be derived from mcfg.
> 
> This patch removes the unnecessary variable mcfg_start.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7713c2d809..ae7858a79a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -562,18 +562,15 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>  {
>      AcpiTableMcfg *mcfg;
>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> -    int mcfg_start = table_data->len;
>  
>      mcfg = acpi_data_push(table_data, len);
>      mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
> -
>      /* Only a single allocation so no need to play with segments */
>      mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>      mcfg->allocation[0].start_bus_number = 0;
>      mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
>  
> -    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> -                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
> +    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>  }
>  
>  /* GTDT */

