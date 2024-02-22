Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp89617eja;
        Wed, 21 Feb 2024 23:53:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXorTMDpvopBzTR4oz8dO6IsYnSRgzqtTqthyrwC236tzg81JWS4hsGZe2TRT4YnaoD4XjgR1m12q/2zBT60M51ulb4SoA7
X-Google-Smtp-Source: AGHT+IHt6NqQTNcRIr680lG7LAy3+ekKEw49D1xnf05fx3afjyBhzRi1XVNI8TRCSAGcJkgb4nQj
X-Received: by 2002:a05:620a:1928:b0:787:54a5:9047 with SMTP id bj40-20020a05620a192800b0078754a59047mr16976653qkb.34.1708588426181;
        Wed, 21 Feb 2024 23:53:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708588426; cv=none;
        d=google.com; s=arc-20160816;
        b=I7mNQA0xj1aPmUrO5P+YusZ6zbEtSyG3QJzsQOLKE9iwF46oyP4vGXj3b0AMfsLmj6
         9fuGcC7l/kdeoi/ifStkN18DbEd9naKdasHQZS15265ZPvCpem31o7+A5fDaQJJEtXFg
         SSpwI316qNUEkwTGk7S6ZygR/39jMzZ/5udzlMzUf9cZEX6kGxKzaBw/m45D/nRTj7RE
         VLOY1bgPITnOQU/nDsO9g6A6fJGKZCV7/iddCLYuaJbl0lq4Kci14Kg+PsfpDd4u0txv
         +G/Cslw7mXMbCOOApK9MKHd7iO/y8NgU6g5AA1/xNtbSiJ3mwPcgqRHUWlJpfMtNMShX
         GPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gLlORS3eA79Wwl5NVJief4WfuY3RNYq5UngtR7IMK5I=;
        fh=RUqJ4qkvE30kwpjFSnkB4FSEtlDIkIPpqxDQrx6YMGw=;
        b=s93rp+vsgnbI+eESW5EHu01PvvleNAbz+xQeoITDfim2bVDzL04xRZCNTtx37J9/G8
         g//pFV2AMf12P06krVJppDXacdX4+M96SCymqDL6a4uaprwgeBuQgJrULxzLmHJO/CMP
         x997OHxs9WBxqqn0VoVksgtkMCvgvcEt1PdMC5AUUOc1+XWHULkHL9AOjgzpsO5wcta+
         gcR8kngnyzlWotJuGtM4TnCunH/WVYHnSrxO1iyL2Db07/US56MIs2Fo8C6r8eViFJWo
         TyIBXmCxiLW/+HfkkKcmykEinHG8gbb0XKLZSwr494OR3FxmKTJ0MIeP8vJjlAT4pwAp
         3iTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bflg8+lL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x27-20020a05620a099b00b0078753d43ec8si11378084qkx.50.2024.02.21.23.53.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 23:53:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bflg8+lL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd3td-000170-Js; Thu, 22 Feb 2024 02:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rd3tc-00016l-Sf
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 02:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rd3tY-0004yt-B3
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 02:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708588406;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gLlORS3eA79Wwl5NVJief4WfuY3RNYq5UngtR7IMK5I=;
 b=Bflg8+lLEqy/RdnUkT9i5qwKHyJhpD2Uh4yTVWPbZi8eZpcpgG2QYTTtTAO1YpsyrWDAMg
 L1jCE5SuVwoGKv/WbdYI/duxwlrRsPGA1gcdiBptbQwt38N5ZH9lFG4linqdziXRfYKSIK
 jvd5weQad6YVSFO4Y7Tz+3966cBaroc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-fGyV6K4_OGGbICluAIyHgw-1; Thu, 22 Feb 2024 02:53:25 -0500
X-MC-Unique: fGyV6K4_OGGbICluAIyHgw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33d7fcb70c2so243656f8f.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 23:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708588384; x=1709193184;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gLlORS3eA79Wwl5NVJief4WfuY3RNYq5UngtR7IMK5I=;
 b=sLHyDKW9iw3IByHgAew15AWihXZpR1uYv3cznhz+x9VEjnbVuZrCQYVkFLcoWGKR5W
 UyitLpGZO80Ni/WNhi3Iwgv40up2v8mI5pcp1QJNjcr61PIdcM7kHLFOL5X33pKFKRXj
 NLPshb59hbtaKewvFaFybRhhNfmfRTrtQhtePOYe3Y0zDyua8lTLQmNYKtzkI6JNFsuL
 CkuNgb+R94Ebur3gvqUXUHPWu+fAUpIexWlc6zkYRE1GZ7vf2qHuM75vgzv5Cp32XP68
 VSWgZbMd0rVrUfWKPDxbkYkL6PWTMlc/byolCnuz6bJSSCgQahYQ18ZkxZ8YJSUF06jq
 TP5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5qDaIt1BCMP6UAZ748plaPWixczkjq4oWV7Ln613o4Y5nQ0UpoOIRT/ttKYJE7YlkR22GEZnxeSojHhirzx7YoBOL
X-Gm-Message-State: AOJu0YxBYMd74oYt8c3gmxnm0+yPdsPVAyIuGkSNPHbxvko1ALTtKxKi
 HWrlTb8uEOz2jUNpPF1G+N7hAEGBxY/vw0OrOAnoKzlZcZEJ71QYqMRX8VuLu4OcVETiGmZePxK
 ONdFrzkpqa+I4Bd6q+iDhC42l2Cl1g8maPrnE97AwrckYw8N4hA==
X-Received: by 2002:a5d:6a07:0:b0:33d:61c7:9b2c with SMTP id
 m7-20020a5d6a07000000b0033d61c79b2cmr1517943wru.34.1708588384768; 
 Wed, 21 Feb 2024 23:53:04 -0800 (PST)
X-Received: by 2002:a5d:6a07:0:b0:33d:61c7:9b2c with SMTP id
 m7-20020a5d6a07000000b0033d61c79b2cmr1517921wru.34.1708588384373; 
 Wed, 21 Feb 2024 23:53:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056000008f00b0033b728190c1sm19405972wrx.79.2024.02.21.23.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 23:53:04 -0800 (PST)
Message-ID: <5e2bc3c2-e7f3-4ef1-be59-b6b9fcb58b8d@redhat.com>
Date: Thu, 22 Feb 2024 08:53:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] qdev: Add a granule_mode property
To: Richard Henderson <richard.henderson@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, jean-philippe@linaro.org, peter.maydell@linaro.org,
 clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com,
 jasowang@redhat.com, pbonzini@redhat.com, berrange@redhat.com
References: <20240221205926.40066-1-eric.auger@redhat.com>
 <20240221205926.40066-2-eric.auger@redhat.com>
 <a3cefe21-f988-4269-9048-ffe4c5d18508@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <a3cefe21-f988-4269-9048-ffe4c5d18508@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: mXIzvVMXcf+y

Hi Richard,

On 2/21/24 22:58, Richard Henderson wrote:
> On 2/21/24 10:58, Eric Auger wrote:
>> Introduce a new enum type property allowing to set an
>> IOMMU granule. Values are 4K, 16K, 64K and host. This
>> latter indicates the vIOMMU granule will matches the
>> host page size.
>>
>> A subsequent patch will add such a property to the
>> virtio-iommu device.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   include/hw/qdev-properties-system.h |  3 +++
>>   include/hw/virtio/virtio-iommu.h    | 11 +++++++++++
>>   hw/core/qdev-properties-system.c    | 15 +++++++++++++++
>>   hw/virtio/virtio-iommu.c            | 10 ++++++++++
>>   4 files changed, 39 insertions(+)
>>
>> diff --git a/include/hw/qdev-properties-system.h
>> b/include/hw/qdev-properties-system.h
>> index 06c359c190..626be87dd3 100644
>> --- a/include/hw/qdev-properties-system.h
>> +++ b/include/hw/qdev-properties-system.h
>> @@ -8,6 +8,7 @@ extern const PropertyInfo qdev_prop_macaddr;
>>   extern const PropertyInfo qdev_prop_reserved_region;
>>   extern const PropertyInfo qdev_prop_multifd_compression;
>>   extern const PropertyInfo qdev_prop_mig_mode;
>> +extern const PropertyInfo qdev_prop_granule_mode;
>>   extern const PropertyInfo qdev_prop_losttickpolicy;
>>   extern const PropertyInfo qdev_prop_blockdev_on_error;
>>   extern const PropertyInfo qdev_prop_bios_chs_trans;
>> @@ -47,6 +48,8 @@ extern const PropertyInfo
>> qdev_prop_iothread_vq_mapping_list;
>>   #define DEFINE_PROP_MIG_MODE(_n, _s, _f, _d) \
>>       DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_mig_mode, \
>>                          MigMode)
>> +#define DEFINE_PROP_GRANULE_MODE(_n, _s, _f, _d) \
>> +    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_granule_mode,
>> GranuleMode)
>>   #define DEFINE_PROP_LOSTTICKPOLICY(_n, _s, _f, _d) \
>>       DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_losttickpolicy, \
>>                           LostTickPolicy)
>> diff --git a/include/hw/virtio/virtio-iommu.h
>> b/include/hw/virtio/virtio-iommu.h
>> index 5fbe4677c2..a82c4fa471 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -31,6 +31,16 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIOIOMMU, VIRTIO_IOMMU)
>>     #define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
>>   +typedef enum GranuleMode {
>> +    GRANULE_MODE_4K,
>> +    GRANULE_MODE_16K,
>> +    GRANULE_MODE_64K,
>> +    GRANULE_MODE_HOST,
>> +    GRANULE_MODE__MAX,
>> +} GranuleMode;
>> +
>> +extern const QEnumLookup GranuleMode_lookup;
>> +
>>   typedef struct IOMMUDevice {
>>       void         *viommu;
>>       PCIBus       *bus;
>> @@ -67,6 +77,7 @@ struct VirtIOIOMMU {
>>       Notifier machine_done;
>>       bool granule_frozen;
>>       uint8_t aw_bits;
>> +    GranuleMode granule_mode;
>>   };
>>     #endif
>> diff --git a/hw/core/qdev-properties-system.c
>> b/hw/core/qdev-properties-system.c
>> index 1a396521d5..3a0b36a7a7 100644
>> --- a/hw/core/qdev-properties-system.c
>> +++ b/hw/core/qdev-properties-system.c
>> @@ -34,6 +34,7 @@
>>   #include "net/net.h"
>>   #include "hw/pci/pci.h"
>>   #include "hw/pci/pcie.h"
>> +#include "hw/virtio/virtio-iommu.h"
>>   #include "hw/i386/x86.h"
>>   #include "util/block-helpers.h"
>>   @@ -679,6 +680,20 @@ const PropertyInfo qdev_prop_mig_mode = {
>>       .set_default_value = qdev_propinfo_set_default_value_enum,
>>   };
>>   +/* --- GranuleMode --- */
>> +
>> +QEMU_BUILD_BUG_ON(sizeof(GranuleMode) != sizeof(int));
>> +
>> +const PropertyInfo qdev_prop_granule_mode = {
>> +    .name = "GranuleMode",
>> +    .description = "granule_mode values, "
>> +                   "4K, 16K, 64K, host",
>> +    .enum_table = &GranuleMode_lookup,
>> +    .get = qdev_propinfo_get_enum,
>> +    .set = qdev_propinfo_set_enum,
>> +    .set_default_value = qdev_propinfo_set_default_value_enum,
>> +};
>> +
>>   /* --- Reserved Region --- */
>>     /*
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 2ec5ef3cd1..2ce5839c60 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -44,6 +44,16 @@
>>   #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>>   #define VIOMMU_PROBE_SIZE 512
>>   +const QEnumLookup GranuleMode_lookup = {
>> +    .array = (const char *const[]) {
>> +        [GRANULE_MODE_4K]  = "4K",
>> +        [GRANULE_MODE_16K] = "16K",
>> +        [GRANULE_MODE_64K] = "64K",
>> +        [GRANULE_MODE_HOST] = "host",
>> +    },
>> +    .size = GRANULE_MODE__MAX
>> +};
>
> Does it ever make sense to use anything other than host?
> Especially since 4k fails on a 64k host, as you report.
Let me reuse Jean-Philippe's support matrix:
Before this series, 4KB granule was always used by the virtio-iommu.
The support matrix was:

 Host | Guest | virtio-net | IGB passthrough
  4k  | 4k    | Y          | Y
  64k | 64k   | Y          | N
  64k | 4k    | Y          | N
  4k  | 64k   | Y          | Y

with this series, host becomes the default. It fixes the 64KB/64KB config by default. It allows 64KB/4KB (virtio only) with manual 4K granule setting. If we don't have this 4K granule we cannot support that use case.

 Host | Guest | virtio-net | IGB passthrough
  4k  | 4k    | Y          | Y
  64k | 64k   | Y          | Y
  64k | 4k    | 4K         | N
  4k  | 64k   | Y          | Y

Besides I need 4KB to handle the compat for older machine types.

> Why would we want to be able to select a granule that doesn't work?

> There are a few older hosts with 8k pages, e.g. Alpha, MIPS, Sparc.
OK. those are not integrated with virtio-iommu but I can definitively add 8K

Eric
>
>
> r~
>

