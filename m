Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3D6C44536
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Jul 2026 12:33:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmW7z-0005E0-97; Wed, 22 Jul 2026 08:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wmW7y-0005Dj-1e
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 08:32:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wmW7v-0007fr-Ur
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 08:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784723561;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i7gqBLmiNP/G2NWV47w7HHLvruXwNX+UfAId5Ty/suA=;
 b=FV5BZTQFZTondBIpVPVCsICKbNlI72jaT31vMHZeUbgxauM+9ygGFSHS5ERtxr1W//OH3J
 G2IENpHZzQoaayZ+wwYkA05c3u4DmhSN6xAe+YFkdBUV1wD/zOc1UhnAooU8VdX86hyNRk
 gaMuUcmqiYvGEXtF7BFJ4WyNtdNR7iI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-omvm_ZheNGa6wqF3Zm58MA-1; Wed, 22 Jul 2026 08:32:39 -0400
X-MC-Unique: omvm_ZheNGa6wqF3Zm58MA-1
X-Mimecast-MFC-AGG-ID: omvm_ZheNGa6wqF3Zm58MA_1784723558
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-495529a93f9so29637405e9.3
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 05:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784723558; x=1785328358;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=i7gqBLmiNP/G2NWV47w7HHLvruXwNX+UfAId5Ty/suA=;
 b=o9GbGhHrbp6OtO15hrVXUy+sSHNGZy4ajRFAU2hRF4lI7haPiZLifg+w7CSqfOaH6Z
 i/S8Nllni5m6gMtHup0nT5tYto4DThgZzTHab7UsfysdpXNFVKTRjaaaxVYsRrD12nMm
 +RAuC6GcB0lYq7ck9gp4W1F4vhEm6FtzzgpkmDtpfoRBIlE3ktF75v24VuehApNP+wMD
 PtTyqGFp7j1Oa7SW1Ot+G8Ma2dc6FU1uZZU484zG5qzNwIXlW3Xk8MbThnCyA3ZBTpa7
 7vhM+Uz3y7pqy9WiNGB7tJcALhe+2GZ2o6yjmygpq6QAGtBN0Zx8ICVBAYY2tq8q6xr7
 ujOw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoEtz4iUsK0ePCJ7eENcAgAgvxezyfpcq6NaUCDjh/jtATyj2c3Uw4Kn9BqOkSphOshlVxz2KYDgQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxe7S+NDu7ecBi7Ndg/OvDwW5kvRHoQy5BayPnsT5UyrmZWi7p5
 ryWV5S6lt6GacuxHC5xe2PnZXymLkKckYG+qZyKa6QDp2N26u9CQGhbS4xpbTQsyyIjO+fval6D
 kMk7FwWBxXep12sRJWjFHoPHK1eu7WaEoJpFA+MnsTiC1KWSDwB0PBQ==
X-Gm-Gg: AR+sD11Ec5eZc0CSErZee7A90Z8rSYRMNzPsprrNiFsxpxCOdv/N0O/+df8CuFgWb4g
 PMXk4Raa/A80qIbX1tsGatzrgB7ddUcyPHpzsWMmkUhOIVXbruXS/sQRWUpQoEGaMbZzOFcI/xR
 jtwbJJnKQTaoV7OEVfseBBeMV4RHO7w4ZL969PMU9c89FBdAto/y/3xAu3zOSGMTBtWMjjrub3w
 rRySxgMmYV//8tQTIz18h5phKFMM4lv8hBvz6orBCCTGcZFJT2o90LXwVx/5hPbopkPHeBz7CQL
 0ruL61QOXkdjfqKgkbKEA70XJpnLEMxNwI50VY/LEyvjFZ09nhIr5ad/YUF1eb3kb0O2ceLix75
 fbBbQjIIM4Rd7z1M/wcQpvJQwxozJb5i+PAg6ybXtejtjL7to
X-Received: by 2002:a05:600c:19c8:b0:495:6134:6d61 with SMTP id
 5b1f17b1804b1-4956202554emr129779215e9.19.1784723558347; 
 Wed, 22 Jul 2026 05:32:38 -0700 (PDT)
X-Received: by 2002:a05:600c:19c8:b0:495:6134:6d61 with SMTP id
 5b1f17b1804b1-4956202554emr129778605e9.19.1784723557861; 
 Wed, 22 Jul 2026 05:32:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bd850asm5598955f8f.15.2026.07.22.05.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 05:32:36 -0700 (PDT)
Message-ID: <134decf2-a084-4cba-8536-a59ecbd6b420@redhat.com>
Date: Wed, 22 Jul 2026 14:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 07/19] target/arm/kvm: handle special ID registers
 cases when reading from KVM
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 prerna.saxena@nutanix.com
References: <20260716213858.609699-1-khushit.shah@nutanix.com>
 <20260716213858.609699-8-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260716213858.609699-8-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uS1b7osh1Zn-3dfCnNJDrSyk38J27csq46n7BDsA-Jw_1784723558
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Khushit,

On 7/16/26 11:38 PM, Khushit Shah wrote:
> The generic KVM_GET_ONE_REG loop cannot correctly read a handful of
> ID registers, so specially handle those:
>
> - DCZID_EL0: No fine grain trap exists, hence not tracked by KVM.
>   It is EL0-readable and untrapped, so read it directly with MRS.
>
> - CCSIDR_EL1/CCSIDR2_EL1: not plain ID registers, their value is
>   selected by CSSELR_EL1. KVM only exposes them via the DEMUX API
>   (KVM_REG_ARM_DEMUX_ID_CCSIDR), so there is no single value to read
>   here. Skip them.
>
> - SMIDR_EL1: KVM does not support SME, so there is no meaningful host
>   value. Skip it.
>
> - GMID_EL1: not in KVM's sys_reg_descs[] and, being an EL1 register,
>   cannot be read from userspace via MRS either. The guest reads the
>   raw host value; this is a genuine miss when MTE is enabled.
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  target/arm/kvm.c | 53 ++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 44 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 42ff731f6e..6974e5c551 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -311,15 +311,50 @@ static int get_host_cpu_idregs(int fd, ARMHostCPUFeatures *ahcf)
>          int ret;
>  
>          reg = &ahcf->isar.idregs[i];
> -        ret = read_sys_reg64(fd, reg, idregs_sysreg_to_kvm_reg(sysreg));
> -        if (ret) {
> -            if (errno == ENOENT) {
> -                warn_report("%s error reading value of host %s register "
> -                                "(ENOENT)", __func__, sysregdesc->name);
> -            } else {
> -                error_report("%s error reading value of host %s register"
> -                            " (%m)", __func__, sysregdesc->name);
> -                err = ret;
> +        switch (i) {
> +        case DCZID_EL0_IDX:
> +            /*
> +             * DCZID_EL0 is not in KVM's sys_reg_descs[], so
> +             * KVM_GET_ONE_REG will fail. Read it directly from
> +             * hardware since KVM doesn't trap guest reads of it.
> +             */
> +            asm volatile("mrs %0, DCZID_EL0" : "=r" (*reg));
> +            break;
> +        case CCSIDR_EL1_IDX:
> +        case CCSIDR2_EL1_IDX:
> +            /*
> +             * CCSIDR_EL1 is not a plain ID register: the value it
> +             * returns is selected by CSSELR_EL1, so there is no single
> +             * value to capture here. It is exposed to userspace only via
> +             * the DEMUX API (KVM_REG_ARM_DEMUX_ID_CCSIDR), indexed by
> +             * CSSELR. Skip reading it here as there is no meaningful host
> +             * value to read.
> +             */
I think you should rely on prerequisite
[PATCH v4 3/3] arm/kvm: get demuxed ID registers from kvm


> +            break;
> +        case SMIDR_EL1_IDX:
> +            /*
> +             * As SME is not yet supported by KVM, ignore reading SMIDR_EL1
> +             */
> +             break;
> +        case GMID_EL1_IDX:
> +            /*
> +             * GMID_EL1 is not in KVM's sys_reg_descs[] and guest reads
> +             * the raw host value. But as it is an EL1 register, we cannot
> +             * read it directly. This is a genuine miss when MTE is
> +             * enabled for the guest.
> +             */
> +            break;
> +        default:
> +            ret = read_sys_reg64(fd, reg, idregs_sysreg_to_kvm_reg(sysreg));
> +            if (ret) {
> +                if (errno == ENOENT) {
> +                    warn_report("%s error reading value of host %s register "
> +                                    "(ENOENT)", __func__, sysregdesc->name);
trace point
> +                } else {
> +                    error_report("%s error reading value of host %s register"
> +                                " (%m)", __func__, sysregdesc->name);
> +                    err = ret;
> +                }
>              }
>          }
>          trace_get_host_cpu_idregs(sysregdesc->name, *reg);
Thanks

Eric


