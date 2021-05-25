Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x4sm3504658wmj.17.2021.05.25.12.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 12:06:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5414F1FF7E;
	Tue, 25 May 2021 20:06:00 +0100 (BST)
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shashi Mallela <shashi.mallela@linaro.org>
Cc: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
Date: Tue, 25 May 2021 19:26:09 +0100
In-reply-to: <20210429234201.125565-1-shashi.mallela@linaro.org>
Message-ID: <87fsya3a7b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: a2i8vWkvpekw


Shashi Mallela <shashi.mallela@linaro.org> writes:

> This patchset implements qemu device model for enabling physical
> LPI support and ITS functionality in GIC as per GICv3 specification.
> Both flat table and 2 level tables are implemented.The ITS commands
> for adding/deleting ITS table entries,trigerring LPI interrupts are
> implemented.Translated LPI interrupt ids are processed by redistributor
> to determine priority and set pending state appropriately before
> forwarding the same to cpu interface.
> The ITS feature support has been added to sbsa-ref platform as well as
> virt platform,wherein the emulated functionality co-exists with kvm
> kernel functionality.

So I'm definitely seeing a slow down in one of my testcases but it
doesn't seem to be HW access related. Via:

  ./qemu-system-aarch64 -cpu max,pauth-impdef=3Don -machine type=3Dvirt,vir=
tualization=3Don,gic-version=3D3 -display none -serial mon:stdio -kernel ~/=
lsrc/linux.git/builds/arm64.initramfs/arch/arm64/boot/Image -append "consol=
e=3DttyAMA0" -m 4096 -smp 1 -plugin contrib/plugins/libhwprofile.so,arg=3Ds=
ource -d plugin -D before.log

  pl011 @ 0xffffffc017043000
    pc:ffffffc0103502cc, 1, 4, 0, 0
    pc:ffffffc010350308, 1, 4, 0, 0
    pc:ffffffc0103a3c14, 1, 11620, 0, 0
    pc:ffffffc0103a3c4c, 0, 0, 1, 11688
  gicv3_dist @ 0xffffffc018030000
    pc:ffffffc01030c258, 1, 2, 0, 0
    pc:ffffffc01030c31c, 0, 0, 1, 14
    pc:ffffffc01030c348, 0, 0, 1, 56
    pc:ffffffc01030c370, 0, 0, 1, 7
    pc:ffffffc01030c37c, 0, 0, 1, 7
    pc:ffffffc01030cba8, 1, 2, 0, 0
    pc:ffffffc01030cc38, 0, 0, 1, 6
    pc:ffffffc01030cf3c, 1, 1, 0, 0
    pc:ffffffc01030d2b8, 1, 8, 0, 0
    pc:ffffffc01030d6e4, 0, 0, 1, 2
    pc:ffffffc01086b01c, 1, 1, 0, 0
    pc:ffffffc01086b1e0, 1, 1, 0, 0
    pc:ffffffc01086b1ec, 1, 1, 0, 0
    pc:ffffffc01086b258, 1, 1, 0, 0
    pc:ffffffc01086b39c, 0, 0, 1, 1
    pc:ffffffc01086b3d4, 0, 0, 1, 7
    pc:ffffffc01086b4d4, 0, 0, 1, 1
    pc:ffffffc01086b51c, 0, 0, 1, 224
  pcie-mmcfg-mmio @ 0xffffffc030000000
    pc:ffffffc01031de00, 1, 65, 0, 0
    pc:ffffffc01031de1c, 1, 105, 0, 0
    pc:ffffffc01031de3c, 1, 77, 0, 0
    pc:ffffffc01031de9c, 0, 0, 1, 2
    pc:ffffffc01031deb0, 0, 0, 1, 8
    pc:ffffffc01031debc, 0, 0, 1, 31
  virtio-pci-common-virtio-net @ 0xffffffc0202d5000
    pc:ffffffc01035d348, 1, 9, 0, 0
    pc:ffffffc01035d368, 1, 12, 0, 0
    pc:ffffffc01035d388, 1, 2, 0, 0
    pc:ffffffc01035d3bc, 0, 0, 1, 1
    pc:ffffffc01035d3dc, 0, 0, 1, 1
    pc:ffffffc01035d54c, 0, 0, 1, 1
    pc:ffffffc01035d560, 0, 0, 1, 1
    pc:ffffffc01035d574, 0, 0, 1, 1
    pc:ffffffc01035d588, 0, 0, 1, 1
    pc:ffffffc01035d5bc, 0, 0, 1, 4
    pc:ffffffc01035d780, 0, 0, 1, 3
    pc:ffffffc01035d790, 0, 0, 1, 3
    pc:ffffffc01035d7d0, 0, 0, 1, 1
    pc:ffffffc01035db18, 0, 0, 1, 3
    pc:ffffffc01035dbc0, 0, 0, 1, 3
    pc:ffffffc01035dbd4, 0, 0, 1, 3
    pc:ffffffc01035dbe4, 0, 0, 1, 3
    pc:ffffffc01035dbf8, 0, 0, 1, 3
    pc:ffffffc01035dc08, 0, 0, 1, 3
    pc:ffffffc01035dc1c, 0, 0, 1, 3
    pc:ffffffc01035dc2c, 0, 0, 1, 3
  gicv3_redist_region[0] @ 0xffffffc018f60000
    pc:ffffffc01030c258, 1, 10, 0, 0
    pc:ffffffc01030c3cc, 0, 0, 1, 1
    pc:ffffffc01030c3d8, 0, 0, 1, 1
    pc:ffffffc01030c410, 0, 0, 1, 8
    pc:ffffffc01030c428, 0, 0, 1, 1
    pc:ffffffc01030c8f4, 1, 4, 0, 0
    pc:ffffffc01030cc38, 0, 0, 1, 5
    pc:ffffffc01030d164, 1, 2, 0, 0
    pc:ffffffc01030d2b8, 1, 6, 0, 0
    pc:ffffffc01030d360, 1, 1, 0, 0
    pc:ffffffc01030d374, 0, 0, 1, 1
    pc:ffffffc01030d388, 1, 1, 0, 0
    pc:ffffffc01030e0c8, 0, 0, 1, 1
  virtio-pci-notify-virtio-net @ 0xffffffc0202e2000
    pc:ffffffc01035e554, 0, 0, 1, 29

But with your series applied the serial output is still the biggest hit:

  pl011 @ 0xffffffc017043000
    pc:ffffffc0103502cc, 1, 4, 0, 0
    pc:ffffffc010350308, 1, 4, 0, 0
    pc:ffffffc0103a3c14, 1, 11899, 0, 0
    pc:ffffffc0103a3c4c, 0, 0, 1, 11938
  gicv3_dist @ 0xffffffc018030000
    pc:ffffffc01030c258, 1, 1, 0, 0
    pc:ffffffc01030c31c, 0, 0, 1, 14
    pc:ffffffc01030c348, 0, 0, 1, 56
    pc:ffffffc01030c370, 0, 0, 1, 7
    pc:ffffffc01030c37c, 0, 0, 1, 7
    pc:ffffffc01030cba8, 1, 1, 0, 0
    pc:ffffffc01030cc38, 0, 0, 1, 3
    pc:ffffffc01030cf3c, 1, 4, 0, 0
    pc:ffffffc01030d2b8, 1, 5, 0, 0
    pc:ffffffc01030d6e4, 0, 0, 1, 1
    pc:ffffffc01086b01c, 1, 1, 0, 0
    pc:ffffffc01086b1e0, 1, 1, 0, 0
    pc:ffffffc01086b1ec, 1, 1, 0, 0
    pc:ffffffc01086b258, 1, 1, 0, 0
    pc:ffffffc01086b39c, 0, 0, 1, 1
    pc:ffffffc01086b3d4, 0, 0, 1, 7
    pc:ffffffc01086b4d4, 0, 0, 1, 1
    pc:ffffffc01086b51c, 0, 0, 1, 224
  pcie-mmcfg-mmio @ 0xffffffc030000000
    pc:ffffffc01031de00, 1, 65, 0, 0
    pc:ffffffc01031de1c, 1, 122, 0, 0
    pc:ffffffc01031de3c, 1, 79, 0, 0
    pc:ffffffc01031de9c, 0, 0, 1, 2
    pc:ffffffc01031deb0, 0, 0, 1, 13
    pc:ffffffc01031debc, 0, 0, 1, 32
  control @ 0xffffffc020050000
    pc:ffffffc01030e6c4, 1, 21, 0, 0
    pc:ffffffc01030eb00, 0, 0, 1, 5
    pc:ffffffc01030ec94, 1, 1, 0, 0
    pc:ffffffc01030eec8, 1, 16, 0, 0
    pc:ffffffc01030ef6c, 1, 9, 0, 0
    pc:ffffffc010310cb8, 1, 9, 0, 0
    pc:ffffffc010310cc8, 0, 0, 1, 9
    pc:ffffffc01086ba88, 1, 1, 0, 0
    pc:ffffffc01086bd10, 1, 1, 0, 0
    pc:ffffffc01086c1cc, 0, 0, 1, 1
    pc:ffffffc01086c22c, 0, 0, 1, 1
    pc:ffffffc01086c230, 1, 1, 0, 0
    pc:ffffffc01086c248, 0, 0, 1, 1
  virtio-pci-common-virtio-net @ 0xffffffc0202d5000
    pc:ffffffc01035d348, 1, 9, 0, 0
    pc:ffffffc01035d368, 1, 15, 0, 0
    pc:ffffffc01035d388, 1, 2, 0, 0
    pc:ffffffc01035d3bc, 0, 0, 1, 1
    pc:ffffffc01035d3dc, 0, 0, 1, 1
    pc:ffffffc01035d464, 0, 0, 1, 1
    pc:ffffffc01035d54c, 0, 0, 1, 1
    pc:ffffffc01035d560, 0, 0, 1, 1
    pc:ffffffc01035d574, 0, 0, 1, 1
    pc:ffffffc01035d588, 0, 0, 1, 1
    pc:ffffffc01035d5bc, 0, 0, 1, 4
    pc:ffffffc01035d780, 0, 0, 1, 3
    pc:ffffffc01035d790, 0, 0, 1, 3
    pc:ffffffc01035d7d0, 0, 0, 1, 1
    pc:ffffffc01035db18, 0, 0, 1, 3
    pc:ffffffc01035dbc0, 0, 0, 1, 3
    pc:ffffffc01035dbd4, 0, 0, 1, 3
    pc:ffffffc01035dbe4, 0, 0, 1, 3
    pc:ffffffc01035dbf8, 0, 0, 1, 3
    pc:ffffffc01035dc08, 0, 0, 1, 3
    pc:ffffffc01035dc1c, 0, 0, 1, 3
    pc:ffffffc01035dc2c, 0, 0, 1, 3
    pc:ffffffc01035dcc4, 0, 0, 1, 2
  gicv3_redist_region[0] @ 0xffffffc018f60000
    pc:ffffffc01030c258, 1, 10, 0, 0
    pc:ffffffc01030c3cc, 0, 0, 1, 1
    pc:ffffffc01030c3d8, 0, 0, 1, 1
    pc:ffffffc01030c410, 0, 0, 1, 8
    pc:ffffffc01030c428, 0, 0, 1, 1
    pc:ffffffc01030c8f4, 1, 4, 0, 0
    pc:ffffffc01030cc38, 0, 0, 1, 5
    pc:ffffffc01030d164, 1, 2, 0, 0
    pc:ffffffc01030d2b8, 1, 6, 0, 0
    pc:ffffffc01030d360, 1, 1, 0, 0
    pc:ffffffc01030d374, 0, 0, 1, 1
    pc:ffffffc01030d388, 1, 1, 0, 0
    pc:ffffffc01030e0c8, 0, 0, 1, 1
    pc:ffffffc01030e6c4, 1, 4, 0, 0
    pc:ffffffc0103131dc, 1, 1, 0, 0
    pc:ffffffc0103132b8, 1, 1, 0, 0
    pc:ffffffc01031339c, 0, 0, 1, 1
    pc:ffffffc010313410, 0, 0, 1, 1
    pc:ffffffc01031342c, 1, 1, 0, 0
    pc:ffffffc010313434, 0, 0, 1, 1
    pc:ffffffc01086c3c4, 1, 1, 0, 0

So I ran with the hotblocks plugin:

  ./qemu-system-aarch64 -cpu max,pauth-impdef=3Don -machine type=3Dvirt,vir=
tualization=3Don,gic-version=3D3 -display none -serial mon:stdio -kernel ~/=
lsrc/linux.git/builds/arm64.initramfs/arch/arm64/boot/Image -append "consol=
e=3DttyAMA0" -m 4096 -smp 1 -plugin contrib/plugins/libhotblocks.so -d plug=
in -D hotblocks.log

  collected 130606 entries in the hash table
  pc, tcount, icount, ecount
  0xffffffc010627fd0, 4, 10, 3998721 - memcpy
  0xffffffc010628288, 2, 6, 3984790 - memset
  0xffffffc01062832c, 3, 4, 1812870 - memset
  0xffffffc0100a8df8, 4, 4, 1743432 - __my_cpu_offset
  0xffffffc01015c394, 2, 4, 1304617 - __my_cpu_offset
  0xffffffc010093348, 3, 3, 1228845 - decay_load
  0xffffffc010093354, 3, 3, 1228447 - decay_load
  0xffffffc01009338c, 3, 2, 1228447 - decay_load
  0xffffffc01009336c, 3, 7, 1180051 - decay_load
  0xffffffc010631300, 3, 4, 1114347 - __radix_tree_lookup
  0xffffffc0106312c8, 3, 12, 1114337 - __radix_tree_lookup
  0xffffffc0106312f8, 3, 2, 1114337 -=20
  0xffffffc010132aec, 3, 4, 1080983
  0xffffffc010132afc, 3, 12, 1080983
  0xffffffc010132b30, 3, 2, 1080983
  0x000000004084b58c, 1, 1, 1052116
  0x000000004084b590, 1, 7, 1052116
  0x000000004084b57c, 1, 4, 1051127
  0xffffffc01001a118, 2, 6, 1049119
  0xffffffc01001a944, 2, 2, 1048689

So whatever is holding it up is because it's heavily spamming core
functions.

--=20
Alex Benn=C3=A9e
