Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1774802ejc;
        Mon, 30 Oct 2023 03:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSN/7BnL2KRX1C9jTplQbpSLaPFcbFMEsM1z77YgSTG/DTh3GIxnecP3rSa5CMKnBqFfh/
X-Received: by 2002:a05:620a:86ce:b0:778:9be8:275c with SMTP id pr14-20020a05620a86ce00b007789be8275cmr9357357qkn.33.1698663157097;
        Mon, 30 Oct 2023 03:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698663157; cv=none;
        d=google.com; s=arc-20160816;
        b=o7CqfYDRr1BMpmAH1ob2ZeWij6KsAfiB4EhRP+er88QlseTTfkT6d+f9uM7OgjnU+1
         +n9QunE1BStVr7qrWFSjG92jrw89GbFap8cVSxuSD4kcKSG0IG6gOXBmhyAMQKZiAbyj
         Ip87MtNXg16pb/X8rZIIZ71B/bZk86Yfj9o1DUgKo3SmCNlhytms3fbgDmW7/yxU1nrO
         vGJpjEc9Gibm5GHXTr+fCYXEgzkJ0m5K3WDv5MbWBtCW6IfdAAk3nytRtoBXuw+NGSdb
         88fitok+9CROiKfzB2r3aak761AFbm7lsysi141X4C9IjflaCzE3jQkDXeoIDNDUX3UK
         a9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Gl8HMH6iD4/5CtVeEZHLjGviQ5rXHsErSFhAiMTJ86U=;
        fh=w9lLPeNGJEb6T4gCW2+Fja8z/9rd5e7BX2gVADWR+fo=;
        b=eTVze6tDQyEDX9ysAZ17yqyYBTdRBVvjQOZze81yKKOZ+0ntpQcgw6QGKrHiC70lIM
         +AsxrXirKhXX9qvL2DI/3/CFIUc3/6wRWBStXANWpT+YGZXqaWjjULdQCZZTDH6ZbN+L
         cICVFHC8eufRF+sFkJPusPmSAoGVdDLMOgj/05FzRoVHhPK2CxeVu9nHlXqe+a/lBGeO
         mUZx1a45dz8Sfa4UgoIAIGWmlFYbejFF7SZXUHhBw0LlIoznpttelnZchU0rB1gtAQBB
         VjqIoZXbHNZ3fje4VzNw8b7M+jqp+Vg3vikLtSa3VKg7QC/i9/J1uuffWz5EjFCJCg4b
         UHJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y0GKM6WR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020ae9e649000000b0077a0328dfeesi5230415qkl.587.2023.10.30.03.52.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:52:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y0GKM6WR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxPsa-0005K0-0O; Mon, 30 Oct 2023 06:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qxPsK-0004z1-Vr
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:52:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qxPsI-0003e2-DH
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:52:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4084095722aso33693355e9.1
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 03:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698663120; x=1699267920; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gl8HMH6iD4/5CtVeEZHLjGviQ5rXHsErSFhAiMTJ86U=;
 b=y0GKM6WRh0ynWyxoso2hfbHwVBvMjQA4AcqxyB5nqsHdD9rAQvHcAaILL/Oow8MWtA
 aK6OH1p+J7kGcznoikhf6h79BwHHCbIuFRVALvBi3PRa8ecSMZBv0T/k2HiZMho2TuN5
 Rog1oQr4Qu3lD1v7XxD4OT9hFc/W2PkSkYIJDCBT6+hzwQMoIagjYuc2e4Qz8DEuJoau
 8+LaVl55GfwNXKtOMLde9hkX1Y8kZ29pYfGCzlgijQgRHqRPKtNAGXs0sArzbeVfZhCJ
 vpA1/UfJpwi+U8pNX7+sq27YEvz4EYMKolo8k1QBkOqtkIVzYs2QTF9+QBSZk5gGcYgS
 +wXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698663120; x=1699267920;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gl8HMH6iD4/5CtVeEZHLjGviQ5rXHsErSFhAiMTJ86U=;
 b=vOUgiGkZfgFhTj8MslLde1ZmDdrve4r6c8o2VIMECFhECWSt3vPqxATX8zSyWOPWx0
 LizMfYlMPNzDQ7ONXsJNNaKZcPb716BA5xq8SyMv3GHYjJ2XoIMc8M53wTdncSMC2GcL
 9DKxes6l/s9YzAypAAbThrWyiyl2LWvTbmVmArJt2IrCR/+LbrAY9WMnAQnwvnqxochr
 z/lKGWdP1shCJ2bPLyodGFuIMMngS+jSrTwXlUstUhGBBSAO+bCUg5kYarVmXSG0H7O1
 cYXb/mNUge3JN4k6cfvtG11DwC5HsqZSYpnNtE0fZsZiQ6gpyEXEJpv67g2ppqNypbgh
 ivyQ==
X-Gm-Message-State: AOJu0YxncOv3E4rAz0V/w4f+abE0qafRgj5JTouAVxiG3ow0A71apcMU
 gzZRP28+9aBAc02ymDfVaYR9lA==
X-Received: by 2002:a05:600c:45ca:b0:408:4f5d:eeb2 with SMTP id
 s10-20020a05600c45ca00b004084f5deeb2mr8351467wmo.20.1698663120218; 
 Mon, 30 Oct 2023 03:52:00 -0700 (PDT)
Received: from myrica ([2a02:c7c:7290:b00:fd32:2b31:6755:400c])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c1c0700b003fefb94ccc9sm8897797wms.11.2023.10.30.03.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 03:52:00 -0700 (PDT)
Date: Mon, 30 Oct 2023 10:52:05 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 Itaru Kitayama <itaru.kitayama@gmail.com>, qemu-arm@nongnu.org
Subject: Re: Quick start guide on RME emulation
Message-ID: <20231030105205.GA1730363@myrica>
References: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
 <20231002102231.GA3075015@myrica>
 <CANW9uyu85z9+-v8ait9EWcjWRu1+C8Xx3cM__8oBKof7fJwRwA@mail.gmail.com>
 <20231004105558.GA1454132@myrica>
 <CANLsYkx340VE0nr7EH6t2r-5x5-wTv+9S4z-fOtUSGWR_FWE6w@mail.gmail.com>
 <CANLsYkxSY86YwC8KQ=Fb0Cq6QQKMy7CmX8D4pMskMKQMccy7vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkxSY86YwC8KQ=Fb0Cq6QQKMy7CmX8D4pMskMKQMccy7vw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: F8MupqnLKN+W

On Mon, Oct 23, 2023 at 04:35:35PM -0600, Mathieu Poirier wrote:
> > > QEMU system emulation
> > > ---------------------
> > >
> > > Repo: https://gitlab.com/qemu-project/qemu.git
> > >
> > > Run with:
> > >
> > >         qemu-system-aarch64 -M virt,virtualization=on,secure=on,gic-version=3
> > >                 -M acpi=off -cpu max,x-rme=on,sme=off -m 3G -smp 8
> > >                 -nographic
> > >                 -bios tf-a/flash.bin
> > >                 -kernel linux/arch/arm64/boot/Image
> > >                 -drive format=raw,if=none,file=buildroot/output/images/rootfs.ext4,id=hd0
> > >                 -device virtio-blk-pci,drive=hd0
> > >                 -append root=/dev/vda
> > >
> > > To use separate consoles for FW (port 54320), secure payload (54321), host
> > > (54322) and guest (54323):
> > >
> > >                 -nodefaults
> > >                 -serial tcp:localhost:54320
> > >                 -serial tcp:localhost:54321
> > >                 -chardev socket,mux=on,id=hvc0,port=54322,host=localhost
> > >                 -device virtio-serial-device
> > >                 -device virtconsole,chardev=hvc0
> > >                 -chardev socket,mux=on,id=hvc1,port=54323,host=localhost
> > >                 -device virtio-serial-device
> > >                 -device virtconsole,chardev=hvc1
> > >                 -append "root=/dev/vda console=hvc0"
> > >                 -device virtio-net-pci,netdev=net0 -net user,id=net0
> >
> > This argument above gave me an error.  See [1], line 19 to see how I
> > corrected it.  Notice the "-netdev user,id=net0" rather than "-net
> > user,id=net0".  Please confirm you have the same on your side.

Yes, I do have '-netdev'

> >
> >
> > Also, "root=/dev/vda" is a duplicate entry.

Right, I left this in case the user wants to keep the default consoles
(the second '-append' overrides the first one). I'll try to clarify that
or get rid of it

> >
> > [1]. https://pastebin.com/KCh8KFD0
> >
> > >
> > >   And connect with 'socat -,rawer TCP-LISTEN:5432x'
> > >
> >
> > There seems to be a syntax error with the above command:
> >
> > $ socat -,rawer TCP-LISTEN:54320
> > 2023/10/19 16:44:55 socat[2799916] E tcsetattr(1, TCSADRAIN,
> > 0x561add6715c0): Invalid argument

I just encountered this one on Ubuntu, it seems to be a bug in socat that
has been fixed in newer versions:
https://bugs.launchpad.net/ubuntu/+source/socat/+bug/1883957

> >
> > I ended up writing my own startup script [2] using the same mechanic
> > as found in OP-TEE.  The "soc_term.spy" file is available here[3].
> >
> > Once the QEMU syntax and the console output were fixed I was able to
> > start the boot stack with the resulting output [4].  The assert, in
> > function gicv2_driver_init()[5] , is caused by variable gic_version
> > being set to 0 rather than 1 or 2.  I found that weird because my QEMU
> > command line [1] explicitly set gic-version=3.  As such I would have
> > expected to read 3.  And why using gic-version=3 when the code is
> > specifically looking for a value of 1 or 2?  Any insight would be
> > appreciated.
> >
> 
> I looked into this problem further today and found my way through.
> Turns out the TF-A defaults to compiling GICv2, and it has to
> explicitly be told to use GICv3, which I did by adding
> QEMU_USE_GIC_DRIVER=QEMU_GICV3 when compiling.  As such, the command
> you have above becomes:
> 
>         make -j CROSS_COMPILE=aarch64-linux-gnu- PLAT=qemu
>                  ENABLE_RME=1 DEBUG=1 LOG_LEVEL=40
> QEMU_USE_GIC_DRIVER=QEMU_GICV3
>                  RMM=rmm/build-qemu/Debug/rmm.img
> 
> BL33=edk2/Build/ArmVirtQemuKernel-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd
>                  all fip
> 
> You problably had to do something like that (or hack the Makefile) but
> simply forgot about it.

Yes, I do have QEMU_USE_GIC_DRIVER=QEMU_GICV3

Thank you for helping with this, I'll fix this doc and move it to the wiki

Thanks,
Jean

>
> With that the TF-A is able to complete its
> initialization and start the Linux kernel in NS world.  Your
> instructions on how to mount the host's rootFS to gain access to the
> realm kernel and CPIO work.  From there I was able to start a realm VM
> and boot it to a command line.  I still haven't seen:
> 
> [    0.000000] RME: RSI version 13.0 advertised
> 
> but that is because I haven't enabled early console access in my
> kernel, something I will do later today.  I also want to start a realm
> VM using the kvmtools.  From there I want to integrate everything in
> the OP-TEE build environment and send you a link for you to try.
> 
> I will get back to you once I have studied the boot stack and the
> enhancement you did to the various components.  Many thanks for
> putting this together, it was a huge help.
> 
> > Regards,
> > Mathieu
> >
> > [2]. https://pastebin.com/XYjUSgSF
> > [3]. https://github.com/OP-TEE/build/blob/master/soc_term.py
> > [4]. https://pastebin.com/qnSXrE7z
> > [5]. https://jpbrucker.net/git/tf-a/tree/drivers/arm/gic/v2/gicv2_main.c?h=qemu-rme#n128
> >
> > > To share the files needed for booting the guest:
> > >
> > >                 -device virtio-9p-device,fsdev=shr0,mount_tag=shr0
> > >                 -fsdev local,security_model=none,path=.,id=shr0
> > >
> > >   And 'mount -t 9p shr0 /mnt' in the host.
> > >
> > >
> > > Then in the host, launch a Realm guest:
> > >
> > >         qemu-system-aarch64 -M virt,acpi=off,gic-version=3 -nographic
> > >                 -cpu host -enable-kvm -smp 2 -m 512M -overcommit mem-lock=on
> > >                 -kernel /mnt/linux/arch/arm64/boot/Image
> > >                 -initrd /mnt/buildroot/output/images/rootfs.cpio
> > >                 -append "console=hvc0 root=/dev/vda"
> > >                 -M confidential-guest-support=rme0
> > >                 -object rme-guest,id=rme0,measurement-algo=sha512,num-pmu-counters=6,sve-vector-length=256
> > >                 -nodefaults -chardev stdio,mux=on,id=hvc0,signal=off
> > >                 -device virtio-serial-pci -device virtconsole,chardev=hvc0
> > >                 -device virtio-net-pci,netdev=net0,romfile= -netdev user,id=net0
> > >                 </dev/hvc1 >/dev/hvc1 &
> > >         ...
> > >         [    0.000000] RME: RSI version 13.0 advertised
> > >
