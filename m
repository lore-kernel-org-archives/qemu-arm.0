Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp421479ejf;
        Fri, 23 Feb 2024 00:09:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbH7wkMLeV5ccKwRMv5Q0E+nOdMxc5LK38gJrT8168cMw+/X+Yb+OdzH5RiqJWjKcng/HkOhLsP3neWTLFit5ZdlT/lwPu
X-Google-Smtp-Source: AGHT+IEBeN3w1L1MSJ5CKfR/KQUhxAxSmv3BplQSK4Vqb0pRxSlRwXZL9z1Uhj0f20RdRTd1V/6J
X-Received: by 2002:a05:6102:5094:b0:470:5667:5d6a with SMTP id bl20-20020a056102509400b0047056675d6amr1459248vsb.27.1708675775677;
        Fri, 23 Feb 2024 00:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708675775; cv=none;
        d=google.com; s=arc-20160816;
        b=EnsanATqz0zBbX5+Z6RdU8utPhYB429o/IV0EliN9VYynkmQZHOROxDYdQ7br+MNG4
         UzUTErslE/AG8CiQeKsxUi2W9IwApRldOU3IzddMFPjqSXcgahYOsWHRPyQIEDKdwM3p
         3ycXd4cqrndbZbf4zCKLRSthDBe52udpbJx943lWKy58OWQ6TPTo1pTrAc0PVRhi/hw4
         9GdP3+t1J2xcf3rnasK+2bqU1JGHw27gesLlSmXhrOc0TVPHqrHtAX4let07fNDs74Id
         oMz8RPrW8go+c7gv6mtMu41PcKm0zFiRrv/GJkudPJMeUCBcp1D75d8fl/JypO9/LKlv
         SU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CpqRj/4pboJWJecyHa+O52UiEbhowMxbk6mQzdyglhQ=;
        fh=RAMb6iOzvrt2izHqizdQfy+wJE5FGitxGyABJo1Ydu4=;
        b=y+WOEkuBlf4T42IQjxmoTCVxy9eJB3tYkQrf7KF6Wp4JB1O4ODUSHrdxy9iETBq5IU
         O8KGGyJyc+0eRi4WqN+lwT0okDnj7rHm09KrdrvCAAWPQzCEiJ/QZYM3lKQHoF5A3pS4
         IPph2mM1+smDbkDt4kzgpKdJbXyOEy272b2K2EKcRW53P45QB3znuX7AT+XN63ZYx6WO
         a4l9qbWAi/8NJiPvDTc7bZ3hRaT2Vd8qMZbPjmJPDRu44s83R1FCeEBd52FS7a7ygwgk
         50aFLP5/PfogpSeYTskE2QNNbhHUQ1Vzl7J8fhPZo8C8bkK/YboFFwyxKUHMxR/Xr+++
         BsDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FUgMHdD5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi32-20020a05620a31a000b00787b7fb88b9si140386qkb.630.2024.02.23.00.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 00:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FUgMHdD5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdQcZ-00021g-9f; Fri, 23 Feb 2024 03:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rdQcX-000216-Gt
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 03:09:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rdQcU-00019Y-Tn
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 03:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708675762;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpqRj/4pboJWJecyHa+O52UiEbhowMxbk6mQzdyglhQ=;
 b=FUgMHdD50nBCSiLhnO9vxUar57fBwrzB52M8kq2QXXsSnfPOQ2OjSAOidozi6CloYvxHUT
 skF7+qA2KD3aXAzc2v3BOwOeMXrPJZ1a/If2GBxyB+jSEQkGwz9GMVzyQ07//ISjx7Opbx
 vnUf9zuyXKYvpSeVe08v3d0+nFbV4bI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-udbrlipyNtOJ25yhlYwJnQ-1; Fri, 23 Feb 2024 03:09:21 -0500
X-MC-Unique: udbrlipyNtOJ25yhlYwJnQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-787b8ae0c15so1925685a.1
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 00:09:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708675760; x=1709280560;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CpqRj/4pboJWJecyHa+O52UiEbhowMxbk6mQzdyglhQ=;
 b=GY3LaRmbRMoFm2DBU2yRuKQV5liRHOzuSKowvklaCh+WOdgR9Par/GQ03s39avcu9N
 hoYq4uc/haZIgk28n2+m0Xnqc6RXmvulliyLHwc5uw9LT4B8pSZHGjbC2dJZ76qheQTo
 mEQFXodG7OkqEG6m55k5yevRMg8+xAd/U8aCQKNB5dJ0njRQ00zuo+W+DTLXqUQm1N7r
 0g46ihHFk2DevgFogSdCkKosOV/0aUjUZ+FzHdMJLzgM0oJro71EQ9cw+mG8Nz5T65MG
 UwRhnF81WXJ4ug87BUtA73Pkw9UZNG0skhu7AbbIxu6MIOkN1EDSEHjWameNH4Gb3XjH
 KydA==
X-Gm-Message-State: AOJu0Yzv+Ukx/CNhsyoajD9C9fwN1a8sTLidvcj0R5YofMBZJqzPcEu+
 vGKQDrIEdz3G9Y+Wzgb1tdXkafo0wqg06g9tHqa20OYF23+DJTK9d2pUYGH/ee+sPPah52H15Pb
 OrEZ4Ny32cIaSlPSM8iRugfZoTvlrHIVRW+9Uhjd4Nh36ZHDdGA==
X-Received: by 2002:ad4:5fcf:0:b0:68f:cbd2:ec8d with SMTP id
 jq15-20020ad45fcf000000b0068fcbd2ec8dmr1650984qvb.64.1708675760104; 
 Fri, 23 Feb 2024 00:09:20 -0800 (PST)
X-Received: by 2002:ad4:5fcf:0:b0:68f:cbd2:ec8d with SMTP id
 jq15-20020ad45fcf000000b0068fcbd2ec8dmr1650970qvb.64.1708675759699; 
 Fri, 23 Feb 2024 00:09:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 lx6-20020a0562145f0600b0068f6dfcca55sm5855974qvb.65.2024.02.23.00.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 00:09:19 -0800 (PST)
Message-ID: <81c2b165-0961-4fea-947d-f55677049e9f@redhat.com>
Date: Fri, 23 Feb 2024 09:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/arm/smmu-common: Create virtual function for
 implementation defined StreamID
To: Nabih Estefan <nabihestefan@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 its@irrelevant.dk, kbusch@kernel.org, roqueh@google.com
References: <20240221171716.1260192-1-nabihestefan@google.com>
 <20240221171716.1260192-3-nabihestefan@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240221171716.1260192-3-nabihestefan@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.002,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3Va59ID8deTS

Hi,

On 2/21/24 18:17, Nabih Estefan wrote:
> From: Roque Arcudia Hernandez <roqueh@google.com>
>
> According to the SMMU specification the StreamID construction and size is
> IMPLEMENTATION DEFINED, the size being between 0 and 32 bits.
>
> This patch creates virtual functions get_sid and get_iommu_mr to allow different
> implementations of how the StreamID is constructed via inheritance. The default
> implementation of these functions will match the current ones where the BDF is
> used directly as StreamID.

The patch itself looks good to me but it lacks a concrete derived
implementation of get_sid() and get_iommu_mr(). Until you do not
upstream it I don't see the point in introducing those callbacks. Thanks
Eric
>
> Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> ---
>  hw/arm/smmu-common.c         | 12 ++++++++++++
>  include/hw/arm/smmu-common.h | 16 +++++++++++-----
>  2 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 4caedb4998..14b3240a88 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -621,6 +621,11 @@ static const PCIIOMMUOps smmu_ops = {
>  };
>  
>  IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
> +{
> +    return ARM_SMMU_GET_CLASS(s)->get_iommu_mr(s, sid);
> +}
> +
> +static IOMMUMemoryRegion *smmu_base_iommu_mr(SMMUState *s, uint32_t sid)
>  {
>      uint8_t bus_n, devfn;
>      SMMUPciBus *smmu_bus;
> @@ -659,6 +664,11 @@ void smmu_inv_notifiers_all(SMMUState *s)
>      }
>  }
>  
> +static uint32_t smmu_base_get_sid(SMMUDevice *sdev)
> +{
> +    return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
> +}
> +
>  static void smmu_base_realize(DeviceState *dev, Error **errp)
>  {
>      SMMUState *s = ARM_SMMU(dev);
> @@ -709,6 +719,8 @@ static void smmu_base_class_init(ObjectClass *klass, void *data)
>      device_class_set_parent_realize(dc, smmu_base_realize,
>                                      &sbc->parent_realize);
>      rc->phases.hold = smmu_base_reset_hold;
> +    sbc->get_sid = smmu_base_get_sid;
> +    sbc->get_iommu_mr = smmu_base_iommu_mr;
>  }
>  
>  static const TypeInfo smmu_base_info = {
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 5ec2e6c1a4..d53121fe37 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -131,6 +131,9 @@ typedef struct SMMUIOTLBKey {
>      uint8_t level;
>  } SMMUIOTLBKey;
>  
> +#define TYPE_ARM_SMMU "arm-smmu"
> +OBJECT_DECLARE_TYPE(SMMUState, SMMUBaseClass, ARM_SMMU)
> +
>  struct SMMUState {
>      /* <private> */
>      SysBusDevice  dev;
> @@ -147,6 +150,9 @@ struct SMMUState {
>      PCIBus *primary_bus;
>  };
>  
> +typedef uint32_t GetSidFunc(SMMUDevice *obj);
> +typedef IOMMUMemoryRegion *GetIommuMr(SMMUState *s, uint32_t sid);
> +
>  struct SMMUBaseClass {
>      /* <private> */
>      SysBusDeviceClass parent_class;
> @@ -154,19 +160,19 @@ struct SMMUBaseClass {
>      /*< public >*/
>  
>      DeviceRealize parent_realize;
> +    GetSidFunc *get_sid;
> +    GetIommuMr *get_iommu_mr;
>  
>  };
>  
> -#define TYPE_ARM_SMMU "arm-smmu"
> -OBJECT_DECLARE_TYPE(SMMUState, SMMUBaseClass, ARM_SMMU)
> -
>  /* Return the SMMUPciBus handle associated to a PCI bus number */
>  SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num);
>  
>  /* Return the stream ID of an SMMU device */
> -static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
> +static inline uint32_t smmu_get_sid(SMMUDevice *sdev)
>  {
> -    return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
> +    SMMUState *s = sdev->smmu;
> +    return ARM_SMMU_GET_CLASS(s)->get_sid(sdev);
>  }
>  
>  /**

