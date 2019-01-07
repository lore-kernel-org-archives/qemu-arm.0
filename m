Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3192383wrt;
        Mon, 7 Jan 2019 00:07:51 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6LDTrSSxeP+2QX9cKDAjlo4X4gd69fN4udy8O58ctbsDjIOtul1lN9Ca6zqtYOBFt9HhuV
X-Received: by 2002:a1c:7719:: with SMTP id t25mr8542440wmi.7.1546848471757;
        Mon, 07 Jan 2019 00:07:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546848471; cv=none;
        d=google.com; s=arc-20160816;
        b=oeWQJr9hSv8ToZxwRz+LW9Goe9FfY+ctJOxNjNKuNuvyvBrwx9rKEvyYYocZM51PKI
         DSAn0ecuA9tpgX3Y7HrPpq0xPNbr6Efo3dLAUcgz1LbXG5v8jPxQl30F0YGa0mpm/nga
         nta+UOCCIvJ5Zlww3j8Qu7DYohREkQe7xMscxkS3Aq4J6liLVzKa6IaWxzWFeIvEZIhu
         cOpIqjBL4IL+lOvJHJMnIJ/XP9DqwK8a7RtjmP0/+PfA6PyoWMndYy2xFQjgLfxJXgN7
         JPnoe/639AIlqgtzI8bxqBv8SIlCplFJFxcEUmOFUrU3rRUA1psSO4mz8+LT6HPqRAL6
         Ijrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=099Hzr9Aac0tp0nFXSCq1QG8bf5JTefb2mY42nGtDPk=;
        b=Cx3FV63c7a5AAdPoTg8sZsnFcGT4u7XNnCguURTLvFVDf53B5+cj+WJTFbEKhmuWYm
         NyMO4EkHt2Wa90RudvunbMq3A31/bGGq3Q1zcLeuhiqDpZnqCC/F5dFpU2Wgj+PWgCtW
         sFfm7p1Gs2iJ5bLaIUvdJTZji3K4GPpiqXwjQ1xscdkIseCnYm5O5Hrs64ZZxcco0XtU
         va/w6lC1Gta7YAAc0E008b5YCQZQ1qQuVMznB4mrFzwY+G0UonUAYbRjlPzMgTSOMg7p
         jgX6OXPWPzY9lG3bDlLzcRh3V1keDacF+Ud8KI4KzfloiFm8acxr3kVzGeD9uJndet4T
         76qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="dH/cd80D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4si4691759wmc.85.2019.01.07.00.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 00:07:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="dH/cd80D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:43575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggPws-0008TX-Nl
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 03:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1ggPw8-00083s-Tf
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:07:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1ggPw7-0001Ci-KI
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:07:04 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40019)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <nicholas.a.hudson@gmail.com>)
	id 1ggPw7-0001CI-6G; Mon, 07 Jan 2019 03:07:03 -0500
Received: by mail-wm1-x341.google.com with SMTP id f188so6537793wmf.5;
	Mon, 07 Jan 2019 00:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=099Hzr9Aac0tp0nFXSCq1QG8bf5JTefb2mY42nGtDPk=;
	b=dH/cd80DhX9pA0LKsMUEf6mu+UdS9BTUhWMPkIOC7TuY/OWHLOho87TIMHNqzUneKj
	pvzx1X/aFj/73O3w2ctqeYBci6eteegA4B70baxhLIoJOqnD8Zi1GelMr7C14hlaX0L4
	+H+Rvoipuj4iU2d6JwpQt4JHWFajq8YHcwg1/lfNWCFpvJPLGuhTVROOKWhFFGXVBJlm
	n6JdmsVODe0/LhRxXLAK+Nw7Cl48Tu6Oz5ukvSveEWBgPX1rhWHp+9InrBySrFzw3DSF
	rEJEYvRbCVQpfwHu7Gbp1aWUfsd3np9ax1WALY1Dpzgdz3WTUKP+yV8q92aQI6afwyt4
	wZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=099Hzr9Aac0tp0nFXSCq1QG8bf5JTefb2mY42nGtDPk=;
	b=eULopR7Eoxplr6ebxTlWC+jkbq5Ji6BRDZLm8cO+atx5sV4uTWN+q8dYIqvp7mnzOT
	5BAHTzwQwSpQZw6xZRh5smZifmtc8mbjwH4nkx6qoxqQwjHQBYa1hIZfZMkVJZt4PI/J
	uKnmq41XT7uTq6ykTA5aUOE1RwjIJd9Hud33Ib95GUCAz2jnw+PewMWVMnCRFZT3MP0F
	VwpB5Qxcri5XhxxZOhoQDyoiPYukTWWiB7wwXTu96vty13DItvP/9n0BC4r4nt55lKbt
	ihCeS8W9AStr+E3kM+hf8dZDpL8dE1Vfk+iDhrUDVLYBgJdGkBH+CQXiDH56AVN6tfnY
	bcUw==
X-Gm-Message-State: AJcUukfBrBXoRuv7ShOoGgDnQ68dcTbROyUGjhvl1T1D+aj9g3+phNuU
	Ba1Vw4DhT+42t0vP+U/WPk3E8t5X09o=
X-Received: by 2002:a7b:cb96:: with SMTP id m22mr8209520wmi.39.1546848421584; 
	Mon, 07 Jan 2019 00:07:01 -0800 (PST)
Received: from ?IPv6:2a02:c7d:8625:5a01:7503:9d7c:2958:5e7d?
	([2a02:c7d:8625:5a01:7503:9d7c:2958:5e7d])
	by smtp.gmail.com with ESMTPSA id t5sm5738816wmg.43.2019.01.07.00.07.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 00:07:01 -0800 (PST)
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <d19529f5-841e-ea06-fe7d-86ccfd528817@gmail.com>
	<alpine.BSF.2.21.9999.1901070108080.28018@zero.eik.bme.hu>
From: Nick Hudson <nicholas.a.hudson@gmail.com>
Message-ID: <8dd03185-2d92-328a-dfb1-e0b2ce6ea2e1@gmail.com>
Date: Mon, 7 Jan 2019 08:06:57 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.21.9999.1901070108080.28018@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-TUID: +wjfUltPoy0r

Thanks for the comments.

On 07/01/2019 00:33, BALATON Zoltan wrote:
> On Sun, 6 Jan 2019, Nick Hudson wrote:
>> noload kernels are loaded with the u-boot image header and as a result
>> the header size needs adding to the entry point.  Fake up a hdr so the
>> kernel image is loaded at the right address and the entry point is
>> adjusted appropriately.
>>
>> The default location for the uboot file is 32MiB above bottom of DRAM.
>> This matches the recommendation in Documentation/arm/Booting.
>>
>> Clarify the load_uimage API to state the passing of a load address 
>> when an
>> image doesn't specify one, or when loading a ramdisk is expected.
>>
>> Adjust callers of load_uimage, etc.
>> ---
>> hw/arm/boot.c          |  8 +++++---
>> hw/core/loader.c       | 19 ++++++++++++++++---
>> hw/core/uboot_image.h  |  1 +
>> hw/microblaze/boot.c   |  2 +-
>> hw/nios2/boot.c        |  2 +-
>> hw/ppc/e500.c          |  1 +
>> hw/ppc/ppc440_bamboo.c |  2 +-
>> hw/ppc/sam460ex.c      |  2 +-
>> include/hw/loader.h    |  7 ++++++-
>> 9 files changed, 33 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 94fce12802..c7a67af7a9 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -30,8 +30,9 @@
>>  * Documentation/arm/Booting and Documentation/arm64/booting.txt
>>  * They have different preferred image load offsets from system RAM base.
>>  */
>> -#define KERNEL_ARGS_ADDR 0x100
>> -#define KERNEL_LOAD_ADDR 0x00010000
>> +#define KERNEL_ARGS_ADDR   0x100
>> +#define KERNEL_NOLOAD_ADDR 0x02000000
>> +#define KERNEL_LOAD_ADDR   0x00010000
>> #define KERNEL64_LOAD_ADDR 0x00080000
>>
>> #define ARM64_TEXT_OFFSET_OFFSET    8
>> @@ -1082,7 +1083,8 @@ void arm_load_kernel(ARMCPU *cpu, struct 
>> arm_boot_info *info)
>>     }
>>     entry = elf_entry;
>>     if (kernel_size < 0) {
>> -        kernel_size = load_uimage_as(info->kernel_filename, &entry, 
>> NULL,
>> +        uint64_t loadaddr = info->loader_start + KERNEL_NOLOAD_ADDR;
>> +        kernel_size = load_uimage_as(info->kernel_filename, &entry, 
>> &loadaddr,
>>                                      &is_linux, NULL, NULL, as);
>>     }
>>     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
>> diff --git a/hw/core/loader.c b/hw/core/loader.c
>> index fa41842280..c7182dfa64 100644
>> --- a/hw/core/loader.c
>> +++ b/hw/core/loader.c
>> @@ -613,13 +613,26 @@ static int load_uboot_image(const char 
>> *filename, hwaddr *ep, hwaddr *loadaddr,
>>         goto out;
>>
>>     if (hdr->ih_type != image_type) {
>> -        fprintf(stderr, "Wrong image type %d, expected %d\n", 
>> hdr->ih_type,
>> -                image_type);
>> -        goto out;
>> +        if (!(image_type == IH_TYPE_KERNEL &&
>> +            hdr->ih_type == IH_TYPE_KERNEL_NOLOAD)) {
> 
> So this is now effectively
> 
> (hdr->ih_type != image_type && !(image_type == IH_TYPE_KERNEL && 
> hdr->ih_type == IH_TYPE_KERNEL_NOLOAD))
> 
> Maybe you don't need two if-s just one with this condition?

I didn't see anything in the style guide that stipulated I couldn't keep
the two ifs.  I've left it as is.

> 
>> +            fprintf(stderr, "Wrong image type %d, expected %d\n", 
>> hdr->ih_type,
>> +                    image_type);
>> +            goto out;
>> +        }
>>     }
>>
>>     /* TODO: Implement other image types.  */
>>     switch (hdr->ih_type) {
>> +    case IH_TYPE_KERNEL_NOLOAD:
>> +        if (!loadaddr || *loadaddr == LOAD_UIMAGE_LOADADDR_INVALID) {
>> +            fprintf(stderr, "this image format (kernel_noload) cannot 
>> be "
>> +                    "loaded on this machine type");
>> +            goto out;
>> +        }
>> +
>> +        hdr->ih_load = *loadaddr + sizeof(*hdr);
>> +        hdr->ih_ep += hdr->ih_load;
>> +        /* fall through */
>>     case IH_TYPE_KERNEL:
>>         address = hdr->ih_load;
>>         if (translate_fn) {
>> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
>> index 34c11a70a6..608022de6e 100644
>> --- a/hw/core/uboot_image.h
>> +++ b/hw/core/uboot_image.h
>> @@ -124,6 +124,7 @@
>> #define IH_TYPE_SCRIPT        6    /* Script file            */
>> #define IH_TYPE_FILESYSTEM    7    /* Filesystem Image (any type)    */
>> #define IH_TYPE_FLATDT        8    /* Binary Flat Device Tree Blob    */
>> +#define IH_TYPE_KERNEL_NOLOAD  14    /* OS Kernel Image (noload)    */
> 
> Do we want to make this an enum like in recent U-Boot? (Not suggesting 
> we should just asking if you're touching this anyway.)

I guess this is for someone else to answer. I wanted to provide a 
minimal diff.


> 
>> /*
>>  * Compression Types
>> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
>> index 35bfeda7aa..489ab839b7 100644
>> --- a/hw/microblaze/boot.c
>> +++ b/hw/microblaze/boot.c
>> @@ -156,7 +156,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, 
>> hwaddr ddr_base,
>>
>>         /* If it wasn't an ELF image, try an u-boot image.  */
>>         if (kernel_size < 0) {
>> -            hwaddr uentry, loadaddr;
>> +            hwaddr uentry, loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>>
>>             kernel_size = load_uimage(kernel_filename, &uentry, 
>> &loadaddr, 0,
>>                                       NULL, NULL);
>> diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
>> index 4bb5b601d3..ed5cb28e94 100644
>> --- a/hw/nios2/boot.c
>> +++ b/hw/nios2/boot.c
>> @@ -161,7 +161,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr 
>> ddr_base,
>>
>>         /* If it wasn't an ELF image, try an u-boot image. */
>>         if (kernel_size < 0) {
>> -            hwaddr uentry, loadaddr;
>> +            hwaddr uentry, loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>>
>>             kernel_size = load_uimage(kernel_filename, &uentry, 
>> &loadaddr, 0,
>>                                       NULL, NULL);
>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>> index b20fea0dfc..0581e9e3d4 100644
>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -995,6 +995,7 @@ void ppce500_init(MachineState *machine)
>>          * Hrm. No ELF image? Try a uImage, maybe someone is giving us an
>>          * ePAPR compliant kernel
>>          */
>> +        loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>>         payload_size = load_uimage(filename, &bios_entry, &loadaddr, 
>> NULL,
>>                                    NULL, NULL);
>>         if (payload_size < 0) {
>> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
>> index b8aa55d526..fc06191588 100644
>> --- a/hw/ppc/ppc440_bamboo.c
>> +++ b/hw/ppc/ppc440_bamboo.c
>> @@ -179,7 +179,7 @@ static void bamboo_init(MachineState *machine)
>>     CPUPPCState *env;
>>     uint64_t elf_entry;
>>     uint64_t elf_lowaddr;
>> -    hwaddr loadaddr = 0;
>> +    hwaddr loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>>     target_long initrd_size = 0;
>>     DeviceState *dev;
>>     int success;
>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>> index 4b051c0950..84ea592749 100644
>> --- a/hw/ppc/sam460ex.c
>> +++ b/hw/ppc/sam460ex.c
>> @@ -402,7 +402,7 @@ static void sam460ex_init(MachineState *machine)
>>     CPUPPCState *env;
>>     PPC4xxI2CState *i2c[2];
>>     hwaddr entry = UBOOT_ENTRY;
>> -    hwaddr loadaddr = 0;
>> +    hwaddr loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>>     target_long initrd_size = 0;
>>     DeviceState *dev;
>>     SysBusDevice *sbdev;
>> diff --git a/include/hw/loader.h b/include/hw/loader.h
>> index 0a0ad808ea..84d6bb44b7 100644
>> --- a/include/hw/loader.h
>> +++ b/include/hw/loader.h
>> @@ -175,10 +175,15 @@ void load_elf_hdr(const char *filename, void 
>> *hdr, bool *is64, Error **errp);
>> int load_aout(const char *filename, hwaddr addr, int max_sz,
>>               int bswap_needed, hwaddr target_page_size);
>>
>> +#define LOAD_UIMAGE_LOADADDR_INVALID (-1)
> 
> hwadrr is uint64_t, an unsigned type so maybe -1 is not the best value 
> for invalid address. Doesn't this give you a warning?

I don't see a problem here and no warning is issued in my build.

> 
>> +
>> /** load_uimage_as:
>>  * @filename: Path of uimage file
>>  * @ep: Populated with program entry point. Ignored if NULL.
>> - * @loadaddr: Populated with the load address. Ignored if NULL.
>> + * @loadaddr: load address if none specified in the image or when 
>> loading a ramdisk.
>> + *            Populated with the the load address. Ignored if NULL or
> 
> You have "the the" typo here ---^^^^^^^

fixed in v5.

> 
>> + *            LOAD_UIMAGE_LOADADDR_INVALID (images which do not 
>> specify a load address
>> + *            will not be loadable).
>>  * @is_linux: Is set to true if the image loaded is Linux. Ignored if 
>> NULL.
>>  * @translate_fn: optional function to translate load addresses
>>  * @translate_opaque: opaque data passed to @translate_fn
>>


Thanks,
Nick
