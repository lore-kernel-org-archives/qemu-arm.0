Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1421196ejb;
        Mon, 23 Oct 2023 07:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/JEAapH8NPWeLBBxH9ugyNrZjX1nWVXifIfN0BTw/UZS/5nrsAVq8S6JVXVLso2lMXfr0
X-Received: by 2002:a05:620a:2484:b0:76e:889d:855d with SMTP id i4-20020a05620a248400b0076e889d855dmr10423888qkn.67.1698073114481;
        Mon, 23 Oct 2023 07:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698073114; cv=none;
        d=google.com; s=arc-20160816;
        b=0R3fUnIETb5VeG1XLQt7F2Xsc0fMmmhb7tJVesieJhiPSqAlnYYbHTjLW0OIPQRLlu
         abYYUHumZZbveqUpiaZBWeqH9EHQul/JTc5wAnpcflAEzRhUWlwkRJ012SKNoILwP3pX
         T5meU8bBxyC/PpX3BuyZ0BRV2B4bLU+uXe9WiiQUmt4U0dLxoqT7x/otDgbsWu5EriTh
         kQ6WfNnxFCOUs+gxxSp9c1AMUbAvEyfWdwrybrlbiad3eGgGqWBgmLt6cy5PTRknnyt6
         IU61BDUksxhR/WeJyxMwN46oQ2mCZucR0kcclRMdzksUqnUGB13FYd0RAZZBVrjxbwSW
         BpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=e2EzXjNN5YGv8FxnzmQqH54j2ihbL0inGkzzYCdE2qs=;
        fh=9WmGAGvZHvN/ngkP6/TXeGu0FopLji5+/Z1hIZ3SICY=;
        b=kTzESyd+On550F8DngyrQuGU6ORRiAvQXeMMNjYKEDawNlWneX6w2b4oU6ILXSh5xW
         Ut4arDJD3wMSDeVwDyciRLVnnRkk6ZPtwtk11QJb7DSHag8kTFdc5PGpnnfa4axOAFN7
         Sdy1fSty0oiX+c9adC/XGGWBVvUbY/GRfNiTKF0AyVzWuTgU/+4Ckuiil4DTx/sjGNjC
         uypaf+yeASLy51NklKDW9sooj0Q4gLTYio5/wpx/NIh28wj3UFbMBkbXk6hQZLwBB5yw
         OWJc1Y/Pi5GwioQawIZ2BnDMbyaDPOCV2SG7xlGoKObnu/b5H9jAC1diz3kWQilH/ohE
         0iCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pZhy7/xm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020a05620a40cb00b00775a64a819bsi5959174qko.132.2023.10.23.07.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 07:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pZhy7/xm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quwNp-0007Rt-RW; Mon, 23 Oct 2023 10:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1quwNn-0007RA-Oe
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 10:58:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1quwNl-00041Z-TR
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 10:58:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4083ac51d8aso27305635e9.2
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698073096; x=1698677896; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e2EzXjNN5YGv8FxnzmQqH54j2ihbL0inGkzzYCdE2qs=;
 b=pZhy7/xmEq47jEG/xQh8C1tiEV0abuZPTmb2IWkticdzO4HHIpOg75jJBu65pN0upG
 uhSPMh3fai9MdgAE6EIfefUUBTDJGnEL+3GF+9PN1bkFkJmsNnOmeiPepc5P5a8KKbN/
 EIlajF7OCko4u/afIxx+Zf1bAIjKbRSUTbfRxpy+1xYm07F+p2FyorzIxOo38tN+9OPc
 SfCtk9xqj0HPUB69Ha4CRinKtghhkyDhWF3lQMOekewUdp21ja2OaMeXXKoT7LSqtzcS
 fNALDIn5y+bLZZuDb1GJ2MssyFRIXYJbdqmTkidJLuhUp8Phz1sI8IY/Lt7Nc3tdrE5/
 elWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698073096; x=1698677896;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e2EzXjNN5YGv8FxnzmQqH54j2ihbL0inGkzzYCdE2qs=;
 b=ECUtJo0btFtyxL4hfj2b2xS1Lh3fny/Gg5Hz4MXY5b3LePqQgP3+JPKCgnT1NLjtic
 2kTsCxTWK4hHIRkDfDnHolDSAK6KkS/PmQOMvIE3Nf230WFl9FjdNwbk/CRkU/M0WmUm
 iZ9XvlCPZeGKdPyuLdL/ZXXWbynY353SLt3xiWav/q1iDnht6qCL/ag4p1P/CyC14cgi
 t8e9wrz2PZi/wOx1lOV06OBJSBippW8mP+UvaknI7Qf3KUtJgJ+EoojFoqPDSpE+ZoUV
 7+8HmTz32+48Lh0WiaySy73gHVxHMj8EPFK8j5A8QkP22RRc+ncI9eODGus2bABDp2Dz
 QTbg==
X-Gm-Message-State: AOJu0Yx/y6ChLoT+mD/VexqzkIK1lMWCHG383Qzd/qG75ssPAyflB63d
 cihgzLfkeUpdeAvYtpcC4ua4uA==
X-Received: by 2002:a05:600c:15c1:b0:3fc:dd9:91fd with SMTP id
 v1-20020a05600c15c100b003fc0dd991fdmr6630589wmf.40.1698073096256; 
 Mon, 23 Oct 2023 07:58:16 -0700 (PDT)
Received: from [192.168.69.115]
 (thr44-h01-176-170-216-159.dsl.sta.abo.bbox.fr. [176.170.216.159])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7963883wrq.20.2023.10.23.07.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 07:58:15 -0700 (PDT)
Message-ID: <fee75322-5fc5-a1e8-e23c-b49c8177472d@linaro.org>
Date: Mon, 23 Oct 2023 16:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v6 01/10] hw/fsi: Introduce IBM's Local bus
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20231021211720.3571082-1-ninad@linux.ibm.com>
 <20231021211720.3571082-2-ninad@linux.ibm.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231021211720.3571082-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: oWlK8Y2KOhuI

Hi Ninad and Andrew,

On 21/10/23 23:17, Ninad Palsule wrote:
> This is a part of patchset where IBM's Flexible Service Interface is
> introduced.
> 
> The LBUS is modelled to maintain the qdev bus hierarchy and to take
> advantage of the object model to automatically generate the CFAM
> configuration block. The configuration block presents engines in the
> order they are attached to the CFAM's LBUS. Engine implementations
> should subclass the LBusDevice and set the 'config' member of
> LBusDeviceClass to match the engine's type.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> v2:
> - Incorporated Joel's review comments.
> v5:
> - Incorporated review comments by Cedric.
> v6:
> - Incorporated review comments by Cedric & Daniel.
> ---
>   include/hw/fsi/lbus.h | 43 ++++++++++++++++++++++++
>   hw/fsi/lbus.c         | 76 +++++++++++++++++++++++++++++++++++++++++++
>   hw/Kconfig            |  1 +
>   hw/fsi/Kconfig        |  2 ++
>   hw/fsi/meson.build    |  1 +
>   hw/meson.build        |  1 +
>   6 files changed, 124 insertions(+)
>   create mode 100644 include/hw/fsi/lbus.h
>   create mode 100644 hw/fsi/lbus.c
>   create mode 100644 hw/fsi/Kconfig
>   create mode 100644 hw/fsi/meson.build


> +#define TYPE_FSI_LBUS_DEVICE "fsi.lbus.device"
> +OBJECT_DECLARE_TYPE(FSILBusDevice, FSILBusDeviceClass, FSI_LBUS_DEVICE)
> +
> +#define FSI_LBUS_MEM_REGION_SIZE  (2 * 1024 * 1024)
> +#define FSI_LBUSDEV_IOMEM_SIZE    0x400
> +
> +typedef struct FSILBusDevice {
> +    DeviceState parent;
> +
> +    MemoryRegion iomem;
> +    uint32_t address;

[1] 32-bit address,

> +} FSILBusDevice;
> +


> diff --git a/hw/fsi/lbus.c b/hw/fsi/lbus.c
> new file mode 100644
> index 0000000000..50d926dbe2
> --- /dev/null
> +++ b/hw/fsi/lbus.c
> @@ -0,0 +1,76 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2023 IBM Corp.
> + *
> + * IBM Local bus where FSI slaves are connected
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/fsi/lbus.h"
> +
> +#include "hw/qdev-properties.h"
> +
> +static void lbus_init(Object *o)
> +{
> +    FSILBus *lbus = FSI_LBUS(o);
> +
> +    memory_region_init(&lbus->mr, OBJECT(lbus), TYPE_FSI_LBUS,
> +                       FSI_LBUS_MEM_REGION_SIZE - FSI_LBUSDEV_IOMEM_SIZE);
> +}
> +
> +static const TypeInfo lbus_info = {
> +    .name = TYPE_FSI_LBUS,
> +    .parent = TYPE_BUS,
> +    .instance_init = lbus_init,
> +    .instance_size = sizeof(FSILBus),
> +};
> +
> +static Property lbus_device_props[] = {
> +    DEFINE_PROP_UINT32("address", FSILBusDevice, address, 0),

[2] 32-bit address,

> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +DeviceState *lbus_create_device(FSILBus *bus, const char *type, uint32_t addr)
> +{
> +    DeviceState *ds;
> +    BusState *state = BUS(bus);
> +    FSILBusDevice *dev;
> +
> +    ds = qdev_new(type);
> +    qdev_prop_set_uint8(ds, "address", addr);

[3] set 8-bit address but [1] and [2] declare as 32-bit.

> +    qdev_realize_and_unref(ds, state, &error_fatal);

If you pass the bus as argument here, ...

> +
> +    dev = FSI_LBUS_DEVICE(ds);
> +    memory_region_add_subregion(&bus->mr, dev->address,
> +                                &dev->iomem);
> +
> +    qdev_set_parent_bus(ds, state, &error_abort);

... why do you need that call here?

> +
> +    return ds;
> +}

Thanks,

Phil.
