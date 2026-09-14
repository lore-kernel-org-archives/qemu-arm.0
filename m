Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31124C88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 09:51:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x63Ks-00013R-4X; Mon, 14 Sep 2026 05:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x63Kp-00012b-NN
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:50:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x63Kk-0004EU-Of
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789379441;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7HDP0b/hfgT/6WkN55haVeTscJbVXp5zqLJ+JvZFgjk=;
 b=N0o13XsjhpKvyQ6raAU0uLHMaoyC3+q6w0LXFjvRuJawEGk4MKLqiN4JL79B8nK+PjTnT4
 lHFvqLgBDPMW/PlPE9wLSB1sbjquHLQpFejaaTiZ5zacBlGbcT8GeCNAt6H3gHqdYuxWhO
 M3vKlr2Y5Wwo7iFpHM6+03Mp6sAIqXU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-kRqhCbVPPDakIsueloGz8A-1; Mon, 14 Sep 2026 05:50:40 -0400
X-MC-Unique: kRqhCbVPPDakIsueloGz8A-1
X-Mimecast-MFC-AGG-ID: kRqhCbVPPDakIsueloGz8A_1789379439
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49cd83ca361so28972135e9.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 02:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789379439; x=1789984239;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7HDP0b/hfgT/6WkN55haVeTscJbVXp5zqLJ+JvZFgjk=;
 b=Si8YlVOW/x531+nAEY3GoqjJgtbEePqP/p33QeVdG9rvBejWzbBDFAvNXj+npZoKL5
 uk2FhaSGOakoDwcC8y6TvGNUymuLZ/Kiz76oL8dPfgUd89da7M0DsbMC4sgxT1XVoO3W
 jxptP8lzKfotimbXpG5WSJ67raoKZdORSQKEANfSM3LBhnD1BZxHCDjPHcxmKI29j7Qb
 KZPcVjMOy2tM8dY+NL+CAejmkIc7uKE66xbvSPuzAj1Di8TbA3HI5oHURfPqPGYVO6V4
 pI+SjJLgV8sbqSVMj1ZgbVfGhla03kAziJE50FFyF4QRLMLJXwthKM5x6aIImPFVlb+U
 NRuw==
X-Forwarded-Encrypted: i=1;
 AKwUvByaJIWPW+imXd54E+S2osm2dpeGvBMUNFuPMrb+71gXm7HQBaMnd702zv4REcXBWsp/DkUQ9kjWjA==@nongnu.org
X-Gm-Message-State: AFuF++kDH2xjalE66fTonwBQ8WMtpIefToxYb0ataE5CWh0iH8bd8zWb
 fw42tAQ7w4XnXZDbBCdoq1gCut95tC/P7a35wY8XxKE6DE1tGjrIWhY7B2Knce2WXC1xod+GQ71
 liE+OX+rg5MQzkQPTZZl+PvBjDcWIu+PW95Hj2v3pfx/Ja5W4Z4p3+w==
X-Gm-Gg: AYBFou3wYEDZsrQPqS5eGlGqP+zmkn0N7HOXjXhZ2vmk3Y0bkUfeDhrszZirnhQQ9mK
 GuaShmCJZIjPH16OUtN4gwtrMPUqW+LAg+48+LfsW/hNBKpLR4hTxuiQm+znn7M1rFjZgmL0X1E
 Rk3A/hikk75kGwvh58ipDvLhPGkC28PDlLw+WCDrhR3AhOItS9SP2jhFo/hy0S6ab3aA1JMPhGT
 NLRXgdjEiB2BG4YMI/Gf4Y7O1CkQNnXXfYM9LAu3/PrF25VH5SEpGyXwfgWkj/SWDQdd2nYWv54
 gxZfNLgdMNisb/4F+G55ZuTal6TRNsGNDMF15mWhXiKMZ6pyDJ0PNumQ7jsfqYCZjg4Xv566JIt
 E0cNCrtz8hLD3PtNE0Ama+z7q/djiG5xEKQGDzs4Gj1wCa5GQ
X-Received: by 2002:a05:600c:a00b:b0:499:900c:9c69 with SMTP id
 5b1f17b1804b1-49e7a6626d0mr21781115e9.9.1789379439300; 
 Mon, 14 Sep 2026 02:50:39 -0700 (PDT)
X-Received: by 2002:a05:600c:a00b:b0:499:900c:9c69 with SMTP id
 5b1f17b1804b1-49e7a6626d0mr21780835e9.9.1789379438878; 
 Mon, 14 Sep 2026 02:50:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e636f7fa2sm306163015e9.15.2026.09.14.02.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 02:50:38 -0700 (PDT)
Message-ID: <005af326-6624-44fa-9713-75ef2d5076fd@redhat.com>
Date: Mon, 14 Sep 2026 11:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] hw/arm/smmuv3-accel: Drain the vEVENTQ when the
 VM stops
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jan@nvidia.com, jgg@ziepe.ca, ankita@nvidia.com,
 aniketa@nvidia.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com
References: <20260904180513.248396-1-skolothumtho@nvidia.com>
 <20260904180513.248396-3-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260904180513.248396-3-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -vdTHGcSMhZQTPRxODfyHYbR2TCg9BB2OMcTcJOd0zI_1789379439
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Fault events sit in the kernel vEVENTQ until smmuv3_accel_event_read()
> moves them into the emulated event queue. The vEVENTQ is an iommufd object
> that is not migrated, so anything left in it when the source stops is lost.
>
> Drain it from a VM state change handler, which runs before any state is
> saved. Propagating an event writes the record into guest RAM and raises the
> event queue interrupt, and both guest RAM and the GIC are saved before the
> SMMUv3 device state. A pre_save hook would run after both, hence using
> qemu_add_vm_change_state_handler().
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index fc503578f5..73509dbd8d 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -18,6 +18,7 @@
>  
>  #include "smmuv3-internal.h"
>  #include "smmuv3-accel.h"
> +#include "system/runstate.h"
>  #include "system/system.h"
>  #include "tegra241-cmdqv.h"
>  
> @@ -518,6 +519,37 @@ static void smmuv3_accel_event_read(void *opaque)
>      }
>  }
>  
> +/*
> + * Drain the kernel vEVENTQ into the guest event queue whenever the VM stops,
> + * so that a migration does not strand events in an object it does not carry.
> + * Propagating an event writes the record into guest RAM and raises the event
> + * queue interrupt, both of which are saved before the SMMUv3 device state, so
> + * a pre_save hook would be too late for either.
I prefered the description in the commit msg: 

"and both guest RAM and the GIC are saved before the
SMMUv3 device state" which sounds clearer to me.. A pre_save hook would run after both
, which would be too late hence the choice of this VM state change handler.



> + *
> + * VFIO registers at a higher priority and the stop path runs in descending
> + * priority, so the devices are already in STOP by the time this runs.
> + */
> +static void smmuv3_accel_vm_state_change(void *opaque, bool running,
> +                                         RunState state)
> +{
> +    SMMUv3State *s = opaque;
> +    SMMUv3AccelState *accel = s->s_accel;
> +    Error *local_err = NULL;
> +    int ret;
> +
> +    if (running || !accel || !accel->veventq) {
> +        return;
> +    }
> +
> +    do {
> +        ret = smmuv3_accel_event_read_one(s, &local_err);
> +    } while (!ret);
> +
> +    if (ret < 0) {
> +        warn_report_err(local_err);
> +    }
> +}
> +
>  static void smmuv3_accel_free_veventq(SMMUv3AccelState *accel)
>  {
>      IOMMUFDVeventq *veventq = accel->veventq;
> @@ -1146,5 +1178,8 @@ bool smmuv3_accel_init(SMMUv3State *s, Error **errp)
>          qemu_add_machine_init_done_notifier(&s->machine_done);
>      }
>  
> +    /* For migartion of vEVENTQ pending events */
migration
> +    qemu_add_vm_change_state_handler(smmuv3_accel_vm_state_change, s);
> +
>      return true;
>  }
Otherwise looks good to me
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


