Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp379876njc;
        Wed, 12 Mar 2025 09:24:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLqM21dO4FZ7sir5WKqQdLz6C3oQzRMot943rovaIlxWcVLf59UXHtFhHlptkesCNUMgEit9lw7oCxTQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFvKc8GZT/fys0OJ3smKYjakHvpShQO3hfMnrkmpLKJ7X3Q21pPUX2Qwk9CLwTs77SBMMz2
X-Received: by 2002:a05:6102:1505:b0:4bb:cbbc:4c with SMTP id ada2fe7eead31-4c34d1f80d0mr9063940137.2.1741796648502;
        Wed, 12 Mar 2025 09:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741796648; cv=none;
        d=google.com; s=arc-20240605;
        b=OnXeq9GBTpL4T5bnQ1Mnkpmhqp56+GF9JA3KnK84+8YEYVhpMAqXJpCTDQm+0BQS2b
         WNAyE0duCT8Er7ZHEg4wf29u6/lpfmvG8lmNcSraha1KUgeUHCEjRzuQJxMYenbrgDiW
         DEYqtAEN3mVlk/2rEM8Bmur1ckDSNjkn0qWphDi3+aS6tZFgXagZMHeqr7QZu910oO9C
         /DfbWyF4J3UGrsEs46OooqJffkoGAR5rX55i2v/5GiCCOY2tOWbaQ7YVEys+fVwv0mR5
         ori8/k1b7ZNGAs4TW22xJ4xwKXOCaiGP3cJsNlFzfy/NsH1cf3P2u/+X/do9tSlqkJ+B
         XyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=b2z/VGOPk/+7T1T04VaFT1kEYO4PDK/MXQ7RuZ6Izao=;
        fh=bQcchhegw4ZG2wV/ejMnUGJmCFyv/TcsKh3OR4htChI=;
        b=fZo6ysKI5CArOtM1m7udHeqxHAaJ19YCU/PUcDalJDtvNCTmqrR7QZaNVU04rNMP+g
         BTwCfgqSU+7RoIM+963ahgdtYyJXpHt/Mm9soDobumrimn48GH4JhtJavKVxJCi8mHEq
         L7w96oydg7Z6STI1XHX6pjG7i+IoRPOyrD3aisyA26mYYDOxl8rt4I2BRdZtYGZmZg4R
         NX1pB30r8bH8seHwiJw/VVr6hQuoIT82TSsmoS1Sd5CNNwWe6WlZoP5CKedWkwo5p9uz
         VSo447C9FzViYLh2b+KHGyr+eIJqNGSsj9lmFrUvbjmW9ss/uJQzcSVWTdemGyeynnnP
         K6NA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GkpteHEc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fbc721ccsi3636522137.324.2025.03.12.09.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 09:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GkpteHEc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsOsC-0003WQ-5l; Wed, 12 Mar 2025 12:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsOs1-0003VO-Ef
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 12:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsOrz-0002Q3-6O
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 12:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741796624;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b2z/VGOPk/+7T1T04VaFT1kEYO4PDK/MXQ7RuZ6Izao=;
 b=GkpteHEcMaSaSkPtbE7sgPcG/q2uc9zOcoZNuYHTQ283Hwevoc73U/q0Rr42ieTbzOadyw
 9JUzGtJkuX7TEOUDq17KfD6cKuCeSC0ZPW2bgGuY1fC3zYb9Uu/yvstY6PS5ScZguoIzBp
 VskIAiT8vfGTfko4a6PSag6heknlIv0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-3GA3isD8Pvi6_SUSBPbcQQ-1; Wed, 12 Mar 2025 12:23:43 -0400
X-MC-Unique: 3GA3isD8Pvi6_SUSBPbcQQ-1
X-Mimecast-MFC-AGG-ID: 3GA3isD8Pvi6_SUSBPbcQQ_1741796622
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e91054ea4eso932796d6.3
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 09:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741796622; x=1742401422;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b2z/VGOPk/+7T1T04VaFT1kEYO4PDK/MXQ7RuZ6Izao=;
 b=jaZqdLpI//vBp4GzBnkT4WdxxTCbha6OQItrbJ2s1S6512FGCUBW7a93to4tf4MXBF
 DiufTY3ngVDxmffC+Ms76jB3pvDg4MbvTdG393Jmy5/inC2Oj9TMQg1J2YBEZ/eNrbmy
 T/iStMf6+dq/RjjzLN6eoEhqPIdTfOZ+cmXVM3sVoK76FQTx46WoceIIL18thXP6e11z
 hZw3BhPXAnlfsND7NWecT3vvEhp/7ZPInSMgShBqdRW8DZ5Xarwnus2+ToFrudT/x2wb
 z7qWGSymYqgu60ok2eQ7+m4bXH8HjrxLGQMExNPWbgQKDVDzhKszNEUGlJY3uSqx+9cu
 VVWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRIFuTVME2CYXJ29+CjKM38EF4fPdeSf7xf0jgb5iYR2npwRp4rOsQnxbPQegGggl2KMCeTD711g==@nongnu.org
X-Gm-Message-State: AOJu0YxNmZLsfdX0AaY37vXWrSeKpjsPpwMBpEu+usOC26SRWVdjOQ+R
 M9aryl26OkEl7tIx00PSTxT5Gy25xdtz/+L3V9VN2LIqnEp+OlUckzbXW4OMExCCW4/Xrip3IjU
 yizp3mT6VM00a7qyms+J8osF6RX988ERZJT8VN3AqT55D6Nup7Q==
X-Gm-Gg: ASbGnctb5M5ec+AEEbvbwNQFEALmejqCwoQypZWhu7k/8UGMbbQo+MM4EMqDc6AtzH8
 fl75boW5TbXh1Fi/2NxDfZwBDEMvsGYATWde3eUAy2EsdG+f+PMD3D7BZ1oBymxprTN4W8cymVw
 LSQUt6fBy+v78OZVMDnsp8tmPb/+xS5QiXPfPYP/rYryCOHNLPQBfSX69u4I43xed7YVlRIZQCa
 xn83eGnnexD9W9zuXmuI2hILP/Rxf8QosCRgv8fiA2aS0st5/ZRlsSp6W/i0v6dhPBi5yDr1FfH
 XRf0mXr1AEVTXKqXoO3sls1Xo6JLBLiALywoIcVDKHJrjfxFwKJ2U7io2RoD6uw=
X-Received: by 2002:a05:6214:21eb:b0:6e8:fcde:58d5 with SMTP id
 6a1803df08f44-6ea3a6a9638mr124860516d6.42.1741796622697; 
 Wed, 12 Mar 2025 09:23:42 -0700 (PDT)
X-Received: by 2002:a05:6214:21eb:b0:6e8:fcde:58d5 with SMTP id
 6a1803df08f44-6ea3a6a9638mr124860186d6.42.1741796622358; 
 Wed, 12 Mar 2025 09:23:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e8f71725b8sm86288546d6.118.2025.03.12.09.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 09:23:41 -0700 (PDT)
Message-ID: <fe047856-b564-4776-8651-daa65c02133b@redhat.com>
Date: Wed, 12 Mar 2025 17:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 07/20] hw/arm/smmu-common: Introduce callbacks for
 PCIIOMMUOps
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-8-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-8-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -tDCtvmnAAaWi49kfK5d1Z5MidAnreh66l5omULuI4g_1741796622
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qOUDrNRsMD3h




On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> Subsequently smmuv3-accel will provide these callbacks
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmu-common.c         | 27 +++++++++++++++++++++++++++
>  include/hw/arm/smmu-common.h |  5 +++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 83c0693f5a..9fd455baa0 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -865,6 +865,10 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>      SMMUState *s = opaque;
>      SMMUPciBus *sbus = smmu_get_sbus(s, bus);
>  
> +    if (s->accel && s->get_address_space) {
> +        return s->get_address_space(bus, opaque, devfn);
> +    }
> +
why do we require that new call site? This needs to be documented in the
commit msg esp. because we don't know what this cb will do.
>      sdev = sbus->pbdev[devfn];
>      if (!sdev) {
>          sdev = sbus->pbdev[devfn] = g_new0(SMMUDevice, 1);
> @@ -874,8 +878,31 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>      return &sdev->as;
>  }
>  
> +static bool smmu_dev_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
> +                                      HostIOMMUDevice *hiod, Error **errp)
> +{
> +    SMMUState *s = opaque;
> +
> +    if (s->accel && s->set_iommu_device) {
> +        return s->set_iommu_device(bus, opaque, devfn, hiod, errp);
> +    }
> +
> +    return false;
> +}
> +
> +static void smmu_dev_unset_iommu_device(PCIBus *bus, void *opaque, int devfn)
> +{
> +    SMMUState *s = opaque;
> +
> +    if (s->accel && s->unset_iommu_device) {
> +        s->unset_iommu_device(bus, opaque, devfn);
> +    }
> +}
> +
>  static const PCIIOMMUOps smmu_ops = {
>      .get_address_space = smmu_find_add_as,
> +    .set_iommu_device = smmu_dev_set_iommu_device,
> +    .unset_iommu_device = smmu_dev_unset_iommu_device,
>  };
>  
>  SMMUDevice *smmu_find_sdev(SMMUState *s, uint32_t sid)
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 80ff2ef6aa..7b05640167 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -160,6 +160,11 @@ struct SMMUState {
>  
>      /* For smmuv3-accel */
>      bool accel;
> +
> +    AddressSpace * (*get_address_space)(PCIBus *bus, void *opaque, int devfn);
> +    bool (*set_iommu_device)(PCIBus *bus, void *opaque, int devfn,
> +                             HostIOMMUDevice *dev, Error **errp);
> +    void (*unset_iommu_device)(PCIBus *bus, void *opaque, int devfn);
I think this should be exposed by a class and only implemented in the
smmuv3 accel device. Adding those cbs directly in the State looks not
the std way.

Eric
>  };
>  
>  struct SMMUBaseClass {

