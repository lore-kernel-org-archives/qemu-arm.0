Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64007112583A
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 14:53:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0Kw5-0007C8-O8; Wed, 11 Mar 2026 10:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0Kvt-0006uV-VF
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 10:53:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0Kvs-0000ja-AA
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 10:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773240785;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jMW9wdMx4IyjB42JCXFmV+TsOW3/sq5YgwMkQmofxw=;
 b=WpxFKKmfi9gjFXdAxFp1j1KCES840OwwU/2/FLVqz1cHBbf/heatqi3GBEM5eeZlvNPa7/
 aQtVOog1pd4/Feq064pjpiOrGXGOO2jWupO3wHJTL5uGojwblWBeCDcgRVNqOY5J5tfp1O
 lADLohgtPr956ExmKou/kCapHrPwWSg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-_Vd3ucAHNS2VtC2R3DITEA-1; Wed, 11 Mar 2026 10:53:01 -0400
X-MC-Unique: _Vd3ucAHNS2VtC2R3DITEA-1
X-Mimecast-MFC-AGG-ID: _Vd3ucAHNS2VtC2R3DITEA_1773240780
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-439b5511d5aso9399930f8f.1
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 07:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773240780; x=1773845580;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5jMW9wdMx4IyjB42JCXFmV+TsOW3/sq5YgwMkQmofxw=;
 b=toDW37QjOvX/1+jiG0EnVVMcZxPKNNXJ6g4mTxECigsGYEDPWLkNR0TeaFxI8ts2TP
 a77gg4NBMEQbnQyWXEm0y0dthDaXF1nEioYbISsLBwjksSEqXm8SUQIAvoUTdDDBjfaP
 OZKK/L3AH3uI13WLU0WWzfwEBJky3vOEmMq//sUizte4sB3M9kcBX5ba4UJEKR+KQv4u
 oozshozD1raORXvBj89ReAX4toeZo3fFNWaHZkNPOc4vCnud525av2kgvZGsVYNsYL7W
 C56jsSXuziyg69mJ5at+GWWHWL7P+fDqtOngDdErthPPZPTFnZ4w4UGgLE8b1nu3ZjDG
 djPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8+CtgHpe/ZagncuM04VsL0Vxgs+qXfAwoifIyIzl7yb3eFEJUGWdmN6jOwNB+bdmd++oxeI29hA==@nongnu.org
X-Gm-Message-State: AOJu0YyY/c9j/YbPCS8SXIDhNMKCutgSmZn1Kk6wktTOMwqlm8yDxoUs
 b4/M0OjYCzFATXbGhnJ5HD5UhaduCXUO79V6+QQNRgq7ycdrxO839lrrmIV2NLE+8t9G/Pspajj
 SHfFhvvPWPBUZuZjw3F6eA8Kpt3Gwf95XON57U4+N4IinPoOQE/VD4A==
X-Gm-Gg: ATEYQzw0ce7Ecz0KDO33rQxT5pEYY8f0g9gNYIT/cYCahh6e0NCE2uDvctY6TAg7+ek
 PjGZ9Tx6CtblsiLe//Nd+3u1aYU8FgwBgWSzcyzed1Mbs/7eYen8IKxbbvOJ1PrzGHS/bjxX59y
 k/EnpHGPfSuKdSYkGZVVKmCbz25gX+TLDrwFR4khcqsFJN/wG1vVktVlTE74ucW4eW1PvLIYGfr
 nk6ph0/lq0vgsOK3B4k2LYAlfw28R9oRWAd1S5BZhVz9eugtVWM5ksz1cvZzyDvti7LwYLC+MCA
 6wBFgkdSk7KBrLX4XWLfqVkZHWz/zr9e7xWS39U2HQrycL4VbaVN69DMXZGDoMpVAQx3q/AyZ8n
 QkCAqZO+q4YVySzdve5E++Qt6TwZvauHrcUUn2Bu3GoCxsPI61qhUiNs3EPOodINgMDJvkw==
X-Received: by 2002:a05:6000:40c8:b0:439:c5a5:c1fb with SMTP id
 ffacd0b85a97d-439f81b6666mr5598486f8f.4.1773240779866; 
 Wed, 11 Mar 2026 07:52:59 -0700 (PDT)
X-Received: by 2002:a05:6000:40c8:b0:439:c5a5:c1fb with SMTP id
 ffacd0b85a97d-439f81b6666mr5598421f8f.4.1773240779374; 
 Wed, 11 Mar 2026 07:52:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f818d4c8sm7969639f8f.7.2026.03.11.07.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 07:52:58 -0700 (PDT)
Message-ID: <f4267f2a-4fe7-4c87-ad11-9632a33a5d3b@redhat.com>
Date: Wed, 11 Mar 2026 15:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/32] hw/arm/tegra241-cmdqv: Use mmap'ed VINTF page0
 as VCMDQ backing
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com, phrdina@redhat.com
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-21-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260226105056.897-21-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MB9V-yeJtqXtUIpGiqcZYkDfxKgokN5TBvVZQJo1I-k_1773240780
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 2/26/26 11:50 AM, Shameer Kolothum wrote:
> When a VCMDQ is allocated and VINTF page0 has been mmap'ed from the
> kernel, access the VCMDQ registers directly through the VINTF page0
> backing instead of using QEMU's cached register state.
>
> VINTF page0 provides the backing memory region for VCMDQ registers
> once a hardware queue is created. In that case, reads and writes
> should reflect the live backing state.
>
> If a VCMDQ is not allocated, or if VINTF page0 is not available,
> continue to use the cached register values maintained by QEMU.
But if both coexist shouldn't you also sync emulated/mmaped VINTF CMDQV.
Somehow this means that you have 3 states of the same CMDQV: the
global/direct one, the emulated VI CMDQV and the mmapped VI CMDQV (host
backed).
Is this understanding correct?

Thanks

Eric
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.c | 47 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 002dde50fc..17b9552906 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -14,17 +14,44 @@
>  #include "smmuv3-accel.h"
>  #include "tegra241-cmdqv.h"
>  
> +static inline uint32_t *tegra241_cmdqv_vintf_ptr(Tegra241CMDQV *cmdqv,
> +                                                 int index, hwaddr offset0)
> +{
> +    if (!cmdqv->vcmdq[index] || !cmdqv->vintf_page0) {
> +        return NULL;
> +    }
> +
> +    return (uint32_t *)(cmdqv->vintf_page0 + (index * 0x80) +
> +                        (offset0 - 0x10000));
> +}
>  /*
>   * Read a VCMDQ register using VCMDQ0_* offsets.
>   *
>   * The caller normalizes the MMIO offset such that @offset0 always refers
>   * to a VCMDQ0_* register, while @index selects the VCMDQ instance.
>   *
> - * All VCMDQ accesses return cached registers.
> + * If the VCMDQ is allocated and VINTF page0 is mmap'ed, read directly
> + * from the VINTF page0 backing. Otherwise, fall back to cached state.
>   */
>  static uint64_t tegra241_cmdqv_read_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0,
>                                            int index)
>  {
> +    uint32_t *ptr = tegra241_cmdqv_vintf_ptr(cmdqv, index, offset0);
> +
> +    if (ptr) {
> +        switch (offset0) {
> +        case A_VCMDQ0_CONS_INDX:
> +        case A_VCMDQ0_PROD_INDX:
> +        case A_VCMDQ0_CONFIG:
> +        case A_VCMDQ0_STATUS:
> +        case A_VCMDQ0_GERROR:
> +        case A_VCMDQ0_GERRORN:
> +            return *ptr;
> +        default:
> +            break;
> +        }
> +    }
> +
>      switch (offset0) {
>      case A_VCMDQ0_CONS_INDX:
>          return cmdqv->vcmdq_cons_indx[index];
> @@ -250,11 +277,29 @@ static bool tegra241_cmdqv_mmap_vintf_page0(Tegra241CMDQV *cmdqv, Error **errp)
>   *
>   * The caller normalizes the MMIO offset such that @offset0 always refers
>   * to a VCMDQ0_* register, while @index selects the VCMDQ instance.
> + *
> + * If the VCMDQ is allocated and VINTF page0 is mmap'ed, write directly
> + * to the VINTF page0 backing. Otherwise, update cached state.
>   */
>  static void
>  tegra241_cmdqv_write_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0, int index,
>                             uint64_t value, unsigned size, Error **errp)
>  {
> +    uint32_t *ptr = tegra241_cmdqv_vintf_ptr(cmdqv, index, offset0);
> +
> +    if (ptr) {
> +        switch (offset0) {
> +        case A_VCMDQ0_CONS_INDX:
> +        case A_VCMDQ0_PROD_INDX:
> +        case A_VCMDQ0_CONFIG:
> +        case A_VCMDQ0_GERRORN:
> +            *ptr = (uint32_t)value;
> +            return;
> +        default:
> +            break;
> +        }
> +    }
> +
>      switch (offset0) {
>      case A_VCMDQ0_CONS_INDX:
>          cmdqv->vcmdq_cons_indx[index] = value;


