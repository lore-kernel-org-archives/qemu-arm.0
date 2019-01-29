Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4360377wrt;
        Tue, 29 Jan 2019 03:46:17 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7AaUxDwSHDnVauUme/160lmdUv1IH3Yh9qF8S+mPZQcqB1ey8x9wGE36l/bZNOwTlC0zqn
X-Received: by 2002:a17:906:7f01:: with SMTP id d1mr22283196ejr.244.1548762377915;
        Tue, 29 Jan 2019 03:46:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548762377; cv=none;
        d=google.com; s=arc-20160816;
        b=Ae8Yz9oMBiJfD+AGxsEfbkGjYIQZ8OfJM5EQjp7crVDE/gGfdxIRbK6ZWgQDjGHwLY
         Asa1yypXd7iSaYx6dfW01KX3Fndw5/JoT3E2WBrzXfuTdhg7YB2jRR6BgVwOBn7SfxFv
         6vZ3c2br+h5Fk3+3i36nKhzOZrDNwhfmy+CreubZbkVK5T341bfDkGAeFyN9ub3Gp0Cr
         g2YMj/tYmkTeCmBwUjolErKaXdHbcEqEHYYoSTLBsa4nOrIHVERG8oSMFhyvHaGBHt9g
         VVaqTqmQz0O8KsG66gdkUqKp8rCJnRpSBLU0srQtnVZJblibNmefiK21TGAXlk/Z6lqf
         pbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=iXkawou1FGAXKnmP2WN1XtJap/YG5/bezF2XP3/jxnY=;
        b=HX6JqN0jeKC/M2S6CWBV7tQN4B1zdHSla6Q+vdlFTaqZIYxg4eiJzpVM910nO6FVKu
         sJ6aKPckGc/39xjU+IT9gJZmtTjzmRdkaHZArjMoJlFQ9WFrQGljNC5Go/7dj9w+sQHs
         CbFcfogg0ZskzaPBjq+OmpImQlFFShKRgKjVXY9koXiMuCcMRgA9eaVZDOegR4/s34rU
         KAAbCuhea49fz0VA3Bv7ZXoh3NONYbxEH2KolqVhenpRjY8zZgUXx3yjhUH3QExduC/a
         DcqS6w0Pbv4PXYoRsvBJPWZKkSy05aygB196RveZNhhQNxgqEhaNkKhfYbEIRJLMmH5S
         Frdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mark.rutland@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=mark.rutland@arm.com
Return-Path: <mark.rutland@arm.com>
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id s28si900044edc.349.2019.01.29.03.46.17;
        Tue, 29 Jan 2019 03:46:17 -0800 (PST)
Received-SPF: pass (google.com: domain of mark.rutland@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mark.rutland@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=mark.rutland@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC95DEBD;
	Tue, 29 Jan 2019 03:46:16 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40C843F589;
	Tue, 29 Jan 2019 03:46:15 -0800 (PST)
Date: Tue, 29 Jan 2019 11:46:09 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Kristina Martsenko <kristina.martsenko@arm.com>
Subject: Re: Kernel boot regression with PAuth and aarch64-softmmu -cpu max
 and el2 enabled
Message-ID: <20190129114609.GA25983@lakrids.cambridge.arm.com>
References: <87va27n2l8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87va27n2l8.fsf@linaro.org>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-TUID: PiO3LZT6CYw/

Hi,

[adding Kristina, who is in charge of Linux pointer authentication]

On Tue, Jan 29, 2019 at 11:08:19AM +0000, Alex Bennée wrote:
> Hi,
> 
> Following up on yesterday's discussion on IRC I thought I'd better
> report on my findings in the permanent record so things don't get lost.
> 
> As I tend to periodically rebuild my test kernels from the current
> state of linux.git I occasionally run into these things. My test
> invocation is:
> 
>   qemu-system-aarch64 -machine type=virt,virtualization=on \
>                       -display none -m 4096 -serial mon:stdio \
>                       -kernel ../../kernel-v8-plain.build/arch/arm64/boot/Image \
>                       -append 'console=ttyAMA0 panic=-1' -no-reboot -cpu max
>
> The kernel is essentially a defconfig kernel with a bunch of the VIRTIO
> device drivers built-in for when I actually boot a more complex setup
> with disks and drives. However this is a boot test so doesn't really
> matter.
> 
> The -machine type=virt,virtualization=on enables our virt machine model
> with EL2 turned on. As there is no BIOS involved the kernel is invoked
> directly at EL2.
> 
> The -cpu max enabled a cortex-a57 + whatever extra features we've
> enabled in QEMU so far. It won't match any "real" CPU but it should be
> architecturally correct in so far we implement prerequisite features for
> any given feature. The cpuid feature bits should also be correct as we
> test them internally in QEMU to enable features.

Just to check, does this enable VHE?

> The breakage is the kernel never boots (no output on serial port) and on
> attaching with gdb I found it stuck in:
> 
>   (gdb) bt
>   #0  0xffffff8010a9e480 in overflow_stack ()
>   Backtrace stopped: not enough registers or memory available to unwind further
> 
> If I turn on exception tracing it looks like we go into an exception
> loop.

As mentioned on IRC, this looks very odd, since overflow_stack is a data
pointer, not code. I can't presently see how we could branch here.

If you pass the kernel 'earlycon keep_bootcon', do you get any output?

> On the QEMU side this breakage comes in at:
> 
>   commit 1ce32e47db52e3511132c7104770eae65d412144 (HEAD, refs/bisect/bad)
>   Author: Richard Henderson <richard.henderson@linaro.org>
>   Date:   Mon Jan 21 10:23:13 2019 +0000
> 
>       target/arm: Enable PAuth for -cpu max
> 
>       Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>       Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>       Message-id: 20190108223129.5570-30-richard.henderson@linaro.org
>       Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> and as you would expect the system boots fine with -cpu cortex-a57
> 
> On the kernel side it breaks at:
> 
>   commit 04ca3204fa09f5f55c8f113b0072004a7b364ff4
>   Author: Mark Rutland <mark.rutland@arm.com>
>   Date:   Fri Dec 7 18:39:30 2018 +0000
> 
>       arm64: enable pointer authentication
> 
>       Now that all the necessary bits are in place for userspace, add the
>       necessary Kconfig logic to allow this to be enabled.
> 
>       Signed-off-by: Mark Rutland <mark.rutland@arm.com>
>       Signed-off-by: Kristina Martsenko <kristina.martsenko@arm.com>
>       Cc: Catalin Marinas <catalin.marinas@arm.com>
>       Cc: Will Deacon <will.deacon@arm.com>
>       Signed-off-by: Will Deacon <will.deacon@arm.com>
> 
> So predictably we failed at enabling PAuth somewhere between the kernel
> and QEMU.
> 
> I'm guessing the kernel so far has been tested on the fast model with a
> full chain of TF, UEFI and kernel?

The kernel has been tested on a fast model with the Linux bootwrapper:

https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/

Kristina, could you confirm whether or not it's been tested with
ATF+UEFI?

> I think Richard's tests were without EL2 enabled.
> 
> So in the case that the kernel boots in EL2 is it expecting anyone else
> to deal with Pauth exceptions or should it be able to cope with an
> enabled Pauth but no firmware underneath it?

So long as the highest implemented exception level is EL2, the kernel
should handle that itself. During boot we'll configure HCR_EL2.{API,APK}
in el2_setup().

From that point onwards, there should be no traps for pointer
authentication functionality from EL1, AFAICT.

> Either we've got something wrong or we'll need to rethink what features
> the user can have enabled by -cpu max on a direct kernel boot.

It's not immediately clear to me when precisely things are going wrong,
so I think we need to narrow that down first. For example, it's not
clear whether a trap is being taken, or something is unexpectedly
behaving is UNDEF.

Is it possible to watch the exception vectors to see if/when an
exception is taken, and from where?

Thanks,
Mark.
