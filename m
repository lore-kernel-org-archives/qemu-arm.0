Received: by 10.182.158.201 with SMTP id ww9csp463722obb;
        Thu, 17 Dec 2015 07:39:16 -0800 (PST)
X-Received: by 10.140.93.77 with SMTP id c71mr34441530qge.46.1450366756126;
        Thu, 17 Dec 2015 07:39:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f185si11772119qkb.71.2015.12.17.07.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 07:39:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:54340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9aeB-0008Fq-Nj
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 10:39:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9ae8-0008FR-DZ
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 10:39:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9ae7-0004py-2R
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 10:39:12 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9ae6-0004pq-UB
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 10:39:11 -0500
Received: by mail-vk0-x22d.google.com with SMTP id a188so49126831vkc.0
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 07:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GU8DJ3K3oUIODYlzwXNqTgbZ578LDpvflKbWr2t2vdM=;
	b=XNsHCsZVDeBXmwBrhmASsqlwFwBvoAVu41kdjloku28OqPzO0Q19WgfNX1R9v3IhG6
	ubscYxMHRah5eZHjr3nV4eyPpjiAqriB6kNe+guRosxctBRKUfG52pIGNNdgKFwFSD+k
	jLtp7KH/QQ9eQoe9H2aP5+GD1Dd/suIdnLhIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GU8DJ3K3oUIODYlzwXNqTgbZ578LDpvflKbWr2t2vdM=;
	b=Gy2mgToPemYhol6zQUF7UrxWCPNHvcsdAwQCBA7tU7mUm1bhgG91H1LR0DkBZZ4N4y
	K3H1IabcFPPtpv/5NmvZCuUyh5RqK5EqOSvWQomClVIlELW2hPfjdEoMv5F0h8lB5t6d
	D7bf2KCBtoQoQ1DHOkMih6CIfEMAfJwm9nlH8imtSzElqxgNiCMHlk6h68e1Kb/aQMw4
	0OrXiWMiqmtdPDgBDKAlEYPZLej07iGZkw6LC/C/sub84UOpq8i3DXep6gvQT09rTXqj
	Klbl9rFWgwEn8Eyx2lTlYXgQOHcb/GRRAUwYiDsgyGStOj7c8tZDRMM4GkOiCNJhGxoY
	ptVg==
X-Gm-Message-State: ALoCoQnyjysy0cHSLUOe1utz47ks2BWCHDZ55uvf1DMRg/hicof9vJdFe19ZYa/AKJ+KyjUaxT8kQE9jzmWO7anRgqGkTEjGpuFQOGkncfPnUWZNJboX1c4=
X-Received: by 10.31.52.211 with SMTP id b202mr39028207vka.82.1450366750400;
	Thu, 17 Dec 2015 07:39:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 07:38:51 -0800 (PST)
In-Reply-To: <1449101933-24928-3-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-3-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 15:38:51 +0000
Message-ID: <CAFEAcA90sBFurRv6rbDEP7Q-qEy2PrpH7BgHVFOt15ZDfk68NQ@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 02/26] armv7m: Undo armv7m.hack
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
X-TUID: GiceiASBIIO7

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Add CPU unassigned access handler in place of special
> MemoryRegion to catch exception returns.
>
> The unassigned handler will signal other faults as either
> prefetch or data exceptions, with the FSR code 0x8 to
> distinguish them from memory translation faults (0xd).
> Future code will make use of this distinction when
> deciding to raise BusFault or MemManage exceptions.

This patch breaks my Stellaris test image -- instead of starting
it just sits there with a black screen.

I've put a copy of that test image up at
  http://people.linaro.org/~peter.maydell/stellaris.tgz
You can run it with path/to/stellaris/runme path/to/qemu-system-arm .

> ---
>  hw/arm/armv7m.c  |  8 --------
>  target-arm/cpu.c | 32 +++++++++++++++++++++-----------
>  2 files changed, 21 insertions(+), 19 deletions(-)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index a80d2ad..68146de 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -176,7 +176,6 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>      uint64_t entry;
>      uint64_t lowaddr;
>      int big_endian;
> -    MemoryRegion *hack = g_new(MemoryRegion, 1);
>
>      if (cpu_model == NULL) {
>         cpu_model = "cortex-m3";
> @@ -221,13 +220,6 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>          }
>      }
>
> -    /* Hack to map an additional page of ram at the top of the address
> -       space.  This stops qemu complaining about executing code outside RAM
> -       when returning from an exception.  */
> -    memory_region_init_ram(hack, NULL, "armv7m.hack", 0x1000, &error_fatal);
> -    vmstate_register_ram_global(hack);
> -    memory_region_add_subregion(system_memory, 0xfffff000, hack);
> -
>      qemu_register_reset(armv7m_reset, cpu);
>      return nvic;
>  }
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 30739fc..728854f 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -280,6 +280,25 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  }
>
>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
> +static void arm_v7m_unassigned_access(CPUState *cpu, hwaddr addr,
> +                                      bool is_write, bool is_exec, int opaque,
> +                                      unsigned size)
> +{
> +    ARMCPU *arm = ARM_CPU(cpu);
> +    CPUARMState *env = &arm->env;
> +
> +    env->exception.vaddress = addr;
> +    env->exception.fsr = is_write ? 0x808 : 0x8; /* Precise External Abort */
> +    if (env->v7m.exception != 0 && addr >= 0xfffffff0 && !is_write) {
> +        cpu->exception_index = EXCP_EXCEPTION_EXIT;

We could use a comment here (a) explaining what we're doing and (b)
mentioning that this isn't architecturally correct -- ideally we should
catch these exception exits on execution of the jump insn, not by
letting the jump execute and then trapping when we actually try to
execute at the magic addresses.

> +    } else if (is_exec) {
> +        cpu->exception_index = EXCP_PREFETCH_ABORT;
> +    } else {
> +        cpu->exception_index = EXCP_DATA_ABORT;
> +    }
> +    cpu_loop_exit(cpu);
> +}
> +
>  static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cs);
> @@ -294,19 +313,9 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>          cc->do_interrupt(cs);
>          ret = true;
>      }
> -    /* ARMv7-M interrupt return works by loading a magic value
> -     * into the PC.  On real hardware the load causes the
> -     * return to occur.  The qemu implementation performs the
> -     * jump normally, then does the exception return when the
> -     * CPU tries to execute code at the magic address.
> -     * This will cause the magic PC value to be pushed to
> -     * the stack if an interrupt occurred at the wrong time.
> -     * We avoid this by disabling interrupts when
> -     * pc contains a magic address.
> -     */
>      if (interrupt_request & CPU_INTERRUPT_HARD
>          && !(env->daif & PSTATE_I)
> -        && (env->regs[15] < 0xfffffff0)) {
> +            ) {

Can we really drop this change? The thing it's guarding against
(interrupt comes in while the PC is this not-really-an-address
value) can still happen whether we catch the attempt to execute
in translate.c or via the unassigned-access hook.

(This isn't what's causing my test image to not run, though.)

>          cs->exception_index = EXCP_IRQ;
>          cc->do_interrupt(cs);
>          ret = true;
> @@ -909,6 +918,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
>      cc->do_interrupt = arm_v7m_cpu_do_interrupt;
>  #endif
>
> +    cc->do_unassigned_access = arm_v7m_unassigned_access;
>      cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
>  }

thanks
-- PMM
