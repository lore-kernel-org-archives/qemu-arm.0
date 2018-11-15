Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6780737wrw;
        Thu, 15 Nov 2018 01:22:23 -0800 (PST)
X-Google-Smtp-Source: AJdET5c0nL13a2R8ocW/zr16HiddPv+tVM0NqFhSRPfB/TrmyKEgc28GMRwMqGLnmCj0UIU80ndv
X-Received: by 2002:a0c:8c8a:: with SMTP id p10mr5429682qvb.218.1542273743099;
        Thu, 15 Nov 2018 01:22:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542273743; cv=none;
        d=google.com; s=arc-20160816;
        b=CYl0yeObnEp1WUk8QNiPYutqm+2hexSwaGneBEvnjectojrCNGBq1MEoFaBIdKijyh
         nwSWX1+wvvpcKS9oTmsg79RXkN0d6zj3YDIWP/bYnrlqe9YoRbVOs+PtMQNXjdGhVgQC
         KWWqXNN0RAgsCkU8UsRIa8z+V3ChzrrsVx7kii3R6EDZZm6sfxPI9Er4RZPck84u1dmP
         g7PZ7JY6G3QIP855CnMTCuvU0pHSreeVOYmxx9G8yw3LE/3ELP1mQ3I6A+nUzbXaTXrf
         Yf+YAlH3ZOt967mf2vni4MYrrJGkzMWoZBIo3suQLluzzBmrlHSIlR7XRs0HEYVNopqB
         JE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:dkim-signature;
        bh=J4jOJmLmgw9jv+3jHWUXJaIOfRBhuYdyJ3k0ZIblZcQ=;
        b=mlb5XNgIUA5lgdlrqYL7G3MEzDu1+OE0hKuCaNN1+/kl44S0IGzAEau21AMPo/Np+q
         dV3pf17kOXrCnau9q8jnVTMF4ZKTU8BFcKJwj7lmCmuEhs2JTiKSKbqUCrGvCJGk1gln
         cdm8T1XX/T7x0fP/CSPbDeq/dgzVG3hihg7CyuL4XtPKE5kD2d53T45DiTKf/usNtIoD
         W/rYE0zcTUOvYUBxO4GVFsL6pblOXewNUvk6QLzHjfGhqSENy0UeWETG2zsWX/0WPWus
         V0pIkHyAs3ZpnDTrGiNZd8rfNHUc/ZYZAvvRGYYUCGq/1Xk4pIrxJpJO4NqbayiBkdVa
         Nm5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lo6ap7b0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9si2633886qvr.101.2018.11.15.01.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:22:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lo6ap7b0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNDqw-0002LG-I4
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:22:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gNDqi-0002LA-8i
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:22:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gNDqh-0001PF-9G
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:22:08 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:50983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <nicholas.a.hudson@gmail.com>)
	id 1gNDqh-0001Oi-1a; Thu, 15 Nov 2018 04:22:07 -0500
Received: by mail-wm1-x344.google.com with SMTP id 124-v6so18183690wmw.0;
	Thu, 15 Nov 2018 01:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=J4jOJmLmgw9jv+3jHWUXJaIOfRBhuYdyJ3k0ZIblZcQ=;
	b=Lo6ap7b0r4UujjdrY3lWjzBKA0wZFdqyKQhsqAurR8xPNoJK8cQZ1qGy2mMhyOQ1wL
	dTrUVisSwFwFGNit1zRWFnxOBYFHb/I9TviTLpsRGs8WaYKkvjDJwOk/M3Uw7yE7Tzxk
	2pfRSdPFTxKYnKKYIZv6C66+1hHCcb7t8NbvorJG/aXkm5yyk355qrKx7HtlTHd6oKmv
	YWtnhLnz92pgJJcFTD2yRQUWBYxKLZu3PAA/U5fu+/vICeMOZ/Xp0jB95+gw0hVFhx0i
	UOCncAvPbs9VQ25hSrKhWYh8GybRUrj4deJL9sSokk16jp1bEVcsca0JjHGEI5dQdJ1F
	92Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=J4jOJmLmgw9jv+3jHWUXJaIOfRBhuYdyJ3k0ZIblZcQ=;
	b=mzPW7iIBpcduAykBZNUg8Ch1nuGnn5JCMPwwJsWR50mSE5zPkh0U86wVBYfoR6ArU8
	1GoBGmlOnG5cwEGhvWTlDIcKajxegcFw7QUtSMD9aKN6Qlq/bfndV2VXhJUTr3USHIW4
	0VFNUR4Eb936ijp3um0EgMbfYIMYo8jwD8kvHZ55mG0fZY0z60UcEXDZmHb+vaJYgNj3
	QMv6oYDL3GnGz11zZYrCeMDLh293UBG3GlePnVxAp7xCL7DulY7ZF1paljcHId3Iqi5Z
	iWYyqCW48WQYR/gR2duBffohD3LoMpwCOa6iQI/aB63UjNOw+NLkoTeP5irAxuSTzpLs
	fmnQ==
X-Gm-Message-State: AGRZ1gJPlaOWGY53A+4v0Nj0dEc+KkwB2whpK69oV8+hn7n84NySulxn
	4CqwIGYxlS891pmjcDGmpI8=
X-Received: by 2002:a7b:c315:: with SMTP id k21mr4547332wmj.145.1542273725432; 
	Thu, 15 Nov 2018 01:22:05 -0800 (PST)
Received: from ?IPv6:2a02:c7d:860f:7601:7503:9d7c:2958:5e7d?
	([2a02:c7d:860f:7601:7503:9d7c:2958:5e7d])
	by smtp.gmail.com with ESMTPSA id
	q7-v6sm18201631wmg.27.2018.11.15.01.22.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 01:22:04 -0800 (PST)
From: Nick Hudson <nicholas.a.hudson@gmail.com>
X-Google-Original-From: Nick Hudson <skrll@netbsd.org>
To: qemu-devel@nongnu.org
References: <d9876015-2126-79fe-415f-ca7427ab3059@gmail.com>
Message-ID: <293e1825-5f9d-1e40-85d7-cca1fb16ba94@gmail.com>
Date: Thu, 15 Nov 2018 09:22:01 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <d9876015-2126-79fe-415f-ca7427ab3059@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Support u-boot noload images
 for arm as used by NetBSD/evbarm GENERIC kernel.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: soeJeQzDLEAA

ping

On 07/11/2018 13:19, Nick Hudson wrote:
> noload kernels are loaded with the u-boot image header and as a result
> the header size needs adding to the entry point.  Fake up a hdr so the
> kernel image is loaded at the right address and the entry point is
> adjusted appropriately
>
> Signed-off-by: Nick Hudson <skrll@netbsd.org>
> ---
>  hw/arm/boot.c         |  8 +++++---
>  hw/core/loader.c      | 12 +++++++++---
>  hw/core/uboot_image.h |  1 +
>  3 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 586baa9b64..450267566a 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -30,8 +30,9 @@
>   * Documentation/arm/Booting and Documentation/arm64/booting.txt
>   * They have different preferred image load offsets from system RAM 
> base.
>   */
> -#define KERNEL_ARGS_ADDR 0x100
> -#define KERNEL_LOAD_ADDR 0x00010000
> +#define KERNEL_ARGS_ADDR   0x100
> +#define KERNEL_NOLOAD_ADDR 0x00000000
> +#define KERNEL_LOAD_ADDR   0x00010000
>  #define KERNEL64_LOAD_ADDR 0x00080000
>
>  #define ARM64_TEXT_OFFSET_OFFSET    8
> @@ -1078,7 +1079,8 @@ void arm_load_kernel(ARMCPU *cpu, struct 
> arm_boot_info *info)
>      }
>      entry = elf_entry;
>      if (kernel_size < 0) {
> -        kernel_size = load_uimage_as(info->kernel_filename, &entry, 
> NULL,
> +        uint64_t loadaddr = info->loader_start + KERNEL_NOLOAD_ADDR;
> +        kernel_size = load_uimage_as(info->kernel_filename, &entry, 
> &loadaddr,
>                                       &is_linux, NULL, NULL, as);
>      }
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 
> 0) {
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index aa0b3fc867..952562c2da 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -638,13 +638,19 @@ static int load_uboot_image(const char 
> *filename, hwaddr *ep, hwaddr *loadaddr,
>          goto out;
>
>      if (hdr->ih_type != image_type) {
> -        fprintf(stderr, "Wrong image type %d, expected %d\n", 
> hdr->ih_type,
> -                image_type);
> -        goto out;
> +        if (image_type != IH_TYPE_KERNEL && hdr->ih_type != 
> IH_TYPE_KERNEL_NOLOAD) {
> +            fprintf(stderr, "Wrong image type %d, expected %d\n", 
> hdr->ih_type,
> +                    image_type);
> +            goto out;
> +        }
>      }
>
>      /* TODO: Implement other image types.  */
>      switch (hdr->ih_type) {
> +    case IH_TYPE_KERNEL_NOLOAD:
> +        hdr->ih_load = *loadaddr + sizeof(*hdr);
> +        hdr->ih_ep += hdr->ih_load;
> +
>      case IH_TYPE_KERNEL:
>          address = hdr->ih_load;
>          if (translate_fn) {
> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
> index 34c11a70a6..608022de6e 100644
> --- a/hw/core/uboot_image.h
> +++ b/hw/core/uboot_image.h
> @@ -124,6 +124,7 @@
>  #define IH_TYPE_SCRIPT        6    /* Script file            */
>  #define IH_TYPE_FILESYSTEM    7    /* Filesystem Image (any type)    */
>  #define IH_TYPE_FLATDT        8    /* Binary Flat Device Tree Blob    */
> +#define IH_TYPE_KERNEL_NOLOAD  14    /* OS Kernel Image (noload)    */
>
>  /*
>   * Compression Types
