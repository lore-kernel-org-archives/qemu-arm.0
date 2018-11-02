Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2531999wro;
        Fri, 2 Nov 2018 13:16:45 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fJrq82ZBfX39SMkZ3wzA095LTMfrpe7GxE6z2jLTpti/ZbmhiV8znI2NuC7O8NqF/65Jdi
X-Received: by 2002:ac8:35b1:: with SMTP id k46mr2432619qtb.141.1541189805026;
        Fri, 02 Nov 2018 13:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541189805; cv=none;
        d=google.com; s=arc-20160816;
        b=EtIeSQjXMRXM7a5U/+9YgLxvwpyJMsxRQKwPYIVTDkJPXN/oLN3h2zJ0Y1YflWV1Aw
         xZXKYabqDYm5Ipyv2AfLUbOF2PzZ0RfVwDQ20v5tGyz+gN7pr98rJiQhHBK6SkH6TUJc
         3JT0E0nKeb6z2fYx9lqz5sYxmGxn8ubatwmBE/YQcw9A2VODMoMsqW1LsWHg4Mfr1Zph
         R2ONHc9bjMTvONIIwJ0HTvQtkNNpUUpxvBAuZOyeLWRSdyLc0OMsLBhsKvWifevVCXww
         SX4qaoaBFfnMXemex/uieL3hQB7hViF+QMHHOIVLqkipGID7Q+5n9Tbr2lxkjBRWBWvi
         Uz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=QK5okj40b53yQxjEoy7c3t1fsBR7YFlwLIeGOBkeiY8=;
        b=f/5v2yp80rYPkcVqFNiJ+QTjKoT7BBo78QQeaCJ99scdE+vWGcsEdcC9Xw1/bm55D2
         tXNyoYgppeWrjvuXvjZnSSHgoI747RNGmIVtyj7UNNY/ctPRx5GsQmbM+xSpYgndH1Ei
         WJJmZA/vewhW9/Xg23QW6XhANqvBxiBR0p/yo7B8mDkChiYdfilWe9aG6Ene1uMTzpQi
         0DJbaXzerD39fc9pFyVlbX3zBkWvTG79PJNHmeF+UTzyTyxjADHm5vITInM4s3g9ySv8
         5PLRqJ/z9lo5bJh+qIVusxTkspZUmfNVpYhhydbZgc+rvvxcAgbO3OIfZCVVxbQ/HPir
         AYWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u13si1010177qvn.33.2018.11.02.13.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 13:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIfs4-0008Hh-F4
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 16:16:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <christoffer.dall@arm.com>) id 1gIfEW-0005gl-1b
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 15:35:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <christoffer.dall@arm.com>) id 1gIfES-0003C9-G7
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 15:35:51 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:54028
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <christoffer.dall@arm.com>)
	id 1gIfEQ-0002yL-8S; Fri, 02 Nov 2018 15:35:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4CD71596;
	Fri,  2 Nov 2018 12:35:31 -0700 (PDT)
Received: from localhost (e113682-lin.copenhagen.arm.com [10.32.144.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C9233F71E;
	Fri,  2 Nov 2018 12:35:31 -0700 (PDT)
Date: Fri, 2 Nov 2018 20:35:29 +0100
From: Christoffer Dall <christoffer.dall@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181102193529.GB12057@e113682-lin.lund.arm.com>
References: <20181102145433.4553-1-richard.henderson@linaro.org>
	<CAFEAcA_tcR_33Q+2ZFHdzo4_9khXggum=gRfZ8+L49KmP3hHiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_tcR_33Q+2ZFHdzo4_9khXggum=gRfZ8+L49KmP3hHiw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
X-Mailman-Approved-At: Fri, 02 Nov 2018 16:15:11 -0400
Subject: Re: [Qemu-arm] [PATCH v2 0/5] target/arm: KVM vs ARMISARegisters
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uHetTFo4/koE

On Fri, Nov 02, 2018 at 04:36:35PM +0000, Peter Maydell wrote:
> On 2 November 2018 at 14:54, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> > My previous patch set for replacing feature bits with id registers
> > failed to consider that these id registers are beginning to control
> > migration, and thus we must fill them in for KVM as well.
> >
> > Thus, we want to initialize these values within CPU from the host.
> >
> > Finally, re-send the T32EE conversion patch, fixing the build
> > failure on an arm32 host in kvm32.c.
> >
> > Changes, v1->v2:
> >   * Remove assert that AArch32 sysreg <= UINT32_MAX.
> >   * Remove unused local variable.
> >   * Add commentary for AArch32 sysregs vs missing AArch32 support.
> 
> As noted on IRC, on my admittedly pretty ancient 4.8.0 kernel some
> of these ID register reads via KVM_GET_ONE_REG fail ENOENT.
> strace says:
> 
> openat(AT_FDCWD, "/dev/kvm", O_RDWR|O_CLOEXEC) = 18
> ioctl(18, KVM_CREATE_VM or LOGGER_GET_LOG_BUF_SIZE, 0) = 19
> ioctl(19, KVM_CREATE_VCPU, 0)           = 20
> ioctl(19, KVM_ARM_PREFERRED_TARGET, 0xffffcfeb4e88) = 0
> ioctl(20, KVM_ARM_VCPU_INIT, 0xffffcfeb4e88) = 0
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
> = -1 ENOENT (No such file or directory)
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
> = -1 ENOENT (No such file or directory)
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
> = -1 ENOENT (No such file or directory)
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
> = -1 ENOENT (No such file or directory)
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
> = -1 ENOENT (No such file or directory)
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
> = -1 ENOENT (No such file or directory)
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
> = -1 ENOENT (No such file or directory)
> ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
> = -1 ENOENT (No such file or directory)
> 
> 
> I added a bit of extra tracing, since strace doesn't
> print the ID field for the ioctl:
> 
> peter.maydell@mustang-maydell:~/qemu$
> ~/test-images/virtv8-for-nesting/runme-kvm
> ./build/for-kvm/aarch64-softmmu/qemu-system-aarch64 -enable-kvm -cpu
> max -machine gic-version=max
> read_sys_reg64: reading ID 0x603000000013c030...-1
> read_sys_reg64: reading ID 0x603000000013c031...-1
> read_sys_reg64: reading ID 0x603000000013c020...-1
> read_sys_reg64: reading ID 0x603000000013c021...-1
> read_sys_reg32: reading ID 0x603000000013c010...0
> read_sys_reg32: reading ID 0x603000000013c011...0
> read_sys_reg32: reading ID 0x603000000013c012...0
> read_sys_reg32: reading ID 0x603000000013c013...0
> read_sys_reg32: reading ID 0x603000000013c014...0
> read_sys_reg32: reading ID 0x603000000013c015...0
> read_sys_reg32: reading ID 0x603000000013c017...-1
> read_sys_reg32: reading ID 0x603000000013c018...-1
> read_sys_reg32: reading ID 0x603000000013c019...-1
> read_sys_reg32: reading ID 0x603000000013c01a...-1
> qemu-system-aarch64: Failed to retrieve host CPU features
> 
> It looks like the kernel can handle reads of ID_ISAR0_EL1
> through ID_ISAR5_EL1, but not ID_ISAR6_EL1, any of the
> MVFR*_EL1 or ID_AA64_ISAR* or ID_AA64PFR*.
> 
> This is probably because the kernel is way too old to be
> interestingly supportable for KVM, but we did previously
> manage to boot on this setup.

I'm a little confused. v4.8 used to work (although it was perhaps not
the most stable at that time).  What changed?  Is this attempting to
restore a VM from a newer kernel, or has QEMU been updated to detect
this?

> 
> We should probably at least figure out which version of
> the kernel fixed this bug and made the ID registers available
> to userspace... if it's sufficiently ancient we could
> likely say "not supported", but if it's more recent we
> need a workaround somehow. I have cc'd a couple of kernel
> folks who might be able to help with the "which version"
> question.
> 

It appears the support for exposing a bunch of ID registers was
introduced with:

93390c0a1b20 (arm64: KVM: Hide unsupported AArch64 CPU features from guests, 2017-10-31)

Which Dave (cc'ed) wrote and which was introduced in v4.15.

As per my question above, I'm not exactly sure what (if anything) we
need to fix on the kernel side?


Thanks,

    Christoffer
