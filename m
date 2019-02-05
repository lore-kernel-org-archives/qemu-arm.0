Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4881600wrt;
        Tue, 5 Feb 2019 07:17:06 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYDX7hMd9VQbIj53QCk74xdlVmBoBa1fX+2qwQp2LmlMm096zr0UvTORrXGHh3W4rgrPdIL
X-Received: by 2002:a5b:712:: with SMTP id g18mr4161466ybq.171.1549379826361;
        Tue, 05 Feb 2019 07:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549379826; cv=none;
        d=google.com; s=arc-20160816;
        b=REZ0Kn10uDybCQvTOIGUu+8qDq6fLm+iJyyGl41LgwwYCdwGb9+jEqNIIF13iymKgU
         pfEcalRLn9stlIdOjKaRIaCgmbHhOFl0uag6ysT5OF0MfjVFQ1dWqnWgdmvpTIro2aXB
         +LNKW+U7eXUc+4sO15H5r8mXVAKWJIzGgBNSdKaVSV4M7owqZ/oCJU/8yzsVSkp63GHQ
         XVY5UHsAfvE94X3sUoT6PfdYAyAzEkJ8IzoSTrtqH8cR9FtEYOfo1+eMfVgnKWYFUClS
         DeI57gTJ+cfJDJ8imfq2ksyFZuNuwwvzC2eDzF+1XeWkCudnXJ2U87lQni94e/uMS3MN
         WnLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=DNx6tVXx0swjlrJM+0tOtHF9XrMtssHwLsbk9R7Md8M=;
        b=Rnv76LQSGgb7+LGA9lKcq4I/L3xZIb6DPVhnWE2jKboJ2x02iQ95TgFHyis2S66Bgh
         TGeiB4YkAA8Njgw3692gxirDOKz+AtVjnnlQUccKF3XXoSuE2pxOfyxtVTysh5lk4n36
         Su8OI74TJMnrOgpxB49mM0kMaItMMEo08F1itFCGklsxCt+zAYa1WiowyXeRa/2FG2Ly
         EbUfjKH8oB6rM/fMVMLvg7RkUJdMdkt1vDTt7l4khk1C7gC/WV6tkROJYnSGs6p3pmQ3
         ARUv1A02RmNJx1TIUlNIk6aMVTOJOioDvXWadTyoQPdwLyAFfdS2EuUflBpDxiWav4eO
         ey1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si2082692ybk.198.2019.02.05.07.17.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 07:17:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr2TB-0002v2-RM
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 10:17:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gr2T2-0002uP-1L
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 10:16:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gr2Sx-0006C7-23
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 10:16:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56406)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gr2Sw-0005um-DG; Tue, 05 Feb 2019 10:16:50 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCE26C05A1D8;
	Tue,  5 Feb 2019 15:16:15 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-31.ams2.redhat.com
	[10.36.112.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2F6B100194A;
	Tue,  5 Feb 2019 15:16:13 +0000 (UTC)
Date: Tue, 5 Feb 2019 16:16:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190205161609.1640f733@Igors-MacBook-Pro.local>
In-Reply-To: <20190131112240.8395-3-peter.maydell@linaro.org>
References: <20190131112240.8395-1-peter.maydell@linaro.org>
	<20190131112240.8395-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 05 Feb 2019 15:16:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/5] hw/arm/boot: Factor out "direct kernel
 boot" code into its own function
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mXW3R6k5Wmr8

On Thu, 31 Jan 2019 11:22:37 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> Factor out the "direct kernel boot" code path from arm_load_kernel()
> into its own function; this function is getting long enough that
> the code flow is a bit confusing.
> 
> This commit only moves code around; no semantic changes.
> 
> We leave the "load the dtb" code in arm_load_kernel() -- this
> is currently only used by the "direct kernel boot" path, but
> this is a bug which we will fix shortly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/boot.c | 150 +++++++++++++++++++++++++++-----------------------
>  1 file changed, 80 insertions(+), 70 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 6f9ceeb0e89..108e9b979f8 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -953,9 +953,12 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
>      return size;
>  }
>  
> -void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
> +static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
> +                                         struct arm_boot_info *info)
>  {
> +    /* Set up for a direct boot of a kernel image file. */
>      CPUState *cs;
> +    AddressSpace *as = arm_boot_address_space(cpu, info);
>      int kernel_size;
>      int initrd_size;
>      int is_linux = 0;
> @@ -963,75 +966,6 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>      int elf_machine;
>      hwaddr entry;
>      static const ARMInsnFixup *primary_loader;
> -    AddressSpace *as = arm_boot_address_space(cpu, info);
> -
> -    /*
> -     * CPU objects (unlike devices) are not automatically reset on system
> -     * reset, so we must always register a handler to do so. If we're
> -     * actually loading a kernel, the handler is also responsible for
> -     * arranging that we start it correctly.
> -     */
> -    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
> -        qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
> -    }
> -
> -    /*
> -     * The board code is not supposed to set secure_board_setup unless
> -     * running its code in secure mode is actually possible, and KVM
> -     * doesn't support secure.
> -     */
> -    assert(!(info->secure_board_setup && kvm_enabled()));
> -
> -    info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
> -    info->dtb_limit = 0;
> -
> -    /* Load the kernel.  */
> -    if (!info->kernel_filename || info->firmware_loaded) {
> -
> -        if (have_dtb(info)) {
> -            /*
> -             * If we have a device tree blob, but no kernel to supply it to (or
> -             * the kernel is supposed to be loaded by the bootloader), copy the
> -             * DTB to the base of RAM for the bootloader to pick up.
> -             */
> -            info->dtb_start = info->loader_start;
> -        }
> -
> -        if (info->kernel_filename) {
> -            FWCfgState *fw_cfg;
> -            bool try_decompressing_kernel;
> -
> -            fw_cfg = fw_cfg_find();
> -            try_decompressing_kernel = arm_feature(&cpu->env,
> -                                                   ARM_FEATURE_AARCH64);
> -
> -            /*
> -             * Expose the kernel, the command line, and the initrd in fw_cfg.
> -             * We don't process them here at all, it's all left to the
> -             * firmware.
> -             */
> -            load_image_to_fw_cfg(fw_cfg,
> -                                 FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
> -                                 info->kernel_filename,
> -                                 try_decompressing_kernel);
> -            load_image_to_fw_cfg(fw_cfg,
> -                                 FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
> -                                 info->initrd_filename, false);
> -
> -            if (info->kernel_cmdline) {
> -                fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
> -                               strlen(info->kernel_cmdline) + 1);
> -                fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
> -                                  info->kernel_cmdline);
> -            }
> -        }
> -
> -        /*
> -         * We will start from address 0 (typically a boot ROM image) in the
> -         * same way as hardware.
> -         */
> -        return;
> -    }
>  
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          primary_loader = bootloader_aarch64;
> @@ -1206,6 +1140,82 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>      for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
>          ARM_CPU(cs)->env.boot_info = info;
>      }
> +}
> +
> +void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
> +{
> +    CPUState *cs;
> +    AddressSpace *as = arm_boot_address_space(cpu, info);
> +
> +    /*
> +     * CPU objects (unlike devices) are not automatically reset on system
> +     * reset, so we must always register a handler to do so. If we're
> +     * actually loading a kernel, the handler is also responsible for
> +     * arranging that we start it correctly.
> +     */
> +    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
> +        qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
> +    }
Should we move this hunk to cpu code instead, like it's done for x86?

> +
> +    /*
> +     * The board code is not supposed to set secure_board_setup unless
> +     * running its code in secure mode is actually possible, and KVM
> +     * doesn't support secure.
> +     */
> +    assert(!(info->secure_board_setup && kvm_enabled()));
> +
> +    info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
> +    info->dtb_limit = 0;
> +
> +    /* Load the kernel.  */
> +    if (!info->kernel_filename || info->firmware_loaded) {
> +
> +        if (have_dtb(info)) {
> +            /*
> +             * If we have a device tree blob, but no kernel to supply it to (or
> +             * the kernel is supposed to be loaded by the bootloader), copy the
> +             * DTB to the base of RAM for the bootloader to pick up.
> +             */
> +            info->dtb_start = info->loader_start;
> +        }
> +
> +        if (info->kernel_filename) {
> +            FWCfgState *fw_cfg;
> +            bool try_decompressing_kernel;
> +
> +            fw_cfg = fw_cfg_find();
> +            try_decompressing_kernel = arm_feature(&cpu->env,
> +                                                   ARM_FEATURE_AARCH64);
> +
> +            /*
> +             * Expose the kernel, the command line, and the initrd in fw_cfg.
> +             * We don't process them here at all, it's all left to the
> +             * firmware.
> +             */
> +            load_image_to_fw_cfg(fw_cfg,
> +                                 FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
> +                                 info->kernel_filename,
> +                                 try_decompressing_kernel);
> +            load_image_to_fw_cfg(fw_cfg,
> +                                 FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
> +                                 info->initrd_filename, false);
> +
> +            if (info->kernel_cmdline) {
> +                fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
> +                               strlen(info->kernel_cmdline) + 1);
> +                fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
> +                                  info->kernel_cmdline);
> +            }
> +        }
> +
> +        /*
> +         * We will start from address 0 (typically a boot ROM image) in the
> +         * same way as hardware.
> +         */
> +        return;
> +    } else {
> +        arm_setup_direct_kernel_boot(cpu, info);
> +    }
>  
>      if (!info->skip_dtb_autoload && have_dtb(info)) {
>          if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {

