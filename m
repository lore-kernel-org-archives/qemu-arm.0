Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E23FD45F1
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 22:21:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvNFZ-0007Wm-Nl; Wed, 25 Feb 2026 17:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvNFT-0007Vd-GE
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:20:52 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvNFN-0002uS-I5
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:20:48 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-826c49b7628so133312b3a.0
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 14:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772058044; x=1772662844; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1vWa7CnUvujg0yoe1yp8elE7dC19mmcCbsyTDutROek=;
 b=vwjqcs67gew7VIEjftP7/QH5PArNBCjcR9EYf6T8PrT7bl58maT4f6nlcj+gX/2xFB
 1v54tyJp7DlUDq72ce6xCNaD8pSAyhAf7t7qDfPtbyWqJzAKhpwKNYMa2LCtEwgTmtwz
 G/BhXSK0k308ywylmrYXbk5ilU6kzkaRkUDM04XlSTXy7Sw46TWOUS71hQjWSSjfO6ym
 Ma1RtUFGIv4iF0RjYrhoe8lhidrm4cyC7np39ZrGgyFs4kjUD4rdAZ0OiCMj7SoDZpKp
 f7dOofcphlYkJy96sHV9zdUvrt3A4a+DKC9eucdRRPOHLsao+ed5nCMup6Lg5Z4XB6wG
 wj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772058044; x=1772662844;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1vWa7CnUvujg0yoe1yp8elE7dC19mmcCbsyTDutROek=;
 b=StFbxb+KgYnNYbgsmEBAHwLCFAmbxzjw/XseODxOjj9qdHbX49DVPMO5hxWV7YkJkl
 hcQv/CiTH0gywR5l4cMlu2EXEhh9d/4jq/OHqJ4u03M7Gw638iLXKJIbF4h1CnsDn6pQ
 M8r6jcoZVRc4Tz1hM5mCSa6etPl5odQth2TbOORloBBTbCn7QcM7HeMnkQx6zGxaVixv
 ZcVlyRbLj6vWHd7qPb9Tdz6kfHsTxzN2CIDjKOKleungrxyHwiK3mhj9TYChQziJnAdt
 D0aGtPrK3ahFGwFNHBlpofhQEshWPdnQoz7BYdofVNWViKeJtAwTEm3JTm5eVh5h/eEb
 8lCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuOWaDmO7PJrnZv3K68Mevd/VDu/H9VyjaPu5DUHSr//K76SFONNYy748SeIcTVDhb4+looX0SRA==@nongnu.org
X-Gm-Message-State: AOJu0YxfnNOe+88XD/WuJTAP0F4L0EcW+mIScMDJoBIvEm8apdKWz9sZ
 oYYLBg4EgJd0AzljjNKJCkKwAlx1KiU0n4GBSydsDiU3tQk/LR85cHlUtfRSW4jZ96iX9RYflSZ
 glI8g
X-Gm-Gg: ATEYQzyH9nvrWiOfNB0+qnk8C29cWXHNWoAp9/ZjJ3FSPGOo8FSOT1btXG4SXFsB788
 dXchWSO9+CXsuBUGisUqIhed9zBWY2rajuNNlknDNGg04/uqFjrTum5zUqdGO9B0RymFJGNWtug
 nt9x2W3jb1IHzrLd187ruMKGDJH7G+aI6pHA64Aoxqr+uUgpHw8Hp2A6YCwBk/og+p04ORzXFK1
 6m2qCWrrp4BR7w3eXDM5szjac/9e8EJTPOZ10fsL6pzUWTfWD85eGnGKke9kghksef56fJULXtH
 CphV3lzkWLm/R7YSAKmgiEq/B2psp0swf4t8LHOuUOw0ADuvxvSOyLr0RyBzM95dRcRev9p4qPT
 MYPoQ9m4LlD8VGnTX1lVcainybqpOY2zqYxhxpC/RcCCWIcnb3YrXfflky3gkhjn8P0qHnORFs4
 ARDSVgyO9ONv1luLXOv7pfRdVTbLzBRGEu+t3yG0bE/GGY76ktHdfc0YfP9klWNFWn1z4v
X-Received: by 2002:a05:6a20:1f28:b0:350:fa56:3f45 with SMTP id
 adf61e73a8af0-395ad1cf753mr1594747637.35.1772058043751; 
 Wed, 25 Feb 2026 14:20:43 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70fa8302absm33747a12.29.2026.02.25.14.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 14:20:43 -0800 (PST)
Message-ID: <831335ed-7463-4020-847a-b65518875376@linaro.org>
Date: Wed, 25 Feb 2026 14:20:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 30/31] hw/arm/smmuv3: Add secure bank migration and
 secure-impl property
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101926.2997959-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221101926.2997959-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/21/26 2:19 AM, Tao Tang wrote:
> Add a secure-impl device property and advertise it through
> S_IDR1.SECURE_IMPL.
> 
> Usage:
>      -global arm-smmuv3,secure-impl=true
> 
> Add the smmuv3/bank_s migration subsection for the secure register bank.
> Serialize secure bank state including GBPA, IRQ config, stream table and
> queue state.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmuv3.c         | 56 +++++++++++++++++++++++++++++++++++++++++
>   include/hw/arm/smmuv3.h |  2 ++
>   2 files changed, 58 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index f0fbc5fc96b..678cbd584e2 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -327,6 +327,7 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
>       memset(sbk->idr, 0, sizeof(sbk->idr));
>       sbk->idr[0] = FIELD_DP32(bk->idr[0], S_IDR0, STALL_MODEL, 1); /* No stall */
>       sbk->idr[1] = FIELD_DP32(sbk->idr[1], S_IDR1, S_SIDSIZE, SMMU_IDR1_SIDSIZE);
> +    sbk->idr[1] = FIELD_DP32(sbk->idr[1], S_IDR1, SECURE_IMPL, s->secure_impl);
>       smmuv3_accel_idr_override(s);
>   }
>   
> @@ -2632,6 +2633,54 @@ static const VMStateDescription vmstate_smmuv3_queue = {
>       },
>   };
>   
> +static const VMStateDescription vmstate_smmuv3_secure_bank = {
> +    .name = "smmuv3_secure_bank",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT32(features, SMMUv3RegBank),
> +        VMSTATE_UINT8(sid_split, SMMUv3RegBank),
> +        VMSTATE_UINT32_ARRAY(cr, SMMUv3RegBank, 3),
> +        VMSTATE_UINT32(cr0ack, SMMUv3RegBank),
> +        VMSTATE_UINT32(gbpa, SMMUv3RegBank),
> +        VMSTATE_UINT32(irq_ctrl, SMMUv3RegBank),
> +        VMSTATE_UINT32(gerror, SMMUv3RegBank),
> +        VMSTATE_UINT32(gerrorn, SMMUv3RegBank),
> +        VMSTATE_UINT64(gerror_irq_cfg0, SMMUv3RegBank),
> +        VMSTATE_UINT32(gerror_irq_cfg1, SMMUv3RegBank),
> +        VMSTATE_UINT32(gerror_irq_cfg2, SMMUv3RegBank),
> +        VMSTATE_UINT64(strtab_base, SMMUv3RegBank),
> +        VMSTATE_UINT32(strtab_base_cfg, SMMUv3RegBank),
> +        VMSTATE_UINT64(eventq_irq_cfg0, SMMUv3RegBank),
> +        VMSTATE_UINT32(eventq_irq_cfg1, SMMUv3RegBank),
> +        VMSTATE_UINT32(eventq_irq_cfg2, SMMUv3RegBank),
> +        VMSTATE_STRUCT(cmdq, SMMUv3RegBank, 0,
> +                       vmstate_smmuv3_queue, SMMUQueue),
> +        VMSTATE_STRUCT(eventq, SMMUv3RegBank, 0,
> +                       vmstate_smmuv3_queue, SMMUQueue),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static bool smmuv3_secure_bank_needed(void *opaque)
> +{
> +    SMMUv3State *s = opaque;
> +
> +    return s->secure_impl;
> +}
> +
> +static const VMStateDescription vmstate_smmuv3_bank_s = {
> +    .name = "smmuv3/bank_s",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = smmuv3_secure_bank_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_STRUCT(bank[SMMU_SEC_SID_S], SMMUv3State, 0,
> +                       vmstate_smmuv3_secure_bank, SMMUv3RegBank),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
>   static bool smmuv3_gbpa_needed(void *opaque)
>   {
>       SMMUv3State *s = opaque;
> @@ -2686,6 +2735,7 @@ static const VMStateDescription vmstate_smmuv3 = {
>       },
>       .subsections = (const VMStateDescription * const []) {
>           &vmstate_gbpa,
> +        &vmstate_smmuv3_bank_s,
>           NULL
>       }
>   };
> @@ -2707,6 +2757,12 @@ static const Property smmuv3_properties[] = {
>       DEFINE_PROP_BOOL("ats", SMMUv3State, ats, false),
>       DEFINE_PROP_UINT8("oas", SMMUv3State, oas, 44),
>       DEFINE_PROP_UINT8("ssidsize", SMMUv3State, ssidsize, 0),
> +    /*
> +     * SECURE_IMPL field in S_IDR1 register.
> +     * Indicates whether secure state is implemented.
> +     * Defaults to false (0)
> +     */
> +    DEFINE_PROP_BOOL("secure-impl", SMMUv3State, secure_impl, false),
>   };
>

As mentioned before, should we enable it automatically in case 
secure-memory address space is available at realize time?

>   static void smmuv3_instance_init(Object *obj)
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index d07bdfa1f27..79ce7c754c4 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -78,6 +78,8 @@ struct SMMUv3State {
>       bool ats;
>       uint8_t oas;
>       uint8_t ssidsize;
> +
> +    bool secure_impl;
>   };
>   
>   typedef enum {

Otherwise, congrats for the great series!

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

