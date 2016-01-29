Received: by 10.25.159.19 with SMTP id i19csp889079lfe;
        Fri, 29 Jan 2016 03:32:48 -0800 (PST)
X-Received: by 10.140.252.212 with SMTP id x203mr10141377qhc.48.1454067168649;
        Fri, 29 Jan 2016 03:32:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c187si16638829qhd.87.2016.01.29.03.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 03:32:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aP7IG-00019z-7G
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 06:32:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aP7ID-00019q-Gl
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 06:32:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aP7IA-0006oR-7z
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 06:32:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aP7IA-0006oM-0h; Fri, 29 Jan 2016 06:32:42 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 22FA14C650;
	Fri, 29 Jan 2016 11:32:41 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0TBWaLh027043
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 29 Jan 2016 06:32:38 -0500
Date: Fri, 29 Jan 2016 12:32:36 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160129113236.GC4340@hawk.localdomain>
References: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
	<20160129063219.GA26772@ashoks@broadcom.com>
	<56AB0C33.8050400@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56AB0C33.8050400@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, Ashok Kumar <ashoks@broadcom.com>,
	ganapatrao.kulkarni@caviumnetworks.com, hanjun.guo@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/5] ARM: Add NUMA support
 for machine virt
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
X-TUID: gsZINnslOpd6

On Fri, Jan 29, 2016 at 02:52:35PM +0800, Shannon Zhao wrote:
> 
> 
> On 2016/1/29 14:32, Ashok Kumar wrote:
> > Hi, 
> > 
> > On Sat, Jan 23, 2016 at 07:36:41PM +0800, Shannon Zhao wrote:
> >> > From: Shannon Zhao <shannon.zhao@linaro.org>
> >> > 
> >> > Add NUMA support for machine virt. Tested successfully running a guest
> >> > Linux kernel with the following patch applied:
> >> > 
> >> > - [PATCH v9 0/6] arm64, numa: Add numa support for arm64 platforms
> >> > https://lwn.net/Articles/672329/
> >> > - [PATCH v2 0/4] ACPI based NUMA support for ARM64
> >> > http://www.spinics.net/lists/linux-acpi/msg61795.html
> >> > 
> >> > Changes since v3:
> >> > * based on new kernel driver and device bindings
> >> > * add ACPI part
> >> > 
> >> > Changes since v2:
> >> > * update to use NUMA node property arm,associativity.
> >> > 
> >> > Changes since v1:
> >> > Take into account Peter's comments:
> >> > * rename virt_memory_init to arm_generate_memory_dtb
> >> > * move arm_generate_memory_dtb to boot.c and make it a common func
> >> > * use a struct numa_map to generate numa dtb
> >> > 
> >> > Example qemu command line:
> >> > qemu-system-aarch64 \
> >> >     -enable-kvm -smp 4\
> >> >     -kernel Image \
> >> >     -m 512 -machine virt,kernel_irqchip=on \
> >> >     -initrd guestfs.cpio.gz \
> >> >     -cpu host -nographic \
> >> >     -numa node,mem=256M,cpus=0-1,nodeid=0 \
> >> >     -numa node,mem=256M,cpus=2-3,nodeid=1 \
> >> >     -append "console=ttyAMA0 root=/dev/ram"
> >> > 
> >> > Shannon Zhao (5):
> >> >   ARM: Virt: Add /distance-map node for NUMA
> >> >   ARM: Virt: Set numa-node-id for CPUs
> >> >   ARM: Add numa-node-id for /memory node
> >> >   include/hw/acpi/acpi-defs: Add GICC Affinity Structure
> >> >   hw/arm/virt-acpi-build: Generate SRAT table
> >> > 
> >> >  hw/arm/boot.c               | 29 ++++++++++++++++++++++-
> >> >  hw/arm/virt-acpi-build.c    | 58 +++++++++++++++++++++++++++++++++++++++++++++
> >> >  hw/arm/virt.c               | 37 +++++++++++++++++++++++++++++
> >> >  hw/i386/acpi-build.c        |  2 +-
> >> >  include/hw/acpi/acpi-defs.h | 15 +++++++++++-
> >> >  5 files changed, 138 insertions(+), 3 deletions(-)
> >> > 
> >> > -- 
> >> > 2.0.4
> >> > 
> > Don't we need to populate the NUMA node in the Affinity byte of MPIDR?
> > Linux uses the Affinity information in MPIDR to build topology which
> > might go wrong for the guest in this case. 
> > Maybe a non Linux OS might be impacted more?
> > 
> Ah, yes. It needs to update the MPIDR. But currently QEMU uses the value
> from KVM when using KVM. It needs to call kvm_set_one_reg to set the
> MPIDR and I'm not sure if this will affect KVM by looking at following
> comments:
>     /*
>      * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
>      * Currently KVM has its own idea about MPIDR assignment, so we
>      * override our defaults with what we get from KVM.
>      */
> 
> Peter, do you have any suggestion?
> 
> > distance-map compatible string has been changed from
> > "numa,distance-map-v1" to "numa-distance-map-v1"
> Will update this.

Sigh... I've had the MPIDR rework (to let QEMU dictate it0 on my TODO list
for a loooooong time. I'll pick it up today and hopefully have something to
discuss next week. I'll keep this series in mind too.

Thanks,
drew
