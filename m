Received: by 10.25.208.211 with SMTP id h202csp2944794lfg;
        Thu, 25 Feb 2016 09:59:07 -0800 (PST)
X-Received: by 10.140.147.134 with SMTP id 128mr1973396qht.54.1456423147009;
        Thu, 25 Feb 2016 09:59:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c197si9046092qkb.66.2016.02.25.09.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 09:59:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZ0Bu-0000WK-Ka
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 12:59:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aZ0Bn-0000TL-Eq
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 12:59:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aZ0Bi-00064d-Cq
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 12:58:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aZ0Bi-00064Z-5O; Thu, 25 Feb 2016 12:58:54 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 55D357EBAE;
	Thu, 25 Feb 2016 17:58:53 +0000 (UTC)
Received: from [10.10.60.83] (vpn-60-83.rdu2.redhat.com [10.10.60.83])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1PHwpcb009647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 25 Feb 2016 12:58:52 -0500
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1456402182-11651-1-git-send-email-peter.maydell@linaro.org>
From: Wei Huang <wei@redhat.com>
Message-ID: <56CF40DA.6070003@redhat.com>
Date: Thu, 25 Feb 2016 11:58:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1456402182-11651-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Marc Zyngier <marc.zyngier@arm.com>, kvm-arm@lists.cs.columbia.edu,
	qemu-arm@nongnu.org, Christoffer Dall <christoffer.dall@linaro.org>,
	patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH] virt: Lift the maximum RAM limit from 30GB
 to 255GB
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
X-TUID: ENXdQNeK/981



On 02/25/2016 06:09 AM, Peter Maydell wrote:
> The virt board restricts guests to only 30GB of RAM. This is a
> hangover from the vexpress-a15 board, and there's inherent reason
> for it. 30GB is smaller than you might reasonably want to provision
> a VM for on a beefy server machine. Raise the limit to 255GB.
> 
> We choose 255GB because the available space we currently have
> below the 1TB boundary is up to the 512GB mark, but we don't
> want to paint ourselves into a corner by assigning it all to
> RAM. So we make half of it available for RAM, with the 256GB..512GB
> range available for future non-RAM expansion purposes.
> 
> If we need to provide more RAM to VMs in the future then we need to:
>  * allocate a second bank of RAM starting at 2TB and working up
>  * fix the DT and ACPI table generation code in QEMU to correctly
>    report two split lumps of RAM to the guest
>  * fix KVM in the host kernel to allow guests with >40 bit address spaces
> 
> The last of these is obviously the trickiest, but it seems
> reasonable to assume that anybody configuring a VM with a quarter
> of a terabyte of RAM will be doing it on a host with more than a
> terabyte of physical address space.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> CC'ing kvm-arm as a heads-up that my proposal here is to make
> the kernel devs do the heavy lifting for supporting >255GB.
> Discussion welcome on whether I have the tradeoffs here right.
> ---
>  hw/arm/virt.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 44bbbea..7a56b46 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -95,6 +95,23 @@ typedef struct {
>  #define VIRT_MACHINE_CLASS(klass) \
>      OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
>  
> +/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
> + * RAM can go up to the 256GB mark, leaving 256GB of the physical
> + * address space unallocated and free for future use between 256G and 512G.
> + * If we need to provide more RAM to VMs in the future then we need to:
> + *  * allocate a second bank of RAM starting at 2TB and working up
> + *  * fix the DT and ACPI table generation code in QEMU to correctly
> + *    report two split lumps of RAM to the guest
> + *  * fix KVM in the host kernel to allow guests with >40 bit address spaces
> + * (We don't want to fill all the way up to 512GB with RAM because
> + * we might want it for non-RAM purposes later. Conversely it seems
> + * reasonable to assume that anybody configuring a VM with a quarter
> + * of a terabyte of RAM will be doing it on a host with more than a
> + * terabyte of physical address space.)
> + */
> +#define RAMLIMIT_GB 255
> +#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)

I managed to test this patch with a 60GB guest VM on a 64GB machine,
which is the largest I can get hold of. I haven't seen any larger
machine, but guess it should be fine for VM to have >60GB memory by
reading the code.

Tested-by: Wei Huang <wei@redhat.com>

> +
>  /* Addresses and sizes of our components.
>   * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
>   * 128MB..256MB is used for miscellaneous device I/O.
> @@ -130,7 +147,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_PCIE_MMIO] =          { 0x10000000, 0x2eff0000 },
>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
> -    [VIRT_MEM] =                { 0x40000000, 30ULL * 1024 * 1024 * 1024 },
> +    [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>      /* Second PCIe window, 512GB wide at the 512GB boundary */
>      [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
>  };
> @@ -1066,7 +1083,7 @@ static void machvirt_init(MachineState *machine)
>      vbi->smp_cpus = smp_cpus;
>  
>      if (machine->ram_size > vbi->memmap[VIRT_MEM].size) {
> -        error_report("mach-virt: cannot model more than 30GB RAM");
> +        error_report("mach-virt: cannot model more than %dGB RAM", RAMLIMIT_GB);
>          exit(1);
>      }
>  
> 
