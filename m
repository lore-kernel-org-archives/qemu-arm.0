Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A0ED3CC88
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Jan 2026 23:12:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgA1m-0002T6-N0; Wed, 14 Jan 2026 18:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vgA1k-0002Q3-P7
 for qemu-arm@nongnu.org; Wed, 14 Jan 2026 18:11:48 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vgA1j-0007Y0-9u
 for qemu-arm@nongnu.org; Wed, 14 Jan 2026 18:11:48 -0500
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-5014acad6f2so59481cf.1
 for <qemu-arm@nongnu.org>; Wed, 14 Jan 2026 15:11:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768432303; cv=none;
 d=google.com; s=arc-20240605;
 b=ZFoczx2IFF8N6nxNTvmHZge+2DUz45wIv+bF1Guo8OmkFj6c+DFKOhB+366+JAteoa
 up869gN0aFweImUhvqtbBTHsU0QTvyF4DpefJSyBMXdJjiZ+Gu9cxHtBXAEEQk3iwvlf
 yOPTJuC2ghYwFei2yEDw56Co44eh59T4QzGxnJnSH3xNBtUmJxRW5vxdloeGApv3TezW
 yiHYNKh3DPuPfOpmtCvO+4eoEtV0hcG6T6S6Is0za+JTwJikBi1ytAZHIY3MKakvrKko
 42rA6+Etrr44+zpu5jo2MXnCtsCXUDcC8szl570/NzSJM9OtWilY0FGIe9GMlg4wnWgN
 rL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AQ2Z09MXI0KxASX4FLCm0KMiDhuMYFm0OZRiGXJR+k4=;
 fh=rteU93bqylIRKQhaX9hD33KAOmQnyfFLFXz4ea/9YaY=;
 b=fF3/RaXac7VbyJX0qjEtLrP1px+S/vyQBOh1Sm117NQucyLY/lApya1XM9t3EBJjgp
 aeu9M8HJBw3scUgxF8ETu8oXa9Wxu8st+12nBHqs2/ooPLBVqCGVNl3d8DzIMELgiORE
 DRSPW8iNn8U1ksMBvlYIFU13JjkqXXSZpU/oX11DA1Fxi2+f7pEYHk54GW/Utb2tKNeE
 FtUZe6JN0e+301JRfPCvECRBcJquHBxIp/r/kB+BQdIlKATty+ulH0+2CpjnANFFrlGD
 6Kc4RMxxDB79ziWF3ZpmL4CTQq0hpCAswHk120srqmXgVgWmXvapWl1QKT0SecURHN0x
 4rXw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768432303; x=1769037103; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQ2Z09MXI0KxASX4FLCm0KMiDhuMYFm0OZRiGXJR+k4=;
 b=SFfzOqkXL0VvfU3TRHg0FczVoLa0dihrWeYd8mNc2nbjIYWaVhZmwTIkwAPYtBkXHL
 5DaB99TiEV06nw+QB0v6as7Rz9kGQnCZy8d9GUP3f/wPCV37x6X779N28TXC5Y3oeQTV
 WYNlidx5B8ejGhTXOFSFOVRj7sPTDlRPB5LeATCJ4vwouwlR6Ii9Wf0b0KJ+mw4xnOTX
 1KjWDOrIoEUzCIvq+7CRiq/Ge3/sMY53mvJlp2QI+BNBFZo+oa5Xkli7pJPqRArHf2HZ
 ch++7QTaXz5Gg2+ApKsa9XCirae7An8V36/cH257XbnG5bKaBO3mNI/O5av40amiGQ7Y
 9m1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768432303; x=1769037103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AQ2Z09MXI0KxASX4FLCm0KMiDhuMYFm0OZRiGXJR+k4=;
 b=RtrOIQ1f5Qy0+MtwItblmIj8bmVINQ2XyD8LON0eVJlAst2sy3aViDnp3oIwmwxb+H
 fkzqE2/bXALZn483D9u4flSjOQ9mSVcdjiOsXrXxKkRbybzNRGqTsQJ0ju/1pwjeSwiL
 QQLtb/xZe+CFmCdN8BndRER8J8LtKT2WUqtmlM3C0mBJzlJ3RwkBXteJB922LwcF6pow
 iNKVN97jeu+7UmIA75IvWrv/KwnxJWmvMC9YgQyJWd/wf+pSfVxkZ5xUPp6PTctzSY02
 nctK0ULALcI/Wy0VRzYuK/9zi+xR2JoTrbWOzXawDF4lIhwI8nv88E6tijNYqOST61eT
 RfnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXm2SKk1myPhQn84xPN4lzP7eAWdGcIqj7lzMUQBku+6tI8ASIrX6qtr1qCj0RMtaQtnXAM+znlQ==@nongnu.org
X-Gm-Message-State: AOJu0YzPieN18JvswUDclsw2A0At111rfDD0PEqjfqfVGz0GRE36QBUo
 p/AmHDWQJrPyrzX9Vz1E4AafX+OrrLQhbyxWNQV6shbGsGfFuSpAMxhApLpHx1ftPh+tsOekFT/
 bH1fdK5JBFh/2Mm8ko4FFjoielKeJu8XA/3n5uBHz
X-Gm-Gg: AY/fxX5uLVVzgFPWLbydEOLz4IpEDpD9HKcuz1FGzG+eUwVrlWRinjoz5zCWETehmCk
 /eTZlc84DXyyRoEzgrt68pBoSNtcKZQZywMaInrMWROOowtY90qZC63aeSt5oOsN48kworlsHH7
 0U6khE33VQlNog54vJHsio/yViCw9lmgxWiaMZotVxQ88RL7wjbWJvy6nCQC2ksdYRLYJYuC02F
 hFPCXvsVULyAl4yQotqPayFOcgfQW4qu9WsSbTCxyTHnv3FyBn79YjUcpnWw1ycJyRkOvgit8cf
 vehh6ZPC1+ZdbjF8QCYsvLUfrNS2n0W0AkWW
X-Received: by 2002:ac8:7fc6:0:b0:4f1:a61a:1e8 with SMTP id
 d75a77b69052e-501eab944edmr4020121cf.10.1768432302406; Wed, 14 Jan 2026
 15:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20260112083054.4151945-1-kane_chen@aspeedtech.com>
 <20260112083054.4151945-2-kane_chen@aspeedtech.com>
In-Reply-To: <20260112083054.4151945-2-kane_chen@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Wed, 14 Jan 2026 15:11:30 -0800
X-Gm-Features: AZwV_QhLVCqVeHJr__lKBUJlN0Vg4Yb2L0XiEomk3NfIrhN_1ljIvOrC2_9Sxv4
Message-ID: <CA+QoejXKnT6iNuyAS3rDg3ovYbAyBf5crPrw9kYGm73Uk0S1uw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/i2c/aspeed: Introduce 'bus-label' to customize
 bus naming
To: Kane Chen <kane_chen@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Jan 12, 2026 at 12:38=E2=80=AFAM Kane Chen via qemu development
<qemu-devel@nongnu.org> wrote:
>
> From: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> On some Aspeed-based machines, multiple I2C controllers may exist
> across different components, such as the primary SoC and an external
> IO expander or co-processor (e.g., AST1700). Using the current static
> naming convention results in object name conflicts when multiple
> controllers attempt to instantiate buses with the same ID.
>
> This patch introduces a 'bus-label' property for the Aspeed I2C
> controller. This allows higher-level layers, such as the SoC realize
> function, to provide a unique identifier for the buses. The I2C bus
> object name is then constructed using this label (e.g., "ioexp0.0"
> instead of the default "aspeed.i2c.bus.0").
>
> This enhancement ensures unique bus identifiers across the system and
> resolves naming conflicts in multi-controller configurations.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>

Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>

This is basically a rework of the bus-label patches I already tested
and we're carrying for AST1700, re-tested just in case, and everything
still looks good!

Thank you Kane!

-Nabih

> ---
>  include/hw/i2c/aspeed_i2c.h |  2 ++
>  hw/i2c/aspeed_i2c.c         | 27 +++++++++++++++++++++------
>  2 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index ffcff2580f..68bd138026 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -252,6 +252,7 @@ struct AspeedI2CBus {
>      MemoryRegion mr_pool;
>
>      I2CBus *bus;
> +    char *name;
>      uint8_t id;
>      qemu_irq irq;
>
> @@ -269,6 +270,7 @@ struct AspeedI2CState {
>      uint32_t intr_status;
>      uint32_t ctrl_global;
>      uint32_t new_clk_divider;
> +    char *bus_label;
>      MemoryRegion pool_iomem;
>      uint8_t share_pool[ASPEED_I2C_SHARE_POOL_SIZE];
>
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 1b8ac561c3..7cf92423c7 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -1215,9 +1215,16 @@ static void aspeed_i2c_realize(DeviceState *dev, E=
rror **errp)
>                            "aspeed.i2c", aic->mem_size);
>      sysbus_init_mmio(sbd, &s->iomem);
>
> +    /* default value */
> +    if (!s->bus_label) {
> +        s->bus_label =3D g_strdup(TYPE_ASPEED_I2C_BUS);
> +    }
> +
>      for (i =3D 0; i < aic->num_busses; i++) {
>          Object *bus =3D OBJECT(&s->busses[i]);
>          int offset =3D i < aic->gap ? 1 : 5;
> +        g_autofree char *name =3D g_strdup_printf("%s.%d",
> +                                                s->bus_label, i);
>
>          if (!object_property_set_link(bus, "controller", OBJECT(s), errp=
)) {
>              return;
> @@ -1227,6 +1234,10 @@ static void aspeed_i2c_realize(DeviceState *dev, E=
rror **errp)
>              return;
>          }
>
> +        if (!object_property_set_str(bus, "bus-name", name, errp)) {
> +            return;
> +        }
> +
>          if (!sysbus_realize(SYS_BUS_DEVICE(bus), errp)) {
>              return;
>          }
> @@ -1263,6 +1274,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Er=
ror **errp)
>  static const Property aspeed_i2c_properties[] =3D {
>      DEFINE_PROP_LINK("dram", AspeedI2CState, dram_mr,
>                       TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_STRING("bus-label", AspeedI2CState, bus_label),
>  };
>
>  static void aspeed_i2c_class_init(ObjectClass *klass, const void *data)
> @@ -1423,24 +1435,26 @@ static void aspeed_i2c_bus_realize(DeviceState *d=
ev, Error **errp)
>  {
>      AspeedI2CBus *s =3D ASPEED_I2C_BUS(dev);
>      AspeedI2CClass *aic;
> -    g_autofree char *name =3D g_strdup_printf(TYPE_ASPEED_I2C_BUS ".%d",=
 s->id);
> -    g_autofree char *pool_name =3D g_strdup_printf("%s.pool", name);
> +    g_autofree char *pool_name =3D NULL;
>
> -    if (!s->controller) {
> -        error_setg(errp, TYPE_ASPEED_I2C_BUS ": 'controller' link not se=
t");
> +    if (!s->controller || !s->name) {
> +        error_setg(errp, TYPE_ASPEED_I2C_BUS
> +                   ": 'controller' or 'bus-name' not set");
>          return;
>      }
>
> +    pool_name =3D g_strdup_printf("%s.pool", s->name);
> +
>      aic =3D ASPEED_I2C_GET_CLASS(s->controller);
>
>      sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>
> -    s->bus =3D i2c_init_bus(dev, name);
> +    s->bus =3D i2c_init_bus(dev, s->name);
>      s->slave =3D i2c_slave_create_simple(s->bus, TYPE_ASPEED_I2C_BUS_SLA=
VE,
>                                         0xff);
>
>      memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
> -                          s, name, aic->reg_size);
> +                          s, s->name, aic->reg_size);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mr);
>
>      memory_region_init_io(&s->mr_pool, OBJECT(s), &aspeed_i2c_bus_pool_o=
ps,
> @@ -1452,6 +1466,7 @@ static const Property aspeed_i2c_bus_properties[] =
=3D {
>      DEFINE_PROP_UINT8("bus-id", AspeedI2CBus, id, 0),
>      DEFINE_PROP_LINK("controller", AspeedI2CBus, controller, TYPE_ASPEED=
_I2C,
>                       AspeedI2CState *),
> +    DEFINE_PROP_STRING("bus-name", AspeedI2CBus, name),
>  };
>
>  static void aspeed_i2c_bus_class_init(ObjectClass *klass, const void *da=
ta)
> --
> 2.43.0
>
>

