Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp242954lft;
        Thu, 30 Jun 2022 04:09:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ssqTM0oGTPXUzygoYEowjjxc7fWn2TfPeWjccZO1tc5om3oThjjN9lXoIuVgYfw9joYMgq
X-Received: by 2002:a37:a54f:0:b0:6ae:e60e:141b with SMTP id o76-20020a37a54f000000b006aee60e141bmr5790848qke.623.1656587394149;
        Thu, 30 Jun 2022 04:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656587394; cv=none;
        d=google.com; s=arc-20160816;
        b=SurAm1k8T5Pz5taSXybM+zWwcnAMKUF6iE2fCdZ3t2KIYMBtsE5T+lXz7igMhEbEKQ
         CbbGOp17mLKq6E96o72kU6X0lt/m3HlDtMkj1+TbJxdbjwq7wskQlySu9KJzGdkdhw+o
         juz0CEUNj0/gseeuq14R7ziF6RlPsITKi6rxcJano1MmJiZsy8MkAdP9CQ3TMizG7Gcd
         1Ezs4C80vxnOn7lmEXPd1+ZTjNmCKdifL6/V3OdOR1vuYIIy4EB9bTH6PFS3M2EOLlLx
         Xz6oyPPA6u2i2BdYmBD3ewQp0Zz97Ra4FzZ0b/62SnOqV8KrIY2xkVV226uoDyzNBrIb
         1rrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=4uYpaa5WNqIgKAwQkt9D8+LSPji+prHpqxBH0AgSdWQ=;
        b=eN72Mqf5cG2QJI8vygp4ZXQIa8rEDictN8A935NNLy4vRsH8JML0a7Zw5ZNcs/ndU1
         k6batS8zJbyWsabvNF3K9GzN7MECps8DmZjRb/9wYIW+G3xZlLRi6Y5Kv3/N62DgnrNz
         WRLDY//8fwSE4hPNb6DtEtk6cN2ESDC+p3Yj27z6djvDwMo+iBHJrc7ybekSBxJrkN0S
         0xjZURM9XzJAo7ZAI+m/4B9PaC6Y2UrzYLHNFz9cMj87XsL1DrQqQTJLXedqhxrIJ6ve
         iCVfIAbxokWYpmsU0Jj+OZS4usyvxOx4CMmcy2ovDlb6V2ETVFHQomKnrC3z/K2Fkz45
         ljwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey7-20020a0562140b6700b00472a893002csi3078104qvb.411.2022.06.30.04.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:09:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6s3V-00089T-8B
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6s2x-0007qh-K1
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 07:09:19 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:43217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6s2t-0005br-6l
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 07:09:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DC565263BE;
 Thu, 30 Jun 2022 11:09:10 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 30 Jun
 2022 13:09:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006d8a99a13-7c59-44c8-b05f-b1c53ece09b9,
 40551C6C823FDDA91B74F5D58A080B55BE22893A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b748ce35-d8bf-1804-bcf0-1024c527380c@kaod.org>
Date: Thu, 30 Jun 2022 13:09:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 13/14] hw/misc/aspeed: Add intel-me
Content-Language: en-US
To: Peter Delevoryas <me@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>, <pdel@fb.com>
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-14-me@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220630045133.32251-14-me@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 223fb1cb-02d0-49b4-be90-5b5cb6fc9ac8
X-Ovh-Tracer-Id: 9535809263894694834
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdegleehgfeffefhudeutdfgfeekteekjeefveehfeektdeiueevvdfhueekjeeknecuffhomhgrihhnpehmvghtrgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpuggvlhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hbVCgVgVZRZa

On 6/30/22 06:51, Peter Delevoryas wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> The Intel Management Engine is an IPMI endpoint that responds to various
> IPMI commands. 

Have you looked at the ipmi-bmc-sim device ? It is relatively easy
to attach to a bus.

> In this commit, I've added some very basic functionality that
> will respond back with a respond code of zero (success), while also setting
> an appropriate response NetFN (request NetFN + 1), a matching command ID and
> sequence number, and the 2 standard checksums. Other data is not provided,
> but the model here could be extended to respond to more kinds of requests.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>   MAINTAINERS          |   1 +
>   hw/misc/intel_me.c   | 162 +++++++++++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build  |   3 +-
>   hw/misc/trace-events |   8 +++
>   4 files changed, 173 insertions(+), 1 deletion(-)
>   create mode 100644 hw/misc/intel_me.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3ffd473db1..3220644bb5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1068,6 +1068,7 @@ F: include/hw/net/ftgmac100.h
>   F: docs/system/arm/aspeed.rst
>   F: tests/qtest/*aspeed*
>   F: hw/misc/fby35_sb_cpld.c
> +F: hw/misc/intel_me.c
>   
>   NRF51
>   M: Joel Stanley <joel@jms.id.au>
> diff --git a/hw/misc/intel_me.c b/hw/misc/intel_me.c
> new file mode 100644
> index 0000000000..933ae45101
> --- /dev/null
> +++ b/hw/misc/intel_me.c
> @@ -0,0 +1,162 @@
> +/*
> + * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
> + *
> + * This code is licensed under the GPL version 2 or later. See the COPYING
> + * file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "hw/i2c/i2c.h"
> +#include "trace.h"
> +
> +#define TYPE_INTEL_ME "intel-me"
> +OBJECT_DECLARE_SIMPLE_TYPE(IntelMEState, INTEL_ME);
> +
> +struct IntelMEState {
> +    I2CSlave parent_obj;
> +
> +    I2CBus *bus;
> +    QEMUBH *bh;
> +    int rx_len;
> +    int tx_len;
> +    int tx_pos;
> +    uint8_t rx_buf[512];
> +    uint8_t tx_buf[512];
> +};
> +
> +static void intel_me_bh(void *opaque)
> +{
> +    IntelMEState *s = opaque;
> +    I2CSlave *i2c = I2C_SLAVE(s);
> +    uint8_t target_addr;
> +
> +    assert(s->bus->bh == s->bh);
> +
> +    switch (s->tx_pos) {
> +    case 0:
> +        target_addr = s->tx_buf[s->tx_pos++];
> +        trace_intel_me_tx_start(i2c->address, target_addr);
> +        if (i2c_start_send_async(s->bus, target_addr) != 0) {
> +            break;
> +        }
> +        return;
> +    default:
> +        if (s->tx_pos >= s->tx_len) {
> +            break;
> +        }
> +        trace_intel_me_tx_data(i2c->address, s->tx_buf[s->tx_pos]);
> +        if (i2c_send_async(s->bus, s->tx_buf[s->tx_pos++]) != 0) {
> +            break;
> +        }
> +        return;
> +    }
> +
> +    trace_intel_me_tx_end(i2c->address);
> +    i2c_end_transfer(s->bus);
> +    i2c_bus_release(s->bus);
> +    s->tx_len = 0;
> +    s->tx_pos = 0;
> +    memset(s->tx_buf, 0, sizeof(s->tx_buf));
> +}
> +
> +static void intel_me_realize(DeviceState *dev, Error **errp)
> +{
> +    IntelMEState *s = INTEL_ME(dev);
> +
> +    s->bus = I2C_BUS(qdev_get_parent_bus(dev));
> +    s->bh = qemu_bh_new(intel_me_bh, s);
> +    s->rx_len = 0;
> +    s->tx_len = 0;
> +    s->tx_pos = 0;
> +    memset(s->rx_buf, 0, sizeof(s->rx_buf));
> +    memset(s->tx_buf, 0, sizeof(s->tx_buf));
> +}
> +
> +static uint8_t checksum(const uint8_t *ptr, int len)
> +{
> +    int sum = 0;
> +
> +    for (int i = 0; i < len; i++) {
> +        sum += ptr[i];
> +    }
> +
> +    return 256 - sum;
> +}
> +
> +static int intel_me_i2c_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    IntelMEState *s = INTEL_ME(i2c);
> +
> +    switch (event) {
> +    case I2C_START_RECV:
> +        break;
> +    case I2C_START_SEND:
> +        trace_intel_me_rx_start(i2c->address);
> +        s->rx_len = 0;
> +        memset(s->rx_buf, 0, sizeof(s->rx_buf));
> +        break;
> +    case I2C_START_SEND_ASYNC:
> +        break;
> +    case I2C_FINISH:
> +        trace_intel_me_rx_end(i2c->address);
> +        s->tx_len = 10;
> +        s->tx_pos = 0;
> +        s->tx_buf[0] = s->rx_buf[2];
> +        s->tx_buf[1] = ((s->rx_buf[0] >> 2) + 1) << 2;
> +        s->tx_buf[2] = checksum(s->tx_buf, 2);
> +        s->tx_buf[3] = i2c->address;
> +        s->tx_buf[4] = (s->rx_buf[3] >> 2) << 2;
> +        s->tx_buf[5] = s->rx_buf[4];
> +        s->tx_buf[6] = 0x00;
> +        s->tx_buf[7] = 0x55;
> +        s->tx_buf[8] = 0x00;
> +        s->tx_buf[9] = checksum(s->tx_buf, s->tx_len - 1);
> +        s->tx_buf[0] >>= 1;
> +        i2c_bus_master(s->bus, s->bh);
> +        break;
> +    case I2C_NACK:
> +        break;
> +    }
> +
> +    return 0;
> +}
> +
> +static uint8_t intel_me_i2c_recv(I2CSlave *i2c)
> +{
> +    return 0xff;
> +}
> +
> +static int intel_me_i2c_send(I2CSlave *i2c, uint8_t data)
> +{
> +    IntelMEState *s = INTEL_ME(i2c);
> +
> +    trace_intel_me_rx_data(i2c->address, data);
> +
> +    assert(s->rx_len < sizeof(s->rx_buf));
> +    s->rx_buf[s->rx_len++] = data;
> +
> +    return 0;
> +}
> +
> +static void intel_me_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    I2CSlaveClass *i2c = I2C_SLAVE_CLASS(oc);
> +
> +    dc->realize = intel_me_realize;
> +    i2c->event = intel_me_i2c_event;
> +    i2c->recv = intel_me_i2c_recv;
> +    i2c->send = intel_me_i2c_send;
> +}
> +
> +static const TypeInfo types[] = {
> +    {
> +        .name = TYPE_INTEL_ME,
> +        .parent = TYPE_I2C_SLAVE,
> +        .instance_size = sizeof(IntelMEState),
> +        .class_init = intel_me_class_init,
> +    },
> +};
> +
> +DEFINE_TYPES(types);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 948e25c440..165b9dce6d 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -118,7 +118,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>     'aspeed_sdmc.c',
>     'aspeed_xdma.c',
>     'aspeed_peci.c',
> -  'fby35_sb_cpld.c'))
> +  'fby35_sb_cpld.c',
> +  'intel_me.c'))
>   
>   softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
>   softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 90a0473b06..7ca23bcf27 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -273,3 +273,11 @@ virt_ctrl_instance_init(void *dev) "ctrl: %p"
>   lasi_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
>   lasi_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
>   lasi_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
> +
> +# intel_me.c
> +intel_me_rx_start(uint8_t addr) "addr 0x%02x"
> +intel_me_rx_data(uint8_t addr, uint8_t data) "addr 0x%02x data 0x%02x"
> +intel_me_rx_end(uint8_t addr) "addr 0x%02x"
> +intel_me_tx_start(uint8_t addr, uint8_t target_addr) "addr 0x%02x target_addr 0x%02x"
> +intel_me_tx_data(uint8_t addr, uint8_t data) "addr 0x%02x data 0x%02x"
> +intel_me_tx_end(uint8_t addr) "addr 0x%02x"

