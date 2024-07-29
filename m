Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb8015sm486576966b.203.2024.07.29.03.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 03:14:58 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B80B85F844;
	Mon, 29 Jul 2024 11:14:57 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,
  qemu-devel@nongnu.org,  richard.henderson@linaro.org,
  darren@os.amperecomputing.com
Subject: Re: [PATCH] arm/kvm: add support for MTE
In-Reply-To: <0c171de4-a8ea-4859-b78c-272244267bb3@os.amperecomputing.com>
	(Ganapatrao Kulkarni's message of "Mon, 29 Jul 2024 15:07:51 +0530")
References: <20240709060448.251881-1-gankulkarni@os.amperecomputing.com>
	<CAFEAcA_7BOXSLXJ=VV0pWDvrN=2dWrM3bRTG+31ivPjeVbWGKQ@mail.gmail.com>
	<0c171de4-a8ea-4859-b78c-272244267bb3@os.amperecomputing.com>
Date: Mon, 29 Jul 2024 11:14:57 +0100
Message-ID: <8734ns1p3y.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: AE6uUAM9tx4V

Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> writes:

> Hi Peter,
>
>
> [Apologies for the delayed response]
>
> On 16-07-2024 09:15 pm, Peter Maydell wrote:
>> On Tue, 9 Jul 2024 at 07:05, Ganapatrao Kulkarni
>> <gankulkarni@os.amperecomputing.com> wrote:
>>>
>>> Extend the 'mte' property for the virt machine to cover KVM as
>>> well. For KVM, we don't allocate tag memory, but instead enable
>>> the capability.
>>>
>>> If MTE has been enabled, we need to disable migration, as we do not
>>> yet have a way to migrate the tags as well. Therefore, MTE will stay
>>> off with KVM unless requested explicitly.
>>>
>>> This patch is rework of commit b320e21c48ce64853904bea6631c0158cc2ef227
>>> which broke TCG since it made the TCG -cpu max
>>> report the presence of MTE to the guest even if the board hadn't
>>> enabled MTE by wiring up the tag RAM. This meant that if the guest
>>> then tried to use MTE QEMU would segfault accessing the
>>> non-existent tag RAM.
>>>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
>>> ---
>> In target/arm/cpu.c:arm_cpu_realizefn() there is this code:
>>      if (cpu_isar_feature(aa64_mte, cpu)) {
>>          /*
>>           * The architectural range of GM blocksize is 2-6, however qemu
>>           * doesn't support blocksize of 2 (see HELPER(ldgm)).
>>           */
>>          if (tcg_enabled()) {
>>              assert(cpu->gm_blocksize >=3D 3 && cpu->gm_blocksize <=3D 6=
);
>>          }
>> #ifndef CONFIG_USER_ONLY
>>          /*
>>           * If we do not have tag-memory provided by the machine,
>>           * reduce MTE support to instructions enabled at EL0.
>>           * This matches Cortex-A710 BROADCASTMTE input being LOW.
>>           */
>>          if (cpu->tag_memory =3D=3D NULL) {
>>              cpu->isar.id_aa64pfr1 =3D
>>                  FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
>>          }
>> #endif
>>      }
>> With this patch, for KVM we will end up going through the
>> "squash ID_AA64PFR1_EL1.MTE to 1" codepath, because KVM doesn't
>> set cpu->tag_memory and this is still using that as its check.
>>=20
>
> I looked at this function and it seems we are not entering this
> function for KVM boot. I do see -DCONFIG_USER_ONLY added to make
> files.
>
> Also Linux kernel wont detect/enable MTE until unless the
> ID_AA64PFR1_EL1.MTE value is 2(b0010) and above.
>
>> More generally, how does the enabling of the MTE KVM cap
>> interact with the ID_AA64PFR1_EL1 value that we read from
>> the host in kvm_arm_get_host_cpu_features() ? We care that we
>> have the right ID register values because we use ID field
>> checks to determine whether the vcpu has a feature or not,
>> even in the KVM case.
>> Since Cornelia first wrote the patch this is based on, we've
>> landed gdbstub support for MTE (so gdb can find out which
>> addresses in the memory map have tags and read and write
>> those tags). So I think the KVM MTE support now also needs to
>> handle that. (See aarch64_cpu_register_gdb_commands() in
>> target/arm/gdbstub64.c.)
>
> Ok sure, I will go through this file to add/update MTE part

So to be clear the current MTE gdbstub support is linux-user only.
Gustavo has a series on the list that adds the system emulation part:

  Message-Id: <20240722160709.1677430-1-gustavo.romero@linaro.org>
  Date: Mon, 22 Jul 2024 16:07:05 +0000
  Subject: [PATCH 0/4] gdbstub: Add support for MTE in system mode
  From: Gustavo Romero <gustavo.romero@linaro.org>

which of course is focused on TCG. But if the KVM guests sync to the same
registers to cpregs I think most stuff should just work. However the
current code uses the TCG only:

  allocation_tag_mem_probe

which I guess needs a KVM equivalent to query the tag memory?

>
>
> Thanks,
> Ganapat

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
