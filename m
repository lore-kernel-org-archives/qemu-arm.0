Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ABCD35165
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 17:00:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7yvV-0006IP-PU; Wed, 01 Apr 2026 13:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w7yvT-0006Ga-Dk
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 13:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w7yvR-0007XY-Df
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 13:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775062815;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EKmnO7IGigbhy+//7jRYvCwsmOFKaHL7foYYOImkLKI=;
 b=O6HMi/2lC9TIRdEkg3mKkEq4azEvPD1RZdGe+dolXdYavrrM0wERBWtQ0Oqhu/pRXAzapG
 XeMgkWJKfP9A5WP4QbjdtJvtbLcjnLSEHl3HTmMoApDu179Fq5cf7piuA2M/Jd8VClU9uL
 sMfml7la1u272UHrkR5M12EOrH5ft1Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-xFUD3K2RNNmkdsT6w6wgLQ-1; Wed, 01 Apr 2026 13:00:14 -0400
X-MC-Unique: xFUD3K2RNNmkdsT6w6wgLQ-1
X-Mimecast-MFC-AGG-ID: xFUD3K2RNNmkdsT6w6wgLQ_1775062813
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48887ff8b73so3779855e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 10:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775062813; x=1775667613;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKmnO7IGigbhy+//7jRYvCwsmOFKaHL7foYYOImkLKI=;
 b=YtHMfK0ZPUr3bsANe5mvkzvH8GrkobfV4CQCt+Xa893ZySZy0S0Wl1EDEH6q/tnA2Q
 mWg713hp4HP93u9gMWsDyr78yZX716yWAjHzpNdZ4V8cJrGwckKj4g+SdaVgrbboCDip
 tv+SGuhuCBW9SrMPRxBeCE97us7lGmMaemCBHtgvJAcf984yGYn2sEn8CdMtwiaOQTNA
 heXJyuol5rihioRC6REG/rJF6zyLmCzaZj6Z+xv3IGxyq1Mje9VQjkaS8acd26CCIxah
 3OMFPWatTS25fwHiaTwnjw3BsvwBbEdLZ2KiwrRb1ozsFseRzgA0BoB2cEBMW4AdXkzg
 A9XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV006IEARt1EvS8PVw9C2k52IIXYC+kTKJHSOrhcyb0a+DNelwPq+G86HJluozWVzdhCS8pjZsZYw==@nongnu.org
X-Gm-Message-State: AOJu0YxhMZeIc86P33EfK55fa+aw4Uj8vRJDVknqUjCCU05IXn/YFSvm
 GZQKZGHxMS2hrDl29eQLiOqgk6FRigW9dWUtOpnbpMZOOYSQtFUEqJsJ4+k5IGqwwnd3fwARTIn
 1RUSvanrMN3XpeJRoth1MOkQuMI9F/As+64ndvAv6a01A+BQT6ZPYHw==
X-Gm-Gg: ATEYQzyiaQ5rsCUgjVN3vtbtqF/ni8mFMp0Pczcg22eVZJOG/27IsHKVwMZM5PVGFjw
 jRrX/udKS58zngXdDYGn7QkqSROsxNU9AS7ivJ8YEqXglMgkWMODKRXWQUKMYat1X9EOos8NELC
 6iu0L0um62xXzUQy7zjPKEPrqvA3iClP+CFl+4L0PgoW2H6yszl4nVFQy/Enqru1iUO+IEVIFzU
 zTLmCUbWG9xuQTFJsAbNvFYoPy/M+O7fV69pxurMv4ksbiVLGmD648jifiyrGEn0B+NuZadRpCB
 t6Wz74opOAs1z9OjkzHJIaUfWnNPX8QiXfo7CDkExi9M8AToDfnTok9NxuiXgnnGBHwkOj9Mc5B
 Gt8A+FwjmvcyxhCQI5oNTu9Q5XruA6sZTTMcTX1moBxqqHq52SVyt3YOD4lwf7kr26BRoew==
X-Received: by 2002:a05:600c:4744:b0:486:fc95:1a91 with SMTP id
 5b1f17b1804b1-488835881a1mr68973315e9.12.1775062813186; 
 Wed, 01 Apr 2026 10:00:13 -0700 (PDT)
X-Received: by 2002:a05:600c:4744:b0:486:fc95:1a91 with SMTP id
 5b1f17b1804b1-488835881a1mr68972725e9.12.1775062812680; 
 Wed, 01 Apr 2026 10:00:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a567bfasm26672325e9.0.2026.04.01.10.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 10:00:12 -0700 (PDT)
Message-ID: <ece352d8-d819-4562-b6d6-f761898a3bbf@redhat.com>
Date: Wed, 1 Apr 2026 19:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm/kvm: get demuxed ID registers from kvm
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sebastian Ott <sebott@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>
References: <20260204133229.297061-1-cohuck@redhat.com>
 <20260204133229.297061-4-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260204133229.297061-4-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pqe_l49dnsVxDcCQ53OJ3FbE_Zs8RaCT1Gafq7T47KA_1775062813
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1, RCVD_IN_VALIDITY_RPBL_BLOCKED=1,
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



On 2/4/26 2:32 PM, Cornelia Huck wrote:
> We now have the infrastructure in place to get and save demuxed ID
Here we only get their values? What about the save?
> registers from kvm. Use it to get the values that kvm emulates for
> CCSIDR_EL1.
>
> Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/kvm.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 0828e8b87bac..9ed51969f075 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -243,6 +243,33 @@ static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf,
>      return ret;
>  }
>  
> +static int get_host_cpu_reg_demux(int fd, ARMHostCPUFeatures *ahcf,
> +                                  ARMIDRegisterIdx index, int subindex)
> +{
> +
> +    struct kvm_one_reg one_reg = {
> +        .id = KVM_REG_ARM64 | KVM_REG_SIZE_U32 | KVM_REG_ARM_DEMUX,
> +    };
> +    ARMIDRegisterDemuxIdx demux_index;
> +
> +    switch (index) {
> +    case CCSIDR_EL1_IDX:
> +        if (subindex < 14) {
> +            one_reg.id |= KVM_REG_ARM_DEMUX_ID_CCSIDR | subindex;
> +        } else {
> +            return -EINVAL;
> +        }
> +        demux_index = CCSIDR_EL1_DEMUX_IDX;
> +        break;
> +    default:
> +        return -EINVAL;
> +    }
> +    one_reg.addr = (uintptr_t)&ahcf->isar.idregs_demux[demux_index][subindex];
> +
> +    return ioctl(fd, KVM_GET_ONE_REG, &one_reg);
> +
> +}
> +
>  static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>  {
>      /* Identify the feature bits corresponding to the host CPU, and
> @@ -256,6 +283,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      bool pmu_supported = false;
>      uint64_t features = 0;
>      int err;
> +    int i;
>  
>      /*
>       * target = -1 informs kvm_arm_create_scratch_host_vcpu()
> @@ -416,6 +444,11 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>               */
>              err |= get_host_cpu_reg(fd, ahcf, ID_AA64ZFR0_EL1_IDX);
>          }
> +        /* grab demuxed registers */
> +        for (i = 0; i < 14; i++) {
> +            /* KVM only allows 0..13 */
where is it documented? Maybe add a comment or justification in the
commit msg. Use a define?
> +            err |= get_host_cpu_reg_demux(fd, ahcf, CCSIDR_EL1_IDX, i);
> +        }
>      }
>  
>      kvm_arm_destroy_scratch_host_vcpu(fdarray);
Thanks

Eric


