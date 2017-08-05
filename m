Received: by 10.25.221.202 with SMTP id w71csp149030lfi;
        Fri, 4 Aug 2017 18:24:01 -0700 (PDT)
X-Received: by 10.200.52.212 with SMTP id x20mr6028690qtb.53.1501896241379;
        Fri, 04 Aug 2017 18:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501896241; cv=none;
        d=google.com; s=arc-20160816;
        b=aLcL2zlqPFVn5dYvKymfeEsPc2YCr+44SMOd2FY/kVwv3C60Q5vHKJIv763EpkCTmd
         Axjwmw0BR+bcMJVS8lf/eJBX9YiMRsr+IHcDeQV003ab671FFpBMD0OE30GY01wuxUSk
         PLb7IJ7LYvZBwETYNBTa7XLrCEv8/9r+KVvnMWJzwCMBXq2Huk61obgQayROF2IsUtGx
         hzN+A9SZ24gBQeW6MMp7XVXMM7X/NPn0tW11u9gESaocJsaBxenklUkjx48OEskS7fYp
         NsjcAfYS72RynhUQizLOwVoHVsF2ekLruz82EwynhYO2yxn+SQCsFJZSG7qIKRX03utW
         Ex/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=I1XEaGXDB74cbg1drjQ03i0670bAVsb1/miUC+sN3k0=;
        b=AE+oNoZ0weSpAOF782b0iSOhQd0JfyeXiJ24eXvfAwP+w+SV1qeMccC9a1gy42R6Ek
         S6FvKd5oGGWjiweMwqGlpoyWIoFvxv3fgt5UFNDpLZ1JAWYOR2Bx49V6P8ACyMxdCA3/
         UJVI98Rzq0luzxcFcQN3sK9EX2saK8Aq0dk8oeALYcD+GAKStsz0DOAuu6GcWuU9CrpB
         nuI5hA2ALtUx8Qj9Le4hWeS/tK2j76txCXMfk6nQqcD7BNf0Ul8Cm+2VwdDIrLjIOA3Z
         OjXPmPVHwMM+IHnZmvGsdRBiichDnqUsD9hKg/7l9rEuRxFoMngLp5rKB329ArTqZM5y
         C7uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=fNNaNkq3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si2600390qte.76.2017.08.04.18.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 18:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=fNNaNkq3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddnos-00069f-RF
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 21:23:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddnoj-00069S-B5
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddnog-0001Ij-Mn
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:23:49 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:34681)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddnog-0001H0-9d; Fri, 04 Aug 2017 21:23:46 -0400
Received: by mail-lf0-x241.google.com with SMTP id o85so2027689lff.1;
	Fri, 04 Aug 2017 18:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=I1XEaGXDB74cbg1drjQ03i0670bAVsb1/miUC+sN3k0=;
	b=fNNaNkq3oOfH40HCKGsmca1bgnDJdN54ttcWbgmopciC+4OIf1HHtVX1E4yjL+TcZj
	RsFbZX2Juwc9KfP6qyjxnDDNRfpUiklWy7aA+gs2sf7UPQOKYqUaYBjfzwKLnJpmdLNx
	zmACy8vOZHVyb7vsw4s10aa8pcVY3F1lEuBtr0nQWdvRag2RaazW0gGXLnhXbc3e/iAy
	UtD0Vq3+OyBbl5A4Mfp5zvOas3GKbHD1w4zlIq79UzMe7WT5Ggr/00Z29UoBbsO8r85g
	NYjCrK4guUR6XmtSmfBNhvlFycDnFDv8YFNRpoUJes9Ab3tE+BxWvxm8C5nsw4WFJpfc
	dXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=I1XEaGXDB74cbg1drjQ03i0670bAVsb1/miUC+sN3k0=;
	b=V3FXKJUlXdAYxaUj/93a3PzFS02hVbuSurE74yrR+vazw1Msax5Qc/QSLKS9+OZYEg
	++usWrZLcwKY2UZf86temDBrXrgI6lDts4O05z8jRvB8IUX7kt8+I2F6JzQB2wGj8eVa
	vvaH2K3ldCo9pWm5yQwE7zeVGqpCgPD9TJQA1XWUzCnJRpgclfMlzgLjBH0vT3g8JUNC
	k5jFVkwyjzf/wQSt3cr54ZUjmWCAf00/oiDUAz+VNEHU9F4pfctyt4pP19lDFnQl4QHR
	oE81Rgd4kldR8XA8ZzF+pzbFvPdwT3XPKb5DvuxCuiqAVBBymvLp0DKRJirZfmWcpUfW
	adhA==
X-Gm-Message-State: AHYfb5ifwtpXZNKZCVyZBOn2Df3ybS/QSSSDewPn6ifr3NoiE1FxER27
	0SasT3tlj5smvA==
X-Received: by 10.46.13.26 with SMTP id 26mr1335593ljn.117.1501896224788;
	Fri, 04 Aug 2017 18:23:44 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id r8sm787580lff.81.2017.08.04.18.23.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 18:23:43 -0700 (PDT)
Date: Sat, 5 Aug 2017 03:23:43 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170805012343.GC4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-5-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501867249-1924-5-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hpPpwdov7HMk

On Fri, Aug 04, 2017 at 06:20:45PM +0100, Peter Maydell wrote:
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
> 
> We need this for ARM boards, where we're about to implement support for
> generating external aborts on memory transaction failures. Too many
> of our legacy board models rely on the RAZ/WI behaviour and we
> would break currently working guests when their "probe for device"
> code provoked an external abort rather than a RAZ.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  include/hw/boards.h | 11 +++++++++++
>  include/qom/cpu.h   |  7 ++++++-
>  qom/cpu.c           |  7 +++++++
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 3363dd1..7f044d1 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -131,6 +131,16 @@ typedef struct {
>   *    size than the target architecture's minimum. (Attempting to create
>   *    such a CPU will fail.) Note that changing this is a migration
>   *    compatibility break for the machine.
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
>   */
>  struct MachineClass {
>      /*< private >*/
> @@ -171,6 +181,7 @@ struct MachineClass {
>      bool rom_file_has_mr;
>      int minimum_page_bits;
>      bool has_hotpluggable_cpus;
> +    bool ignore_memory_transaction_failures;
>      int numa_mem_align_shift;
>      void (*numa_auto_assign_ram)(MachineClass *mc, NodeInfo *nodes,
>                                   int nb_nodes, ram_addr_t size);
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index fc54d55..8cff86f 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -311,6 +311,9 @@ struct qemu_work_item;
>   * @trace_dstate_delayed: Delayed changes to trace_dstate (includes all changes
>   *                        to @trace_dstate).
>   * @trace_dstate: Dynamic tracing state of events for this vCPU (bitmask).
> + * @ignore_memory_transaction_failures: Cached copy of the MachineState
> + *    flag of the same name: allows the board to suppress calling of the
> + *    CPU do_transaction_failed hook function.
>   *
>   * State of one CPU core or thread.
>   */
> @@ -397,6 +400,8 @@ struct CPUState {
>       */
>      bool throttle_thread_scheduled;
>  
> +    bool ignore_memory_transaction_failures;
> +
>      /* Note that this is accessed at the start of every TB via a negative
>         offset from AREG0.  Leave this field at the end so as to make the
>         (absolute value) offset as small as possible.  This reduces code
> @@ -853,7 +858,7 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
>  {
>      CPUClass *cc = CPU_GET_CLASS(cpu);
>  
> -    if (cc->do_transaction_failed) {
> +    if (!cpu->ignore_memory_transaction_failures && cc->do_transaction_failed) {
>          cc->do_transaction_failed(cpu, physaddr, addr, size, access_type,
>                                    mmu_idx, attrs, response, retaddr);
>      }
> diff --git a/qom/cpu.c b/qom/cpu.c
> index 4f38db0..d8dcf64 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -29,6 +29,7 @@
>  #include "exec/cpu-common.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/boards.h"
>  #include "hw/qdev-properties.h"
>  #include "trace-root.h"
>  
> @@ -360,6 +361,12 @@ static void cpu_common_parse_features(const char *typename, char *features,
>  static void cpu_common_realizefn(DeviceState *dev, Error **errp)
>  {
>      CPUState *cpu = CPU(dev);
> +    Object *machine = qdev_get_machine();
> +    ObjectClass *oc = object_get_class(machine);
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    cpu->ignore_memory_transaction_failures =
> +        mc->ignore_memory_transaction_failures;
>  
>      if (dev->hotplugged) {
>          cpu_synchronize_post_init(cpu);
> -- 
> 2.7.4
> 
> 
