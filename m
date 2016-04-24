Received: by 10.25.208.194 with SMTP id h185csp509406lfg;
        Sun, 24 Apr 2016 10:30:02 -0700 (PDT)
X-Received: by 10.140.179.76 with SMTP id z73mr11265553qhz.36.1461519002655;
        Sun, 24 Apr 2016 10:30:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p68si8701814qgp.56.2016.04.24.10.30.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Apr 2016 10:30:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auNr8-0000ri-7P
	for alex.bennee@linaro.org; Sun, 24 Apr 2016 13:30:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNr6-0000on-4f
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 13:30:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNr2-0000jo-VZ
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 13:30:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1auNr2-0000ji-Q4; Sun, 24 Apr 2016 13:29:56 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F92E85538;
	Sun, 24 Apr 2016 17:29:56 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-19.brq.redhat.com [10.40.204.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3OHTqVi016362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 24 Apr 2016 13:29:54 -0400
Date: Sun, 24 Apr 2016 19:29:52 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160424172952.xozmrv74rvie6fsd@hawk.localdomain>
References: <1461405855-15576-1-git-send-email-zhaoshenglong@huawei.com>
	<1461405855-15576-4-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461405855-15576-4-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/3] hw/arm/virt-acpi-build:
 Add PMU IRQ number in ACPI table
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
Cc: peter.maydell@linaro.org, peter.huangpeng@huawei.com, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sM+Jxd4YssVs

On Sat, Apr 23, 2016 at 06:04:15PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add PMU IRQ number in ACPI table, then we can use PMU in guest through
> ACPI.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Andrew Jones <drjones@redhat.com>

> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f51fe39..5031232 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -491,6 +491,9 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>          gicc->arm_mpidr = armcpu->mp_affinity;
>          gicc->uid = i;
>          gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
> +
> +        if (armcpu->has_pmu)
> +            gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>      }
>  
>      if (guest_info->gic_version == 3) {
> -- 
> 2.0.4
> 
> 
> 
