Received: by 10.25.208.194 with SMTP id h185csp797221lfg;
        Mon, 25 Apr 2016 02:26:41 -0700 (PDT)
X-Received: by 10.55.117.10 with SMTP id q10mr38173366qkc.103.1461576401692;
        Mon, 25 Apr 2016 02:26:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m9si10251580qge.57.2016.04.25.02.26.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 02:26:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aucmt-0000Ex-Eb
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 05:26:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aucmq-00008U-Ig
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 05:26:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aucmm-0005W9-IH
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 05:26:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58327)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aucmm-0005W4-Cr; Mon, 25 Apr 2016 05:26:32 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF1EF345586;
	Mon, 25 Apr 2016 09:26:31 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3P9QR3w013069
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 25 Apr 2016 05:26:29 -0400
Date: Mon, 25 Apr 2016 11:26:27 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160425092627.ygpnp6wye6xom2j4@hawk.localdomain>
References: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
	<1461571547-13132-4-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461571547-13132-4-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 3/5] ACPI: Fix the definition
 of proximity in AcpiSratMemoryAffinity
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bTSn7zYgJ14B

On Mon, Apr 25, 2016 at 04:05:45PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> ACPI spec says that Proximity Domain is an "Integer that represents
> the proximity domain to which the processor belongs". So define it as a
> uint32_t.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/i386/acpi-build.c        | 3 +--
>  include/hw/acpi/acpi-defs.h | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Andrew Jones <drjones@redhat.com>

> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 9ae4c0d..3c031aa 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2440,8 +2440,7 @@ acpi_build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>  {
>      numamem->type = ACPI_SRAT_MEMORY;
>      numamem->length = sizeof(*numamem);
> -    memset(numamem->proximity, 0, 4);
> -    numamem->proximity[0] = node;
> +    numamem->proximity = cpu_to_le32(node);
>      numamem->flags = cpu_to_le32(flags);
>      numamem->base_addr = cpu_to_le64(base);
>      numamem->range_length = cpu_to_le64(len);
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index bcf5c3f..850a962 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -475,7 +475,7 @@ typedef struct AcpiSratProcessorAffinity AcpiSratProcessorAffinity;
>  struct AcpiSratMemoryAffinity
>  {
>      ACPI_SUB_HEADER_DEF
> -    uint8_t     proximity[4];
> +    uint32_t    proximity;
>      uint16_t    reserved1;
>      uint64_t    base_addr;
>      uint64_t    range_length;
> -- 
> 2.0.4
> 
> 
> 
