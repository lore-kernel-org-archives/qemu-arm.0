Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp515660wrx;
        Thu, 18 Apr 2019 04:19:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMiHnaMj9TJu9OwoXgryTFnc6iLLCvxGVBsQxSC9TOxo01A7ROhfnKOUuwJ19EQy6JRh5o
X-Received: by 2002:a1c:2dd2:: with SMTP id t201mr2893576wmt.10.1555586372191;
        Thu, 18 Apr 2019 04:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555586372; cv=none;
        d=google.com; s=arc-20160816;
        b=ZhXSRRBwZtSSDRgb5N298JdnIYfqPtZhdj0iqyOtJZ7oeyCEwkaqQ9RQ9CuUiDRsSr
         L6/lIoi6MIMetZZRYR7V8R2ME6sf8bJW/XxePSouICZ8wA7n1JH7zQxNNuPbVIhNLpzR
         mHXdr1vHwdRg8IlwoBaSnbC107UecKQotyaWRHooV/6E4MGSAi3LF9GgvxTT9NN5WOSI
         KogLMfu+/OwAvFYfHxhiLC+GnSGszlsZzUkZl8INRWw0CfKJbi6W8pZFCY8LXOuAJd1O
         D1UwmCXMx3mI4AvH6nro26Yf7soSnDb6XwCyA39TljIdjWUT+ovDG+LNpvQevuNLmuQF
         6NcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=5pQ/BeMBVOcfcXec/TTPu5KPzUE+eBj8pu1NuF9ip6E=;
        b=GkWCX+YTJ+D9uZbkAVOSeZa2H3E88WUE15pcvsI5v+BXK9e4RzdgveZUD+bAUpn5Zj
         KAE2Gcf0I76NlJqnsfKuBmRYXaawHhC/pALLgoKIHJkZV9PodVxqIugarqhAGCD/6RP1
         C/hFuctj4/jn7DNzukqKejt4cZEuX+l0qxcaACgLfsyjv1Xu9M3RnWJ9Xcoof0hhwXwq
         0NNv5/F8Jv1kno+fbIwX9sXTLFMVuKKsV69qBt/I+MwrQUrXTrm9dZtAGyz+9A44uraU
         mwFoMoM2MBm5Jtz5mAGZ+6rprXVrj1Kf2W83NzAQsRTI+vIKPWZZz6J87xmLPpCA6V79
         f5nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si1450551wro.193.2019.04.18.04.19.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 04:19:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hH54l-00016o-6w
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 07:19:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hH52i-0008C7-AN
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 07:17:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hH4oh-0002z4-V9
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 07:02:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40946)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hH4og-0002yB-HT; Thu, 18 Apr 2019 07:02:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5A0181F19;
	Thu, 18 Apr 2019 11:02:53 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E266460C66;
	Thu, 18 Apr 2019 11:02:45 +0000 (UTC)
Date: Thu, 18 Apr 2019 13:02:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190418130241.635b2e97@redhat.com>
In-Reply-To: <20190417014038.26018-7-richardw.yang@linux.intel.com>
References: <20190417014038.26018-1-richardw.yang@linux.intel.com>
	<20190417014038.26018-7-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 18 Apr 2019 11:02:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 6/6] acpi: pci: use build_append_foo()
 API to construct MCFG
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbwVgEuyWj6j

On Wed, 17 Apr 2019 09:40:38 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> build_append_foo() API doesn't need explicit endianness conversions
> which eliminates a source of errors and it makes build_mcfg() look like
> declarative definition of MCFG table in ACPI spec, which makes it easy
> to review.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
Thanks for nice cleanup!

with comment fixed up:
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/pci.c               | 30 ++++++++++++++++++------------
>  include/hw/acpi/acpi-defs.h | 18 ------------------
>  2 files changed, 18 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> index fa0fa30bb9..05050fa087 100644
> --- a/hw/acpi/pci.c
> +++ b/hw/acpi/pci.c
> @@ -30,17 +30,23 @@
>  
>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>  {
> -    AcpiTableMcfg *mcfg;
> -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> -
> -    mcfg = acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address = cpu_to_le64(info->base);
> -
> -    /* Only a single allocation so no need to play with segments */
> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> -    mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
> -
> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> +    int mcfg_start = table_data->len;
> +
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +
> +    /* PCI fw r3.0 MCFG table. */
It would be better to put spec name as is here so simple search
could immediately point to it.

like: PCI Firmware Specification, Revision 3.0
      4.1.2 MCFG Table Description

> +    /* Base address, processor-relative */
> +    build_append_int_noprefix(table_data, info->base, 8);
> +    /* PCI segment group number */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* Starting PCI Bus number */
> +    build_append_int_noprefix(table_data, 0, 1);
> +    /* Final PCI Bus number */
> +    build_append_int_noprefix(table_data, PCIE_MMCFG_BUS(info->size - 1), 1);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 4);
> +
> +    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> +                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
>  }
>  
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index f9aa4bd398..57a3f58b0c 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -449,24 +449,6 @@ struct AcpiSratProcessorGiccAffinity {
>  
>  typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
>  
> -/* PCI fw r3.0 MCFG table. */
> -/* Subtable */
> -struct AcpiMcfgAllocation {
> -    uint64_t address;                /* Base address, processor-relative */
> -    uint16_t pci_segment;            /* PCI segment group number */
> -    uint8_t start_bus_number;       /* Starting PCI Bus number */
> -    uint8_t end_bus_number;         /* Final PCI Bus number */
> -    uint32_t reserved;
> -} QEMU_PACKED;
> -typedef struct AcpiMcfgAllocation AcpiMcfgAllocation;
> -
> -struct AcpiTableMcfg {
> -    ACPI_TABLE_HEADER_DEF;
> -    uint8_t reserved[8];
> -    AcpiMcfgAllocation allocation[0];
> -} QEMU_PACKED;
> -typedef struct AcpiTableMcfg AcpiTableMcfg;
> -
>  /*
>   * TCPA Description Table
>   *

