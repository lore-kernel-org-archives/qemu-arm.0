Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp1166414lfb;
        Fri, 22 Jan 2021 12:26:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMlJratuxBwXu+4FmLM3C4NjMS0y94p0ZYCEBQ4C5JHVSiepnHObKSoF49C6q6+KTVHrCO
X-Received: by 2002:a25:ea09:: with SMTP id p9mr8848036ybd.109.1611347166824;
        Fri, 22 Jan 2021 12:26:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611347166; cv=none;
        d=google.com; s=arc-20160816;
        b=Zbw0g+w6iRXlsQBoLUTzsup12uwQzKRHPk80vlhyhz/44V85t/1Ten+SSonJrMNdKF
         PAlJWO38xmRO9LRRS4ct2zfYJwTZ7qrkd9nrvVaVYBjg2u3wXzpGpX2mH4Im8nSq07iA
         zuBhgpmNSsVGOAEQ62UsEKsuEz8o3TuBdB0O/csFA02QAnJUJ7tMrXtem5Xbe3zsA9ZF
         AJ/YU5i1sKDqUt8AO6umJQTlCRwmyVflqWoyg4zCEkDFZtLGCe47VfpJBDp8l4istrMX
         1wNvatUCCkmtniPaU6g+Vllj1AgNDDw57WY2/8zoZ9GFbThRr7mzhZwM57K8CUsqR5xP
         Dcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=TdVsPbk1jIzS4QbhB9Mfj4Vc6c2hc42I8DGaj20yQdY=;
        b=t8Ro0ZqBHK+43J3VW7MganaTsdPiQM85efwmBeYLpgpVI02Q0BY3zUl+wk0YpV0Kb1
         PyySFR72iqppJG/trhibc3D9RSkunwS3pB579Pk3AeURpmceZ05dj/dFPMGK6gEdrtSz
         D4P04/INY9ID7iB2oupXNehGLaiwiZUBdnFv9J3ipfxSbheCfS6RIiD0LL/CFsRrJms5
         Fk1W0b2VgKbQUNbNA0jMGZVFmHG5nznwHg7AjLUUWbt6LejVnSqhLPzDwtTxKlBjOKUI
         7N1r6cTp7+tJWrvzdhZdajR86D/UQeyIb7nuXZX5OW5vyeupWnmbxc+XdPSqRQfsFqW2
         /P4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=eW0HOg0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si2710525ybf.315.2021.01.22.12.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 12:26:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=eW0HOg0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:49880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l330Q-0003ZT-63
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 15:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l330C-0003YX-65; Fri, 22 Jan 2021 15:25:52 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:54336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3307-0002Xj-Pp; Fri, 22 Jan 2021 15:25:51 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 9428FC602E6;
 Fri, 22 Jan 2021 21:25:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611347143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TdVsPbk1jIzS4QbhB9Mfj4Vc6c2hc42I8DGaj20yQdY=;
 b=eW0HOg0QFRTvy06az+9ztXTeJmCZiVD9vecBzmvLXfWKxouHPNQbcQZKsE1RGS80wxJgjB
 8Jq/EYS6dJQnrWfkX6i4HRaZ5YmAQ/PBK3IjPAZy49SzdaAyISZWyYNywaSUhG1p8Wteip
 LI9AUr7zGHn1rYfeQZwJQfbREHwuG5NDCiUHGw9xNK+XAsGvXU/4Zbl2O5SZyC6z/WGg2N
 2bs7xiNJ8qLoMVvxoMbZgHrLORhOUUqn0t8wOdr8T7arHdJfxPB5PQOiXhs7ciBjIZVwuR
 kLfZNSpgBlnUTG/KZRhUrHRZWyRG+Bf6Gu4gbhIEV4v0iMfkXE05ypzCNgcLog==
Date: Fri, 22 Jan 2021 21:26:04 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 16/25] hw/arm/stellaris: Convert SSYS to QOM device
Message-ID: <20210122202604.r6e3nyyueqa57nm2@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-17-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-17-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6PUrCPR+/+vu

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> Convert the SSYS code in the Stellaris boards (which encapsulates the
> system registers) to a proper QOM device.  This will provide us with
> somewhere to put the output Clock whose frequency depends on the
> setting of the PLL configuration registers.
> 
> This is a migration compatibility break for lm3s811evb, lm3s6965evb.
> 
> We use 3-phase reset here because the Clock will need to propagate
> its value in the hold phase.
> 
> For the moment we reset the device during the board creation so that
> the system_clock_scale global gets set; this will be removed in a
> subsequent commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/stellaris.c | 132 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 107 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 652823195b1..0194ede2fe0 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -357,7 +357,12 @@ static void stellaris_gptm_realize(DeviceState *dev, Error **errp)
>  
>  /* System controller.  */
>  
> -typedef struct {
> +#define TYPE_STELLARIS_SYS "stellaris-sys"
> +OBJECT_DECLARE_SIMPLE_TYPE(ssys_state, STELLARIS_SYS)
> +
> +struct ssys_state {
> +    SysBusDevice parent_obj;
> +
>      MemoryRegion iomem;
>      uint32_t pborctl;
>      uint32_t ldopctl;
> @@ -371,11 +376,18 @@ typedef struct {
>      uint32_t dcgc[3];
>      uint32_t clkvclr;
>      uint32_t ldoarst;
> +    qemu_irq irq;
> +    /* Properties (all read-only registers) */
>      uint32_t user0;
>      uint32_t user1;
> -    qemu_irq irq;
> -    stellaris_board_info *board;
> -} ssys_state;
> +    uint32_t did0;
> +    uint32_t did1;
> +    uint32_t dc0;
> +    uint32_t dc1;
> +    uint32_t dc2;
> +    uint32_t dc3;
> +    uint32_t dc4;
> +};
>  
>  static void ssys_update(ssys_state *s)
>  {
> @@ -430,7 +442,7 @@ static uint32_t pllcfg_fury[16] = {
>  
>  static int ssys_board_class(const ssys_state *s)
>  {
> -    uint32_t did0 = s->board->did0;
> +    uint32_t did0 = s->did0;
>      switch (did0 & DID0_VER_MASK) {
>      case DID0_VER_0:
>          return DID0_CLASS_SANDSTORM;
> @@ -456,19 +468,19 @@ static uint64_t ssys_read(void *opaque, hwaddr offset,
>  
>      switch (offset) {
>      case 0x000: /* DID0 */
> -        return s->board->did0;
> +        return s->did0;
>      case 0x004: /* DID1 */
> -        return s->board->did1;
> +        return s->did1;
>      case 0x008: /* DC0 */
> -        return s->board->dc0;
> +        return s->dc0;
>      case 0x010: /* DC1 */
> -        return s->board->dc1;
> +        return s->dc1;
>      case 0x014: /* DC2 */
> -        return s->board->dc2;
> +        return s->dc2;
>      case 0x018: /* DC3 */
> -        return s->board->dc3;
> +        return s->dc3;
>      case 0x01c: /* DC4 */
> -        return s->board->dc4;
> +        return s->dc4;
>      case 0x030: /* PBORCTL */
>          return s->pborctl;
>      case 0x034: /* LDOPCTL */
> @@ -646,9 +658,9 @@ static const MemoryRegionOps ssys_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> -static void ssys_reset(void *opaque)
> +static void stellaris_sys_reset_enter(Object *obj, ResetType type)
>  {
> -    ssys_state *s = (ssys_state *)opaque;
> +    ssys_state *s = STELLARIS_SYS(obj);
>  
>      s->pborctl = 0x7ffd;
>      s->rcc = 0x078e3ac0;
> @@ -661,9 +673,19 @@ static void ssys_reset(void *opaque)
>      s->rcgc[0] = 1;
>      s->scgc[0] = 1;
>      s->dcgc[0] = 1;
> +}
> +
> +static void stellaris_sys_reset_hold(Object *obj)
> +{
> +    ssys_state *s = STELLARIS_SYS(obj);
> +
>      ssys_calculate_system_clock(s);
>  }
>  
> +static void stellaris_sys_reset_exit(Object *obj)
> +{
> +}
> +
>  static int stellaris_sys_post_load(void *opaque, int version_id)
>  {
>      ssys_state *s = opaque;
> @@ -695,27 +717,66 @@ static const VMStateDescription vmstate_stellaris_sys = {
>      }
>  };
>  
> +static Property stellaris_sys_properties[] = {
> +    DEFINE_PROP_UINT32("user0", ssys_state, user0, 0),
> +    DEFINE_PROP_UINT32("user1", ssys_state, user1, 0),
> +    DEFINE_PROP_UINT32("did0", ssys_state, did0, 0),
> +    DEFINE_PROP_UINT32("did1", ssys_state, did1, 0),
> +    DEFINE_PROP_UINT32("dc0", ssys_state, dc0, 0),
> +    DEFINE_PROP_UINT32("dc1", ssys_state, dc1, 0),
> +    DEFINE_PROP_UINT32("dc2", ssys_state, dc2, 0),
> +    DEFINE_PROP_UINT32("dc3", ssys_state, dc3, 0),
> +    DEFINE_PROP_UINT32("dc4", ssys_state, dc4, 0),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static void stellaris_sys_instance_init(Object *obj)
> +{
> +    ssys_state *s = STELLARIS_SYS(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
> +
> +    memory_region_init_io(&s->iomem, obj, &ssys_ops, s, "ssys", 0x00001000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);
> +}
> +
>  static int stellaris_sys_init(uint32_t base, qemu_irq irq,
>                                stellaris_board_info * board,
>                                uint8_t *macaddr)
>  {
> -    ssys_state *s;
> +    DeviceState *dev = qdev_new(TYPE_STELLARIS_SYS);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>  
> -    s = g_new0(ssys_state, 1);
> -    s->irq = irq;
> -    s->board = board;
>      /* Most devices come preprogrammed with a MAC address in the user data. */
> -    s->user0 = macaddr[0] | (macaddr[1] << 8) | (macaddr[2] << 16);
> -    s->user1 = macaddr[3] | (macaddr[4] << 8) | (macaddr[5] << 16);
> +    qdev_prop_set_uint32(dev, "user0",
> +                         macaddr[0] | (macaddr[1] << 8) | (macaddr[2] << 16));
> +    qdev_prop_set_uint32(dev, "user1",
> +                         macaddr[3] | (macaddr[4] << 8) | (macaddr[5] << 16));
> +    qdev_prop_set_uint32(dev, "did0", board->did0);
> +    qdev_prop_set_uint32(dev, "did1", board->did1);
> +    qdev_prop_set_uint32(dev, "dc0", board->dc0);
> +    qdev_prop_set_uint32(dev, "dc1", board->dc1);
> +    qdev_prop_set_uint32(dev, "dc2", board->dc2);
> +    qdev_prop_set_uint32(dev, "dc3", board->dc3);
> +    qdev_prop_set_uint32(dev, "dc4", board->dc4);
> +
> +    sysbus_realize_and_unref(sbd, &error_fatal);
> +    sysbus_mmio_map(sbd, 0, base);
> +    sysbus_connect_irq(sbd, 0, irq);
> +
> +    /*
> +     * Normally we should not be resetting devices like this during
> +     * board creation. For the moment we need to do so, because
> +     * system_clock_scale will only get set when the STELLARIS_SYS
> +     * device is reset, and we need its initial value to pass to
> +     * the watchdog device. This hack can be removed once the
> +     * watchdog has been converted to use a Clock input instead.
> +     */
> +    device_cold_reset(dev);
>  
> -    memory_region_init_io(&s->iomem, NULL, &ssys_ops, s, "ssys", 0x00001000);
> -    memory_region_add_subregion(get_system_memory(), base, &s->iomem);
> -    ssys_reset(s);
> -    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_stellaris_sys, s);
>      return 0;
>  }
>  
> -
>  /* I2C controller.  */
>  
>  #define TYPE_STELLARIS_I2C "stellaris-i2c"
> @@ -1553,11 +1614,32 @@ static const TypeInfo stellaris_adc_info = {
>      .class_init    = stellaris_adc_class_init,
>  };
>  
> +static void stellaris_sys_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_stellaris_sys;
> +    rc->phases.enter = stellaris_sys_reset_enter;
> +    rc->phases.hold = stellaris_sys_reset_hold;
> +    rc->phases.exit = stellaris_sys_reset_exit;
> +    device_class_set_props(dc, stellaris_sys_properties);
> +}
> +
> +static const TypeInfo stellaris_sys_info = {
> +    .name = TYPE_STELLARIS_SYS,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(ssys_state),
> +    .instance_init = stellaris_sys_instance_init,
> +    .class_init = stellaris_sys_class_init,
> +};
> +
>  static void stellaris_register_types(void)
>  {
>      type_register_static(&stellaris_i2c_info);
>      type_register_static(&stellaris_gptm_info);
>      type_register_static(&stellaris_adc_info);
> +    type_register_static(&stellaris_sys_info);
>  }
>  
>  type_init(stellaris_register_types)
> -- 
> 2.20.1
> 

-- 
