Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2778155njb;
        Mon, 8 Jul 2024 09:08:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1t/HDOLr40npOvs8qR/tSgLwbwxnfqX+5tFGWtQTvlwmUmIVu8rRGHdT30+P+mhteguTU53+ojrF3VNdBtpr2oA2+8T0U
X-Google-Smtp-Source: AGHT+IFXpMK3bVhjf0pYa97fhcM6JYsGG8p5St8Wl0QSEY8XKmEs28J2mdMk8BYVf9nj+vLUVgdd
X-Received: by 2002:a05:6102:358:b0:48f:db3d:5936 with SMTP id ada2fe7eead31-48fee651c1emr12323099137.2.1720454898787;
        Mon, 08 Jul 2024 09:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720454898; cv=none;
        d=google.com; s=arc-20160816;
        b=OjGTjTdQVS2w1sVinzKu1ZjepQhDmd3LSDcLA3hxJkh182qdJnkfU2cbLXPLtvvdjZ
         iZec68f+3NLtBMtlNqpS/svqHgEFX6F8ac8chof2G3+8ACOq+jB5XnQoBqXj5pcUQbpr
         GnDAkghjNmrzB1xpvnfT+QOSAxXjRwT0hYI5V492pDotCexc2GhX7NwtvFtsYTCJaPSN
         ABWqBVKRdCGccJoPRXsKoxtoLXvJLyioerpMAYTk7AgmLWQ3pF8jY89PTIGMZHi4F5Nc
         sydW2w0H26TjAX8rhTjVFlt+HGOxkz7JxP0h0+dZVflruHjp9y5N5Rc2cXxdR6KUozy1
         /OGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=nym5FvWMwH5SD/Y1P9XfQzH0qtlU4H2/FGUuCATe+Fw=;
        fh=COZStFYjLrfowUSC1ciB5EGRreuPmG6eox1BdGouLK4=;
        b=nfiMznqgBKgSRkKdrOYDqnzKihBNqgoVdz/7GvO1ZUW+CWM68zBFbsLfl2YLtadi5V
         kfpjbUdbeISf7o6hvOTqcISjPGiMJymL+4F1mfPPRy/K6ptRAABKuZnztdwXhgkrQVny
         1uspmGOxGVqMy5r3EcaZZzjZ/j/EhEoa5ldtoNve09q26ImhHoRdhF2NfDmCSaKzNpeb
         Ja8uziegwIgbkt/UvS0VByGv+YblC4PWy3uysrMcuJYFBB3ayI4px0kxnbmLvsJK9b8u
         6RcNMT1TAg9YAp6ehnBrlYaxnAWWW3N1dvgeirHZtMl0KdZCNiN/Mjdht5iiq4OWOZpf
         7nuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ObGqjwMh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-49031741dbbsi10754137.508.2024.07.08.09.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ObGqjwMh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720454898;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nym5FvWMwH5SD/Y1P9XfQzH0qtlU4H2/FGUuCATe+Fw=;
	b=ObGqjwMhdLcRJpX+zDxEXq0/W5meyECMoqv0f6zDG629+iLyuE3/rEu1OAzFke8RGvqx8i
	fEXb8s3LkdpIyg9EAW/DpqCT8e6+7+LqmF5D+Ip0muBhp+H1emmN69voec5jS05zu4EEbR
	KsFga6+n8yTyGp+pTyHqbMxcQ8KmlS4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-eTAgd7jWMPCoNU5_NAJOcQ-1; Mon, 08 Jul 2024 12:08:15 -0400
X-MC-Unique: eTAgd7jWMPCoNU5_NAJOcQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-367991a0a64so2862178f8f.1
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 09:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720454894; x=1721059694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nym5FvWMwH5SD/Y1P9XfQzH0qtlU4H2/FGUuCATe+Fw=;
        b=ALIBuCuPVZ9OGAY2Qbv6pcqb0Rka8mgtn/E0wJvczTUb9o0reVIECEBq4lRsIZvoHe
         bnHCCLhAIJgEsm/cEVAuy6dhCfezm0vvz0AHFTVUBd7DklHIsV9ZI1937p4qRARRupwP
         I3sb25BqbXZnuzJe9Px4TBbb33nwAEL2p97pkwhXr+Kq88XtMlziZaIqtt5KTtHTz75s
         +xaPMxupHNIGL4nmcosnbXqbiAlereDCuaMNUQUqMDrMtqW7qK7Vnq+bnhfl5yMxObiU
         jhXDjDbnje18bUN1m46IDcaYuIgrWa1g33iOTooig4F9ftudWuxiBkdvMMHsKwYYwZgG
         PXdg==
X-Forwarded-Encrypted: i=1; AJvYcCX2XglDsBhJ88K+RiN9jNnYYDQ/ATwPYxZXnq+CjNr+BOkz8pPdA3x7GUXn1SlCWM9F41RPg9KkvBXm3uIBqAlggaNU+BVr
X-Gm-Message-State: AOJu0Ywk9paebMzdPTZZd7XKFLgiWi0qBXHy3ZkQTL7OSLSSmi4HCGl3
	PmjHa7N5kZ6dy+922eiDtvRRiLUl3wGPBOfnvX9Z3ul0bELueVgKbRRGxrOOrSU7IzqhXGFGqtL
	eDJSVQEwh5iclzI8Fm3Fx5Hhxj6Z9W8YKOXDI8voS46wxVlJ09dYF3Q==
X-Received: by 2002:adf:e947:0:b0:367:8f81:fa09 with SMTP id ffacd0b85a97d-367ceaca8b0mr18984f8f.47.1720454893874;
        Mon, 08 Jul 2024 09:08:13 -0700 (PDT)
X-Received: by 2002:adf:e947:0:b0:367:8f81:fa09 with SMTP id ffacd0b85a97d-367ceaca8b0mr18976f8f.47.1720454893452;
        Mon, 08 Jul 2024 09:08:13 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e1b3sm163587f8f.20.2024.07.08.09.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 09:08:13 -0700 (PDT)
Message-ID: <4ab5d46c-ac4d-461f-a571-4f0d33554f26@redhat.com>
Date: Mon, 8 Jul 2024 18:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 13/19] hw/arm/smmu: Introduce smmu_iotlb_inv_asid_vmid
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com, julien@xen.org,
 richard.henderson@linaro.org, marcin.juszkiewicz@linaro.org
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-14-smostafa@google.com>
 <20240704183312.GJ1693268@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240704183312.GJ1693268@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 18wzKrmPDB9N



On 7/4/24 20:33, Jean-Philippe Brucker wrote:
> On Mon, Jul 01, 2024 at 11:02:35AM +0000, Mostafa Saleh wrote:
>> Soon, Instead of doing TLB invalidation by ASID only, VMID will be
>> also required.
>> Add smmu_iotlb_inv_asid_vmid() which invalidates by both ASID and VMID.
>>
>> However, at the moment this function is only used in SMMU_CMD_TLBI_NH_ASID
>> which is a stage-1 command, so passing VMID = -1 keeps the original
>> behaviour.
>>
>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> One small issue: the change to hw/arm/trace-events for
> trace_smmu_iotlb_inv_asid_vmid() should be in patch 13 rather than 14,
> otherwise the series isn't bisectable.
>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
With Jean's comment addressed
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
>
>> ---
>>  hw/arm/smmu-common.c         | 20 +++++++++++++-------
>>  hw/arm/smmuv3.c              |  2 +-
>>  include/hw/arm/smmu-common.h |  2 +-
>>  3 files changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 5bf9eadeff..d0309a95b2 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -159,13 +159,14 @@ void smmu_iotlb_inv_all(SMMUState *s)
>>      g_hash_table_remove_all(s->iotlb);
>>  }
>>  
>> -static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
>> -                                         gpointer user_data)
>> +static gboolean smmu_hash_remove_by_asid_vmid(gpointer key, gpointer value,
>> +                                              gpointer user_data)
>>  {
>> -    int asid = *(int *)user_data;
>> +    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
>>      SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
>>  
>> -    return SMMU_IOTLB_ASID(*iotlb_key) == asid;
>> +    return (SMMU_IOTLB_ASID(*iotlb_key) == info->asid) &&
>> +           (SMMU_IOTLB_VMID(*iotlb_key) == info->vmid);
>>  }
>>  
>>  static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
>> @@ -270,10 +271,15 @@ void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
>>                                  &info);
>>  }
>>  
>> -void smmu_iotlb_inv_asid(SMMUState *s, int asid)
>> +void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid)
>>  {
>> -    trace_smmu_iotlb_inv_asid(asid);
>> -    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
>> +    SMMUIOTLBPageInvInfo info = {
>> +        .asid = asid,
>> +        .vmid = vmid,
>> +    };
>> +
>> +    trace_smmu_iotlb_inv_asid_vmid(asid, vmid);
>> +    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid_vmid, &info);
>>  }
>>  
>>  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index e5ecd93258..928f125523 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -1329,7 +1329,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>>  
>>              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
>>              smmu_inv_notifiers_all(&s->smmu_state);
>> -            smmu_iotlb_inv_asid(bs, asid);
>> +            smmu_iotlb_inv_asid_vmid(bs, asid, -1);
>>              break;
>>          }
>>          case SMMU_CMD_TLBI_NH_ALL:
>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>> index de032fdfd1..2bc9a03d47 100644
>> --- a/include/hw/arm/smmu-common.h
>> +++ b/include/hw/arm/smmu-common.h
>> @@ -212,7 +212,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
>>  SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>>                                  uint8_t tg, uint8_t level);
>>  void smmu_iotlb_inv_all(SMMUState *s);
>> -void smmu_iotlb_inv_asid(SMMUState *s, int asid);
>> +void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
>>  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
>>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
>> -- 
>> 2.45.2.803.g4e1b14247a-goog
>>
