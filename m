Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp460192wrw;
        Fri, 16 Nov 2018 06:35:18 -0800 (PST)
X-Google-Smtp-Source: AJdET5dU6oq3x5H+hTPcyOaScA0RPT3xUZyekAmK3cFx+ZY3nIXdH5ugIfqdHFcDygqOYZNEKmWa
X-Received: by 2002:ac8:21aa:: with SMTP id 39mr10582774qty.122.1542378918582;
        Fri, 16 Nov 2018 06:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542378918; cv=none;
        d=google.com; s=arc-20160816;
        b=CNW5/5QM04cLZD+kMJdm6ZejuAJXixQn5tuw7kyqzFxlI/TZl+/RE4OvCclXB35+dz
         jy4cKF9doF9dU68qXThkGTb25swrWuiXNl5FJSLdYLaA+Wp3BFrMMcMXamR37VHPndyq
         pHApNu+7i1TjexQ8w5M1Pv9GhKsc04YI6wQv26ajb4vvNiKRUdLDynMGhpTS8AyexMGJ
         81qCHekJ3rBvDjs+djX30UpbZyb4Vdz/97DbjjJf4MaNuFHWxEQ/nQ/bbkYb7xjBtJMB
         hA+aIxfSg/V0Gg1fgI8VnN0y9r75TZseCD559dwk4R4DJFC03uKppMfd2fkC6XCc1FK1
         rVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=VN9D3b+Psglc1vZnaUCl3YBZuaASmL73buHBmghsYTs=;
        b=y4/80r5Q9gK4Sj8EcvT4eEc+ng2txtIYb+k4Vfhc9ZK8vCovbsOHUTFBepRkFpGw+v
         RZv2nABoXh+3QheTDMz9DmJAJjujQoHylfniHSbNDv89ABAcOyYAdqEiXPqy+OFbAmqz
         iuCCNa6wU/etfugW4WMOcKKhhu/0KF7PR6GXbUj7ioqs5eh1bwoNwXgz2bba5/7O9ZoW
         FJled18aREUaUzztXe01qtce5dcdYc9O8OOpegdZqwaVfYLwdDS3qQvFEuV5zh0isCZj
         fHW8I/DiQ6V30oIYcd9lDq2GhJHuEhOcy58PwlVsc419dYLehz59HuKKBaz+zysuHIFP
         9YtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="SYmX/htl";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19si1152203qtm.138.2018.11.16.06.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 06:35:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="SYmX/htl";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNfDK-00087o-0y
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 09:35:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfCu-00087d-TP
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 09:34:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfCt-0002WK-PF
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 09:34:52 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNfCt-0002Sp-4M
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 09:34:51 -0500
Received: by mail-ot1-x342.google.com with SMTP id s5so21470402oth.7
	for <qemu-devel@nongnu.org>; Fri, 16 Nov 2018 06:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VN9D3b+Psglc1vZnaUCl3YBZuaASmL73buHBmghsYTs=;
	b=SYmX/htlZ5meO3pEUyaftwuOh0Cqk5j5Q7Cwe87JJK/FoxnJQUsQR3V68+HoWwsbG8
	TNTxLMB6srxTNGeg8IEcfj6OGv2Rz59EXYbrUHRrn7rN3B2Cj5xR8MlT3rswOy6irD56
	58kQKYTY2dNoVr6sxhYOETfQ577qi4XEDBpWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VN9D3b+Psglc1vZnaUCl3YBZuaASmL73buHBmghsYTs=;
	b=iuqFD4NVhtmSZX/HvnjzIE69q1EiKJMsYMmzB7XMgug4rdFSxXZwLtPZV51BVV7Iaw
	KFqucMnl/fDO8c+GWbL007K4GMPkTUMERePTcqkQ5y5XI/huFsPnti3dGOUb0/NkF4Ad
	HbMfji6EwNwZsbSgSuEb9dMxgsVGx0a10SQ5RHggCe+YSWf7VjhypN3+ga9Fi72BJeOi
	X8Rqeiy9PAzqymlC/EzpSwX2VJCGPlNJKN57XVIo79zfOzK15EC9+svk0MZ/ep60Lv/N
	DKXNn/XHr4moTfgtMDohCH8rT57SCWhiauqfs5J2zLbgyL5hl8Fuy/HHS1RvQo+LrYY4
	qStA==
X-Gm-Message-State: AA+aEWaFe5fgEnt/nvrEgpoT91jnAtCOxDiPNHYi97IYKB4PqAKbOKE4
	7xS99N/i1u6dxbWoKJ24Wb1hd05ceeWBFatUJQXbNg==
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr811047otq.316.1542378885278; 
	Fri, 16 Nov 2018 06:34:45 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 16 Nov 2018 06:34:24
	-0800 (PST)
In-Reply-To: <d9876015-2126-79fe-415f-ca7427ab3059@gmail.com>
References: <d9876015-2126-79fe-415f-ca7427ab3059@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Nov 2018 14:34:24 +0000
Message-ID: <CAFEAcA84aoWNdu1T90iR0uw7emfF1SRF09FjL+gu12yrdAr2yA@mail.gmail.com>
To: Nick Hudson <nicholas.a.hudson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH] Support u-boot noload images for arm as
 used by NetBSD/evbarm GENERIC kernel.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fA0Arf1HUVDY

On 7 November 2018 at 13:19, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
> noload kernels are loaded with the u-boot image header and as a result
> the header size needs adding to the entry point.  Fake up a hdr so the
> kernel image is loaded at the right address and the entry point is
> adjusted appropriately
>
> Signed-off-by: Nick Hudson <skrll@netbsd.org>

Hi; thanks for this patch.

> ---
>  hw/arm/boot.c         |  8 +++++---
>  hw/core/loader.c      | 12 +++++++++---
>  hw/core/uboot_image.h |  1 +
>  3 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 586baa9b64..450267566a 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -30,8 +30,9 @@
>   * Documentation/arm/Booting and Documentation/arm64/booting.txt
>   * They have different preferred image load offsets from system RAM base.
>   */
> -#define KERNEL_ARGS_ADDR 0x100
> -#define KERNEL_LOAD_ADDR 0x00010000
> +#define KERNEL_ARGS_ADDR   0x100
> +#define KERNEL_NOLOAD_ADDR 0x00000000
> +#define KERNEL_LOAD_ADDR   0x00010000
>  #define KERNEL64_LOAD_ADDR 0x00080000
>
>  #define ARM64_TEXT_OFFSET_OFFSET    8
> @@ -1078,7 +1079,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info
> *info)
>      }
>      entry = elf_entry;
>      if (kernel_size < 0) {
> -        kernel_size = load_uimage_as(info->kernel_filename, &entry, NULL,
> +        uint64_t loadaddr = info->loader_start + KERNEL_NOLOAD_ADDR;
> +        kernel_size = load_uimage_as(info->kernel_filename, &entry,
> &loadaddr,
>                                       &is_linux, NULL, NULL, as);

I don't really understand this change. The API for load_uimage_as()
says that the loadaddr argument is an output, not an input, and that
it is ignored if it is NULL. If we're changing the API here then
we need to (a) document that change and (b) check all the callers
can handle it. It would be better if we can avoid having to do that.

>      }
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index aa0b3fc867..952562c2da 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -638,13 +638,19 @@ static int load_uboot_image(const char *filename,
> hwaddr *ep, hwaddr *loadaddr,
>          goto out;
>
>      if (hdr->ih_type != image_type) {
> -        fprintf(stderr, "Wrong image type %d, expected %d\n", hdr->ih_type,
> -                image_type);
> -        goto out;
> +        if (image_type != IH_TYPE_KERNEL && hdr->ih_type !=
> IH_TYPE_KERNEL_NOLOAD) {
> +            fprintf(stderr, "Wrong image type %d, expected %d\n",
> hdr->ih_type,
> +                    image_type);
> +            goto out;
> +        }
>      }
>
>      /* TODO: Implement other image types.  */
>      switch (hdr->ih_type) {
> +    case IH_TYPE_KERNEL_NOLOAD:
> +        hdr->ih_load = *loadaddr + sizeof(*hdr);

This will segfault if the user passed in NULL for loadaddr,
as they are allowed to do by the API.

> +        hdr->ih_ep += hdr->ih_load;
> +

Cases which fall through need a specific
     /* fall through */

comment. This tells human readers and static analysis tools that
it was intentional.

>      case IH_TYPE_KERNEL:
>          address = hdr->ih_load;
>          if (translate_fn) {
> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
> index 34c11a70a6..608022de6e 100644
> --- a/hw/core/uboot_image.h
> +++ b/hw/core/uboot_image.h
> @@ -124,6 +124,7 @@
>  #define IH_TYPE_SCRIPT        6    /* Script file            */
>  #define IH_TYPE_FILESYSTEM    7    /* Filesystem Image (any type)    */
>  #define IH_TYPE_FLATDT        8    /* Binary Flat Device Tree Blob    */
> +#define IH_TYPE_KERNEL_NOLOAD  14    /* OS Kernel Image (noload)    */

thanks
-- PMM
