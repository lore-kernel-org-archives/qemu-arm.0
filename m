Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2323418wro;
        Fri, 2 Nov 2018 09:37:05 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eSNQDeOSpTn3MiDOZi0VRykGyR0MMOEtNj6LFD+E/lBtIQTH1RM9QyBtc7sTF13NxqIsYx
X-Received: by 2002:ae9:e102:: with SMTP id g2mr10635412qkm.343.1541176625086;
        Fri, 02 Nov 2018 09:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541176625; cv=none;
        d=google.com; s=arc-20160816;
        b=c5yjHWk/WFJ0MlkPFQJtZCvGTf5W0iV6zcPpyUcigKBbKt+e0ltwqQFQG/IMtjy48J
         3YehZ/zOoD5c4g8OEAByvxHC2YZBS6vDieS4ihtb+yDBGJ9SAsv6wvO1ryaDg1dchEbE
         1a7G97QeB78xgUOWOyan+kHOPZ77Iq4vfmeNfRZ2tLSK2T48SR81Ide4L9EBD0nXscCx
         J7t/s9V2ipragT0FVi774L/ursZx+Q9Oi880XK8X3O1SaibYZ4vbAwqklu3w85q6rRd+
         wR2Yhg2cNd0qJPwdNXOOx8qjZesXpO57uhI7PSOHU4TXg99eykRuNV+kDQoT/tBSdKZ/
         gBGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=7NS3JL6tIWvZgq8cl+Ju7nhTiqZlf/l4Nlp6ZRU7JZ4=;
        b=rZr4RY+NmPvWhZ6++lSO5cQqBTRlZWbKONVLsY+VZHwnupc99CAJu0Z8Wq32waPP3s
         CfCeYj8c3EI1K7Q6M5iWDndtGVhCUBQ1BVIKle8WVrVDDPzxatv2KH84A+Rpb8D9lVdb
         jsdvQR+NPierv5wAPMpkLbWsgHiQVJh0yuktGzNz7RtbZrU3nsnuGgH5Hm2TckbhhnNb
         V358VdQk6t4B38eFWGYwMjmGp9m69aG7i1O5ZOppwnOQR2OhAan+5wEo2blmSNB9v0Vw
         NPVkr4mgwKH0qwFPTlyWWyJv9uleBSF9+RFpikQlcNeuzj+T2v8f4gRUw/lGYZ5OoXtX
         DZCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jL3kLfcA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d7si9550qvj.110.2018.11.02.09.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 09:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jL3kLfcA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIcRU-0002x3-KK
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 12:37:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIcRO-0002wm-1Z
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 12:36:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIcRM-0001l2-Uj
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 12:36:57 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gIcRM-0001iD-Hf
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 12:36:56 -0400
Received: by mail-oi1-x241.google.com with SMTP id c25-v6so2097793oiy.0
	for <qemu-arm@nongnu.org>; Fri, 02 Nov 2018 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7NS3JL6tIWvZgq8cl+Ju7nhTiqZlf/l4Nlp6ZRU7JZ4=;
	b=jL3kLfcAXg2nTh7grAknew72ymk+i7FhLfG4nxlpDYX83X3umh2XhAfGiCsDOab31r
	HAK1gDlvhSHdioTbn0NFqBowEP2T1wZDCByrZxudG4h3gPFSo3whUyp3yZJPbGITgPzU
	pcx2dilDbu5PVrOoSvjNUTRAWp8x9+9YraojQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7NS3JL6tIWvZgq8cl+Ju7nhTiqZlf/l4Nlp6ZRU7JZ4=;
	b=nQ9t10OuaJAsFXkhFo+eHVe+sgeuq59LwNaNMEMXr8qBQcVaNfmZkuHEaA1sBnRsth
	ePJEBmr/oQ7J/XFnPgmLYQf9sVpOoRxBo25txoS+Uqy0HL8SHelV4jMdL0NrPAvHxDOu
	/7GLjsaBj7Quou+bntEJ/hxKaz5Bte9nUfqKdpmI6vAiFE1Vryee+YXTBsdpsP/jlhq7
	EPtnNXT7ENAVgrV7iVY6vg8tJrv3NkpxkvCSlmFVXk5H+bPNpREk8lp0IfZ7JnKLKxxi
	8Pu1UcWX7SRBy8go4DqFWVpkR98CJwqd6ED6+eGcSXFoH53JVzyJh39/Gzy4ma4NjwHk
	nD3w==
X-Gm-Message-State: AGRZ1gIuC7Rl/ATArBj7QJTcaGMGUVdAD1uq4YEeQi5HhGiTJmtRCPZ6
	S92zcWKSbicvHNx3KWZesAgrvV6XGxlP6naU1TSnfA==
X-Received: by 2002:aca:f1d6:: with SMTP id
	p205-v6mr7455299oih.332.1541176615657; 
	Fri, 02 Nov 2018 09:36:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Fri, 2 Nov 2018 09:36:35 -0700 (PDT)
In-Reply-To: <20181102145433.4553-1-richard.henderson@linaro.org>
References: <20181102145433.4553-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Nov 2018 16:36:35 +0000
Message-ID: <CAFEAcA_tcR_33Q+2ZFHdzo4_9khXggum=gRfZ8+L49KmP3hHiw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gvCLMkIxHPCI

On 2 November 2018 at 14:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
> My previous patch set for replacing feature bits with id registers
> failed to consider that these id registers are beginning to control
> migration, and thus we must fill them in for KVM as well.
>
> Thus, we want to initialize these values within CPU from the host.
>
> Finally, re-send the T32EE conversion patch, fixing the build
> failure on an arm32 host in kvm32.c.
>
> Changes, v1->v2:
>   * Remove assert that AArch32 sysreg <= UINT32_MAX.
>   * Remove unused local variable.
>   * Add commentary for AArch32 sysregs vs missing AArch32 support.

As noted on IRC, on my admittedly pretty ancient 4.8.0 kernel some
of these ID register reads via KVM_GET_ONE_REG fail ENOENT.
strace says:

openat(AT_FDCWD, "/dev/kvm", O_RDWR|O_CLOEXEC) = 18
ioctl(18, KVM_CREATE_VM or LOGGER_GET_LOG_BUF_SIZE, 0) = 19
ioctl(19, KVM_CREATE_VCPU, 0)           = 20
ioctl(19, KVM_ARM_PREFERRED_TARGET, 0xffffcfeb4e88) = 0
ioctl(20, KVM_ARM_VCPU_INIT, 0xffffcfeb4e88) = 0
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
= -1 ENOENT (No such file or directory)
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
= -1 ENOENT (No such file or directory)
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
= -1 ENOENT (No such file or directory)
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
= -1 ENOENT (No such file or directory)
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28) = 0
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
= -1 ENOENT (No such file or directory)
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
= -1 ENOENT (No such file or directory)
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
= -1 ENOENT (No such file or directory)
ioctl(20, KVM_ARM_SET_DEVICE_ADDR or KVM_GET_ONE_REG, 0xffffcfeb4e28)
= -1 ENOENT (No such file or directory)


I added a bit of extra tracing, since strace doesn't
print the ID field for the ioctl:

peter.maydell@mustang-maydell:~/qemu$
~/test-images/virtv8-for-nesting/runme-kvm
./build/for-kvm/aarch64-softmmu/qemu-system-aarch64 -enable-kvm -cpu
max -machine gic-version=max
read_sys_reg64: reading ID 0x603000000013c030...-1
read_sys_reg64: reading ID 0x603000000013c031...-1
read_sys_reg64: reading ID 0x603000000013c020...-1
read_sys_reg64: reading ID 0x603000000013c021...-1
read_sys_reg32: reading ID 0x603000000013c010...0
read_sys_reg32: reading ID 0x603000000013c011...0
read_sys_reg32: reading ID 0x603000000013c012...0
read_sys_reg32: reading ID 0x603000000013c013...0
read_sys_reg32: reading ID 0x603000000013c014...0
read_sys_reg32: reading ID 0x603000000013c015...0
read_sys_reg32: reading ID 0x603000000013c017...-1
read_sys_reg32: reading ID 0x603000000013c018...-1
read_sys_reg32: reading ID 0x603000000013c019...-1
read_sys_reg32: reading ID 0x603000000013c01a...-1
qemu-system-aarch64: Failed to retrieve host CPU features

It looks like the kernel can handle reads of ID_ISAR0_EL1
through ID_ISAR5_EL1, but not ID_ISAR6_EL1, any of the
MVFR*_EL1 or ID_AA64_ISAR* or ID_AA64PFR*.

This is probably because the kernel is way too old to be
interestingly supportable for KVM, but we did previously
manage to boot on this setup.

We should probably at least figure out which version of
the kernel fixed this bug and made the ID registers available
to userspace... if it's sufficiently ancient we could
likely say "not supported", but if it's more recent we
need a workaround somehow. I have cc'd a couple of kernel
folks who might be able to help with the "which version"
question.

thanks
-- PMM
