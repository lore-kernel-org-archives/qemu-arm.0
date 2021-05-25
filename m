Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p20sm3539569wmq.10.2021.05.25.12.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 12:38:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D00DF1FF7E;
	Tue, 25 May 2021 20:38:30 +0100 (BST)
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <87fsya3a7b.fsf@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shashi Mallela <shashi.mallela@linaro.org>
Cc: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
Date: Tue, 25 May 2021 20:30:23 +0100
In-reply-to: <87fsya3a7b.fsf@linaro.org>
Message-ID: <87czte38p5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: kCLPSM+oBnBN


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Shashi Mallela <shashi.mallela@linaro.org> writes:
>
>> This patchset implements qemu device model for enabling physical
>> LPI support and ITS functionality in GIC as per GICv3 specification.
>> Both flat table and 2 level tables are implemented.The ITS commands
>> for adding/deleting ITS table entries,trigerring LPI interrupts are
>> implemented.Translated LPI interrupt ids are processed by redistributor
>> to determine priority and set pending state appropriately before
>> forwarding the same to cpu interface.
>> The ITS feature support has been added to sbsa-ref platform as well as
>> virt platform,wherein the emulated functionality co-exists with kvm
>> kernel functionality.
>
> So I'm definitely seeing a slow down in one of my testcases but it
> doesn't seem to be HW access related. Via:
>
<snip>
>
> So I ran with the hotblocks plugin:
>
>   ./qemu-system-aarch64 -cpu max,pauth-impdef=3Don -machine type=3Dvirt,v=
irtualization=3Don,gic-version=3D3 -display none -serial mon:stdio -kernel =
~/lsrc/linux.git/builds/arm64.initramfs/arch/arm64/boot/Image -append "cons=
ole=3DttyAMA0" -m 4096 -smp 1 -plugin contrib/plugins/libhotblocks.so -d pl=
ugin -D hotblocks.log
>
>   collected 130606 entries in the hash table
>   pc, tcount, icount, ecount
>   0xffffffc010627fd0, 4, 10, 3998721 - memcpy
>   0xffffffc010628288, 2, 6, 3984790 - memset
>   0xffffffc01062832c, 3, 4, 1812870 - memset
>   0xffffffc0100a8df8, 4, 4, 1743432 - __my_cpu_offset
>   0xffffffc01015c394, 2, 4, 1304617 - __my_cpu_offset
>   0xffffffc010093348, 3, 3, 1228845 - decay_load
>   0xffffffc010093354, 3, 3, 1228447 - decay_load
>   0xffffffc01009338c, 3, 2, 1228447 - decay_load
>   0xffffffc01009336c, 3, 7, 1180051 - decay_load
>   0xffffffc010631300, 3, 4, 1114347 - __radix_tree_lookup
>   0xffffffc0106312c8, 3, 12, 1114337 - __radix_tree_lookup
>   0xffffffc0106312f8, 3, 2, 1114337 -=20
>   0xffffffc010132aec, 3, 4, 1080983
>   0xffffffc010132afc, 3, 12, 1080983
>   0xffffffc010132b30, 3, 2, 1080983
>   0x000000004084b58c, 1, 1, 1052116
>   0x000000004084b590, 1, 7, 1052116
>   0x000000004084b57c, 1, 4, 1051127
>   0xffffffc01001a118, 2, 6, 1049119
>   0xffffffc01001a944, 2, 2, 1048689
>
> So whatever is holding it up is because it's heavily spamming core
> functions.

Well given I've seen it hit gic_handle_irq > 1000 times already while in
the "PCI: CLS 0 bytes, default 64" phase of the kernel boot makes me
think the IRQs are just re-asserting themselves and firing continuously.

Indeed -d trace:gicv3_redist_set_irq shows a lot of:

  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 0
  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 1
  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 0
  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 1
  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 0
  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 1

--=20
Alex Benn=C3=A9e
