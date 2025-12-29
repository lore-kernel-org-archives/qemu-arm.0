Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9F4E92FC4
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:38:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ3w-0003Vp-Iu; Mon, 29 Dec 2025 14:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ3u-0003On-Qt
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:37:51 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ3q-0000Bn-Lr
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:37:50 -0500
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-4edb8d6e98aso4444371cf.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037064; cv=none;
 d=google.com; s=arc-20240605;
 b=Bxrz7Pw02DMoO33uELnffdib9F8/ayrK3O/cOFOnJ29cxDpFfRqf9aW6Cv3um1jN8A
 VjuS68IvgdL7Myw9ZdiX1qmPNRwf+dDzoRqVon5DFH3KUkQN5KU5BQnX1heB01QqU0Jv
 jf+JcPIv3TsbY+5W5j4mKm3ImQ3RS4g03HREDpRaPICA6DdWo6ipe33BXJU7tRKX++FP
 xm1svp5OCvnUzIkvaawimM5WgGqPUMDs4nG+0OCqGiBwdBz0SVChQIA3dP4j2qmVqQ+D
 ezx/wC2sy+4jUF67SWjUfafHjpm0QXGj0Pkj+Ll2TEsDueKIpTlOZdjN4js1EZExobSY
 6WfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Nx3D9lvC8kud3HKOyVg5mt8h5bRG3vvp7IeWV9chrFo=;
 fh=Ft8sOpvIfrRNq8EIWVzE4B+O3G83q8TDUSv0u405T9c=;
 b=NdUiSTvSu10tDUX9N+xZc7/O8TmFuifHNDqLQjfEIDaFdB1pWIuLV5m4yINtq9xEl0
 s6j9V0HQMvi+Tg34py4Pun4NxjHf9nFrkIE+W8QtJ4hpnORDJ3424za9ot0Zspf0ZBPd
 W5BTdzB8p9C+gJwHiNMuxP4OWV8U1n0EOker/AaWuB7u3yeg0YCXMf5hAhoh81hYtJHR
 CZFW3rFYVGsw8aT+Pu8WgSvBLBUq9KRjs2aT7dgGmUhLoQQqoh2eXY3EZqQToZqns6Ey
 G/4JDE0TjnKktk2k2VBbxCQIDxTPg3NLMMaHg9ywQx1rqSXFDXNQp32xfqKiAVJd1+nl
 WO4g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037064; x=1767641864; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nx3D9lvC8kud3HKOyVg5mt8h5bRG3vvp7IeWV9chrFo=;
 b=rmMuLBX4hysaeML/f3pNowpMAGZCGBmQyFT0KRicqfkJ2TJk5aclo280rdPYmhwHTc
 n77bfXkzwZbekpC4rodRcS2V4PpaEzD1qLcvVtqsU1Rpow/tUYJ+W21lzVVNC3wpGcn3
 dnYlzRWXgi2Md1qYqiZftVi6xYRG2ce2TXR4MKRb7OP6hErmkgkMZngL9+Llf2wCUYzg
 +dQitsL4XEgOtsWUl7cPvv00ZZPa0HyQqVBZjruIj35XTqFOAxzAgRJcp/QbhXvs0qLA
 ecYCNy0XG/SOLSy03ozVRyGk8wqpJHTTdCvv74/i/v6GnXjfX3NHDTPxj2axQibsg/24
 nEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037064; x=1767641864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Nx3D9lvC8kud3HKOyVg5mt8h5bRG3vvp7IeWV9chrFo=;
 b=Xz3bfNm0sfbW26SA4AsTDK2J+krZzYOHQo6bX0LJ319KCLZJUd/Jpou/L1JeXm8/a3
 70MXopPJlvlpp5Sntdpm+jUgIcz/JgWB6Dd9FoXahHGOQXCDOM/vXahyBl+GQ4GX6rDU
 eRuMa8Z7mnGz3XmajX29JOCNXskMJh84i3rbUawqKdkM5mCwzcyvXvYJQl+A4yoxFlpg
 sTrI5NLDIxMekiVdvcynkWbTlkBTnZWmvbyIZ0y/gnPfIiv/9MdyPh+eTVlA1VFvXkr8
 ka+PR3Zs8afq4lgvRELlM8XYLoTqVgeXVs/V8buovW0yg9KFMiLybiYNbS9SjysvliHh
 whRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhrK4HRUxkKSqW95e1pdktAi7rfRQP4zur07bCPzrL01vGx8BHvO/Y5pUZt17g3Z+MH5VYEt7oig==@nongnu.org
X-Gm-Message-State: AOJu0Yzp+dF7EMYilh9nq8QRu6FcLu+lSDctz4VONVZJQrwlVZbdrVHl
 oM+MD3W0cGNoUTU3kmm1CODFSHJHmC7eVVOSv1ZKp5VCpJY57h6J+QiUGRrrYAPrz1jyiwK00nt
 T0CyYl/EOEee8IxMX05g5OFkhTfNlRDWCi2cGhrlr
X-Gm-Gg: AY/fxX7Av9vVP29YfqydYZrY0hDXUUW6kAZvxpatsyzRdbsh3u+wFtMN8862bdkE/zl
 zdhP2XJEyAZMB2ynJwjQl9qCSO6pA/Uw7WUAjIs7NS09lPgVIVLvyrC7WCqYPif8wxJE9tTzHxF
 RdC0htuju1pq2LWwuzwh2z8GKBFg0s/nJqrMksgdDJSHr/zMQdRlhV37oryqMq8LlaJu+jA2YXJ
 amX7vv2kT5iSXf6+/Npxh1oJoF6c9mRCPOY60T858eubiMXGFbjsmBIcWkCm1P8wVi0u+SdwTwJ
 GlF39u8flniFznKoYpkxtOzsYA==
X-Google-Smtp-Source: AGHT+IETFx2yf6Xk/LLQzHkasdKtZZumSTqLuCp3e1IsoAnxQCb0IH/iPubB8G72r4RSQVSQT+5yf7YbCnJy/rfCaSk=
X-Received: by 2002:a05:622a:307:b0:4f3:5474:3cb9 with SMTP id
 d75a77b69052e-4f4e4e2b98bmr40532341cf.14.1767037063614; Mon, 29 Dec 2025
 11:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-2-kane_chen@aspeedtech.com>
 <49c3d3ef-b918-4b65-b4ec-3b740cb489f9@kaod.org>
In-Reply-To: <49c3d3ef-b918-4b65-b4ec-3b740cb489f9@kaod.org>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:37:32 -0800
X-Gm-Features: AQt7F2pSp5g8b3f2pimsgbMKMmDbT_aKzlhXlWaatol0ybcqHSnAuxkv_rTKWZw
Message-ID: <CA+QoejVvXrZ2aJahFDu0cv6hXvYPyRrcGkM-crdZT1-7bjV1Gw@mail.gmail.com>
Subject: Re: [PATCH v4 01/19] hw/misc: Add LTPI controller
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Kane Chen <kane_chen@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x833.google.com
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

On Wed, Dec 24, 2025 at 2:36=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 12/24/25 02:41, Kane Chen via wrote:
> > From: Kane-Chen-AS <kane_chen@aspeedtech.com>
> >
> > LTPI (LVDS Tunneling Protocol & Interface) is defined in the OCP DC-SCM
> > 2.0 specification:
> > https://www.opencompute.org/documents/ocp-dc-scm-2-0-ltpi-ver-1-0-pdf
> >
> > LTPI is a protocol and physical interface for tunneling various low-spe=
ed
> > signals between the HPM and SCM. As shown in Figure 2, the AST27x0 (lef=
t)
> > integrates two LTPI controllers, allowing it to connect to up to two
> > extended boards.
> >
> > This commit introduces a simple device model for the ASPEED LTPI
> > controller in QEMU.
> >
> > The model includes basic MMIO read/write operations and sets default
> > register values during reset to emulate a link-up state.
> >
> > Implements register space with read/write callbacks.
> >
> > Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>



> > ---
> >   include/hw/misc/aspeed_ltpi.h |  33 ++++++
> >   hw/misc/aspeed_ltpi.c         | 193 +++++++++++++++++++++++++++++++++=
+
> >   hw/misc/meson.build           |   1 +
> >   3 files changed, 227 insertions(+)
> >   create mode 100644 include/hw/misc/aspeed_ltpi.h
> >   create mode 100644 hw/misc/aspeed_ltpi.c
> >
> > diff --git a/include/hw/misc/aspeed_ltpi.h b/include/hw/misc/aspeed_ltp=
i.h
> > new file mode 100644
> > index 0000000000..e991afc666
> > --- /dev/null
> > +++ b/include/hw/misc/aspeed_ltpi.h
> > @@ -0,0 +1,33 @@
> > +/*
> > + * ASPEED LTPI Controller
> > + *
> > + * Copyright (C) 2025 ASPEED Technology Inc.
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +#ifndef ASPEED_LTPI_H
> > +#define ASPEED_LTPI_H
> > +
> > +#include "hw/sysbus.h"
> > +
> > +#define TYPE_ASPEED_LTPI "aspeed.ltpi-ctrl"
> > +OBJECT_DECLARE_SIMPLE_TYPE(AspeedLTPIState, ASPEED_LTPI)
> > +
> > +#define ASPEED_LTPI_TOTAL_SIZE  0x900
> > +#define ASPEED_LTPI_CTRL_SIZE   0x200
> > +#define ASPEED_LTPI_PHY_SIZE    0x100
> > +#define ASPEED_LTPI_TOP_SIZE    0x100
> > +
> > +struct AspeedLTPIState {
> > +    SysBusDevice parent;
> > +    MemoryRegion mmio;
> > +    MemoryRegion mmio_ctrl;
> > +    MemoryRegion mmio_phy;
> > +    MemoryRegion mmio_top;
> > +
> > +    uint32_t ctrl_regs[ASPEED_LTPI_CTRL_SIZE >> 2];
> > +    uint32_t phy_regs[ASPEED_LTPI_PHY_SIZE >> 2];
> > +    uint32_t top_regs[ASPEED_LTPI_TOP_SIZE >> 2];
> > +};
> > +
> > +#endif /* ASPEED_LTPI_H */
> > diff --git a/hw/misc/aspeed_ltpi.c b/hw/misc/aspeed_ltpi.c
> > new file mode 100644
> > index 0000000000..131cea9c6b
> > --- /dev/null
> > +++ b/hw/misc/aspeed_ltpi.c
> > @@ -0,0 +1,193 @@
> > +/*
> > + * ASPEED LTPI Controller
> > + *
> > + * Copyright (C) 2025 ASPEED Technology Inc.
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "migration/vmstate.h"
> > +#include "hw/misc/aspeed_ltpi.h"
> > +
> > +#define ASPEED_LTPI_CTRL_BASE   0x000
> > +#define ASPEED_LTPI_PHY_BASE    0x200
> > +#define ASPEED_LTPI_TOP_BASE    0x800
> > +
> > +#define LTPI_CTRL_LINK_MNG 0x42
> > +#define LTPI_PHY_MODE 0x0
> > +
> > +static uint64_t aspeed_ltpi_top_read(void *opaque, hwaddr offset, unsi=
gned size)
> > +{
> > +    AspeedLTPIState *s =3D opaque;
> > +    uint32_t idx =3D offset >> 2;
> > +
> > +    return s->top_regs[idx];
> > +}
> > +
> > +static void aspeed_ltpi_top_write(void *opaque, hwaddr offset,
> > +                              uint64_t val, unsigned size)
> > +{
> > +    AspeedLTPIState *s =3D opaque;
> > +    uint32_t idx =3D offset >> 2;
> > +
> > +    switch (offset) {
> > +    default:
> > +        s->top_regs[idx] =3D (uint32_t)val;
> > +        break;
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps aspeed_ltpi_top_ops =3D {
> > +    .read =3D aspeed_ltpi_top_read,
> > +    .write =3D aspeed_ltpi_top_write,
> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +    .valid =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 4,
> > +    },
> > +};
> > +
> > +static uint64_t aspeed_ltpi_phy_read(void *opaque, hwaddr offset, unsi=
gned size)
> > +{
> > +    AspeedLTPIState *s =3D opaque;
> > +    uint32_t idx =3D offset >> 2;
> > +
> > +    return s->phy_regs[idx];
> > +}
> > +
> > +static void aspeed_ltpi_phy_write(void *opaque, hwaddr offset,
> > +                              uint64_t val, unsigned size)
> > +{
> > +    AspeedLTPIState *s =3D opaque;
> > +    uint32_t idx =3D offset >> 2;
> > +
> > +    switch (offset) {
> > +    default:
> > +        s->phy_regs[idx] =3D (uint32_t)val;
> > +        break;
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps aspeed_ltpi_phy_ops =3D {
> > +    .read =3D aspeed_ltpi_phy_read,
> > +    .write =3D aspeed_ltpi_phy_write,
> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +    .valid =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 4,
> > +    },
> > +};
> > +
> > +static uint64_t aspeed_ltpi_ctrl_read(void *opaque,
> > +                                      hwaddr offset, unsigned size)
> > +{
> > +    AspeedLTPIState *s =3D opaque;
> > +    uint32_t idx =3D offset >> 2;
> > +
> > +    return s->ctrl_regs[idx];
> > +}
> > +
> > +static void aspeed_ltpi_ctrl_write(void *opaque, hwaddr offset,
> > +                              uint64_t val, unsigned size)
> > +{
> > +    AspeedLTPIState *s =3D opaque;
> > +    uint32_t idx =3D offset >> 2;
> > +
> > +    switch (offset) {
> > +    default:
> > +        s->ctrl_regs[idx] =3D (uint32_t)val;
> > +        break;
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps aspeed_ltpi_ctrl_ops =3D {
> > +    .read =3D aspeed_ltpi_ctrl_read,
> > +    .write =3D aspeed_ltpi_ctrl_write,
> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +    .valid =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 4,
> > +    },
> > +};
> > +
> > +static void aspeed_ltpi_reset(DeviceState *dev)
> > +{
> > +    AspeedLTPIState *s =3D ASPEED_LTPI(dev);
> > +
> > +    memset(s->ctrl_regs, 0, sizeof(s->ctrl_regs));
> > +    memset(s->phy_regs, 0, sizeof(s->phy_regs));
> > +    memset(s->top_regs, 0, sizeof(s->top_regs));
> > +    /* set default values */
> > +    s->ctrl_regs[LTPI_CTRL_LINK_MNG] =3D 0x11900007;
> > +    s->phy_regs[LTPI_PHY_MODE] =3D 0x2;
> > +}
> > +
> > +
> > +static const VMStateDescription vmstate_aspeed_ltpi =3D {
> > +    .name =3D TYPE_ASPEED_LTPI,
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINT32_ARRAY(ctrl_regs, AspeedLTPIState,
> > +                             ASPEED_LTPI_CTRL_SIZE >> 2),
> > +        VMSTATE_UINT32_ARRAY(phy_regs, AspeedLTPIState,
> > +                             ASPEED_LTPI_PHY_SIZE >> 2),
> > +        VMSTATE_UINT32_ARRAY(top_regs, AspeedLTPIState,
> > +                             ASPEED_LTPI_TOP_SIZE >> 2),
> > +
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static void aspeed_ltpi_realize(DeviceState *dev, Error **errp)
> > +{
> > +    AspeedLTPIState *s =3D ASPEED_LTPI(dev);
> > +
> > +    memory_region_init(&s->mmio, OBJECT(s), TYPE_ASPEED_LTPI,
> > +                       ASPEED_LTPI_TOTAL_SIZE);
> > +
> > +    memory_region_init_io(&s->mmio_ctrl, OBJECT(s),
> > +                          &aspeed_ltpi_ctrl_ops, s,
> > +                          "aspeed-ltpi-ctrl", ASPEED_LTPI_CTRL_SIZE);
> > +
> > +    memory_region_init_io(&s->mmio_phy, OBJECT(s),
> > +                          &aspeed_ltpi_phy_ops, s,
> > +                          "aspeed-ltpi-phy", ASPEED_LTPI_PHY_SIZE);
> > +
> > +    memory_region_init_io(&s->mmio_top, OBJECT(s),
> > +                          &aspeed_ltpi_top_ops, s,
> > +                          "aspeed-ltpi-top", ASPEED_LTPI_TOP_SIZE);
> > +
> > +    memory_region_add_subregion(&s->mmio,
> > +                                ASPEED_LTPI_CTRL_BASE, &s->mmio_ctrl);
> > +    memory_region_add_subregion(&s->mmio,
> > +                                ASPEED_LTPI_PHY_BASE, &s->mmio_phy);
> > +    memory_region_add_subregion(&s->mmio,
> > +                                ASPEED_LTPI_TOP_BASE, &s->mmio_top);
> > +
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mmio);
> > +}
> > +
> > +static void aspeed_ltpi_class_init(ObjectClass *klass, const void *dat=
a)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +    dc->realize =3D aspeed_ltpi_realize;
> > +    dc->vmsd =3D &vmstate_aspeed_ltpi;
> > +    device_class_set_legacy_reset(dc, aspeed_ltpi_reset);
> > +}
> > +
> > +static const TypeInfo aspeed_ltpi_info =3D {
> > +    .name          =3D TYPE_ASPEED_LTPI,
> > +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(AspeedLTPIState),
> > +    .class_init    =3D aspeed_ltpi_class_init,
> > +};
> > +
> > +static void aspeed_ltpi_register_types(void)
> > +{
> > +    type_register_static(&aspeed_ltpi_info);
> > +}
> > +
> > +type_init(aspeed_ltpi_register_types);
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index b1d8d8e5d2..45b16e7797 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -136,6 +136,7 @@ system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: f=
iles(
> >     'aspeed_hace.c',
> >     'aspeed_i3c.c',
> >     'aspeed_lpc.c',
> > +  'aspeed_ltpi.c',
> >     'aspeed_scu.c',
> >     'aspeed_sbc.c',
> >     'aspeed_sdmc.c',
>

