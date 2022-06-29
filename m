Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u5-20020a170906068500b00703671ebe65sm7931903ejb.198.2022.06.29.11.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:24:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 040B91FFB7;
	Wed, 29 Jun 2022 19:24:21 +0100 (BST)
References: <20220623102617.2164175-1-pdel@fb.com>
 <20220623102617.2164175-13-pdel@fb.com>
 <e5f51f14-fe75-0d55-6588-a3ca2565f760@kaod.org>
 <EC44C0BD-7BC0-4BDE-9A41-CB1EAA90EC87@fb.com>
 <e07ec4fe-6968-b19a-e649-298a9aaccba5@kaod.org>
 <07128acf-329a-f372-c48c-0c3cb498d3d0@kaod.org>
 <87zghvh7rt.fsf@linaro.org>
 <8072cd96-a032-55f2-0417-1989a7bbeca0@kaod.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Peter Delevoryas <pdel@fb.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "eduardo@habkost.net"
 <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 "ani@anisinha.ca" <ani@anisinha.ca>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH 12/14] aspeed: Make aspeed_board_init_flashes public
Date: Wed, 29 Jun 2022 19:24:02 +0100
In-reply-to: <8072cd96-a032-55f2-0417-1989a7bbeca0@kaod.org>
Message-ID: <87edz7gwff.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: g3WeP68n4+KF


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 6/29/22 16:14, Alex Benn=C3=A9e wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>=20
>>> On 6/24/22 18:50, C=C3=A9dric Le Goater wrote:
>>>> On 6/23/22 20:43, Peter Delevoryas wrote:
>>>>>
>>>>>
>>>>>> On Jun 23, 2022, at 8:09 AM, C=C3=A9dric Le Goater <clg@kaod.org> wr=
ote:
>>>>>>
>>>>>> On 6/23/22 12:26, Peter Delevoryas wrote:
>>>>>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>>>>>
>>>>>> Let's start simple without flash support. We should be able to
>>>>>> load FW blobs in each CPU address space using loader devices.
>>>>>
>>>>> Actually, I was unable to do this, perhaps because the fb OpenBMC
>>>>> boot sequence is a little weird. I specifically _needed_ to have
>>>>> a flash device which maps the firmware in at 0x2000_0000, because
>>>>> the fb OpenBMC U-Boot SPL jumps to that address to start executing
>>>>> from flash? I think this is also why fb OpenBMC machines can be so sl=
ow.
>>>>>
>>>>> $ ./build/qemu-system-arm -machine fby35 \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 -device loader,file=3Dfby35.mtd,addr=3D0,cp=
u-num=3D0 -nographic \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 -d int -drive file=3Dfby35.mtd,format=3Draw=
,if=3Dmtd
>>>> Ideally we should be booting from the flash device directly using
>>>> the machine option '-M ast2600-evb,execute-in-place=3Dtrue' like HW
>>>> does. Instructions are fetched using SPI transfers. But the amount
>>>> of code generated is tremendous.
>> Yeah because there is a potential race when reading from HW so we
>> throw
>> away TB's after executing them because we have no way of knowing if it
>> has changed under our feet. See 873d64ac30 (accel/tcg: re-factor non-RAM
>> execution code) which cleaned up this handling.
>>=20
>>>> See some profiling below for a
>>>> run which barely reaches DRAM training in U-Boot.
>>>
>>> Some more profiling on both ast2500 and ast2600 machines shows :
>>>
>>>
>>> * ast2600-evb,execute-in-place=3Dtrue :
>>>
>>> Type               Object  Call site                Wait Time (s)      =
   Count  Average (us)
>>> -----------------------------------------------------------------------=
----------------------
>>> BQL mutex  0x564dc03922e0  accel/tcg/cputlb.c:1365       14.21443
>>> 32909927          0.43
>> This is unavoidable as a HW access needs the BQL held so we will go
>> through this cycle every executed instruction.
>> Did I miss why the flash contents are not mapped into the physical
>> address space? Isn't that how it appear to the processor?
>
>
> There are two modes :
>           if (ASPEED_MACHINE(machine)->mmio_exec) {
>             memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
>                                      &fl->mmio, 0, size);
>             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADD=
R,
>                                         boot_rom);
>         } else {
>             memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
>                                    size, &error_abort);
>             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADD=
R,
>                                         boot_rom);
>             write_boot_rom(drive0, FIRMWARE_ADDR, size, &error_abort);
>         }
>
> The default boot mode uses the ROM. No issue.
>
> The "execute-in-place=3Dtrue" option creates an alias on the region of
> the flash contents and each instruction is then fetched from the flash
> drive with SPI transactions.
>
> With old FW images, using an older U-boot, the machine boots in a couple
> of seconds. See the profiling below for a witherspoon-bmc machine using
> U-Boot 2016.07.
>
>   qemu-system-arm -M witherspoon-bmc,execute-in-place=3Dtrue  -drive file=
=3D./flash-witherspoon-bmc,format=3Draw,if=3Dmtd -drive file=3D./flash-with=
erspoon-bmc2,format=3Draw,if=3Dmtd -nographic -nodefaults -snapshot -serial=
 mon:stdio -enable-sync-profile
>   ...
>   U-Boot 2016.07-00040-g8425e96e2e27-dirty (Jun 24 2022 - 23:21:57 +0200)
>             Watchdog enabled
>   DRAM:  496 MiB
>   Flash: 32 MiB
>   In:    serial
>   Out:   serial
>   Err:   serial
>   Net:
>   (qemu) info sync-profile
>   Type               Object  Call site                Wait Time (s)      =
   Count  Average (us)
>   -----------------------------------------------------------------------=
----------------------
>   BQL mutex  0x56189610b2e0  accel/tcg/cputlb.c:1365        0.25311      =
12346237          0.02
>   condvar    0x5618970cf220  softmmu/cpus.c:423             0.05506      =
       2      27530.78
>   BQL mutex  0x56189610b2e0  util/rcu.c:269                 0.04709      =
       2      23544.26
>   condvar    0x561896d0fc78  util/thread-pool.c:90          0.01340      =
      83        161.47
>   condvar    0x56189610b240  softmmu/cpus.c:571             0.00005      =
       1         54.93
>   condvar    0x56189610b280  softmmu/cpus.c:642             0.00003      =
       1         32.88
>   BQL mutex  0x56189610b2e0  util/main-loop.c:318           0.00003      =
      34          0.76
>   mutex      0x561896eade00  tcg/region.c:204               0.00002      =
     995          0.02
>   rec_mutex  [           2]  util/async.c:682               0.00002      =
     493          0.03
>   mutex      [           2]  chardev/char.c:118             0.00001      =
     404          0.03
>   -----------------------------------------------------------------------=
----------------------
>
>
> However, with recent U-boots, it takes quite a while to reach DRAM traini=
ng.
> Close to a minute. See the profiling below for an ast2500-evb machine usi=
ng
> U-Boot 2019.04.
>
>  qemu-system-arm -M ast2500-evb,execute-in-place=3Dtrue  -net nic,macaddr=
=3DC0:FF:EE:00:00:03,netdev=3Dnet0  -drive file=3D./flash-ast2500-evb,forma=
t=3Draw,if=3Dmtd  -nographic -nodefaults -snapshot -serial mon:stdio  -enab=
le-sync-profile
>   qemu-system-arm: warning: Aspeed iBT has no chardev backend
>   qemu-system-arm: warning: nic ftgmac100.1 has no peer
>   QEMU 7.0.50 monitor - type 'help' for more information
>      U-Boot 2019.04-00080-g6ca27db3f97b-dirty (Jun 24 2022 - 23:22:03
>     +0200)
>      SOC : AST2500-A1
>   RST : Power On
>   LPC Mode : SIO:Enable : SuperIO-2e
>   Eth : MAC0: RGMII, , MAC1: RGMII,
>   Model: AST2500 EVB
>   DRAM:  448 MiB (capacity:512 MiB, VGA:64 MiB, ECC:off)
>   MMC:   sdhci_slot0@100: 0, sdhci_slot1@200: 1
>   Loading Environment from SPI Flash... SF: Detected mx25l25635e with pag=
e size 256 Bytes, erase size 64 KiB, total 32 MiB
>   *** Warning - bad CRC, using default environment
>      In:    serial@1e784000
>   Out:   serial@1e784000
>   Err:   serial@1e784000
>   Net:   eth0: ethernet@1e660000
>   Warning: ethernet@1e680000 (eth1) using random MAC address - 4a:e5:9a:4=
a:c7:c5
>   , eth1: ethernet@1e680000
>   Hit any key to stop autoboot:  2
>   (qemu) info sync-profile
>   Type               Object  Call site                Wait Time (s)      =
   Count  Average (us)
>   -----------------------------------------------------------------------=
----------------------
>   condvar    0x561f10c9ef88  util/thread-pool.c:90         10.01196      =
      28     357570.00
>   BQL mutex  0x561f102362e0  accel/tcg/cputlb.c:1365        0.29496      =
14248621          0.02
>   condvar    0x561f110325a0  softmmu/cpus.c:423             0.02231      =
       2      11152.57
>   BQL mutex  0x561f102362e0  util/rcu.c:269                 0.01447      =
       4       3618.60
>   condvar    0x561f10236240  softmmu/cpus.c:571             0.00010      =
       1        102.19
>   mutex      0x561f10e9f1c0  tcg/region.c:204               0.00007      =
    3052          0.02
>   mutex      [           2]  chardev/char.c:118             0.00003      =
    1486          0.02
>   condvar    0x561f10236280  softmmu/cpus.c:642             0.00003      =
       1         29.38
>   BQL mutex  0x561f102362e0  accel/tcg/cputlb.c:1426        0.00002      =
     973          0.02
>   BQL mutex  0x561f102362e0  util/main-loop.c:318           0.00001      =
      34          0.41
>   -----------------------------------------------------------------------=
----------------------
>   Something in the layout of the FW is making a big difference. One
> that could be relevant is that the recent versions are using a device
> tree.
>
> There might be no good solution to this issue but I fail to analyze
> it correctly. Is there a way to collect information on the usage of
> Translation Blocks ?

You could expand the data we collect in tb_tree_stats and expose it via
info jit.

>
> Thanks,
>
> C.


--=20
Alex Benn=C3=A9e
