Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4186472lfc;
        Mon, 31 Aug 2020 19:26:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/dF0lANXG/n3GARkIiOpOV4U4kW1vg+f3+Dz7GwWHZdQrXqac1HrTNTBuxsw7wygsQ9X9
X-Received: by 2002:a25:d9c4:: with SMTP id q187mr6213667ybg.519.1598927203973;
        Mon, 31 Aug 2020 19:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598927203; cv=none;
        d=google.com; s=arc-20160816;
        b=QQ2+qIlVgn+CXBDyZdPdDSNW4S3VLx2Bj569v29uzlgljxS7OX6qRxttfXzviZb0dj
         nNlv6+6z/DMy1kPodRiWNwwILnrQjSGOpb02lYmTKQe71z4Vxy76wABr+w1Jy81rMWfm
         QFFlpS4NtokshWNZobY1uNM6gPuUQxikyQiHIpQDlBM1lPa4HTypjWe21MJprk9fr7Ys
         9QnEvLu5ql0KhDKvyIAySqyrBPTTsnzmOFuJpeZOkbkXONiV5JazTj8A1UVIBOvqKa/X
         JGpYok7pONud1b6M3vGQ6ctBHYbmB/fpodyQHYuuowlHSV3eex/jCon+mZUMHzlybRVk
         5dsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TgDfurcpkwV1piL8FLCPhFjRRWPG0mM3+/i3YH0OlkU=;
        b=kSBP6+X0b+5sKhTmuIxFBDWFKSYVNkUjcrcW4AOWF3uNC16Poyf0+gTDh4IFoJp2gm
         PeYWrggMww9BKkmiBRKo8ot6HSnHPNu+vyZHIObiBRHwN8bWYrzUKTsDBbN0IxWXNDI7
         jiL2rowYpDm6ZLPu54gnizCEyoTGmJ3doBoQYPYj5xWwArdgdLtkAtUuV2wU6cSDXVvn
         XFLa0d8u4UDOd5np69nsKTUFk3Un1pC2sxGaHvNT6NjO0zy6BapUPHx2dPP9/iucPpO6
         SApWhcYZggRzCWQj7H5piMFGZuVDscS0Z76Igu1DClXygOZdGzZ1ZRbAHrN9NNt8Miwp
         kBYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PW2UHMta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si233097ybj.183.2020.08.31.19.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 19:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PW2UHMta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kCw0R-0007FJ-4t
	for alex.bennee@linaro.org; Mon, 31 Aug 2020 22:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kCw0J-0007EW-ED
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 22:26:35 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:37127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kCw0G-0003Uz-Fg
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 22:26:35 -0400
Received: by mail-il1-x142.google.com with SMTP id b17so2975453ilh.4
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2020 19:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TgDfurcpkwV1piL8FLCPhFjRRWPG0mM3+/i3YH0OlkU=;
 b=PW2UHMtaPSgGXZN0I4nYhdblSycD3QurP+bRef9qjmxbor+z8httaXSj+Qqj6XFC8Q
 +ksFCXc0zjNmyL/SSEwc4dSrc2idPgHrIXwiSYpeoUbbvZTmtZKO+8Myc0dETo5D7yMB
 iD+me+pZaX+vu93cxz/IFTQP2OmEhrbuOfXCOCgGMI6ogwTUECkYwRj0mncJZbnK0Tdq
 iVY2A8sKWdx++gAp+7SF6oOXTUcLQL78UQ+5rm2HBip1fW1A88LflYx5rhk6UB8ySpWc
 gTmcSGeBb43vRIRxDCDktv8Ljd/kY8py85h4mwKNvMlZbasdDjHrI8A0aTCCwIzDmZ1D
 wcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TgDfurcpkwV1piL8FLCPhFjRRWPG0mM3+/i3YH0OlkU=;
 b=BHXKg7+ZM9yQDEylwXpQp/peNvGz/pKz6ti1Lgf/RmpjsxHWnLkJBskYNFjFZ0vi4j
 3ioaaIVF6+JUchwuqqgvU+NbC25ofOl4Pk54DHYX6JRtmYOfdzACGYbk8bKq/O+Q6vwB
 HV/U1lXw39EBTgv53z0Tnly/y6TMEUKxFfiER2s6qPmxDyXSengEetRppQO10MuO7qUL
 NU0ucQ5puO9DkNXRa+GcZeSJp3IsSWqsYbp+LNybfwmzhqD4dDIkJaWB9ZcPgp/MZ6cy
 0AW9DC6j1v0OVKhhNbPyV2Rmrfg/BKLROSo+j02gOazPyplwp+jJ4mN4UWYIsN7SCBsD
 9mtA==
X-Gm-Message-State: AOAM531Hh5NOCIoGKI5gaTxLCfUIxcekz2OKtntdXzx0kqaQdaY1JE9R
 zQ3kokZwZSyTV+gZr/4Y4uoVlBMyWn1fqEw8ho6l
X-Received: by 2002:a92:9a15:: with SMTP id t21mr4071846ili.289.1598927191082; 
 Mon, 31 Aug 2020 19:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <070de656-5550-62b7-faf9-8c4beec56531@redhat.com>
In-Reply-To: <070de656-5550-62b7-faf9-8c4beec56531@redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Tue, 1 Sep 2020 10:26:19 +0800
Message-ID: <CAJc+Z1FuQxEg0pFon4LYXWxvk_SYjNQ7CUgNRV5cBkdSPWzKhg@mail.gmail.com>
Subject: Re: [PATCH 0/7] target/arm: Add vSPE support to KVM guest
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Andrew Murray <andrew.murray@arm.com>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fi1A1QA4rs0N

On Mon, 31 Aug 2020 at 15:56, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Haibo,
>
> On 8/7/20 10:10 AM, Haibo Xu wrote:
> > This series add support for SPE(Statistical Profiling Extension)[1]
> > in KVM guest. It's based on Andrew Murray's kernel KVM patches V2[2],
> > and has been tested to ensure that guest can use SPE with valid data.
> > E.g.
> >
> > In host:
> > $ ./qemu-system-aarch64 \
> >         -cpu host -M virt,accel=kvm,gic-version=3 -nographic -m 2048M \
> >         -kernel ./Image-new \
> >         -initrd /boot/initrd.img-5.6.0-rc2+ \
> >         -append "root=/dev/vda rw console=ttyAMA0" -nodefaults -serial stdio\
> >         -drive if=none,file=./xenial.rootfs.ext4,id=hd0,format=raw \
> >         -device virtio-blk-device,drive=hd0  \
> >
> > In guest:
> > $ perf record -e arm_spe/ts_enable=1,pa_enable=1,pct_enable=1/ \
> >         dd if=/dev/zero of=/dev/null count=1000
> > $ perf report --dump-raw-trace > spe_buf.txt
> >
> > The spe_buf.txt should contain similar data as below:
> >
> > . ... ARM SPE data: size 135944 bytes
> > .  00000000:  b0 f4 d3 29 10 00 80 ff a0                      PC 0xff80001029d3f4 el1 ns=1
> > .  00000009:  99 0b 00                                        LAT 11 ISSUE
> > .  0000000c:  98 0d 00                                        LAT 13 TOT
> > .  0000000f:  52 16 00                                        EV RETIRED L1D-ACCESS TLB-ACCESS
> > .  00000012:  49 00                                           LD
> > .  00000014:  b2 d0 40 d8 70 00 00 ff 00                      VA 0xff000070d840d0
> > .  0000001d:  9a 01 00                                        LAT 1 XLAT
> > .  00000020:  00 00 00                                        PAD
> > .  00000023:  71 a5 1f b3 20 14 00 00 00                      TS 86447955877
> > .  0000002c:  b0 7c f9 29 10 00 80 ff a0                      PC 0xff80001029f97c el1 ns=1
> > .  00000035:  99 02 00                                        LAT 2 ISSUE
> > .  00000038:  98 03 00                                        LAT 3 TOT
> > .  0000003b:  52 02 00                                        EV RETIRED
> > .  0000003e:  48 00                                           INSN-OTHER
> > .  00000040:  00 00 00                                        PAD
> > .  00000043:  71 ef 1f b3 20 14 00 00 00                      TS 86447955951
> > .  0000004c:  b0 f0 e9 29 10 00 80 ff a0                      PC 0xff80001029e9f0 el1 ns=1
> > .  00000055:  99 02 00                                        LAT 2 ISSUE
> > .  00000058:  98 03 00                                        LAT 3 TOT
> > .  0000005b:  52 02 00                                        EV RETIRED
> >
> > If you want to disable the vSPE support, you can use the 'spe=off' cpu
> > property:
> >
> > ./qemu-system-aarch64 \
> >         -cpu host,spe=off -M virt,accel=kvm,gic-version=3 -nographic -m 2048M \
> >         -kernel ./Image-new \
> >         -initrd /boot/initrd.img-5.6.0-rc2+ \
> >         -append "root=/dev/vda rw console=ttyAMA0" -nodefaults -serial stdio\
> >         -drive if=none,file=./xenial.rootfs.ext4,id=hd0,format=raw \
> >         -device virtio-blk-device,drive=hd0  \
> >
> > Note:
> > (1) Since the kernel patches are still under review, some of the macros
> >     in the header files may be changed after merging. We may need to
> >     update them accordingly.
> to be more explicit one needs to replace on the kernel 5.5-rc2 based series
>
> -#define KVM_CAP_ARM_SPE_V1 179
> +#define KVM_CAP_ARM_SPE_V1 184
>
> I got misleaded ;-)
>
> + Andrew in CC as he contributed the kernel part.
>
> For information, I have been working on a kvm unit test series for
> testing SPE. I will send an RFC, most probably this week. At the moment
> I still face some weirdness such as some unexpected Service state in the
> syndrome register. Anyway I will share the existing code so that we can
> discuss the issues.
>
> Are there any plans to respin the kernel series
>
> Thanks
>
> Eric
>

Hi Eric,

Thanks for elaborating on the above macro definition!
The next version of the kernel series are supposed to be sent out in
mid-September,
and it should not change so much except for some macro definitions.

Regards,

Haibo

> > (2) These patches only add vSPE support in KVM mode, for TCG mode, I'm
> >     not sure whether we need to support it.
> > (3) Just followed the 'pmu' property, we only allow this feature to be
> >     removed from CPUs which enable it by default. But since the SPE is
> >     an optional feature extension for Armv8.2, I think a better way may
> >     be to disable it by default, and only enable it when the host cpu
> >     do have the feature.
> >
> > [1]https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/
> >    posts/statistical-profiling-extension-for-armv8-a
> > [2]https://www.spinics.net/lists/arm-kernel/msg776228.html
> >
> > Haibo Xu (7):
> >   update Linux headers with new vSPE macros
> >   target/arm/kvm: spe: Add helper to detect SPE when using KVM
> >   target/arm/cpu: spe: Add an option to turn on/off vSPE support
> >   target/arm/kvm: spe: Unify device attr operatioin helper
> >   target/arm/kvm: spe: Add device init and set_irq operations
> >   hw/arm/virt: spe: Add SPE fdt binding for virt machine
> >   target/arm/cpu: spe: Enable spe to work with host cpu
> >
> >  hw/arm/virt-acpi-build.c      |  3 +++
> >  hw/arm/virt.c                 | 42 ++++++++++++++++++++++++++++++
> >  include/hw/acpi/acpi-defs.h   |  1 +
> >  include/hw/arm/virt.h         |  1 +
> >  linux-headers/asm-arm64/kvm.h |  4 +++
> >  linux-headers/linux/kvm.h     |  2 ++
> >  target/arm/cpu.c              | 34 +++++++++++++++++++++++++
> >  target/arm/cpu.h              |  5 ++++
> >  target/arm/kvm.c              | 11 ++++++++
> >  target/arm/kvm64.c            | 48 ++++++++++++++++++++++++++++++++---
> >  target/arm/kvm_arm.h          | 18 +++++++++++++
> >  11 files changed, 166 insertions(+), 3 deletions(-)
> >
>
