Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp614073lfa;
        Thu, 15 Oct 2020 07:11:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx190OILre4P6rjYRlXaqM4/rsChhpOEwC5gMkNGi/9t7kToDYPxOx7OxxQjwzkPeeUy1gH
X-Received: by 2002:ac8:71cc:: with SMTP id i12mr4290844qtp.262.1602771075672;
        Thu, 15 Oct 2020 07:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602771075; cv=none;
        d=google.com; s=arc-20160816;
        b=eUT/IONht/qwbaDHzWukwgMypwfQADtZXecIKXTW6xAe9+s8gJdup6/aMMLqrMXDaK
         RxSnih4ODjGYxJMUCOF9kNEIY7uBh+2yMqghKaco7cA4oEZjyDgQ65TXECOAdKcobls9
         b+qBsrSxBY/UVNvA9kvBtFzcOD1mH/tjhMBSYPoXgxFa/nB2NHgPfyYXpppavwXGUzeH
         w8VscHqGwcTYm1KQoapXo/yf0UQyF65ek4Ly7RXjSxAKC2eHxmMkWrZ25mJaAfsg6NSP
         kcJnLedUhaJCgAzF18+0oyHdQtqtlCcoDRFn/tsjv2Flcf5idiPRuu3olSNN490skkZ6
         ezkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=G/aJJVHQ8/fi4jdi1B2ek6DYuKQ+3ktC2v9/rhdWNwg=;
        b=P925RYsECgNGS00bMVUsMUZ7xppH9h/fJShIAI1Y9hLYnbkbIup053lZjFx+1MvSq+
         ZkKGrjQnBx1ZZE8Crvd/dxPdRv8ffz1+jV76OXiJC5s7yIyW5pRsRx7qvBtwAV2StWXW
         Hp/qu9364D6+E0PXBl42552AAn59L78qjJZxTc5mNKYRkxajv7M8OGJHWUpTJifpMuHz
         voX1nLJMGOG+9/HgKfdk0J7dCKfib5qOPiULGzgQ6u17m/SBP+v1cOM0VHvsu41wZEQa
         TjiUx/skCGdkPrMvYRoO8r4r/SsJXz++V7gINgVTevQ0fZssSCcI8qvJjTNhzVmTUBJj
         qpVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=j9M9CI0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si1419534qtw.389.2020.10.15.07.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 07:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=j9M9CI0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT3yN-0004rY-1m
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 10:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kT3y0-0004qK-5P
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 10:10:53 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kT3xx-0004i0-7f
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 10:10:51 -0400
Received: by mail-wm1-x341.google.com with SMTP id 13so3347094wmf.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2020 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=G/aJJVHQ8/fi4jdi1B2ek6DYuKQ+3ktC2v9/rhdWNwg=;
 b=j9M9CI0B1j6p1BTFsnD6ejJzf7nwy17OPvHONsIrvKDFfEoMjlCPTygtAx2ZUUtaWr
 glEgLRJB7fUjrwm8aXIhGDSf/FBbWOSCit7oYIEe6nFsihPqtV3NXRiyY9y6RmMJw+aN
 sW49p2EJuWyLFEXK5vbqpf+Hyb26Muwnl/yaxhocc3NbIDNe5QrOCSxYUodHNpLwszuI
 DCWmYLzmsHeqWBYiPyvTkcjUHBkggrfk1Y6uxfeUllcjqVNKNj45WZh5gSEeQq3vGfss
 xsQMN4bHrDb/HsdHrcV6fzk5AgtQsIiE4CxIWn1EC1n5HXjiRxyaF5GT22R7T1MQce5c
 WP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=G/aJJVHQ8/fi4jdi1B2ek6DYuKQ+3ktC2v9/rhdWNwg=;
 b=X0hd0GMnaGQ910wC9+u4VlIRd+GP4pj/d9hGw3Yd4QklYLx31IFgvRdQm4dsmA+Rof
 2/4D15VO97+JsjBP9mloBzXVMX26+OnFm/wGE7NAeyfubNoNjfMmoPDB3r0uYzfufj+f
 n3do4IDYBEWldEHmODlMVkiQC0oI8Vko148myBOWEKgLs0leOor68M3FTVz2bzmGt2+1
 cM9k8xSn5MPdaCjDEd06gVIgL//M51nNYyvWosRqaPaEx2mx8xPp0l1LKZYy3gi/kBro
 yDt8q0aQxaCdSivagvg9LCCK3+1gZlC+NkYAk4FZKMa0YJD/GLybVNKNZZKtNrmoH9IN
 rPrA==
X-Gm-Message-State: AOAM531Z6eZgdAB5F4M8nFQgpXU8JHxAZvgUqFdYyHLclJ8xKPBn1MUJ
 HQRcSLLMAnFVqO9ZAHZfm2IpZg==
X-Received: by 2002:a1c:87:: with SMTP id 129mr4175292wma.103.1602771046516;
 Thu, 15 Oct 2020 07:10:46 -0700 (PDT)
Received: from xora-monster ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id o3sm4891300wru.15.2020.10.15.07.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 07:10:45 -0700 (PDT)
Date: Thu, 15 Oct 2020 15:10:44 +0100
From: Graeme Gregory <graeme@nuviainc.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v5 2/2] hw/arm/sbsa-ref: add SBSA watchdog device
Message-ID: <20201015141044.loa6x4sv5552pe72@xora-monster>
References: <20201013151631.30678-1-shashi.mallela@linaro.org>
 <20201013151631.30678-3-shashi.mallela@linaro.org>
 <20201014093119.inq2ut2srps2zfme@xora-monster>
 <CAC15JE2hMrzpWWF-bS-fshoYx+BPehwxqJi-7uMUXSOj+Uh3GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC15JE2hMrzpWWF-bS-fshoYx+BPehwxqJi-7uMUXSOj+Uh3GQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?B?UmFkb3PFgmF3?= Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k9zhsVNl1JT7

On Wed, Oct 14, 2020 at 01:04:43PM -0400, Shashi Mallela wrote:
> This was added as a placeholder for the virt requirement suggested by Maxim
> earlier.Agreed that this fdt otherwise has no significance for sbsa-ref
> platform nor is being used by ACPI table created for wdt.
> 
> -Shashi
> 
> On Wed, 14 Oct 2020 at 05:31, Graeme Gregory <[1]graeme@nuviainc.com> wrote:
> 
>     On Tue, Oct 13, 2020 at 11:16:31AM -0400, Shashi Mallela wrote:
>     > Included the newly implemented SBSA generic watchdog device model into
>     > SBSA platform
>     >
>     > Signed-off-by: Shashi Mallela <[2]shashi.mallela@linaro.org>
>     > ---
>     >  hw/arm/sbsa-ref.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++
>     >  1 file changed, 50 insertions(+)
>     >
>     > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
>     > index 9c3a893bedfd..97ed41607119 100644
>     > --- a/hw/arm/sbsa-ref.c
>     > +++ b/hw/arm/sbsa-ref.c
>     > @@ -30,6 +30,7 @@
>     >  #include "exec/hwaddr.h"
>     >  #include "kvm_arm.h"
>     >  #include "hw/arm/boot.h"
>     > +#include "hw/arm/fdt.h"
>     >  #include "hw/block/flash.h"
>     >  #include "hw/boards.h"
>     >  #include "hw/ide/internal.h"
>     > @@ -40,6 +41,7 @@
>     >  #include "hw/qdev-properties.h"
>     >  #include "hw/usb.h"
>     >  #include "hw/char/pl011.h"
>     > +#include "hw/watchdog/wdt_sbsa_gwdt.h"
>     >  #include "net/net.h"
>     >  #include "qom/object.h"
>     > 
>     > @@ -64,6 +66,9 @@ enum {
>     >      SBSA_GIC_DIST,
>     >      SBSA_GIC_REDIST,
>     >      SBSA_SECURE_EC,
>     > +    SBSA_GWDT,
>     > +    SBSA_GWDT_REFRESH,
>     > +    SBSA_GWDT_CONTROL,
>     >      SBSA_SMMU,
>     >      SBSA_UART,
>     >      SBSA_RTC,
>     > @@ -104,6 +109,8 @@ static const MemMapEntry sbsa_ref_memmap[] = {
>     >      [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
>     >      [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
>     >      [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
>     > +    [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
>     > +    [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
>     >      [SBSA_UART] =               { 0x60000000, 0x00001000 },
>     >      [SBSA_RTC] =                { 0x60010000, 0x00001000 },
>     >      [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
>     > @@ -133,6 +140,8 @@ static const int sbsa_ref_irqmap[] = {
>     >      [SBSA_SECURE_UART_MM] = 9,
>     >      [SBSA_AHCI] = 10,
>     >      [SBSA_EHCI] = 11,
>     > +    [SBSA_SMMU] = 12, /* ... to 15 */
>     > +    [SBSA_GWDT] = 16,
>     >  };

I guess your patch was not based on master here? You should make sure
you are rebased to the latest version before sending.

>     > 
>     >  static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
>     > @@ -141,6 +150,30 @@ static uint64_t sbsa_ref_cpu_mp_affinity
>     (SBSAMachineState *sms, int idx)
>     >      return arm_cpu_mp_affinity(idx, clustersz);
>     >  }
>     > 
>     > +static void create_wdt_fdt(SBSAMachineState *sms)
>     > +{
>     > +    char *nodename;
>     > +    const char compat[] = "arm,sbsa-gwdt";
>     > +
>     > +    hwaddr rbase = sbsa_ref_memmap[SBSA_GWDT_REFRESH].base;
>     > +    hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
>     > +    int irq = sbsa_ref_irqmap[SBSA_GWDT];
>     > +
>     > +    nodename = g_strdup_printf("/watchdog@%" PRIx64, rbase);
>     > +    qemu_fdt_add_subnode(sms->fdt, nodename);
>     > +
>     > +    qemu_fdt_setprop(sms->fdt, nodename, "compatible",
>     > +                             compat, sizeof(compat));
>     > +    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
>     > +                                 2, rbase, 2, SBSA_GWDT_RMMIO_SIZE,
>     > +                                 2, cbase, 2, SBSA_GWDT_CMMIO_SIZE);
>     > +    qemu_fdt_setprop_cells(sms->fdt, nodename, "interrupts",
>     > +                                GIC_FDT_IRQ_TYPE_PPI, irq,
>     > +                                GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>     > +    qemu_fdt_setprop_cell(sms->fdt, nodename, "timeout-sec", 30);
>     > +    g_free(nodename);
>     > +}
>     > +
> 
>     Is this actually used anywhere? I ask because SBSA-ref is not a FDT
>     booting machine and only uses FDT to transfer some dynamic info to
>     arm-tf/edk2 and is not a full description tree. Your ACPI patch in
>     edk2 certainly does not use this info.
> 

From your reply above I would propose this hunk and the call below are
removed. If its needed to virt thats a seperate discussion which I think
was already happening in another thread.

FOSS style is for inline replies not top posting FYI

Graeme

>     Graeme
> 
> 
>     >  /*
>     >   * Firmware on this machine only uses ACPI table to load OS, these
>     limited
>     >   * device tree nodes are just to let firmware know the info which varies
>     from
>     > @@ -219,6 +252,7 @@ static void create_fdt(SBSAMachineState *sms)
>     > 
>     >          g_free(nodename);
>     >      }
>     > +    create_wdt_fdt(sms);
>     >  }
>     > 
>     >  #define SBSA_FLASH_SECTOR_SIZE (256 * KiB)
>     > @@ -447,6 +481,20 @@ static void create_rtc(const SBSAMachineState *sms)
>     >      sysbus_create_simple("pl031", base, qdev_get_gpio_in(sms->gic,
>     irq));
>     >  }
>     > 
>     > +static void create_wdt(const SBSAMachineState *sms)
>     > +{
>     > +    hwaddr rbase = sbsa_ref_memmap[SBSA_GWDT_REFRESH].base;
>     > +    hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
>     > +    DeviceState *dev = qdev_new(TYPE_WDT_SBSA_GWDT);
>     > +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
>     > +    int irq = sbsa_ref_irqmap[SBSA_GWDT];
>     > +
>     > +    sysbus_realize_and_unref(s, &error_fatal);
>     > +    sysbus_mmio_map(s, 0, rbase);
>     > +    sysbus_mmio_map(s, 1, cbase);
>     > +    sysbus_connect_irq(s, 0, qdev_get_gpio_in(sms->gic, irq));
>     > +}
>     > +
>     >  static DeviceState *gpio_key_dev;
>     >  static void sbsa_ref_powerdown_req(Notifier *n, void *opaque)
>     >  {
>     > @@ -730,6 +778,8 @@ static void sbsa_ref_init(MachineState *machine)
>     > 
>     >      create_rtc(sms);
>     > 
>     > +    create_wdt(sms);
>     > +
>     >      create_gpio(sms);
>     > 
>     >      create_ahci(sms);
>     > --
>     > 2.18.4
>     >
>     >
> 
> 
> References:
> 
> [1] mailto:graeme@nuviainc.com
> [2] mailto:shashi.mallela@linaro.org
