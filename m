Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2982486lft;
        Tue, 28 Jun 2022 00:39:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sSJTD/Eq9VLucAx2fcprJ1uGlkpAxE9u7FqGgZALwP0L40mUr0oHt7GbIOAUuW0x68O+gt
X-Received: by 2002:a05:620a:135b:b0:6af:7c1:98c9 with SMTP id c27-20020a05620a135b00b006af07c198c9mr10367916qkl.40.1656401971621;
        Tue, 28 Jun 2022 00:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656401971; cv=none;
        d=google.com; s=arc-20160816;
        b=Qas7gT5WF6wnmhdmBCFQOHVQ/I7FpBt0CJWOjVJ4hsX+rv8b/7CSUbgLk0aYr1cRtb
         fciHu26+fouPj47BYKJWDasQ0Mldw0lyQRk56W0/gyJ6RcCpuLGs8Iir+ywiJjRQeIeR
         d88rcuUK/ix01imR9lz3FLs/QzZQEHP0W0X1qFuXym2PcupTiTNgeCaPn2x5fnDSU9aT
         Jx7r1c0i8us1Ozxz7AdI0ku1WgzZ9o0Gst5ucWpy1yr+jXakhjQLIxxwcsQRvpl01iAA
         28zxnYmEKXdr7HEskCmBHHOmGwxBq+lcqZNhNLC0rwbateUC/ksz9AyTDe3ffhhrlX7b
         Io1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=RB1Mi2zhE3qnVg6VpKSJR+hmv12eRNHOtgwKMgDektk=;
        b=IYkMWaHFf1z3cwlJM7+GVSERKTj57Aqubxl/bMMJS/NZ/2fhDiu8PZGkdomGYgdk9p
         pQrgKvDGD0B7Q1YotmS7SvPRXO5J3uKWoF+G5hPIM1rxHDSOhQ1fV8az1VRdwi7cFJJ3
         oGMRGnsvAWkiwCYHabop0LP2VKBPTMXGLjqADKFhKt7USz1N0zSQ82duz0F5uvuV9Thh
         MyWR8bTQKIk4LP3Y/8qOwow60U7Gl0WaPNCSdSXMcZwxg8p4OnbFcmEAMKA3zFzSqyBF
         dlAnGvqSmKFdyWV4YSysB0CXegAbMilluQqOQIFbwtAx7PM9nepKE19gXPdT88c+/Mix
         2WqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020a05622a101300b003066cea1912si7371886qte.354.2022.06.28.00.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 00:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o65op-0004q3-3j
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 03:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o653o-0000lb-PD; Tue, 28 Jun 2022 02:51:04 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:39749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o653l-0006uF-Fa; Tue, 28 Jun 2022 02:50:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.235])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7EF7D224B8;
 Tue, 28 Jun 2022 06:50:48 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 08:50:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004e17b3629-ddd6-45c1-9a12-cc1eea6e7881,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <88ee447f-8e9d-82ad-5be9-555d0dbd9931@kaod.org>
Date: Tue, 28 Jun 2022 08:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 08/14] hw/misc: Add fby35-cpld
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <zhdaniel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <komlodi@google.com>, <titusr@google.com>, <andrew@aj.id.au>,
 <joel@jms.id.au>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627195506.403715-9-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627195506.403715-9-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 00ea59bd-0769-48ae-b3d0-493a08679a52
X-Ovh-Tracer-Id: 11873740418119797612
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdegleehgfeffefhudeutdfgfeekteekjeefveehfeektdeiueevvdfhueekjeeknecuffhomhgrihhnpehmvghtrgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k/kXgQU1cCJQ

On 6/27/22 21:55, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>


some intro ?

> ---
>   hw/misc/fby35_cpld.c | 137 +++++++++++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build  |   3 +-
>   2 files changed, 139 insertions(+), 1 deletion(-)
>   create mode 100644 hw/misc/fby35_cpld.c
> 
> diff --git a/hw/misc/fby35_cpld.c b/hw/misc/fby35_cpld.c
> new file mode 100644
> index 0000000000..a783a0a2c8
> --- /dev/null
> +++ b/hw/misc/fby35_cpld.c
> @@ -0,0 +1,137 @@
> +/*
> + * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */

I prefer the short version of the license.

> +#include "qemu/osdep.h"
> +#include "hw/i2c/i2c.h"
> +#include "hw/registerfields.h"
> +
> +#define BOARD_ID_CLASS1 0b0000
> +#define BOARD_ID_CLASS2 0b0001
> +
> +#define TYPE_FBY35_CPLD "fby35-cpld"
> +OBJECT_DECLARE_SIMPLE_TYPE(Fby35CpldState, FBY35_CPLD);
> +
> +REG8(CLASS_TYPE, 0x5);
> +    FIELD(CLASS_TYPE, RESERVED, 0, 2);
> +    FIELD(CLASS_TYPE, 1OU_EXPANSION_NOT_PRESENT, 2, 1);
> +    FIELD(CLASS_TYPE, 2OU_EXPANSION_NOT_PRESENT, 3, 1);
> +    FIELD(CLASS_TYPE, BOARD_ID, 4, 4);
> +REG8(BOARD_REVISION, 0x8);
> +    FIELD(BOARD_REVISION, VALUE, 0, 4);
> +    FIELD(BOARD_REVISION, RESERVED, 4, 4);
> +
> +struct Fby35CpldState {
> +    I2CSlave parent_obj;
> +
> +    uint8_t target_reg;
> +    uint32_t regs[10];
> +};
> +
> +static void fby35_cpld_realize(DeviceState *dev, Error **errp)
> +{
> +    Fby35CpldState *s = FBY35_CPLD(dev);
> +
> +    memset(s->regs, 0, sizeof(s->regs));
> +    s->target_reg = 0;
> +
> +    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, BOARD_ID, 0b0000);
> +    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, 1OU_EXPANSION_NOT_PRESENT, 1);
> +    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, 2OU_EXPANSION_NOT_PRESENT, 1);
> +    ARRAY_FIELD_DP32(s->regs, BOARD_REVISION, VALUE, 0x1);
> +}
> +
> +static int fby35_cpld_i2c_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    Fby35CpldState *s = FBY35_CPLD(i2c);
> +
> +    switch (event) {
> +    case I2C_START_RECV:
> +        break;
> +    case I2C_START_SEND:
> +        s->target_reg = 0;
> +        break;
> +    case I2C_START_SEND_ASYNC:
> +    case I2C_FINISH:
> +    case I2C_NACK:
> +        break;
> +    }
> +
> +    return 0;
> +}
> +
> +static uint8_t fby35_cpld_i2c_recv(I2CSlave *i2c)
> +{
> +    Fby35CpldState *s = FBY35_CPLD(i2c);
> +
> +    switch (s->target_reg) {
> +    case R_CLASS_TYPE:
> +    case R_BOARD_REVISION:
> +        return s->regs[s->target_reg];
> +    default:
> +        printf("%s: unexpected register read 0x%02x\n", __func__, s->target_reg);

please use the  qemu logging system

> +        return 0xff;
> +    }
> +}
> +
> +static int fby35_cpld_i2c_send(I2CSlave *i2c, uint8_t data)
> +{
> +    Fby35CpldState *s = FBY35_CPLD(i2c);
> +
> +    if (s->target_reg == 0) {
> +        s->target_reg = data;
> +        return 0;
> +    }
> +
> +    switch (s->target_reg) {
> +    case R_CLASS_TYPE:
> +    case R_BOARD_REVISION:
> +        s->regs[s->target_reg] = data;
> +        break;
> +    default:
> +        printf("%s: unexpected register write 0x%02x 0x%02x\n", __func__, s->target_reg, data);
> +        break;
> +    }
> +
> +    return 0;
> +}
> +
> +static void fby35_cpld_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    I2CSlaveClass *i2c = I2C_SLAVE_CLASS(oc);
> +
> +    dc->realize = fby35_cpld_realize;
> +    i2c->event = fby35_cpld_i2c_event;
> +    i2c->recv = fby35_cpld_i2c_recv;
> +    i2c->send = fby35_cpld_i2c_send;
> +}
> +
> +static const TypeInfo types[] = {
> +    {
> +        .name = TYPE_FBY35_CPLD,
> +        .parent = TYPE_I2C_SLAVE,
> +        .instance_size = sizeof(Fby35CpldState),
> +        .class_init = fby35_cpld_class_init,
> +    },
> +};
> +
> +DEFINE_TYPES(types);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 95268eddc0..1edad44b6b 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -117,7 +117,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>     'aspeed_sbc.c',
>     'aspeed_sdmc.c',
>     'aspeed_xdma.c',
> -  'aspeed_peci.c'))
> +  'aspeed_peci.c',
> +  'fby35_cpld.c'))
>   
>   softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
>   softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))

