Received: by 10.25.159.19 with SMTP id i19csp2590584lfe;
        Tue, 19 Jan 2016 08:24:18 -0800 (PST)
X-Received: by 10.140.95.119 with SMTP id h110mr39721360qge.105.1453220658423;
        Tue, 19 Jan 2016 08:24:18 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 124si38098957qhw.42.2016.01.19.08.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:24:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:37891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLZ4r-0003cM-Of
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 11:24:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYsT-0005Yn-Um
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 11:11:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYsO-0002JJ-2F
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 11:11:29 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36588)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYsN-0002J5-JC
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 11:11:23 -0500
Received: by mail-vk0-x229.google.com with SMTP id n1so196298906vkb.3
	for <qemu-devel@nongnu.org>; Tue, 19 Jan 2016 08:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=luDua7hPI1OwhkT5DNtvcLqvkRxcrEM39A1x8H5xpkU=;
	b=SiFFbTaMRn3opAcTnlRNmgadB4VUQGcnFMiqiKSyfve7sBp4BMgbFKJx6NoYxQ+cTL
	SfONJpJ/GJZl4iBlD5uY/lBpn0kNRAua+ixjZqv6NRli+UvtO/rKOknKdnYqjHspNBo1
	B5aPyI8JSrNcUHXavnIacU6D/h/Jrc5eqA5Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=luDua7hPI1OwhkT5DNtvcLqvkRxcrEM39A1x8H5xpkU=;
	b=VpduCSCyV6A22Qmpcugf/wWhGNUOeAg2H57gl4z5DlRERlIkg2dsqph/Dzin8a1P/9
	kzEa2PuBrcc53afSNyYdaR7FFXmWFfcSKyjUFx/rpUwQ6GL7FSsQLMwTRrO21osZhs21
	Mxe9fXlm7yuD4YjbavYXWBndqJ/yt1gtwJw9cDrCbAkCEsAs9A5o8s+8ukQUCPOv/gpF
	qa5n0KFICdbNh3o3X50R2ZGNqmwkPjliLyICLzWr3dzwA8GOK/JDzaNYEdLFmg6/AyUw
	QUdgCOv13A67pVnXmU3iDhIJ+N9sxxV0RWAwYu4p/oSG6Iq8duJR718fNQEhvEOO/rEL
	mlcg==
X-Gm-Message-State: ALoCoQnkrGWJebeNr528LArhHMQw6JGSU3Gv500NsW5J/Pg6AntMc68GLq3qCecMn0lQXnj/u2fhii4ayHzqJ4sRJNU2lsZbu1TljZXY7eFyOGT2Oxzx3fM=
X-Received: by 10.31.107.138 with SMTP id k10mr19698539vki.27.1453219883283;
	Tue, 19 Jan 2016 08:11:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 08:11:03 -0800 (PST)
In-Reply-To: <2d20fa6a88faf2b99719ac90c9205e280e632634.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<2d20fa6a88faf2b99719ac90c9205e280e632634.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 16:11:03 +0000
Message-ID: <CAFEAcA8bdJpX0-MYAbhjVqM=2axSiLEvVBGEsern3SUoJU58OA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-devel] [PATCH v1 08/17] target-arm: cpu: Move
	cpu_is_big_endian to header
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PYrqhiXyqOGq

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>
> There is a CPU data endianness test that is used to drive the
> virtio_big_endian test.
>
> Move this up to the header so it can be more generally used for endian
> tests. The KVM specific cpu_syncronize_state call is left behind in the
> virtio specific function.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>
>  target-arm/cpu.c | 19 +++----------------
>  target-arm/cpu.h | 19 +++++++++++++++++++
>  2 files changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 35a1f12..d3b73bf 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -368,26 +368,13 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
>  #endif
>  }
>
> -static bool arm_cpu_is_big_endian(CPUState *cs)
> +static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> -    int cur_el;
>
>      cpu_synchronize_state(cs);
> -
> -    /* In 32bit guest endianness is determined by looking at CPSR's E bit */
> -    if (!is_a64(env)) {
> -        return (env->uncached_cpsr & CPSR_E) ? 1 : 0;
> -    }
> -
> -    cur_el = arm_current_el(env);
> -
> -    if (cur_el == 0) {
> -        return (env->cp15.sctlr_el[1] & SCTLR_E0E) != 0;
> -    }
> -
> -    return (env->cp15.sctlr_el[cur_el] & SCTLR_EE) != 0;
> +    return arm_cpu_is_big_endian(env);
>  }
>
>  #endif
> @@ -1420,7 +1407,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>      cc->do_unaligned_access = arm_cpu_do_unaligned_access;
>      cc->get_phys_page_debug = arm_cpu_get_phys_page_debug;
>      cc->vmsd = &vmstate_arm_cpu;
> -    cc->virtio_is_big_endian = arm_cpu_is_big_endian;
> +    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
>  #endif
>      cc->gdb_num_core_regs = 26;
>      cc->gdb_core_xml_file = "arm-core.xml";
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index f83070a..54675c7 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1795,6 +1795,25 @@ static inline bool arm_singlestep_active(CPUARMState *env)
>          && arm_generate_debug_exceptions(env);
>  }
>
> +/* Return true if the processor is in big-endian mode. */
> +static bool arm_cpu_is_big_endian(CPUARMState *env)
> +{

No problems code-wise, but can we call the function
arm_cpu_data_is_big_endian() or something? This is returning the
endianness to use for data accesses; there isn't an overall
"big-endian mode" that affects everything except for the
obsolete BE32.

thanks
-- PMM
