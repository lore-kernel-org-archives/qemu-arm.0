Received: by 10.25.208.194 with SMTP id h185csp808337lfg;
        Fri, 22 Apr 2016 07:43:25 -0700 (PDT)
X-Received: by 10.140.29.97 with SMTP id a88mr15984528qga.45.1461336204941;
        Fri, 22 Apr 2016 07:43:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si3758434qha.99.2016.04.22.07.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 07:43:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atcIm-0008Vd-H2
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 10:43:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1atcIk-0008SM-Ft
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 10:43:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1atcIf-0002Zb-GY
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 10:43:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1atcIf-0002ZO-BG; Fri, 22 Apr 2016 10:43:17 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5733237E81;
	Fri, 22 Apr 2016 14:43:16 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3MEhCWr008183
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 22 Apr 2016 10:43:14 -0400
Date: Fri, 22 Apr 2016 16:43:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160422144312.ga63a2nsv54st3ck@hawk.localdomain>
References: <1458899181-17896-1-git-send-email-zhaoshenglong@huawei.com>
	<1458899181-17896-4-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1458899181-17896-4-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 PMU IRQ number in ACPI table
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
Cc: peter.maydell@linaro.org, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sQxjtDQjZNZn

On Fri, Mar 25, 2016 at 05:46:21PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add PMU IRQ number in ACPI table, then we can use PMU in guest through
> ACPI.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6a86b2c..7a377e5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -490,6 +490,9 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>          gicc->arm_mpidr = armcpu->mp_affinity;
>          gicc->uid = i;
>          gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
> +
> +        if (armcpu->has_pmu)
> +            gicc->performance_interrupt = VIRTUAL_PMU_IRQ + 16;

missing cpu_to_le32(). Actually this function is missing lots of those.
Here's another place we could use a PPI() macro to avoid sprinkling
16's around everywhere.

>      }
>  
>      if (guest_info->gic_version == 3) {
> -- 
> 2.0.4

Otherwise looks good.

drew
