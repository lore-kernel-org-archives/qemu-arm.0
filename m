Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA7AC88E75
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 12:34:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6SMl-0002ZF-90; Tue, 15 Sep 2026 08:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x6SMj-0002Yr-R7
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 08:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x6SMg-0007Gg-Qf
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 08:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789475661;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWJmOsrwL8Vk7iqPzOJZ0vFL5sn2e8tdYQhQYPbSGMU=;
 b=g0TGMYShFMDcZKnadTh1wy6YeBAkej6IU6xpUfs2DYrARIMljVdF5ZTQFJHftAw+5q+TJG
 5XQ+pZAE9FPeznibP7oI4LqsG/iIuzx/Q+sT80KOTxgW/cmsGWPv+GJbeBAnxJ6sVhcGLm
 7xaFbxmNaTZma3YM2escwlsSWU0DClU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-C51pz8CvOHuaYCls5hVWsA-1; Tue, 15 Sep 2026 08:34:20 -0400
X-MC-Unique: C51pz8CvOHuaYCls5hVWsA-1
X-Mimecast-MFC-AGG-ID: C51pz8CvOHuaYCls5hVWsA_1789475659
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-495689bfcc8so36263575e9.1
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 05:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789475659; x=1790080459;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OWJmOsrwL8Vk7iqPzOJZ0vFL5sn2e8tdYQhQYPbSGMU=;
 b=GHLmc8/rYK+g4lE1vSU0ofIMRxz/+vuKoxrPODp+BGoeW7YIXCqIT54OwfvIlcFYgL
 eX2kEdlzMGojOEUa8MtrTNMPGw0ExkAghNFIvZ+jD5IS+yoYJ7/4AfVvFLnOHtLaXwSt
 SQ+AQooPmHHLqDcdlDdOAKCbc27HifPKb+Fa33TJOYkmAFf1gZvA1g6R55TJFWdsKyam
 QW6JDYDqh3RnxniAAyN+iUHCihMYsKxRTH5Dho0BgQRCkDvDU9dSqPz4WwyXCLhTUpAO
 vK7C0f1ZKtXMNEOn86Nk2o7bt8izUCWAygLPFV4nlMTdA2Vg5m7lyy93nGCMblbMCzzp
 ejWg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxjSCOD237C98bq9J0M9r9T+J3FE/D0z2QILS2A3Y0ZmVnwrM/gMbW2S7KTheDgrVIusG6Qrc9w1A==@nongnu.org
X-Gm-Message-State: AFuF++klUfxoHmLTbQJP9jHCAlIo+waWTYI64wVXmbo7FV8l2AOClgrA
 BVp4n8VzSDxH5wJgxg9HFG1fhtofJMX0Zn/TkvpohjyVFqH1hcup3WFPqUKEb/SZLebz/Vr0uLI
 di+vAUZu84Zhzzr20FcTGkReRpYvwvC1l+niZG9hFQN4kZZhC8VNvlA==
X-Gm-Gg: AYBFou1ez2OLoINgVeFpKpGOvEqJptVDXHscYpfhqNC7ckSuKNY/rYoR+4RWKBPrzf8
 joB/LPy6a9p+5FCp3Do1Plsd0KAjhNoyoUVTeh+tl/Y1EIxvegRGnkLdYxdqOlJ28VV2aRCLMdt
 DjAps4UZzQEUnBwjr4OG3HWkhOKqP217zVaQwSVevfrs/zU7HrEYkDc/XvZrDjASAJyhXkDUBXB
 KvR2srL5FkjXEYsUDKYF3dWOLEGdAcLwUTb3mdwJm+vM89GGAiVkFNlj6U22OUKU/2wQ7TSTvoU
 PdzSnsAkHVfd8ILrNpmE9EtIXeqlJnoXjzKU9lgZN3BHUqXmj2aaND71QjwxviIQpvUwdO7vBUz
 OQ+9cmZNzDJrrh3w2ginJX+Op67qCS+gHfDC2V7tLhxZACFaV
X-Received: by 2002:a05:600c:6298:b0:49c:de80:b833 with SMTP id
 5b1f17b1804b1-49e7a65c182mr76824395e9.2.1789475659228; 
 Tue, 15 Sep 2026 05:34:19 -0700 (PDT)
X-Received: by 2002:a05:600c:6298:b0:49c:de80:b833 with SMTP id
 5b1f17b1804b1-49e7a65c182mr76823965e9.2.1789475658724; 
 Tue, 15 Sep 2026 05:34:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb33fd3bsm35304221f8f.19.2026.09.15.05.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 05:34:17 -0700 (PDT)
Message-ID: <d5385eac-ae6f-4c55-8cdc-0571efac64d3@redhat.com>
Date: Tue, 15 Sep 2026 14:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] hw/arm/smmuv3: Migrate the accelerator feature set
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jan@nvidia.com, jgg@ziepe.ca, ankita@nvidia.com,
 aniketa@nvidia.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com
References: <20260904180513.248396-1-skolothumtho@nvidia.com>
 <20260904180513.248396-4-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260904180513.248396-4-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xM6kY9PcnQ_HTG9r-l9r0R5GC44Wf09PIE8q_SJ_8ec_1789475659
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Shameer,

On 9/4/26 8:05 PM, Shameer Kolothum wrote:
> Add a subsection carrying idr[0] to idr[5], needed when accel=on. pre_load
I would explain what you try to achieve before the how.
> saves the locally resolved values and post_load fails the migration if the
> incoming ones differ. Accepting the source values would leave QEMU
> advertising features the destination host cannot provide.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.h       |  1 +
>  include/hw/arm/smmuv3.h     |  7 ++++-
>  hw/arm/smmuv3-accel-stubs.c | 12 ++++++++
>  hw/arm/smmuv3-accel.c       | 58 +++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3.c             |  1 +
>  5 files changed, 78 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index ea11d513cc..a91d188d61 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -99,6 +99,7 @@ void smmuv3_accel_idr_override(SMMUv3State *s);
>  bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp);
>  int smmuv3_accel_event_read_validate(IOMMUFDVeventq *veventq, uint32_t type,
>                                       void *buf, size_t size, Error **errp);
> +extern const VMStateDescription vmstate_smmuv3_accel;
>  void smmuv3_accel_reset(SMMUv3State *s);
>  SMMUv3AccelCmdqvType smmuv3_accel_cmdqv_type(Object *obj);
>  
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index d39fe8850b..9e0836b81a 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -26,6 +26,9 @@
>  
>  #define TYPE_SMMUV3_IOMMU_MEMORY_REGION "smmuv3-iommu-memory-region"
>  
> +/* Number of IDR registers, IDR0 to IDR5 */
> +#define SMMU_NUM_IDR 6
> +
>  typedef struct SMMUQueue {
>       uint64_t base; /* base register */
>       uint32_t prod;
> @@ -41,7 +44,9 @@ struct SMMUv3State {
>      uint8_t sid_size;
>      uint8_t sid_split;
>  
> -    uint32_t idr[6];
> +    uint32_t idr[SMMU_NUM_IDR];
> +    /* Locally resolved IDRs, saved by pre_load for post_load to check */
> +    uint32_t local_idr[SMMU_NUM_IDR];
>      uint32_t iidr;
>      uint32_t aidr;
>      uint32_t cr[3];
> diff --git a/hw/arm/smmuv3-accel-stubs.c b/hw/arm/smmuv3-accel-stubs.c
> index b8dd7e7b89..b57b5c01e7 100644
> --- a/hw/arm/smmuv3-accel-stubs.c
> +++ b/hw/arm/smmuv3-accel-stubs.c
> @@ -8,6 +8,7 @@
>  #include "qapi/error.h"
>  #include "hw/arm/smmuv3.h"
>  #include "hw/arm/smmuv3-accel.h"
> +#include "migration/vmstate.h"
>  
>  bool smmuv3_accel_init(SMMUv3State *s, Error **errp)
>  {
> @@ -53,6 +54,17 @@ int smmuv3_accel_event_read_validate(IOMMUFDVeventq *veventq, uint32_t type,
>      return 0;
>  }
>  
> +static bool smmuv3_accel_vmstate_needed(void *opaque)
> +{
> +    return false;
> +}
> +
> +const VMStateDescription vmstate_smmuv3_accel = {
> +    .name = "smmuv3/accel",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = smmuv3_accel_vmstate_needed,
> +};
>  
>  void smmuv3_accel_reset(SMMUv3State *s)
>  {
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 73509dbd8d..287ea91fbe 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -18,6 +18,7 @@
>  
>  #include "smmuv3-internal.h"
>  #include "smmuv3-accel.h"
> +#include "migration/vmstate.h"
>  #include "system/runstate.h"
>  #include "system/system.h"
>  #include "tegra241-cmdqv.h"
> @@ -1096,6 +1097,63 @@ bool smmuv3_accel_attach_gbpa_hwpt(SMMUv3State *s, Error **errp)
>      return all_ok;
>  }
>  
> +static bool smmuv3_accel_vmstate_pre_load(void *opaque, Error **errp)
> +{
> +    SMMUv3State *s = opaque;
> +
> +    if (!s->s_accel) {
> +        error_setg(errp, "Incoming stream carries SMMUv3 accelerator state "
> +                   "but this arm-smmuv3 has accel=off");
> +        return false;
> +    }
> +
> +    /* Save the locally resolved IDRs before the stream overwrites them. */
> +    memcpy(s->local_idr, s->idr, sizeof(s->idr));
> +    return true;
> +}
> +
> +static bool smmuv3_accel_vmstate_post_load(void *opaque, int version_id,
> +                                           Error **errp)
> +{
> +    ERRP_GUARD();
> +    SMMUv3State *s = opaque;
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->idr); i++) {
> +        if (s->idr[i] == s->local_idr[i]) {
> +            continue;
> +        }
> +        error_setg(errp, "SMMUv3 IDR%d mismatch: source 0x%08x, "
> +                   "destination 0x%08x", i, s->idr[i],
> +                   s->local_idr[i]);
> +        error_append_hint(errp, "ril, ats, oas and ssidsize must resolve to "
> +                          "the same values on source and destination.\n");
don't you want to be more precise then and just check the corresponding
fields?


> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static bool smmuv3_accel_vmstate_needed(void *opaque)
> +{
> +    SMMUv3State *s = opaque;
> +
> +    return s->accel;
> +}
> +
> +const VMStateDescription vmstate_smmuv3_accel = {
> +    .name = "smmuv3/accel",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = smmuv3_accel_vmstate_needed,
> +    .pre_load_errp = smmuv3_accel_vmstate_pre_load,
> +    .post_load_errp = smmuv3_accel_vmstate_post_load,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(idr, SMMUv3State, SMMU_NUM_IDR),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  void smmuv3_accel_reset(SMMUv3State *s)
>  {
>      SMMUv3AccelState *accel = s->s_accel;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ed19536a4d..66d95e1076 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2137,6 +2137,7 @@ static const VMStateDescription vmstate_smmuv3 = {
>      },
>      .subsections = (const VMStateDescription * const []) {
>          &vmstate_gbpa,
> +        &vmstate_smmuv3_accel,
>          NULL
>      }
>  };
Thanks

Eric


