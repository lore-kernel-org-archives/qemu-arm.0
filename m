Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp804328wrt;
        Thu, 3 Jan 2019 08:20:57 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6o217FT6QZcaapF08jn8BvqQZ/Eqt0z0HUyGe0LWQO062jtUaqyuKDTYjMDzXvAblslxEU
X-Received: by 2002:ac8:44d4:: with SMTP id b20mr44119164qto.340.1546532457581;
        Thu, 03 Jan 2019 08:20:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546532457; cv=none;
        d=google.com; s=arc-20160816;
        b=sKW/L/9q+98tJslVkMvtsKhkrOqfQlqefx/xm3c6fku9mkfrR4ofvtztVf6DACZnsD
         gvqWhVxx/wb2CmBiEBLQwxSEmS+5oc0BSAzFJ71sdKZFpaiYj+YctMUbBLllzzqmxe0/
         Jz3vFbEl1OAwoDeAf8iZHkzudQpCe0MIO/E93o2qgKENaXzyRC/wT4eittr2OmD13KhW
         x3MbS1+IgYNsOssXcgB47FRX8NfjkusssetlNvQCvg1D2mo2pPl3SLXJh0VVQEwBPU3r
         57RwzcsHNZ+MLpxFW7JrfgxjVAspridDXSwtRMp6Qd9m69J6kp+ZqI5lRD3sKGU+VC+E
         fY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=naynhiJ5AIkbQO9StU7VCr0gNeDv31jbiOvdK1fRWWY=;
        b=n+QErNnmEDrA9dbzlGUlXRsDOvNqCt5SBuxxdj5i5DsCB98W5BitppCnp9CfATTRTb
         M00qXBVyajBBFKyTWe1spYRNWETvPFJHkLCNvZvGT6vDVAKPPm/YjlUHAOU1Ho+N4Z3x
         BEFIU/sF14lQrSnAhZsBl9TfYTKquyVRkgAAVvHFTRWt00t76vQdIl5N3hn+DTTYX6Oq
         XuaBe/Cf3Ro/E5oZhLjJXlE0E/ueZKypK+KoiL+UJ2e5ZTMyX1H74MmfOTWbA9AM+LN8
         L1oDyVYtjCR+O55izHsBCM0v4U+6H6adwneZRyZ1IQABCTWF+6lStp2iZe3GdyOJq2pv
         YqZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fAFLvAmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k6si122587qtp.367.2019.01.03.08.20.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 08:20:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fAFLvAmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gf5jt-0004ZW-0w
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 11:20:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gf5jf-0004ZK-EE
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 11:20:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gf5je-0003WV-1T
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 11:20:43 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42746)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gf5jd-0003Vt-Rq
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 11:20:41 -0500
Received: by mail-ot1-x341.google.com with SMTP id v23so29774376otk.9
	for <qemu-arm@nongnu.org>; Thu, 03 Jan 2019 08:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=naynhiJ5AIkbQO9StU7VCr0gNeDv31jbiOvdK1fRWWY=;
	b=fAFLvAmu9JsSIWI4gBMh+otldE1MED5ChEmJCKGySllSsADdC52+nzyVYSkCsnt+99
	PC9OCR6mhqfyozPK8ERBKJ7QpC1Ln0uapg5UrnKOfD0S+xEDOM4AORTEV6Vt+9a7NtZ6
	zg05tr2L6MmepRVAIC449qZuKw3pNgU7jqOgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=naynhiJ5AIkbQO9StU7VCr0gNeDv31jbiOvdK1fRWWY=;
	b=thrMfSDXUVHX5HW+2t3JBYS/TLffabRF8DExGJhFQr4EL1FbpZkWLneUtNzgg2pP8h
	Pdww16WRLGWdPdaUeb5IgRhystBCKS7zSP4yq6q3V4z2cpRbjmfytm58lr1hDP6Vf0BV
	zBc0SybDw5ufSxiE0OEsyexvesx/3WrSpq82/qvZi3IZZvpCSutLrSodX4tWQu41QdyQ
	Bq9X0KW+T7jKik74bWDiyw3wp5WUm4YqRhr7B0gIy84GelYqBKu0njSZRJkCHfAXjv1R
	zhjUqv0qk+V/JJCAa2Uw56+BgC5mKOp/Z/GxVCiqE12CDE7lKb0Hwa2dmOREUe9qzAby
	XFkw==
X-Gm-Message-State: AJcUukf/2ycBVvB6xxBOmC8IfJxaPQrhyai4ZfbzQMCDsn8OMhLeSF1T
	1FUwQUIGhgN9qFTM/3Wbti7MYxNjLsOesuxFdTMHOQ==
X-Received: by 2002:a9d:3786:: with SMTP id x6mr34040903otb.238.1546532441014; 
	Thu, 03 Jan 2019 08:20:41 -0800 (PST)
MIME-Version: 1.0
References: <975b9131-9937-cfea-3b5d-ef36d0c2b761@gmail.com>
In-Reply-To: <975b9131-9937-cfea-3b5d-ef36d0c2b761@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jan 2019 16:20:29 +0000
Message-ID: <CAFEAcA-2tWtEqd-Z0xqNMeocf4rns+FihrAPudiQGz+85HFjJg@mail.gmail.com>
To: Nick Hudson <nicholas.a.hudson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v3] Support u-boot noload images for arm as
 used by, NetBSD/evbarm GENERIC kernel.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3uH8BDfBgEau

On Tue, 11 Dec 2018 at 12:27, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
>
>
> noload kernels are loaded with the u-boot image header and as a result
> the header size needs adding to the entry point.  Fake up a hdr so the
> kernel image is loaded at the right address and the entry point is
> adjusted appropriately.
>
> The bootloader fits in the space that the uboot header would have occupied.
>
> Clarify the load_uimage API to state the passing of a load address when an
> image doesn't specify one, or when loading a ramdisk is expected.
>
> Adjust callers of load_uimage, etc.
>
> Signed-off-by: Nick Hudson<skrll@netbsd.org>
>
> ---
>   hw/arm/boot.c          |  8 +++++---
>   hw/core/loader.c       | 19 ++++++++++++++++---
>   hw/core/uboot_image.h  |  1 +
>   hw/microblaze/boot.c   |  2 +-
>   hw/nios2/boot.c        |  2 +-
>   hw/ppc/e500.c          |  1 +
>   hw/ppc/ppc440_bamboo.c |  2 +-
>   hw/ppc/sam460ex.c      |  2 +-
>   include/hw/loader.h    |  7 ++++++-
>   9 files changed, 33 insertions(+), 11 deletions(-)

Hi; I tried applying your patch, but unfortunately it looks like
your email client has mangled it to the point that it can't
be applied:
 * it is format=flowed, so long lines have been wrapped
 * some whitespace has been turned into UTF-8 non-breaking space characters
I tried to manually fix these up, but didn't succeed.

It looks like you're using Thunderbird -- the kernel docs
have some config setting suggestions that might help:
https://www.kernel.org/doc/html/v4.11/process/email-clients.html#thunderbird-gui
or you could try switching to 'git send-email'.

I've reviewed the patch for content and it's mostly good:
I just have a couple more questions below.

> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 586baa9b64..450267566a 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -30,8 +30,9 @@
>    * Documentation/arm/Booting and Documentation/arm64/booting.txt
>    * They have different preferred image load offsets from system RAM base.
>    */
> -#define KERNEL_ARGS_ADDR 0x100
> -#define KERNEL_LOAD_ADDR 0x00010000
> +#define KERNEL_ARGS_ADDR   0x100
> +#define KERNEL_NOLOAD_ADDR 0x00000000

If I'm reading the code right, this requests that noload images
are loaded at offset zero into RAM, yes ? That's not a great
choice, because we put our little mini bootloader at offset 0,
and so the two will clash. Can we put them somewhere else
(above BOOTLOADER_MAX_SIZE, probably at a 64K page boundary) ?

If they must go at offset 0 then we'd need to refuse to load
noload images if they set is_linux to true. (We only load the
mini bootloader if is_linux is true, so that's the only case where
there's a clash.)

> +#define KERNEL_LOAD_ADDR   0x00010000
>   #define KERNEL64_LOAD_ADDR 0x00080000
>
>   #define ARM64_TEXT_OFFSET_OFFSET    8
> @@ -1078,7 +1079,8 @@ void arm_load_kernel(ARMCPU *cpu, struct
> arm_boot_info *info)
>       }
>       entry = elf_entry;
>       if (kernel_size < 0) {
> -        kernel_size = load_uimage_as(info->kernel_filename, &entry, NULL,
> +        uint64_t loadaddr = info->loader_start + KERNEL_NOLOAD_ADDR;
> +        kernel_size = load_uimage_as(info->kernel_filename, &entry,
> &loadaddr,
>                                        &is_linux, NULL, NULL, as);
>       }
>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index aa0b3fc867..7362197162 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -638,13 +638,26 @@ static int load_uboot_image(const char *filename,
> hwaddr *ep, hwaddr *loadaddr,
>           goto out;
>
>       if (hdr->ih_type != image_type) {
> -        fprintf(stderr, "Wrong image type %d, expected %d\n", hdr->ih_type,
> -                image_type);
> -        goto out;
> +        if (image_type != IH_TYPE_KERNEL &&
> +            hdr->ih_type != IH_TYPE_KERNEL_NOLOAD) {

I think you have this condition wrong. Suppose we are
trying to load image_type == IH_TYPE_KERNEL and we are
passed a hdr->ih_type == IH_TYPE_RAMDISK. With this change
we'll stop rejecting that as an error.
I think you want:
    if (!(image_type == IH_TYPE_KERNEL &&
          hdr->ih_type == IH_TYPE_KERNEL_NOLOAD)) {

because the only kind of mismatch we want to accept is
"we're looking for KERNEL and we got KERNEL_NOLOAD".

> +            fprintf(stderr, "Wrong image type %d, expected %d\n",
> hdr->ih_type,
> +                    image_type);
> +            goto out;
> +        }
>       }

> index f5720f979e..70428b1865 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -180,7 +180,7 @@ static void bamboo_init(MachineState *machine)
>       CPUPPCState *env;
>       uint64_t elf_entry;
>       uint64_t elf_lowaddr;
> -    hwaddr loadaddr = 0;
> +    hwaddr loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>       target_long initrd_size = 0;
>       DeviceState *dev;
>       int success;
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 5aac58f36e..2d6d5c4402 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -402,7 +402,7 @@ static void sam460ex_init(MachineState *machine)
>       CPUPPCState *env;
>       PPC4xxI2CState *i2c[2];
>       hwaddr entry = UBOOT_ENTRY;
> -    hwaddr loadaddr = 0;
> +    hwaddr loadaddr = LOAD_UIMAGE_LOADADDR_INVALID;
>       target_long initrd_size = 0;
>       DeviceState *dev;
>       SysBusDevice *sbdev;

In both of these cases we could in fact remove the 'loadaddr'
variable entirely (and pass NULL to the load_uimage() 3rd
argument) because the code doesn't ever read the loadaddr value
that is set. But this is the simple minimal change so it's OK:
we can do the cleanup later (or not at all).

thanks
-- PMM
