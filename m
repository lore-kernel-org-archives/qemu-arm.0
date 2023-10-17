Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3937667ejc;
        Tue, 17 Oct 2023 06:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcDfAb4HxuT2ZUll8TUnOYQuc/WIuK4Gws/HECn2l2wzriDNC2fV7iy9aLNPZoGEnJWIXW
X-Received: by 2002:a05:6214:29cc:b0:655:d6af:1c37 with SMTP id gh12-20020a05621429cc00b00655d6af1c37mr2341724qvb.65.1697551024349;
        Tue, 17 Oct 2023 06:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697551024; cv=none;
        d=google.com; s=arc-20160816;
        b=K+ZxmqLmxYBUVhzOcPIg2QG5oMIpIMuozfHf43hXaOy43+nUWMcEDly92LvDQquv1n
         1GsDy7xBwZUw/fQ8WI2xKdvepzCPILn+BGteGBDH4kbbkyEtDc/8/XsKcqqad7TvyCWy
         /ubphRl7OPTJABrSsHrEfybuaiT+aWIs2GZ/si/xGVGRCR0dDgWzZyQPfi40Pooa2EFB
         9reBotkfXshxSR1aLqlBHNECCSy4MjqiaNBoUIcYT/+OXb15zo8xbf0VLlP6sbsk17d+
         EtCC84icJ9dFibimKnL1jO5uDzA2OqszQv+mvndD+owP3IocZoAweuzVcPKGBVzyiV4v
         38vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=hbIxBE94fKsxgztzJMk2M0FJiSXDy4k4lvIgryPHLsE=;
        fh=Pfhq8wFxCkpFzniIvj4dX8EJ6qNAeD3ht3csU6tASyU=;
        b=Xc1pllIdUWU7eAyq4srsvq7nkyjkAn6Tjm9vsTF6eOoRBh5QDyQGPO2j6ofQyte5D3
         I32hokM1hR9/owF5wPAm7gbkIloVbJQge902ouTOiDYBLgSYoJzkwuFu9siL+oNIrJfX
         G44CyeWqOOb+Ni7dUztFEtluKM8pUJ/CgMw9Lua6Am/py+fg7LFh2DGr/JtzByGrzDz2
         wDMdnIPfEnX+YLd9uh/zIFrLQMtyilFIE7KYD6FJlSMERHEvR2ZLI7c0m+z3xf+O9WlG
         aca/TlLu5AQd9CnJbEePAQA6lqtebxMaB1MBP4ogqdrp1qWUMLjCAFeqK1rRlMDFWt5k
         EAgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UfIT08T5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id nd10-20020a056214420a00b0065afca081f4si999730qvb.301.2023.10.17.06.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 06:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UfIT08T5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qskZ4-0005cj-Bs; Tue, 17 Oct 2023 09:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qskZ3-0005c2-DM
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 09:56:53 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qskYu-0007J4-Nf
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 09:56:53 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5079eed8bfbso5069278e87.1
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697551002; x=1698155802; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hbIxBE94fKsxgztzJMk2M0FJiSXDy4k4lvIgryPHLsE=;
 b=UfIT08T57j4V/9UwElwJAmyKRUKX/KWWceIvQ80aE3Ba5cHtmdzy9nL3BwfDtomVQZ
 z2N7TdBEbZDLsp/C3TXLErhLKmVYYPS8jpOQ4DtxGYd6UYJmDtZwVJ/htlKyI14J3JKr
 ZkbbB+EhPO+BoQmJSlGuN0BsLDgx+wM7RmMGKF5YGX7HRtEPPoDCD1iGJ6vDU1Nq2EVE
 1vPsCNr1sm+0l2uL/4jgp390CY+MMHWgXykQoVcH+JlvE+m7Brhrtbpd4edi0gdTv57D
 +Vi+7ayER6+qNbUcLAgB3mC+9a0ZoUSqrlxJeIvNxVIbqn87y3SoJCzHCJruGfQDsD67
 PKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697551002; x=1698155802;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hbIxBE94fKsxgztzJMk2M0FJiSXDy4k4lvIgryPHLsE=;
 b=tJ1EUzzwQ5+v53Amn3L20rGSe06pucQi24zLCcB+ixIr0Snn2X1RiGnZQ29J44bAD6
 xTIck8hNY7EHoUIh8MAP/zQaslSN81Y9WAXHUW9zPtto3uYMJL/HruE7zQlmsTbj1HMv
 sHKxScKPH/+WKHq9KQ7kbHOwG/9V4Omx0Sgo7n7EUINjTl1m3d6c3dFOkNT2p1i7XEUP
 UeXEdt0kEWQYlcmSB47QD5MDa2iWo+esokG7RfH00t8ZEzFggXM+O+sZNK9gcA71OE5x
 +ETXZMpiQf3YCduvYa88s+jhQAO7sPv3Cv+jmEhDw7G2you5Z96PEw60ttzyo2Aze02B
 gYGA==
X-Gm-Message-State: AOJu0YyZH1vfFlSNAgqLsngpdIrWswxjiWbYyVqVSfklsQ0prF+M9Yo7
 6CDi0KVo0McvSOz+uhQIZD9XAZFSTWRUGLhAb70=
X-Received: by 2002:ac2:4d90:0:b0:507:9ff6:75b6 with SMTP id
 g16-20020ac24d90000000b005079ff675b6mr1790071lfe.50.1697551002211; 
 Tue, 17 Oct 2023 06:56:42 -0700 (PDT)
Received: from myrica ([2a02:c7c:7290:b00:fd32:2b31:6755:400c])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a5d4982000000b0032d87b13240sm1762439wrq.73.2023.10.17.06.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 06:56:41 -0700 (PDT)
Date: Tue, 17 Oct 2023 14:56:47 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Itaru Kitayama <itaru.kitayama@gmail.com>, qemu-arm@nongnu.org,
 Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: Quick start guide on RME emulation
Message-ID: <20231017135647.GB835650@myrica>
References: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
 <20231002102231.GA3075015@myrica>
 <CANW9uyu85z9+-v8ait9EWcjWRu1+C8Xx3cM__8oBKof7fJwRwA@mail.gmail.com>
 <20231004105558.GA1454132@myrica>
 <CANLsYky87enj0bkSs_PaKE=rM7odowfXZ2bT6W0KJ1RFyZApwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYky87enj0bkSs_PaKE=rM7odowfXZ2bT6W0KJ1RFyZApwg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=jean-philippe@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: 4Eur/Ndawi3X

On Mon, Oct 16, 2023 at 03:30:30PM -0600, Mathieu Poirier wrote:
> > TF-RMM
> > ------
> >
> > The Realm Management Monitor (RMM) connects KVM and the Realm guest.
> >
> > RMM gets loaded into NS DRAM (because there isn't enough space in Secure
> > RAM). TF-A carves out 24MB of memory for the RMM, and tells other software
> > about it using a device-tree reserved memory node.
> >
> > Status: QEMU support is currently under review. Additional patches are
> >   needed until QEMU supports a couple additional features that are
> >   mandatory for RME (PMUv3p7 and ECV).
> >
> > Repo: currently at https://jpbrucker.net/git/rmm/ branch qemu-rme
> >       official is https://git.trustedfirmware.org/TF-RMM/tf-rmm.git/
> >
> > Build:  git submodule update --init --recursive
> >         export CROSS_COMPILE=aarch64-linux-gnu-
> >         cmake -DCMAKE_BUILD_TYPE=Debug -DRMM_CONFIG=qemu_virt_defcfg -DRMM_TOOLCHAIN=llvm -B build-qemu
> >         cmake --build build-qemu
> >
> 
> The -DRMM_TOOLCHAIN part puzzled me since it was not in the RMM build
> instruction for the FVP model.  Is it mandatory and if so, what
> version of llvm are you using?  As with the FVP model, I used the
> following:
> 
> CROSS_COMPILE=/home/mpoirier/work/cca/optee-cca/toolchains/aarch64-none-elf/bin/aarch64-none-elf-
> cmake -DRMM_CONFIG=qemu_virt_defcfg -DCMAKE_BUILD_TYPE=Debug
> -DLOG_LEVEL=40 -B build
> cmake --build build
> 
> The "aarch64-none-elf" is exactly the same as the one in the FVP model.

Both GCC and LLVM should work, but I had some trouble with GCC and haven't
had time to investigate yet, so I provided instructions for LLVM (v16)
which works for me. I'm probably using the wrong GCC toolchain, because
I'm currently getting these link errors:

/usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: warning: libc.so.6, needed by /usr/aarch64-linux-gnu/lib/libm.so.6, not found (try using -rpath or -rpath-link)
/usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__strtold_nan@GLIBC_PRIVATE'
/usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `stderr@GLIBC_2.17'
/usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `qsort@GLIBC_2.17'
/usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__strtof_nan@GLIBC_PRIVATE'
/usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `fwrite@GLIBC_2.17'
/usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `errno@GLIBC_PRIVATE'
/usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `fputs@GLIBC_2.17'
/usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__strtod_nan@GLIBC_PRIVATE'
/usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__assert_fail@GLIBC_2.17'


> 
> >
> > Host EDK2
> > ---------
> >
> > Works out of the box, although it doesn't properly account for reserved
> > RMM memory yet.
> >
> 
> Not sure what to make of the above statement - should I expect the
> host boot stack to crash when launching QEMU?

I'm still figuring that out but I don't think so, because edk2 seems to
allocate stack and heap memory from the top of RAM, so it won't touch the
RMM memory (which I placed near the bottom at 0x40100000-0x418fffff).

But we can't rely on this, so long term we'll need to make edk2 aware that
there is a hole in RAM. I need a better understanding of edk2 memory
management first.

> > VMM
> > ---
> >
> > Kvmtool and QEMU can be used to launch Realm guests. For kvmtool, see the
> > cover letter for the Linux support above.
> >
> > Status: In development
> >
> > Repo: for now https://jpbrucker.net/git/qemu/ branch cca/rmm-v1.0-eac2
> >
> > Build:  git submodule update --init --recursive
> >         # to download the missing subprojects because buildroot won't do it:
> >         ./configure --target-list=aarch64-softmmu
> >         # Note: when buildroot is configured to use this tree (see below),
> >         # it will rsync the whole tree including binary files. Therefore,
> >         # use a separate build directory to make the system emulation
> >         # QEMU, to avoid conflicts between native binary files and
> >         # buildroot's cross-build.
> >
> 
> This got a little tricky.  From what I understand this is the
> "emulation" QEMU, which should likely be in a directory called
> "qemu.host".  The QEMU referenced from buildroot should be in another
> directory, something like "qemu.buildroot", for buildroot to build.
> Is this correct?

Yes. Two separate source trees should be easiest to deal with.

To ensure my VMM changes don't break emulation QEMU I use a single source
tree, and a separate build directory for the emulation QEMU:

	cd ~/build/qemu.host/
	~/src/qemu/configure --target-list=aarch64-softmmu
	make -j

> >
> > Rootfs
> > ------
> >
> > Buildroot provides a convenient way to build lightweight root filesystems.
> > It can also embed the VMM into the rootfs if you specify the path to
> > kvmtool or QEMU source in a local.mk file in the build directory.
> >
> > Repo: https://gitlab.com/buildroot.org/buildroot.git
> >
> 
> Did you use the master branch or a stable one?  If so, which one?

I'm using the master branch (currently I'm on 96130dc204)

> 
> > local.mk
> >         KVMTOOL_OVERRIDE_SRCDIR = path/to/kvmtool/
> >         QEMU_OVERRIDE_SRCDIR = path/to/qemu/
> >
> 
> Please confirm that "local.mk" is not part of the buildroot repository
> and needs to be created.  Also confirm that KVMTOOLS don't need to be
> specified, this is for demonstration purposes.  And following my
> comment above, "path/to/qemu" should be "path/to/qemu.buildroot".

Yes, local.mk needs to be created, and KVMTOOL_OVERRIDE_SRCDIR isn't
needed if you're planning to only use QEMU to launch Realm VMs

> 
> > Build:  make qemu_aarch64_virt_defconfig
> >         # then change some options
> >           # BR2_LINUX_KERNEL is not set
> >           BR2_PACKAGE_KVMTOOL=y
> >           BR2_PACKAGE_QEMU=y
> >           BR2_PACKAGE_QEMU_SYSTEM=y
> >           # BR2_PACKAGE_QEMU_BLOBS is not set
> >           BR2_PACKAGE_QEMU_SLIRP=y
> >           BR2_PACKAGE_QEMU_CHOOSE_TARGETS=y
> >           BR2_PACKAGE_QEMU_TARGET_AARCH64=y
> >           BR2_TARGET_ROOTFS_EXT2_SIZE=256M
> >
> 
> I used branch 2023.08.x and several of the above options were _not_
> present in the ".config" file, namely BR2_PACKAGE_QEMU_SYSTEM,
> BR2_PACKAGE_QEMU_BLOBS, BR2_PACKAGE_QEMU_SLIRP,
> BR2_PACKAGE_QEMU_CHOOSE_TARGETS and BR2_PACKAGE_QEMU_TARGET_AARCH64.
> Moreover, I tried building buildroot without any changes to the
> ".config" file and the compilation failed.  This leads me to beleive
> we are working on different branches.  I will try the master branch
> once I am done with this email.
> 

Buildroot keeps the QEMU build recipe in package/qemu/qemu.mk which only
has instructions for one version of QEMU (QEMU_VERSION). Since QEMU's
configure options change regularly and my VMM modifications are based on
QEMU's master branch, I use buildroot's master branch in order to get the
most recent qemu.mk.

Thanks,
Jean
