Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2924672wrt;
        Sun, 6 Jan 2019 16:33:37 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4rEcoh5jfZUOYalXPH/hP43QjEKIUjg/LcUsizKkuNM2TT/clA0UdsNqI8rxjNKoAE5J9a
X-Received: by 2002:a1c:16c5:: with SMTP id 188mr7465396wmw.69.1546821217517;
        Sun, 06 Jan 2019 16:33:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546821217; cv=none;
        d=google.com; s=arc-20160816;
        b=GNn6D5/AfcozbYI/0x9AypxXK5mMRf8HV6TUVTvuqrXbLLtVLJOr4ecW4K+MCoI0vj
         nFCMxtRrGgM83I2A0NZa4WLSBPhqFeTCXq4smjLD3bc1FwJgZ1hcEowjrJWt4nkl3Z25
         RjA6UTC5CAH/NEMb9Sq+wCjXzm9FaxJd3pRiUGWDCSvkoM+TD08PgkUwwM444zNr67bg
         /S7xlmQNxh171cLTDPje9t10YGjp7DHUtACN8aPizGXOzYDDZLK5T1NFwaaC9Dg4/xpc
         b6XXhR1evnNB419I+deUtJVReOj7tRa37gQ/eSAUz4COb5UelJPvLaoHMsx5VkVSrDCr
         SkAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date;
        bh=dOZTay4XzZSATgT4uxrVYr5WT9tIaIig+Ga6HcPih/o=;
        b=w2JaG0VjHbw3xLyTnDt85tuzFFpzMngzMwPodUzGubaQt+N8mDkvDZ1E3SlIopmlmZ
         HYuDOEGNjlk9Ts89iImaysd2ku/kd5eddr2egOKnS/tjDFz2acq4qI2KCEM9JdxLSQ6V
         VIUKhNYyYkzYoqcdqlqIzoBtIQ/DbrBTSPkDACzCS5Dau5L5xCpemgAdHBJvG40PRqdv
         HgjtjK9QGh6ZYh/F8NAK34TA9EHTZOnerKPWSrhoXCdrl00/jg6Yfz8y7PywX8iW2nJm
         0fIgVZR82tiOkUimqzEs6OVKPas12/17q2iluioHBy78G4soiKxWDomaOnJAxcKbEehd
         1Dpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si35554796wrh.313.2019.01.06.16.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 16:33:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:51547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggIrI-0008CC-I4
	for alex.bennee@linaro.org; Sun, 06 Jan 2019 19:33:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ggIr9-0008Bs-2e
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 19:33:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ggIr7-00060D-DE
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 19:33:26 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:31480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1ggIr4-0005uR-UD; Sun, 06 Jan 2019 19:33:25 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 58D317456CB;
	Mon,  7 Jan 2019 01:33:04 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 25F977456C9; Mon,  7 Jan 2019 01:33:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 2557D74569A;
	Mon,  7 Jan 2019 01:33:04 +0100 (CET)
Date: Mon, 7 Jan 2019 01:33:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Nick Hudson <nicholas.a.hudson@gmail.com>
In-Reply-To: <d19529f5-841e-ea06-fe7d-86ccfd528817@gmail.com>
Message-ID: <alpine.BSF.2.21.9999.1901070108080.28018@zero.eik.bme.hu>
References: <d19529f5-841e-ea06-fe7d-86ccfd528817@gmail.com>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4] Support u-boot noload images
 for arm as used by, NetBSD/evbarm GENERIC kernel.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G39xLqSacAAU

On Sun, 6 Jan 2019, Nick Hudson wrote:
> noload kernels are loaded with the u-boot image header and as a result
> the header size needs adding to the entry point.  Fake up a hdr so the
> kernel image is loaded at the right address and the entry point is
> adjusted appropriately.
>
> The default location for the uboot file is 32MiB above bottom of DRAM.
> This matches the recommendation in Documentation/arm/Booting.
>
> Clarify the load_uimage API to state the passing of a load address when an
> image doesn't specify one, or when loading a ramdisk is expected.
>
> Adjust callers of load_uimage, etc.
> ---
> hw/arm/boot.c          |  8 +++++---
> hw/core/loader.c       | 19 ++++++++++++++++---
> hw/core/uboot_image.h  |  1 +
> hw/microblaze/boot.c   |  2 +-
> hw/nios2/boot.c        |  2 +-
> hw/ppc/e500.c          |  1 +
> hw/ppc/ppc440_bamboo.c |  2 +-
> hw/ppc/sam460ex.c      |  2 +-
> include/hw/loader.h    |  7 ++++++-
> 9 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 94fce12802..c7a67af7a9 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -30,8 +30,9 @@
>  * Documentation/arm/Booting and Documentation/arm64/booting.txt
>  * They have different preferred image load offsets from system RAM base.
>  */
> -#define KERNEL_ARGS_ADDR 0x100
> -#define KERNEL_LOAD_ADDR 0x00010000
> +#define KERNEL_ARGS_ADDR   0x100
> +#define KERNEL_NOLOAD_ADDR 0x02000000
> +#define KERNEL_LOAD_ADDR   0x00010000
> #define KERNEL64_LOAD_ADDR 0x00080000
>
> #define ARM64_TEXT_OFFSET_OFFSET    8
> @@ -1082,7 +1083,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>     }
>     entry = elf_entry;
>     if (kernel_size < 0) {
> -        kernel_size = load_uimage_as(info->kernel_filename, &entry, NULL,
> +        uint64_t loadaddr = info->loader_start + KERNEL_NOLOAD_ADDR;
> +        kernel_size = load_uimage_as(info->kernel_filename, &entry, &loadaddr,
>                                      &is_linux, NULL, NULL, as);
>     }
>     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index fa41842280..c7182dfa64 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -613,13 +613,26 @@ static int load_uboot_image(const char *filename, hwaddr *ep, hwaddr *loadaddr,
>         goto out;
>
>     if (hdr->ih_type != image_type) {
> -        fprintf(stderr, "Wrong image type %d, expected %d\n", hdr->ih_type,
> -                image_type);
> -        goto out;
> +        if (!(image_type == IH_TYPE_KERNEL &&
> +            hdr->ih_type == IH_TYPE_KERNEL_NOLOAD)) {

So this is now effectively

(hdr->ih_type != image_type && !(image_type == IH_TYPE_KERNEL && hdr->ih_type == IH_TYPE_KERNEL_NOLOAD))

Maybe you don't need two if-s just one with this condition?

> +            fprintf(stderr, "Wrong image type %d, expected %d\n", hdr->ih_type,
> +                    image_type);
> +            goto out;
> +        }
>     }
>
>     /* TODO: Implement other image types.  */
>     switch (hdr->ih_type) {
> +    case IH_TYPE_KERNEL_NOLOAD:
> +        if (!loadaddr || *loadaddr == LOAD_UIMAGE_LOADADDR_INVALID) {
> +            fprintf(stderr, "this image format (kernel_noload) cannot be "
> +                    "loaded on this machine type");
> +            goto out;
> +        }
> +
> +        hdr->ih_load = *loadaddr + sizeof(*hdr);
> +        hdr->ih_ep += hdr->ih_load;
> +        /* fall through */
>     case IH_TYPE_KERNEL:
>         address = hdr->ih_load;
>         if (translate_fn) {
> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
> index 34c11a70a6..608022de6e 100644
> --- a/hw/core/uboot_image.h
> +++ b/hw/core/uboot_image.h
> @@ -124,6 +124,7 @@
> #define IH_TYPE_SCRIPT		6	/* Script file			*/
> #define IH_TYPE_FILESYSTEM	7	/* Filesystem Image (any type)	*/
> #define IH_TYPE_FLATDT		8	/* Binary Flat Device Tree Blob	*/
> +#define IH_TYPE_KERNEL_NOLOAD  14	/* OS Kernel Image (noload)	*/

Do we want to make this an enum like in recent U-Boot? (Not suggesting we 
should just asking if you're touching this anyway.)

> /*
>  * Compression Types
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index 35bfeda7aa..489ab839b7 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -156,7 +156,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>
>         /* If it wasn't an ELF image, try an u-boot image.  */
>         if (kernel_size < 0) {
> -            hwaddr uentry, loadaddr;
> +            hwaddr uentry, loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>
>             kernel_size = load_uimage(kernel_filename, &uentry, &loadaddr, 0,
>                                       NULL, NULL);
> diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
> index 4bb5b601d3..ed5cb28e94 100644
> --- a/hw/nios2/boot.c
> +++ b/hw/nios2/boot.c
> @@ -161,7 +161,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
>
>         /* If it wasn't an ELF image, try an u-boot image. */
>         if (kernel_size < 0) {
> -            hwaddr uentry, loadaddr;
> +            hwaddr uentry, loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>
>             kernel_size = load_uimage(kernel_filename, &uentry, &loadaddr, 0,
>                                       NULL, NULL);
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index b20fea0dfc..0581e9e3d4 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -995,6 +995,7 @@ void ppce500_init(MachineState *machine)
>          * Hrm. No ELF image? Try a uImage, maybe someone is giving us an
>          * ePAPR compliant kernel
>          */
> +        loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>         payload_size = load_uimage(filename, &bios_entry, &loadaddr, NULL,
>                                    NULL, NULL);
>         if (payload_size < 0) {
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index b8aa55d526..fc06191588 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -179,7 +179,7 @@ static void bamboo_init(MachineState *machine)
>     CPUPPCState *env;
>     uint64_t elf_entry;
>     uint64_t elf_lowaddr;
> -    hwaddr loadaddr = 0;
> +    hwaddr loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>     target_long initrd_size = 0;
>     DeviceState *dev;
>     int success;
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 4b051c0950..84ea592749 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -402,7 +402,7 @@ static void sam460ex_init(MachineState *machine)
>     CPUPPCState *env;
>     PPC4xxI2CState *i2c[2];
>     hwaddr entry = UBOOT_ENTRY;
> -    hwaddr loadaddr = 0;
> +    hwaddr loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>     target_long initrd_size = 0;
>     DeviceState *dev;
>     SysBusDevice *sbdev;
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 0a0ad808ea..84d6bb44b7 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -175,10 +175,15 @@ void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
> int load_aout(const char *filename, hwaddr addr, int max_sz,
>               int bswap_needed, hwaddr target_page_size);
>
> +#define LOAD_UIMAGE_LOADADDR_INVALID (-1)

hwadrr is uint64_t, an unsigned type so maybe -1 is not the best value for 
invalid address. Doesn't this give you a warning?

> +
> /** load_uimage_as:
>  * @filename: Path of uimage file
>  * @ep: Populated with program entry point. Ignored if NULL.
> - * @loadaddr: Populated with the load address. Ignored if NULL.
> + * @loadaddr: load address if none specified in the image or when loading a ramdisk.
> + *            Populated with the the load address. Ignored if NULL or

You have "the the" typo here ---^^^^^^^

> + *            LOAD_UIMAGE_LOADADDR_INVALID (images which do not specify a load address
> + *            will not be loadable).
>  * @is_linux: Is set to true if the image loaded is Linux. Ignored if NULL.
>  * @translate_fn: optional function to translate load addresses
>  * @translate_opaque: opaque data passed to @translate_fn
>
