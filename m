Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id wg8sm5764303wjb.42.2016.11.11.02.02.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Nov 2016 02:02:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 80F9E3E04DB;
	Fri, 11 Nov 2016 10:02:59 +0000 (GMT)
References: <1478798481-25030-1-git-send-email-drjones@redhat.com> <1478798481-25030-11-git-send-email-drjones@redhat.com> <874m3f8621.fsf@linaro.org> <20161110203713.4idzgs5u2xm7ms4o@hawk.localdomain>
User-agent: mu4e 0.9.17; emacs 25.1.50.16
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com, andre.przywara@arm.com, qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v5 10/11] arm/arm64: gicv3: add an IPI test
In-reply-to: <20161110203713.4idzgs5u2xm7ms4o@hawk.localdomain>
Date: Fri, 11 Nov 2016 10:02:59 +0000
Message-ID: <871syi8hbg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 56r0KJ0kMgOR


Andrew Jones <drjones@redhat.com> writes:

> On Thu, Nov 10, 2016 at 07:53:58PM +0000, Alex Bennée wrote:
> [...]
>> > +struct gic gicv2 = {
>> > +	.ipi = {
>> > +		.enable = gicv2_enable_defaults,
>> > +		.send_self = gicv2_ipi_send_self,
>> > +		.send_tlist = gicv2_ipi_send_tlist,
>> > +		.send_broadcast = gicv2_ipi_send_broadcast,
>> > +	},
>> > +	.read_iar = gicv2_read_iar,
>> > +	.irqnr = gicv2_irqnr,
>> > +	.write_eoi = gicv2_write_eoi,
>> > +};
>> > +
>> > +struct gic gicv3 = {
>> > +	.ipi = {
>> > +		.enable = gicv3_enable_defaults,
>> > +		.send_self = gicv3_ipi_send_self,
>> > +		.send_tlist = gicv3_ipi_send_tlist,
>> > +		.send_broadcast = gicv3_ipi_send_broadcast,
>> > +	},
>> > +	.read_iar = gicv3_read_iar,
>> > +	.irqnr = gicv3_irqnr,
>> > +	.write_eoi = gicv3_write_eoir,
>> > +};
>> > +
>>
>> So I was re-basing my kvm-unit-tests against your GIC rework and found
>> myself copy and pasting a bunch of this into my tests that fire IRQs.
>> That makes me think the abstraction should be in the library code so
>> other tests can fiddle with sending IRQs.
>>
>> What do you think?
>>
>
> I guess you mean moving the above two structs and their corresponding
> functions (all which aren't already common) to lib/arm/ ? Or do you
> just mean the one non-trivial function gicv3_ipi_send_tlist? I think
> agree with gicv3_ipi_send_tlist getting shared, but the others are
> mostly one-liners, so I'm not sure. I guess I'd have to see how you're
> using them first.

So it looked like there were some functions in the common code for one
GIC which had local test defined functions for the other. They should at
least be consistent.

For my use case I could do with a common:

  gic_enable
  gic_send_spi(cpu, irq)
  gic_irq_ack() which returns the iar.

See:

  https://github.com/stsquad/kvm-unit-tests/blob/mttcg/current-tests-v6/arm/tcg-test.c#L113

>
> Thanks,
> drew


--
Alex Bennée
