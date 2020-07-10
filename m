Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp482858lfm;
        Fri, 10 Jul 2020 02:00:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpI6lgD7bMUkrkQjfi8vqxenQc5yul5tmcKl6ucd7v649YACB6kQtg3ERycifcjx3iqvzf
X-Received: by 2002:a05:6902:1002:: with SMTP id w2mr65640011ybt.321.1594371658309;
        Fri, 10 Jul 2020 02:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594371658; cv=none;
        d=google.com; s=arc-20160816;
        b=UDzy8pKY8xnr1kdvgdXyVVs3dlaq3GE7YpgRgvdfH+vLTo2ezpmbufArDNmxv2NdIf
         x5LcibXTibfYLFBYyzLgrZQTW8xIsGv/7cMZSzxXezmI/WfNZtILulCMCxxTxG0NtI/5
         cmJfWv8+POHlYxYp22fqwcaMNWIs+SJU+9/L0OOX/5igZefNk/xoMpwuKFh4Zu8L10+A
         mIb1gGYlq8k/a1ALSK3rx8NZLIX9AbD2RVqkP9QCW0uBANrF2dnaF7Ka6OXmi03Fx79L
         6J9WAUzu98O8805ZicUfQI2Spk4tfs1b5TMvEi757BJonE37lU6w5WQYQtCuTVdhqZvM
         IAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ujs5s6dq+LXHgg/Ip1yjMFs8rA0xMczLbD0RicGjPrc=;
        b=Mjnj1Ct8plDLBaniWo9hcF9bvU16okscw/ZVPl8DDHnEzX604fqRx+61j5GYuIqAHW
         jYYe4ONBdU/otWthg7rFXq/eVw3aq+dKELsMM6lXUKElbjJsDPwKk0yPyElRCFfSJlbi
         vmn8zoGmnsjzO8Lfvm8jbrZsVHRYhg3gX6FMatQk03cvSWjmL5LDDRoG0/ez/budmDyw
         QpxidlakeW0FjBiK4KVx0DD3UZmt1kzmjWM3ytdgIPpRgS5EDkzVyTnIR1hk2Osgm9kL
         QSrwgUaJ3Q9ZYah0Keyq96hQd4E5ixDeVMP8V/9ciGrgy2tDPLyLTSMPhvS6XVcdFnj/
         LejA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FEtswf/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g131si4993705ybg.82.2020.07.10.02.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 02:00:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FEtswf/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtott-0004HP-Io
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 05:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtotk-0004Gn-Ha
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:00:48 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtoti-0000kE-JP
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:00:48 -0400
Received: by mail-ot1-x344.google.com with SMTP id w17so3712487otl.4
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2020 02:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ujs5s6dq+LXHgg/Ip1yjMFs8rA0xMczLbD0RicGjPrc=;
 b=FEtswf/4qTRuU8KQsh2QCzyn6gbv0vfuaUl9GVYnE8QE6S+YBz4km57AqeA67ZvnE0
 t0POKr9xF5jaGn5iuZkV/fo75a4qSoERCRG1vbsxOKIOqEQ6hr9zFSHnYw9P9OKwfuV/
 j+UKnxGM886PUO6+1mQPmh0LyQSXo+HcILuaaipR7NSr6PC/6pMCFAbilhxrhYtYjhL4
 OwROaVZSjiFhHjpmWMMEevw6Hr+XEPbzJmQBfj0j1HP+HHELPrhiILrWeTLmcYWoeDek
 hqFdSs1mziurGV1SxVJD+vccn+WJRyq1ZXDgoI5c/HLxsqCxkUM0jYwAWGqB59Lvq343
 nfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ujs5s6dq+LXHgg/Ip1yjMFs8rA0xMczLbD0RicGjPrc=;
 b=RAaSBOL6G5HafBEjm2udY9Bms4+I+KIRTRlKU7mXf5RYYkpnpZigWF+WKZIu7ViuKZ
 FgHItNEoRYNDnEBdEZ3phRBC7EJIbH5+OmEC5kzBujWBV7I43ize4j2EO0gk5KXy05sN
 UFYWyVDDXfqkWE8jnrGnPJRMZV8BdkpjTMGnSy6zLt8bkhx216mesZ9ZO1sjZX/APDfC
 xasnJDK3JWhL/f668CCgfiW8ObnBrtQgp2UHhdbzojrivGGQUi4vZg/DvvCZW8QTPaKE
 rDjkg41NkIu1aflmQn1dIXpoOGf1APC0cPQqO5kqrm6B9mHRTJDzitxmTL7BNTH7Dkd4
 NLpA==
X-Gm-Message-State: AOAM531/TobIEA3/1I5+8y8OuYz9CTv5IAIoeJfLNxIQqBkMACMBKnRN
 MLdgb3mQxS76NMUh1EmcEpBeUIOCkAtpwoMXFd9++g==
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr50533620oto.135.1594371645160; 
 Fri, 10 Jul 2020 02:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200708141856.15776-1-eric.auger@redhat.com>
 <20200708141856.15776-6-eric.auger@redhat.com>
In-Reply-To: <20200708141856.15776-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2020 10:00:34 +0100
Message-ID: <CAFEAcA84TctpCs7i-o-H2=FY9O6fuCc_A4OnWoRX2bg8attgiQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] hw/arm/smmu-common: Manage IOTLB block entries
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /0nYq8MwQ3Ke

On Wed, 8 Jul 2020 at 15:19, Eric Auger <eric.auger@redhat.com> wrote:
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
>
> ---
> v2 -> v3:
> - simplify the logic in smmu_hash_remove_by_asid_iova as
>   suggested by Peter
> - the key is a struct. We take into account the lvl in the
>   jenkins hash function. Also the equal function is updated.
>
> v1 -> v2:
> - recompute starting_level
> ---
>  hw/arm/smmu-internal.h       |  7 ++++
>  include/hw/arm/smmu-common.h | 10 ++++--
>  hw/arm/smmu-common.c         | 66 +++++++++++++++++++++++++-----------
>  hw/arm/smmuv3.c              |  6 ++--
>  hw/arm/trace-events          |  2 +-
>  5 files changed, 65 insertions(+), 26 deletions(-)
>
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index 3104f768cd..55147f29be 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -97,4 +97,11 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
>  }
>
>  #define SMMU_IOTLB_ASID(key) ((key).asid)
> +
> +typedef struct SMMUIOTLBPageInvInfo {
> +    int asid;
> +    uint64_t iova;
> +    uint64_t mask;
> +} SMMUIOTLBPageInvInfo;
> +
>  #endif
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 79c2c6486a..8b13ab0951 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -97,6 +97,8 @@ typedef struct SMMUPciBus {
>  typedef struct SMMUIOTLBKey {
>      uint64_t iova;
>      uint16_t asid;
> +    uint8_t tg;
> +    uint8_t level;
>  } SMMUIOTLBKey;
>
>  typedef struct SMMUState {
> @@ -159,12 +161,14 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
>
>  #define SMMU_IOTLB_MAX_SIZE 256
>
> -SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg, hwaddr iova);
> +SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> +                                SMMUTransTableInfo *tt, hwaddr iova);
>  void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
> -SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova);
> +SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
> +                               uint8_t tg, uint8_t level);
>  void smmu_iotlb_inv_all(SMMUState *s);
>  void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
> -void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova);
> +void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova);
>
>  /* Unmap the range of all the notifiers registered to any IOMMU mr */
>  void smmu_inv_notifiers_all(SMMUState *s);
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 398e958bb4..d373e30aa5 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -39,7 +39,7 @@ static guint smmu_iotlb_key_hash(gconstpointer v)
>
>      /* Jenkins hash */
>      a = b = c = JHASH_INITVAL + sizeof(*key);
> -    a += key->asid;
> +    a += key->asid + key->level;

What's the rationale for putting the level into the hash
but not the tg?

>      b += extract64(key->iova, 0, 32);
>      c += extract64(key->iova, 32, 32);
>
> @@ -51,24 +51,38 @@ static guint smmu_iotlb_key_hash(gconstpointer v)
>
>  static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
>  {
> -    const SMMUIOTLBKey *k1 = v1;
> -    const SMMUIOTLBKey *k2 = v2;
> -
> -    return (k1->asid == k2->asid) && (k1->iova == k2->iova);
> +    return !memcmp(v1, v2, sizeof(SMMUIOTLBKey));

Won't this also compare the padding at the end of the struct
(which isn't guaranteed to be the same)? I think just comparing
all the fields would be safer...

>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
