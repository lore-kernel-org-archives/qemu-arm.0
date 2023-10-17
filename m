Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4244585ejc;
        Tue, 17 Oct 2023 15:39:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX+6Sy9v6bxD7VOwzxr1n96Nf/ndjNZx/EwdzFNaHubPhQNgPIvIDY6u4zuq73EaUybdhd
X-Received: by 2002:a05:6214:c22:b0:65b:2008:8a23 with SMTP id a2-20020a0562140c2200b0065b20088a23mr3873035qvd.53.1697582376107;
        Tue, 17 Oct 2023 15:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697582376; cv=none;
        d=google.com; s=arc-20160816;
        b=oEzW+kYbZ96nD4ADXZSrWHUzH5CJSu0iYAa3w+7uR8ck1EE31GrqR3G7e2zJjdUXjA
         QLIjAcv1XkNpcRa60/r1lVKimKGh2i/2hBAiWg5ckzQoC+HVb7h8Cn8nbnNE5HCCvJTv
         tFa+NQ/lJk4difEFVyhENkB77xef+dE0AA7AvfQlMH2StjZjnp/SEZMMiX805J5+c/nJ
         CV972q3PhIenAQah2k6oqkeMfJS2SiKxxrCcBEnDbrA4Gsk3tmaeKe5P9Ferr0xIZ0Ab
         93E55fZpRnR1J9x9WQO/zv7N+I9UR3Y4mrT4f+c6RgjOMoUGGDCun7CfV7wamebN+h/u
         BJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xXbuEngyOp00YLVGb6sOhxliFtaPzq8x0M1UxYFVVQ8=;
        fh=dGkXD/vMF72n+Hn/EXL8BMhlQJKATuOFZ5gFS+N51UE=;
        b=0H3zqf70TMd5be9v8wa3oViH2x2LdSeDrbkyByuUOBCUzoNTtI/OBlBgF/MoMtzDvT
         BVveLc4jD6dMAq9h5vkCB0UPURGhzPrnLSGVCh4ihv7NfUcBvDIEib0qU9s7nf26ZyZO
         G3hbmm4VUn9XKAwYD5s2HX2lIsaTOHe6JJsp8Gf5v6rSINK0hthm1iqphH9P5jmb4AQC
         eCTUdz1dSTEV/SMP9gx74ifAlmm40MD6F+kBjpY9M/7ZEFeC20m5YMuE4zXWakLCihZh
         wvSFJNQzgGyr2p1B3nRDiJ/42aDFIGSY06zD19xkU+jAqM6/0zI6WbCs4+mcnB7Dh6Zr
         ggUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b6whxvje;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz13-20020a0562140e6d00b0065cfd56f080si1804035qvb.581.2023.10.17.15.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 15:39:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b6whxvje;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qssio-0006Sg-5l; Tue, 17 Oct 2023 18:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1qssil-0006J8-Sz
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 18:39:27 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1qssif-0006nz-Po
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 18:39:27 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so5413025f8f.2
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 15:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697582359; x=1698187159; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xXbuEngyOp00YLVGb6sOhxliFtaPzq8x0M1UxYFVVQ8=;
 b=b6whxvje8t/J8PW7vEYVGsTmyubouquxCu/UqneQQCZ5NBZZh0u1K7DYxQEFXwiMrk
 7iH9isB99j/LPH9Ho3169iCe/S7vfgc5T/weI/MAkb+7S8x0bI2c5jgk+vRNIsAC57fP
 4yPxWe8Czms85WFPQrYg6V/BtQFfK2yVj3zkqs0GrRC5j8qXtnuUCjzXYecsuQ/4JRx9
 M4rZ0x/iYmb3GS12CXhGNKOLxqCSeD3i8RycHSQQI1pjYEn+C9BJhP2bSNgD5OOdOPYS
 QOkftcD0bPhJfaGqqCR1dlODQIzmqjLtcVypYwzjvzckSAHxp5At2riY9k/g5i3Kt/vm
 1MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697582359; x=1698187159;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xXbuEngyOp00YLVGb6sOhxliFtaPzq8x0M1UxYFVVQ8=;
 b=baO3RTcX+8x7JNXsqkFZ6jruCUXHQ+PDVRnokNGReYlOoSTeurJLFpeIr0+O+yCeHb
 HxGD9sMAFjSzgG5h97dca0Msv/CifHR8gzwl/FqkQnM70wOtKgiePB2KEcj9OKUTCeiB
 rQWDDYCPS5SYBDShWV+l6zff1mOsxCqBOWlQa9t9FZ5soXdJ1qDzmw/oWngAxmNSo8Br
 GTpZ52c2XK+r9zBN+mQGeOBWP5w2hrn0bLLFNglkmTbe64bRoYsZanGsqFXnP2Us6vPN
 TvIH/8+QxBoakIvKrJhnRbCiQ79NjxndAGCYMYh1NbJgkolNinU/NLtD+5QSiuVjuDO6
 QP6g==
X-Gm-Message-State: AOJu0Yx4OmLtnxpQ3V8JJJxbli9ASoIjx+c1sn2nuoqHTrOYVf9/lTLL
 K2YcyW986QBBREfHD90o28nv6qbOwukXR+e1e51gJg==
X-Received: by 2002:adf:f791:0:b0:32d:804c:15d1 with SMTP id
 q17-20020adff791000000b0032d804c15d1mr2620925wrp.47.1697582359524; Tue, 17
 Oct 2023 15:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
 <20231002102231.GA3075015@myrica>
 <CANW9uyu85z9+-v8ait9EWcjWRu1+C8Xx3cM__8oBKof7fJwRwA@mail.gmail.com>
 <20231004105558.GA1454132@myrica>
 <CANLsYky87enj0bkSs_PaKE=rM7odowfXZ2bT6W0KJ1RFyZApwg@mail.gmail.com>
 <20231017135647.GB835650@myrica>
In-Reply-To: <20231017135647.GB835650@myrica>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 17 Oct 2023 16:39:08 -0600
Message-ID: <CANLsYkwwKRKW8qD__JvmpJteSgmzh0nEVVmR382oer+5v6ZuCQ@mail.gmail.com>
Subject: Re: Quick start guide on RME emulation
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Itaru Kitayama <itaru.kitayama@gmail.com>, qemu-arm@nongnu.org, 
 Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: lklppw0HFohm

On Tue, 17 Oct 2023 at 07:56, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Mon, Oct 16, 2023 at 03:30:30PM -0600, Mathieu Poirier wrote:
> > > TF-RMM
> > > ------
> > >
> > > The Realm Management Monitor (RMM) connects KVM and the Realm guest.
> > >
> > > RMM gets loaded into NS DRAM (because there isn't enough space in Secure
> > > RAM). TF-A carves out 24MB of memory for the RMM, and tells other software
> > > about it using a device-tree reserved memory node.
> > >
> > > Status: QEMU support is currently under review. Additional patches are
> > >   needed until QEMU supports a couple additional features that are
> > >   mandatory for RME (PMUv3p7 and ECV).
> > >
> > > Repo: currently at https://jpbrucker.net/git/rmm/ branch qemu-rme
> > >       official is https://git.trustedfirmware.org/TF-RMM/tf-rmm.git/
> > >
> > > Build:  git submodule update --init --recursive
> > >         export CROSS_COMPILE=aarch64-linux-gnu-
> > >         cmake -DCMAKE_BUILD_TYPE=Debug -DRMM_CONFIG=qemu_virt_defcfg -DRMM_TOOLCHAIN=llvm -B build-qemu
> > >         cmake --build build-qemu
> > >
> >
> > The -DRMM_TOOLCHAIN part puzzled me since it was not in the RMM build
> > instruction for the FVP model.  Is it mandatory and if so, what
> > version of llvm are you using?  As with the FVP model, I used the
> > following:
> >
> > CROSS_COMPILE=/home/mpoirier/work/cca/optee-cca/toolchains/aarch64-none-elf/bin/aarch64-none-elf-
> > cmake -DRMM_CONFIG=qemu_virt_defcfg -DCMAKE_BUILD_TYPE=Debug
> > -DLOG_LEVEL=40 -B build
> > cmake --build build
> >
> > The "aarch64-none-elf" is exactly the same as the one in the FVP model.
>
> Both GCC and LLVM should work, but I had some trouble with GCC and haven't
> had time to investigate yet, so I provided instructions for LLVM (v16)
> which works for me. I'm probably using the wrong GCC toolchain, because
> I'm currently getting these link errors:
>
> /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: warning: libc.so.6, needed by /usr/aarch64-linux-gnu/lib/libm.so.6, not found (try using -rpath or -rpath-link)
> /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__strtold_nan@GLIBC_PRIVATE'
> /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `stderr@GLIBC_2.17'
> /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `qsort@GLIBC_2.17'
> /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__strtof_nan@GLIBC_PRIVATE'
> /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `fwrite@GLIBC_2.17'
> /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `errno@GLIBC_PRIVATE'
> /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `fputs@GLIBC_2.17'
> /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__strtod_nan@GLIBC_PRIVATE'
> /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__assert_fail@GLIBC_2.17'
>

I had the same errors, which is why I switched to aarch64-none-elf
[1], the same as what is used for the FVP code base.  If you have
time, try that on your side and let me know if things still work.

[1]. https://developer.arm.com/-/media/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-elf.tar.xz?rev=a8bbb76353aa44a69ce6b11fd560142d&hash=20124930455F791137DDEA1F0AF79B10

>
> >
> > >
> > > Host EDK2
> > > ---------
> > >
> > > Works out of the box, although it doesn't properly account for reserved
> > > RMM memory yet.
> > >
> >
> > Not sure what to make of the above statement - should I expect the
> > host boot stack to crash when launching QEMU?
>
> I'm still figuring that out but I don't think so, because edk2 seems to
> allocate stack and heap memory from the top of RAM, so it won't touch the
> RMM memory (which I placed near the bottom at 0x40100000-0x418fffff).
>
> But we can't rely on this, so long term we'll need to make edk2 aware that
> there is a hole in RAM. I need a better understanding of edk2 memory
> management first.
>

Ok, I hope to get to that part tomorrow.

> > > VMM
> > > ---
> > >
> > > Kvmtool and QEMU can be used to launch Realm guests. For kvmtool, see the
> > > cover letter for the Linux support above.
> > >
> > > Status: In development
> > >
> > > Repo: for now https://jpbrucker.net/git/qemu/ branch cca/rmm-v1.0-eac2
> > >
> > > Build:  git submodule update --init --recursive
> > >         # to download the missing subprojects because buildroot won't do it:
> > >         ./configure --target-list=aarch64-softmmu
> > >         # Note: when buildroot is configured to use this tree (see below),
> > >         # it will rsync the whole tree including binary files. Therefore,
> > >         # use a separate build directory to make the system emulation
> > >         # QEMU, to avoid conflicts between native binary files and
> > >         # buildroot's cross-build.
> > >
> >
> > This got a little tricky.  From what I understand this is the
> > "emulation" QEMU, which should likely be in a directory called
> > "qemu.host".  The QEMU referenced from buildroot should be in another
> > directory, something like "qemu.buildroot", for buildroot to build.
> > Is this correct?
>
> Yes. Two separate source trees should be easiest to deal with.
>
> To ensure my VMM changes don't break emulation QEMU I use a single source
> tree, and a separate build directory for the emulation QEMU:
>
>         cd ~/build/qemu.host/
>         ~/src/qemu/configure --target-list=aarch64-softmmu
>         make -j
>
> > >
> > > Rootfs
> > > ------
> > >
> > > Buildroot provides a convenient way to build lightweight root filesystems.
> > > It can also embed the VMM into the rootfs if you specify the path to
> > > kvmtool or QEMU source in a local.mk file in the build directory.
> > >
> > > Repo: https://gitlab.com/buildroot.org/buildroot.git
> > >
> >
> > Did you use the master branch or a stable one?  If so, which one?
>
> I'm using the master branch (currently I'm on 96130dc204)
>
> >
> > > local.mk
> > >         KVMTOOL_OVERRIDE_SRCDIR = path/to/kvmtool/
> > >         QEMU_OVERRIDE_SRCDIR = path/to/qemu/
> > >
> >
> > Please confirm that "local.mk" is not part of the buildroot repository
> > and needs to be created.  Also confirm that KVMTOOLS don't need to be
> > specified, this is for demonstration purposes.  And following my
> > comment above, "path/to/qemu" should be "path/to/qemu.buildroot".
>
> Yes, local.mk needs to be created, and KVMTOOL_OVERRIDE_SRCDIR isn't
> needed if you're planning to only use QEMU to launch Realm VMs
>
> >
> > > Build:  make qemu_aarch64_virt_defconfig
> > >         # then change some options
> > >           # BR2_LINUX_KERNEL is not set
> > >           BR2_PACKAGE_KVMTOOL=y
> > >           BR2_PACKAGE_QEMU=y
> > >           BR2_PACKAGE_QEMU_SYSTEM=y
> > >           # BR2_PACKAGE_QEMU_BLOBS is not set
> > >           BR2_PACKAGE_QEMU_SLIRP=y
> > >           BR2_PACKAGE_QEMU_CHOOSE_TARGETS=y
> > >           BR2_PACKAGE_QEMU_TARGET_AARCH64=y
> > >           BR2_TARGET_ROOTFS_EXT2_SIZE=256M
> > >
> >
> > I used branch 2023.08.x and several of the above options were _not_
> > present in the ".config" file, namely BR2_PACKAGE_QEMU_SYSTEM,
> > BR2_PACKAGE_QEMU_BLOBS, BR2_PACKAGE_QEMU_SLIRP,
> > BR2_PACKAGE_QEMU_CHOOSE_TARGETS and BR2_PACKAGE_QEMU_TARGET_AARCH64.
> > Moreover, I tried building buildroot without any changes to the
> > ".config" file and the compilation failed.  This leads me to beleive
> > we are working on different branches.  I will try the master branch
> > once I am done with this email.
> >
>

I figured that part - missing options are because
qemu_aarch64_virt_defconfig doesn't include QEMU, it has to be
enabled.  To do so "make menuconfig" needs to be used rather than
adding the configuration by hand, otherwise some options will be
missing.

> Buildroot keeps the QEMU build recipe in package/qemu/qemu.mk which only
> has instructions for one version of QEMU (QEMU_VERSION). Since QEMU's
> configure options change regularly and my VMM modifications are based on
> QEMU's master branch, I use buildroot's master branch in order to get the
> most recent qemu.mk.
>

I also figured that problem out - have a look at this [2].  Simply
put, that patch moves the handling of submodules to the mason build
system.  As such doing "git submodule update --init --recursive" won't
work to download the submodules in the QEMU code base.  Nowadays QEMU
submodules are downloaded as part of the configure script that calls
mason.  So calling "./configure --target-list=aarch64-softmmu" will
download the submodules.  So the procedure becomes:

$ cd qemu.target
$  ./configure --target-list=aarch64-softmmu //downloads the
submodules as part of the configuration process
$ make clean  //removes the "build" directory and configuration files,
but leaves the submodules.
$ // qemu.target is now ready to be referenced in the local.mk file in
the buildroot directory

The above is a hack to deal with an upstream regression.  We will have
to address that regression but for now all I want is to reproduce your
environment, something I will hopefully be able to achieve tomorrow.

[2].  https://www.mail-archive.com/qemu-devel@nongnu.org/msg967757.html

> Thanks,
> Jean
