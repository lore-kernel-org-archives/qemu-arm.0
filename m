Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp669559eja;
        Thu, 2 Nov 2023 14:15:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSLfV3LTrBs7I/DpbOtag6nNakwdsv6iMbllU1Xi01NoE/rG1w0L5HEKcUq1GomZncqte0
X-Received: by 2002:a67:c006:0:b0:457:ddde:ba45 with SMTP id v6-20020a67c006000000b00457dddeba45mr18583993vsi.14.1698959750420;
        Thu, 02 Nov 2023 14:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698959750; cv=none;
        d=google.com; s=arc-20160816;
        b=kqp5ZxIcXv5Z4QN1nxXw86ohTIcOF2PDgQVGpUN1FbgmpQXxgqpLGiNtOP2eInJpsJ
         ZdU+iOFQdvnUAK0PoTJ6bvM4dnEjzkR7zfy5RqN6MNFwGTbDsBWLK17y2Kg5BBJ12fCU
         Rtayl4tmXG6Q8psXOW+JUqL941zNL4lvr56UIjg9QULiC63zpnR5t6Cpn0X+gXIt3QIH
         Bv633zB3PGl1otbk0d/tvBl1YZy/S/28Y4h8W1EaBEemq3rbSxL1W6l0DmCFQ3mum0yA
         Dj7TLEkq39+uV+BO7GoeOBWoKjE7fJt81f1IUmgerYGvbvZBrBnIyZ1n/QfKWswKLbFj
         RTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mbxxxUC+VLXYIOu9XPQfDx15xBizc9nzwG+yqMfXtX0=;
        fh=MoQJjT/vJfXO48iNPDF5wbX5MPVZt/UpAtf5zFvZZIU=;
        b=hvT2Gj7XarKYl5FAayw6+pQTQ7oYSXa0KcMVUcw7eB7WMJjdCveJ+3FaWdZs2fSngt
         jnIAJjroz5tW2SEFRtGFiEeMXhLzHNNYlQiUzl7UhxCDpwnVgamWMgihrtqtGh/M1nYW
         vv8lo+f7laHzIol7BDrXpIFAOtKaggC1Nod473ZuFRA3YI+nmiapOBqAmZ1v/+/85xup
         3rh/6bIxtEO2PUagiThX3z9YUE4TheKuTZIfa2s4dBemxYtt+rSnvpF9nwr9mFWYPr17
         c3ZnAb34BuIsJ6r2p5qnX/oVZt1s0ODBE0PKvYdqRoEtOVEKMrcoMW1uRMkUR0k2rMhz
         afOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vxRZLHo0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020ad442c6000000b00670fef9af89si278556qvr.28.2023.11.02.14.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 14:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vxRZLHo0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyf2U-0004KK-Gg; Thu, 02 Nov 2023 17:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1qyf2T-0004K9-G0
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 17:15:41 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1qyf2R-0006We-3w
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 17:15:41 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so852128f8f.0
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 14:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698959734; x=1699564534; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mbxxxUC+VLXYIOu9XPQfDx15xBizc9nzwG+yqMfXtX0=;
 b=vxRZLHo0ksFqjvzICyNEMBao0URv2gBPHuosZPRWI6g4/Xb6tH150yWtiI5CSgpVQI
 6uoPMkM5BIChU43141MfDm1MAO8K2c8jS7lVdfWUOK8io85Ttpfwgb/bUWKvJ8ieDq8k
 iPRS4z3rrSs3eFNFTB3+omn0v1y0CBK+IlDmXg5II/gG5rTma95zxC6YvvbTjtaenh+H
 CUxDo6pYwBKj9uM1CsfTrxtUtJgAbZ3LGk+U4s/uqotmNWvjiCbAm8CtLep2p60zcVB9
 vXdYd3NqUTBtcCoa5ej2GUVn2x+fQukTAAez0xRHxphsa3i+seXSrCszq+GSfLHADPj4
 jOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698959734; x=1699564534;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mbxxxUC+VLXYIOu9XPQfDx15xBizc9nzwG+yqMfXtX0=;
 b=mZTyyy0N4HTKrdf/ACT5NQl79fnOxq2i7MxrO9RDCsRjk//vq6HfnOZgeJvouteWX9
 sClRM4S4RalsNfOaKYpCBpivnZ8kSRmQI0R6H7bUkNNgwfasZ530x9z74mUowIs6joQP
 buv/RZ4skPZSkZj3sQLARtDxnC0V4bMUcajAS7BZWmY1/W9iZdwe4zWUiK+a2xivPhFF
 JfppSYq4/voSnu1jmiqrlQ69tlIyplpro9rqrsOFzbwNhDZilyhOlIe2Or76wlyvDZZS
 GL3fynlAO9yY5nOAzrDXGCHRQhYALjKM85g0cHWb2c6P2RY5IzvMvFE45pgff9fw0m9t
 Jw0A==
X-Gm-Message-State: AOJu0YyT7Kyckhp63mqssTFnoaf7kd7jmkSOx1UZO96+cbmf78J1Xz1+
 12RWU0JrplUWpD88q64J6GTZIr+3QiI+sTNDqYZu9A==
X-Received: by 2002:a5d:5983:0:b0:32f:86e7:9bf9 with SMTP id
 n3-20020a5d5983000000b0032f86e79bf9mr11580444wri.5.1698959734470; Thu, 02 Nov
 2023 14:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
 <20231002102231.GA3075015@myrica>
 <CANW9uyu85z9+-v8ait9EWcjWRu1+C8Xx3cM__8oBKof7fJwRwA@mail.gmail.com>
 <20231004105558.GA1454132@myrica>
 <CANLsYkx340VE0nr7EH6t2r-5x5-wTv+9S4z-fOtUSGWR_FWE6w@mail.gmail.com>
 <CANLsYkxSY86YwC8KQ=Fb0Cq6QQKMy7CmX8D4pMskMKQMccy7vw@mail.gmail.com>
 <20231030105205.GA1730363@myrica>
In-Reply-To: <20231030105205.GA1730363@myrica>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 2 Nov 2023 15:15:23 -0600
Message-ID: <CANLsYkyygZbRakMC0A=bwAs9QWQuQjvhuZCfxdvRRsE2W00+bQ@mail.gmail.com>
Subject: Re: Quick start guide on RME emulation
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 Itaru Kitayama <itaru.kitayama@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9gSpEsOuPCmI

On Mon, 30 Oct 2023 at 04:52, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Mon, Oct 23, 2023 at 04:35:35PM -0600, Mathieu Poirier wrote:
> > > > QEMU system emulation
> > > > ---------------------
> > > >
> > > > Repo: https://gitlab.com/qemu-project/qemu.git
> > > >
> > > > Run with:
> > > >
> > > >         qemu-system-aarch64 -M virt,virtualization=on,secure=on,gic-version=3
> > > >                 -M acpi=off -cpu max,x-rme=on,sme=off -m 3G -smp 8
> > > >                 -nographic
> > > >                 -bios tf-a/flash.bin
> > > >                 -kernel linux/arch/arm64/boot/Image
> > > >                 -drive format=raw,if=none,file=buildroot/output/images/rootfs.ext4,id=hd0
> > > >                 -device virtio-blk-pci,drive=hd0
> > > >                 -append root=/dev/vda
> > > >
> > > > To use separate consoles for FW (port 54320), secure payload (54321), host
> > > > (54322) and guest (54323):
> > > >
> > > >                 -nodefaults
> > > >                 -serial tcp:localhost:54320
> > > >                 -serial tcp:localhost:54321
> > > >                 -chardev socket,mux=on,id=hvc0,port=54322,host=localhost
> > > >                 -device virtio-serial-device
> > > >                 -device virtconsole,chardev=hvc0
> > > >                 -chardev socket,mux=on,id=hvc1,port=54323,host=localhost
> > > >                 -device virtio-serial-device
> > > >                 -device virtconsole,chardev=hvc1
> > > >                 -append "root=/dev/vda console=hvc0"
> > > >                 -device virtio-net-pci,netdev=net0 -net user,id=net0
> > >
> > > This argument above gave me an error.  See [1], line 19 to see how I
> > > corrected it.  Notice the "-netdev user,id=net0" rather than "-net
> > > user,id=net0".  Please confirm you have the same on your side.
>
> Yes, I do have '-netdev'
>

Ok

> > >
> > >
> > > Also, "root=/dev/vda" is a duplicate entry.
>
> Right, I left this in case the user wants to keep the default consoles
> (the second '-append' overrides the first one). I'll try to clarify that
> or get rid of it
>
> > >
> > > [1]. https://pastebin.com/KCh8KFD0
> > >
> > > >
> > > >   And connect with 'socat -,rawer TCP-LISTEN:5432x'
> > > >
> > >
> > > There seems to be a syntax error with the above command:
> > >
> > > $ socat -,rawer TCP-LISTEN:54320
> > > 2023/10/19 16:44:55 socat[2799916] E tcsetattr(1, TCSADRAIN,
> > > 0x561add6715c0): Invalid argument
>
> I just encountered this one on Ubuntu, it seems to be a bug in socat that
> has been fixed in newer versions:
> https://bugs.launchpad.net/ubuntu/+source/socat/+bug/1883957
>

Very interesting.  That bug is for 1.7.3.3 and I'm running 1.7.4.1 - I
think that is close enough.

> > >
> > > I ended up writing my own startup script [2] using the same mechanic
> > > as found in OP-TEE.  The "soc_term.spy" file is available here[3].
> > >
> > > Once the QEMU syntax and the console output were fixed I was able to
> > > start the boot stack with the resulting output [4].  The assert, in
> > > function gicv2_driver_init()[5] , is caused by variable gic_version
> > > being set to 0 rather than 1 or 2.  I found that weird because my QEMU
> > > command line [1] explicitly set gic-version=3.  As such I would have
> > > expected to read 3.  And why using gic-version=3 when the code is
> > > specifically looking for a value of 1 or 2?  Any insight would be
> > > appreciated.
> > >
> >
> > I looked into this problem further today and found my way through.
> > Turns out the TF-A defaults to compiling GICv2, and it has to
> > explicitly be told to use GICv3, which I did by adding
> > QEMU_USE_GIC_DRIVER=QEMU_GICV3 when compiling.  As such, the command
> > you have above becomes:
> >
> >         make -j CROSS_COMPILE=aarch64-linux-gnu- PLAT=qemu
> >                  ENABLE_RME=1 DEBUG=1 LOG_LEVEL=40
> > QEMU_USE_GIC_DRIVER=QEMU_GICV3
> >                  RMM=rmm/build-qemu/Debug/rmm.img
> >
> > BL33=edk2/Build/ArmVirtQemuKernel-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd
> >                  all fip
> >
> > You problably had to do something like that (or hack the Makefile) but
> > simply forgot about it.
>
> Yes, I do have QEMU_USE_GIC_DRIVER=QEMU_GICV3
>

Ok

> Thank you for helping with this, I'll fix this doc and move it to the wiki
>

I'm almost done folding all that work in the OP-TEE build environment.
I should be in a position to send out build instructions by the end of
my day.  I will include you in the email so that you can try things
out on your side.  We touched on this when I was in Cambridge but
aside from the RMM, the OP-TEE already had all the components of the
CCA boot stack included in a build environment.

From thereon we can talk about how best to host the code.  My goal is
to have everyone involved working and running the same code base.

While working on this I noticed a few problems, two of which are
probably worth bringing to your attention.

1) When booting the host with more than 3G of RAM, only the boot CPU
is booting properly.  All other CPUs are failing to boot with an angry
looking error message in the kernel boot log.
2) When booting the host with 3G of RAM and giving the Realm above 1G,
the Realm kernel crashes.

Have you seen these issues on your side?  I will likely start working
on #1 next week if you don't already have a solution.

> Thanks,
> Jean
>
> >
> > With that the TF-A is able to complete its
> > initialization and start the Linux kernel in NS world.  Your
> > instructions on how to mount the host's rootFS to gain access to the
> > realm kernel and CPIO work.  From there I was able to start a realm VM
> > and boot it to a command line.  I still haven't seen:
> >
> > [    0.000000] RME: RSI version 13.0 advertised
> >
> > but that is because I haven't enabled early console access in my
> > kernel, something I will do later today.  I also want to start a realm
> > VM using the kvmtools.  From there I want to integrate everything in
> > the OP-TEE build environment and send you a link for you to try.
> >
> > I will get back to you once I have studied the boot stack and the
> > enhancement you did to the various components.  Many thanks for
> > putting this together, it was a huge help.
> >
> > > Regards,
> > > Mathieu
> > >
> > > [2]. https://pastebin.com/XYjUSgSF
> > > [3]. https://github.com/OP-TEE/build/blob/master/soc_term.py
> > > [4]. https://pastebin.com/qnSXrE7z
> > > [5]. https://jpbrucker.net/git/tf-a/tree/drivers/arm/gic/v2/gicv2_main.c?h=qemu-rme#n128
> > >
> > > > To share the files needed for booting the guest:
> > > >
> > > >                 -device virtio-9p-device,fsdev=shr0,mount_tag=shr0
> > > >                 -fsdev local,security_model=none,path=.,id=shr0
> > > >
> > > >   And 'mount -t 9p shr0 /mnt' in the host.
> > > >
> > > >
> > > > Then in the host, launch a Realm guest:
> > > >
> > > >         qemu-system-aarch64 -M virt,acpi=off,gic-version=3 -nographic
> > > >                 -cpu host -enable-kvm -smp 2 -m 512M -overcommit mem-lock=on
> > > >                 -kernel /mnt/linux/arch/arm64/boot/Image
> > > >                 -initrd /mnt/buildroot/output/images/rootfs.cpio
> > > >                 -append "console=hvc0 root=/dev/vda"
> > > >                 -M confidential-guest-support=rme0
> > > >                 -object rme-guest,id=rme0,measurement-algo=sha512,num-pmu-counters=6,sve-vector-length=256
> > > >                 -nodefaults -chardev stdio,mux=on,id=hvc0,signal=off
> > > >                 -device virtio-serial-pci -device virtconsole,chardev=hvc0
> > > >                 -device virtio-net-pci,netdev=net0,romfile= -netdev user,id=net0
> > > >                 </dev/hvc1 >/dev/hvc1 &
> > > >         ...
> > > >         [    0.000000] RME: RSI version 13.0 advertised
> > > >
