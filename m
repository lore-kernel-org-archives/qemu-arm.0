Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp487842lfm;
        Fri, 10 Jul 2020 02:07:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvT/gz5JRm6VBq3OT9SqcjcccwagKwkvdhQpS0AoUpaFK0u/+kS6fIKZk9C/u0ombX/zWO
X-Received: by 2002:a25:be02:: with SMTP id h2mr111865601ybk.315.1594372025060;
        Fri, 10 Jul 2020 02:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594372025; cv=none;
        d=google.com; s=arc-20160816;
        b=su1s8KkvBV+FgXFTO8fHLWkiavZS1t7uyMLR0P4bepBFEQCRzSRMptBbrV8O4uq/iP
         8/qjOWOSUtgTTWKLs0FElO9jVhKwUTWbJLP1uVHMnskv774PmPqMhfMZ2jMKaSMIJ6Zg
         vNRqOd6JtI35bdm6pv6RcomSys/o+W1GIvsOpHDDW3mrzHBM6VhMQkhFvpNnbNVwf7bI
         hZNmU7JNTiqr+T2hQ6GnaqOq8Cg6MuPk61haiaUi6zOFYnGNHKLL0FqHRbPhv2oqZXKC
         DIzZSMO/1/QsWMkHfHuR8KNPPC23rghppwiWl8gDCkKtqoNGaLAzx76yZkKm1S4DoGGY
         on5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MV7vJr246FQWCSU872RsoS5wCj76WAaTBzc75YR+XMw=;
        b=TZRdVI3hecUVNNX8NtZz1Mzlar7a0r2Xs5MwILxSnkCN0xezZzlHvgwBgz4yZSCItH
         XdOauSb7wTt2QKSuEXkjYs93iUCBnetOPGBG9fC6oZYaJWfuHGMVskmf2rD3LwmU3xt1
         zfY4pcpykmHc/2fyEbOl8vIe41VFpHh+1fpPG4MpAdm2/lPw6mSWPXvAKOlzH9o9pegx
         7ZbcJAQIRGpm1X8OeesWoGvxToS36YHL3fIJt/X0JXbFvlFqbCDs5wTcubnIWMRrRi2o
         jKPLIHYcSqTs+KtYd/6LoGLigUB2yjIffFirDZ2yYn0veW3ENSfGNrEPabWE70y7BLgU
         dwjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V7NRI3g1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15si5477372ybm.262.2020.07.10.02.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 02:07:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V7NRI3g1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtozo-00012e-F1
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 05:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtozg-000100-S3
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:06:56 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtoze-0001m8-EL
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:06:56 -0400
Received: by mail-oi1-x243.google.com with SMTP id x83so4215438oif.10
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2020 02:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MV7vJr246FQWCSU872RsoS5wCj76WAaTBzc75YR+XMw=;
 b=V7NRI3g1nuxWmZ9oTBcK6YehxkXosAnbQEf9ZOg8DKoXKr+uBtzhD6g46D+tvbXr5l
 d5QVUdUV4WH/aTeI9BygnHTaQ3NKo7UWnYGZBH1C8WsCh8ZeB4wW8G9CHTYTLfJwUm18
 FA3yEix4v5HTM+xG7YuH1f56RcFHD/7blSeBo9vejtzmYH8B+tIx7Rd9NOow6x11BOZZ
 UVo4df5KiJz3LhoVQm4ibROPMFpIC8EsRRXKwQ+jmaZYt2ineeuBDqfYJQCRRXAzsAn/
 DoVuFFqs6GesY05WnjzHKPJ/xsvgtSV5I07V/8AoKgkagRtO+Uj3Sj8f0xwTpSGumWKQ
 SbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MV7vJr246FQWCSU872RsoS5wCj76WAaTBzc75YR+XMw=;
 b=Ku6hAehlDdNRoplY9MTSt2Ppm2PbL2y6eR97SFZQ9KIwSCiBWapN89FNkqnLaWRawF
 eG3OdH00jDtTvD7u6g7rTBXePwa34lf5675tTKljMIOFW4feir95d+PWTGjr8okcxhwx
 mzB/Cirayyt05U2JIZbE1SSPSQWrXZnMdiK7bRVX+G+B45mjnBwN4bLXOwUYzQYmOPcs
 F7vRtJeEXMgu0j5d1Dvevz2Y5dlu2kVGTLyFsM0YQ1iOhMrlSo3NlRvrlz0RSHrkoTGn
 iS0cMrfakRLjuGP1EQMkcnVv2B0rFoDUfKn1jJTqJtUzXQcwRK2BG/zDS+G8GGIpk78E
 Od2A==
X-Gm-Message-State: AOAM5312AaKYoSQjsCtVIcumcoAvnNqXveMAAnWk1CwBcImelqOywdgP
 PotAoBswLeB5YtepMqPC/8uffVHrQv4Nvt9ibDiLoA==
X-Received: by 2002:aca:2819:: with SMTP id 25mr3229291oix.48.1594372013403;
 Fri, 10 Jul 2020 02:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200708141856.15776-1-eric.auger@redhat.com>
 <20200708141856.15776-8-eric.auger@redhat.com>
In-Reply-To: <20200708141856.15776-8-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2020 10:06:42 +0100
Message-ID: <CAFEAcA_81kxFhJeLTBKvvg7Vn75g1wrjq=wb7Wc+EAY9X1VT0A@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] hw/arm/smmuv3: Get prepared for range
 invalidation
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ffWEBBUrfllH

On Wed, 8 Jul 2020 at 15:19, Eric Auger <eric.auger@redhat.com> wrote:
>
> Enhance the smmu_iotlb_inv_iova() helper with range invalidation.
> This uses the new fields passed in the NH_VA and NH_VAA commands:
> the size of the range, the level and the granule.
>
> As NH_VA and NH_VAA both use those fields, their decoding and
> handling is factorized in a new smmuv3_s1_range_inval() helper.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---

> -inline void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova)
> +inline void
> +smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
> +                    uint8_t tg, uint64_t num_pages, uint8_t ttl)
>  {
> -    SMMUIOTLBPageInvInfo info = {.asid = asid, .iova = iova};
> +    if (ttl && (num_pages == 1)) {
> +        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
>
> -    trace_smmu_iotlb_inv_iova(asid, iova);
> -    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid_iova, &info);
> +        g_hash_table_remove(s->iotlb, &key);
> +    } else {
> +            /* if tg is not set we use 4KB range invalidation */

Over-indented here.

> +            uint8_t granule = tg ? tg * 2 + 10 : 12;
> +
> +            SMMUIOTLBPageInvInfo info = {
> +                 .asid = asid, .iova = iova,
> +                 .mask = (num_pages * 1 << granule) - 1};
> +
> +            g_hash_table_foreach_remove(s->iotlb,
> +                                        smmu_hash_remove_by_asid_iova,
> +                                        &info);
> +    }
>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
