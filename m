Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1080888wrt;
        Thu, 4 Oct 2018 09:11:07 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61JV6L9kzGhPigWvjCQ98s6mWUGJ8KYgrwVkW0NfTZ3zlIwcMyS07WQBQfozHQHY3wzthht
X-Received: by 2002:a0c:e8c6:: with SMTP id m6-v6mr6056558qvo.131.1538669467225;
        Thu, 04 Oct 2018 09:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538669467; cv=none;
        d=google.com; s=arc-20160816;
        b=eo6nmlf8cNSqBt9h+lhFka8OaVqx5k+tL9FfAk8Uncyjfu0qJiRNw9DX9XGWIQqAjI
         6Fm2CXvdOGC4aHxLrVLM8J3IFxRkRhyqo1ioZr8CCyCh5uXeQInj0mKplaiughsl7aKP
         5YaYzNYEZKS+XaWZqtZRtGdWGgy8u2iscPsKCDkp6o5J3wUeZgrxBS012lBWborJ44Cb
         Tflt249pldAL4uU57cK6J4ztgs30BFnkVVp7CICQVN07x9s1IT7n6fjnIzzfWAx7UVtU
         DDpcQ1ahpZhpWQe6c7VeQdhK8dfbcCdPfGyy3En0GlbKsr1EA+5J7dXyYJBXHWbTrvTg
         S8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=VZ8d84DiQkgkIkqCjNPcrVmKxuqgjfb9GYF79YzRl9E=;
        b=oz82GOprFPgb/f0K8obCzJiBDH63JYTUz0UddGaKUyU8zgnD/ACkgusCdu8VF1wdgw
         vjzpLQXnf353Y3SOHbdMQW9KSEEghHaNE5YV9OVWJ0VsrowO/R/pqA9YCYtLBL/eUDdX
         LkCRHMIrlrJhc37yJ5g/QnyvIieaZmLC19GaQHWhBfQBZtWs4P/zB2/zbq2qOTmf1kjY
         BngRhFme5BuPCf+BIHSoyDegiVZokRwqfgLKuIRa5auFUiBxmZxDffQiUsCWBBPGe7Pa
         Zv+hskqcp4qFAk20DWuOlhd1tQBg0t4lt0kY3PAjuBjKro93vjhC7UOoHfegv5UFyhLg
         7F4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u14-v6si3106583qvo.1.2018.10.04.09.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 09:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g86DS-00081X-KB
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 12:11:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g86Ce-0007Lh-Pw
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 12:10:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g86AI-0006Zp-5h
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 12:07:54 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g86AH-0006UG-0v
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 12:07:50 -0400
Received: by mail-wm1-f68.google.com with SMTP id 185-v6so9639055wmt.2
	for <qemu-arm@nongnu.org>; Thu, 04 Oct 2018 09:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VZ8d84DiQkgkIkqCjNPcrVmKxuqgjfb9GYF79YzRl9E=;
	b=O8f6ZV65zK/Vf1mPKAo+6LKBU1IgymVE37o8BX3KnRegi5qeMOwNS4QQm9cKcIOSBK
	yzk51IiSZyN85CEqMTdZSTTSaYZEW+pQycStSSlN7GMrPw+uyYVTZhvViXhE8KPzvgee
	I2j/YYzrc65Ul4J6/9O5hK5xeg1/NI7NTMOJ7PSX15GlcTJ5bLjLZ5vgvdBaz/FT46jZ
	j+6jQRpx5SYortdHdQwuUFV6Kr3whjEVh6JwBYqmq0dhZu3wmwrOKJ616zAAEkAq5NYn
	EybuTiHH16VF5mRPMCIzWMAl+vkjrhXBmJWRFYOtyu5xs7wyEIATv4mVUtkPiSWuKo8k
	EIcA==
X-Gm-Message-State: ABuFfoi5TsVIIR5p1HPMSGZNJap//VpqmzIxacM7eUoBTwZkb1VdT6r/
	jOaaMCR7b/jFx70vWOXFY4721TN509w=
X-Received: by 2002:a1c:f611:: with SMTP id
	w17-v6mr5307369wmc.143.1538669267332; 
	Thu, 04 Oct 2018 09:07:47 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	t2-v6sm5566023wre.96.2018.10.04.09.07.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 09:07:46 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-16-luc.michel@greensocs.com>
	<35ffbd68-f783-b6f4-18a2-dd995819c046@redhat.com>
	<CAFEAcA9vHi=qrV-Aj5ptgBQntafLGwL6VezxnmOuuR=6=Pr8cA@mail.gmail.com>
	<33c3ea72-652a-53b2-4865-830f3d7f2c3a@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3d459f14-b701-02b6-d231-fc48c509640f@redhat.com>
Date: Thu, 4 Oct 2018 18:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <33c3ea72-652a-53b2-4865-830f3d7f2c3a@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 15/15] arm/xlnx-zynqmp: put
 APUs and RPUs in separate GDB groups
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zbwm9ivnoCin

On 03/10/2018 13:44, Luc Michel wrote:
> On 10/2/18 1:58 PM, Peter Maydell wrote:
>> On 2 October 2018 at 12:33, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>> Cc'ing more QOM involved people.
>>>
>>> On 01/10/2018 13:57, Luc Michel wrote:
>>>> Create two separate QOM containers for APUs and RPUs to indicate to the
>>>> GDB stub that those CPUs should be put in different processes.
>>>>
>>>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>>>> ---
>>>>  hw/arm/xlnx-zynqmp.c | 7 +++++--
>>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>>>> index c195040350..5e92adbc71 100644
>>>> --- a/hw/arm/xlnx-zynqmp.c
>>>> +++ b/hw/arm/xlnx-zynqmp.c
>>>> @@ -22,10 +22,11 @@
>>>>  #include "hw/arm/xlnx-zynqmp.h"
>>>>  #include "hw/intc/arm_gic_common.h"
>>>>  #include "exec/address-spaces.h"
>>>>  #include "sysemu/kvm.h"
>>>>  #include "kvm_arm.h"
>>>> +#include "exec/gdbstub.h"
>>>>
>>>>  #define GIC_NUM_SPI_INTR 160
>>>>
>>>>  #define ARM_PHYS_TIMER_PPI  30
>>>>  #define ARM_VIRT_TIMER_PPI  27
>>>> @@ -175,17 +176,18 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>>>>                                     Error **errp)
>>>>  {
>>>>      Error *err = NULL;
>>>>      int i;
>>>>      int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
>>>> +    Object *rpu_group = gdb_cpu_group_container_get(OBJECT(s));
>>>
>>> I'd rather keep this generic: not involve 'gdb' container name.
>>
>> Yes, I agree. We should structure how we construct our
>> model to follow what the hardware has (two CPU clusters
>> with 4 cores each), and then the gdb code should introspect
>> the system later to decide how it exposes things to the gdb
>> user. GDB specifics should (as far as possible) be kept out
>> of the board code.
>>
>> The fact that there are two clusters here also
>> affects other things, like whether they have the
>> same view of memory, whether they can share translated
>> code (they shouldn't but do at the moment), and so on --
>> it's not just a GDB-relevant distinction. So we should
>> be modelling it somehow, definitely. I don't have a clear
>> view how just yet.
> 
> So for now, maybe it's better to rely on an heuristic such as the one
> suggested by Philippe in the gdb code to group the CPUs. Once QEMU gains
> more supports for such heterogeneous architectures, we can remove the
> heuristic and put the proper QOM introspection code instead.

I'm not sure this is the best approach, just suggested because using
object_resolve_path_type("", TYPE_CPU, NULL) seemed to me the
quicker/easiest approach.

Eduardo: Do you have other thoughts on how to resolve those generic
containers, without involving any gdb-specific tag?

>> This probably ties into the stuff I have somewhere on
>> my todo list about supporting multiple heterogenous
>> systems. The problem with this xilinx board is that it
>> is trying to model that kind of system but we don't actually
>> properly support that in QEMU yet.
>>
>> thanks
>> -- PMM
>>
