Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp740991ejc;
        Fri, 26 Jan 2024 00:35:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSZfc9jgB7EQ54pIRF/OPhwvu9MsT1pegZIPSceJwxEaIlvRbOmeinAjPm6GfggEhlMSPZ
X-Received: by 2002:a05:622a:347:b0:42a:3275:a42b with SMTP id r7-20020a05622a034700b0042a3275a42bmr1329545qtw.44.1706258146415;
        Fri, 26 Jan 2024 00:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706258146; cv=none;
        d=google.com; s=arc-20160816;
        b=y0ympOmblqBQ8YuSa8B9nslHw0cgcx8Fc1mIbNxY/7T9RYkMb4KBlHM3/4ESHJgxNw
         5ero+S+FMlNmyDR78t1v7GLcl8mRH543U2lrHctX8atwMCTdNkhFA4tTRIVvDXzlrd4w
         DmMX+0irZg873wvYZHxz/cHkgJRTTImMaB9kjaiwsiSUf7FLs4tR3DdoRKoRyasMVgg2
         4jLQMckx80tcb5EDY6AxxzC4Svcew8ny4TL4Ql0maY5c4d0/84Rk2N1KKMQTupDrLJ9f
         OC5ZHi+H+8ZDhEBvptRl27iG5+YBgZq7/2gQLa/W9Lib6Xi+qr78Gvxfb5jQI5entJ3l
         6CpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=xRABllMHSzl/LwWQs9UhxQCcbBVaAHjJLw5X3QHVUOo=;
        fh=XjeWluILof3f/t2RMU9x5kUMQdajlxelk3b+5+95bRU=;
        b=ewfnBffsRtFgasNvUcEhu98gmXlSpf7su75C3SXYVgxoII3F6/OPMl48iznp3ymGti
         d7geoEkSCJWVnGpPOrpjleYvuM3I2rHi9WefzuS8EeBm/d7jEaRcvWXI7uKdB8AJwD6l
         SGAPLp0byLZwWzLK1WGKwy5+kpGXoKzxYbswuzUYpd/Nf2txUhe3I+AHT9zU0upy+g87
         4PVFA3RQfBmckhPqGcPJYt7lwZsfS+syAWLXHzN/7Ul6dD9hVgaAqdGSNW2R1iezShzo
         WjNBP3exrwPCwEA+VPxXEL1jynI2LOxJPLpF9rYmtewmd9akGYs0Kom0Lus5eA5tKalf
         5Oig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21-20020ac87e95000000b0042a741864d9si744199qtj.110.2024.01.26.00.35.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 00:35:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTHgR-0006Ja-Cc; Fri, 26 Jan 2024 03:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTHgP-0006JD-EP; Fri, 26 Jan 2024 03:35:29 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTHgN-0001Ln-AG; Fri, 26 Jan 2024 03:35:29 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLrcD70k4z4x2T;
 Fri, 26 Jan 2024 19:35:24 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLrc91nXKz4wxv;
 Fri, 26 Jan 2024 19:35:21 +1100 (AEDT)
Message-ID: <8b961658-d468-4f71-b2e4-4f1d148bdf55@kaod.org>
Date: Fri, 26 Jan 2024 09:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/11] hw/fsi: Introduce IBM's fsi-slave model
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20240126034026.31068-1-ninad@linux.ibm.com>
 <20240126034026.31068-5-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240126034026.31068-5-ninad@linux.ibm.com>
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
X-TUID: wq91VfWqiDXL

On 1/26/24 04:40, Ninad Palsule wrote:
> This is a part of patchset where IBM's Flexible Service Interface is
> introduced.
> 
> The FSI slave: The slave is the terminal point of the FSI bus for
> FSI symbols addressed to it. Slaves can be cascaded off of one
> another. The slave's configuration registers appear in address space
> of the CFAM to which it is attached.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   include/hw/fsi/fsi.h | 19 ++++++++++
>   hw/fsi/fsi.c         | 87 +++++++++++++++++++++++++++++++++++++++++++-
>   hw/fsi/trace-events  |  2 +
>   3 files changed, 106 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/fsi/fsi.h b/include/hw/fsi/fsi.h
> index 50e8f5c888..6e11747dd5 100644
> --- a/include/hw/fsi/fsi.h
> +++ b/include/hw/fsi/fsi.h
> @@ -7,7 +7,14 @@
>   #ifndef FSI_FSI_H
>   #define FSI_FSI_H
>   
> +#include "exec/memory.h"
>   #include "hw/qdev-core.h"
> +#include "hw/fsi/lbus.h"
> +#include "qemu/bitops.h"
> +
> +/* Bitwise operations at the word level. */
> +#define BE_BIT(x)           BIT(31 - (x))
> +#define BE_GENMASK(hb, lb)  MAKE_64BIT_MASK((lb), ((hb) - (lb) + 1))
>   
>   #define TYPE_FSI_BUS "fsi.bus"
>   OBJECT_DECLARE_SIMPLE_TYPE(FSIBus, FSI_BUS)
> @@ -16,4 +23,16 @@ typedef struct FSIBus {
>       BusState bus;
>   } FSIBus;
>   
> +#define TYPE_FSI_SLAVE "fsi.slave"
> +OBJECT_DECLARE_SIMPLE_TYPE(FSISlaveState, FSI_SLAVE)
> +
> +#define FSI_SLAVE_CONTROL_NR_REGS ((0x40 >> 2) + 1)
> +
> +typedef struct FSISlaveState {
> +    DeviceState parent;
> +
> +    MemoryRegion iomem;
> +    uint32_t regs[FSI_SLAVE_CONTROL_NR_REGS];
> +} FSISlaveState;
> +
>   #endif /* FSI_FSI_H */
> diff --git a/hw/fsi/fsi.c b/hw/fsi/fsi.c
> index 60cb03f7a2..528323d9cf 100644
> --- a/hw/fsi/fsi.c
> +++ b/hw/fsi/fsi.c
> @@ -5,18 +5,101 @@
>    * IBM Flexible Service Interface
>    */
>   #include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "trace.h"
>   
>   #include "hw/fsi/fsi.h"
>   
> +#define TO_REG(x)                               ((x) >> 2)
> +
>   static const TypeInfo fsi_bus_info = {
>       .name = TYPE_FSI_BUS,
>       .parent = TYPE_BUS,
>       .instance_size = sizeof(FSIBus),
>   };
>   
> -static void fsi_bus_register_types(void)
> +static uint64_t fsi_slave_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    FSISlaveState *s = FSI_SLAVE(opaque);
> +    int reg = TO_REG(addr);
> +
> +    trace_fsi_slave_read(addr, size);
> +
> +    if (reg >= FSI_SLAVE_CONTROL_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out of bounds read: 0x%"HWADDR_PRIx" for %u\n",
> +                      __func__, addr, size);
> +        return 0;
> +    }
> +
> +    return s->regs[reg];
> +}
> +
> +static void fsi_slave_write(void *opaque, hwaddr addr, uint64_t data,
> +                                 unsigned size)
> +{
> +    FSISlaveState *s = FSI_SLAVE(opaque);
> +    int reg = TO_REG(addr);
> +
> +    trace_fsi_slave_write(addr, size, data);
> +
> +    if (reg >= FSI_SLAVE_CONTROL_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out of bounds write: 0x%"HWADDR_PRIx" for %u\n",
> +                      __func__, addr, size);
> +        return;
> +    }
> +
> +    s->regs[reg] = data;
> +}
> +
> +static const struct MemoryRegionOps fsi_slave_ops = {
> +    .read = fsi_slave_read,
> +    .write = fsi_slave_write,
> +    .endianness = DEVICE_BIG_ENDIAN,
> +};
> +
> +static void fsi_slave_reset(DeviceState *dev)
> +{
> +    FSISlaveState *s = FSI_SLAVE(dev);
> +    int i;
> +
> +    /* Initialize registers */
> +    for (i = 0; i < FSI_SLAVE_CONTROL_NR_REGS; i++) {
> +        s->regs[i] = 0;
> +    }

memset would be better.

with that fixed,


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> +}
> +
> +static void fsi_slave_init(Object *o)
> +{
> +    FSISlaveState *s = FSI_SLAVE(o);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &fsi_slave_ops,
> +                          s, TYPE_FSI_SLAVE, 0x400);
> +}
> +
> +static void fsi_slave_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->bus_type = TYPE_FSI_BUS;
> +    dc->desc = "FSI Slave";
> +    dc->reset = fsi_slave_reset;
> +}
> +
> +static const TypeInfo fsi_slave_info = {
> +    .name = TYPE_FSI_SLAVE,
> +    .parent = TYPE_DEVICE,
> +    .instance_init = fsi_slave_init,
> +    .instance_size = sizeof(FSISlaveState),
> +    .class_init = fsi_slave_class_init,
> +};
> +
> +static void fsi_register_types(void)
>   {
>       type_register_static(&fsi_bus_info);
> +    type_register_static(&fsi_slave_info);
>   }
>   
> -type_init(fsi_bus_register_types);
> +type_init(fsi_register_types);
> diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
> index c5753e2791..8f29adb7df 100644
> --- a/hw/fsi/trace-events
> +++ b/hw/fsi/trace-events
> @@ -1,2 +1,4 @@
>   fsi_scratchpad_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
>   fsi_scratchpad_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
> +fsi_slave_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
> +fsi_slave_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64

