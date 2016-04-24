Received: by 10.25.208.194 with SMTP id h185csp504473lfg;
        Sun, 24 Apr 2016 10:12:52 -0700 (PDT)
X-Received: by 10.55.31.203 with SMTP id n72mr16093029qkh.53.1461517971952;
        Sun, 24 Apr 2016 10:12:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v78si131918qhb.119.2016.04.24.10.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Apr 2016 10:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auNaV-0007Iv-EK
	for alex.bennee@linaro.org; Sun, 24 Apr 2016 13:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNaS-0007BN-ND
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 13:12:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNaO-0005eq-Aq
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 13:12:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33733)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1auNaO-0005em-65; Sun, 24 Apr 2016 13:12:44 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7D3585538;
	Sun, 24 Apr 2016 17:12:43 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-19.brq.redhat.com [10.40.204.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3OHCdWA031289
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 24 Apr 2016 13:12:42 -0400
Date: Sun, 24 Apr 2016 19:12:38 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160424171238.z2tnb7c4tq7azcln@hawk.localdomain>
References: <1461402396-11776-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461402396-11776-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 0/5] ARM: Add NUMA support
 for machine virt
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GCLptcUTPOD7

On Sat, Apr 23, 2016 at 05:06:31PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add NUMA support for machine virt. Tested successfully running a guest
> Linux kernel with the following patch applied:
> 
> - [PATCH v16 0/6] arm64, numa: Add numa support for arm64 platforms
> https://lkml.org/lkml/2016/4/8/571
> - [PATCH v5 00/14] ACPI NUMA support for ARM64
> https://lkml.org/lkml/2016/4/19/852
> 
> Example qemu command line:
> qemu-system-aarch64 \
>     -enable-kvm -smp 4\
>     -kernel Image \
>     -m 512 -machine virt,kernel_irqchip=on \
>     -initrd guestfs.cpio.gz \
>     -cpu host -nographic \
>     -numa node,mem=256M,cpus=0-1,nodeid=0 \
>     -numa node,mem=256M,cpus=2-3,nodeid=1 \
>     -append "console=ttyAMA0 root=/dev/ram"
> 
> Changes since v5:
> * don't generate /distance-map node since it's optional
> * improve the /memory node name
> * move acpi_build_srat_memory to common place then reuse it to generate
>   SRAT table
> 
> Changes since v4:
> * rebased on new kernel driver and device bindings, especially the
>   compatible string "numa-distance-map-v1" of /distance-map node
> * set the numa-node-id for first /memory node
> 
> Changes since v3:
> * based on new kernel driver and device bindings
> * add ACPI part
> 
> Changes since v2:
> * update to use NUMA node property arm,associativity.
> 
> Changes since v1:
> Take into account Peter's comments:
> * rename virt_memory_init to arm_generate_memory_dtb
> * move arm_generate_memory_dtb to boot.c and make it a common func
> * use a struct numa_map to generate numa dtb
> 
> Shannon Zhao (5):
>   ARM: Virt: Set numa-node-id for CPUs
>   ARM: Add numa-node-id for /memory node

I think we need to squash these first two patch together. Otherwise if
you're bisecting qemu using a guest boot for a test case, then you could
end up booting with numa-node-id set in the cpus, without their
corresponding memory node.

drew

>   ACPI: Add GICC Affinity Structure
>   ACPI: move acpi_build_srat_memory to common place
>   ACPI: Virt: Generate SRAT table
> 
>  hw/acpi/aml-build.c         | 12 +++++++++++
>  hw/arm/boot.c               | 43 +++++++++++++++++++++++++++++++------
>  hw/arm/virt-acpi-build.c    | 52 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/virt.c               |  8 +++++++
>  hw/i386/acpi-build.c        | 22 +------------------
>  include/hw/acpi/acpi-defs.h | 15 ++++++++++++-
>  include/hw/acpi/aml-build.h | 10 +++++++++
>  7 files changed, 134 insertions(+), 28 deletions(-)
> 
> -- 
> 2.0.4
> 
> 
> 
