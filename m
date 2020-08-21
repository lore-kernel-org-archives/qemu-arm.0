Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp201729lfy;
        Fri, 21 Aug 2020 04:41:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSv+JhAiBwXtvqqyfTwK0sj9Lw3u0f00NrA6pCQPZ6dEBpWc/hLkDam23SzZqXOQ0IY9dI
X-Received: by 2002:a25:7ec5:: with SMTP id z188mr3244392ybc.57.1598010081867;
        Fri, 21 Aug 2020 04:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598010081; cv=none;
        d=google.com; s=arc-20160816;
        b=Eppgcg0zDUngOOmHIfxn7Qyxwam+8Ti2dyo7tGr+7VqVb6uj92QEN6s2G+Ng7uebuK
         nJChs7wTbCoXVUtIyeFB+wUsMhxFUYo7RA+4/BnhhOJjKfUj2xjzS8K/SnaIwVn8ZOXe
         nz+3qb9uPMquAWtIiK3Jpn26ErYpgY5S2XgkdtQgThPrldhH9x/PKciN8SMFZv5YB8TO
         94pKNEy3R7DDEKB8bzazZQCrGY/0i/LZizDg5loioVE320qwWdnx+6VurR4rYlxgMBi2
         Y31BpzB76Clh0E0ylJpiEftlEN9LVKjpvEQ142w8mkyV0X9eBn5+lZ69jLGS+P0SZ6jp
         6nRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=MB2U+/7um/HkCx0cImuwf5fXVXkU50hae+/WHXp2ULc=;
        b=kZ0ZJGCx0LgF1bvYP9GfSqBW+iax6/XWxqrh0OMmOqWvRN1Zfg4q1l0FRd084MSOCT
         VPd6mBDiixzVcdteVRPoFRHJ2VUWfMJ/ZpdHHqPVDdhzGuCedR2gRqrHrXCLekT1yqnw
         IX8uVsAd3kYqlU0dtmSkqzStK0LXzihV+BS0/cik1eBtyBR/bTDLrmGUq9lEjeJvN6YW
         eZgzp2Rc3sCZWuO8oEhOgki6KRdpP/tAYGAIvB38KHRHrukaGwZH2J5Y7PE7FNpnvt0Z
         E5qkfAjeisTGCcYZB9LxtgOIENW6LR0iaxncy59BEE/WWqM9Cr8B/ARY1RQ4y2MHprSk
         bVKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=LiXSNBk9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206si2009801ybb.62.2020.08.21.04.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 04:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=LiXSNBk9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k95Q9-00014l-2B
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 07:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1k94wl-0001G2-Tq
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 07:10:59 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1k94wj-0007Xl-DI
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 07:10:59 -0400
Received: by mail-wr1-x444.google.com with SMTP id f7so1593449wrw.1
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MB2U+/7um/HkCx0cImuwf5fXVXkU50hae+/WHXp2ULc=;
 b=LiXSNBk9IXl5OJ6rApMhTG7vdDO4N1JKyApHlNgiCXQhYP51S7mncn9WAbMCmRQcWq
 nu9c9KxeNewUbeb57IL8JQESl+8uI2dhFw+lhprL5PDDHD2ObxJYsG91b0VOdF/zb/bc
 OOFDe5NpJ9hRqvDZ/RV/3FZy67w/ywQJbrfbKeBj/B672rX5WYaApGTtBlqH5gCMeI/n
 oUlcoK5Dj54hkPc8g94916meFHgYGmvnoYZow5ivmQ07wk+eOJaRMKI7sl9I5ZYivDqT
 J2Yh8xEFMOxHRs1wiR6vKd8pKTsXv8GFp/ZFrklx4NZCwmJIFRXWVHUvQR07CIFkBfsX
 ZiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MB2U+/7um/HkCx0cImuwf5fXVXkU50hae+/WHXp2ULc=;
 b=npk2jEoR3H5uCiDwoOoFojM8r7X/K4BpFmYp73A815grJ8WTZZINnjTAntri9p2gUm
 43udCYV12hcVt/zIC0BPyiuntGrF4nS+WWLNkJucsfKBGZLuZGdHcWtgxFZDpnpi80iW
 gHAYy1S2XK61W56l3kd557SiRTy78EVcJ+5EwZVVUlGskIN/ChJiKGJOWhGfXLJ0har0
 /x8McvhtUbyuWCjxnZgq2lilKYlCSj5D/+gDVyyJbdYTKGAluzkch5ngA8Z6JkY/cpaz
 qb9PrASyyDSrIcWdYqfJyuxRQPGmCByDPM2H8ZQxQu8CK625Giyl49m6JBF98MLePulM
 EkZQ==
X-Gm-Message-State: AOAM530FNd39ByIRsWrkCXvTF0DahMW0O6gM4tJfo1dAmGdzSbBnCloA
 m8xxlDA8Wy8+90WgEE6iLY88WQ==
X-Received: by 2002:adf:e94a:: with SMTP id m10mr2428280wrn.249.1598008255456; 
 Fri, 21 Aug 2020 04:10:55 -0700 (PDT)
Received: from vanye ([2001:470:1f09:12f0:b26e:bfff:fea9:f1b8])
 by smtp.gmail.com with ESMTPSA id t8sm4548681wmt.35.2020.08.21.04.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 04:10:55 -0700 (PDT)
Date: Fri, 21 Aug 2020 12:10:53 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Graeme Gregory <graeme@nuviainc.com>
Subject: Re: hw/arm/sbsa-ref.c : Add a fake embedded controller
Message-ID: <20200821111053.GJ1191@vanye>
References: <20200820133201.80577-1-graeme@nuviainc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820133201.80577-1-graeme@nuviainc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 rad@semihalf.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7FjCxvDTmtWS

On Thu, Aug 20, 2020 at 14:32:01 +0100, Graeme Gregory wrote:
> A difference between sbsa platform and the virt platform is PSCI is
> handled by ARM-TF in the sbsa platform. This means that the PSCI code
> there needs to communicate some of the platform power changes down
> to the qemu code for things like shutdown/reset control.
> 
> Space has been left to extend the EC if we find other use cases in
> future where ARM-TF and qemu need to communicate.
> 
> Signed-off-by: Graeme Gregory <graeme@nuviainc.com>

I can confirm that with the qdev_create->qdev_new fixup, the model can
now reset or shut down through software control. Verified from UEFI
Shell with upstream edk2-platforms and upstream + 1 patch
trusted-firmware-a.

So with that fix:
Tested-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Leif Lindholm <leif@nuviainc.com>

Thanks!

/
    Leif

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
> -- 
> 2.25.1
> 
