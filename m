Received: by 10.25.150.194 with SMTP id y185csp1388823lfd;
        Fri, 11 Nov 2016 07:19:41 -0800 (PST)
X-Received: by 10.194.177.197 with SMTP id cs5mr11501030wjc.6.1478877581306;
        Fri, 11 Nov 2016 07:19:41 -0800 (PST)
Return-Path: <andre.przywara@arm.com>
Received: from cam-admin0.cambridge.arm.com (cam-admin0.cambridge.arm.com. [217.140.96.50])
        by mx.google.com with ESMTP id b125si11436783wmd.55.2016.11.11.07.19.41;
        Fri, 11 Nov 2016 07:19:41 -0800 (PST)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) client-ip=217.140.96.50;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) smtp.mailfrom=andre.przywara@arm.com
Received: from [192.168.67.35] ([10.1.207.46])
	by cam-admin0.cambridge.arm.com (8.12.6/8.12.6) with ESMTP id uABFJeWr026643;
	Fri, 11 Nov 2016 15:19:40 GMT
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v5 10/11] arm/arm64: gicv3:
 add an IPI test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
   Andrew Jones <drjones@redhat.com>
References: <1478798481-25030-1-git-send-email-drjones@redhat.com>
 <1478798481-25030-11-git-send-email-drjones@redhat.com>
 <874m3f8621.fsf@linaro.org>
 <20161110203713.4idzgs5u2xm7ms4o@hawk.localdomain>
 <871syi8hbg.fsf@linaro.org>
 <20161111135421.5oxdkfqynkgipgom@hawk.localdomain>
 <87twbe6pah.fsf@linaro.org>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
   qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
   pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu,
   christoffer.dall@linaro.org
From: Andre Przywara <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <a29368b3-d17c-8696-8d72-6ea31eea63be@arm.com>
Date: Fri, 11 Nov 2016 15:20:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <87twbe6pah.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: DtWVIY7aZ8Tm

Hi,

On 11/11/16 14:53, Alex Bennée wrote:
> 
> Andrew Jones <drjones@redhat.com> writes:
> 
>> On Fri, Nov 11, 2016 at 10:02:59AM +0000, Alex Bennée wrote:
>>>
>>> Andrew Jones <drjones@redhat.com> writes:
>>>
>>>> On Thu, Nov 10, 2016 at 07:53:58PM +0000, Alex Bennée wrote:
>>>> [...]
>>>>>> +struct gic gicv2 = {
>>>>>> +	.ipi = {
>>>>>> +		.enable = gicv2_enable_defaults,
>>>>>> +		.send_self = gicv2_ipi_send_self,
>>>>>> +		.send_tlist = gicv2_ipi_send_tlist,
>>>>>> +		.send_broadcast = gicv2_ipi_send_broadcast,
>>>>>> +	},
>>>>>> +	.read_iar = gicv2_read_iar,
>>>>>> +	.irqnr = gicv2_irqnr,
>>>>>> +	.write_eoi = gicv2_write_eoi,
>>>>>> +};
>>>>>> +
>>>>>> +struct gic gicv3 = {
>>>>>> +	.ipi = {
>>>>>> +		.enable = gicv3_enable_defaults,
>>>>>> +		.send_self = gicv3_ipi_send_self,
>>>>>> +		.send_tlist = gicv3_ipi_send_tlist,
>>>>>> +		.send_broadcast = gicv3_ipi_send_broadcast,
>>>>>> +	},
>>>>>> +	.read_iar = gicv3_read_iar,
>>>>>> +	.irqnr = gicv3_irqnr,
>>>>>> +	.write_eoi = gicv3_write_eoir,
>>>>>> +};
>>>>>> +
>>>>>
>>>>> So I was re-basing my kvm-unit-tests against your GIC rework and found
>>>>> myself copy and pasting a bunch of this into my tests that fire IRQs.
>>>>> That makes me think the abstraction should be in the library code so
>>>>> other tests can fiddle with sending IRQs.
>>>>>
>>>>> What do you think?
>>>>>
>>>>
>>>> I guess you mean moving the above two structs and their corresponding
>>>> functions (all which aren't already common) to lib/arm/ ? Or do you
>>>> just mean the one non-trivial function gicv3_ipi_send_tlist? I think
>>>> agree with gicv3_ipi_send_tlist getting shared, but the others are
>>>> mostly one-liners, so I'm not sure. I guess I'd have to see how you're
>>>> using them first.
>>>
>>> So it looked like there were some functions in the common code for one
>>> GIC which had local test defined functions for the other. They should at
>>> least be consistent.
>>
>> gicv3_read_iar and gicv3_write_eoir being common already is a product of
>> being sysreg wrappers, allowing for both arm32 and arm64 to use functions
>> of the same names, not because I wanted gicv3 to be inconsistent with
>> gicv2 (which uses MMIO and thus doesn't need wrappers)
>>
>>>
>>> For my use case I could do with a common:
>>>
>>>   gic_enable
>>
>> OK, I can extend gic_init() to initialize a 'struct gic_common_ops' that
>> includes an enable -> *_enable_defaults(void), ipi_send(int cpu),
>> read_iar(void), iar_irqnr(u32 iar), and write_eoi(u32 irqstat). And also
>> provide the wrappers gic_enable, gic_ipi_send(cpu), ...
>>
>>>   gic_send_spi(cpu, irq)
>>
>> I'll let you add this one to the new common ops struct :-)
>>
>>>   gic_irq_ack() which returns the iar.
>>
>> This one will be called read_iar.
>>
>> Would that work for you, Alex?
> 
> Sounds good to me :-)
> 
>>
>> Andre,
>>
>> Would this also satisfy your needs for more common code?

TBH I haven't look deeply enough to give an educated answer. I just
wanted to +1 Alex for the general direction. So I guess it's OK. ;-)

I guess we may need some refactoring later anyway, so any missing pieces
can be added/refactored later once we exactly know what we need.

Cheers,
Andre.
