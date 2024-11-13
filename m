Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp557047njc;
        Wed, 13 Nov 2024 09:59:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNR4Oq7jIg8AltdSICn7qwp0RqV9jfKwkOZMKQXI4TBtaoKsPUtYHc0ErXa1FyiAST/cKDkggw5XgcbA==@linaro.org
X-Google-Smtp-Source: AGHT+IG/l46cFHPfr9O6Wy0XDP1z7/eBmOmF4/F828XpJVfhGGaqs3CD5rP09RQGoMZwKQsrbXuV
X-Received: by 2002:a05:6214:3290:b0:6cb:f039:85a0 with SMTP id 6a1803df08f44-6d39e1acea5mr303599366d6.40.1731520779011;
        Wed, 13 Nov 2024 09:59:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731520778; cv=none;
        d=google.com; s=arc-20240605;
        b=fOMVvsCLnVJaaDeanXrpD7u7cRJ10OxtECc9bZYoVPF3JSnMgsobZx5rYKICMV6qez
         6USZFkxhoKpWrlRP3jietMu+xNkdt5L2801wkDTjXSvBp5QiceMd8J0aAoOvDCBssOFL
         nUBa3Vpt7D2MxJP3qPyJu/jnIIWT/DueJbaZCrk2kSbDQqMf37d1c7C3bx1317cfDp09
         4AFP3rMVLI0XdtPM83kJb8tl+lbE4xdh1lpo/dgZtkYkWrd2LRvwV+P6EQ/Q8a6S+M7k
         4E5E+nt6zYwjNNJE2kTrpkA/ts7uhExOVY8y6kxnA3tToC9cXWQRE7bhWRRq4vwx7O8X
         fXzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OVrqIYGS7NdD6eeIG6USycWyaacM+KCIZBbybQp0F2Q=;
        fh=+hRw58Ar2rgV9syUjCRj3hKnQ3at23RBjst6VsAKhEE=;
        b=PjeGeTltTL4LTTxcfY2Mv+dIeee6QwUwO4+rwr+eb4gZx5oDxPCnMMrxzUqxSURBeu
         71E2rcWis2R8t2+LHeaWp/9YGR6SvplDWgJdlt+Z9gH6N/O7S2g7cFvhkMmVEdiVbCI8
         nZKNxvnTx28KIL3iX1fFE3xEIwUE2RuF7Eiq9aD4NfQN3azvCWqGHI9AM3LmfXw+jmZo
         WW1MrevdxnBIdeOyJbqyi8k91vp+T/s1vxFwnotRFHk99GHEjbpFfUukowGCMkwp05rJ
         23nsi1e90qTEnkVyOKxiecbPsRW0WewGNt85/InGcePf3mXJF5o8iOZ73XqkDDGykFa/
         ll1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M0qzkV4X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d396211fc4si167474986d6.101.2024.11.13.09.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 09:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M0qzkV4X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBHe5-0004Qx-76; Wed, 13 Nov 2024 12:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tBHdw-0004PX-D9
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 12:59:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tBHdu-0008K9-Jd
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 12:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731520741;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVrqIYGS7NdD6eeIG6USycWyaacM+KCIZBbybQp0F2Q=;
 b=M0qzkV4X9kGZymOgZV7tybtF1VlGCHlpsQWE7zqmq3acTJe53rw5kN4M6luqak1bXpmkZ/
 9rDkrgTcwb2zAcmO0JFhbeC2f4xwLwqErdg6rRgxoJ7K+ty5cC7pslOR3zIpytmdKzjlyp
 rluvGTwslbAvFdQUhfmcrNoLqZ8daro=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-CyQxodC4NQ26T8SjtVdLzQ-1; Wed, 13 Nov 2024 12:58:58 -0500
X-MC-Unique: CyQxodC4NQ26T8SjtVdLzQ-1
X-Mimecast-MFC-AGG-ID: CyQxodC4NQ26T8SjtVdLzQ
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-539eaa0561bso5341547e87.0
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2024 09:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731520736; x=1732125536;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OVrqIYGS7NdD6eeIG6USycWyaacM+KCIZBbybQp0F2Q=;
 b=WAOqFAL3YatbizMcVe2eeVDnX5Gp/WFvPVWF+VoW1bzVYE5DEf7zJWtHU+UN3XAFle
 ce97YSxoLFelZexKpFfLZsSZY/oPHBOa9nyT9tvKcJ9GcxdDRok6kIqpDwSeQQfj1Id2
 jMYtRBJ8xHF2CdLV3/hiyvu0de9JSUcFhqVZQpz0cYZe/nB5PPXKigveWKNMHoQ9QqiQ
 co0/JBmpO2raagGzpHgRmebrNcCgkuMHEJb9BpsKufY0lgAlkKJsQuKMmRc2/JIRNfMW
 UoCdt7C8SBJowb8JEKhkPKsRxcZ7DZTrW+cfmfgQriXr6E+1McFUOQHWyw61zs5MIILV
 gzFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3wRTAIJELzh/adNzE25fiCZuandn2Rn+Ph86qT287gBbp/eJ0upL8irqHyhZglgWNzzikwuH/iQ==@nongnu.org
X-Gm-Message-State: AOJu0YwtekhfJUQBk13LC48KbuJA22YBLSBKKrpuGH6YBH2exfzbUVcC
 tXBfmxCyHPNtFC6In/cf3M16tbugrlW6r+xJ4BMEpfa7bd5wKqai44cLVYP6lbiRGiUS6XOGYoe
 Px38QHLGZkdx8HfhG36AH0Oue5kyZXlA7Uv+5w7PkVaSpJ2vuDw==
X-Received: by 2002:a05:6512:12d1:b0:53d:a422:e826 with SMTP id
 2adb3069b0e04-53da422e940mr657666e87.2.1731520736428; 
 Wed, 13 Nov 2024 09:58:56 -0800 (PST)
X-Received: by 2002:a05:6512:12d1:b0:53d:a422:e826 with SMTP id
 2adb3069b0e04-53da422e940mr657643e87.2.1731520736010; 
 Wed, 13 Nov 2024 09:58:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d4788c2asm26150885e9.0.2024.11.13.09.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 09:58:54 -0800 (PST)
Message-ID: <a1edc7ec-6450-4409-b8b2-b4026baee242@redhat.com>
Date: Wed, 13 Nov 2024 18:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] hw/arm/smmuv3: Associate a pci bus with a SMMUv3
 Nested device
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-4-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20241108125242.60136-4-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UNbMP7q2qfCZBdu2MtXm85gn6jAIPXkNhtu73lk29SE_1731520736
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.119,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: HOAcxT+xdNLe

Hi Shameer,

On 11/8/24 13:52, Shameer Kolothum wrote:
> Subsequent patches will add IORT modifications to get this working.
add a proper commit msg once non RFC ;-)
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3.c         | 27 +++++++++++++++++++++++++++
>  include/hw/arm/smmuv3.h |  2 ++
>  2 files changed, 29 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 0033eb8125..9b0a776769 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -24,6 +24,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bridge.h"
>  #include "cpu.h"
>  #include "trace.h"
>  #include "qemu/log.h"
> @@ -2201,12 +2202,32 @@ static void smmu_realize(DeviceState *d, Error **errp)
>      smmu_init_irq(s, dev);
>  }
>  
> +static int smmuv3_nested_pci_host_bridge(Object *obj, void *opaque)
> +{
> +    DeviceState *d = opaque;
> +    SMMUv3NestedState *s_nested = ARM_SMMUV3_NESTED(d);
> +
> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> +        if (s_nested->pci_bus && !strcmp(bus->qbus.name, s_nested->pci_bus)) {
> +            object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus),
> +                                     &error_abort);
> +        }
> +    }
> +    return 0;
> +}
> +
>  static void smmu_nested_realize(DeviceState *d, Error **errp)
>  {
>      SMMUv3NestedState *s_nested = ARM_SMMUV3_NESTED(d);
>      SMMUv3NestedClass *c = ARM_SMMUV3_NESTED_GET_CLASS(s_nested);
> +    SysBusDevice *dev = SYS_BUS_DEVICE(d);
>      Error *local_err = NULL;
>  
> +    object_child_foreach_recursive(object_get_root(),
> +                                   smmuv3_nested_pci_host_bridge, d);
Using a different opaque struct pointer you may properly use the errp
and nicely fail if the bus is not found (avoid using error_abort).
> +    object_property_set_bool(OBJECT(dev), "nested", true, &error_abort);
why do you need that nested property as the SMMU is already type'd
differently.
> +
>      c->parent_realize(d, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> @@ -2293,6 +2314,11 @@ static Property smmuv3_properties[] = {
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> +static Property smmuv3_nested_properties[] = {
> +    DEFINE_PROP_STRING("pci-bus", SMMUv3NestedState, pci_bus),
nit: maybe we can use the "bus" name instead of pci-bus
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>  static void smmuv3_instance_init(Object *obj)
>  {
>      /* Nothing much to do here as of now */
> @@ -2320,6 +2346,7 @@ static void smmuv3_nested_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_smmuv3;
>      device_class_set_parent_realize(dc, smmu_nested_realize,
>                                      &c->parent_realize);
> +    device_class_set_props(dc, smmuv3_nested_properties);
>      dc->user_creatable = true;
>      dc->hotpluggable = false;
>  }
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 87e628be7a..96513fce56 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -89,6 +89,8 @@ OBJECT_DECLARE_TYPE(SMMUv3NestedState, SMMUv3NestedClass, ARM_SMMUV3_NESTED)
>  
>  struct SMMUv3NestedState {
>      SMMUv3State smmuv3_state;
> +
> +    char *pci_bus;
>  };
>  
>  struct SMMUv3NestedClass {
Thanks

Eric

