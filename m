Received: by 10.25.221.202 with SMTP id w71csp2396326lfi;
        Fri, 4 Aug 2017 11:10:23 -0700 (PDT)
X-Received: by 10.55.31.150 with SMTP id n22mr4333362qkh.46.1501870222759;
        Fri, 04 Aug 2017 11:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501870222; cv=none;
        d=google.com; s=arc-20160816;
        b=hYmwAi7s2Lz8nxtAz7WdZSOEFf6Unjrpqx9e/ulKHt/nB/mffgLZ21p4K1lTRBz7hK
         K66PyEQO3iM66bG1IY0NxnnPyqyMNcWO69WDbTwHs9CRhczGeJd18utRb8+HhfCv70vP
         qEiEyI2HSL7X7WE4YOwcdsyUQ2YXCmjQB6s7AAncKLzIFlYbYuPFHkbM8AbqmI4XKKqi
         rc0Bt6P1qmh9MQfHj2YxI0rfZQJfP7V6xw5d40VKoPHPYf7/lhk77/ai7dF9Ior9PDnx
         +DpSggqbdY1y1RUOMFQ5Q02QaiVO2eFmKb+wYWzl8Ldnc9eFAYHPBY9Loxo5ZMfDZCEb
         HZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=4fs8KvYZd2EPWhY7oBoNE4KKq6heQVtmgKYYKziSFt4=;
        b=n22eBv9LGw0TUsk1PKkD+oFW+9p9oRelrpf9QWYv7picPU1WtwmcgYwhPAZ5bKPQmy
         LUyCnwcU7Vwff6Qz54N0Q6OZkF/1EUUUnNbA6mlarUT7Rp37J76T1CQC0cwlhf6yoVLN
         3VX3nQR4PBnyn+lmbtzkLiNGl4Ufb2+tKTxebt+cVYyDOnmqPkbW8VGAmphc1WvzFpM7
         FjyVOnh5VD/444RGcG0rSi+KpQn6hNodQyNeot6byrrpXPpZaU4cLzOBmoSgGgaFT7PD
         bIuN4QkNvn0s2efQ018FRekwdvwhsW69XwLk+jtT3t3PKx3Ctgp8GdxSvQTXP/9Ypl7m
         1eHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=QXcqFjQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r55si2067496qtc.252.2017.08.04.11.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 11:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=QXcqFjQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddh3E-0001sb-8C
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 14:10:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ddh2z-0001p8-E0
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 14:10:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ddh2x-0000PW-Mm
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 14:10:05 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:37463)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ddh2s-0000F1-OC; Fri, 04 Aug 2017 14:09:58 -0400
Received: by mail-qk0-x243.google.com with SMTP id x77so2238440qka.4;
	Fri, 04 Aug 2017 11:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=4fs8KvYZd2EPWhY7oBoNE4KKq6heQVtmgKYYKziSFt4=;
	b=QXcqFjQiiWAqfEtivk8FLY0dV2ChhzgE39LLjRSNoLNukuUW1HLNLbfLlEGTpthELF
	9WyBGUFf9PypxofX4FqbASfkPy+9GD2MEBtVGJFWHhHQSgFYJheReu1o+ghGrxI7FqGV
	Iwt7ZraW9zeANxq3CizCoYlq6opplqkU13Iwn+DP4OISFfc7lXLggZXnapoAqjFdJn1n
	CGXM5qm2LHa9G/aM6hvZZLZb+WtPyjxiZfKs6pjj6s3NqhK+BzpoKqXeau9EmwUmV2P2
	VcXZnv6/7sLsMndLSwR6+iTsH+LHSVut9MoWfSVpI6n087B0AMq/cnD43Ow+lue4C1g1
	NsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4fs8KvYZd2EPWhY7oBoNE4KKq6heQVtmgKYYKziSFt4=;
	b=MYVpQTdbbcrh/8Yxi7Ib846JhlIqko6ZpnUxlIKkElI/3utXQL746VlV2eEorfk9B/
	Vnd4KKjs52jnL1USav2EAIbL81Dsuz0UUtuUj3ljAzxbOOPQ5c9ufm0XJDuxY4fTjWUD
	GorP+KIDUiN2KX95MrTtDRcfB1E9lIeeBAXziTgsljFBlczBZUDWWB9epxOpw+LKOG+s
	0a6dhB1bDCnDMvZVYc7k11BD3FTJjBAL/P+XLGlOtCPTy3sKe/8QE+HSN0FEUyZMCdXh
	KLVuh5SxsNPVaIf0LssKcKUbvgVaGmhUL8qrnES1WMy45bQEUabrRe5Ujcw2RfpMQ8en
	2lbA==
X-Gm-Message-State: AHYfb5g1NMw9qRJ0k6+MeCug0b0h+R1fMPUUWCFXHoKvmPqe2z1t+s8t
	YjEsO6VpxhLZ1g==
X-Received: by 10.55.33.77 with SMTP id h74mr4494317qkh.353.1501870198151;
	Fri, 04 Aug 2017 11:09:58 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	b142sm1344655qka.37.2017.08.04.11.09.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 11:09:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-5-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <50d6ba4d-cfa3-5b5f-5da1-dca2326d4f5d@amsat.org>
Date: Fri, 4 Aug 2017 15:09:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501867249-1924-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 4/8] boards.h: Define new flag
 ignore_memory_transaction_failures
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
Cc: Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PbPwaurHQNMm

On 08/04/2017 02:20 PM, Peter Maydell wrote:
> Define a new MachineClass field ignore_memory_transaction_failures.
> If this is flag is true then the CPU will ignore memory transaction
> failures which should cause the CPU to take an exception due to an
> access to an unassigned physical address; the transaction will
> instead return zero (for a read) or be ignored (for a write).  This
> should be set only by legacy board models which rely on the old
> RAZ/WI behaviour for handling devices that QEMU does not yet model.
> New board models should instead use "unimplemented-device" for all
> memory ranges where the guest will attempt to probe for a device that
> QEMU doesn't implement and a stub device is required.

This is a very good idea. At least it will help understanding why not 
all firmwares compiled for the same board can boot.

Since create_unimplemented_device() register overlapped with low 
priority, why not register it as default device directly, over the whole 
address space?

> 
> We need this for ARM boards, where we're about to implement support for
> generating external aborts on memory transaction failures. Too many
> of our legacy board models rely on the RAZ/WI behaviour and we
> would break currently working guests when their "probe for device"
> code provoked an external abort rather than a RAZ.

I think some firmware will give some surprises, those probing device is 
not here and expect RAZ/WI. I remember some fw probing PCI space, or 
enumerating CS this way for ex.

RAZ/WI is a bus-feature, this is also bus-dependent to reply with abort 
or behave RAZ/WI. Maybe the effort should be done on how model/use buses 
in QEMU? Bus device would be an alias of unimplemented_device, which 
current purpose is more debugging than avoiding unassigned physical 
access aborts.

I'm pretty sure this library setup probes for unassigned access 
installing an handler and checking it got hit, in this case (ab)using 
unimplemented_device would prevent this firmware to boot:
http://www.ti.com/ww/en/functional_safety/safeti/index.html
(I might have self-answered my first question)

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/boards.h | 11 +++++++++++
>   include/qom/cpu.h   |  7 ++++++-
>   qom/cpu.c           |  7 +++++++
>   3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 3363dd1..7f044d1 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -131,6 +131,16 @@ typedef struct {
>    *    size than the target architecture's minimum. (Attempting to create
>    *    such a CPU will fail.) Note that changing this is a migration
>    *    compatibility break for the machine.
> + * @ignore_memory_transaction_failures:
> + *    If this is flag is true then the CPU will ignore memory transaction
> + *    failures which should cause the CPU to take an exception due to an
> + *    access to an unassigned physical address; the transaction will instead
> + *    return zero (for a read) or be ignored (for a write). This should be
> + *    set only by legacy board models which rely on the old RAZ/WI behaviour
> + *    for handling devices that QEMU does not yet model. New board models
> + *    should instead use "unimplemented-device" for all memory ranges where
> + *    the guest will attempt to probe for a device that QEMU doesn't
> + *    implement and a stub device is required.
>    */
>   struct MachineClass {
>       /*< private >*/
> @@ -171,6 +181,7 @@ struct MachineClass {
>       bool rom_file_has_mr;
>       int minimum_page_bits;
>       bool has_hotpluggable_cpus;
> +    bool ignore_memory_transaction_failures;
>       int numa_mem_align_shift;
>       void (*numa_auto_assign_ram)(MachineClass *mc, NodeInfo *nodes,
>                                    int nb_nodes, ram_addr_t size);
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index fc54d55..8cff86f 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -311,6 +311,9 @@ struct qemu_work_item;
>    * @trace_dstate_delayed: Delayed changes to trace_dstate (includes all changes
>    *                        to @trace_dstate).
>    * @trace_dstate: Dynamic tracing state of events for this vCPU (bitmask).
> + * @ignore_memory_transaction_failures: Cached copy of the MachineState
> + *    flag of the same name: allows the board to suppress calling of the
> + *    CPU do_transaction_failed hook function.
>    *
>    * State of one CPU core or thread.
>    */
> @@ -397,6 +400,8 @@ struct CPUState {
>        */
>       bool throttle_thread_scheduled;
>   
> +    bool ignore_memory_transaction_failures;
> +
>       /* Note that this is accessed at the start of every TB via a negative
>          offset from AREG0.  Leave this field at the end so as to make the
>          (absolute value) offset as small as possible.  This reduces code
> @@ -853,7 +858,7 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
>   {
>       CPUClass *cc = CPU_GET_CLASS(cpu);
>   
> -    if (cc->do_transaction_failed) {
> +    if (!cpu->ignore_memory_transaction_failures && cc->do_transaction_failed) {
>           cc->do_transaction_failed(cpu, physaddr, addr, size, access_type,
>                                     mmu_idx, attrs, response, retaddr);
>       }
> diff --git a/qom/cpu.c b/qom/cpu.c
> index 4f38db0..d8dcf64 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -29,6 +29,7 @@
>   #include "exec/cpu-common.h"
>   #include "qemu/error-report.h"
>   #include "sysemu/sysemu.h"
> +#include "hw/boards.h"
>   #include "hw/qdev-properties.h"
>   #include "trace-root.h"
>   
> @@ -360,6 +361,12 @@ static void cpu_common_parse_features(const char *typename, char *features,
>   static void cpu_common_realizefn(DeviceState *dev, Error **errp)
>   {
>       CPUState *cpu = CPU(dev);
> +    Object *machine = qdev_get_machine();
> +    ObjectClass *oc = object_get_class(machine);
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    cpu->ignore_memory_transaction_failures =
> +        mc->ignore_memory_transaction_failures;
>   
>       if (dev->hotplugged) {
>           cpu_synchronize_post_init(cpu);
> 
