Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3504782ejc;
        Mon, 16 Oct 2023 15:24:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHs4GBBdVo92lmFLRNd31VzprhjNzsr8/AaUs+fY2dFrcxlned5NEMJYuBYmbwGwPfldpt/
X-Received: by 2002:a05:620a:f14:b0:774:1c2f:ac48 with SMTP id v20-20020a05620a0f1400b007741c2fac48mr616736qkl.45.1697495054994;
        Mon, 16 Oct 2023 15:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697495054; cv=none;
        d=google.com; s=arc-20160816;
        b=yEsX6w3IY4ubTEG4xpo0RU5R2X+PzwR+hXK1wnxdw7aHXD+WVJRN4ND9Pn+K0xRxW2
         Ca08i3C6Ad3zcZUMuSITqXeccoUHNKzz2E/gH0CWy7GNn9VyhwYFEN6+QesyKud7yx4b
         AY0ihS+AI1klJwG9mn/4cpVYtTBCNX9K5ZBHEjh4YpFICD7tRcPICg4VGy0W7uM1hkRb
         vEKlaBu4Y7fS9xQbKQ4arsdf6hbFpW4KzODY0lt8GgiH64LPDYn/4CDNi1t0O0m8A2RK
         zTmRuFvKUwI40VDgwjKZ8S3c6PXRK6I2fhu74qMvS/jIPaG384VqKnLbmscCZog7y8jB
         ZY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LboeHrynkStEU1Mw4mM3PS8t5ngHh4Jj3A4fdgOy26w=;
        fh=dGkXD/vMF72n+Hn/EXL8BMhlQJKATuOFZ5gFS+N51UE=;
        b=yGxX6jkLvvQHKJcy9qrDQKNrJ/88ZUlfQzw94VtVbFw8qJhgyrwruUnAOOQ8UD3tTJ
         52dsKKimW0X08dm67Vep9r61d885xKjYGvXKVd0+JNQXDdpSruXm64S4qnU4tTEOuxEl
         nb2i17D3gMgGOFQ6WsNKOx7wvQ7fPFzZzT5TyExFLSjeguKsFqJssqMD3OtZwtShKS4V
         VQkPR41DN3G2Q6dAZpYahDEtguiaV1VNsivyqxzeNsR+ZVV10O5fIUfwouri9uguJmc9
         eEaGvUPe2jrjiLBV0tsE/uIMmEa31kcVkVLEdgW8/zRIoA2gxTuR/F9+wcBIaRLohlcn
         nCdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d2/wkuhZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z28-20020a05620a101c00b007777245a955si145803qkj.407.2023.10.16.15.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 15:24:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d2/wkuhZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsW0M-0006ii-F5; Mon, 16 Oct 2023 18:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1qsVAm-0003Lx-FE
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 17:30:53 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1qsVAj-0002tW-TA
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 17:30:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-323168869daso4746273f8f.2
 for <qemu-arm@nongnu.org>; Mon, 16 Oct 2023 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697491842; x=1698096642; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LboeHrynkStEU1Mw4mM3PS8t5ngHh4Jj3A4fdgOy26w=;
 b=d2/wkuhZSO/M8R6pTDr0rMxEJUKdBu1W48ZuDAEkw9lQsYOI/RhlxNiRg/gFzH3Fop
 keVQIhE4iNzscg7WIiCMsnof+T7rNbR/grpx9CPj6n+oo7nKhFRvjX0DF7LDy2mKrAON
 yTIZmH0CnCTCpUjbHQOHQPYkwduUBP6pAI4bnLcz0YLnM4r+UpAEofhWGoj8DqDBM61B
 XRlbRWvv9xAwzHDfA2Ug6E46hjM0Nsa9irElce1Ubw8rozgAv/dWTCmyN9IANq7ryJxQ
 XfgCSiBjgMZ1ZYH9BGmnaeBHSoKhxwr82XxCyavuQZxeBCsBBIBz6FhM5Ln9og73Vf4k
 dS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697491842; x=1698096642;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LboeHrynkStEU1Mw4mM3PS8t5ngHh4Jj3A4fdgOy26w=;
 b=I5dAzze/pliLrpROo4CoaBPT22ujoiaeMXa4xy94Xwdb2pUAMUP4xv/VXrHEOh53IH
 jceTwpAJcFWfxY6pxOPx/EAgUfPfJW3dvt2LORdtnLiOU4g+4P0z+SXhnqHiIuG4kcRC
 zgV70aeCZRkZhljrRc19BXPwed1fFHYlx5OzulcQ8BQC/DtFG+lvKX2Q8mGTvSkpqcC7
 fMfnvGz1VeJX7mHfYAs21TG9DgzYNYyj6tKg6MBI7I+VF1sTcD5qBDHPGW1S9+E6HS7Y
 /JYI6shrJlUaXKQCxweGSG/167HvpdjITzIjl6XZCXUwv8abzecNS/irs1JTPlt66NxR
 b/gg==
X-Gm-Message-State: AOJu0YyhNk/1O6moRTP+4rGRMvno2b03xybAAMro4NYjzRDmzoc6rZnh
 MKcYhb+1tAsK2f0lHPv6fHOexgxUADOlDqXENMYfcw==
X-Received: by 2002:adf:ecc1:0:b0:317:727f:3bc7 with SMTP id
 s1-20020adfecc1000000b00317727f3bc7mr453790wro.17.1697491842276; Mon, 16 Oct
 2023 14:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
 <20231002102231.GA3075015@myrica>
 <CANW9uyu85z9+-v8ait9EWcjWRu1+C8Xx3cM__8oBKof7fJwRwA@mail.gmail.com>
 <20231004105558.GA1454132@myrica>
In-Reply-To: <20231004105558.GA1454132@myrica>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 16 Oct 2023 15:30:30 -0600
Message-ID: <CANLsYky87enj0bkSs_PaKE=rM7odowfXZ2bT6W0KJ1RFyZApwg@mail.gmail.com>
Subject: Re: Quick start guide on RME emulation
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Itaru Kitayama <itaru.kitayama@gmail.com>, qemu-arm@nongnu.org, 
 Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 16 Oct 2023 18:24:05 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VFtKu0NEn8nK

Hi Jean-philippe,

Following the steps herein I have the following questions - please see below.

On Wed, 4 Oct 2023 at 04:55, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Mon, Oct 02, 2023 at 07:52:28PM +0900, Itaru Kitayama wrote:
> > Jean,
> > It is indeed the latter. Itd be good if we could test how far we can go in
> > terms of launching a Realm guest via the CCA aware KVM.
>
> Here is a draft doc that explains how to build and run the whole stack.
> I'm not sure where such a document should go. Maybe the QEMU wiki would be
> best, since these instructions will change frequently.
>
> Note:
>
> * The following instructions are for QEMU virt machine (just because it's
>   the one I'm familiar with). The sbsa-ref machine will be supported.
>
> * I haven't tried to run a secure payload yet, there might be some
>   outstanding bugs. Secure payload such as optee would be packaged with
>   TF-A as BL32.
>
> * I need to rebase the guest edk2 support, so didn't include instructions
>   for that.
>
> Software components:
>
>            |              |              |
>            |    REALM     |  NON-SECURE  |
>            |              |              |
>     -------+--------------+--------------+
>            |              |              |
>       EL0  | Guest Rootfs |  Host Rootfs |
>            |              |  VMM         |
>            |              |              |
>     -------+--------------+--------------+
>            |              |              |
>       EL1  |        EDK2  |              |
>            | Linux Guest  |              |
>            |              |  EDK2        |
>     -------+--------------+  Linux Host  |
>            |              |    (KVM)     |
>       EL2  |      TF-RMM  |              |
>            |              |              |
>     -------+--------------+--------------+
>            |                             |
>       EL3  |            TF-A             |
>            |                             |
>     -------+-----------------------------+
>            |                             |
>       HW   |            QEMU             |
>            |                             |
>     -------+-----------------------------+
>
>
> TF-RMM
> ------
>
> The Realm Management Monitor (RMM) connects KVM and the Realm guest.
>
> RMM gets loaded into NS DRAM (because there isn't enough space in Secure
> RAM). TF-A carves out 24MB of memory for the RMM, and tells other software
> about it using a device-tree reserved memory node.
>
> Status: QEMU support is currently under review. Additional patches are
>   needed until QEMU supports a couple additional features that are
>   mandatory for RME (PMUv3p7 and ECV).
>
> Repo: currently at https://jpbrucker.net/git/rmm/ branch qemu-rme
>       official is https://git.trustedfirmware.org/TF-RMM/tf-rmm.git/
>
> Build:  git submodule update --init --recursive
>         export CROSS_COMPILE=aarch64-linux-gnu-
>         cmake -DCMAKE_BUILD_TYPE=Debug -DRMM_CONFIG=qemu_virt_defcfg -DRMM_TOOLCHAIN=llvm -B build-qemu
>         cmake --build build-qemu
>

The -DRMM_TOOLCHAIN part puzzled me since it was not in the RMM build
instruction for the FVP model.  Is it mandatory and if so, what
version of llvm are you using?  As with the FVP model, I used the
following:

CROSS_COMPILE=/home/mpoirier/work/cca/optee-cca/toolchains/aarch64-none-elf/bin/aarch64-none-elf-
cmake -DRMM_CONFIG=qemu_virt_defcfg -DCMAKE_BUILD_TYPE=Debug
-DLOG_LEVEL=40 -B build
cmake --build build

The "aarch64-none-elf" is exactly the same as the one in the FVP model.

>
> Host EDK2
> ---------
>
> Works out of the box, although it doesn't properly account for reserved
> RMM memory yet.
>

Not sure what to make of the above statement - should I expect the
host boot stack to crash when launching QEMU?

> Repo: https://github.com/tianocore/edk2.git
>
> Build:  git submodule update --init --recursive
>         source edksetup.sh
>         make -j -C BaseTools
>         export GCC5_AARCH64_PREFIX=aarch64-linux-gnu-
>         build -b RELEASE -a AARCH64 -t GCC5 -p ArmVirtPkg/ArmVirtQemuKernel.dsc
>

This compiled properly.

>
> TF-A
> ----
>
> TF-A loads the RMM as well as the Non-secure firmware, and bridges RMM and
> KVM. It also owns the Granule Protection Table (GPT).
>
> Status: QEMU support is currently under review.
>
> Repo: currently at https://jpbrucker.net/git/tf-a/ branch qemu-rme
>       official is https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/
>
> Build:  # Embed the RMM image and edk2 into the Final Image Package (FIP)
>         make -j CROSS_COMPILE=aarch64-linux-gnu- PLAT=qemu
>                 ENABLE_RME=1 DEBUG=1 LOG_LEVEL=40
>                 RMM=rmm/build-qemu/Debug/rmm.img
>                 BL33=edk2/Build/ArmVirtQemuKernel-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd
>                 all fip
>
>         # Pack whole image into flash.bin
>         dd if=tfa/build/qemu/debug/bl1.bin of=flash.bin
>         dd if=tfa/build/qemu/debug/fip.bin of=flash.bin seek=64 bs=4096
>

This compiled properly.

>
> Host & Guest Linux
> ------------------
>
> Both host and guest need extra patches
>
> Status: https://lore.kernel.org/linux-arm-kernel/20231002124311.204614-1-suzuki.poulose@arm.com/
>
> Repo: https://gitlab.arm.com/linux-arm/linux-cca cca-full/rmm-v1.0-eac2
>
> Build: arm64 defconfig
>
>

This compiled properly.

> VMM
> ---
>
> Kvmtool and QEMU can be used to launch Realm guests. For kvmtool, see the
> cover letter for the Linux support above.
>
> Status: In development
>
> Repo: for now https://jpbrucker.net/git/qemu/ branch cca/rmm-v1.0-eac2
>
> Build:  git submodule update --init --recursive
>         # to download the missing subprojects because buildroot won't do it:
>         ./configure --target-list=aarch64-softmmu
>         # Note: when buildroot is configured to use this tree (see below),
>         # it will rsync the whole tree including binary files. Therefore,
>         # use a separate build directory to make the system emulation
>         # QEMU, to avoid conflicts between native binary files and
>         # buildroot's cross-build.
>

This got a little tricky.  From what I understand this is the
"emulation" QEMU, which should likely be in a directory called
"qemu.host".  The QEMU referenced from buildroot should be in another
directory, something like "qemu.buildroot", for buildroot to build.
Is this correct?

>
> Rootfs
> ------
>
> Buildroot provides a convenient way to build lightweight root filesystems.
> It can also embed the VMM into the rootfs if you specify the path to
> kvmtool or QEMU source in a local.mk file in the build directory.
>
> Repo: https://gitlab.com/buildroot.org/buildroot.git
>

Did you use the master branch or a stable one?  If so, which one?

> local.mk
>         KVMTOOL_OVERRIDE_SRCDIR = path/to/kvmtool/
>         QEMU_OVERRIDE_SRCDIR = path/to/qemu/
>

Please confirm that "local.mk" is not part of the buildroot repository
and needs to be created.  Also confirm that KVMTOOLS don't need to be
specified, this is for demonstration purposes.  And following my
comment above, "path/to/qemu" should be "path/to/qemu.buildroot".

> Build:  make qemu_aarch64_virt_defconfig
>         # then change some options
>           # BR2_LINUX_KERNEL is not set
>           BR2_PACKAGE_KVMTOOL=y
>           BR2_PACKAGE_QEMU=y
>           BR2_PACKAGE_QEMU_SYSTEM=y
>           # BR2_PACKAGE_QEMU_BLOBS is not set
>           BR2_PACKAGE_QEMU_SLIRP=y
>           BR2_PACKAGE_QEMU_CHOOSE_TARGETS=y
>           BR2_PACKAGE_QEMU_TARGET_AARCH64=y
>           BR2_TARGET_ROOTFS_EXT2_SIZE=256M
>

I used branch 2023.08.x and several of the above options were _not_
present in the ".config" file, namely BR2_PACKAGE_QEMU_SYSTEM,
BR2_PACKAGE_QEMU_BLOBS, BR2_PACKAGE_QEMU_SLIRP,
BR2_PACKAGE_QEMU_CHOOSE_TARGETS and BR2_PACKAGE_QEMU_TARGET_AARCH64.
Moreover, I tried building buildroot without any changes to the
".config" file and the compilation failed.  This leads me to beleive
we are working on different branches.  I will try the master branch
once I am done with this email.

Clarifications on the above points would be great.

Thanks,
Mathieu

>           # Generate an initrd for the guest
>           BR2_TARGET_ROOTFS_CPIO=y
>
>         make
>
>
> QEMU system emulation
> ---------------------
>
> Repo: https://gitlab.com/qemu-project/qemu.git
>
> Run with:
>
>         qemu-system-aarch64 -M virt,virtualization=on,secure=on,gic-version=3
>                 -M acpi=off -cpu max,x-rme=on,sme=off -m 3G -smp 8
>                 -nographic
>                 -bios tf-a/flash.bin
>                 -kernel linux/arch/arm64/boot/Image
>                 -drive format=raw,if=none,file=buildroot/output/images/rootfs.ext4,id=hd0
>                 -device virtio-blk-pci,drive=hd0
>                 -append root=/dev/vda
>
> To use separate consoles for FW (port 54320), secure payload (54321), host
> (54322) and guest (54323):
>
>                 -nodefaults
>                 -serial tcp:localhost:54320
>                 -serial tcp:localhost:54321
>                 -chardev socket,mux=on,id=hvc0,port=54322,host=localhost
>                 -device virtio-serial-device
>                 -device virtconsole,chardev=hvc0
>                 -chardev socket,mux=on,id=hvc1,port=54323,host=localhost
>                 -device virtio-serial-device
>                 -device virtconsole,chardev=hvc1
>                 -append "root=/dev/vda console=hvc0"
>                 -device virtio-net-pci,netdev=net0 -net user,id=net0
>
>   And connect with 'socat -,rawer TCP-LISTEN:5432x'
>
> To share the files needed for booting the guest:
>
>                 -device virtio-9p-device,fsdev=shr0,mount_tag=shr0
>                 -fsdev local,security_model=none,path=.,id=shr0
>
>   And 'mount -t 9p shr0 /mnt' in the host.
>
>
> Then in the host, launch a Realm guest:
>
>         qemu-system-aarch64 -M virt,acpi=off,gic-version=3 -nographic
>                 -cpu host -enable-kvm -smp 2 -m 512M -overcommit mem-lock=on
>                 -kernel /mnt/linux/arch/arm64/boot/Image
>                 -initrd /mnt/buildroot/output/images/rootfs.cpio
>                 -append "console=hvc0 root=/dev/vda"
>                 -M confidential-guest-support=rme0
>                 -object rme-guest,id=rme0,measurement-algo=sha512,num-pmu-counters=6,sve-vector-length=256
>                 -nodefaults -chardev stdio,mux=on,id=hvc0,signal=off
>                 -device virtio-serial-pci -device virtconsole,chardev=hvc0
>                 -device virtio-net-pci,netdev=net0,romfile= -netdev user,id=net0
>                 </dev/hvc1 >/dev/hvc1 &
>         ...
>         [    0.000000] RME: RSI version 13.0 advertised
>
