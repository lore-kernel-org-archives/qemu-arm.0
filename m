Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y81-v6sm729228wmd.11.2018.11.26.03.50.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Nov 2018 03:50:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 4827F3E053E;
	Mon, 26 Nov 2018 11:50:27 +0000 (GMT)
References: <0184EA26B2509940AA629AE1405DD7F201F7BBE8@DGGEMA503-MBX.china.huawei.com> <CAFEAcA_abaoxA=myPszVrO59-hSazHAePRJXUCHKSFnoEdsfiw@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: gengdongjiu <gengdongjiu@huawei.com>, Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>, James Morse <james.morse@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Richard Henderson <rth@twiddle.net>, Zheng Xiang <zhengxiang9@huawei.com>, Eduardo Habkost <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH RESEND v15 08/10] target-arm: kvm64: inject synchronous External Abort
In-reply-to: <CAFEAcA_abaoxA=myPszVrO59-hSazHAePRJXUCHKSFnoEdsfiw@mail.gmail.com>
Date: Mon, 26 Nov 2018 11:50:27 +0000
Message-ID: <87o9ac3vng.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qTPayK2bHtOW


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 21 Nov 2018 at 14:34, gengdongjiu <gengdongjiu@huawei.com> wrote:
>>
>> Hi Peter,
>>   Thanks for the review and comments.
>>
>> >
>> > On 8 November 2018 at 10:29, Dongjiu Geng <gengdongjiu@huawei.com> wro=
te:
>> > > +bool write_part_cpustate_to_list(ARMCPU *cpu, ptrdiff_t fieldoffset)
>> >
>> > What is this about? Nothing else in QEMU needs to mess with the cpusta=
te synchronization. My first assumption is that you should not
>> > need to do so either.
>>
>> We should change the guest CP15 ESR_EL1's value, the only method is to c=
hange the cpu->cpreg_values[] in QEMU, then QEMU call write_list_to_kvmstat=
e()
>> to set the cpu->cpreg_values[] to KVM which include the specified ESR_EL=
1 value, KVM do world switch, and then set the specified ESR_EL1's value to=
 guest kernel.
>
> Ah, I see. This is a bug in our current handling of the register
> state, where we implicitly assume that nothing in QEMU will ever
> want to change any system register values. This assumption is
> now false -- kvm_arm_handle_debug() broke it -- so we need to
> fix the code that does kvm_arch_put_registers(). There is a comment
> in the kvm32.c version of that function about this. (The kvm64.c
> version has the same assumption but doesn't comment on it.)
>
> We should (ideally) fix this bug in the code that does register
> syncing, without requiring places in QEMU that update system
> registers to have to manually indicate which registers they have
> changed. I'll have a think about how best to do this.
>
>> About the detailed explanation, as shown in [2].
>>
>> kvm_arm_handle_debug() does not need to do this because QEMU does not ne=
ed to change CP15 registers, such as ESR_EL1.
>
> kvm_arm_handle_debug does change ESR_EL1: it is injecting an exception
> and so should set the exception register. This happens when it
> calls the do_interrupt() hook, because arm_cpu_do_interrupt_aarch64()
> writes to env->cp15.esr_el[new_el].
>
> I'm not entirely sure why this is working today, in fact.
> Alex, did you test whether our debug-exception-injection
> reports the correct ESR_EL1 to the guest ?
<snip>

I did not - I was mostly focusing in the host-debugging-the-guest test
case. I'll get a test rig up and check.

--
Alex Benn=C3=A9e
