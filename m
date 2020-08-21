Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp301645lfy;
        Fri, 21 Aug 2020 06:49:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHBgUHVnPlacjQPr8F/Lt6OPqBp1xCMA800Tl/Ohau5DmyWWTno7gneqL1ph666FaWG92u
X-Received: by 2002:a25:7141:: with SMTP id m62mr3603407ybc.443.1598017768102;
        Fri, 21 Aug 2020 06:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598017768; cv=none;
        d=google.com; s=arc-20160816;
        b=Lime70rzeRGQzxYnQh2wz0Ls/Wtlc0lM4Iqk0+Kbt4wHWzeeaD8swpLvx5VdUT/jpl
         PZfGbitTf+TSyAhMWz3wjq6dyS3m85K0OSA4Ekvln2Hc0WnOtXLl1dYzBVHqk4tz36tG
         +ItVHOtPNIyf7umqS0aEbnS/pDUsNkyKxW2GRIi5R19qdpD4YisRFG+dS9Qk+82OUOzz
         t/iW/+3cFQX+wnjFAl7+WjQ0RudDxzU782xD51u9cREZKMnZkv+UAqZ3kir6D4tBLltq
         0kJhNOWrEWSNTqbf/+JgRmDygvTHB7qbVTy85H4p9N+rRP3tGODM8qjl99dCrMYkA+Hq
         RHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YhvmB0oJ/6Gg0BgGuIKOUJsssCe/tsIiz9iE5rmnzNw=;
        b=rWy9SuEL4wavnao1S+dlGY9R16NGy6z4c4GIve7gpgSphn2hZSmkcypnqPXk6efdEl
         m0I6WtXsxm7Nx26Dz6Vf8NaoS0AG7JcSgIpRn/eWXxIAUEk5m7nL54HmuZ8/lfSLjEhr
         ttk0ySBo7rbtvsJkJHKKbGe/g1P81CnkSUerAGxICScUrox/1763sP+75cvTdZb+qJUB
         VbH5ibdpAWV+LwL09a1nNlCb1ROGpYt/qAj/wODLO7CgGfEl9vIXqBur2EBmwY/XONk3
         YivnOIHV6ynDx3xQ1Ys6j9Zcbem2RBkTU2lpnDeeZysV1jPeQyHoaVIs0qhhXtkDnG5F
         49/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lZQz+65W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si2414436ybg.315.2020.08.21.06.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 06:49:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lZQz+65W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k97Q7-0003M4-Gc
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 09:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k97Py-0003IZ-2Z; Fri, 21 Aug 2020 09:49:18 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k97Pv-0001u4-5P; Fri, 21 Aug 2020 09:49:17 -0400
Received: by mail-wr1-x441.google.com with SMTP id a15so1985506wrh.10;
 Fri, 21 Aug 2020 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YhvmB0oJ/6Gg0BgGuIKOUJsssCe/tsIiz9iE5rmnzNw=;
 b=lZQz+65WURfuMrUlHnF03GIs0vhRPtvMTUuF51X8q7p1mWw/gwOvUmjK1Nr3mi9FQf
 0Tnb5i8uFJO1OACffut0eEtdPMJpSooiDLOQaIU4Lm9ynA4gfDxQpTMV7Rbku1O6autE
 jTcMFN+MJ10T00MzBeIa/EchBI7Hqi9UhDESLNQRjlFHmgDF/bFP/2IPYsC18BlMQKq4
 vqWDnQQHLAwZfEhvCoz7kTmKX02h932u+UNYdjMEzkEbLjLLl4doGfhOiHq5lnZvznMb
 udh+0RAM19xZCTrZf1DDg+uudUWg253mQ6FeRfHWwepCs19rqlRE27h8RY+sr375yWPR
 Xyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YhvmB0oJ/6Gg0BgGuIKOUJsssCe/tsIiz9iE5rmnzNw=;
 b=HiCWus3ujp0ZLpjIRV1haWeOANZl/8AkAPoo9T68LPQxbLWz2e6TdQ4aqyx+YMp+4+
 1IRJKCrZvIb2YHwgdbqMm9CAWx2Fqf/o6ZMggLOdxQd09Z6zhNXkexFTJoLHLF5rhzbX
 eDlBj+cF+k4wl5oa/0Bd+4OR6m7AOVv1bVy/T1l0ZNXOst6lPspnr7y2+X/ki/RB0hJl
 3Qttzio38W9jYXtmr5wXiEjU6fCACGjj/CU9+PK6bfeXXy+oBYsxpiUcRDiHS+LfQu2E
 a2GI85cUztzUlkmCWI6fWvZkeWzFYRVnh7T1e7ufduxA3455SMD4vkkvBDFN7eWTfo6g
 4Ttw==
X-Gm-Message-State: AOAM532u+5SeMAEPY61kPHbh6YKw7l/7Apd6BMxyC01CH/gFB39yiHcV
 MIsGpNZN9PKH6D4qwoJeqdqTWR52rrc=
X-Received: by 2002:a5d:630b:: with SMTP id i11mr2983367wru.95.1598017753141; 
 Fri, 21 Aug 2020 06:49:13 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id h14sm5474648wml.30.2020.08.21.06.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 06:49:12 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/sbsa-ref.c : Add a fake embedded controller
To: Graeme Gregory <graeme@nuviainc.com>, qemu-arm@nongnu.org
References: <20200820133201.80577-1-graeme@nuviainc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6dd097d4-bae0-d629-7f4c-398f74f9a0e9@amsat.org>
Date: Fri, 21 Aug 2020 15:49:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820133201.80577-1-graeme@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, rad@semihalf.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OFK7FBk3SdCo

On 8/20/20 3:32 PM, Graeme Gregory wrote:
> A difference between sbsa platform and the virt platform is PSCI is
> handled by ARM-TF in the sbsa platform. This means that the PSCI code
> there needs to communicate some of the platform power changes down
> to the qemu code for things like shutdown/reset control.

No need to explicit 'fake' in patch subject, almost all emulated
devices are fake.

> 
> Space has been left to extend the EC if we find other use cases in
> future where ARM-TF and qemu need to communicate.
> 
> Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
> ---
>  hw/arm/sbsa-ref.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index f030a416fd..c8743fc1d0 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -41,6 +41,7 @@
>  #include "hw/usb.h"
>  #include "hw/char/pl011.h"
>  #include "net/net.h"
> +#include "migration/vmstate.h"
>  
>  #define RAMLIMIT_GB 8192
>  #define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
> @@ -62,6 +63,7 @@ enum {
>      SBSA_CPUPERIPHS,
>      SBSA_GIC_DIST,
>      SBSA_GIC_REDIST,
> +    SBSA_SECURE_EC,
>      SBSA_SMMU,
>      SBSA_UART,
>      SBSA_RTC,
> @@ -98,6 +100,14 @@ typedef struct {
>  #define SBSA_MACHINE(obj) \
>      OBJECT_CHECK(SBSAMachineState, (obj), TYPE_SBSA_MACHINE)
>  
> +typedef struct {
> +    SysBusDevice parent_obj;
> +    MemoryRegion iomem;
> +} SECUREECState;
> +
> +#define TYPE_SECURE_EC      "sbsa-secure-ec"
> +#define SECURE_EC(obj) OBJECT_CHECK(SECUREECState, (obj), TYPE_SECURE_EC)
> +
>  static const MemMapEntry sbsa_ref_memmap[] = {
>      /* 512M boot ROM */
>      [SBSA_FLASH] =              {          0, 0x20000000 },
> @@ -107,6 +117,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
>      [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
>      [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
>      [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
> +    [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
>      [SBSA_UART] =               { 0x60000000, 0x00001000 },
>      [SBSA_RTC] =                { 0x60010000, 0x00001000 },
>      [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
> @@ -585,6 +596,65 @@ static void *sbsa_ref_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>      return board->fdt;
>  }
>  
> +enum sbsa_secure_ec_powerstates {
> +    SBSA_SECURE_EC_CMD_NULL,
> +    SBSA_SECURE_EC_CMD_POWEROFF,
> +    SBSA_SECURE_EC_CMD_REBOOT,
> +};
> +
> +static uint64_t secure_ec_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    /* No use for this currently */
> +    return 0;
> +}
> +
> +static void secure_ec_write(void *opaque, hwaddr offset,
> +                     uint64_t value, unsigned size)
> +{
> +    if (offset == 0) { /* PSCI machine power command register */
> +        switch (value) {
> +        case SBSA_SECURE_EC_CMD_NULL:
> +            break;
> +        case SBSA_SECURE_EC_CMD_POWEROFF:
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +            break;
> +        case SBSA_SECURE_EC_CMD_REBOOT:
> +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +            break;
> +        default:
> +            error_report("sbsa-ref: ERROR Unkown power command");
> +        }
> +    } else {
> +        error_report("sbsa-ref: unknown EC register");
> +    }
> +}
> +
> +static const MemoryRegionOps secure_ec_ops = {
> +    .read = secure_ec_read,
> +    .write = secure_ec_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void secure_ec_init(Object *obj)
> +{
> +    SECUREECState *s = SECURE_EC(obj);
> +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &secure_ec_ops, s, "secure-ec",
> +                            0x1000);
> +    sysbus_init_mmio(dev, &s->iomem);
> +}
> +
> +static void create_secure_ec(MemoryRegion *mem)
> +{
> +    hwaddr base = sbsa_ref_memmap[SBSA_SECURE_EC].base;
> +    DeviceState *dev = qdev_create(NULL, TYPE_SECURE_EC);

This API has been removed in 2194abd6231 ("qdev: qdev_create(),
qdev_try_create() are now unused, drop"), can you rebase please?

> +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> +
> +    memory_region_add_subregion(mem, base,
> +                                sysbus_mmio_get_region(s, 0));
> +}
> +
>  static void sbsa_ref_init(MachineState *machine)
>  {
>      unsigned int smp_cpus = machine->smp.cpus;
> @@ -708,6 +778,8 @@ static void sbsa_ref_init(MachineState *machine)
>  
>      create_pcie(sms);
>  
> +    create_secure_ec(secure_sysmem);
> +
>      sms->bootinfo.ram_size = machine->ram_size;
>      sms->bootinfo.nb_cpus = smp_cpus;
>      sms->bootinfo.board_id = -1;
> @@ -798,8 +870,31 @@ static const TypeInfo sbsa_ref_info = {
>      .instance_size = sizeof(SBSAMachineState),
>  };
>  
> +static const VMStateDescription vmstate_secure_ec_info = {
> +    .name = "sbsa-secure-ec",
> +    .version_id = 0,
> +    .minimum_version_id = 0,

I'm think you need to initialize that, but VMStateDescription
is not my cup of tea, so better wait for confirmation by someone
more confident with it.

    .fields = (VMStateField[]) {
        VMSTATE_END_OF_LIST()
    }

> +};
> +
> +static void secure_ec_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_secure_ec_info;
> +    dc->user_creatable = false;
> +}
> +
> +static const TypeInfo secure_ec_info = {
> +    .name          = TYPE_SECURE_EC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(SECUREECState),
> +    .instance_init = secure_ec_init,
> +    .class_init    = secure_ec_class_init,
> +};
> +
>  static void sbsa_ref_machine_init(void)
>  {
> +    type_register_static(&secure_ec_info);
>      type_register_static(&sbsa_ref_info);
>  }
>  
> 

