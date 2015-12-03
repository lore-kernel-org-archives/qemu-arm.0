Received: by 10.182.158.201 with SMTP id ww9csp175207obb;
        Thu, 3 Dec 2015 11:55:11 -0800 (PST)
X-Received: by 10.140.84.202 with SMTP id l68mr13267706qgd.21.1449172511828;
        Thu, 03 Dec 2015 11:55:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w186si10110718qhc.131.2015.12.03.11.55.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 11:55:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:37181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4ZyB-0000U9-G7
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 14:55:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4Zy8-0000RM-Cz
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 14:55:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4Zy7-0006tf-3I
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 14:55:08 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35424)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4Zy6-0006sw-Qj
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 14:55:07 -0500
Received: by vkha189 with SMTP id a189so52303157vkh.2
	for <qemu-arm@nongnu.org>; Thu, 03 Dec 2015 11:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NGWpAuxxpnqlDKcdi8hkba5aNECoajKXaQXJsCCFuxY=;
	b=rWqNxi0zMjWBisR8qVifTh7jfCtHB/CTnX4+6OKEeS8jekvAxL/gpCLHqTmFdMBj9J
	wRZB6FkOEIJxCHCrsyUawSPYv38HnokgLxLYzVFjmMsmP8hsXxJvtSsXj6+WN48V2Bwa
	hoL90PO8yxcH0ctF+zYuoOwBPoAu60DigjotozNgcg2EsR9YsFnMI/ELXq6oFERNtCBv
	aGTqvlMk68iFbUS6R/ceTNm96hvjWdQQvHd3v0jaKj/FqDrXm1PUn+AEwV38jFhIg69J
	fOLzDY3piiv2iisv0sHXR5Tir++aqHi2cHs1+rwmoSWUdz5CW/x7mn4pNNm3CBgbKLGn
	o4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NGWpAuxxpnqlDKcdi8hkba5aNECoajKXaQXJsCCFuxY=;
	b=hPMVwGMAiljS91DDpWFSmsdMvslNE9DecYEsvP9wfQ2DuAtSOgD3UIQ5VaUd3d+d0G
	hrmRft7uWp6VsUDVuT4/1NHvWeTLyOZm7SA8614a58qIMYrnrhYN8Oplg7Hof9FYxgn7
	7S5lAzw/vE5KHGGnxia7dah7UBHTFf119o3lCT0un44Uu75tcyupaJ+nuOn60m4RuarK
	+OKK+Ni72k1Y3fNNdK5FT4Dba2k+WRXetMjLoNO7Bl+nC60t9Isl9EgpSQoe6or46Gd2
	oF2ZLF8ldME8OSsnxBHnG3ckFOhH6FtQSrngDRi7W+A4dYR7bjWX02OGYgWXZt02ienF
	kF9A==
X-Gm-Message-State: ALoCoQkYTQVfasOZRe2XUlMNwJgiB03vNlInwUCoD437rQqRyh5C/8ShU4EQStzQxOgLTvQwgIfz
X-Received: by 10.31.47.197 with SMTP id v188mr7224376vkv.6.1449172506445;
	Thu, 03 Dec 2015 11:55:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 3 Dec 2015 11:54:46 -0800 (PST)
In-Reply-To: <20151203185529.GA4850@hawk.localdomain>
References: <1448411877-22019-1-git-send-email-drjones@redhat.com>
	<1448411877-22019-6-git-send-email-drjones@redhat.com>
	<CAFEAcA8+c5kOdBCSuVEgBf=Ga1chMiAV+rsLr4KNduTigQu7nQ@mail.gmail.com>
	<20151203185529.GA4850@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2015 19:54:46 +0000
Message-ID: <CAFEAcA98DaB-YDV5T-pxXG53mm7ZckKX2u4QHp62eE5o6yJDtw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 5/6] target-arm: support QMP
	dump-guest-memory
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
X-TUID: bJ4KByRabPyx

On 3 December 2015 at 18:55, Andrew Jones <drjones@redhat.com> wrote:
> On Thu, Dec 03, 2015 at 11:44:05AM +0000, Peter Maydell wrote:
>> On 25 November 2015 at 00:37, Andrew Jones <drjones@redhat.com> wrote:
>> > Add the support needed for creating prstatus elf notes. This
>> > allows us to use QMP dump-guest-memory.
>>
>> > +
>> > +    if (is_a64(env)) {
>> > +        for (i = 0; i < 31; ++i) {
>> > +            note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->xregs[i]);
>> > +        }
>> > +        note.prstatus.pr_reg.sp = cpu_to_dump64(s, env->xregs[31]);
>> > +        note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
>> > +        note.prstatus.pr_reg.pstate = cpu_to_dump64(s, pstate_read(env));
>> > +    } else {
>> > +        aarch64_sync_64_to_32(env);
>> > +        for (i = 0; i < 16; ++i) {
>> > +            note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->regs[i]);
>> > +        }
>> > +        note.prstatus.pr_reg.sp = note.prstatus.pr_reg.regs[13];
>> > +        note.prstatus.pr_reg.pc = note.prstatus.pr_reg.regs[15];
>> > +        note.prstatus.pr_reg.pstate = cpu_to_dump64(s, cpsr_read(env));
>> > +    }
>>
>> This doesn't look right. sync_64_to_32 is copying the state held
>> in the 64-bit env->xregs etc into the 32-bit env->regs. But if we're
>> in 32-bit state then the true state is in the 32-bit fields and
>> this will trash it. You want to sync_32_to_64 here, and then the
>> code to write the values to the dump is the same either way
>> (except for pstate vs cpsr which we haven't managed to clean up
>> and unify yet, sadly).
>
> Besides the unnecessary call to aarch64_sync_64_to_32(), then, for the
> KVM case, the above code is correct. However, for the TCG case, I now
> see why it's wrong.
>
> The KVM case starts with 64-bit state, because this function is dealing
> with 64-bit guest kernels. The TCG case, when userspace is running a
> 32-bit binary, starts with 32-bit state. In both cases we want to get
> 32-bit state into a 64-bit elf note. KVM needs aarch64_sync_64_to_32(),
> which is actually already done by cpu_synchronize_all_states(), and
> then to shoehorn the 32-bit registers into the 64-bit elf note, as done
> above. TCG, on the other hand, doesn't need to sync any state, it just
> needs to shoehorn. So the above aarch64_sync_64_to_32() call, which I
> actually added *for* TCG (since I misunderstood your comment on v1),
> actually makes it wrong. Needless to say, I didn't test TCG :-)
>
> Now, to fix it, we could do what you have here below
>
>>
>> I think you want
>>    uint64_t pstate;
>>    [...]
>>
>>    if (!is_a64(env)) {
>>        aarch64_sync_32_to_64(env);
>>        pstate = cpsr_read(env);
>>    } else {
>>        pstate = pstate_read(env);
>>    }
>>    for (i = 0; i < 31; ++i) {
>>        note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->xregs[i]);
>>    }
>
> But, this adds an unnecessary aarch64_sync_32_to_64() call to the kvm
> case (although it wouldn't hurt, as aarch64_sync_32_to_64 is the inverse
> of aarch64_sync_64_to_32, which we've already done earlier). It also
> always adds register values 16..30 to the elf note (which may not always
> be zero in the 32-bit userspace case?). The way I have it above makes
> sure those registers are zero in that case.

If you do that then you'll lose the information about the other
32-bit registers (the svc/irq/etc banked versions). Those aren't
relevant if the 32-bit code is in usermode, but probably you want
them if you're doing a dump of a 64-bit (emulated) hypervisor
that happens to be running a 32-bit guest kernel at point of dump.

> So, how about we just remove the aarch64_sync_64_to_32() from the code
> I have above? Won't that make it work for both KVM and TCG?
>
>
>>    note.prstatus.pr_reg.sp = cpu_to_dump64(s, env->xregs[31]);
>>    note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
>>    note.prstatus.pr_reg.pstate = cpu_to_dump64(s, pstate);
>>
>> (Note that the 32-bit SP is not architecturally in X31;
>> it's in one of the other xregs, depending what mode the CPU
>> was in. For 32-bit userspace that will be USR and it's in X13.)
>
> Yup, that's why I was pulling it from x13 in the above code. In your
> version you can now use x31, due to the aarch64_sync_32_to_64().

Note that sync_32_to_64 does not copy regs[13] into x31, which was
my point. In a 64-bit-format dump of a VM that happens to be
running 32 bit code you should not expect pstate.sp to be the
32-bit process's SP...

>> > +int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>> > +                             int cpuid, void *opaque)
>> > +{
>> > +    CPUARMState *env = &ARM_CPU(cs)->env;
>> > +    int ret;
>> > +
>> > +    if (arm_el_is_aa64(env, 1)) {
>> > +        ret = aarch64_write_elf64_note(f, env, cpuid, opaque);
>> > +    } else {
>> > +        ret = arm_write_elf32_note(f, env, cpuid, opaque);
>> > +    }
>>
>> This might produce the wrong kind of dump if we're in EL2
>> or EL3 at the point we take it (can only happen in emulation
>> and only once we add EL2 and EL3 emulation support, which isn't
>> active yet). Do we care?
>
> "care" is loaded word :-) If I can tweak this in some easy way now to get
> it ready for el2/el3 emulation, then I'm happy to do so. However, without
> a test environment, and without strong motivation to use this feature on
> emulation in the first place, then I'd rather not bother for the initial
> introduction of it. We can always modify it later.

For this test I think you can just say
  if (arm_feature(env, ARM_FEATURE_AARCH64)) {

which basically says "64-bit dump if the CPU supports 64-bit" (32-bit
KVM VMs won't have this feature bit). The other awkward part is
figuring out which endianness to use. I think there we can just put
in a comment
    /* We assume the relevant endianness is that of EL1; this is right
     * for kernels but might give the wrong answer if you're trying to
     * take a dump of a hypervisor that happens currently to be running
     * a wrong-endian kernel.
     */
and leave it for somebody who cares to try to figure out the right
semantics.

thanks
-- PMM
