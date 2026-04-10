Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDB1E99049
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 07:38:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wB6RJ-0006m7-2O; Fri, 10 Apr 2026 03:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6RH-0006lh-Sb
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:38:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6RG-0008P6-Ch
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775806681;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wm3Z3dD9i60eHVNSqtvD5PEXGwRyTjDM2ghlPebjM4Q=;
 b=KqRLSdgNt8J9I/dFwFuFrb/JwC/LmiJC4E3zWt0x5IQanB6b5i6HQddca57KRj58o2/3xA
 fQERNiLrldkCqAgOBAsN6WDmzgxQb++Uhakeu0f3w4bdeyt5T2RwtWwRZLKKiW2UDTj7xh
 JIVB83huHvW8f3Kt7luEDehjEqz/4rw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-9c3_NN9ZOLya8p28mQHteQ-1; Fri, 10 Apr 2026 03:37:58 -0400
X-MC-Unique: 9c3_NN9ZOLya8p28mQHteQ-1
X-Mimecast-MFC-AGG-ID: 9c3_NN9ZOLya8p28mQHteQ_1775806677
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-488bf01961cso11508165e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 00:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775806677; x=1776411477;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wm3Z3dD9i60eHVNSqtvD5PEXGwRyTjDM2ghlPebjM4Q=;
 b=PsOBwI+ZOrT88r4si+plkfqxrEO9u4tydO7Mu8xDtHtoAfxljtkd7RI0uGcpOW6MSp
 QIs+38BZJMQwj2EPwbrBMhPuAoTSDvzeJNWjef60hkcR0XLO2PrgPi23ZLhhvb7Imrke
 f1XTSSFKlAEDOab7kqhBTLeMwKWKuEo0QgE3pTxqc5xz4bdGYjJLYuM0ZpI07qfl0ebS
 thI5vsbijaWIY84ZHTLnFdIfQ6R48FJo4AhG0oa7tR78MzzvOxHNRseb7Xp7Hdk0dwYF
 /Fl4omWziH9ivDjD/vlW71XdqE9lmChIW0f/09pPegQ/qJodBlYiDogKdAWp7VlfLYqy
 5+aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhm79FvHrziB9ae2AOeLAtCic2OUgRlZjBwAkwV/AMTyJ2KHDW+HeHj25c8Bjxih55YAYu15J9rg==@nongnu.org
X-Gm-Message-State: AOJu0YyZMtwojDbamD+i1ITNdAC1TNOiMza+QwrV3qVvTjmN1kDibz75
 2onjTFZnY1EAWfNEOpSibcdNDJISJmzB6a5yDjnMF4Qq5C7ICxaVeuud1+ym+yopOgW2iiw6ova
 /7CT+0gaoSHthhhsHbWUE6dqd7mvHQPG0r2A79lxDyPYWQ1l+iC75Aw==
X-Gm-Gg: AeBDiest2BaPrRrxM4sx34BzgDLdX4VVCjz8G9cEtNn7hKujpgx9PfRLJ5R7vA/yFeg
 kMr9GjdXwOkiBSGSBYtG+hIHrGk3z1ZQyY+6rSroPOALBtbPySJbBei8BSYL1utTh5mexYEdJDS
 m9tZsU0whEf4gnwcvjZqqqXknh2fzNQeCLn8BZ+zulvdRXK8M4rYg/amYGysZ4PwuYhMOyvY+3x
 1KjCchwGwuzeKUfgFGJ0hHUkY3QrI70sKTaOnL46xOzYD3gmp1tLLmTV01TTpy0Ffs6wLCIuAzd
 ipWmHi5gr45hC97yrehFGzotfb4zgL7um9KOofZDRgI4qC9PCl6JK79y34ytf1TCVrhukOXZT1R
 OPY/2uGaI0QrtfJsuGf513Rn0ByjLHwqByWCXq+z5PBgv4ogFxDfLrWLB2vAZ6kJZfN8x9Q==
X-Received: by 2002:a05:600c:5397:b0:488:b8bc:6a32 with SMTP id
 5b1f17b1804b1-488d68a4765mr26272435e9.23.1775806677118; 
 Fri, 10 Apr 2026 00:37:57 -0700 (PDT)
X-Received: by 2002:a05:600c:5397:b0:488:b8bc:6a32 with SMTP id
 5b1f17b1804b1-488d68a4765mr26271945e9.23.1775806676669; 
 Fri, 10 Apr 2026 00:37:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5d768afsm22455575e9.2.2026.04.10.00.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 00:37:56 -0700 (PDT)
Message-ID: <d68d889f-2257-45ba-87f7-7948ef0da478@redhat.com>
Date: Fri, 10 Apr 2026 09:37:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] hw/arm/smmuv3-accel: Add helper for resolving auto
 parameters
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
References: <20260401010231.4166776-1-nathanc@nvidia.com>
 <20260401010231.4166776-2-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260401010231.4166776-2-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EpSZ85uA8QyFbUeY075Cgo3xJOzQ6-aJgJhzCp9mlHQ_1775806677
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 4/1/26 3:02 AM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Introduce smmuv3_accel_auto_finalise() to resolve properties that are
> set to 'auto' for accelerated SMMUv3. This helper function allows
> properties such as ats, ril, ssidsize, and oas support to be resolved
> from host IOMMU capabilities via IOMMU_GET_HW_INFO.
>
> Auto mode requires at least one cold-plugged device to retrieve and
> finalise these properties. Register a machine_init_done notifier to
> verify this requirement and fail boot if it is not met.
>
> Hot-plugged devices into an accel SMMUv3-associated bus will re-use
> the resolved host values from the initial cold-plug.
>
> Subsequent patches will make use of this helper to resolve 'auto' to
> what is reported by host IOMMU capabilities.
>
> Suggested-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c   | 14 ++++++++++++++
>  hw/arm/smmuv3-accel.h   |  2 ++
>  hw/arm/smmuv3.c         | 20 ++++++++++++++++++++
>  include/hw/arm/smmuv3.h |  2 ++
>  4 files changed, 38 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 65c2f44880..a0146c8d31 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -35,11 +35,25 @@ static int smmuv3_oas_bits(uint32_t oas)
>      return map[oas];
>  }
>  
> +static void smmuv3_accel_auto_finalise(SMMUv3State *s,
> +                                       struct iommu_hw_info_arm_smmuv3 *info) {
> +    SMMUv3AccelState *accel = s->s_accel;
> +
> +    /* Return if no auto for any or finalised already */
> +    if (!accel->auto_mode || accel->auto_finalised) {
> +        return;
> +    }
> +
> +    accel->auto_finalised = true;
> +}
> +
>  static bool
>  smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>                                   struct iommu_hw_info_arm_smmuv3 *info,
>                                   Error **errp)
>  {
> +    smmuv3_accel_auto_finalise(s, info);
> +
>      /* QEMU SMMUv3 supports both linear and 2-level stream tables */
>      if (FIELD_EX32(info->idr[0], IDR0, STLEVEL) !=
>                  FIELD_EX32(s->idr[0], IDR0, STLEVEL)) {
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index dba6c71de5..3c1cd55714 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -26,6 +26,8 @@ typedef struct SMMUv3AccelState {
>      uint32_t bypass_hwpt_id;
>      uint32_t abort_hwpt_id;
>      QLIST_HEAD(, SMMUv3AccelDevice) device_list;
> +    bool auto_mode;
> +    bool auto_finalised;
>  } SMMUv3AccelState;
>  
>  typedef struct SMMUS1Hwpt {
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 7fead1c3cf..09ea08eb18 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -37,6 +37,7 @@
>  #include "smmuv3-accel.h"
>  #include "smmuv3-internal.h"
>  #include "smmu-internal.h"
> +#include "system/system.h"
>  
>  #define PTW_RECORD_FAULT(ptw_info, cfg) (((ptw_info).stage == SMMU_STAGE_1 && \
>                                          (cfg)->record_faults) || \
> @@ -2020,6 +2021,22 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>      return true;
>  }
>  
> +static void smmuv3_machine_done(Notifier *notifier, void *data)
> +{
> +    SMMUv3State *s = container_of(notifier, SMMUv3State, machine_done);
> +    SMMUv3AccelState *accel = s->s_accel;
> +
> +    if (!s->accel) {
> +        return;
> +    }
> +
> +    if (accel->auto_mode && !accel->auto_finalised) {
> +        error_report("arm-smmuv3 accel=on with 'auto' properties requires "
> +                     "at least one cold-plugged VFIO device");
> +        exit(1);
> +    }
> +}
> +
>  static void smmu_realize(DeviceState *d, Error **errp)
>  {
>      SMMUState *sys = ARM_SMMU(d);
> @@ -2058,6 +2075,9 @@ static void smmu_realize(DeviceState *d, Error **errp)
>  
>      smmu_init_irq(s, dev);
>      smmuv3_init_id_regs(s);
> +
> +    s->machine_done.notify = smmuv3_machine_done;
> +    qemu_add_machine_init_done_notifier(&s->machine_done);
you might also register the machine done notifier only in case auto_mode
is set

Eric
>  }
>  
>  static const VMStateDescription vmstate_smmuv3_queue = {
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 82f18eb090..fe0493c1aa 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -74,6 +74,8 @@ struct SMMUv3State {
>      OnOffAuto ats;
>      OasMode oas;
>      SsidSizeMode ssidsize;
> +
> +    Notifier machine_done;
>  };
>  
>  typedef enum {


