Received: by 10.25.159.19 with SMTP id i19csp2644074lfe;
        Tue, 19 Jan 2016 10:06:31 -0800 (PST)
X-Received: by 10.129.78.7 with SMTP id c7mr12654576ywb.248.1453226791502;
        Tue, 19 Jan 2016 10:06:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e188si17646739ywf.77.2016.01.19.10.06.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 10:06:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLafm-0007Q8-RQ
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 13:06:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLafj-0007Oo-DC
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 13:06:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLafi-0000LB-3F
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 13:06:27 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:32828)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLafh-0000Ku-RR
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 13:06:26 -0500
Received: by mail-vk0-x235.google.com with SMTP id e64so16717526vkg.0
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 10:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=m1nYwzAzxyoEVdhY2ymd1r6DQXieytxVOXS871Hy/1I=;
	b=CWLRWwOYY3AxpaEAcPYTqmjEd2zaJLG69uF2avr9jTJeNxE3VYxKohMYuYC3WDugog
	CNn3XcI8cgb49t/onLBPPrDLHdsjYN/QEqR9XfoIdKOpvO18YSOdfwenPswYz04ni4Sd
	Ws+4hkvKwOivtoDeBRqxh8Ro2Af9TL5+tVqPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=m1nYwzAzxyoEVdhY2ymd1r6DQXieytxVOXS871Hy/1I=;
	b=LlRfXoHfgYtXT1ZNTquHiyC4/XJSHNl34Jc+Mwd2SnuysXMW4sHaRKjGW/XWcc7Qp2
	eLFs6GdWq3n8raF4+i9ApC+Yva1VJy4yAysckP8mvzj9PWjs3zN4QUnPi/f5GhxRhn86
	gmlcvN0RnPoCqphc6fA2aT1EweDxsZ/1RFPSd5dWNGWX6d8AmJDwOQnv7vyVaHadrMzX
	D8NwbAJLmRp0OMkiXWTEM3gqMeOlgibXZhhksNR71hJGEJ2buSYyXcyU33Xkl7EqKlAJ
	C06IHLGsDawAFGWn8ep4oL0Nmw0rQc8eQQcVu4Jme33oqZnP6yd7GWrL5ssdg0fxokw5
	7Imw==
X-Gm-Message-State: ALoCoQlE8qd5sLf+4VNvHoBwXtQbaOoQ4fvAYnQk+nHAmyNEmNXNtp+AaXoBDq4iFmH+D5/0mLZeNeDq5epktuYYGSU9G6vcMHPVhdxe2QZ58qjfGYhx/18=
X-Received: by 10.31.131.203 with SMTP id f194mr21986986vkd.90.1453226785449; 
	Tue, 19 Jan 2016 10:06:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 10:06:06 -0800 (PST)
In-Reply-To: <a423915e73675644ad71c6b87dcc0e334bbefee9.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<a423915e73675644ad71c6b87dcc0e334bbefee9.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 18:06:06 +0000
Message-ID: <CAFEAcA_QuJZcPqBUBeQ4w-L=r8Fc=VHmaG8Xz4Di2Tqy=-j26w@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 17/17] arm: boot: Support big-endian elfs
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
X-TUID: xrAZ+zbzvfid

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Support ARM big-endian ELF files in system-mode emulation. When loading
> an elf, determine the endianness mode expected by the elf, and set the
> relevant CPU state accordingly.
>
> With this, big-endian modes are now fully supported via system-mode LE,
> so there is no need to restrict the elf loading to the TARGET
> endianness so the ifdeffery on TARGET_WORDS_BIGENDIAN goes away.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
>
>  hw/arm/boot.c        | 96 ++++++++++++++++++++++++++++++++++++++++++----------
>  include/hw/arm/arm.h |  9 +++++
>  2 files changed, 88 insertions(+), 17 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 0de4269..053c9e8 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -465,9 +465,34 @@ static void do_cpu_reset(void *opaque)
>      cpu_reset(cs);
>      if (info) {
>          if (!info->is_linux) {
> +            int i;
>              /* Jump to the entry point.  */
>              uint64_t entry = info->entry;
>
> +            switch (info->endianness) {
> +            case ARM_ENDIANNESS_LE:
> +                env->cp15.sctlr_el[1] &= ~SCTLR_E0E;
> +                for (i = 1; i < 4; ++i) {
> +                    env->cp15.sctlr_el[i] &= ~SCTLR_EE;
> +                }
> +                env->uncached_cpsr &= ~CPSR_E;
> +                break;
> +            case ARM_ENDIANNESS_BE8:
> +                env->cp15.sctlr_el[1] |= SCTLR_E0E;
> +                for (i = 1; i < 4; ++i) {
> +                    env->cp15.sctlr_el[i] |= SCTLR_EE;
> +                }
> +                env->uncached_cpsr |= CPSR_E;
> +                break;
> +            case ARM_ENDIANNESS_BE32:
> +                env->cp15.sctlr_el[1] |= SCTLR_B;
> +                break;
> +            case ARM_ENDIANNESS_UNKNOWN:
> +                break; /* Board's decision */
> +            default:
> +                g_assert_not_reached();
> +            }

Do we really want this much magic for non-linux images? I would
expect that the image would be intended to run with whatever the
state the board puts the CPU in from reset (ie the CPU has suitable
QOM properties for its initial endianness state, corresponding to
real hardware reset-config signals like the A15's CFGEND/CFGTE).

> +
>              if (!env->aarch64) {
>                  env->thumb = info->entry & 1;
>                  entry &= 0xfffffffe;
> @@ -589,16 +614,23 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>      int kernel_size;
>      int initrd_size;
>      int is_linux = 0;
> +
>      uint64_t elf_entry, elf_low_addr, elf_high_addr;
>      int elf_machine;
> +    bool elf_is64;
> +    union {
> +        Elf32_Ehdr h32;
> +        Elf64_Ehdr h64;
> +    } elf_header;
> +
>      hwaddr entry, kernel_load_offset;
> -    int big_endian;
>      static const ARMInsnFixup *primary_loader;
>      ArmLoadKernelNotifier *n = DO_UPCAST(ArmLoadKernelNotifier,
>                                           notifier, notifier);
>      ARMCPU *cpu = n->cpu;
>      struct arm_boot_info *info =
>          container_of(n, struct arm_boot_info, load_kernel_notifier);
> +    Error *err = NULL;
>
>      /* The board code is not supposed to set secure_board_setup unless
>       * running its code in secure mode is actually possible, and KVM
> @@ -678,12 +710,6 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>      if (info->nb_cpus == 0)
>          info->nb_cpus = 1;
>
> -#ifdef TARGET_WORDS_BIGENDIAN
> -    big_endian = 1;
> -#else
> -    big_endian = 0;
> -#endif

Was this code ever built with TARGET_WORDS_BIGENDIAN defined?

> -
>      /* We want to put the initrd far enough into RAM that when the
>       * kernel is uncompressed it will not clobber the initrd. However
>       * on boards without much RAM we must ensure that we still leave
> @@ -698,16 +724,52 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>          MIN(info->ram_size / 2, 128 * 1024 * 1024);
>
>      /* Assume that raw images are linux kernels, and ELF images are not.  */
> -    kernel_size = load_elf(info->kernel_filename, NULL, NULL, &elf_entry,
> -                           &elf_low_addr, &elf_high_addr, big_endian,
> -                           elf_machine, 1, 0);
> -    if (kernel_size > 0 && have_dtb(info)) {
> -        /* If there is still some room left at the base of RAM, try and put
> -         * the DTB there like we do for images loaded with -bios or -pflash.
> -         */
> -        if (elf_low_addr > info->loader_start
> -            || elf_high_addr < info->loader_start) {
> -            /* Pass elf_low_addr as address limit to load_dtb if it may be
> +
> +    load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, &err);
> +
> +    if (!err) {
> +        int data_swab = 0;
> +        bool big_endian;
> +
> +        if (elf_is64) {
> +            big_endian = elf_header.h64.e_ident[EI_DATA] == ELFDATA2MSB;
> +            info->endianness = big_endian ? ARM_ENDIANNESS_BE8
> +                                          : ARM_ENDIANNESS_LE;
> +        } else {
> +            big_endian = elf_header.h32.e_ident[EI_DATA] == ELFDATA2MSB;
> +            if (big_endian) {
> +                if (bswap32(elf_header.h32.e_flags) & EF_ARM_BE8) {
> +                    info->endianness = ARM_ENDIANNESS_BE8;
> +                } else {
> +                    info->endianness = ARM_ENDIANNESS_BE32;
> +                    /* In BE32, the CPU has a different view of the per-byte
> +                     * address map than the rest of the system. BE32 elfs are
> +                     * organised such that they can be programmed through the
> +                     * CPUs per-word byte-reversed view of the world. QEMU
> +                     * however loads elfs independently of the CPU. So tell
> +                     * the elf loader to byte reverse the data for us.
> +                     */
> +                    data_swab = 2;
> +                }
> +            } else {
> +                info->endianness = ARM_ENDIANNESS_LE;
> +            }
> +        }
> +
> +        kernel_size = load_elf(info->kernel_filename, NULL, NULL, &elf_entry,
> +                               &elf_low_addr, &elf_high_addr, big_endian,
> +                               elf_machine, 1, data_swab);
> +        if (kernel_size <= 0) {
> +            exit(1);
> +        }
> +
> +        if (have_dtb(info) && (elf_low_addr > info->loader_start ||
> +                               elf_high_addr < info->loader_start)) {
> +            /* If there is still some room left at the base of RAM, try and
> +             * put the DTB there like we do for images loaded with -bios or
> +             * -pflash.
> +             *
> +             * Pass elf_low_addr as address limit to load_dtb if it may be
>               * pointing into RAM, otherwise pass '0' (no limit)
>               */
>              if (elf_low_addr < info->loader_start) {

I think this change would be easier to read if we had a new
(static) function in this file load_arm_elf() which did the
"load header; figure out data_swab; load full elf file with
corresponding swab value". Then the change to this function would
just be a one-liner turning the load_elf() call into load_arm_elf().

thanks
-- PMM
