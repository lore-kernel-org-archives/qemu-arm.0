Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1000730lft;
        Fri, 1 Jul 2022 00:13:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tV2gGJPsZaDmgaX59uPQf3YvfnhaXHFAtG5F2jR0l7OkJY9vJ5o+SXi92nMf7d7yju0TrP
X-Received: by 2002:ad4:5907:0:b0:470:4b8d:2898 with SMTP id ez7-20020ad45907000000b004704b8d2898mr16131516qvb.91.1656659586253;
        Fri, 01 Jul 2022 00:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656659586; cv=none;
        d=google.com; s=arc-20160816;
        b=A0usrICgEKKBNqeHwPA5cqSg/ZfVwcUNKDvE0iyhM9p1eg5z06oVwdWiH/zxJxRwVk
         PIrwUcmBBd2URc/ro92JZNp+nz6qJ8F7YaCIv/63qD38NOMTbb+Qyc5kL2I5cGK9Rt6C
         zpNXUkPsJuH0dxn5vT3+m4g+MEX0JBQYh7aWjbgLd6woKt1EI9mUjOde78RON/uIRM4H
         L+ubCy7baWTg+qRCls6wuv9pCuuSc4lB5OxKQWZcvdQ+ULNJsMjMXuH5ttkslQ2Hkjci
         LuZxNxIhLT/RlXJY+6RWJafVkLT137UkoA+f5Ssp1WaLccqYdPHoybWzVQoQ10L/ch8p
         X8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=miLwAQlEDwpBcRrCU0XLktYtlwanhTvciUmYvJfK2ME=;
        b=AG8wPWyOCx47TJCtVjMo2+SzMZzOrOmcSvT6hqV3Qouz+8nJ0z14k1NmS+yTBxxToH
         hICS+cHhRTWTptDd+vfxPKq51RGGG8QB+xzmo+/fu2oeBc+v9F2HcuGXjT62+MeXcvI0
         HA+3o6r8Idmj8t8enHKJXitzY+kkfOfUMhPK9xF/n3WwNABwE+/chpEteweWSVKtRkg+
         pdm5OtlOLx7EcQzHxfOiTd6Ok52hn0KOVkXDnQBLFQq0rj19u8hVxNXyLNw94KjC2wRr
         eQXRRzt2hfzQBqjGFz4apV0nVsCBaQyBWDG1P12cSGp1PrQezBHgCIkym/nSMJo46wm8
         6T4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz8-20020a0562140e6800b004704f751352si12412016qvb.570.2022.07.01.00.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 00:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7Apt-0000n3-E9
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 03:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7Ap5-0000VG-Sp
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 03:12:15 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:51673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7Aop-0001XR-2r
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 03:12:15 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A7E9D24E65;
 Fri,  1 Jul 2022 07:11:53 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 1 Jul 2022
 09:11:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0017bf0d554-44ee-4314-b7d6-a5b04acb4fad,
 D594F7ECFE8920C5FAE37748FDFD57525B476B5E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <23008cae-c14f-281d-39af-17d4cef6d208@kaod.org>
Date: Fri, 1 Jul 2022 09:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] hw: m25p80: Add Block Protect and Top Bottom bits for
 write protect
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, <dz4list@gmail.com>
References: <20220627185234.1911337-1-irischenlj@fb.com>
 <20220627185234.1911337-2-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627185234.1911337-2-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 35a00944-817c-415c-94f4-45aa1cff30bb
X-Ovh-Tracer-Id: 11401143933627632516
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepugiigehlihhsthesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
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
X-TUID: 9XfoMi3k3Y5/

Even for a simple addition a quick intro is always nice to have.

On 6/27/22 20:52, Iris Chen wrote:
> Signed-off-by: Iris Chen <irischenlj@fb.com>

Too bad that we are modeling 5 bits with 5 bools but given the layout
it makes the code easier to read. LGTM.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/block/m25p80.c | 74 +++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 62 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 50b523e5b1..0156a70f5e 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -38,21 +38,19 @@
>   #include "trace.h"
>   #include "qom/object.h"
>   
> -/* Fields for FlashPartInfo->flags */
> -
> -/* erase capabilities */
> -#define ER_4K 1
> -#define ER_32K 2
> -/* set to allow the page program command to write 0s back to 1. Useful for
> - * modelling EEPROM with SPI flash command set
> - */
> -#define EEPROM 0x100
> -
>   /* 16 MiB max in 3 byte address mode */
>   #define MAX_3BYTES_SIZE 0x1000000
> -
>   #define SPI_NOR_MAX_ID_LEN 6
>   
> +/* Fields for FlashPartInfo->flags */
> +enum spi_nor_option_flags {
> +    ER_4K                  = BIT(0),
> +    ER_32K                 = BIT(1),
> +    EEPROM                 = BIT(2),
> +    SNOR_F_HAS_SR_TB       = BIT(3),
> +    SNOR_F_HAS_SR_BP3_BIT6 = BIT(4),
> +};
> +
>   typedef struct FlashPartInfo {
>       const char *part_name;
>       /*
> @@ -253,7 +251,8 @@ static const FlashPartInfo known_devices[] = {
>       { INFO("n25q512a11",  0x20bb20,      0,  64 << 10, 1024, ER_4K) },
>       { INFO("n25q512a13",  0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>       { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
> -    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512,
> +           ER_4K | SNOR_F_HAS_SR_BP3_BIT6 | SNOR_F_HAS_SR_TB) },
>       { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>       { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
>       { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
> @@ -480,6 +479,11 @@ struct Flash {
>       bool reset_enable;
>       bool quad_enable;
>       bool aai_enable;
> +    bool block_protect0;
> +    bool block_protect1;
> +    bool block_protect2;
> +    bool block_protect3;
> +    bool top_bottom_bit;
>       bool status_register_write_disabled;
>       uint8_t ear;
>   
> @@ -630,6 +634,29 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
>           qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
>           return;
>       }
> +    uint32_t block_protect_value = (s->block_protect3 << 3) |
> +                                   (s->block_protect2 << 2) |
> +                                   (s->block_protect1 << 1) |
> +                                   (s->block_protect0 << 0);
> +
> +     uint32_t num_protected_sectors = 1 << (block_protect_value - 1);
> +     uint32_t sector = addr / s->pi->sector_size;
> +
> +     /* top_bottom_bit == 0 means TOP */
> +    if (!s->top_bottom_bit) {
> +        if (block_protect_value > 0 &&
> +            s->pi->n_sectors <= sector + num_protected_sectors) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M25P80: write with write protect!\n");
> +            return;
> +        }
> +    } else {
> +        if (block_protect_value > 0 && sector < num_protected_sectors) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M25P80: write with write protect!\n");
> +            return;
> +        }
> +    }
>   
>       if ((prev ^ data) & data) {
>           trace_m25p80_programming_zero_to_one(s, addr, prev, data);
> @@ -728,6 +755,15 @@ static void complete_collecting_data(Flash *s)
>           break;
>       case WRSR:
>           s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> +        s->block_protect0 = extract32(s->data[0], 2, 1);
> +        s->block_protect1 = extract32(s->data[0], 3, 1);
> +        s->block_protect2 = extract32(s->data[0], 4, 1);
> +        if (s->pi->flags & SNOR_F_HAS_SR_TB) {
> +            s->top_bottom_bit = extract32(s->data[0], 5, 1);
> +        }
> +        if (s->pi->flags & SNOR_F_HAS_SR_BP3_BIT6) {
> +            s->block_protect3 = extract32(s->data[0], 6, 1);
> +        }
>   
>           switch (get_man(s)) {
>           case MAN_SPANSION:
> @@ -1213,6 +1249,15 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>       case RDSR:
>           s->data[0] = (!!s->write_enable) << 1;
>           s->data[0] |= (!!s->status_register_write_disabled) << 7;
> +        s->data[0] |= (!!s->block_protect0) << 2;
> +        s->data[0] |= (!!s->block_protect1) << 3;
> +        s->data[0] |= (!!s->block_protect2) << 4;
> +        if (s->pi->flags & SNOR_F_HAS_SR_TB) {
> +            s->data[0] |= (!!s->top_bottom_bit) << 5;
> +        }
> +        if (s->pi->flags & SNOR_F_HAS_SR_BP3_BIT6) {
> +            s->data[0] |= (!!s->block_protect3) << 6;
> +        }
>   
>           if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>               s->data[0] |= (!!s->quad_enable) << 6;
> @@ -1553,6 +1598,11 @@ static void m25p80_reset(DeviceState *d)
>   
>       s->wp_level = true;
>       s->status_register_write_disabled = false;
> +    s->block_protect0 = false;
> +    s->block_protect1 = false;
> +    s->block_protect2 = false;
> +    s->block_protect3 = false;
> +    s->top_bottom_bit = false;
>   
>       reset_memory(s);
>   }

