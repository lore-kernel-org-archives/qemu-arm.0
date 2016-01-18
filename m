Received: by 10.25.159.19 with SMTP id i19csp2150110lfe;
        Mon, 18 Jan 2016 13:53:08 -0800 (PST)
X-Received: by 10.55.21.163 with SMTP id 35mr35096120qkv.45.1453153988050;
        Mon, 18 Jan 2016 13:53:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a126si33174028qkb.100.2016.01.18.13.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 13:53:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:33850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLHjX-00054h-Ka
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 16:53:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aLHjV-00051u-Ak
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 16:53:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aLHjU-0006xJ-CL
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 16:53:05 -0500
Received: from mail-ob0-x242.google.com ([2607:f8b0:4003:c01::242]:35621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aLHjS-0006w5-17; Mon, 18 Jan 2016 16:53:02 -0500
Received: by mail-ob0-x242.google.com with SMTP id tr5so40154264obc.2;
	Mon, 18 Jan 2016 13:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=4NXcM6MA/5nZhwfQny/STp/abUIWqxwobBh13h3/c10=;
	b=ypMrUiG0eMCbuNsL2CzZclc8ZjN3Bkq2REzidlmPzX1F7jKqN0VLVUVKyKNbr+UoBZ
	Nl/5CdhZzh2z1LRHQaZCjMVm2agFDb87yNEXyCqkDcGwq7ncRx9SW3FeWabWvA9sDvLm
	SJQy4K2wGs4Tok1LtTgBH6Z19pO8hPvVq/UT6Nd591QLdmWrUnu5SEfbLQf4x/d7b163
	S5gV2n4A1rjQd1xA+zai/zizBt2g/HYx1nhUncYyvoP8cdB8wj2mfmKtAiZcJjO1jdvk
	JHY02Yf4xv1Qr6FrlIt+H8CidHa5Aodl5mja3AZ2BUMkCt9JUWDqWFqdV1adKUgL3stE
	q9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=4NXcM6MA/5nZhwfQny/STp/abUIWqxwobBh13h3/c10=;
	b=dEBheT9scGRgehONhYAOp+kCAsbIPIU0fTlCBLHAZ8K2VXB71d6UQCv+O0iX65yw/o
	4NYyveMoN4TkJlrw18ENSJ8Fhj1A2DR0HXDMyXrzv5Fv67bIfSZ6ixViqyoI6z1YLMR4
	aLLaj8n8Q3WVlxgbZ+9zLJc8e1+Bx0pNiu837f0/dIONRyDvw2god8eRKG80Y3K05RLk
	zQHNocRUcH/G31VTEovMPgHfO1Jk/cKa9ebsqZuak500f9Lw+ibECVqe9iYcemx02ATH
	O0Yv4NY57hsaQC5TYXrtn/WJx9Vzkz8/nKLCLvAxrwFJPgSSCOhDHblawkwirEy59mYH
	hfJg==
X-Gm-Message-State: AG10YORqdmoAnaEkMyxT8xkdt9Loai3gMVpL7zBeC3+Zp8EAUpK4Px8vmfh+TtFgSE9+sG1vwv61p6mXDI3gPA==
X-Received: by 10.182.91.38 with SMTP id cb6mr1044881obb.27.1453153981363;
	Mon, 18 Jan 2016 13:53:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Mon, 18 Jan 2016 13:52:31 -0800 (PST)
In-Reply-To: <2d20fa6a88faf2b99719ac90c9205e280e632634.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<2d20fa6a88faf2b99719ac90c9205e280e632634.1453100525.git.crosthwaite.peter@gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 18 Jan 2016 13:52:31 -0800
X-Google-Sender-Auth: XHqzVLy9_fsyEiaDRT9-1EQaz1I
Message-ID: <CAKmqyKNyEH+A=q0-ntESnK1eVO3in9tQR4PSTgfbrhnKTgmHdw@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar_kulk@yahoo.com, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, piotr.krol@3mdeb.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 08/17] target-arm: cpu: Move
 cpu_is_big_endian to header
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
X-TUID: me9bAY0XCRwq

On Sun, Jan 17, 2016 at 11:12 PM, Peter Crosthwaite
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

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Also, I'm not too sure what the appropriate action is here, but this
is still signed off by your Xilinx address.

Thanks,

Alistair

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
> +    int cur_el;
> +
> +    /* In 32bit endianness is determined by looking at CPSR's E bit */
> +    if (!is_a64(env)) {
> +        return (env->uncached_cpsr & CPSR_E) ? 1 : 0;
> +    }
> +
> +    cur_el = arm_current_el(env);
> +
> +    if (cur_el == 0) {
> +        return (env->cp15.sctlr_el[1] & SCTLR_E0E) != 0;
> +    }
> +
> +    return (env->cp15.sctlr_el[cur_el] & SCTLR_EE) != 0;
> +}
> +
>  #include "exec/cpu-all.h"
>
>  /* Bit usage in the TB flags field: bit 31 indicates whether we are
> --
> 1.9.1
>
>
