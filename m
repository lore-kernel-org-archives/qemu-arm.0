Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2190458ejb;
        Wed, 21 Feb 2024 13:59:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXt0y3GqH7nl9wVuE/9riTH2Q/W7od2/NAOmoddwcn+n11DxxMVRACYX+l6M4oMHcXU6CJ6z7NjMQXpWfY19egZtPGRuhBG
X-Google-Smtp-Source: AGHT+IH5AVviZ5RALf+R3iWwnKLCjqDoxNAbkpJmhmKzKFq6utYEWP7xu9mcXr/3Dggi8d7zwK0P
X-Received: by 2002:adf:cd81:0:b0:33d:731f:b74e with SMTP id q1-20020adfcd81000000b0033d731fb74emr3786373wrj.6.1708552749060;
        Wed, 21 Feb 2024 13:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708552749; cv=none;
        d=google.com; s=arc-20160816;
        b=gwdFAVsIzkrTHqJuGbqd/ZaOd3lQ4V8+oYg+W6gOUBRQ0dbyQr6gCsTUdbTCkl3ve9
         0cfUdA1YgILlz520cwm42phDwHn4BA2tj+/Srzgl//OsFUDZFn/XIH2MiC5YpBwqYMVY
         i/cq9u7TXc0lMq7dfnTNpt7jeW3aeUI2vDzXGaDLg6VnPGcej9EiugfIUS3Ek36mLPLd
         W0VqqtVcO7vOfB1Mn+wAgbmjdjNT7Rn+rVtaFA0l1KEmgSTeOhwxW8+e5LcIT/0BzQ5y
         L1ljTIFNbKGRGrf+OlpF/Q5ExaxQ+So7RVvfTQcfxwPGwE5kEWJ1C2lUwBf780i31lVR
         WHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=n9A+cu7xXPk9cD8IaN/wEZD9MJ03QTnk70UdEcyhrkw=;
        fh=rpDRuxNb7EaUSCoEaKj9cGf94q570Yf57KhlvND3cac=;
        b=AxVLxEPZuUEDm+8qAl+rxQXlo/233l4YESw0SMT5B8KjZXt9qnKzfuYemREbx0OZD7
         Y5UmdmBNGp8IHue6pzBwKAPwX6lQo9k/GFhHEcvLG6TlDSDWaXOorOFEhIg98T/HiUDl
         OWZ3GJhhBmXEPmrXP7kHGLnbhpXlomjPqER0olkb9Lv1KmdFeACZD1m2AFWSj6HzjT8z
         jQBMsAginkgKWpxnJyXnQxBZT6aQjdOkn6+GZkoEjel5k0uLNdCWiG/q4GECBW7KXhSy
         FRqysBgYCA38CK968y6+1fcyhmeWdb2/voFAfHGsiIxZuVI7priorcwCf1w17BRHppFE
         2Jtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C7zCjbFN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020a5d61c8000000b0033d0d580175si7102435wrv.288.2024.02.21.13.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:59:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C7zCjbFN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcuc9-0004Kk-1X; Wed, 21 Feb 2024 16:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcuc7-0004H4-FU
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:58:51 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcuc3-0000wo-RV
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:58:51 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1dc1ff58fe4so18584005ad.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708552726; x=1709157526; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n9A+cu7xXPk9cD8IaN/wEZD9MJ03QTnk70UdEcyhrkw=;
 b=C7zCjbFNa+iujCsyYra30hQF7HegLHmNiKVCYFty9Xe1dfJnBjNwz/1DwL/0o+uCa0
 M+NZesAF7Zvomtuyh5cTUEEQzWyHVkDqop7qRd3j5QyghGcL+hkilmQ5NfKaguqnLrAr
 MLXocCB4AlKOVQht+beFt5YrN+Vqk2lK17XE6+8oHXxqoQEgb5+u+wXC7MIAY5dt4Hqu
 6IfnZm9oX0lpMM9L+3QxdWt0r1GTsyc6Ys9+1fQRvBv036K0n1yYxvkKgQciaDfshMEE
 Lo7YRh4ZkO5NF4gNuEzqY7WrpwL5t+rxMLzm0Btm/nfhxQDaoDr419nw2DCbjhm64zf2
 NbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708552726; x=1709157526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n9A+cu7xXPk9cD8IaN/wEZD9MJ03QTnk70UdEcyhrkw=;
 b=k0xk+S79XO7SLTqSlT0mXzzj0piTP/AhwLDxxuuJQIUZHtm0YZv9/FNvCXxNaYW1b4
 W/Cr/cqMUQny8PYvf0SNq9NLawkuQaD+fe04P6WqKsuUSWI3NT6NzyLDJzR58Vf4PpDJ
 jnX01gvNdhLqMm/U/czRJqX/1c/t9vCz2S/RVPz4wNUEVqLh101/lLJTmYgQZm3HsuTH
 UMJdwfXpynDGkG+NjC7Uc0ZXPB3e/fJTXH9/cUowjB7qEc6r0TB5VxT69necb35ojG11
 NELzTDuLubRBiCGEQQygeHW1DF7LTIIeVuOSsHCrS+EAj/LmrIjsmAn00T2SdM+IgeJb
 rlmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJYv7C2wH0Z1z4i3uxXblVHFGnSIkoqUQdsUhbuEsculIwNIY/4Odegm3/qR6kofTPTGmlIjSbE7yHNaFebWypwBXF
X-Gm-Message-State: AOJu0YyGwdJCWnaseePJkgwsBe8v4JdG2k2j5z6qtHz9iWPQM7Yoe30b
 vANmUZUlewNXcnLmcaZqm7nRprJG6Pws8P2zXkPzil2pnveRzPSbkj+RSzj9xEk=
X-Received: by 2002:a17:902:6808:b0:1dc:1bc2:5d3d with SMTP id
 h8-20020a170902680800b001dc1bc25d3dmr4807885plk.8.1708552726120; 
 Wed, 21 Feb 2024 13:58:46 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 h15-20020a170902f7cf00b001db4433ef95sm8515886plw.152.2024.02.21.13.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 13:58:45 -0800 (PST)
Message-ID: <a3cefe21-f988-4269-9048-ffe4c5d18508@linaro.org>
Date: Wed, 21 Feb 2024 11:58:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] qdev: Add a granule_mode property
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com,
 jasowang@redhat.com, pbonzini@redhat.com, berrange@redhat.com
References: <20240221205926.40066-1-eric.auger@redhat.com>
 <20240221205926.40066-2-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221205926.40066-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: fBi+3vuDTItH

On 2/21/24 10:58, Eric Auger wrote:
> Introduce a new enum type property allowing to set an
> IOMMU granule. Values are 4K, 16K, 64K and host. This
> latter indicates the vIOMMU granule will matches the
> host page size.
> 
> A subsequent patch will add such a property to the
> virtio-iommu device.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/hw/qdev-properties-system.h |  3 +++
>   include/hw/virtio/virtio-iommu.h    | 11 +++++++++++
>   hw/core/qdev-properties-system.c    | 15 +++++++++++++++
>   hw/virtio/virtio-iommu.c            | 10 ++++++++++
>   4 files changed, 39 insertions(+)
> 
> diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
> index 06c359c190..626be87dd3 100644
> --- a/include/hw/qdev-properties-system.h
> +++ b/include/hw/qdev-properties-system.h
> @@ -8,6 +8,7 @@ extern const PropertyInfo qdev_prop_macaddr;
>   extern const PropertyInfo qdev_prop_reserved_region;
>   extern const PropertyInfo qdev_prop_multifd_compression;
>   extern const PropertyInfo qdev_prop_mig_mode;
> +extern const PropertyInfo qdev_prop_granule_mode;
>   extern const PropertyInfo qdev_prop_losttickpolicy;
>   extern const PropertyInfo qdev_prop_blockdev_on_error;
>   extern const PropertyInfo qdev_prop_bios_chs_trans;
> @@ -47,6 +48,8 @@ extern const PropertyInfo qdev_prop_iothread_vq_mapping_list;
>   #define DEFINE_PROP_MIG_MODE(_n, _s, _f, _d) \
>       DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_mig_mode, \
>                          MigMode)
> +#define DEFINE_PROP_GRANULE_MODE(_n, _s, _f, _d) \
> +    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_granule_mode, GranuleMode)
>   #define DEFINE_PROP_LOSTTICKPOLICY(_n, _s, _f, _d) \
>       DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_losttickpolicy, \
>                           LostTickPolicy)
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 5fbe4677c2..a82c4fa471 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -31,6 +31,16 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIOIOMMU, VIRTIO_IOMMU)
>   
>   #define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
>   
> +typedef enum GranuleMode {
> +    GRANULE_MODE_4K,
> +    GRANULE_MODE_16K,
> +    GRANULE_MODE_64K,
> +    GRANULE_MODE_HOST,
> +    GRANULE_MODE__MAX,
> +} GranuleMode;
> +
> +extern const QEnumLookup GranuleMode_lookup;
> +
>   typedef struct IOMMUDevice {
>       void         *viommu;
>       PCIBus       *bus;
> @@ -67,6 +77,7 @@ struct VirtIOIOMMU {
>       Notifier machine_done;
>       bool granule_frozen;
>       uint8_t aw_bits;
> +    GranuleMode granule_mode;
>   };
>   
>   #endif
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index 1a396521d5..3a0b36a7a7 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -34,6 +34,7 @@
>   #include "net/net.h"
>   #include "hw/pci/pci.h"
>   #include "hw/pci/pcie.h"
> +#include "hw/virtio/virtio-iommu.h"
>   #include "hw/i386/x86.h"
>   #include "util/block-helpers.h"
>   
> @@ -679,6 +680,20 @@ const PropertyInfo qdev_prop_mig_mode = {
>       .set_default_value = qdev_propinfo_set_default_value_enum,
>   };
>   
> +/* --- GranuleMode --- */
> +
> +QEMU_BUILD_BUG_ON(sizeof(GranuleMode) != sizeof(int));
> +
> +const PropertyInfo qdev_prop_granule_mode = {
> +    .name = "GranuleMode",
> +    .description = "granule_mode values, "
> +                   "4K, 16K, 64K, host",
> +    .enum_table = &GranuleMode_lookup,
> +    .get = qdev_propinfo_get_enum,
> +    .set = qdev_propinfo_set_enum,
> +    .set_default_value = qdev_propinfo_set_default_value_enum,
> +};
> +
>   /* --- Reserved Region --- */
>   
>   /*
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 2ec5ef3cd1..2ce5839c60 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -44,6 +44,16 @@
>   #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>   #define VIOMMU_PROBE_SIZE 512
>   
> +const QEnumLookup GranuleMode_lookup = {
> +    .array = (const char *const[]) {
> +        [GRANULE_MODE_4K]  = "4K",
> +        [GRANULE_MODE_16K] = "16K",
> +        [GRANULE_MODE_64K] = "64K",
> +        [GRANULE_MODE_HOST] = "host",
> +    },
> +    .size = GRANULE_MODE__MAX
> +};

Does it ever make sense to use anything other than host?
Especially since 4k fails on a 64k host, as you report.
Why would we want to be able to select a granule that doesn't work?

There are a few older hosts with 8k pages, e.g. Alpha, MIPS, Sparc.


r~
