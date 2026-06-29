Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331B2C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 14:45:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weDE8-0008T2-P5; Mon, 29 Jun 2026 10:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weDE7-0008N5-QO
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:44:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weDE5-0004DJ-Ux
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:44:47 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65TAStvZ2640759
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 14:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FrFu+6GHWaLu2gSmG9F0VMGRLsWJ2u9eM8qEbiqoz4k=; b=emXaJbjGHrR/yLzz
 /aoDBgAatDB+BXyvbe/c9Ee2PrvHFg8p7DH1mgWn5olbJPstegfbNyy2O7pZL3mN
 gUfmbIGOIrvyPV4kvBG26Q4gnxHrKsnttLVYrUqIm9CvlnykPlOmMXf/NtDou44O
 kVFLDxDXnHChIHtyP7v4A2Muu5fyP+vNgksv25sJh1QIUSzacRLA373FTQkHxkth
 pc0RpFaFiIhMbotjFr+hhznCTGqx3gqEyhedQDhgy4J4eUqVl1+tJosBiArk4h50
 Al698vcEzhZK22t53kdf5RQwjKC3OXozwR0O89UhXxIaw8Z015SRA1WIYMd2aNOW
 qm58hQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s1h4j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 14:44:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92a62578049so551666085a.0
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782744281; x=1783349081; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FrFu+6GHWaLu2gSmG9F0VMGRLsWJ2u9eM8qEbiqoz4k=;
 b=SK8wsHY2UEOf3/sULiWNDzqe/NEFQEDVb7vTwi1f8+/RoFLgTiKYMaVdpXivqPnVHv
 gB2DjTdTUJQWEY6cWlyrTNFGyoWRcMNYSly7yMvTa9tG0HxySZbUYqrHW2oDoQFeIYNj
 XjDdWzZcSSpcNtZSOkDfAa33aPOgmQIiQrST65uihTysaio+OZCpe8YJ39lvigUG2SRo
 l6KmXDRd0qiX750oqzsc9f9KJQ0ljSLnK6MxBZz9hAh6w37E5P1lI2F7/654PsYalaVe
 BgGdvDx67LKRot8XcUKJLzbOcmE2bVW5ACP5WyA58bkCyA1tF1GZyRH2vb8iFvIY8/6K
 0Y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782744281; x=1783349081;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FrFu+6GHWaLu2gSmG9F0VMGRLsWJ2u9eM8qEbiqoz4k=;
 b=UNAKlYBlyG0WrsDTvG1o2c3B88ViobboiKC3RnUzJ0LT9shPfljl8XUdbfHtHG7Czh
 L3PWfzJjy2Ou+2wONBI0UeZc2t1Y3ih2LTSvYNk4Dh02n8LqcummHOc2t14r57U9pJ31
 v2xY4rdIbPFyw3Nq9etGB0DWM1lgnIfMunSmyYYd4dAIByNwOns5hA+7OctVzZSGofjf
 H10Bsaz2I3BhJt3ix0jJ0meLQQs4XusOuSEGYtx7tWuXJ5PVmLIQQiKYVNc/VLJtIohx
 vah8ZI6wR8sqmxfJXi5YQcKPRe4g01Ot5kjC2EnJrWb7KIiMpkDqTdDOu0WbVV8d1SQk
 oOBA==
X-Forwarded-Encrypted: i=1;
 AFNElJ88/OdeysGEEGyAIiQscU0c2oFyQtzb9O2y3FjmeISGp1yUb3MNlMBXwM3HNOEIukxcjOW2MNMDVQ==@nongnu.org
X-Gm-Message-State: AOJu0YxTZVxg7n0obHlQQNHCdgUZic+5YlKmqYW3nJwDzV5dmPEfC/eO
 AaWQPuTcqgmWlFHeIzRT+0NBIUHPPnsYskhLONw6V0L/8Zm5M4Gs6CBLV4YBrPJ3hGAylvQF/yE
 iuTugmBWxO8IoS/7AqOlzbWdVPb5EURVOnmWWKR/5TttnyEdvhKiIeBc=
X-Gm-Gg: AfdE7cmRpZzW6YjqUVVUqLJskJARRE5mZadj/XZ6UztY7uRVIGIWb5Ah6bY8wrifLPN
 we9WRHj1V9CLc4bXmcpb+mvLQYVrIU8Q/9Jxqw8hAlVgNbbl7XevBdXXudaQZoWnY6W2iKZmf1H
 vpIYKjYekn57skw/8CDOZAHP2In+uIKG/CRH9gQeyVfEjziNpVr+LBRmdRzH9MbsINoL2wXix6a
 cJx4FGBv1sa1u/mKPppP89UAxXeIxeoB2LlNnjHxKZJtgY/Sk6h2dkJWo+WFFbMH3IBaUk7jFss
 gr979pwV80Rj/vmCiz0dKgc+qNFyM+QNYQ8A9zWHS6mRKAYT3kmR46bD45fnAucjt8nYmzySPex
 7jAaFA3TKP8/WtInsmQrGoYIfQd5AbP95u0n4M8op30vS/bMUN+BZ6g2asLVO0g==
X-Received: by 2002:a05:620a:4086:b0:92e:551d:f1a3 with SMTP id
 af79cd13be357-92e551df87dmr361782785a.8.1782744281200; 
 Mon, 29 Jun 2026 07:44:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4086:b0:92e:551d:f1a3 with SMTP id
 af79cd13be357-92e551df87dmr361775685a.8.1782744280631; 
 Mon, 29 Jun 2026 07:44:40 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4927038578bsm261236635e9.4.2026.06.29.07.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:44:39 -0700 (PDT)
Message-ID: <c65f6db3-ee77-4a94-b2d3-544816c70b20@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] hw/sensor: adc128d818: add 12-bit 8-channel ADC
 device
Content-Language: en-US
To: Emmanuel Blot <eblot@meta.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 Alexander Hansen <alexander.hansen@9elements.com>,
 William de Abreu Pinho <williampinho@meta.com>, qemu-arm@nongnu.org,
 Corey Minyard <cminyard@mvista.com>
References: <20260627-i2c-adc128d818-anacapa-v3-0-cfb94270a980@meta.com>
 <20260627-i2c-adc128d818-anacapa-v3-1-cfb94270a980@meta.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260627-i2c-adc128d818-anacapa-v3-1-cfb94270a980@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX6iXfTMq1crhr
 og15ChdM1oMJxlQStIidmCioQpUFUwjq3xc0hCd7GlQao+3AkYmj6XWAVlIJvhDT30EVOtBQuJ4
 yzHVj6FOmkcbA+913qyJDyl66M+FrMI=
X-Proofpoint-ORIG-GUID: RlHjipsj13NYstFexJVVrhYuGvb4AOlY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX3MStRUgHdhGn
 DQ8jpyL54ZkmCCnj3wO/1ui65VGH/xabvwTVvsn/3tAKy+TlBXSh0/ycK8fmwjXUH+1iN9aI+ud
 u9FrQgnG1N+qEFMELNwiOTNL/R6TxHvIFI8DKxTdwC2tvvoL3MsxbKDMTylTtG737t63oY1DKVB
 4uI0S9ZbXB4DdwUziUucfJ+lX9jIIHC/35yjbUUgTzdd7vO18Mz/MBh/1bvSlvPllZJjriBLv3d
 XvDKA0YqrLwGtuqeYcDFHtLjNJUParKE2JVIeiph13Wt76BIPhFkhsGueR+uK4WRjtOtr2UVakR
 1BjJ+EZVPAqwEtTJVcg176WrQX7EPnUGY9ltu3uRGNSBn/b2lXe8FhDF98jkrh7M7N27bpqqbNI
 AF0U6O5qRu1jrpkdUQG6pytSgB22w8Bf2ILsbdIqNINQWHrnqjAYT3QKjvIyj1DGnr9HNHc9DpW
 y6WS5g85glzfYUvDV1A==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a4284da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=PzGKxP3WAAAA:8 a=VabnemYjAAAA:8 a=SFAcpHi7KKgxZ-x-tV0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=zCCnohV0i-_k6euCn0hJ:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: RlHjipsj13NYstFexJVVrhYuGvb4AOlY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290122
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Emmanuel,

Minor style comments inlined.

On 28/6/26 02:45, Emmanuel Blot wrote:
> The ADC128D818 is a TI 12-bit, 8-channel I2C ADC used on several
> OpenBMC platforms for voltage and temperature monitoring.
> 
> Implement the device with:
>   - four operating modes
>   - 12-bit voltage conversion from QOM inputs
>   - 9-bit temperature conversion from milli-degree Celsius QOM inputs
>   - switchable internal or external voltage reference
>   - per-channel high/low limit registers
>   - interrupt support
>   - software reset
>   - one-shot conversion support in shutdown mode
> 
> Reviewed-by: Alexander Hansen <alexander.hansen@9elements.com>
> Tested-by: Alexander Hansen <alexander.hansen@9elements.com>
> Signed-off-by: Emmanuel Blot <eblot@meta.com>
> ---
>   hw/sensor/Kconfig              |   4 +
>   hw/sensor/adc128d818.c         | 697 +++++++++++++++++++++++++++++++++++++++++
>   hw/sensor/meson.build          |   1 +
>   hw/sensor/trace-events         |   8 +
>   include/hw/sensor/adc128d818.h |  14 +
>   5 files changed, 724 insertions(+)
> 
> diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
> index bc6331b4ab..b459ac2240 100644
> --- a/hw/sensor/Kconfig
> +++ b/hw/sensor/Kconfig
> @@ -1,3 +1,7 @@
> +config ADC128D818
> +    bool
> +    depends on I2C
> +
>   config TMP105
>       bool
>       depends on I2C
> diff --git a/hw/sensor/adc128d818.c b/hw/sensor/adc128d818.c
> new file mode 100644
> index 0000000000..031c7598ef
> --- /dev/null
> +++ b/hw/sensor/adc128d818.c
> @@ -0,0 +1,697 @@
> +/*
> + * Texas Instruments ADC128D818 12-bit 8-channel ADC with I2C interface
> + *
> + * Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qom/object.h"
> +#include "hw/sensor/adc128d818.h"
> +#include "hw/core/irq.h"
> +#include "hw/core/qdev-properties.h"
> +#include "hw/i2c/i2c.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +
> +/* Register addresses */
> +#define REG_CONFIG              0x00u
> +#define REG_INT_STATUS          0x01u
> +#define REG_INT_MASK            0x03u
> +#define REG_CONV_RATE           0x07u
> +#define REG_CH_DISABLE          0x08u
> +#define REG_ONE_SHOT            0x09u
> +#define REG_DEEP_SHUTDOWN       0x0Au
> +#define REG_ADV_CONFIG          0x0Bu
> +#define REG_BUSY_STATUS         0x0Cu

QEMU coding style is usually lower case hex values, with no explicit
unsigned suffix. Not sure this is right, but using distinct style
make reviews harder.

> +/* Channel Reading Registers (16-bit, read-only) */
> +#define REG_CH_READING_BASE     0x20u
> +#define REG_CH_READING_LAST     0x27u
> +
> +/* Limit Registers (8-bit, read/write) */
> +#define REG_LIMIT_BASE          0x2Au
> +#define REG_LIMIT_LAST          0x39u
> +
> +/* ID Registers (read-only) */
> +#define REG_MANUFACTURER_ID     0x3Eu
> +#define REG_REVISION_ID         0x3Fu
> +
> +/* Configuration Register (0x00) bitfields */
> +#define CONFIG_START            BIT(0)
> +#define CONFIG_INT_ENABLE       BIT(1)
> +#define CONFIG_INT_CLEAR        BIT(3)
> +#define CONFIG_INITIALIZATION   BIT(7)
> +#define CONFIG_WR_MASK \
> +    (CONFIG_START | CONFIG_INT_ENABLE | CONFIG_INT_CLEAR)
> +
> +/* Advanced Configuration Register (0x0B) bitfields */
> +#define ADV_CONFIG_EXT_REF_EN   BIT(0)
> +#define ADV_CONFIG_MODE_SHIFT   1u
> +#define ADV_CONFIG_MODE_MASK    (0x3u << ADV_CONFIG_MODE_SHIFT)
> +#define ADV_CONFIG_WR_MASK \
> +    (ADV_CONFIG_EXT_REF_EN | ADV_CONFIG_MODE_MASK)
> +
> +/* Busy Status Register (0x0C) bitfields */
> +#define BUSY_STATUS_NOT_READY   BIT(1)
> +
> +/* Conversion Rate Register (0x07) bitfields */
> +#define CONV_RATE_MASK          0x01u
> +
> +/* Deep Shutdown Register (0x0A) bitfields */
> +#define DEEP_SHUTDOWN_EN        0x01u
> +
> +/* Device constants */
> +#define ADC128D818_NUM_CHANNELS         8u
> +#define ADC128D818_NUM_REGS             0x40u
> +
> +#define ADC128D818_INTERNAL_VREF_MV     2560u
> +#define ADC128D818_MAX_VDD_MV           5500u
> +#define ADC128D818_MANUFACTURER_ID_VAL  0x01u
> +#define ADC128D818_REVISION_ID_VAL      0x09u
> +
> +/* ADC resolution */
> +#define ADC128D818_ADC_RESOLUTION       4096u
> +#define ADC128D818_ADC_MAX              4095u
> +
> +/* Temperature: 0.5 deg C per LSb = 500 milli-degrees per LSb */
> +#define ADC128D818_TEMP_LSB_MC          500
> +#define ADC128D818_TEMP_RAW_MIN         (-256)
> +#define ADC128D818_TEMP_RAW_MAX         255
> +
> +
> +typedef struct ADC128D818State ADC128D818State;
> +DECLARE_INSTANCE_CHECKER(ADC128D818State, ADC128D818, TYPE_ADC128D818)

No need to forward declare if you use:

OBJECT_DECLARE_SIMPLE_TYPE(ADC128D818State, ADC128D818)

> +
> +struct ADC128D818State {
> +    I2CSlave i2c;

Again, per our coding style:

        I2CSlave parent_obj;

> +
> +    qemu_irq irq;
> +
> +    uint8_t len;
> +    uint8_t pointer;
> +    uint8_t rx_byte;
> +
> +    uint8_t regs[ADC128D818_NUM_REGS];
> +    uint16_t channel[ADC128D818_NUM_CHANNELS];
> +
> +    int16_t ain[ADC128D818_NUM_CHANNELS]; /* mV */
> +    int32_t temperature; /* milli-degrees Celsius */
> +    uint16_t ext_vref; /* mV, 0 means not connected */
> +    bool temp_alarm; /* temperature high-limit alarm latched */
> +
> +    char *description;
> +};

