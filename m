Received: by 10.25.208.211 with SMTP id h202csp2912406lfg;
        Thu, 25 Feb 2016 08:52:17 -0800 (PST)
X-Received: by 10.140.92.111 with SMTP id a102mr57126818qge.92.1456419137222;
        Thu, 25 Feb 2016 08:52:17 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id u185si8751350qhu.83.2016.02.25.08.52.16;
        Thu, 25 Feb 2016 08:52:16 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dkim=neutral (body hash did not verify) header.i=@linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 93EB14968B;
	Thu, 25 Feb 2016 11:45:27 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.209
X-Spam-Level: 
X-Spam-Status: No, score=0.209 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_LOW=-0.7,
	T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u0lR9Bs45Doo; Thu, 25 Feb 2016 11:45:26 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 9225A495BD;
	Thu, 25 Feb 2016 11:45:26 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 930D54852E
 for <kvmarm@lists.cs.columbia.edu>; Thu, 25 Feb 2016 11:45:25 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-kCFZJRGVcU for <kvmarm@lists.cs.columbia.edu>;
 Thu, 25 Feb 2016 11:45:23 -0500 (EST)
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
 [209.85.213.49])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 43DDB413E1
 for <kvmarm@lists.cs.columbia.edu>; Thu, 25 Feb 2016 11:45:23 -0500 (EST)
Received: by mail-vk0-f49.google.com with SMTP id e185so53033817vkb.1
 for <kvmarm@lists.cs.columbia.edu>; Thu, 25 Feb 2016 08:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-type;
 bh=riYcUXyo99i+bn3JeChfq1g5KIieM/1AqNOOD1lBe1k=;
 b=jdYgKk0Y49qg4wbzuliaA2qwdhnt63jOqDlq9U+suZRhzk8aOnAUzfOScMfLBHqRyo
 CUQeRfnBmT70a5la8yYeQKpT9ZYW8+Kvdj5En+uQ4dGIizE7bf1E4Z6UfHCnzDGuWCe7
 7lOgijfJ7u1C+hDLLW8L64UXdrFX/vA1E+v2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-type;
 bh=riYcUXyo99i+bn3JeChfq1g5KIieM/1AqNOOD1lBe1k=;
 b=IUhDlDqaMjHgjNNW3MzlkeNprcK9lMlmnX8jrvW0tFnrkLyKlOqJQDPvOlmzOZjVUt
 aE86J8CT7a/qLLQckTB8Edo9tO87LA6xHtgISb9w5d7ou9Pj8KGbIhRX3hXmKe/BLPzF
 a90agC5owGtA5WzElTKlNmt+KmQhxbU/gcMpJY8/gXJrAmUZcP1+8W7iUAMb8rlc2SCl
 RAtR92N4Skc8bnaDbsvcpJBnUUp+4Fk+j+oZZ/KYOWfO7ePDinVmF5bOPKhV69Xm4GWS
 E8Px4EAcGVz6VU+xexA1ldB/E1iJ4+Dj6/bBV0GvUS34PXmC/mjXktwmGS1g8gZRbyiu
 4rgg==
X-Gm-Message-State: AG10YOTZcOXMzp2tPlTZhdZgP9oJirrln4+T0j41SNMwMHFm0DeXzMd8UbdFrwPrrfkY5d8UqJ9oD+Ycql49iAqe
X-Received: by 10.31.52.147 with SMTP id b141mr37627988vka.82.1456419131154;
 Thu, 25 Feb 2016 08:52:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 08:51:51 -0800 (PST)
In-Reply-To: <1456402182-11651-1-git-send-email-peter.maydell@linaro.org>
References: <1456402182-11651-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 16:51:51 +0000
Message-ID: <CAFEAcA9d6u=2GLo5UEXGPzb=9bZNnk-CgEOt=235giCdPTW_pw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] virt: Lift the maximum RAM limit from 30GB
 to 255GB
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 Patch Tracking <patches@linaro.org>
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: qy6RCin5CfFA

[Typoed the kvmarm list address; sorry... -- PMM]

On 25 February 2016 at 12:09, Peter Maydell <peter.maydell@linaro.org> wrote:
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
> --
> 1.9.1
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
