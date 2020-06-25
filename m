Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1430861lfm;
        Thu, 25 Jun 2020 08:55:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRr+vkHkoaScxg3CUbtrL4b/l5PVJe9/IBZ4pnXQ/0w6RZKL86jUowWmJM8kWWDkGBIbRy
X-Received: by 2002:a5b:5c8:: with SMTP id w8mr53735450ybp.178.1593100510457;
        Thu, 25 Jun 2020 08:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593100510; cv=none;
        d=google.com; s=arc-20160816;
        b=AsFWlc1T4cwZwp62Wlvyae/Ch7SRbw32z3SYLKC0dQ68NDzjy+wcwBs/P0Yhma9Xmn
         7Hj4TOGK2BTIPOUOAWsAqn2yxj5qn640pRDsWCUzIxuuJZEWzOdgFDe5esD/4eMxWMgv
         4JJqTkj5XduTC0ERNVaPZfA9bqffQEq/9G5CGZH5oV9RuordE3cpIYIaP3Ne2Sb3/Cjz
         4NPl3JMM6j206Dwx09jr6YLW37nfgPzbvfPHs61tR6sR56BMdaqVVRU3TUqWYq5JBwCv
         khoA7wp4CW7lxDxzV2REwrw2cTnnc8YuFC4YFEMjI9XSQ27RdGbnPEShFEdqU+AaL8jq
         bMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hdm/Nd7h1S6To48RIP0gmlLEp+EWkwiRjc1SbDsj7Pg=;
        b=SE1DDX2On2iPU0RoQp1aUT1RQLcmqKXL0MqGk2DKxa9iJe496R75RvU+c2qbPhHs7K
         YUeqBgzp0+qmKSyzWeyZG8UMh4W5pjjvGYmKkef2G4CygEl0On3btApEZiT0kbbIGdBi
         M9dcqZQwlBEq55ABiRmfR/O/9IaFxa8RgfRA+O9iH8ZpsdmSZKLgundMgJIshjsf7yiY
         92mDfnyg0l897PUFUlAmCcBawz/xoeW3NSc7E9iHRJlnGwZ96NX7UB6o34l651psfca/
         doo8/u+q9aUpJIGsopX+H3KeHVOyX10ZSOOWhntTOK8+kYrlIFoogfzdF51iRubTg/vw
         sd4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DXdVeJdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189si23190941ybn.283.2020.06.25.08.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 08:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DXdVeJdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joUDV-00045L-QI
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 11:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTq2-0007io-Cg
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:30:56 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTps-0001p2-1E
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:30:50 -0400
Received: by mail-oi1-x242.google.com with SMTP id r8so5316621oij.5
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hdm/Nd7h1S6To48RIP0gmlLEp+EWkwiRjc1SbDsj7Pg=;
 b=DXdVeJdSPF1BQEZHoKiP9HEBerfaz/7fiC4m7l8meo/XOx0qk/cYXNNRf3RXAaBFOH
 EMFygDR1cioYesZl2mFnGfadZoWOfffQZpRg7/MkYd0s7EjVhUxFkrKRxfroi3fF4/sl
 5NF+uifRITt9sqmfQjVcPv94m45E2oB3bmqKCEXJvtfbVv/KyyLAvLfoEa1FCSk3sBDe
 hDZZyvmaaDLw5kkWusAuPWQwGHPQ8F/u0TSQILabDA3kJUONnBcfz9ZVc9bFM7V9jJaA
 iMquvDxsBDnoPr3kd1e+kSjUoKLEptqtPJl4WZnUqX8df9vhIvDjzD8s4Llt49FfDyv9
 MenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hdm/Nd7h1S6To48RIP0gmlLEp+EWkwiRjc1SbDsj7Pg=;
 b=bMCFnH4pNvf+vfhddY61HYZprXA6R7XKHtjbuThEdo8edszkwQq5F1KNlcRRlzEE6z
 bhOjFmb7gJ77J/QbovQyFyXrv/H3Vtpa+jvS84MA7MJr0LnG8w/uucsrqStdjSCfk/G1
 aU8WwXzQ9gVgxldmA9DgXaP4ugffcRXjg9ZI63xEDYyhH3gGYq95LDrRs3mraFTOJ0By
 mnXc/PySVPFQyBx5N9sBqGGuYVr2yjPbO/JMotIvcnOGYNnQy3fPo1t9lNvd/RjTDc0k
 Zk06Q4IdD+WpsbuH01GsDCUL5mkLpemTzYPesZpr0bB5gsNnCtfmG90a+c/XOy1XJqk6
 +0pQ==
X-Gm-Message-State: AOAM533t6om8wALXqncsChIASR/fXY4Ia5Mmg5Ho4QeGWQkF3h//n0il
 8uPffp45l7COZHwH2f7tl3kt01QGFi+Jr9ySeeq63g==
X-Received: by 2002:aca:568c:: with SMTP id k134mr2516852oib.48.1593099041976; 
 Thu, 25 Jun 2020 08:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-7-eric.auger@redhat.com>
In-Reply-To: <20200611161500.23580-7-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 16:30:30 +0100
Message-ID: <CAFEAcA9FZV=jSk_9aJ_tHy=KLy+YrTFNoiqvCv7BMs0dWrHWFA@mail.gmail.com>
Subject: Re: [PATCH RESEND 6/9] hw/arm/smmu-common: Manage IOTLB block entries
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
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
X-TUID: M4tgoSB/s6+1

On Thu, 11 Jun 2020 at 17:16, Eric Auger <eric.auger@redhat.com> wrote:
>
> At the moment each entry in the IOTLB corresponds to a page sized
> mapping (4K, 16K or 64K), even if the page belongs to a mapped
> block. In case of block mapping this unefficiently consume IOTLB
> entries.
>
> Change the value of the entry so that it reflects the actual
> mapping it belongs to (block or page start address and size).
>
> Also the level/tg of the entry is encoded in the key. In subsequent
> patches we will enable range invalidation. This latter is able
> to provide the level/tg of the entry.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>


> -uint64_t smmu_get_iotlb_key(uint16_t asid, uint64_t iova)
> +uint64_t smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
> +                            uint8_t tg, uint8_t level)
>  {
> -    return iova >> 12 | (uint64_t)(asid) << SMMU_IOTLB_ASID_SHIFT;
> +    return iova >> 12 | (uint64_t)(asid) << SMMU_IOTLB_ASID_SHIFT |
> +           (uint64_t)(level) << SMMU_IOTLB_LEVEL_SHIFT |
> +           (uint64_t)(tg) << SMMU_IOTLB_TG_SHIFT;
>  }

>  SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> -                                 hwaddr iova)
> +                                SMMUTransTableInfo *tt, hwaddr iova)
>  {
> -    uint64_t key = smmu_get_iotlb_key(cfg->asid, iova);
> -    SMMUTLBEntry *entry = g_hash_table_lookup(bs->iotlb, &key);
> +    uint8_t tg = (tt->granule_sz - 10) / 2;
> +    int level = tt->starting_level;
> +    SMMUTLBEntry *entry = NULL;
> +
> +    while (level <= 3) {
> +        uint64_t subpage_size = 1ULL << level_shift(level, tt->granule_sz);
> +        uint64_t mask = subpage_size - 1;
> +        uint64_t key;
> +
> +        key = smmu_get_iotlb_key(cfg->asid, iova & ~mask, tg, level);
> +        entry = g_hash_table_lookup(bs->iotlb, &key);
> +        if (entry) {
> +            break;
> +        }
> +        level++;

Rather than looping around doing multiple hash table lookups like
this, why not just avoid including the tg and level in the
key equality test?

If I understand the range-based-invalidation feature correctly,
the only time we care about the TG/LVL is if we're processing
an invalidate-range command that specifies them. But in that
case there should never be multiple entries in the bs->iotlb
with the same iova, so we can just check whether the entry
matches the requested TG/LVL once we've pulled it out of the
hash table. (Or we could architecturally validly just blow
it away regardless of requested TG/LVL -- they are only hints,
not required-to-match.)

thanks
-- PMM
