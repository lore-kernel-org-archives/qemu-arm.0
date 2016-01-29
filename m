Received: by 10.25.159.19 with SMTP id i19csp782967lfe;
        Thu, 28 Jan 2016 22:56:25 -0800 (PST)
X-Received: by 10.140.92.147 with SMTP id b19mr8464154qge.104.1454050585070;
        Thu, 28 Jan 2016 22:56:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e67si13769634qkb.67.2016.01.28.22.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jan 2016 22:56:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aP2yk-0005Sr-Rs
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 01:56:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aP2yi-0005Sj-64
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 01:56:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aP2ye-0003bx-4Z
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 01:56:20 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:11704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aP2yd-0003bk-Hw; Fri, 29 Jan 2016 01:56:16 -0500
Received: from 172.24.1.48 (EHLO SZXEML424-HUB.china.huawei.com)
	([172.24.1.48])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BVJ91705; Fri, 29 Jan 2016 14:52:49 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML424-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 29 Jan 2016 14:52:38 +0800
Message-ID: <56AB0C33.8050400@huawei.com>
Date: Fri, 29 Jan 2016 14:52:35 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Ashok Kumar <ashoks@broadcom.com>
References: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
	<20160129063219.GA26772@ashoks@broadcom.com>
In-Reply-To: <20160129063219.GA26772@ashoks@broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.56AB0C44.00A4, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 268bc9459a142e7e304fa59cf52eed48
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, ganapatrao.kulkarni@caviumnetworks.com,
	hanjun.guo@linaro.org
Subject: Re: [Qemu-arm] [PATCH v4 0/5] ARM: Add NUMA support for machine virt
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qtXjwWZLhMCE



On 2016/1/29 14:32, Ashok Kumar wrote:
> Hi, 
> 
> On Sat, Jan 23, 2016 at 07:36:41PM +0800, Shannon Zhao wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> > 
>> > Add NUMA support for machine virt. Tested successfully running a guest
>> > Linux kernel with the following patch applied:
>> > 
>> > - [PATCH v9 0/6] arm64, numa: Add numa support for arm64 platforms
>> > https://lwn.net/Articles/672329/
>> > - [PATCH v2 0/4] ACPI based NUMA support for ARM64
>> > http://www.spinics.net/lists/linux-acpi/msg61795.html
>> > 
>> > Changes since v3:
>> > * based on new kernel driver and device bindings
>> > * add ACPI part
>> > 
>> > Changes since v2:
>> > * update to use NUMA node property arm,associativity.
>> > 
>> > Changes since v1:
>> > Take into account Peter's comments:
>> > * rename virt_memory_init to arm_generate_memory_dtb
>> > * move arm_generate_memory_dtb to boot.c and make it a common func
>> > * use a struct numa_map to generate numa dtb
>> > 
>> > Example qemu command line:
>> > qemu-system-aarch64 \
>> >     -enable-kvm -smp 4\
>> >     -kernel Image \
>> >     -m 512 -machine virt,kernel_irqchip=on \
>> >     -initrd guestfs.cpio.gz \
>> >     -cpu host -nographic \
>> >     -numa node,mem=256M,cpus=0-1,nodeid=0 \
>> >     -numa node,mem=256M,cpus=2-3,nodeid=1 \
>> >     -append "console=ttyAMA0 root=/dev/ram"
>> > 
>> > Shannon Zhao (5):
>> >   ARM: Virt: Add /distance-map node for NUMA
>> >   ARM: Virt: Set numa-node-id for CPUs
>> >   ARM: Add numa-node-id for /memory node
>> >   include/hw/acpi/acpi-defs: Add GICC Affinity Structure
>> >   hw/arm/virt-acpi-build: Generate SRAT table
>> > 
>> >  hw/arm/boot.c               | 29 ++++++++++++++++++++++-
>> >  hw/arm/virt-acpi-build.c    | 58 +++++++++++++++++++++++++++++++++++++++++++++
>> >  hw/arm/virt.c               | 37 +++++++++++++++++++++++++++++
>> >  hw/i386/acpi-build.c        |  2 +-
>> >  include/hw/acpi/acpi-defs.h | 15 +++++++++++-
>> >  5 files changed, 138 insertions(+), 3 deletions(-)
>> > 
>> > -- 
>> > 2.0.4
>> > 
> Don't we need to populate the NUMA node in the Affinity byte of MPIDR?
> Linux uses the Affinity information in MPIDR to build topology which
> might go wrong for the guest in this case. 
> Maybe a non Linux OS might be impacted more?
> 
Ah, yes. It needs to update the MPIDR. But currently QEMU uses the value
from KVM when using KVM. It needs to call kvm_set_one_reg to set the
MPIDR and I'm not sure if this will affect KVM by looking at following
comments:
    /*
     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
     * Currently KVM has its own idea about MPIDR assignment, so we
     * override our defaults with what we get from KVM.
     */

Peter, do you have any suggestion?

> distance-map compatible string has been changed from
> "numa,distance-map-v1" to "numa-distance-map-v1"
Will update this.

Thanks,
-- 
Shannon

