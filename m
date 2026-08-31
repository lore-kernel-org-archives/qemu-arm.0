Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4691C61DD3
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 08:51:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0xjZ-0004NM-SG; Mon, 31 Aug 2026 04:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x0xjZ-0004N0-0X
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 04:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x0xjT-00078U-H2
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 04:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788166270;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TyCdRYLMLl9yasEb58mydwTENTFf1HbteKBA9G3Sxxw=;
 b=eDhQKeIcDMaKjGdRCRQ5pGOzEPDtRXQnnx9739HuSpPXGGuMI/GrUpCNW71m4MmfDUk4T+
 Q8TuwcL7GTNRzvmBwCXKFKM5gByl4fjE07kEPdob01JtGZQu1ybXqNyGio09rxjV1wXsQi
 LDN+L8+m4tQfViMk3zs9eH6egQQ7VR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-wes_WU1HNuS_ibWWpku-yA-1; Mon, 31 Aug 2026 04:51:05 -0400
X-MC-Unique: wes_WU1HNuS_ibWWpku-yA-1
X-Mimecast-MFC-AGG-ID: wes_WU1HNuS_ibWWpku-yA_1788166264
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-490a767b782so22284025e9.2
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 01:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788166264; x=1788771064;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TyCdRYLMLl9yasEb58mydwTENTFf1HbteKBA9G3Sxxw=;
 b=ezhzDHqSb3rE0h5kO0BupHZmjGyaMNITK8rVNzCfyU7OJj61B20+J8yaeZDlBGGEgn
 WiNyvQBAtqSI/KGz5xz94whIQOvp6SHsbvZmiMZlw8ydplzSOSCglYeLOipy4JeNBw5B
 EpHDGKoRPBMeJOSp6qNUnV6mYst9qDLS7YdNWkl4JC4/3ExSNX+5FrP1TGkTsgk/nJZz
 A8STFZAYB8PXx4cjKvaaAB1eStEmq4GY2Jzrcfeh+qsAN81j84IDJCelgDwzeeeDm81X
 Ynwa0zuLSeRspAaqIfa92bM+Iv/0dOz9Ba1HuiMoi6no1mpF0kZTcesThN90RxOnIXug
 S82w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrRhP1Kqg7ZA78oKinZnan2FLCIrGjNNJJ+Wr/yP2cAwf3ijhGN9ApzwY46TGr7IkKMQnZWp4qTLA==@nongnu.org
X-Gm-Message-State: AFuF++kMKZDicgJZ/LbWBQuAAzA6siC1cWZy/FS7DkPEZ7HEy5cIefD8
 SfmMoabWdW2urk8A5ytHTGXY1B4F48UmlXjjsHZNbCmOTjOjEsAihJA+mcx8KF4GZTCDcvc4vca
 6IDAa88t+TxgGxMM35Xqfzry42cuSviJ/UeHH12NrSOv6TnH12rddng==
X-Gm-Gg: AR+sD13OEHLkAo5UD+E9DDBcaGgCZ/eyxYOO7+1JTd0I/+Nf4H9RVjHw/TYlGUkRBz7
 MM1E70BltLMt8S2lbcTG9qRwEH3ewyY5wSzvdtw1yikqUDPVxkc+I0z+TQgVPia0cxG9EQ2qsdr
 ENEiRzZGaVnW2Hf2+s+fRZqGNtUJWXixpDcd/ZWKZxw/MsWm5UiHGb+cbM8UnQGQ1fv/tS4D4S8
 nVFMVF/0OLOghi1SxlSYu1LRaQc8DE2LJw/6J9aj5pLx6x0ODSfLqn87eqnvzeQ6c5WWVlrTq/b
 Cc2XsWrBzo06K8Vo2yYLPtzpe7b7kSktCVa2CZO63rM7Mngk3mDiz3t8ugJlx+tK6OcuiuGPwN4
 KcR5RihXujkyLYlKYYhx5hgjaNcOxzPe26cEEC1STR0wlz9dI
X-Received: by 2002:a05:600c:1c0a:b0:493:bd2a:93be with SMTP id
 5b1f17b1804b1-49b91c276efmr397523655e9.6.1788166263675; 
 Mon, 31 Aug 2026 01:51:03 -0700 (PDT)
X-Received: by 2002:a05:600c:1c0a:b0:493:bd2a:93be with SMTP id
 5b1f17b1804b1-49b91c276efmr397522905e9.6.1788166263272; 
 Mon, 31 Aug 2026 01:51:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b9266be71sm575736225e9.2.2026.08.31.01.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 01:51:02 -0700 (PDT)
Message-ID: <f0dc00d6-c49b-4dc1-b6de-706142856089@redhat.com>
Date: Mon, 31 Aug 2026 10:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 27/28] hw/arm/smmuv3: Add secure bank migration and
 secure-impl property
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162644.2810021-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260813162644.2810021-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0lxoM0JR2tp_Y4VIdv55HKj3G83ATUNa21UbqvI3LpQ_1788166264
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org


Hi Tao,
On 8/13/26 6:26 PM, Tao Tang wrote:
> Add a secure-impl device property and advertise it through
> S_IDR1.SECURE_IMPL. Reject secure-impl=on unless Secure memory is available
> and stage-1 translation is supported.
please document why the auto mode is needed (dependency on virt secure
option)

May make sense to document it in system/arm/virt.rst too as it has a
dependency on the secure setup of the machine
>
> Usage:
>     -M virt,secure=on,iommu=smmuv3 \
>     -global arm-smmuv3.secure-impl=on
does it work with arm-smmuv3 device too?
>
> Add the smmuv3/bank_s migration subsection for the secure register bank.
> Serialize secure bank state including GBPA, IRQ config, stream table and
> queue state.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3.c         | 93 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmuv3.h |  2 +
>  2 files changed, 95 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 7e7376c65e2..8e1de94fd17 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -348,6 +348,8 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
>  
>      sbank->idr[1] = FIELD_DP32(sbank->idr[1], S_IDR1, S_SIDSIZE,
>                                 SMMU_IDR1_SIDSIZE);
> +    sbank->idr[1] = FIELD_DP32(sbank->idr[1], S_IDR1, SECURE_IMPL,
> +                               s->secure_impl == ON_OFF_AUTO_ON);
>      smmuv3_accel_idr_override(s);
>  }
>  
> @@ -2752,6 +2754,37 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>      return true;
>  }
>  
> +static bool smmuv3_resolve_secure_impl(SMMUv3State *s, Error **errp)
> +{
> +    SMMUState *bs = ARM_SMMU(s);
> +    bool secure_as_available = bs->secure_memory &&
> +                               bs->secure_memory_as.root != NULL;
> +
> +    if (s->secure_impl == ON_OFF_AUTO_AUTO) {
> +        s->secure_impl = secure_as_available ? ON_OFF_AUTO_ON
> +                                             : ON_OFF_AUTO_OFF;
> +    }
> +
> +    if (s->secure_impl == ON_OFF_AUTO_ON && !secure_as_available) {
> +        error_setg(errp,
> +                   "secure-impl=on requires a secure-memory address space");
> +        return false;
> +    }
> +
> +    /*
> +     * When SECURE_IMPL == 1, stage 1 must be supported according to
> +     * (IHI 0070G.b) 6.3.53 SMMU_S_IDR1, Page 442.
> +     */
> +    if (s->secure_impl == ON_OFF_AUTO_ON &&
> +        s->stage && !strcmp(s->stage, "2")) {
we already have smmu_validate_property(). Would be better located there
if possible. Otherwise please justify it.

Please split this patch into 2. The migration support on one end, which
only depends on OnOffAuto secure_impl;
and the rest
> +        error_setg(errp,
> +                    "secure-impl=on requires stage=1 or stage=nested");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  static void smmu_realize(DeviceState *d, Error **errp)
>  {
>      SMMUState *sys = ARM_SMMU(d);
> @@ -2781,6 +2814,10 @@ static void smmu_realize(DeviceState *d, Error **errp)
>          return;
>      }
>  
> +    if (!smmuv3_resolve_secure_impl(s, errp)) {
> +        return;
> +    }
> +
>      qemu_mutex_init(&s->mutex);
>  
>      memory_region_init_io(&sys->iomem, OBJECT(s),
> @@ -2807,6 +2844,54 @@ static const VMStateDescription vmstate_smmuv3_queue = {
>      },
>  };
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
> +    return s->secure_impl == ON_OFF_AUTO_ON;
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
>  static bool smmuv3_gbpa_needed(void *opaque)
>  {
>      SMMUv3State *s = opaque;
> @@ -2861,6 +2946,7 @@ static const VMStateDescription vmstate_smmuv3 = {
>      },
>      .subsections = (const VMStateDescription * const []) {
>          &vmstate_gbpa,
> +        &vmstate_smmuv3_bank_s,
>          NULL
>      }
>  };
> @@ -2893,6 +2979,13 @@ static const Property smmuv3_properties[] = {
>      DEFINE_PROP_SSIDSIZE_MODE("ssidsize", SMMUv3State, ssidsize,
>                                SSID_SIZE_MODE_AUTO),
>      DEFINE_PROP_ON_OFF_AUTO("cmdqv", SMMUv3State, cmdqv, ON_OFF_AUTO_AUTO),
> +    /*
> +     * SECURE_IMPL field in S_IDR1 register.
> +     * Indicates whether secure state is implemented.
> +     * Defaults to auto.
> +     */
> +    DEFINE_PROP_ON_OFF_AUTO("secure-impl", SMMUv3State, secure_impl,
> +                            ON_OFF_AUTO_AUTO),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 8cd2edc3412..9b533b9a99b 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -81,6 +81,8 @@ struct SMMUv3State {
>      OnOffAuto ats;
>      OasMode oas;
>      SsidSizeMode ssidsize;
> +    OnOffAuto secure_impl;
> +
>      /* SMMU CMDQV extension */
>      OnOffAuto cmdqv;
>  
Thanks

Eric


