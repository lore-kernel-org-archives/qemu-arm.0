Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp429478ejf;
        Fri, 23 Feb 2024 00:31:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWViNfZcJ7E2RlKuWAJ8qzG+RudNZlBLhl+3kDUNOgTyaOklblvoCsRRTffC4y50AppMZvsSektblMefznXgCK7nCfFv/oI
X-Google-Smtp-Source: AGHT+IFyCFuKlNO+RZm1KLy0Eppilw4ll/XKQpmLZgtjp31r4BAJ/nPsof7QVkiRSUYBST+UmHOC
X-Received: by 2002:a05:620a:1586:b0:787:83b2:dc49 with SMTP id d6-20020a05620a158600b0078783b2dc49mr1334600qkk.10.1708677060037;
        Fri, 23 Feb 2024 00:31:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708677060; cv=none;
        d=google.com; s=arc-20160816;
        b=J/ZbxRm1HDjuaIrPBXhKUzQ1v3F20G1xkqUcDs4qZPKqoEMwhbgyBOVOTTmoA4G+GJ
         vNXqHZBY/m3N177skqM3OEr9UdEgcFr4Fu2AMZF3mBKg5i3JZfvc1rkrKX6J+txcxamg
         aZKLp0tbw2/cOk2L7jbychiHAJ74JCtpdrYTaJz86tpMZ2RzpOi82kPg4r78QIBhEmrM
         3kPGx0lZpVxvtbE/mE8BcnGbndOluIHvMwpi50DJ9o0GTV9bH0bRZkVRU6S8k4C2Ukb9
         uBeI3FjFCPTySODremCKGgTg7wYgOGXb6N70LPEfzLJKd/zu2DMMx+eoOu4Al7Vv7k+4
         KvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6QSKwQC2SjIB9fpzU5eAJmTLEETfW3vtFhXqH1Cf948=;
        fh=HSodm6isnOQwRiB49DzWepcOp3JGchyV50D9KlcKtiM=;
        b=fIvzekLqwFASejSm3q/oxFPYu3ZNanIdBt90oKCdgOKW4UUCzU60pUyfc0rVy73Gt4
         XORX85zmJj1pPJOOcLr5wijXAYKMchOBJH1vJNv/yhj14pYZE9ZFbAtVCPFnNm3r5JSu
         cNSLv7jjqVC+DpshSzpwoMFAHGJv71S9yVEAzBzeogrHMCTKJA6jRCAdrS3WPeDfct4L
         aZD3Sc2o9iLeaVS6Kb8BdeT5PMULMeTLHB44RURQBfkHleKuELsnzWsna2JRrEF7gsXz
         eXAd7GcIm+r5QsdBesOUwxlc07KrtMNwX2p0IhiS1XFEySh4z+IQBAxSxhYE8yVj9Ol6
         HBOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R41kWyZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19-20020a05620a023300b00787b8837162si71179qkm.418.2024.02.23.00.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 00:30:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R41kWyZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdQxH-00022Q-4G; Fri, 23 Feb 2024 03:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rdQxG-00021I-6z
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 03:30:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rdQxC-0006ar-4J
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 03:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708677045;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6QSKwQC2SjIB9fpzU5eAJmTLEETfW3vtFhXqH1Cf948=;
 b=R41kWyZhRO5zWL/8cFn2SVE7zdFc3FztRFo1ltYLIgA2ZIqWlWdAmTN5gMwf3enBJUZgSj
 5Z6VbnKf9+EglHlpqBrn7cfpjnP2Nx3XsEkqOqhfyr/b1hmSUk3rF8U09GVlmMQqyP/KUN
 u9at4fytKNwELve5xMORdydZEUpnRDg=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-Pm4QmNFrPAuwWzneKIs4hQ-1; Fri, 23 Feb 2024 03:30:43 -0500
X-MC-Unique: Pm4QmNFrPAuwWzneKIs4hQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3c18e276595so7581b6e.3
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 00:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708677043; x=1709281843;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6QSKwQC2SjIB9fpzU5eAJmTLEETfW3vtFhXqH1Cf948=;
 b=AP2E0Wmfs4lZ7GIANBnoR0VIq+0Ff/Md2XOjL7i4LveDy607NQ0iLdO/gIUfs6KKrN
 AT36v7pvH0G/i7wnY2tpMasN5I+b51hA63QsbtpWgwtTgEknb2OsLk/NHK8Qq7YPKFUY
 sx439MVo1EBhksY+LtWsSdHJvfe6P0UX1ZWqqVEnIZeyrGclDZXrUSUNQUf8ZS4sYwcb
 iuizGjvKFOrEsr22TUax7tRa1QKZQyjSVJCG11NJo3jipW76nUpca9XmmYtrr/GiW2j9
 oKG+oRZiErQjoK0cea5ZSLKwznYGB6VyObZMR5OaNuo987ScyLhHPADwLdg+IVPX3rqX
 sWgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvujI4sP3KVvkVcH5Z9h8tMBvKE3piRpJS+lZXs76a16EFd7PE3HShCHaBG08Qo5HrVkXpZXyP2+5At8t+hzenkiMt
X-Gm-Message-State: AOJu0YzKVLjf6Cn8YA3Rn4o0Q4b8+L9GjhXuiuNOYc9w7zJPffkbqsJ9
 iNmF1O8Pqy7uyw2SmHQrk8Kie3x2nwe23BSNtOjCc9Rtx+2uGmPoao7Sr/cWW8AkWKaJey32gAC
 ze6G7mD0L7yWDea/P3QLKxBjUP7KSgSqMEmCc6468oeKYItmRlg==
X-Received: by 2002:a05:6808:4485:b0:3c1:83c3:969b with SMTP id
 eq5-20020a056808448500b003c183c3969bmr1742217oib.53.1708677042773; 
 Fri, 23 Feb 2024 00:30:42 -0800 (PST)
X-Received: by 2002:a05:6808:4485:b0:3c1:83c3:969b with SMTP id
 eq5-20020a056808448500b003c183c3969bmr1742192oib.53.1708677042360; 
 Fri, 23 Feb 2024 00:30:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 cz2-20020a05620a36c200b0078734c20d45sm6223144qkb.121.2024.02.23.00.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 00:30:41 -0800 (PST)
Message-ID: <fd894834-622f-4d1e-b594-87beb35deebf@redhat.com>
Date: Fri, 23 Feb 2024 09:30:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] qdev: Add a granule_mode property
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, jean-philippe@linaro.org, peter.maydell@linaro.org,
 clg@redhat.com, yanghliu@redhat.com, Markus Armbruster <armbru@redhat.com>
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com,
 jasowang@redhat.com, pbonzini@redhat.com, berrange@redhat.com
References: <20240223074459.63422-1-eric.auger@redhat.com>
 <20240223074459.63422-2-eric.auger@redhat.com>
 <07d4a2a4-1880-4402-a12a-94eeb649f8b0@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <07d4a2a4-1880-4402-a12a-94eeb649f8b0@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.002,
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
X-TUID: w3vq3e8jxZ09

Hi Philippe,

On 2/23/24 08:52, Philippe Mathieu-Daudé wrote:
> Hi Eric,
>
> On 23/2/24 08:27, Eric Auger wrote:
>> Introduce a new enum type property allowing to set an
>> IOMMU granule. Values are 4K, 8K, 16K, 64K and host.
>> This latter indicates the vIOMMU granule will match
>> the host page size.
>>
>> A subsequent patch will add such a property to the
>> virtio-iommu device.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v3 -> v4:
>> - Add 8K
>> ---
>>   include/hw/qdev-properties-system.h |  3 +++
>>   include/hw/virtio/virtio-iommu.h    | 11 +++++++++++
>>   hw/core/qdev-properties-system.c    | 15 +++++++++++++++
>>   hw/virtio/virtio-iommu.c            | 11 +++++++++++
>>   4 files changed, 40 insertions(+)
>
>
>> diff --git a/include/hw/virtio/virtio-iommu.h
>> b/include/hw/virtio/virtio-iommu.h
>> index 5fbe4677c2..e22327548f 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -31,6 +31,17 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIOIOMMU, VIRTIO_IOMMU)
>>     #define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
>>   +typedef enum GranuleMode {
>> +    GRANULE_MODE_4K,
>> +    GRANULE_MODE_8K,
>> +    GRANULE_MODE_16K,
>> +    GRANULE_MODE_64K,
>> +    GRANULE_MODE_HOST,
>> +    GRANULE_MODE__MAX,
>> +} GranuleMode;
>> +
>> +extern const QEnumLookup GranuleMode_lookup;
>
> Aren't this, ...
>
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 2ec5ef3cd1..a9bdc03d12 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -44,6 +44,17 @@
>>   #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>>   #define VIOMMU_PROBE_SIZE 512
>>   +const QEnumLookup GranuleMode_lookup = {
>> +    .array = (const char *const[]) {
>> +        [GRANULE_MODE_4K]   = "4K",
>> +        [GRANULE_MODE_8K]   = "8K",
>> +        [GRANULE_MODE_16K]  = "16K",
>> +        [GRANULE_MODE_64K]  = "64K",
>> +        [GRANULE_MODE_HOST] = "host",
>> +    },
>> +    .size = GRANULE_MODE__MAX
>> +};
> ... and this supposed to be QAPI generated?
If I remove both, it does not compile. How do you make it generated?

Thanks

Eric

