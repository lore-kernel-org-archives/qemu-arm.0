Received: by 10.25.159.19 with SMTP id i19csp788521lfe;
        Thu, 28 Jan 2016 23:11:52 -0800 (PST)
X-Received: by 10.140.22.210 with SMTP id 76mr8719235qgn.70.1454051512556;
        Thu, 28 Jan 2016 23:11:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a123si15713968qha.3.2016.01.28.23.11.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jan 2016 23:11:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aP3Dk-0001DO-1H
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 02:11:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aP3Dh-0001AI-IL
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 02:11:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aP3Dg-0008Eq-2x
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 02:11:49 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:38054)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aP3Dc-0008ET-Is; Fri, 29 Jan 2016 02:11:44 -0500
Received: by mail-wm0-x233.google.com with SMTP id p63so55290941wmp.1;
	Thu, 28 Jan 2016 23:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=98xLjoOHLXZpR5ziznShQjgOR/pgEjTeyMNW3OMEgUI=;
	b=s9SwFrHV0KnO9KkKrZDBpwdLtICL7JHaadIV7zK/l2LtmZZSDudtDFufdOEZNrJY+u
	ezXly9Vhmhi2eWlGQRAPXn6wJFs2QlGhyr+XIjR+Y190fZUCVChJrsu32sEL0OZXJA9f
	R/hfLF/YVTi1gylye2dw7PBAnOFHJZCHtZg0ieLKel0lNKrRzZCgFVkkOuvusVUrBNHT
	6duKDOvgQVUoZmSENKtf9hFqeUqBlbAk5lEFQu3jspKVxbZLIkcUkOeV59coy9nR7gas
	V6i6tM/fwFwc2TpQ7W9IjaVr04DN/p1MsyplZqVNX0e21nkiXfuFGwBVExci9nTdzGRN
	tWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=98xLjoOHLXZpR5ziznShQjgOR/pgEjTeyMNW3OMEgUI=;
	b=mWyaM7WxsgwW9F0GZFfbMfTS8QNM1tfC3LST5RMV9w/9r8Ch2qbnFexNKSqydG8jNH
	RwNbDL2JNHRwJIDAS57MLQBKJ2urZ2t9V0+JuOGNQUFtkcQuPsQBiBuQ+hmI8sLp50i5
	2e3PD2RU4bXmzZKaSSpI2ehPkqQ7Wz9yrI+P88luTBd+8LqEpFOxr9BPK71JwYJJc91W
	8Pc4xuvfbfCsnszPRmi6+7eei3K43KxMHhHIZtCbCLCDcJJpVWFqF+EDW6bqIcrQ4iwl
	hveXAMvenyA3ZsQycD17tPI7q7Od7OEP2LgkNibRbXpxJBIwMd47y3GOM3mEDJFDaklX
	QHDQ==
X-Gm-Message-State: AG10YOS5fzDZMjrPI2fJwGX2M+5PxK6Jjjvr4MdZKDG1v9tDp9ODkVwEzYmPv2shmtVxT9I8yTponkO/gvnTEA==
MIME-Version: 1.0
X-Received: by 10.28.184.137 with SMTP id i131mr6804363wmf.96.1454051503739;
	Thu, 28 Jan 2016 23:11:43 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Thu, 28 Jan 2016 23:11:43 -0800 (PST)
In-Reply-To: <1452902337-13844-8-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-8-git-send-email-Andrew.Baumann@microsoft.com>
Date: Thu, 28 Jan 2016 23:11:43 -0800
Message-ID: <CAPokK=pNpqm4Rr41qHc3ae5j+wfbQROeJsMuSV9hhfiub5QJNQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 7/8] arm/boot: move highbank secure board
 setup code to common routine
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
X-TUID: Tc+qOlv/8MXa

On Fri, Jan 15, 2016 at 3:58 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> The new version is slightly different, to support Rasbperry Pi (in
> particular, Pi1's arm11 core which doesn't support v7 instructions
> such as MOVW).
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>
> Notes:
>     This has not yet been tested on Highbank! Peter C -- please help :)
>

qemu-system-arm -kernel
/home/pcrost/poky/build/tmp/deploy/images/qemuarm/zImage -dtb
/home/pcrost/poky/build/tmp/deploy/images/qemuarm/zImage-highbank.dtb
-device ide-drive,drive=sata,bus=ide.0 -M highbank --no-reboot -drive
file=/home/pcrost/poky/build/tmp/deploy/images/qemuarm/core-image-minimal-qemuarm-20160114031411.rootfs.ext4,if=none,id=sata,format=raw
-no-reboot -nographic -m 128 -serial mon:stdio -serial null --append
"console=tty console=ttyAMA0,115200 ip=dhcp mem=128M highres=off
root=/dev/sda rw rootfstype=ext4 console=ttyS0"
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.2.1 (pcrost@pcrost-box) (gcc version
5.2.0 (GCC) ) #1 SMP Wed Jan 13 19:43:13 PST 2016
[    0.000000] CPU: ARMv7 Processor [410fc090] revision 0 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT
nonaliasing instruction cache
[    0.000000] Machine model: Calxeda Highbank
[    0.000000] cma: Failed to reserve 64 MiB
[    0.000000] Memory policy: Data cache writeback
[    0.000000] DT missing boot CPU MPIDR[23:0], fall back to default
cpu_logical_map
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: Using PSCI v0.1 Function IDs from DT
[    0.000000] CPU: All CPU(s) started in SVC mode.
...
[    4.263064] random: dd urandom read with 84 bits of entropy available
[    7.103537] random: nonblocking pool is initialized
[    9.286935] uart-pl011 fff36000.serial: no DMA platform data

Poky (Yocto Project Reference Distro) 2.0 qemuarm /dev/ttyAMA0

qemuarm login: root
root@qemuarm:~# uname -a
Linux qemuarm 4.2.1 #1 SMP Wed Jan 13 19:43:13 PST 2016 armv7l GNU/Linux
root@qemuarm:~#

Tested-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

>     Honestly, I fear that the overhead of maintaining support for two very
>     different platforms (including Pi1) may outweigh the value of unifying
>     these blobs.
>

Having a look at the new code it is more robust than the original in
its own right with the separation of the blobs.

>  hw/arm/boot.c        | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/highbank.c    | 37 ++----------------------------------
>  include/hw/arm/arm.h |  5 +++++
>  3 files changed, 60 insertions(+), 35 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 75f69bf..bc1ea4d 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -178,6 +178,59 @@ static void default_write_secondary(ARMCPU *cpu,
>                       smpboot, fixupcontext);
>  }
>
> +void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
> +                                            const struct arm_boot_info *info,
> +                                            hwaddr mvbar_addr)
> +{
> +    int n;
> +    uint32_t mvbar_blob[] = {
> +        /* mvbar_addr: secure monitor vectors
> +         * Default unimplemented and unused vectors to spin. Makes it
> +         * easier to debug (as opposed to the CPU running away).
> +         */
> +        0xEAFFFFFE, /* (spin) */
> +        0xEAFFFFFE, /* (spin) */
> +        0xE1B0F00E, /* movs pc, lr ;SMC exception return */
> +        0xEAFFFFFE, /* (spin) */
> +        0xEAFFFFFE, /* (spin) */
> +        0xEAFFFFFE, /* (spin) */
> +        0xEAFFFFFE, /* (spin) */
> +        0xEAFFFFFE, /* (spin) */

The code currently in arm_boot uses lower case for hex constants so we
should preserve convention.

> +    };
> +    uint32_t board_setup_blob[] = {
> +        /* board setup addr */
> +        0xE3A00E00 + (mvbar_addr >> 4), /* mov r0, #mvbar_addr */
> +        0xEE0C0F30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
> +        0xEE110F11, /* mrc     p15, 0, r0, c1 , c1, 0 ;read SCR */
> +        0xE3800031, /* orr     r0, #0x31              ;enable AW, FW, NS */
> +        0xEE010F11, /* mcr     p15, 0, r0, c1, c1, 0  ;write SCR */
> +        0xE1A0100E, /* mov     r1, lr                 ;save LR across SMC */
> +        0xE1600070, /* smc     #0                     ;call monitor to flush SCR */
> +        0xE1A0F001, /* mov     pc, r1                 ;return */
> +    };
> +
> +    /* check that mvbar_addr is correctly aligned and relocatable (using MOV) */
> +    assert((mvbar_addr & 0x1f) == 0 && (mvbar_addr >> 4) < 0x100);
> +
> +    /* check that these blobs don't overlap */
> +    assert((mvbar_addr + sizeof(mvbar_blob) <= info->board_setup_addr)
> +          || (info->board_setup_addr + sizeof(board_setup_blob) <= mvbar_addr));
> +
> +    for (n = 0; n < ARRAY_SIZE(mvbar_blob); n++) {
> +        mvbar_blob[n] = tswap32(mvbar_blob[n]);
> +    }
> +    rom_add_blob_fixed("board-setup-mvbar", mvbar_blob, sizeof(mvbar_blob),
> +                       mvbar_addr);
> +
> +    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
> +        board_setup_blob[n] = tswap32(board_setup_blob[n]);
> +    }
> +    rom_add_blob_fixed("board-setup", board_setup_blob,
> +                       sizeof(board_setup_blob), info->board_setup_addr);
> +}
> +
> +
> +

2 extra blanks not needed.

>  static void default_reset_secondary(ARMCPU *cpu,
>                                      const struct arm_boot_info *info)
>  {
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index cb9926e..e5105fb 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -34,49 +34,16 @@
>  #define MPCORE_PERIPHBASE       0xfff10000
>
>  #define MVBAR_ADDR              0x200
> +#define BOARD_SETUP_ADDR        (MVBAR_ADDR + 8 * sizeof(uint32_t))
>
>  #define NIRQ_GIC                160
>
>  /* Board init.  */
>
> -/* MVBAR_ADDR is limited by precision of movw */
> -
> -QEMU_BUILD_BUG_ON(MVBAR_ADDR >= (1 << 16));
> -
> -#define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
> -                        extract32((x), 12,  4) << 16)
> -
>  static void hb_write_board_setup(ARMCPU *cpu,
>                                   const struct arm_boot_info *info)
>  {
> -    int n;
> -    uint32_t board_setup_blob[] = {
> -        /* MVBAR_ADDR */
> -        /* Default unimplemented and unused vectors to spin. Makes it
> -         * easier to debug (as opposed to the CPU running away).
> -         */
> -        0xeafffffe, /* notused1: b notused */
> -        0xeafffffe, /* notused2: b notused */
> -        0xe1b0f00e, /* smc: movs pc, lr - exception return */
> -        0xeafffffe, /* prefetch_abort: b prefetch_abort */
> -        0xeafffffe, /* data_abort: b data_abort */
> -        0xeafffffe, /* notused3: b notused3 */
> -        0xeafffffe, /* irq: b irq */
> -        0xeafffffe, /* fiq: b fiq */
> -#define BOARD_SETUP_ADDR (MVBAR_ADDR + 8 * sizeof(uint32_t))
> -        0xe3000000 + ARMV7_IMM16(MVBAR_ADDR), /* movw r0, MVBAR_ADDR */
> -        0xee0c0f30, /* mcr p15, 0, r0, c12, c0, 1 - set MVBAR */
> -        0xee110f11, /* mrc p15, 0, r0, c1 , c1, 0 - get SCR */
> -        0xe3810001, /* orr r0, #1 - set NS */
> -        0xee010f11, /* mcr p15, 0, r0, c1 , c1, 0 - set SCR */
> -        0xe1600070, /* smc - go to monitor mode to flush NS change */
> -        0xe12fff1e, /* bx lr - return to caller */
> -    };
> -    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
> -        board_setup_blob[n] = tswap32(board_setup_blob[n]);
> -    }
> -    rom_add_blob_fixed("board-setup", board_setup_blob,
> -                       sizeof(board_setup_blob), MVBAR_ADDR);
> +    arm_write_secure_board_setup_dummy_smc(cpu, info, MVBAR_ADDR);
>  }
>
>  static void hb_write_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index c26b0e3..75bfe26 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -126,4 +126,9 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info);
>     ticks.  */
>  extern int system_clock_scale;
>

system_clock_scale doesn't have much to do with boot but splits two
boot-related defs, so I would insert you new def after
arm_load_kernel.

otherwise:

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Regards,
Peter

> +/* Write a secure board setup routine with a dummy handler for SMCs */
> +void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
> +                                            const struct arm_boot_info *info,
> +                                            hwaddr mvbar_addr);
> +
>  #endif /* !ARM_MISC_H */
> --
> 2.5.3
>
