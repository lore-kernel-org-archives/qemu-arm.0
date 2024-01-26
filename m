Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp746250ejc;
        Fri, 26 Jan 2024 00:51:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJI+EfcGpd8bMrdfyDAPQ4+lXmFI34BE/h9EdYs68oTNCxaIdQJrorO9U+lYX5e4NWCo+v
X-Received: by 2002:a05:6214:2483:b0:67f:c133:3922 with SMTP id gi3-20020a056214248300b0067fc1333922mr1352528qvb.129.1706259078400;
        Fri, 26 Jan 2024 00:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706259078; cv=none;
        d=google.com; s=arc-20160816;
        b=pNm1C8IDF/eT4dTPtj1JAvPRDrMW3DJASljDwwVrr4LOv6bLXNvaNwPcoLSUG0berQ
         0ShEUQfeR2zlehCEdlwdqm5RxChEgUy2VE8YkShaGL6m5dJL6WiK9Mhzx1l9k7C9ToF3
         +xbRMU0Hqjzxow4/M5Qz+S5T6G5re7Sx/rz1c4V/20RKezNoQsSDIRbNFf2pE+OSpLCD
         z+mTymaMieCz5byDwkFHa3RBTv6V+tTmrSbYP5QhfUdOSXtkmuROKwt3LGaWshLMWEb+
         fS8fXxGGuJgkfKt0Vc6bZzpI4ijaUpm7kyS7pBZ8OPkJUJNtcfdXDzvKbnDyvsPF5aOL
         Xuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=a6q8n+YU9KAXwmeP+tq1kkTNQRqQtvrcFHojQJqclFY=;
        fh=XjeWluILof3f/t2RMU9x5kUMQdajlxelk3b+5+95bRU=;
        b=IQOJyRPChcjOp957d/JUJC2X4/5gaJXafm/bTnL1p5D4t9iScXomXl+/9yYrQn6K5d
         XI98Cl5Q4G83beE/+TCRdurbnLEf3KQwuACF43bg1rjE9goDwleenLqtj5LOx0tjIOk2
         RgDlBEfvmME1w3F76zCpciEkNG1Gc8XPxIDN3jINZ4UKATMZgIywTggzsNKOLoFPN+k7
         5fBrtd8cnoiAdlj/wBhbdYjHWtpNWnpepF7pZLzgVE6abWVd6PHs0w42AVQCpU0jX/ih
         v0LXL/ugX4EhEQtxTTd5FcUT9K6MYtzzZlrqEjTsCMD4XnDSplVfd1FFiRqJishKlkin
         YhnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a0562140ccd00b00681876a023csi852810qvx.128.2024.01.26.00.51.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 00:51:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTHvW-0005rh-KP; Fri, 26 Jan 2024 03:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTHvU-0005r8-WB; Fri, 26 Jan 2024 03:51:05 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTHvS-00060X-4c; Fri, 26 Jan 2024 03:51:04 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLry91FRdz4x5l;
 Fri, 26 Jan 2024 19:50:57 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLry52MMTz4wd4;
 Fri, 26 Jan 2024 19:50:53 +1100 (AEDT)
Message-ID: <2e705ae9-150b-4a35-a7ae-660577aab263@kaod.org>
Date: Fri, 26 Jan 2024 09:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/11] hw/fsi: Aspeed APB2OPB & On-chip peripheral bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20240126034026.31068-1-ninad@linux.ibm.com>
 <20240126034026.31068-8-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240126034026.31068-8-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: jHGXmKfUjnuu

On 1/26/24 04:40, Ninad Palsule wrote:
> This is a part of patchset where IBM's Flexible Service Interface is
> introduced.
> 
> An APB-to-OPB bridge enabling access to the OPB from the ARM core in
> the AST2600. Hardware limitations prevent the OPB from being directly
> mapped into APB, so all accesses are indirect through the bridge.
> 
> The On-Chip Peripheral Bus (OPB): A low-speed bus typically found in
> POWER processors. This now makes an appearance in the ASPEED SoC due
> to tight integration of the FSI master IP with the OPB, mainly the
> existence of an MMIO-mapping of the CFAM address straight onto a
> sub-region of the OPB address space.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> [ clg: - moved FSIMasterState under AspeedAPB2OPBState
>         - modified fsi_opb_fsi_master_address() and
>           fsi_opb_opb2fsi_address()
>         - instroduced fsi_aspeed_apb2opb_init()
>         - reworked fsi_aspeed_apb2opb_realize()
>         - removed FSIMasterState object and fsi_opb_realize()
>         - simplified OPBus ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> v9:
>    - Removed unused parameters from function.
>    - Used qdev_realize() instead of qdev_realize_and_undef
>    - Given a name to the opb memory region.
> 
> v10:
>    - Combine Aspeed APB2OPB and on-chip pheripheral bus
> ---
>   include/hw/fsi/aspeed_apb2opb.h |  46 +++++
>   hw/fsi/aspeed_apb2opb.c         | 322 ++++++++++++++++++++++++++++++++
>   hw/arm/Kconfig                  |   1 +
>   hw/fsi/Kconfig                  |   5 +
>   hw/fsi/meson.build              |   1 +
>   hw/fsi/trace-events             |   2 +
>   6 files changed, 377 insertions(+)
>   create mode 100644 include/hw/fsi/aspeed_apb2opb.h
>   create mode 100644 hw/fsi/aspeed_apb2opb.c
> 
> diff --git a/include/hw/fsi/aspeed_apb2opb.h b/include/hw/fsi/aspeed_apb2opb.h
> new file mode 100644
> index 0000000000..f6a2387abf
> --- /dev/null
> +++ b/include/hw/fsi/aspeed_apb2opb.h
> @@ -0,0 +1,46 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2024 IBM Corp.
> + *
> + * ASPEED APB2OPB Bridge
> + * IBM On-Chip Peripheral Bus
> + */
> +#ifndef FSI_ASPEED_APB2OPB_H
> +#define FSI_ASPEED_APB2OPB_H
> +
> +#include "exec/memory.h"
> +#include "hw/fsi/fsi-master.h"
> +#include "hw/sysbus.h"
> +
> +#define TYPE_FSI_OPB "fsi.opb"
> +
> +#define TYPE_OP_BUS "opb"
> +OBJECT_DECLARE_SIMPLE_TYPE(OPBus, OP_BUS)
> +
> +typedef struct OPBus {
> +    BusState bus;
> +
> +    MemoryRegion mr;
> +    AddressSpace as;
> +} OPBus;
> +
> +#define TYPE_ASPEED_APB2OPB "aspeed.apb2opb"
> +OBJECT_DECLARE_SIMPLE_TYPE(AspeedAPB2OPBState, ASPEED_APB2OPB)
> +
> +#define ASPEED_APB2OPB_NR_REGS ((0xe8 >> 2) + 1)
> +
> +#define ASPEED_FSI_NUM 2
> +
> +typedef struct AspeedAPB2OPBState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +
> +    uint32_t regs[ASPEED_APB2OPB_NR_REGS];
> +    qemu_irq irq;
> +
> +    OPBus opb[ASPEED_FSI_NUM];
> +    FSIMasterState fsi[ASPEED_FSI_NUM];
> +} AspeedAPB2OPBState;
> +
> +#endif /* FSI_ASPEED_APB2OPB_H */
> diff --git a/hw/fsi/aspeed_apb2opb.c b/hw/fsi/aspeed_apb2opb.c
> new file mode 100644
> index 0000000000..997ae30060
> --- /dev/null
> +++ b/hw/fsi/aspeed_apb2opb.c
> @@ -0,0 +1,322 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2024 IBM Corp.
> + *
> + * ASPEED APB-OPB FSI interface
> + * IBM On-chip Peripheral Bus
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qom/object.h"
> +#include "qapi/error.h"
> +#include "trace.h"
> +
> +#include "hw/fsi/aspeed_apb2opb.h"
> +#include "hw/qdev-core.h"
> +
> +#define TO_REG(x) (x >> 2)
> +
> +#define APB2OPB_VERSION                    TO_REG(0x00)
> +#define APB2OPB_TRIGGER                    TO_REG(0x04)
> +
> +#define APB2OPB_CONTROL                    TO_REG(0x08)
> +#define   APB2OPB_CONTROL_OFF              BE_GENMASK(31, 13)
> +
> +#define APB2OPB_OPB2FSI                    TO_REG(0x0c)
> +#define   APB2OPB_OPB2FSI_OFF              BE_GENMASK(31, 22)
> +
> +#define APB2OPB_OPB0_SEL                   TO_REG(0x10)
> +#define APB2OPB_OPB1_SEL                   TO_REG(0x28)
> +#define   APB2OPB_OPB_SEL_EN               BIT(0)
> +
> +#define APB2OPB_OPB0_MODE                  TO_REG(0x14)
> +#define APB2OPB_OPB1_MODE                  TO_REG(0x2c)
> +#define   APB2OPB_OPB_MODE_RD              BIT(0)
> +
> +#define APB2OPB_OPB0_XFER                  TO_REG(0x18)
> +#define APB2OPB_OPB1_XFER                  TO_REG(0x30)
> +#define   APB2OPB_OPB_XFER_FULL            BIT(1)
> +#define   APB2OPB_OPB_XFER_HALF            BIT(0)
> +
> +#define APB2OPB_OPB0_ADDR                  TO_REG(0x1c)
> +#define APB2OPB_OPB0_WRITE_DATA            TO_REG(0x20)
> +
> +#define APB2OPB_OPB1_ADDR                  TO_REG(0x34)
> +#define APB2OPB_OPB1_WRITE_DATA                  TO_REG(0x38)
> +
> +#define APB2OPB_IRQ_STS                    TO_REG(0x48)
> +#define   APB2OPB_IRQ_STS_OPB1_TX_ACK      BIT(17)
> +#define   APB2OPB_IRQ_STS_OPB0_TX_ACK      BIT(16)
> +
> +#define APB2OPB_OPB0_WRITE_WORD_ENDIAN     TO_REG(0x4c)
> +#define   APB2OPB_OPB0_WRITE_WORD_ENDIAN_BE 0x0011101b
> +#define APB2OPB_OPB0_WRITE_BYTE_ENDIAN     TO_REG(0x50)
> +#define   APB2OPB_OPB0_WRITE_BYTE_ENDIAN_BE 0x0c330f3f
> +#define APB2OPB_OPB1_WRITE_WORD_ENDIAN     TO_REG(0x54)
> +#define APB2OPB_OPB1_WRITE_BYTE_ENDIAN     TO_REG(0x58)
> +#define APB2OPB_OPB0_READ_BYTE_ENDIAN      TO_REG(0x5c)
> +#define APB2OPB_OPB1_READ_BYTE_ENDIAN      TO_REG(0x60)
> +#define   APB2OPB_OPB0_READ_WORD_ENDIAN_BE  0x00030b1b
> +
> +#define APB2OPB_OPB0_READ_DATA         TO_REG(0x84)
> +#define APB2OPB_OPB1_READ_DATA         TO_REG(0x90)
> +
> +/*
> + * The following magic values came from AST2600 data sheet
> + * The register values are defined under section "FSI controller"
> + * as initial values.
> + */
> +static const uint32_t aspeed_apb2opb_reset[ASPEED_APB2OPB_NR_REGS] = {
> +     [APB2OPB_VERSION]                = 0x000000a1,
> +     [APB2OPB_OPB0_WRITE_WORD_ENDIAN] = 0x0044eee4,
> +     [APB2OPB_OPB0_WRITE_BYTE_ENDIAN] = 0x0055aaff,
> +     [APB2OPB_OPB1_WRITE_WORD_ENDIAN] = 0x00117717,
> +     [APB2OPB_OPB1_WRITE_BYTE_ENDIAN] = 0xffaa5500,
> +     [APB2OPB_OPB0_READ_BYTE_ENDIAN]  = 0x0044eee4,
> +     [APB2OPB_OPB1_READ_BYTE_ENDIAN]  = 0x00117717
> +};
> +
> +static void fsi_opb_fsi_master_address(FSIMasterState *fsi, hwaddr addr)
> +{
> +    memory_region_transaction_begin();
> +    memory_region_set_address(&fsi->iomem, addr);
> +    memory_region_transaction_commit();
> +}
> +
> +static void fsi_opb_opb2fsi_address(FSIMasterState *fsi, hwaddr addr)
> +{
> +    memory_region_transaction_begin();
> +    memory_region_set_address(&fsi->opb2fsi, addr);
> +    memory_region_transaction_commit();
> +}
> +
> +static uint64_t fsi_aspeed_apb2opb_read(void *opaque, hwaddr addr,
> +                                        unsigned size)
> +{
> +    AspeedAPB2OPBState *s = ASPEED_APB2OPB(opaque);
> +    unsigned int reg = TO_REG(addr);
> +
> +    trace_fsi_aspeed_apb2opb_read(addr, size);
> +
> +    if (reg >= ASPEED_APB2OPB_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out of bounds read: 0x%"HWADDR_PRIx" for %u\n",
> +                      __func__, addr, size);
> +        return 0;
> +    }
> +
> +    return s->regs[reg];
> +}
> +
> +static void fsi_aspeed_apb2opb_write(void *opaque, hwaddr addr, uint64_t data,
> +                                     unsigned size)
> +{
> +    AspeedAPB2OPBState *s = ASPEED_APB2OPB(opaque);
> +    unsigned int reg = TO_REG(addr);
> +
> +    trace_fsi_aspeed_apb2opb_write(addr, size, data);
> +
> +    if (reg >= ASPEED_APB2OPB_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out of bounds write: %"HWADDR_PRIx" for %u\n",
> +                      __func__, addr, size);
> +        return;
> +    }
> +
> +    switch (reg) {
> +    case APB2OPB_CONTROL:
> +        fsi_opb_fsi_master_address(&s->fsi[0],
> +                data & APB2OPB_CONTROL_OFF);
> +        break;
> +    case APB2OPB_OPB2FSI:
> +        fsi_opb_opb2fsi_address(&s->fsi[0],
> +                data & APB2OPB_OPB2FSI_OFF);
> +        break;
> +    case APB2OPB_OPB0_WRITE_WORD_ENDIAN:
> +        if (data != APB2OPB_OPB0_WRITE_WORD_ENDIAN_BE) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Bridge needs to be driven as BE (0x%x)\n",
> +                          __func__, APB2OPB_OPB0_WRITE_WORD_ENDIAN_BE);
> +        }
> +        break;
> +    case APB2OPB_OPB0_WRITE_BYTE_ENDIAN:
> +        if (data != APB2OPB_OPB0_WRITE_BYTE_ENDIAN_BE) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Bridge needs to be driven as BE (0x%x)\n",
> +                          __func__, APB2OPB_OPB0_WRITE_BYTE_ENDIAN_BE);
> +        }
> +        break;
> +    case APB2OPB_OPB0_READ_BYTE_ENDIAN:
> +        if (data != APB2OPB_OPB0_READ_WORD_ENDIAN_BE) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Bridge needs to be driven as BE (0x%x)\n",
> +                          __func__, APB2OPB_OPB0_READ_WORD_ENDIAN_BE);
> +        }
> +        break;
> +    case APB2OPB_TRIGGER:
> +    {
> +        uint32_t opb, op_mode, op_size, op_addr, op_data;
> +        MemTxResult result;
> +        bool is_write;
> +        int index;
> +        AddressSpace *as;
> +
> +        assert((s->regs[APB2OPB_OPB0_SEL] & APB2OPB_OPB_SEL_EN) ^
> +               (s->regs[APB2OPB_OPB1_SEL] & APB2OPB_OPB_SEL_EN));
> +
> +        if (s->regs[APB2OPB_OPB0_SEL] & APB2OPB_OPB_SEL_EN) {
> +            opb = 0;
> +            op_mode = s->regs[APB2OPB_OPB0_MODE];
> +            op_size = s->regs[APB2OPB_OPB0_XFER];
> +            op_addr = s->regs[APB2OPB_OPB0_ADDR];
> +            op_data = s->regs[APB2OPB_OPB0_WRITE_DATA];
> +        } else if (s->regs[APB2OPB_OPB1_SEL] & APB2OPB_OPB_SEL_EN) {
> +            opb = 1;
> +            op_mode = s->regs[APB2OPB_OPB1_MODE];
> +            op_size = s->regs[APB2OPB_OPB1_XFER];
> +            op_addr = s->regs[APB2OPB_OPB1_ADDR];
> +            op_data = s->regs[APB2OPB_OPB1_WRITE_DATA];
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Invalid operation: 0x%"HWADDR_PRIx" for %u\n",
> +                          __func__, addr, size);
> +            return;
> +        }
> +
> +        if (op_size & ~(APB2OPB_OPB_XFER_HALF | APB2OPB_OPB_XFER_FULL)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "OPB transaction failed: Unrecognized access width: %d\n",
> +                          op_size);
> +            return;
> +        }
> +
> +        op_size += 1;
> +        is_write = !(op_mode & APB2OPB_OPB_MODE_RD);
> +        index = opb ? APB2OPB_OPB1_READ_DATA : APB2OPB_OPB0_READ_DATA;
> +        as = &s->opb[opb].as;
> +
> +        result = address_space_rw(as, op_addr, MEMTXATTRS_UNSPECIFIED,
> +                                  &op_data, op_size, is_write);
> +        if (result != MEMTX_OK) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: OPB %s failed @%08x\n",
> +                          __func__, is_write ? "write" : "read", op_addr);
> +            return;
> +        }
> +
> +        if (!is_write) {
> +            s->regs[index] = op_data;
> +        }
> +
> +        s->regs[APB2OPB_IRQ_STS] |= opb ? APB2OPB_IRQ_STS_OPB1_TX_ACK
> +            : APB2OPB_IRQ_STS_OPB0_TX_ACK;
> +        break;
> +    }
> +    }
> +
> +    s->regs[reg] = data;
> +}
> +
> +static const struct MemoryRegionOps aspeed_apb2opb_ops = {
> +    .read = fsi_aspeed_apb2opb_read,
> +    .write = fsi_aspeed_apb2opb_write,
> +    .valid.max_access_size = 4,
> +    .valid.min_access_size = 4,
> +    .impl.max_access_size = 4,
> +    .impl.min_access_size = 4,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void fsi_aspeed_apb2opb_init(Object *o)
> +{
> +    AspeedAPB2OPBState *s = ASPEED_APB2OPB(o);
> +    int i;
> +
> +    for (i = 0; i < ASPEED_FSI_NUM; i++) {
> +        object_initialize_child(o, "fsi-master[*]", &s->fsi[i],
> +                                TYPE_FSI_MASTER);
> +    }
> +}
> +
> +static void fsi_aspeed_apb2opb_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    AspeedAPB2OPBState *s = ASPEED_APB2OPB(dev);
> +    int i;
> +

Please add a comment regarding the OPBus model here, something like :

/*
  * TODO: The OPBus model initializes the OPB address space in
  * the .instance_init handler and this is problematic for test
  * device-introspect-test. To avoid a memory corruption and a QEMU
  * crash, qbus_init() should be called from realize(). Something to
  * improve. Possibly, OPBus could also be removed.
  */

with that,


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> +    for (i = 0; i < ASPEED_FSI_NUM; i++) {
> +        qbus_init(&s->opb[i], sizeof(s->opb[i]), TYPE_OP_BUS, DEVICE(s),
> +                  NULL);
> +    }
> +
> +    sysbus_init_irq(sbd, &s->irq);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_apb2opb_ops, s,
> +                          TYPE_ASPEED_APB2OPB, 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +
> +    for (i = 0; i < ASPEED_FSI_NUM; i++) {
> +        if (!qdev_realize(DEVICE(&s->fsi[i]), BUS(&s->opb[i]), errp)) {
> +            return;
> +        }
> +
> +        memory_region_add_subregion(&s->opb[i].mr, 0x80000000,
> +                &s->fsi[i].iomem);
> +
> +        memory_region_add_subregion(&s->opb[i].mr, 0xa0000000,
> +                &s->fsi[i].opb2fsi);
> +    }
> +}
> +
> +static void fsi_aspeed_apb2opb_reset(DeviceState *dev)
> +{
> +    AspeedAPB2OPBState *s = ASPEED_APB2OPB(dev);
> +
> +    memcpy(s->regs, aspeed_apb2opb_reset, ASPEED_APB2OPB_NR_REGS);
> +}
> +
> +static void fsi_aspeed_apb2opb_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "ASPEED APB2OPB Bridge";
> +    dc->realize = fsi_aspeed_apb2opb_realize;
> +    dc->reset = fsi_aspeed_apb2opb_reset;
> +}
> +
> +static const TypeInfo aspeed_apb2opb_info = {
> +    .name = TYPE_ASPEED_APB2OPB,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_init = fsi_aspeed_apb2opb_init,
> +    .instance_size = sizeof(AspeedAPB2OPBState),
> +    .class_init = fsi_aspeed_apb2opb_class_init,
> +};
> +
> +static void aspeed_apb2opb_register_types(void)
> +{
> +    type_register_static(&aspeed_apb2opb_info);
> +}
> +
> +type_init(aspeed_apb2opb_register_types);
> +
> +static void fsi_opb_init(Object *o)
> +{
> +    OPBus *opb = OP_BUS(o);
> +
> +    memory_region_init(&opb->mr, 0, TYPE_FSI_OPB, UINT32_MAX);
> +    address_space_init(&opb->as, &opb->mr, TYPE_FSI_OPB);
> +}
> +
> +static const TypeInfo opb_info = {
> +    .name = TYPE_OP_BUS,
> +    .parent = TYPE_BUS,
> +    .instance_init = fsi_opb_init,
> +    .instance_size = sizeof(OPBus),
> +};
> +
> +static void fsi_opb_register_types(void)
> +{
> +    type_register_static(&opb_info);
> +}
> +
> +type_init(fsi_opb_register_types);
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 218b454e97..744f05087f 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -574,6 +574,7 @@ config ASPEED_SOC
>       select LED
>       select PMBUS
>       select MAX31785
> +    select FSI_APB2OPB_ASPEED
>   
>   config MPS2
>       bool
> diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
> index 9c34a418d7..9cee657a0f 100644
> --- a/hw/fsi/Kconfig
> +++ b/hw/fsi/Kconfig
> @@ -1,2 +1,7 @@
> +config FSI_APB2OPB_ASPEED
> +    bool
> +    depends on ASPEED_SOC
> +    select FSI
> +
>   config FSI
>       bool
> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
> index 7803b3afd1..a18a076552 100644
> --- a/hw/fsi/meson.build
> +++ b/hw/fsi/meson.build
> @@ -1 +1,2 @@
>   system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c','fsi.c','cfam.c','fsi-master.c'))
> +system_ss.add(when: 'CONFIG_FSI_APB2OPB_ASPEED', if_true: files('aspeed_apb2opb.c'))
> diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
> index bf417b6dc3..9e286d08d3 100644
> --- a/hw/fsi/trace-events
> +++ b/hw/fsi/trace-events
> @@ -9,3 +9,5 @@ fsi_cfam_unimplemented_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%"
>   fsi_cfam_config_write_noaddr(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
>   fsi_master_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
>   fsi_master_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
> +fsi_aspeed_apb2opb_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
> +fsi_aspeed_apb2opb_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64

