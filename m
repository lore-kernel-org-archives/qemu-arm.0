Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp447584njd;
        Fri, 18 Apr 2025 13:35:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbD46uX/uye/+mTfBNNuwGbrGdJp5IfOpDt9SGsZzNPXEHTrVvsREsYWFHHUya1E9viTFvH8sMmr8zlA==@linaro.org
X-Google-Smtp-Source: AGHT+IHkdydUGBMAgsGheQPGgsrSildKeNef2+8M7I/NjzkHvZuwgYZvaIo2mB40MGn41MMAL6Pf
X-Received: by 2002:a05:622a:180c:b0:474:f97d:51c7 with SMTP id d75a77b69052e-47aec393d6amr71134491cf.14.1745008545184;
        Fri, 18 Apr 2025 13:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745008545; cv=none;
        d=google.com; s=arc-20240605;
        b=AIoO/mFhIowgYUCcVAQ3LJr1n+mAyjOY2sxU/6ZJMUHzF5yyxJWrrpox0aIukxgn74
         5uhItiMNWTJfH5h9DSrJPugmfrbPRhAkLJT8KfwgzXRwsdIpnFNwW5WZRXd7L/KKQgVu
         tbOl59naHOMJMD611HRsOqDwRuDAuc1F5Lj3Afxi7/JxEipdlNB6lSfbdaArvPGckdi8
         bGy/o06QPDRPfiBAdxg3NuzvYKvvki4TlqhSmCqgM9LEgzpPB/MqV8NoWC5t1idB17QM
         xTZKvNdnG7VgjORWOziES+KIljXXYHLcwXHyT2FlcCK7wnFaG4HTn2fwAgI30vC35DCd
         TrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Kk3cV3UijaEe7EB236qxyo+vcuIpCMpVi5mj4bditmw=;
        fh=+woXrfDEcHjEulISn6gdcRIxS1z2B/ztb9XSnXPO3iM=;
        b=d18msqg/oU9R9iX1LhvC0urclPjyzEVH0IcvgbOkUuHHS3Xq7E5E4GSE+XR9Mda8KI
         GxQq54ZEoKBDPO22nRvPwiGvBTUOrseoG4GDl3T+Q02jR+9zAGWEHsREpBdIyBCUg+XE
         vB84adFAiYxXFyt/SG5mwXQ24XDUrEXiZeBft1DvDNBPoLW9A/Yo2bZJkZ6DuQ/kyQ7c
         mZSTPDwPzEtpop0S5VSOhtp3vBs3rhdv/R6IQRU+Gw4Eo7gKTqgKzoRTxIqXQKbQlCh8
         dGuCQLdH2FT77wH8KF+JHVTqupC16Md5MheoIPqBSEo9wJx0NwuBuPPbFL17aWnPMYuu
         71eA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QN2aRqyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9cb6ed2si29235401cf.370.2025.04.18.13.35.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Apr 2025 13:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QN2aRqyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5sQX-0006Mf-LX; Fri, 18 Apr 2025 16:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1u5sQV-0006Lv-Ch
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 16:35:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1u5sQS-0006lt-K4
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 16:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745008503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kk3cV3UijaEe7EB236qxyo+vcuIpCMpVi5mj4bditmw=;
 b=QN2aRqyXf8RsgJuWMcQsDuuAldu46TvS6+faYSElLeXkwZpcp1mmmCIlRof0FYNjjpeCn/
 X7MTgYSxzoUSoVtx94+fCHvgHmWzD1nzWg4jYR5mDSnvbgVI75WsjOIJ+nIRG8DY1yn1Us
 x45HIEdCOnh2vjVJkp4Dy6FYgJrk8xw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-DJiWKeEJMumcaQbSfroXOw-1; Fri, 18 Apr 2025 16:35:00 -0400
X-MC-Unique: DJiWKeEJMumcaQbSfroXOw-1
X-Mimecast-MFC-AGG-ID: DJiWKeEJMumcaQbSfroXOw_1745008500
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4770cbdb9c7so49577331cf.1
 for <qemu-arm@nongnu.org>; Fri, 18 Apr 2025 13:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745008500; x=1745613300;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kk3cV3UijaEe7EB236qxyo+vcuIpCMpVi5mj4bditmw=;
 b=KGciykZVfeRwBwmrl9ru2xxRnULVFO/g0kGqEk6zNZJggtHBhYxYfHn2GdaEVUa68l
 SY1VD/8Nc3Iyt8uMpR2iDiDogmdQWeNfP0AeeFYjD05+81aIr4oRQCS/0H/akSY7667w
 n80W4Df1WWMrGypb6sNWGR+3a8NJxNHNdlURHvXJrIvHkaheibO1y+3zNo7YfIoj2gdb
 iM4PjIDAQw0gPK1ZG/QOSl80blldG05/gSDDV8bwydQHN4kou8K9FR3WzeLf1eoYgkJd
 A3FnYWgrQjbCKNTCnUX53vH+sSpY8KqWXJTfqaC/Yz3YjngZL9vc6nReLO6ZVAWzaYb4
 dc+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJiVHsjxnGL9pxZqN/fe1B1kPdCs8OG/X6NQp53AOXJUL4y+7gQF33k4g6M0EJBe1d/x0QF5R1vQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx+w7jay1O2DYGecSyllOvKCvs5NOoZHiWt7uk/LdcGKZWcAG0H
 TeQa/47K2NME9MV+l4eBjwGogaa2vkIJOtraTECLCS7c7FQh31v+eTFMIOlu78W+bsucVXaQAsv
 j7Wn0NuT5nnfHYkCP42Y1bfEdGQiCrbCjbGbdFMLZCQK8RLo+gw==
X-Gm-Gg: ASbGnctIQh5pzzO+LnY4G3orDnNz9nuR7o1dFZuQBuWdMkj/J58/gGe/NnBkYJHIKWO
 EnLX84MVwdIqm2YzZTkJ296l1ebmmLBy1e5m6cZToldvX7pfFwy9ykxYV42XVkrfbB+7t1o40Ij
 k8cqvG2qN5PfFtKMUlq/LLe47Hj+4SxnJF6pa0RkM/i1/JieJoK3KRvYH38wU53cJJtJ2hjFqV7
 cc+g5mT3+JelHB/1O+mEi5wWY8E73So3SqDDrLnR98ElJC/Hk33jRyJyh89zyM2btGejOzYoh2T
 CXu27jgdNwXl
X-Received: by 2002:a05:622a:2d2:b0:476:977c:2eb0 with SMTP id
 d75a77b69052e-47aec3cc14bmr73588021cf.30.1745008500468; 
 Fri, 18 Apr 2025 13:35:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2d2:b0:476:977c:2eb0 with SMTP id
 d75a77b69052e-47aec3cc14bmr73587741cf.30.1745008500164; 
 Fri, 18 Apr 2025 13:35:00 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47ae9c188a8sm14007101cf.8.2025.04.18.13.34.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 13:34:59 -0700 (PDT)
Message-ID: <84870c74-f078-48c5-bead-96db1d582987@redhat.com>
Date: Fri, 18 Apr 2025 16:34:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add support for user creatable SMMUv3 device
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250415081104.71708-1-shameerali.kolothum.thodi@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250415081104.71708-1-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tP2sYox1Gs41EloyjvYacqRU0pwb5pNfhbko-tb9vbs_1745008500
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cXUyMAfyTUs1

Shameer,
Hi!

First off, like the partitioning of these pieces.

On 4/15/25 4:10 AM, Shameer Kolothum wrote:
> Hi All,
> 
> This patch series introduces support for a user-creatable SMMUv3 device
> (-device arm-smmuv3-dev) in QEMU.
> 
Can we drop the '-dev', as 'arm-smmu' is sufficient, as is '-device'?

I know, internal to QEMU, there's already an ARM_SMMU, but as suggested later,
if it uses the same struct, the qemu cmdline syntax is a bit less redundant.

> The implementation is based on feedback received from the RFCv2[0]:
> "hw/arm/virt: Add support for user-creatable accelerated SMMUv3"
> 
> Currently, QEMU's SMMUv3 emulation (iommu=smmuv3) is tied to the machine
> and does not support instantiating multiple SMMUv3 devices—each associated
> with a separate PCIe root complex. In contrast, real-world ARM systems
> often include multiple SMMUv3 instances, each bound to a different PCIe
> root complex.
> 
> This also lays the groundwork for supporting accelerated SMMUv3, as
> proposed in the aforementioned RFC. Please note, the accelerated SMMUv3
> support is not part of this series and will be sent out as a separate
> series later on top of this one.
> 
> Summary of changes:
> 
>   -Introduces support for multiple -device arm-smmuv3-dev,bus=pcie.x
>    instances.
> 
>    Example usage:
> 
>    -device arm-smmuv3-dev,bus=pcie.0
>    -device virtio-net-pci,bus=pcie.0
>    -device pxb-pcie,id=pcie.1,bus_nr=2
>    -device arm-smmuv3-dev,bus=pcie.1
>    -device pcie-root-port,id=pcie.port1,bus=pcie.1
>    -device virtio-net-pci,bus=pcie.port1
> 
>    -Supports either the legacy iommu=smmuv3 option or the new
>    "-device arm-smmuv3-dev" model.
> 
nice! :)
Can it support both? i.e., some devices using a system-wide, legacy smmuv3,
and some pcie devices using the -device arm-smmuv3 ?

If not, then add a check to min-warn or max-fail, that config.
I can see old machines being converted/upgraded to new machines,
and they will want to switch from legacy->device smmuv3, and catching
an edit/update to a machine change (or enabling automated conversion) would be helpful.

>    -Adds device tree bindings for the new SMMUv3 device on the arm/virt
>     machine only, and only for the default pcie.0 root complex.
>     (Note: pxb-pcie root complexes are currently not supported with the
>      device tree due to known limitations[1].)
>    -Restricts usage of the new SMMUv3 device to virt machine versions > 9.2.
>     This is to avoid creating new smmuv3 device for old virt machine versions
>     and accidently breaking the migration support.
> 
> Please take a look and let me know your feedback.
> 
> Thanks,
> Shameer
> [0]:https://lore.kernel.org/qemu-devel/20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com/
> [1]:https://lore.kernel.org/qemu-devel/20230421165037.2506-1-Jonathan.Cameron@huawei.com/
> 
> Shameer Kolothum (5):
>    hw/arm/smmuv3: Introduce SMMUv3 device
>    hw/arm/virt-acpi-build: Update IORT for multiple smmuv3 devices
>    hw/arm/virt: Factor out common SMMUV3 dt bindings code
>    hw/arm/virt: Add support for smmuv3 device
>    hw/arm/smmuv3: Enable smmuv3 device creation
> 
>   hw/arm/smmuv3.c          |  55 ++++++++++++++++++
>   hw/arm/virt-acpi-build.c | 119 +++++++++++++++++++++++++++++++++++----
>   hw/arm/virt.c            | 109 ++++++++++++++++++++++++++---------
>   hw/core/sysbus-fdt.c     |   3 +
>   include/hw/arm/smmuv3.h  |  16 ++++++
>   include/hw/arm/virt.h    |   2 +
>   6 files changed, 266 insertions(+), 38 deletions(-)
> 

