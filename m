Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1020618lfm;
        Tue, 7 Jul 2020 08:04:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDcfnhS8BASsjyPG51gagwtGyKm4dJCEksp1ZSRKxwpxpLy0/DoQxYK9pzhEd69jCSNZ1O
X-Received: by 2002:a5b:942:: with SMTP id x2mr88898087ybq.273.1594134296853;
        Tue, 07 Jul 2020 08:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594134296; cv=none;
        d=google.com; s=arc-20160816;
        b=AERxXJ1sVBISVx/ea1AcCKD+Zs4oeEIVSpeM1IbOjsv2P1ZOVAEkHYsGJUdnbJ2dhl
         6hO9Xe6KYpDU3lrCWeVV2g7IQ4LkTH02wSlrjPeyRpnNCEnMzpi8gr5GbBX1lsIZXhfC
         VNtWzo+2g7CcfKoPS7Xqh9p4bG5Cpc4AYBmTfqWPUEwC1CHLhhZkwxay3RuDYmfkonCZ
         HUf0C0narMGyRNxK6x/xdabLc4WtSiTlvPpwS9gJGFtJDAWc83Sr4UolaeIGBkAD9aq0
         kb6TT28lbb3aDEHlByxv3DWZaNgNllcgumaOndA/06mzyXezLGpcOhF+yHXhp2VNb/wa
         CbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2UIlbewbFnqix9Ab4uKlGbhHQ0KV8VVWbaPyTU80Prw=;
        b=sn92Q5LzTRKHuLzC0X4ccxB18A3lRRBuxWTCHpX28m8BMWr8YGrlg+rjc/CiI4DpYd
         YSwaewUjdhWfnldq42t8R4w4V+YJs1WLXVLidlaGWlQgwZERTZgTqE/qIUdBvyAw/uVk
         QQYLgs5XFfo234WWUN3UbNzN5Tr/DJlBylSN2JxKfU4pBhsJa7URnTky6ZknSYjWkMc5
         dvbU5zz3CFxVhCrRzNaLhwreZB1QZUdElv5yD9fHLdYc813LeV1k70hpKA17cZvv5MqE
         CxFHs/1ixSivPobQmzXCrNPnSdqAiG+7uV776WNbFggOA/97FYwCQJMX9v5ewkx5a72l
         CQkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ea+m2LES;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d143si23459466ybh.266.2020.07.07.08.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 08:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ea+m2LES;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsp9U-00011P-2Z
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 11:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsp9J-0000tl-8v
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 11:04:45 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsp9G-0002zK-Uf
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 11:04:44 -0400
Received: by mail-ot1-x341.google.com with SMTP id 5so32519635oty.11
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2020 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2UIlbewbFnqix9Ab4uKlGbhHQ0KV8VVWbaPyTU80Prw=;
 b=Ea+m2LESZXpIbmo4LIp3VivVNVWvAWd8xPKbIZUWRztzkUmmSMOMc+HYcDjgRI0U2s
 JLtK7P6g+y9qiQ8sggnnrICRiO9W+Bq8MqlGQtjZX0S1TibOcQ6Eg7mZUTQbmaN/dgso
 D9JjmB98qtCE4sUMtEQaWZG4IvgmeIWkrMjYKghnTjUzmX2CC1ZFH9/dJ2LVqoS4FdBb
 uSLKMAMDfVTfeCepC2ACFvssJ9C2zXSmZTFmZTvqW6n4c9mtGxosEWG+7+rC21PEVEEj
 VS5zITTTtejRH8hJw07OyBly1Ps13ekq5yKT24CYxtcGonNRxisjp9YTMiKB9lrv6jl2
 ObYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2UIlbewbFnqix9Ab4uKlGbhHQ0KV8VVWbaPyTU80Prw=;
 b=S9J0FTPYW+KEQeFQlKGeZ6PGWl0QB8HGGVUWJWlZOAoZjKj7F15ZqGGuVqBQi/dhrl
 uvSbvg6CP/CXl34qOHnFzDNvDudOUTWq30iPxndQEwZW5Ne+8msxSa/LGcCU2uyWIUUV
 2SBU3rOE3vG3k0BCla+3HBiKoAl0pxg9ucI4vSUTgzHUPxCJUI22W2fICWQh7oDEIkU0
 Th9mCBxJ/TKXA2bvRXmmPWOs8bDQrOwmxM5Fg2zdCs3SPqB3ImsDZpR4kEuJMesZvJqF
 u0M7CDFWWI+iKXvXN2tCk9l6uy65cHSVvE9EFW1S+xKoNdbADG4pMOxEG0WVFFOWhDNp
 IWFA==
X-Gm-Message-State: AOAM532SG7pitZcvn1ryB/CVe+RE53dfUWKPj1A43x7NALZBdCGGTL5v
 qKOYbliI0S5YQUCk6gRCAb/XgzoEA3cA3vikoWInmA==
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr38724672oto.135.1594134281409; 
 Tue, 07 Jul 2020 08:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200702152659.8522-1-eric.auger@redhat.com>
 <20200702152659.8522-7-eric.auger@redhat.com>
In-Reply-To: <20200702152659.8522-7-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jul 2020 16:04:29 +0100
Message-ID: <CAFEAcA_v7_arUY3mpi=8icJdj83VQsyPc-vC8x=AegkfdpBLBA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] hw/arm/smmu-common: Manage IOTLB block entries
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yg8IEM8Pvao9

On Thu, 2 Jul 2020 at 16:27, Eric Auger <eric.auger@redhat.com> wrote:
>
> At the moment each entry in the IOTLB corresponds to a page sized
> mapping (4K, 16K or 64K), even if the page belongs to a mapped
> block. In case of block mapping this unefficiently consumes IOTLB
> entries.
>
> Change the value of the entry so that it reflects the actual
> mapping it belongs to (block or page start address and size).
>
> Also the level/tg of the entry is encoded in the key. In subsequent
> patches we will enable range invalidation. This latter is able
> to provide the level/tg of the entry.
>
> Encoding the level/tg directly in the key will allow to invalidate
> using g_hash_table_remove() when num_pages equals to 1.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

>  SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> -                                hwaddr iova)
> +                                SMMUTransTableInfo *tt, hwaddr iova)
>  {
> -    SMMUIOTLBKey key = smmu_get_iotlb_key(cfg->asid, iova);
> -    SMMUTLBEntry *entry = g_hash_table_lookup(bs->iotlb, &key);
> +    uint8_t tg = (tt->granule_sz - 10) / 2;
> +    uint8_t inputsize = 64 - tt->tsz;
> +    uint8_t stride = tt->granule_sz - 3;
> +    uint8_t level = 4 - (inputsize - 4) / stride;
> +    SMMUTLBEntry *entry = NULL;
> +
> +    while (level <= 3) {
> +        uint64_t subpage_size = 1ULL << level_shift(level, tt->granule_sz);
> +        uint64_t mask = subpage_size - 1;
> +        SMMUIOTLBKey key;
> +
> +        key = smmu_get_iotlb_key(cfg->asid, iova & ~mask, tg, level);
> +        entry = g_hash_table_lookup(bs->iotlb, &key);
> +        if (entry) {
> +            break;
> +        }
> +        level++;
> +    }

So, this next bit is something of a digression:

Effectively what we're doing here is "look up in the hash
table for each of the 3 possible page sizes this could be
for this TG". I've had suggested to me a possible alternative
data structure:
 * hash on the asid (and vmid eventually?) to get...
 * a sorted list of (start, length) ranges representing
   the TLB for that asid ...
 * which we can binary-search to find the matching range
   (and the associated info)

The theoretical benefit is that we don't need to do three
hash table lookups for each iotlb_lookup, and that it can
support arbitrary-length ranges (so we could honour the Contiguous
bit hint in the page tables, for instance). But to avoid 3 hash
lookups it's probably not worth doing a complete rework of
the data structures.


> -inline void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova)
> +static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
> +                                         gpointer user_data)
>  {
> -    SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova);
> +    SMMUTLBEntry *iter = (SMMUTLBEntry *)value;
> +    IOMMUTLBEntry *entry = &iter->entry;
> +    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
> +    uint64_t *iotlb_key = (uint64_t *)key;
> +
> +    if (info->asid >= 0) {
> +        return (info->asid == SMMU_IOTLB_ASID(*iotlb_key)) &&
> +                ((info->iova & ~entry->addr_mask) == entry->iova);
> +    } else {
> +        return (info->iova & ~entry->addr_mask) == entry->iova;
> +    }

Since the iova comparison logic is the same in both branches
of this if(), you can write

    if (info->asid >= 0 && info->asid != SMMU_IOTLB_ASID(*iotlb_key)) {
        return false;
    }
    return (info->iova & ~entry->addr_mask) == entry->iova;

This seems particularly worthwhile given that a later patch
makes the iova comparison logic more complicated.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
