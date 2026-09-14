Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C9BC88E50
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 09:54:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x63Nr-0001W1-7z; Mon, 14 Sep 2026 05:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x63Np-0001VN-25
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x63Nm-0004yo-JF
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789379629;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dELGJhrHKBVrhI5nHM5smk9mInIrLdrlsuHiFocrFJs=;
 b=UTr6AYv+hwCDzSDYkRZFO08C5+AuMBcM57uqJYZxxRO56XiONZiKM+d/D1tJoUH2bbqUzw
 cMyQo0ACVvpe3VNoPjxaOYlrb4eeNyfMLD5DmcebBINjW/7eQ6e9jD5y+kRYUwzDv3JCvG
 l/DDRgwu/mOPsHWArCCRuYlP9lc1R2I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-m6TPMYI3Pz-YayLqFxpbHw-1; Mon, 14 Sep 2026 05:53:48 -0400
X-MC-Unique: m6TPMYI3Pz-YayLqFxpbHw-1
X-Mimecast-MFC-AGG-ID: m6TPMYI3Pz-YayLqFxpbHw_1789379627
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48597bbd963so2519236f8f.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 02:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789379627; x=1789984427;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dELGJhrHKBVrhI5nHM5smk9mInIrLdrlsuHiFocrFJs=;
 b=sBQ4jJrxi4NFhNb7zXnE5TM7Z1K5uSP0mYINPMsD7j1BjdAtwamt9dVYDa4LbSQwNG
 lW9Ku24o2Izc+/nNIPiwhFlhjqsvphTKrSDUb4tTx1Xy9fDItdQ3smyHHissKrT86uI8
 d/Gw7swKz389vlmCVh4ztAtWl91X+EnTRrPCq5YhQW4Ot/8BJQMR9/DdNoW/6BqdR+tR
 6IhwioExtX4GExvLXilAfIfjHj8K8qUF+fWh5UmB25CzYyW6RgbX6A6gyU3VAlVTSJL7
 uSFJMNHoD2nlD586NVg4Nf2FrCjvReNS+5zr8BIiK5oikRqyavnsi0qJiSPFc0UDmGI3
 vXjg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzrt3zLg9YU3jGYBNBahDqT0E0IQgxHB8cbmrV8kRM12dDwwdhNdC5ssiotznhiHJebjse9XpRNBQ==@nongnu.org
X-Gm-Message-State: AFuF++lvOVKDJKw9xtcg4R1FAwT9ZhNFghPAJwbqKmEkfbLSsGqkVbY8
 2LUTlUj7A51AL2FKcITrDwmSQwGjHoiyhwYygv2FqQ7QcLj1du2PX0mpdoR/upj/JbqSdzGOwxB
 fY9hnTCCLcePmuFQelWt2ItW3s56W2aR838fg5BrL0gJp+uX2826dIQ==
X-Gm-Gg: AYBFou0EpOVPyaL334Fi3fEt81lTyj1E3nt6ZqWAbKefrXTaIo7i+p47RtsqIdoOHSl
 UiueEaMBroSVW0zEUtpkyrYHpIJrpnf58UUtqAE8rNWWqp5SJ+MFztVm8nU3qrs0qu0Yp5RGqv4
 ezV8mLpp5kTzn/u8qqBEyTBi7x2JkOb8W+2Vr4bl1ixigkMBmRrvvZwKMDf3jRo7rjdc+ZQlGLp
 2C+NuODxD5V0yUsNPktao8ViOnP5MAehR+ALOjY0YBYD79Z3DuicBFOG0g47+1+4sLpkw4QuImv
 GBah9zfTXHGC4FVo6E1FL61Kkyszln0l1t7XAWQbBKPOAWX+ImrX4QNIAz//lPuPYI8x4hDhbv5
 hmk9sQe8RawXna7EY8zxbnTx3vZs4x9c/w94w/8kkQX8YW3C7
X-Received: by 2002:a5d:6f1c:0:b0:486:e738:323b with SMTP id
 ffacd0b85a97d-48702a11c08mr3653844f8f.0.1789379626891; 
 Mon, 14 Sep 2026 02:53:46 -0700 (PDT)
X-Received: by 2002:a5d:6f1c:0:b0:486:e738:323b with SMTP id
 ffacd0b85a97d-48702a11c08mr3653798f8f.0.1789379626510; 
 Mon, 14 Sep 2026 02:53:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb2ecf2esm25914166f8f.2.2026.09.14.02.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 02:53:45 -0700 (PDT)
Message-ID: <4fe54219-7496-48b9-8d14-d67241e0ce06@redhat.com>
Date: Mon, 14 Sep 2026 11:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/7] hw/arm/smmuv3: Support migration with accel=on
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jan@nvidia.com, jgg@ziepe.ca, ankita@nvidia.com,
 aniketa@nvidia.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com
References: <20260904180513.248396-1-skolothumtho@nvidia.com>
 <20260904180513.248396-8-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260904180513.248396-8-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YtW9VyiLCMEKJfB2Tz16h52q8AZqDTSF33bnyWtMr80_1789379627
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 9/4/26 8:05 PM, Shameer Kolothum wrote:
> With the restore path in place, allow migration of an accelerated SMMUv3.
>
> Replace the blocker installed unconditionally at realize with one scoped to
> CMDQV, installed where CMDQV is actually selected.
>
> CMDQV migration support is not enabled now.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3-accel.c | 11 +++++++++++
>  hw/arm/smmuv3.c       |  5 -----
>  2 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 3f83b505d0..5456fd0ae2 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -18,6 +18,7 @@
>  
>  #include "smmuv3-internal.h"
>  #include "smmuv3-accel.h"
> +#include "migration/blocker.h"
>  #include "migration/vmstate.h"
>  #include "system/runstate.h"
>  #include "system/system.h"
> @@ -801,6 +802,16 @@ smmuv3_accel_select_cmdqv(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>          return false;
>      }
>      s->s_accel->cmdqv_ops = ops;
> +
> +    /* No support for CMDQV migration for now */
> +    if (ops) {
> +        error_setg(&s->migration_blocker,
> +                   "Migration is not supported with SMMUv3 CMDQV enabled");
> +        if (migrate_add_blocker(&s->migration_blocker, errp) < 0) {
> +            return false;
> +        }
> +    }
> +
>      return true;
>  }
>  
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 66d95e1076..8e8ca341c9 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2047,11 +2047,6 @@ static void smmu_realize(DeviceState *d, Error **errp)
>          if (!smmuv3_accel_init(s, errp)) {
>              return;
>          }
> -        error_setg(&s->migration_blocker, "Migration not supported with SMMUv3 "
> -                   "accelerator mode enabled");
> -        if (migrate_add_blocker(&s->migration_blocker, errp) < 0) {
> -            return;
> -        }
>      }
>  
>      c->parent_realize(d, &local_err);


