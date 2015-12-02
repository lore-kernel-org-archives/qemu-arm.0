Received: by 10.182.158.201 with SMTP id ww9csp3389103obb;
        Wed, 2 Dec 2015 15:19:22 -0800 (PST)
X-Received: by 10.140.100.175 with SMTP id s44mr7471231qge.47.1449098362126;
        Wed, 02 Dec 2015 15:19:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si5912334qku.54.2015.12.02.15.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 15:19:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4GgD-0007w9-SA
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 18:19:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GgC-0007vR-17
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:19:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Gg8-0000mM-TB
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:19:20 -0500
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:34309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Gg8-0000ll-Oz; Wed, 02 Dec 2015 18:19:16 -0500
Received: by qkfo3 with SMTP id o3so23315717qkf.1;
	Wed, 02 Dec 2015 15:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=SFtEh4JomvnAYnW9f7Q8w6DHFQU/cZ+PUFfaqEcseTw=;
	b=IxrEEEBbEW05tVLpdxdmf9kLU4sqvQ9Mnp+jxkBFNWFq7ImyKcnEVnAlZLpmCoRxjC
	d0Mc/H2Yp8DQvVFTRO6scLEuW9xwchhZeBX7+kKFYnLqCHq8mZqPJnXxzKYvqRwsVYZr
	8ZfTnmFdkv/1n9DLcctVhnd2aqfxMFvq/K2RNqrrLqRHr0+JqubySbNo58vCXMCjBFoA
	8qs5CjURF1Sz1TM1WKKxCeng32JlgL7eg7p9lg765b/5CLRpzT5svmV+/2EDzWOaIMOx
	RzixWu/OIsGmUlKLbpJl4nGx+tFMZUk+ObGY5wuJ/3Uv1H9W0To6pmNgvgTLsY3VgZd3
	Ecew==
X-Received: by 10.55.76.137 with SMTP id z131mr7105131qka.29.1449098356348;
	Wed, 02 Dec 2015 15:19:16 -0800 (PST)
Received: from [10.142.1.2] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	s105sm2165505qge.40.2015.12.02.15.19.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Dec 2015 15:19:15 -0800 (PST)
Message-ID: <565F7C73.7040908@gmail.com>
Date: Wed, 02 Dec 2015 18:19:15 -0500
From: Michael Davidsaver <mdavidsaver@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-10-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA8j68GOjXMpw86MEcCLxqtvenhJq85ZoWUSnOggTgYs9Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8j68GOjXMpw86MEcCLxqtvenhJq85ZoWUSnOggTgYs9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::231
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 09/18] armv7m: NVIC update vmstate
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
X-TUID: y5V2G/JlzRT1



On 11/17/2015 12:58 PM, Peter Maydell wrote:
> On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>> ---
>>  hw/intc/armv7m_nvic.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 62 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>> index 3b10dee..c860b36 100644
>> --- a/hw/intc/armv7m_nvic.c
>> +++ b/hw/intc/armv7m_nvic.c
>> @@ -810,15 +810,75 @@ static const MemoryRegionOps nvic_sysreg_ops = {
>>      .endianness = DEVICE_NATIVE_ENDIAN,
>>  };
>>
>> +static
>> +int nvic_post_load(void *opaque, int version_id)
>> +{
>> +    nvic_state *s = opaque;
>> +    unsigned i;
>> +
>> +    /* evil hack to get ARMCPU* ahead of time */
>> +    assert(cpus.tqh_first);
>> +    assert(!CPU_NEXT(cpus.tqh_first));
>> +    s->cpu = ARM_CPU(cpus.tqh_first);
>> +    assert(s->cpu);
> 
> Why do we need to do this? By the time we get to loading
> state into the system, s->cpu should already have been set.

Just so, removed.

>> +
>> +    /* recalculate priorities */
>> +    for (i = 4; i < s->num_irq; i++) {
>> +        set_prio(s, i, s->vectors[i].raw_prio);
>> +    }
>> +
>> +    nvic_irq_update(s, highest_runnable_prio(s->cpu));
>> +
>> +    return 0;
>> +}
>> +
>> +static
>> +int vec_info_get(QEMUFile *f, void *pv, size_t size)
>> +{
>> +    vec_info *I = pv;
>> +    I->prio_sub = qemu_get_be16(f);
>> +    I->prio_group = qemu_get_byte(f);
>> +    I->raw_prio = qemu_get_ubyte(f);
>> +    I->enabled = qemu_get_ubyte(f);
>> +    I->pending = qemu_get_ubyte(f);
>> +    I->active = qemu_get_ubyte(f);
>> +    I->level = qemu_get_ubyte(f);
>> +    return 0;
>> +}
>> +
>> +static
>> +void vec_info_put(QEMUFile *f, void *pv, size_t size)
>> +{
>> +    vec_info *I = pv;
>> +    qemu_put_be16(f, I->prio_sub);
>> +    qemu_put_byte(f, I->prio_group);
>> +    qemu_put_ubyte(f, I->raw_prio);
>> +    qemu_put_ubyte(f, I->enabled);
>> +    qemu_put_ubyte(f, I->pending);
>> +    qemu_put_ubyte(f, I->active);
>> +    qemu_put_ubyte(f, I->level);
>> +}
>> +
>> +static const VMStateInfo vmstate_info = {
>> +    .name = "armv7m_nvic_info",
>> +    .get = vec_info_get,
>> +    .put = vec_info_put,
>> +};
> 
> I don't think there's any need to use get and put functions here:
> better to define a VMStateDescripton for the struct vec_info,
> and then you can just refer to that from the main vmstate_nvic
> description. (hw/audio/pl041.c has some examples of this.)

Fixed

>> +
>>  static const VMStateDescription vmstate_nvic = {
>>      .name = "armv7m_nvic",
>> -    .version_id = 1,
>> -    .minimum_version_id = 1,
>> +    .version_id = 2,
>> +    .minimum_version_id = 2,
>> +    .post_load = &nvic_post_load,
>>      .fields = (VMStateField[]) {
>> +        VMSTATE_ARRAY(vectors, nvic_state, NVIC_MAX_VECTORS, 0,
>> +                      vmstate_info, vec_info),
>> +        VMSTATE_UINT8(prigroup, nvic_state),
>>          VMSTATE_UINT32(systick.control, nvic_state),
>>          VMSTATE_UINT32(systick.reload, nvic_state),
>>          VMSTATE_INT64(systick.tick, nvic_state),
>>          VMSTATE_TIMER_PTR(systick.timer, nvic_state),
>> +        VMSTATE_UINT32(num_irq, nvic_state),
>>          VMSTATE_END_OF_LIST()
>>      }
>>  };
> 
> Ideally the VMState should be added in the same patches that
> add new fields or structures, rather than in its own patch
> at the end.

I'll try to do this.
