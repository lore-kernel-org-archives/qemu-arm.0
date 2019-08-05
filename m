Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h133sm91066214wme.28.2019.08.05.07.23.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 07:23:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 93C811FF87;
	Mon,  5 Aug 2019 15:23:27 +0100 (BST)
References: <20190803184800.8221-1-richard.henderson@linaro.org>
 <8736ifkbod.fsf@linaro.org>
 <db7e63d9-fcf6-fda2-c164-af8f90815617@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH v3 00/34] target/arm: Implement ARMv8.1-VHE
In-reply-to: <db7e63d9-fcf6-fda2-c164-af8f90815617@linaro.org>
Date: Mon, 05 Aug 2019 15:23:27 +0100
Message-ID: <87zhknitcw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 26XQMjJdGAyX


Richard Henderson <richard.henderson@linaro.org> writes:

> On 8/5/19 6:02 AM, Alex Benn=C3=A9e wrote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> About half of this patch set is cleanup of the qemu tlb handling
>>> leading up to the actual implementation of VHE, and the biggest
>>> piece of that: The EL2&0 translation regime.
>>>
>>> Changes since v2:
>>>   * arm_mmu_idx was incomplete; test TGE+E2H not just E2H.
>>>   * arm_sctlr was incomplete; now uses arm_mmu_idx to avoid
>>>     duplication of tests.
>>>   * Update aa64_zva_access and ctr_el0_access for EL2.
>>>
>>> Changes since v1:
>>>   * Merge feedback from AJB.
>>>   * Split out 7 renaming patches from "Reorganize ARMMMUIdx".
>>>   * Alex's MIDR patch keeps the nested KVM from spitting warnings.
>>>
>>> I have tested
>>>
>>>   qemu-system-aarch64 -accel kvm -cpu host -M virt,gic-version-host \
>>>     -m 512 -bios /usr/share/edk2/aarch64/QEMU_EFI.fd -nographic
>>
>> So testing with a host doing:
>>
>>   ./aarch64-softmmu/qemu-system-aarch64 -machine type=3Dvirt,virtualizat=
ion=3Don -cpu cortex-a57 -serial mon:stdio -nic user,model=3Dvirtio-net-pci=
,hostfwd=3Dtcp::2222-:22 -device virtio-scsi-pci -drive file=3D/dev/zvol/ha=
ckpool-0/debian-buster-arm64,id=3Dhd0,index=3D0,if=3Dnone,format=3Draw,disc=
ard=3Don -device scsi-hd,drive=3Dhd0 -kernel ../linux.git/builds/arm64/arch=
/arm64/boot/Image -append "console=3DttyAMA0 root=3D/dev/sda2" -display non=
e -m 4096 -smp 8
>>
>> And a guest doing:
>>
>>   ./aarch64-softmmu/qemu-system-aarch64 -machine type=3Dvirt -cpu host
>>   -serial mon:stdio -nic user,model=3Dvirtio-net-pci -device
>>   virtio-scsi-pci -kernel /boot/vmlinuz-4.19.0-5-arm64 -append "console=
=3DttyAMA0 panic=3D-1" -display none -m 256 -smp 4 --no-reboot
>>   --enable-kvm
>>
>> I triggered:
>>
>>   ERROR:/home/alex.bennee/lsrc/qemu.git/target/arm/helper.c:3436:update_=
lpae_el1_asid: code should not be reached
>> fish: =E2=80=9C./aarch64-softmmu/qemu-system-a=E2=80=A6=E2=80=9D termina=
ted by signal SIGABRT (Abort)
>
> Whoops.  Rebase error while changing the signature of this function.
> Thanks for re-testing the case where VHE isn't present.  :-P
>
>> With -cpu max on the host it hangs the whole thing. I'm going to
>> continue to experiment with explicit GIC versions.
>
> Hangs the host?  Are you sure that the guest isn't just slow?

Ahh nested terminology - the aarch64 VHE host hangs so I can't access
it's shells either. I'll try and get a better trace once I've gotten a
reliable non-VHE guest-guest boot ;-)

> That's why I changed my testing to boot a debug edk2, which
> outputs stuff much sooner than the kernel does.

Looking via gdbstub it looked like stuff had stopped happening but you
are right it could be just slow. None of the threads seem to be doing
anything.

> Although I have no idea why the guest should be extra slow.
> It does seem like it ought to be booting at the same speed as
> the host.  I see tlb flushes as quite high in the profile,
> and wonder if I'm doing too many of them.

Hmm yeah they do seem a bit high:

TLB full flushes    8
TLB partial flushes 39036316
TLB elided flushes  256488402

... 10 seconds ...

TLB full flushes    8
TLB partial flushes 40393340
TLB elided flushes  265444803

For non-VHE that seems expected because we should be changing the entire
mapping regime as we bounce between the EL1's - shouldn't be as high for
VHE right?


>
>
> r~


--
Alex Benn=C3=A9e
