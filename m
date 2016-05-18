Received: by 10.25.208.137 with SMTP id h131csp2275099lfg;
        Wed, 18 May 2016 02:06:28 -0700 (PDT)
X-Received: by 10.194.242.167 with SMTP id wr7mr5973124wjc.145.1463562388105;
        Wed, 18 May 2016 02:06:28 -0700 (PDT)
Return-Path: <christoffer.dall@linaro.org>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com. [2a00:1450:400c:c09::230])
        by mx.google.com with ESMTPS id q18si9109155wjw.87.2016.05.18.02.06.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 May 2016 02:06:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of christoffer.dall@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) client-ip=2a00:1450:400c:c09::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of christoffer.dall@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) smtp.mailfrom=christoffer.dall@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x230.google.com with SMTP id g17so25257147wme.0
        for <alex.bennee@linaro.org>; Wed, 18 May 2016 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MEwZJ9UE2c20L3QmHyBsJDMPT50u9zgqfCnfKq5UPdU=;
        b=PIftWgRLwIByH81A3kB3ZXJ7sUsNu26yBZRypUgYKTLzxxTo5MVJ14vXQpebijSrAB
         8FjcwvODFqhocNJNICUtjcLdLasuZMv6N1Jpiwh/qzS5mZGj+QvFAyYw0dcjGzruTR77
         kJGmGkrO4uXxB99Nw8+Qvp8Np0NXEZehxkydE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MEwZJ9UE2c20L3QmHyBsJDMPT50u9zgqfCnfKq5UPdU=;
        b=fQQgjgi32bmuDrUGvyNFx6LrQUZahUGtxeT915YQ8DPJsWfjSFQrpaSzvm0n1lYfb2
         eIZZnUH9SWWYjkV32hexae2pzPIyLJqqYNv8CKvAk19Le/sAuN++n8XLGBD6/UPfoxJa
         9wHxPkxbKW3RNwujCBwDymtxbg3WI0qaWQHSegs3WOTSahtLy5S5DNVd3GQvFC2qU+ux
         kbFJVksPm8m97MxvzqQ+rQvc362kyiN45toYQkvBeO1ngU00+AOK1lmbhv+pIXHB2xIa
         AkZnDTcpJLGor3BMxgo+n3ZN1a+pVm0m8ubWsHz5vHohzvEvBZPMnZPySVD/LhBaIY+K
         Tc6A==
X-Gm-Message-State: AOPr4FXIZBDij602PnKd5hhJtjsea/kUlOJ/QBwDeKDhxPXoOOn6HsAMUQmJo3IolqoTak/V/pE=
X-Received: by 10.194.105.230 with SMTP id gp6mr5764238wjb.90.1463562387849;
        Wed, 18 May 2016 02:06:27 -0700 (PDT)
Return-Path: <christoffer.dall@linaro.org>
Received: from localhost ([94.18.191.146])
        by smtp.gmail.com with ESMTPSA id m140sm28361024wma.24.2016.05.18.02.06.27
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 18 May 2016 02:06:27 -0700 (PDT)
Date: Wed, 18 May 2016 11:07:14 +0200
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
	peter.maydell@linaro.org, alex.bennee@linaro.org,
	marc.zyngier@arm.com
Subject: Re: [kvm-unit-tests PATCH 00/10] arm/arm64: add gic framework
Message-ID: <20160518090714.GA3827@cbox>
References: <1463385444-12916-1-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1463385444-12916-1-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: mNepjS5jKVkp

Hi Drew,

Thanks for doing this.  I'm happy to see some tests for the GIC.

I've been pondering with how to write unit tests for all the MMIO
implementations.  If you have some thoughts on how that could be easily
fitted into this framework, that would probably be a good place to do it
;)

-Christoffer

On Mon, May 16, 2016 at 09:57:14AM +0200, Andrew Jones wrote:
> Import defines, and steal enough helper functions, from Linux to
> enable programming of the gic (v2 and v3). Then use the framework
> to add an initial test (an ipi test; self, target-list, broadcast).
> 
> It's my hope that this framework will be a suitable base on which
> more tests may be easily added, particularly because we have
> vgic-new and tcg gicv3 emulation getting close to merge.
> 
> To run it, along with other tests, just do
> 
>  ./configure [ --arch=[arm|arm64] --cross-prefix=$PREFIX ]
>  make
>  export QEMU=$PATH_TO_QEMU
>  ./run_tests.sh
> 
> To run it separately do, e.g.
> 
> $QEMU -machine virt,accel=tcg -cpu cortex-a57 \
>  -device virtio-serial-device \
>  -device virtconsole,chardev=ctd -chardev testdev,id=ctd \
>  -display none -serial stdio \
>  -kernel arm/gic.flat \
>  -smp 123 -machine gic-version=3 -append ipi
> 
>       ^^ note, we can go nuts with nr-cpus on TCG :-)
> 
> Or, a KVM example using a different "sender" cpu and irq (other than zero)
> 
> $QEMU -machine virt,accel=kvm -cpu host \
>  -device virtio-serial-device \
>  -device virtconsole,chardev=ctd -chardev testdev,id=ctd \
>  -display none -serial stdio \
>  -kernel arm/gic.flat \
>  -smp 48 -machine gic-version=3 -append 'ipi sender=42 irq=1'
> 
> 
> Patches:
> 01-05: fixes and functionality needed by the later gic patches
> 06-07: code theft from Linux (defines, helper functions)
> 08-10: arm/gic.flat (the base of the gic unit test), currently just IPI
> 
> Available here: https://github.com/rhdrjones/kvm-unit-tests/commits/arm/gic
> 
> 
> Andrew Jones (10):
>   lib: xstr: allow multiple args
>   arm64: fix get_"sysreg32" and make MPIDR 64bit
>   arm/arm64: smp: support more than 8 cpus
>   arm/arm64: add some delay routines
>   arm/arm64: irq enable/disable
>   arm/arm64: add initial gicv2 support
>   arm64: add initial gicv3 support
>   arm/arm64: gicv2: add an IPI test
>   arm/arm64: gicv3: add an IPI test
>   arm/arm64: gic: don't just use zero
> 
>  arm/Makefile.common        |   7 +-
>  arm/gic.c                  | 338 +++++++++++++++++++++++++++++++++++++++++++++
>  arm/run                    |  19 ++-
>  arm/selftest.c             |   5 +-
>  arm/unittests.cfg          |  13 ++
>  lib/arm/asm/arch_gicv3.h   | 184 ++++++++++++++++++++++++
>  lib/arm/asm/gic-v2.h       |  74 ++++++++++
>  lib/arm/asm/gic-v3.h       | 320 ++++++++++++++++++++++++++++++++++++++++++
>  lib/arm/asm/gic.h          |  21 +++
>  lib/arm/asm/processor.h    |  38 ++++-
>  lib/arm/asm/setup.h        |   4 +-
>  lib/arm/gic.c              | 127 +++++++++++++++++
>  lib/arm/processor.c        |  15 ++
>  lib/arm/setup.c            |  12 +-
>  lib/arm64/asm/arch_gicv3.h | 169 +++++++++++++++++++++++
>  lib/arm64/asm/gic-v2.h     |   1 +
>  lib/arm64/asm/gic-v3.h     |   1 +
>  lib/arm64/asm/gic.h        |   1 +
>  lib/arm64/asm/processor.h  |  53 +++++--
>  lib/arm64/asm/sysreg.h     |  44 ++++++
>  lib/arm64/processor.c      |  15 ++
>  lib/libcflat.h             |   4 +-
>  22 files changed, 1439 insertions(+), 26 deletions(-)
>  create mode 100644 arm/gic.c
>  create mode 100644 lib/arm/asm/arch_gicv3.h
>  create mode 100644 lib/arm/asm/gic-v2.h
>  create mode 100644 lib/arm/asm/gic-v3.h
>  create mode 100644 lib/arm/asm/gic.h
>  create mode 100644 lib/arm/gic.c
>  create mode 100644 lib/arm64/asm/arch_gicv3.h
>  create mode 100644 lib/arm64/asm/gic-v2.h
>  create mode 100644 lib/arm64/asm/gic-v3.h
>  create mode 100644 lib/arm64/asm/gic.h
>  create mode 100644 lib/arm64/asm/sysreg.h
> 
> -- 
> 2.4.11
> 
