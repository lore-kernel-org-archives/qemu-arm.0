Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1096661wrt;
        Tue, 27 Nov 2018 02:43:52 -0800 (PST)
X-Google-Smtp-Source: AJdET5ctcorL+G/8SSfHDZz6YjtnPCcAbsEf7EnGRDfyOxJ/KC9E2Ecq3pIpmTClfkqeoSm19HBH
X-Received: by 2002:a81:5dc2:: with SMTP id r185-v6mr32302497ywb.199.1543315432866;
        Tue, 27 Nov 2018 02:43:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543315432; cv=none;
        d=google.com; s=arc-20160816;
        b=D5vcyipU7Y5NPKTGmIPdGPp0kiLCedZjESCzTe6h3UTWWd6LDOmCMb2Xeu0u/ehu1r
         9DGT/dDL0MbqjukNe8DzLpas++axQ2NJ7va4gg3sHtl5uopU94cC6wjNgSSmM+x7vmyN
         DceHXsbHJnZsyLeYnTvGnl8BHm+1BdmpCwaUxTp+cPe85oRnra1PzGAcxntI4VYuccNs
         WcrMg7LYBf4j4YxcH68Km8dy6mQhkS1qmyddOtGQ2gz3Y7avr8nh6Bu4PL6kBkb44CRB
         fBx/erQdI63aNOs3dbt7JQIZdFeIoWLldaQ65yyXQgQytEsoRBVcCd68tJdW6FN3T9IV
         727Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IVgr0W6r7Sp9dyYyIM+2B4xvWU/IrpZuoBvFSubhbEk=;
        b=u1PmPpYav38Er+XlqYQA6uTgdgwxg87zNcGtYpmU6q4U/Qih6Pmv6ca7HElVYY1KL8
         wvZvyaC3o5Sh2pje/UrQiyDMOABrwDyU+NgdpR/xL3bU7BpQ8jxMwmcSVkS9bTuFrZ8l
         0o0QwCqeVYoCKKbzeuAZQR+NDQq6wiysQQu8+gRHtEFWbliqilFtuTj66Nj1YYfqXXsG
         h6MQqkXJAgsE3lPc5V7tkCao+GWYT8yrcmVzPqcseqBaZaay5gnAgI0NOGDq52WjXaHn
         CuGeQU2Gan7K49L2FqVSp3W3jxVqzTrqpO3gclusjvQ3DeJ/PxtC9qGXu/6Za3kGTlIU
         Azlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C46JdBh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j69-v6si2230169ybj.220.2018.11.27.02.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 02:43:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C46JdBh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRaqO-0008Da-B0
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 05:43:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRaqH-0008DF-Cz
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 05:43:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRaqG-0003OT-Ga
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 05:43:45 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gRaqG-0003O9-Bl
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 05:43:44 -0500
Received: by mail-ot1-x342.google.com with SMTP id 32so19616286ota.12
	for <qemu-arm@nongnu.org>; Tue, 27 Nov 2018 02:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IVgr0W6r7Sp9dyYyIM+2B4xvWU/IrpZuoBvFSubhbEk=;
	b=C46JdBh5WPOWxeS0j3IndK2dAir6rC0cNtjRERp9uqlREvf+O0uvDOCfaMz++vpKK/
	JvvK1gv2rVVa0fzP7WmQy53St26A2tgVeN6zxySyQLPKiyQ5LQeVzxQv8NmJ/j/0xtmP
	vUWjQI/PiYZz6GdZ7SNmGmXT99dkxAAUCV0yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IVgr0W6r7Sp9dyYyIM+2B4xvWU/IrpZuoBvFSubhbEk=;
	b=TJUw3w75u4nXxJ0VSBOfnrK3OqE1abv/hbwxHO2RIdEEzD/K5rvldfBlmUICqX0iLz
	52sdFxZphvkqkXDaYBpOfxfg9iDUJU9c/7av1k+UvF4EPhHVQJ63U15PLW3GIG2H53pR
	+QoJlcVYDUAwbkAV2TKEQU5+l+ZxkJcVn7WBLWVgY5sDk0MVCnF0DdoIdmdLPR5I94eR
	Yt6l/WxqqaPdqpJ9dpK5lmvuZoVj8X6gCimrL0V5bhDQSOdq2BBTsN3IsHRqCLAq8awk
	ENW812wI++zXdqLEHKYuO36v3GwygV5KgMoZBE0Htvl+iykXIoJArok5DeCHvXqNsckt
	0qKA==
X-Gm-Message-State: AA+aEWZpCfAIo7dw1jsTbzKZceO+NSmLculOrMxoAF9+JsrhcV/a4ZZV
	ZzFjaBxbxBL0Q/JPvWkAdSTnzFnKtBNPXssh9i5ing==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr2167867oti.151.1543315423754; 
	Tue, 27 Nov 2018 02:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20181126191454.9455-1-ricardo.perez_blanco@nokia.com>
In-Reply-To: <20181126191454.9455-1-ricardo.perez_blanco@nokia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Nov 2018 10:43:31 +0000
Message-ID: <CAFEAcA9vDyVhj06oKDf=eFn_AkQk4MNRmeUf86OH3xJFaKNEqA@mail.gmail.com>
To: ricardo.perez_blanco@nokia.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH] [PATCH] Allow AArch64 processors to boot
 from a kernel placed over 4GB.
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
Cc: ricardoperezblanco@gmail.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2QUJ36rhu0Yu

On Mon, 26 Nov 2018 at 19:15, Perez Blanco, Ricardo (Nokia -
BE/Antwerp) <ricardo.perez_blanco@nokia.com> wrote:
>
> Some machine based on AArch64 can have its main memory over 4GBs. With
> the current path, these machines can support "-kernel" in qemu
>
> Signed-off-by: Ricardo Perez Blanco <ricardo.perez_blanco@nokia.com>

Hi; I think it would be worth noting in the commit message that
this doesn't affect any machines QEMU currently emulates.

> ---
>  hw/arm/boot.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 586baa9b64..183c5860bd 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -64,7 +64,9 @@ typedef enum {
>      FIXUP_BOARDID,      /* overwrite with board ID number */
>      FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code address */
>      FIXUP_ARGPTR,       /* overwrite with pointer to kernel args */
> +    FIXUP_ARGPTR_HIGHER_32BITS,       /* overwrite with pointer to kernel args (higher 32 bits) */
>      FIXUP_ENTRYPOINT,   /* overwrite with kernel entry point */
> +    FIXUP_ENTRYPOINT_HIGHER_32BITS,   /* overwrite with kernel entry point (higher 32 bits) */

I recommend naming these FIXUP_ARGPTR_HI and FIXUP_ENTRYPOINT_HI.
As a second followup patch we can then rename FIXUP_ARGPTR and
FIXUP_ENTRYPOINT to FIXUP_ARGPTR_LO and FIXUP_ENTRYPOINT_LO.

>      FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
>      FIXUP_BOOTREG,      /* overwrite with boot register address */
>      FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
> @@ -84,9 +86,9 @@ static const ARMInsnFixup bootloader_aarch64[] = {
>      { 0x58000084 }, /* ldr x4, entry ; Load the lower 32-bits of kernel entry */
>      { 0xd61f0080 }, /* br x4      ; Jump to the kernel entry point */
>      { 0, FIXUP_ARGPTR }, /* arg: .word @DTB Lower 32-bits */
> -    { 0 }, /* .word @DTB Higher 32-bits */
> +    { 0, FIXUP_ARGPTR_HIGHER_32BITS}, /* .word @DTB Higher 32-bits */
>      { 0, FIXUP_ENTRYPOINT }, /* entry: .word @Kernel Entry Lower 32-bits */
> -    { 0 }, /* .word @Kernel Entry Higher 32-bits */
> +    { 0, FIXUP_ENTRYPOINT_HIGHER_32BITS }, /* .word @Kernel Entry Higher 32-bits */
>      { 0, FIXUP_TERMINATOR }
>  };
>
> @@ -175,7 +177,9 @@ static void write_bootloader(const char *name, hwaddr addr,
>          case FIXUP_BOARDID:
>          case FIXUP_BOARD_SETUP:
>          case FIXUP_ARGPTR:
> +        case FIXUP_ARGPTR_HIGHER_32BITS:
>          case FIXUP_ENTRYPOINT:
> +        case FIXUP_ENTRYPOINT_HIGHER_32BITS:
>          case FIXUP_GIC_CPU_IF:
>          case FIXUP_BOOTREG:
>          case FIXUP_DSB:
> @@ -939,7 +943,6 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
>              }
>          }
>      }
> -
>      *entry = mem_base + kernel_load_offset;
>      rom_add_blob_fixed_as(filename, buffer, size, *entry, as);
>

Stray whitespace change.

> @@ -1153,8 +1156,10 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>              info->dtb_start = QEMU_ALIGN_UP(info->initrd_start + initrd_size,
>                                             align);
>              fixupcontext[FIXUP_ARGPTR] = info->dtb_start;
> +            fixupcontext[FIXUP_ARGPTR_HIGHER_32BITS] = info->dtb_start >> 32;
>          } else {
>              fixupcontext[FIXUP_ARGPTR] = info->loader_start + KERNEL_ARGS_ADDR;
> +            fixupcontext[FIXUP_ARGPTR_HIGHER_32BITS] = (info->loader_start + KERNEL_ARGS_ADDR) >> 32;
>              if (info->ram_size >= (1ULL << 32)) {
>                  error_report("RAM size must be less than 4GB to boot"
>                               " Linux kernel using ATAGS (try passing a device tree"
> @@ -1163,6 +1168,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>              }
>          }
>          fixupcontext[FIXUP_ENTRYPOINT] = entry;
> +        fixupcontext[FIXUP_ENTRYPOINT_HIGHER_32BITS] = entry >> 32;
>
>          write_bootloader("bootloader", info->loader_start,
>                           primary_loader, fixupcontext, as);
> --

Otherwise the patch looks good.

thanks
-- PMM
