Received: by 10.25.159.19 with SMTP id i19csp804589lfe;
        Thu, 28 Jan 2016 23:59:22 -0800 (PST)
X-Received: by 10.202.104.159 with SMTP id o31mr5383035oik.126.1454054362208;
        Thu, 28 Jan 2016 23:59:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>
Received: from socrates.bennee.com (static.88-198-71-155.clients.your-server.de. [88.198.71.155])
        by mx.google.com with ESMTPS id s187si13341556oib.10.2016.01.28.23.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jan 2016 23:59:22 -0800 (PST)
Received-SPF: fail (google.com: domain of qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org does not designate 88.198.71.155 as permitted sender) client-ip=88.198.71.155;
Authentication-Results: mx.google.com;
       spf=fail (google.com: domain of qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org does not designate 88.198.71.155 as permitted sender) smtp.mailfrom=qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
Message-ID: <56ab1bda.c45eca0a.875d1.ffffae59SMTPIN_ADDED_BROKEN@mx.google.com>
X-Google-Original-Message-ID: <20160129063219.GA26772@ashoks@broadcom.com>
Received: from lists.gnu.org ([208.118.235.17])
	by socrates.bennee.com with esmtp (Exim 4.84)
	(envelope-from <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>)
	id 1aP2cO-0007Zl-Lb
	for kernel-hacker@bennee.com; Fri, 29 Jan 2016 07:33:17 +0100
Received: from localhost ([::1]:60188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>)
	id 1aP2cJ-0004Bs-8V
	for kernel-hacker@bennee.com; Fri, 29 Jan 2016 01:33:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ashoks@broadcom.com>) id 1aP2bl-0003c9-3w
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 01:32:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ashoks@broadcom.com>) id 1aP2bj-000701-UQ
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 01:32:37 -0500
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:27327)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ashoks@broadcom.com>)
	id 1aP2bf-0006xB-De; Fri, 29 Jan 2016 01:32:31 -0500
X-IronPort-AV: E=Sophos;i="5.22,362,1449561600"; d="scan'208";a="86751517"
Received: from irvexchcas06.broadcom.com (HELO
	IRVEXCHCAS06.corp.ad.broadcom.com) ([10.9.208.53])
	by mail-gw1-out.broadcom.com with ESMTP; 29 Jan 2016 01:19:43 -0800
Received: from IRVEXCHSMTP1.corp.ad.broadcom.com (10.9.207.51) by
	IRVEXCHCAS06.corp.ad.broadcom.com (10.9.208.53) with Microsoft SMTP
	Server (TLS) id 14.3.235.1; Thu, 28 Jan 2016 22:32:27 -0800
Received: from mail-sj1-12.sj.broadcom.com (10.10.10.20) by
	IRVEXCHSMTP1.corp.ad.broadcom.com (10.9.207.51) with Microsoft SMTP
	Server id 14.3.235.1; Thu, 28 Jan 2016 22:32:27 -0800
Received: from xl-sj1-03.broadcom.com (xl-sj1-03.sj.broadcom.com
	[10.17.18.52])	by mail-sj1-12.sj.broadcom.com (Postfix) with ESMTP id
	954E527A82;	Thu, 28 Jan 2016 22:32:27 -0800 (PST)
Received: by xl-sj1-03.broadcom.com (Postfix, from userid 31394)	id
	87E9C1C8205C; Thu, 28 Jan 2016 22:32:27 -0800 (PST)
Date: Thu, 28 Jan 2016 22:32:27 -0800
From: Ashok Kumar <ashoks@broadcom.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
References: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.4.2.2i
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.31.210.62
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, ganapatrao.kulkarni@caviumnetworks.com,
	hanjun.guo@linaro.org
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
Sender: qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
X-SA-Exim-Connect-IP: 208.118.235.17
X-SA-Exim-Mail-From: qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on socrates.bennee.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,MSGID_MULTIPLE_AT,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,T_HEADER_FROM_DIFFERENT_DOMAINS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Subject: Re: [Qemu-devel] [PATCH v4 0/5] ARM: Add NUMA support for machine
	virt
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:57:07 +0000)
X-SA-Exim-Scanned: Yes (on socrates.bennee.com)
X-TUID: 9jwUapREIHwC

Hi, 

On Sat, Jan 23, 2016 at 07:36:41PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add NUMA support for machine virt. Tested successfully running a guest
> Linux kernel with the following patch applied:
> 
> - [PATCH v9 0/6] arm64, numa: Add numa support for arm64 platforms
> https://lwn.net/Articles/672329/
> - [PATCH v2 0/4] ACPI based NUMA support for ARM64
> http://www.spinics.net/lists/linux-acpi/msg61795.html
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
> Shannon Zhao (5):
>   ARM: Virt: Add /distance-map node for NUMA
>   ARM: Virt: Set numa-node-id for CPUs
>   ARM: Add numa-node-id for /memory node
>   include/hw/acpi/acpi-defs: Add GICC Affinity Structure
>   hw/arm/virt-acpi-build: Generate SRAT table
> 
>  hw/arm/boot.c               | 29 ++++++++++++++++++++++-
>  hw/arm/virt-acpi-build.c    | 58 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/virt.c               | 37 +++++++++++++++++++++++++++++
>  hw/i386/acpi-build.c        |  2 +-
>  include/hw/acpi/acpi-defs.h | 15 +++++++++++-
>  5 files changed, 138 insertions(+), 3 deletions(-)
> 
> -- 
> 2.0.4
> 

Don't we need to populate the NUMA node in the Affinity byte of MPIDR?
Linux uses the Affinity information in MPIDR to build topology which
might go wrong for the guest in this case. 
Maybe a non Linux OS might be impacted more?

distance-map compatible string has been changed from
"numa,distance-map-v1" to "numa-distance-map-v1"

Thanks,
Ashok
