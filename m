Received: by 10.25.27.66 with SMTP id b63csp1780530lfb;
        Mon, 6 Jun 2016 19:37:01 -0700 (PDT)
X-Received: by 10.55.104.68 with SMTP id d65mr19475355qkc.190.1465267021181;
        Mon, 06 Jun 2016 19:37:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g80si13869119qhc.116.2016.06.06.19.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 19:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bA6t2-0000Nf-Ia
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 22:37:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA6sy-0000Mj-KC
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 22:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA6sx-0000eV-Kw
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 22:36:56 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:23745)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bA6so-0000bp-6x; Mon, 06 Jun 2016 22:36:46 -0400
Received: from 172.24.1.47 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DIH53434; Tue, 07 Jun 2016 10:32:42 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.235.1; Tue, 7 Jun 2016
	10:32:32 +0800
Message-ID: <57563239.5020805@huawei.com>
Date: Tue, 7 Jun 2016 10:32:25 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1461670846-13196-1-git-send-email-zhaoshenglong@huawei.com>
	<1461670846-13196-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA_jUC92Y3Ne4k+9vo2iQuFiJqgE_Cfth_GZCzeBAyMcJw@mail.gmail.com>
In-Reply-To: <CAFEAcA_jUC92Y3Ne4k+9vo2iQuFiJqgE_Cfth_GZCzeBAyMcJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.57563250.0013, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 07dc203bbe2e68fd543e52243c22f555
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-arm] [PATCH v4 2/3] hw/arm/virt: Add PMU node for virt
 machine
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HwB9wMC5nr2J



On 2016/6/6 23:59, Peter Maydell wrote:
> On 26 April 2016 at 12:40, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> >
>> > Add a virtual PMU device for virt machine while use PPI 7 for PMU
>> > overflow interrupt number.
>> >
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > diff --git a/stubs/kvm.c b/stubs/kvm.c
>> > index ddd6204..667e269 100644
>> > --- a/stubs/kvm.c
>> > +++ b/stubs/kvm.c
>> > @@ -6,3 +6,8 @@ int kvm_arch_irqchip_create(MachineState *ms, KVMState *s)
>> >  {
>> >      return 0;
>> >  }
>> > +
>> > +int kvm_arm_pmu_create(CPUState *cs, int irq)
>> > +{
>> > +    return 0;
>> > +}
> Hi. I'm afraid this breaks compilation on 32-bit ARM hosts:
> for 32-bit ARM we don't have a real kvm_arm_pmu_create() so we
> end up pulling in the stubs/kvm.o object file from the stub
> library. Unfortunately that then means we have two versions of
> kvm_arch_irqchip_create() and the linker refuses to link.
> 
Oops, I'll fix this and resend.

-- 
Shannon

