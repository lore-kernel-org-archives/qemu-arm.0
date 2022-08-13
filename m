Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp205301ejf;
        Sat, 13 Aug 2022 04:12:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6FjqA1CvJHOzYe+IxDC3CFbqxcMtA4D3Yu7ESbfM7lIno0K7K/qtzZ2IhfzbI73gEvTcZn
X-Received: by 2002:ac8:5791:0:b0:343:e0c8:b48d with SMTP id v17-20020ac85791000000b00343e0c8b48dmr2483078qta.103.1660389126854;
        Sat, 13 Aug 2022 04:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660389126; cv=none;
        d=google.com; s=arc-20160816;
        b=yAW/xw82tRr2/yGlDvCu1k8s8e2VWJMDMucpJQn+xUYfK0Lfz6EP/GctbtZYhVl489
         jk/JxjmLlo5i7HEExN2hwYrl8Q9Dg4Ol6kLucZ4WBoUmXoi4Plf1XsPyQE2PXKJZxafV
         VGIx4tNpl0AZ0sxrboxysGbu+4WPa395dlVv6OS256HtzZJRusytguPUwFJ7UPVjpeUf
         cOvdMu8EXhoXpNvWA2mgwHOo6avoWoJMw34jx2pWmqf2jrnhjL9EhqukX5+zuyU2Kg41
         MflthxM6XHPYLkA1WUIPmafSfqZMW4yvvo8ydOJUr5Q955J1pTDANvkrtigwD6Kol1eo
         eWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date;
        bh=6rUtFD83VWaBJNwctO57ju7Z1tWxbAFJr+YLm4qBTTg=;
        b=zufn+JZ2mtqLTwJWQbLGHMW1VnjJ/IyR1r8/bbcT4mfScTF7LxbxqI6cjnSkBE6LbY
         7YeaQLa3dl7ZOQWI3WTkQ/u6EOI+jH0ShwVMa+N54D/Awv22lm1qVTLWkl5moY5IYP6F
         JQfsUZPoG9DxypSzy/D/dlCSAEK5A1hmcVnSYe5RG6QBOSnTtVgC4VTtOlgpMmCmxHU5
         naA3qXnsoQh8itNkfV+KJvRq2sxV5gYJ/7iDS5MXuoP/LKg1vn46e1UG0wVcw1ucjvL5
         rYxQq9GLgEOXylmdT5dUgH7OmhEOJ4PfEN3ijXPzi9YQzTUjk9VvMeXw8dw1Ou2J7Wbf
         u0OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a37de04000000b006b552103d24si2260600qkj.106.2022.08.13.04.12.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Aug 2022 04:12:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMp3m-0005yq-CV
	for alex.bennee@linaro.org; Sat, 13 Aug 2022 07:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>)
 id 1oMp3S-0005yV-Jg; Sat, 13 Aug 2022 07:11:47 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:55992)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>)
 id 1oMp3Q-0008GR-9Y; Sat, 13 Aug 2022 07:11:46 -0400
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 5416072C90B;
 Sat, 13 Aug 2022 14:11:38 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id 314A54A46FE;
 Sat, 13 Aug 2022 14:11:38 +0300 (MSK)
Date: Sat, 13 Aug 2022 14:11:37 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvmarm <kvmarm@lists.cs.columbia.edu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: qemu-system-aarch64: Failed to retrieve host CPU features
Message-ID: <20220813111137.5plgwrfnosolj2bp@altlinux.org>
References: <20220812021427.cwenhciuftgtaj64@altlinux.org>
 <20220812084529.ur5qcyws5qvoyvuc@altlinux.org>
 <CAFEAcA9BuSe4SwpoWTALURaxoj-8U2y83k=und7oKrZBggLarQ@mail.gmail.com>
 <87h72hv71u.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <87h72hv71u.wl-maz@kernel.org>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N8VF02u6mgX4

Marc,

On Fri, Aug 12, 2022 at 04:02:37PM +0100, Marc Zyngier wrote:
> On Fri, 12 Aug 2022 10:25:55 +0100,
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > 
> > I've added some more relevant mailing lists to the cc.
> > 
> > On Fri, 12 Aug 2022 at 09:45, Vitaly Chikunov <vt@altlinux.org> wrote:
> > > On Fri, Aug 12, 2022 at 05:14:27AM +0300, Vitaly Chikunov wrote:
> > > > I noticed that we starting to get many errors like this:
> > > >
> > > >   qemu-system-aarch64: Failed to retrieve host CPU features
> > > >
> > > > Where many is 1-2% per run, depends on host, host is Kunpeng-920, and
> > > > Linux kernel is v5.15.59, but it started to appear months before that.
> > > >
> > > > strace shows in erroneous case:
> > > >
> > > >   1152244 ioctl(9, KVM_CREATE_VM, 0x30)   = -1 EINTR (Interrupted system call)
> > > >
> > > > And I see in target/arm/kvm.c:kvm_arm_create_scratch_host_vcpu:
> > > >
> > > >     vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> > > >     if (vmfd < 0) {
> > > >         goto err;
> > > >     }
> > > >
> > > > Maybe it should restart ioctl on EINTR?
> > > >
> > > > I don't see EINTR documented in ioctl(2) nor in Linux'
> > > > Documentation/virt/kvm/api.rst for KVM_CREATE_VM, but for KVM_RUN it
> > > > says "an unmasked signal is pending".
> > >
> > > I am suggested that almost any blocking syscall could return EINTR, so I
> > > checked the strace log and it does not show evidence of arriving a signal,
> > > the log ends like this:
> > >
> > >   1152244 openat(AT_FDCWD, "/dev/kvm", O_RDWR|O_CLOEXEC) = 9
> > >   1152244 ioctl(9, KVM_CHECK_EXTENSION, KVM_CAP_ARM_VM_IPA_SIZE) = 48
> > >   1152244 ioctl(9, KVM_CREATE_VM, 0x30)   = -1 EINTR (Interrupted system call)
> > >   1152244 close(9)                        = 0
> > >   1152244 newfstatat(2, "", {st_dev=makedev(0, 0xd), st_ino=57869925, st_mode=S_IFIFO|0600, st_nlink=1, st_uid=517, st_gid=517, st_blksize=4096, st_blocks=0, st_size=0, st_atime=1660268019 /* 2022-08-12T01:33:39.850436293+0000 */, st_atime_nsec=850436293, st_mtime=1660268019 /* 2022-08-12T01:33:39.850436293+0000 */, st_mtime_nsec=850436293, st_ctime=1660268019 /* 2022-08-12T01:33:39.850436293+0000 */, st_ctime_nsec=850436293}, AT_EMPTY_PATH) = 0
> > >   1152244 write(2, "qemu-system-aarch64: Failed to r"..., 58) = 58
> > >   1152244 exit_group(1)                   = ?
> > >   1152245 <... clock_nanosleep resumed> <unfinished ...>) = ?
> > >   1152245 +++ exited with 1 +++
> > >   1152244 +++ exited with 1 +++
> > 
> > KVM folks: should we expect that KVM_CREATE_VM might fail EINTR
> > and need retrying?
> 
> In general, yes. But for this particular one, this is pretty odd.
> 
> The only path I can so far see that would match this behaviour is if
> mm_take_all_locks() (called from __mmu_notifier_register()) was
> getting interrupted by a signal (I'm looking at a 5.19-ish kernel,
> which may slightly differ from the 5.15 mentioned above).
> 
> But as Vitaly points out, it doesn't seem to be a signal delivered
> here.
> 
> Vitaly: could you please share your exact test case (full qemu command
> line), and instrument your kernel to see if mm_take_all_locks() is the
> one failing?

Full command is `qemu-system-aarch64 -M accel=kvm:tcg -m 4096M -smp
  cores=8 -nodefaults -nographic -no-reboot -fsdev
  local,id=root,path=/,security_model=none,multidevs=remap -device
  virtio-9p-pci,fsdev=root,mount_tag=/dev/root -device virtio-rng-pci
  -serial mon:stdio -kernel /boot/vmlinuz-5.18.16-un-def-alt1 -initrd
  /usr/src/tmp/initramfs-5.18.16-un-def-alt1.img -sandbox on,spawn=deny -M
  virt,gic-version=3 -cpu max -append 'console=ttyAMA0 mitigations=off
  nokaslr quiet panic=-1 SCRIPT=/usr/src/tmp/tmp.458pkF5r8d'`.

But a minified reproducer is `qemu-system-aarch64 -M virt,accel=kvm -cpu max -kernel qwe`. 

I traced with kprobe event tracer with the probes:

  echo 'p kvm_dev_ioctl'               > kprobe_events
  echo 'r kvm_dev_ioctl $retval'      >> kprobe_events
  echo 'p mm_take_all_locks'          >> kprobe_events
  echo 'r mm_take_all_locks $retval'  >> kprobe_events

Then run reproducer in the loop

  for ((i=0;i<100;i++));do echo $i; strace -fvo bb.$i qemu-system-aarch64 -M virt,accel=kvm -cpu max -kernel qwe 2>&1 | grep Failed && break; done

And on 97th iteration it's failed, strace log to check that PID is the same with
the following trace:

  3611463 ioctl(9, KVM_CREATE_VM, 0x30)   = -1 EINTR (Interrupted system call)

Event trace log:

  qemu-system-aar-3611463 [002] d.... 342920.535549: p_kvm_dev_ioctl_0: (kvm_dev_ioctl+0x0/0x910)
  qemu-system-aar-3611463 [002] d.... 342920.535635: p_mm_take_all_locks_0: (mm_take_all_locks+0x0/0x390)
  qemu-system-aar-3611463 [002] ..... 342920.535657: r_mm_take_all_locks_0: (__mmu_notifier_register+0x44/0x200 <- mm_take_all_locks) arg1=0xfffffffc
  qemu-system-aar-3611463 [002] ..... 342920.535695: r_kvm_dev_ioctl_0: (__arm64_sys_ioctl+0xcc/0x124 <- kvm_dev_ioctl) arg1=0xfffffffffffffffc

So that's mm_take_all_locks returns EINTR.

(I tried also to make C reproducer which opens /dev/kvm and call
`ioctl(kvm, KVM_CREATE_VM, 0)` in the loop and it does not reproduce the
problem, so it seems it's also something additional that QEMU does.)

Thanks,
