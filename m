Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3298143lfy;
        Tue, 25 Aug 2020 03:09:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDUEfcnIDCUAtcJn1XXwsMrc1u3Du28e+dsQX3NJsUYGO6gTiXy4zHk5KXgA7rra7TefSF
X-Received: by 2002:a25:b8d:: with SMTP id 135mr11704694ybl.481.1598350180069;
        Tue, 25 Aug 2020 03:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598350180; cv=none;
        d=google.com; s=arc-20160816;
        b=gAs8pabMyHnMehQs9EnboqcKA3tZnMRvL9QpDAWqRlk+NpWfXOwK7C09U2fEQvC6Ee
         2HUo1VqmX82hVotJCv/N5tUZ7YYalfDj7xIR833OMvj4YKRLGULcBPSWeUVCxoXGjcq1
         JN0WzIXVSMfoOFWV7WdjhWBJCdUGaMNlLdTRK4le0ds/uab6RG7dOB913ZB6hCyei6gp
         uv+0+8pt4wPwPch5GdU4WUyGLYHTvBjwbjifbWj7agG5uEZjGvSDLac1lBiN/L1iRN9K
         JDjkUQQHb6oDjurO9k7n16Bi7FWHzVHRzYk1HrIYehbHWXK9tRh8IAUjrzGGoAth6mqQ
         Vafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=SP/3NlgDxnUh6FWvjlFkhG+Ksa3o6IJOYxOy1Ajys6Y=;
        b=eu1XRfsCsGYjmyxPF6GWZZy2vhatYl5KVO6HoqYqyKcfhcvySY4DJ4SiPDUBsOB4v8
         tAisnAqshFBWRBESxXf2c0IzUcYX40wi/tCePpiI6EtQKgZyno0ou6xB1/IgVepqp4NQ
         8L+5rUjc2Stnaj8bbRk8qrmRqBtlQQAY+U2bFDwfM23T9O1c/hVKl6gBiymjJFJTi592
         07RgVy1wfMfpA+jZIzalIpCeMgY+H/7xZMCjN2XSu5s9CLbijCyEFbY0oCNoODfuCRph
         9oOJ4Y6J1IB3LIrz9qLWIXkHQfLtZLs+67UShJyOZ9P0y4t+xGf/nIIMFF58qRXSMbSv
         n7bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=FoeZqrt3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f145si14634876yba.187.2020.08.25.03.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 03:09:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=FoeZqrt3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAVtb-00085N-Ek
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 06:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kAVtU-00085D-Up
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 06:09:32 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kAVtT-0003GH-0h
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 06:09:32 -0400
Received: by mail-wm1-x342.google.com with SMTP id c19so783361wmd.1
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 03:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SP/3NlgDxnUh6FWvjlFkhG+Ksa3o6IJOYxOy1Ajys6Y=;
 b=FoeZqrt3fBfG3aVl/3VSWfyi8KQFSkTcakVbJsQ5RnUn548IiaqLrN86eGSFlxdXRg
 3STyhZC/kUvY/6uppXFt75mrH5Ge/bHqu3d9YBsH2j1z721kELbJSAEen4gdaDcF/Ql8
 ynmnOu6jCT5r+rUIqyo9wxCNvyuLOEMhww2zJ5V4SM4v1exTwx4+8DfBBl2B0Nl1IcR8
 9qJw1Ntxh9jmm6eDtUVZL2D59cAXFlW6NwU5+6JFO9XaEsDwEfBL1JC/CF9970XqhKNT
 DG54Hzmu3TbG3cEi22wZwbg7tqrFsRJAwRdRGNsHLZtZOMzT91IIUdAWU4WePn5qV4YI
 pNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SP/3NlgDxnUh6FWvjlFkhG+Ksa3o6IJOYxOy1Ajys6Y=;
 b=UUs3QQkeW2WLY6vaZProMsS3QPGYt0INVvqoNB8lWalDt8W+mCESV0eY7XrWD0fJ/2
 XQ5pEQIxgMtPaPUvvkg7zeH+VxB/BWMf5Ob1E+l+LHSteIntT4SDpgzDyPZUbMvCFm1C
 DUpul92BeT4KUW87aEgX5AQM6VFBNq9am/EEPK7NzhomQrdXDlyVAT1m4jBTfaNXUj0b
 7CpZfts33w2FQt4+tb8XLK1cikybqeBTwMcEodEebTZWHe7YgP1FkHhjf29JiIm3+Oti
 9YQuhV+1tYQpxIYh18yZF3EeSNtuaig/5KepIHKBdJHBCImq+Gd0eX2uAbZYpOtUnOI8
 hfYg==
X-Gm-Message-State: AOAM53366iNgEhqm3nz9/Cwn9ZxD2RpyGwbViZs8E1tI3aFmDhJGUF5J
 JNKcGtRMKR0KpEaPhOAX08dsuwIdKyhRw0Hl
X-Received: by 2002:a1c:2045:: with SMTP id g66mr1258761wmg.184.1598350169469; 
 Tue, 25 Aug 2020 03:09:29 -0700 (PDT)
Received: from xora-monster ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id 36sm9815278wrs.25.2020.08.25.03.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 03:09:29 -0700 (PDT)
Date: Tue, 25 Aug 2020 11:09:27 +0100
From: Graeme Gregory <graeme@nuviainc.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [EXTERNAL] Re: [PATCH] hw/arm/sbsa-ref.c : Add a fake embedded
 controller
Message-ID: <20200825100927.56qnpaoq57juwmcc@xora-monster>
References: <20200820133201.80577-1-graeme@nuviainc.com>
 <6dd097d4-bae0-d629-7f4c-398f74f9a0e9@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dd097d4-bae0-d629-7f4c-398f74f9a0e9@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, rad@semihalf.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 leif@nuviainc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6K1mYk6esUww

On Fri, Aug 21, 2020 at 03:49:11PM +0200, Philippe Mathieu-Daudé wrote:
> On 8/20/20 3:32 PM, Graeme Gregory wrote:
> > A difference between sbsa platform and the virt platform is PSCI is
> > handled by ARM-TF in the sbsa platform. This means that the PSCI code
> > there needs to communicate some of the platform power changes down
> > to the qemu code for things like shutdown/reset control.
> 
> No need to explicit 'fake' in patch subject, almost all emulated
> devices are fake.
> 
Noted, will change.

> > 
> > Space has been left to extend the EC if we find other use cases in
> > future where ARM-TF and qemu need to communicate.
> > 
> > Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
> > ---
> >  hw/arm/sbsa-ref.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> > 
> > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > index f030a416fd..c8743fc1d0 100644
> > --- a/hw/arm/sbsa-ref.c
> > +++ b/hw/arm/sbsa-ref.c
> > @@ -41,6 +41,7 @@
> >  #include "hw/usb.h"
> >  #include "hw/char/pl011.h"
> >  #include "net/net.h"
> > +#include "migration/vmstate.h"
> >  
> >  #define RAMLIMIT_GB 8192
> >  #define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
> > @@ -62,6 +63,7 @@ enum {
> >      SBSA_CPUPERIPHS,
> >      SBSA_GIC_DIST,
> >      SBSA_GIC_REDIST,
> > +    SBSA_SECURE_EC,
> >      SBSA_SMMU,
> >      SBSA_UART,
> >      SBSA_RTC,
> > @@ -98,6 +100,14 @@ typedef struct {
> >  #define SBSA_MACHINE(obj) \
> >      OBJECT_CHECK(SBSAMachineState, (obj), TYPE_SBSA_MACHINE)
> >  
> > +typedef struct {
> > +    SysBusDevice parent_obj;
> > +    MemoryRegion iomem;
> > +} SECUREECState;
> > +
> > +#define TYPE_SECURE_EC      "sbsa-secure-ec"
> > +#define SECURE_EC(obj) OBJECT_CHECK(SECUREECState, (obj), TYPE_SECURE_EC)
> > +
> >  static const MemMapEntry sbsa_ref_memmap[] = {
> >      /* 512M boot ROM */
> >      [SBSA_FLASH] =              {          0, 0x20000000 },
> > @@ -107,6 +117,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
> >      [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
> >      [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
> >      [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
> > +    [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
> >      [SBSA_UART] =               { 0x60000000, 0x00001000 },
> >      [SBSA_RTC] =                { 0x60010000, 0x00001000 },
> >      [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
> > @@ -585,6 +596,65 @@ static void *sbsa_ref_dtb(const struct arm_boot_info *binfo, int *fdt_size)
> >      return board->fdt;
> >  }
> >  
> > +enum sbsa_secure_ec_powerstates {
> > +    SBSA_SECURE_EC_CMD_NULL,
> > +    SBSA_SECURE_EC_CMD_POWEROFF,
> > +    SBSA_SECURE_EC_CMD_REBOOT,
> > +};
> > +
> > +static uint64_t secure_ec_read(void *opaque, hwaddr offset, unsigned size)
> > +{
> > +    /* No use for this currently */
> > +    return 0;
> > +}
> > +
> > +static void secure_ec_write(void *opaque, hwaddr offset,
> > +                     uint64_t value, unsigned size)
> > +{
> > +    if (offset == 0) { /* PSCI machine power command register */
> > +        switch (value) {
> > +        case SBSA_SECURE_EC_CMD_NULL:
> > +            break;
> > +        case SBSA_SECURE_EC_CMD_POWEROFF:
> > +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> > +            break;
> > +        case SBSA_SECURE_EC_CMD_REBOOT:
> > +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> > +            break;
> > +        default:
> > +            error_report("sbsa-ref: ERROR Unkown power command");
> > +        }
> > +    } else {
> > +        error_report("sbsa-ref: unknown EC register");
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps secure_ec_ops = {
> > +    .read = secure_ec_read,
> > +    .write = secure_ec_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > +};
> > +
> > +static void secure_ec_init(Object *obj)
> > +{
> > +    SECUREECState *s = SECURE_EC(obj);
> > +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> > +
> > +    memory_region_init_io(&s->iomem, obj, &secure_ec_ops, s, "secure-ec",
> > +                            0x1000);
> > +    sysbus_init_mmio(dev, &s->iomem);
> > +}
> > +
> > +static void create_secure_ec(MemoryRegion *mem)
> > +{
> > +    hwaddr base = sbsa_ref_memmap[SBSA_SECURE_EC].base;
> > +    DeviceState *dev = qdev_create(NULL, TYPE_SECURE_EC);
> 
> This API has been removed in 2194abd6231 ("qdev: qdev_create(),
> qdev_try_create() are now unused, drop"), can you rebase please?
> 
Yes, I accidently sent from a work branch not top of tree, noticed
1ms after sending!

> > +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> > +
> > +    memory_region_add_subregion(mem, base,
> > +                                sysbus_mmio_get_region(s, 0));
> > +}
> > +
> >  static void sbsa_ref_init(MachineState *machine)
> >  {
> >      unsigned int smp_cpus = machine->smp.cpus;
> > @@ -708,6 +778,8 @@ static void sbsa_ref_init(MachineState *machine)
> >  
> >      create_pcie(sms);
> >  
> > +    create_secure_ec(secure_sysmem);
> > +
> >      sms->bootinfo.ram_size = machine->ram_size;
> >      sms->bootinfo.nb_cpus = smp_cpus;
> >      sms->bootinfo.board_id = -1;
> > @@ -798,8 +870,31 @@ static const TypeInfo sbsa_ref_info = {
> >      .instance_size = sizeof(SBSAMachineState),
> >  };
> >  
> > +static const VMStateDescription vmstate_secure_ec_info = {
> > +    .name = "sbsa-secure-ec",
> > +    .version_id = 0,
> > +    .minimum_version_id = 0,
> 
> I'm think you need to initialize that, but VMStateDescription
> is not my cup of tea, so better wait for confirmation by someone
> more confident with it.
> 
>     .fields = (VMStateField[]) {
>         VMSTATE_END_OF_LIST()
>     }
> 
Peter answered this so Ill implement how he suggested without vmstate.

> > +};
> > +
> > +static void secure_ec_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +
> > +    dc->vmsd = &vmstate_secure_ec_info;
> > +    dc->user_creatable = false;
> > +}
> > +
> > +static const TypeInfo secure_ec_info = {
> > +    .name          = TYPE_SECURE_EC,
> > +    .parent        = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(SECUREECState),
> > +    .instance_init = secure_ec_init,
> > +    .class_init    = secure_ec_class_init,
> > +};
> > +
> >  static void sbsa_ref_machine_init(void)
> >  {
> > +    type_register_static(&secure_ec_info);
> >      type_register_static(&sbsa_ref_info);
> >  }
> >  
> > 
> 

Thanks for the review.

Graeme

