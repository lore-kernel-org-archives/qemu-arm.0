Received: by 10.25.208.211 with SMTP id h202csp438944lfg;
        Sat, 27 Feb 2016 14:02:27 -0800 (PST)
X-Received: by 10.140.175.134 with SMTP id v128mr10987490qhv.61.1456610546968;
        Sat, 27 Feb 2016 14:02:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x198si19289483qka.46.2016.02.27.14.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Feb 2016 14:02:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56493 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZmwU-0004O7-Cm
	for alex.bennee@linaro.org; Sat, 27 Feb 2016 17:02:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZmwO-0004N0-8m
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 17:02:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZmwM-0003QH-R3
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 17:02:19 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:33195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aZmwM-0003QD-GS; Sat, 27 Feb 2016 17:02:18 -0500
Received: by mail-wm0-x22a.google.com with SMTP id w11so1398717wmd.0;
	Sat, 27 Feb 2016 14:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=oYO+ahOB1O2szUZr5q0m0GDuQaGGVIrLeJLvsn3ua74=;
	b=zoukncKhEQo5X5iyhJaXacxjXOYPrQ1DKIviNLrEicbcz71OOzU/Ch24RCYVmQYOW9
	nu9Di/s+VXtldTKNmuk5H3zLXUmw6FEXp6OjpLcsWYtGuH/hw4JCBIJa8ayOT4kZYydj
	SwD5sMMOojGYSpBIP8+h6aC1Od4T2JTY2HwDN/x0rEiFLSx7WgVjLAtxnILpCc/N8vcS
	yfYpSM5shNkFGxw5PkBuLxAD8dZOvjS2rhzHhgawuUGz2SMBGi32K6KG1x8Y/sHAh6dL
	nI/64YGRNvtyb7Dxh2166r3WpPaxPhTQdshAiPLiKHMtk2R8iK0WWEulvYd19Ex+PSSU
	pnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=oYO+ahOB1O2szUZr5q0m0GDuQaGGVIrLeJLvsn3ua74=;
	b=ZrpOn2Rd4FL3EJ4xC3P5r/CjPf9qOmbsZ6KbyLJ05CNfOu5xZNU+zvIIy9XG6FYdys
	EReOQd9jiNms3m8oY4wTd6nl3K0zfzg2ryhnFFq8rXdLA80C9rOBLQwq9oo5wXOk3p72
	BnrlEoh1gT9jfI6novqFDNi7s66neIQXXNDv7GBTGpZG8jT2BLE+mJx7PoPCODMfbdgj
	g+Cp3y/Hh6//iW0mU0tH8OnZEI78rQdULPJYso2SvRQyWcn8EFseA9Y1eN5lmfREGx44
	XkSARhPi0XjG/lFAqVHkZcmuFyPrjcpB/nAGm9JAOnca6gkhG99rJuSAwJ5C61UklRfz
	RYOA==
X-Gm-Message-State: AD7BkJI1pZ9fMAEfLpga+XiyoeQxnz9SBuItZKfFmN5sTf+NpGXPcPYW1cOgWMz42NjhpWfA0GdSs9DHRuU85Q==
MIME-Version: 1.0
X-Received: by 10.194.76.161 with SMTP id l1mr7670411wjw.108.1456610537771;
	Sat, 27 Feb 2016 14:02:17 -0800 (PST)
Received: by 10.28.31.12 with HTTP; Sat, 27 Feb 2016 14:02:17 -0800 (PST)
In-Reply-To: <CAFEAcA8bdJpX0-MYAbhjVqM=2axSiLEvVBGEsern3SUoJU58OA@mail.gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<2d20fa6a88faf2b99719ac90c9205e280e632634.1453100525.git.crosthwaite.peter@gmail.com>
	<CAFEAcA8bdJpX0-MYAbhjVqM=2axSiLEvVBGEsern3SUoJU58OA@mail.gmail.com>
Date: Sat, 27 Feb 2016 14:02:17 -0800
Message-ID: <CAPokK=rOqAcfq7dsx_+4z=0BzLzsiKTxiCU-ETx1twotUfQuYA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 08/17] target-arm: cpu: Move
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
X-TUID: ncZyUAKi34ps

On Tue, Jan 19, 2016 at 8:11 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 January 2016 at 07:12, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>
>> There is a CPU data endianness test that is used to drive the
>> virtio_big_endian test.
>>
>> Move this up to the header so it can be more generally used for endian
>> tests. The KVM specific cpu_syncronize_state call is left behind in the
>> virtio specific function.
>>
>> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>> ---
>>
>>  target-arm/cpu.c | 19 +++----------------
>>  target-arm/cpu.h | 19 +++++++++++++++++++
>>  2 files changed, 22 insertions(+), 16 deletions(-)
>>
>> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
>> index 35a1f12..d3b73bf 100644
>> --- a/target-arm/cpu.c
>> +++ b/target-arm/cpu.c
>> @@ -368,26 +368,13 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
>>  #endif
>>  }
>>
>> -static bool arm_cpu_is_big_endian(CPUState *cs)
>> +static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
>>  {
>>      ARMCPU *cpu = ARM_CPU(cs);
>>      CPUARMState *env = &cpu->env;
>> -    int cur_el;
>>
>>      cpu_synchronize_state(cs);
>> -
>> -    /* In 32bit guest endianness is determined by looking at CPSR's E bit */
>> -    if (!is_a64(env)) {
>> -        return (env->uncached_cpsr & CPSR_E) ? 1 : 0;
>> -    }
>> -
>> -    cur_el = arm_current_el(env);
>> -
>> -    if (cur_el == 0) {
>> -        return (env->cp15.sctlr_el[1] & SCTLR_E0E) != 0;
>> -    }
>> -
>> -    return (env->cp15.sctlr_el[cur_el] & SCTLR_EE) != 0;
>> +    return arm_cpu_is_big_endian(env);
>>  }
>>
>>  #endif
>> @@ -1420,7 +1407,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->do_unaligned_access = arm_cpu_do_unaligned_access;
>>      cc->get_phys_page_debug = arm_cpu_get_phys_page_debug;
>>      cc->vmsd = &vmstate_arm_cpu;
>> -    cc->virtio_is_big_endian = arm_cpu_is_big_endian;
>> +    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
>>  #endif
>>      cc->gdb_num_core_regs = 26;
>>      cc->gdb_core_xml_file = "arm-core.xml";
>> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
>> index f83070a..54675c7 100644
>> --- a/target-arm/cpu.h
>> +++ b/target-arm/cpu.h
>> @@ -1795,6 +1795,25 @@ static inline bool arm_singlestep_active(CPUARMState *env)
>>          && arm_generate_debug_exceptions(env);
>>  }
>>
>> +/* Return true if the processor is in big-endian mode. */
>> +static bool arm_cpu_is_big_endian(CPUARMState *env)
>> +{
>
> No problems code-wise, but can we call the function
> arm_cpu_data_is_big_endian() or something?

Fixed.

Regards,
Peter

> This is returning the
> endianness to use for data accesses; there isn't an overall
> "big-endian mode" that affects everything except for the
> obsolete BE32.
>
> thanks
> -- PMM
