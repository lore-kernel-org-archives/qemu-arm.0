Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id bg10sm2611187wjb.46.2015.12.08.03.49.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2015 03:49:50 -0800 (PST)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 16AE33E01DB;
	Tue,  8 Dec 2015 11:49:50 +0000 (GMT)
References: <1447345251-22625-1-git-send-email-alex.bennee@linaro.org> <1447345251-22625-4-git-send-email-alex.bennee@linaro.org> <CAFEAcA-YQ384sY1OWLaV9YAjzTZSyWqVLHx2moH-sCa+O6FvOw@mail.gmail.com>
User-agent: mu4e 0.9.15; emacs 24.5.50.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org, Christoffer Dall <christoffer.dall@linaro.org>, Zhichao Huang <zhichao.huang@linaro.org>, kvm-devel <kvm@vger.kernel.org>, arm-mail-list <linux-arm-kernel@lists.infradead.org>, "kvmarm\@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v9 3/6] target-arm: kvm - support for single step
In-reply-to: <CAFEAcA-YQ384sY1OWLaV9YAjzTZSyWqVLHx2moH-sCa+O6FvOw@mail.gmail.com>
Date: Tue, 08 Dec 2015 11:49:49 +0000
Message-ID: <87r3ixp3c2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mEBAX4+23gkT


Peter Maydell <peter.maydell@linaro.org> writes:

> On 12 November 2015 at 16:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> This adds support for single-step. There isn't much to do on the QEMU
>> side as after we set-up the request for single step via the debug ioctl
>> it is all handled within the kernel.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - convert to using HSR_EC
>> v3
>>   - use internals.h definitions
>> ---
>>  target-arm/kvm.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/target-arm/kvm.c b/target-arm/kvm.c
>> index 50f70ef..d505a7e 100644
>> --- a/target-arm/kvm.c
>> +++ b/target-arm/kvm.c
>> @@ -535,6 +535,13 @@ static int kvm_handle_debug(CPUState *cs, struct kv=
m_run *run)
>>      kvm_cpu_synchronize_state(cs);
>>
>>      switch (hsr_ec) {
>> +    case EC_SOFTWARESTEP:
>> +        if (cs->singlestep_enabled) {
>> +            return true;
>> +        } else {
>> +            error_report("Came out of SINGLE STEP when not enabled");
>> +        }
>> +        break;
>>      case EC_AA64_BKPT:
>>          if (kvm_find_sw_breakpoint(cs, env->pc)) {
>>              return true;
>> @@ -595,6 +602,9 @@ int kvm_arch_on_sigbus(int code, void *addr)
>>
>>  void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *=
dbg)
>>  {
>> +    if (cs->singlestep_enabled) {
>> +        dbg->control |=3D KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_SINGLESTEP;
>> +    }
>
> Doesn't kvm_update_guest_debug() already set these bits, or am
> I misreading it?

Yeah. This raises an interesting problem about what to do when we don't
have the capability. I could suppress those bits in the update function
but that seems a bit hacky.

Looking at the GDB capability code there doesn't seem to report
breakpoint capability short of just failing when you try to set one.

>
>>      if (kvm_sw_breakpoints_active(cs)) {
>>          dbg->control |=3D KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP;
>>      }
>> --
>> 2.6.3
>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
