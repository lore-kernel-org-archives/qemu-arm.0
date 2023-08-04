Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1801547ejb;
        Fri, 4 Aug 2023 07:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY/iB2s8eXy45iRppL74nL73IWcmjHA9ru2Egm90LeZBYO6QTTipQfePlAdZTWvPfgwpj9
X-Received: by 2002:a05:620a:1453:b0:76c:ca4d:f826 with SMTP id i19-20020a05620a145300b0076cca4df826mr2201368qkl.77.1691160467159;
        Fri, 04 Aug 2023 07:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691160467; cv=none;
        d=google.com; s=arc-20160816;
        b=vOaocusKEaoaXgbqe+BSC9VPUpRLpvShML9+t8scyf1VfwVegP4o9866SSUIKkQ+1k
         c7VTfZvQiHBW5eVu0EY/98FFF4VPKe9WC6nVbsWNiDHSvPdKRGb0G3eXZ5nL5ZlEKE2V
         EoPbiUMBtkAePef2TNjL1M0fZEMznsnY0che53Jmql3JGzfzZXKDiAY4FQG205paOuCd
         0NKY6FxqJ2N2zppIUDSxqfloWf+wVeh8J2iwMJgaEFGxtNCT+wdcx2mc0UiUhxZk2VJ6
         6qE12JmzinA5WrJIcWh7jPtjktoxa00recK4hYk5mCF2jAsE2My+lR8doinQjOWl9zzT
         iRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hp0j1J0KgYLZVDvs8SxE/8PRG8R1EpAdHmzF6so8qAU=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=dhkXqCeDdNom5roU+l9eVoTloOGc4SZXDeEL71uyDu270szQpnAouAIbAmsVN5JOwp
         l+EPZVNa9PHhnc2bGmwKHOZOFnRbBv8QXntiGmZuj9Kg8uro3+SUVw5jOpnJ2koVzGXg
         hkbEn9n10jfV8/I2lVoKLxFtHJftKf1S4qdCpxucSG/vocjUfaJ04z7fUpvMxYpsZIzt
         JwqjL5SZ3Dv25/Q5+IEEEzN+kcmiVVD3OdBhUCGaKlcCAB1Ah1Heh1mGpozLQwXVnZDY
         7ujKO0tZYB2MKh8okN14BYhIXvfoJq0aol8AA0fjpWPAxKHJXm6ESINdKZDOrqAMT9VD
         5t2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d0tZxY4F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10-20020a05620a0b8a00b00767cf4c720asi1216773qkh.633.2023.08.04.07.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 07:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d0tZxY4F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRw5Q-0003dQ-L2; Fri, 04 Aug 2023 10:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRw5P-0003co-2f
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:47:27 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRw5M-0008L6-Vn
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:47:26 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so6984475a12.1
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691160442; x=1691765242;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hp0j1J0KgYLZVDvs8SxE/8PRG8R1EpAdHmzF6so8qAU=;
 b=d0tZxY4FEOIEN4i9jL7MxgxPbOhhZGLTy3Pm/PIR/XNY819pHAl7EWp/D7d683X+A8
 5jAEmCP3WKNafE7nEAGK7P6905d4MPd0Z5uueIXvrtodBOzC7/BVKFTMy6F8OH26F9+r
 7Ospm79Tec8NRuaWE6UMF9c5LhgKgSnIBEF4WYAVeYAmDdHo2AWM3GMh/JAOd+tuir8i
 mzthtY5wYZblf0iHISDe2VVSERusfIrsAK4DUNRY8ZFVscsvkeF51k+t0dBeB+fasa5O
 bUCda1z47b6Bi91pg/JBJktCk8Rge4A0PSxhXz0mZtRSA//XxEelE9uBN6vJiBknX2MT
 VBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691160442; x=1691765242;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hp0j1J0KgYLZVDvs8SxE/8PRG8R1EpAdHmzF6so8qAU=;
 b=TcfevSIFyhSf7/31m0OUPXRS8a78DRanVVBBQx9A92NIE2t9trJU6+mk18yBhf6/pk
 xZTuLuWQCdkNZLiHwJF44/akz/ZM7Nb7XfWmikAesqphKcNj1gSpiwg4PIy7+AgRacAC
 Vkum4MlWeKj9hZ5pAZ8Sgeq/0gEQeN30AqMMMIZ+U84PxEuewP5pW1E2V89IM601Ztg3
 AU3sma8vFnOh9use6idM5U5hwwN3+/EB5ApWE+yRvWIipIv8G9sbxDuecQ1OlCVice+q
 d3tD/+qLDiTS+9Zg7cpqwCaqNIm0WYU9eDeDW88mnmIv7swk7AqjIqf6ZTjTM7j1MsFx
 vtPw==
X-Gm-Message-State: AOJu0YwXke6GiKeBTAx2Ku2I/shv/3mk5Q42i0uIOq8XFtDpE+lonmR1
 3BRN8GUkSlFJnsx6S0MJCrcQJIK3G/nHxQaYpd0sYg6dW5BhTsNw
X-Received: by 2002:a05:6402:2038:b0:522:2add:5841 with SMTP id
 ay24-20020a056402203800b005222add5841mr2335371edb.7.1691160442284; Fri, 04
 Aug 2023 07:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-23-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-23-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 15:47:11 +0100
Message-ID: <CAFEAcA-CrK6+rxvK4rneE6nAo77ddbdBpZGQW+3cPP5b1dOw2Q@mail.gmail.com>
Subject: Re: [PATCH 22/44] Add GENET stub
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: D6XE8e373Jt8

On Wed, 26 Jul 2023 at 14:53, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/net/bcm2838_genet.c         | 100 +++++++++++++++++++++++++++++++++
>  hw/net/meson.build             |   2 +
>  hw/net/trace-events            |  17 ++++++
>  include/hw/net/bcm2838_genet.h |  40 +++++++++++++
>  4 files changed, 159 insertions(+)
>  create mode 100644 hw/net/bcm2838_genet.c
>  create mode 100644 include/hw/net/bcm2838_genet.h
>
> diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
> new file mode 100644
> index 0000000000..c3e7d90451
> --- /dev/null
> +++ b/hw/net/bcm2838_genet.c
> @@ -0,0 +1,100 @@
> +/*
> + * BCM2838 Gigabit Ethernet emulation
> + *
> + * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "net/eth.h"
> +#include "qapi/error.h"
> +#include "hw/irq.h"
> +#include "net/checksum.h"
> +#include "sysemu/dma.h"
> +#include "hw/net/bcm2838_genet.h"
> +#include "trace.h"
> +
> +
> +static uint64_t bcm2838_genet_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    uint64_t value = ~0;
> +
> +    qemu_log_mask(
> +        LOG_GUEST_ERROR,
> +        "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
> +        __func__, size, offset);
> +
> +    trace_bcm2838_genet_read(size, offset, value);
> +    return value;
> +}
> +
> +static void bcm2838_genet_write(void *opaque, hwaddr offset, uint64_t value,
> +                                unsigned size) {
> +    qemu_log_mask(
> +        LOG_GUEST_ERROR,
> +        "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
> +        __func__, size, offset);

tracepoint on the read but not on the write ?

> +}
> +
> +static const MemoryRegionOps bcm2838_genet_ops = {
> +    .read = bcm2838_genet_read,
> +    .write = bcm2838_genet_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {.max_access_size = sizeof(uint32_t)},
> +    .valid = {.min_access_size = sizeof(uint32_t)},

Just say 4, please. Do you definitely need to support
all of 1, 2 and 4 byte accesses? (The implementation gets
more painful then.)

> +};
> +
> +
> +static void bcm2838_genet_realize(DeviceState *dev, Error **errp)
> +{
> +    BCM2838GenetState *s = BCM2838_GENET(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    /* Controller registers */
> +    memory_region_init_io(&s->regs_mr, OBJECT(s), &bcm2838_genet_ops, s,
> +                          "bcm2838_genet_regs", sizeof(s->regs));
> +    sysbus_init_mmio(sbd, &s->regs_mr);
> +}
> +
> +static void bcm2838_genet_phy_reset(BCM2838GenetState *s)
> +{
> +    /* Temporary unimplemented */

"Temporarily" (though you don't really need to say that in
a stub-device commit).

> +    trace_bcm2838_genet_phy_reset("done");
> +}
> +
> +static void bcm2838_genet_reset(DeviceState *d)
> +{
> +    BCM2838GenetState *s = BCM2838_GENET(d);
> +
> +    memset(&s->regs, 0x00, sizeof(s->regs));
> +
> +    trace_bcm2838_genet_reset("done");
> +
> +    bcm2838_genet_phy_reset(s);
> +}
> +
> +static void bcm2838_genet_class_init(ObjectClass *class, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(class);
> +
> +    dc->realize = bcm2838_genet_realize;
> +    dc->reset = bcm2838_genet_reset;
> +}
> +
> +static const TypeInfo bcm2838_genet_info = {
> +    .name       = TYPE_BCM2838_GENET,
> +    .parent     = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BCM2838GenetState),
> +    .class_init = bcm2838_genet_class_init,
> +};
> +
> +static void bcm2838_genet_register(void)
> +{
> +    type_register_static(&bcm2838_genet_info);
> +}
> +
> +type_init(bcm2838_genet_register)
> diff --git a/hw/net/meson.build b/hw/net/meson.build
> index 2632634df3..9bb01f45e2 100644
> --- a/hw/net/meson.build
> +++ b/hw/net/meson.build
> @@ -72,4 +72,6 @@ system_ss.add(when: 'CONFIG_ROCKER', if_true: files(
>  system_ss.add(when: 'CONFIG_ALL', if_true: files('rocker/qmp-norocker.c'))
>  system_ss.add(files('rocker/rocker-hmp-cmds.c'))
>
> +system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2838_genet.c'))
> +
>  subdir('can')
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index 6b5ba669a2..f9e4f76776 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -480,3 +480,20 @@ dp8393x_receive_oversize(int size) "oversize packet, pkt_size is %d"
>  dp8393x_receive_not_netcard(void) "packet not for netcard"
>  dp8393x_receive_packet(int crba) "Receive packet at 0x%"PRIx32
>  dp8393x_receive_write_status(int crba) "Write status at 0x%"PRIx32
> +
> +# bcm2838_genet.c
> +bcm2838_genet_read(unsigned int size, uint64_t offset, uint64_t value) "%u bytes @ 0x%04" PRIx64 ": 0x%016" PRIx64
> +bcm2838_genet_write(unsigned int size, uint64_t offset, uint64_t value) "%u bytes @ 0x%04" PRIx64 ": 0x%016" PRIx64
> +bcm2838_genet_can_receive(const char *state) "receive is %s"
> +bcm2838_genet_receive(ssize_t bytes_received) "%ld bytes received"

%ld in a printf format string for some type other than "long" isn't
portable -- long is 4 bytes on 32-bit hosts and 8 bytes on 64-bit
hosts, so depending on what you passed it tends not to compile.
Always use the right format string for the type you're printing.
For a ssize_t type that is "%zd".

> +bcm2838_genet_phy_update_link(const char *link_state) "link is %s"
> +bcm2838_genet_phy_reset(const char *status) "PHY reset %s"
> +bcm2838_genet_reset(const char *status) "MAC reset %s"
> +bcm2838_genet_mac_address(const char *info) "%s"
> +bcm2838_genet_tx_dma(const char *dma_state) "TX DMA %s"
> +bcm2838_genet_tx_dma_ring(uint32_t ring_en) "TX DMA enabled rings: 0x%05x"
> +bcm2838_genet_tx_dma_ring_buf(uint32_t ring_buf_en) "TX DMA enabled ring buffers: 0x%05x"
> +bcm2838_genet_tx_dma_ring_active(unsigned int ring, const char *ring_state) "ring %u is %s"
> +bcm2838_genet_tx_request(unsigned int ring_idx, uint32_t prod_idx, uint32_t cons_idx) "ring %u, PROD_INDEX %u, CONS_INDEX %u"
> +bcm2838_genet_tx(unsigned int ring_idx, uint64_t desc_idx, uint32_t desc_status, uint64_t data_addr) "ring %u, descriptor %" PRIu64 ": 0x%08x, data @ 0x%08" PRIx64
> +bcm2838_genet_rx_dma_ring_active(unsigned int ring, const char *ring_state) "ring %u is %s"
> diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
> new file mode 100644
> index 0000000000..f62b24fa2f
> --- /dev/null
> +++ b/include/hw/net/bcm2838_genet.h
> @@ -0,0 +1,40 @@
> +/*
> + * BCM2838 Gigabit Ethernet emulation
> + *
> + * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef BCM2838_GENET_H
> +#define BCM2838_GENET_H
> +
> +#include "net/net.h"
> +#include "hw/sysbus.h"
> +
> +#define TYPE_BCM2838_GENET "bcm2838-genet"
> +OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
> +
> +#define BCM2838_GENET_REV_MAJOR         6
> +#define BCM2838_GENET_REV_MINOR         0
> +
> +typedef struct {
> +    uint8_t stub_area[0x10000]; /* temporary stub */
> +} __attribute__((__packed__)) BCM2838GenetRegs;

Why is this attribute(packed) ? You almost certainly do
not want this, especially given it's a byte buffer anyway.

> +
> +struct BCM2838GenetState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +
> +    MemoryRegion regs_mr;
> +    AddressSpace dma_as;
> +
> +    BCM2838GenetRegs regs;
> +
> +    qemu_irq irq_default;
> +    qemu_irq irq_prio;
> +};
> +
> +#endif /* BCM2838_GENET_H */

thanks
-- PMM
