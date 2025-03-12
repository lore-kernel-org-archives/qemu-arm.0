Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp412892njc;
        Wed, 12 Mar 2025 10:15:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3vU83GsBMHK2xnB4SCG3UqByHZilbq19W3Fmb+u5Sop4zhomYixwPCqGByiC/IsnzoF1jnQ0ep7T2Zg==@linaro.org
X-Google-Smtp-Source: AGHT+IE/ss6P9HuSyKJH3chjtprdCNYJo50zKI/Cu/4FQPzVLJvO0NZpH60ADA4d4ehSpDiDb012
X-Received: by 2002:a05:6214:2b0d:b0:6d8:8a8f:75b0 with SMTP id 6a1803df08f44-6ea2dd20283mr124186466d6.14.1741799709851;
        Wed, 12 Mar 2025 10:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741799709; cv=none;
        d=google.com; s=arc-20240605;
        b=WkQSVQyUAX7uYcZj5Fr+LTukAEbXFcjD7mlIJeW8jSN0iETPI/InmLdXGqA8C2Ou6R
         B1Te+9uQ7PS0f6rz7y7asz8UvBSw3bj6ulR0tpxpieurLGy4YKAClaZ7/+F92cjnhZo+
         vaczJnsyAHMDPfonBgmWq6f7EKO5qSgHRKNFs3i1unPCGflUfkQCmgJ3n9zvNABhMUrS
         yztuinf+YR5zY5sgILCXDJ28HGUo1M0j9otDOAGYVdKjYpvWypBpRzy5eLt2F3jpucr6
         LgbFqyvkvdXnGcW/lLorANOcQ3QQnVQWpqLMwAyASypx0l+sR+h32UDN6XdIuuXMUifW
         KlSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LMu5WP+Jm2M4zMwL8RkNJmwJJU+7iZ2+WKJxbWSqfiU=;
        fh=+s0VmKZrT9XgQeOcjSbUEWVcwitYDGerWVVxydqlLjo=;
        b=L1q8wMK2IG9NPaozSCO/MVXxE+v6X/3m9LMJqVBr0BA88gpfOFvojSF2clKWORrJTU
         uHF5oXngRQseRK0sWuKve8Y6yE2lZ4P8ZxHNN8AGuxiiihsBNXtMR36KUGUiOFSb3n/A
         Ce3Nyb+V6Xan0ocCCHPgkj/VBS4A+4XdwyNlCsKQThfaFr5i/njo3VnBIznJK5VH/EaL
         ieCSKdQvf2j0DqdKNrYiHGBSZeVwJnae5tFkSgDOuzcumSPFn1JPTVgKFKoy4zTBVSgs
         hREDXSKMgEB6zzTCHqEqgQCvvLYGwz6Z5+0hYikgJCeFIZYNYmg+TtRoaX72F4sNbWvi
         Z/UQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WjlRSemb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f707d404si141924466d6.4.2025.03.12.10.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 10:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WjlRSemb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsPfP-0001NY-0j; Wed, 12 Mar 2025 13:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsPfM-0001Mq-8C
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 13:14:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsPfK-00021X-ES
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 13:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741799685;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMu5WP+Jm2M4zMwL8RkNJmwJJU+7iZ2+WKJxbWSqfiU=;
 b=WjlRSembzTGcpbJIgBcFYmC1m6ftzaFcI291ZPneTcWRZOQkDvCZJOuhn1GUhtIwjwhuSq
 gudS+O8ukJvarbpsdOW+WR760CkvKB5IkUilOJvzDt2g48225GkpkzT91lccR61Py4Tfxp
 85If9uzLw3iDqYgdFi+I6e9qZ6QNm2g=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-tdbWdZKIPcOKkCq_nJGayA-1; Wed, 12 Mar 2025 13:14:34 -0400
X-MC-Unique: tdbWdZKIPcOKkCq_nJGayA-1
X-Mimecast-MFC-AGG-ID: tdbWdZKIPcOKkCq_nJGayA_1741799673
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-47693206f16so303931cf.1
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 10:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741799673; x=1742404473;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LMu5WP+Jm2M4zMwL8RkNJmwJJU+7iZ2+WKJxbWSqfiU=;
 b=EXMdwLQ8AYsXgPGDqmVx8fKncWHVUBaJ+2+oX/aS8yd447GBEOHG8p37Leb5tT39mz
 Ww5gAI0P1RF5EMRuZ0HA2CrK5TtqnZmtP0G3Jp4EaRuMPSTUakXoZyQQ9WqHSx8dRtAk
 tHXiMW/nKtJBcRg8Ok3pJ3O+oiB6sdC+h8Fk1N6FV8xmDnmaRl7GtO5PqmEvHJFxIRp2
 eC9rYPdzh11g6X1EobxGCESW00rXK2ECS7S10xVZCzs6tGGm1qEFP1fBPT9M9H9Yufyx
 q9OFtc+M+zMqhkzCwHxrXovlN12iB7dJNZN2Jh36bxTUQEzfn0bAQ7rfuXo/yFI4cLnk
 /R9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOw6Vxm4Nk4pupKEWDdG/7XLztETmXA5pKTRYAt1CFfxX+46YYrpKGKOIo3eZVbA2b7XFTMUToDg==@nongnu.org
X-Gm-Message-State: AOJu0Yx1/K585EqKwZvkF6T2JBh7CMpwzjY2/IIgfuM1mp3eZuV5CCg6
 9XRweFzB1uRdDlAtLlUZ5UKx0KMVoGrmY9H+pY51UgLZER/CKiGshiwUXTgc1k3wNdK/BmgUjeM
 I1mRe+lyTqq7DFwOt8Ja3olKKp7pqNNzqTqin7jOwkbqustF+eA==
X-Gm-Gg: ASbGnctFzjPb3R6IgP9RAnyIAw+Rzm+LjC49HNa7GZA+zV9TxQ3XRJUTF7mnI5XFtr5
 WQOJfAyU5xzLfVH9m3495Qz3UsJ21YRWh9BTb5jLQO2tPx0abyYd/BUfkiCcHS6r8CaJea6rX8q
 tvCokwuVUW7ALQiD+vPDgIoaPH7OtZj4sICvN0jd5mtLv9LGU4uscB3NnVSnLVzvrER1uKSt2ok
 MgG+H2Hzv5CXL0llzuhLV8z+vJ4TfPIzdyE7eJ7BKfXZb5vVKtnphnx4X+Izr3GXmW+kRw+Y/K8
 AyiRC3JGPu1LAW0EtIskCGxy1s16f52qVkI3a9VipLMiFjAzMPbU24w/5kmEFOo=
X-Received: by 2002:a05:622a:13cb:b0:476:8588:ceae with SMTP id
 d75a77b69052e-47699648afdmr105963801cf.45.1741799673630; 
 Wed, 12 Mar 2025 10:14:33 -0700 (PDT)
X-Received: by 2002:a05:622a:13cb:b0:476:8588:ceae with SMTP id
 d75a77b69052e-47699648afdmr105963471cf.45.1741799673314; 
 Wed, 12 Mar 2025 10:14:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47669169887sm60772431cf.43.2025.03.12.10.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 10:14:32 -0700 (PDT)
Message-ID: <9c30ecfe-4d1b-4d09-9787-aab936217e12@redhat.com>
Date: Wed, 12 Mar 2025 18:14:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 08/20] hw/arm/smmuv3-accel: Provide
 get_address_space callback
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-9-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-9-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dz6e6FiynY09b1xeIc8TN8WUMAbDOgNKAWkSVD2HKxw_1741799673
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7rlgrZ30sCT3


Hi Shameer,

On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> Also introduce a struct SMMUv3AccelDevice to hold accelerator specific
> device info. This will be populated accordingly in subsequent patches.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-accel.c         | 36 +++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmuv3-accel.h |  4 ++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 1471b65374..6610ebe4be 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -11,6 +11,40 @@
>  #include "hw/arm/smmuv3-accel.h"
>  #include "hw/pci/pci_bridge.h"
>  
> +static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *s, SMMUPciBus *sbus,
> +                                                PCIBus *bus, int devfn)
> +{
> +    SMMUDevice *sdev = sbus->pbdev[devfn];
> +    SMMUv3AccelDevice *accel_dev;
> +
> +    if (sdev) {
> +        accel_dev = container_of(sdev, SMMUv3AccelDevice, sdev);
> +    } else {
> +        accel_dev = g_new0(SMMUv3AccelDevice, 1);
> +        sdev = &accel_dev->sdev;
> +
> +        sbus->pbdev[devfn] = sdev;
> +        smmu_init_sdev(s, sdev, bus, devfn);
> +    }
> +
> +    return accel_dev;
> +}
> +
> +static AddressSpace *smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
> +                                              int devfn)
If you reimplement the ops for the accelerated smmu why did you need to
add:

+++ b/hw/arm/smmu-common.c
@@ -865,6 +865,10 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
     SMMUState *s = opaque;
     SMMUPciBus *sbus = smmu_get_sbus(s, bus);
 
+    if (s->accel && s->get_address_space) {
+        return s->get_address_space(bus, opaque, devfn);
+    }

in 7/20?

Eric

> +{
> +    SMMUState *s = opaque;
> +    SMMUPciBus *sbus;
> +    SMMUv3AccelDevice *accel_dev;
> +    SMMUDevice *sdev;
> +
> +    sbus = smmu_get_sbus(s, bus);
> +    accel_dev = smmuv3_accel_get_dev(s, sbus, bus, devfn);
> +    sdev = &accel_dev->sdev;
> +
> +    return &sdev->as;
> +}
> +
>  static int smmuv3_accel_pxb_pcie_bus(Object *obj, void *opaque)
>  {
>      DeviceState *d = opaque;
> @@ -30,6 +64,7 @@ static void smmu_accel_realize(DeviceState *d, Error **errp)
>      SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(d);
>      SMMUv3AccelClass *c = ARM_SMMUV3_ACCEL_GET_CLASS(s_accel);
>      SysBusDevice *dev = SYS_BUS_DEVICE(d);
> +    SMMUState *bs = ARM_SMMU(d);
>      Error *local_err = NULL;
>  
>      object_child_foreach_recursive(object_get_root(),
> @@ -41,6 +76,7 @@ static void smmu_accel_realize(DeviceState *d, Error **errp)
>          error_propagate(errp, local_err);
>          return;
>      }
> +    bs->get_address_space = smmuv3_accel_find_add_as;
>  }
>  
>  static void smmuv3_accel_class_init(ObjectClass *klass, void *data)
> diff --git a/include/hw/arm/smmuv3-accel.h b/include/hw/arm/smmuv3-accel.h
> index 56fe376bf4..86c0523063 100644
> --- a/include/hw/arm/smmuv3-accel.h
> +++ b/include/hw/arm/smmuv3-accel.h
> @@ -16,6 +16,10 @@
>  #define TYPE_ARM_SMMUV3_ACCEL   "arm-smmuv3-accel"
>  OBJECT_DECLARE_TYPE(SMMUv3AccelState, SMMUv3AccelClass, ARM_SMMUV3_ACCEL)
>  
> +typedef struct SMMUv3AccelDevice {
> +    SMMUDevice  sdev;
> +} SMMUv3AccelDevice;
> +
>  struct SMMUv3AccelState {
>      SMMUv3State smmuv3_state;
>  };

