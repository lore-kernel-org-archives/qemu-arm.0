Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D731125809
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 13:33:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0Jfx-0008P9-Vr; Wed, 11 Mar 2026 09:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0Jfr-0008OP-KA
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 09:32:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0Jfn-0004sj-L3
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 09:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773235946;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cULG/9SZWXdjX5jxM1S3h4FpyRKoxDjZmCjbMaAoiaM=;
 b=JVxVgP99Yl6dZzXEvr6PCIdRmQUvjnOuQDNThJqk3/2CLIY32muIJ5wbsE2DhmkIqnTOm1
 MWrZb8z3ynn4Pfvhg8rLHmqNaD7pszDDNivEa/p2Se4JCMj28bmIWnShARM0xUXd+Gi2o8
 FzZGo9tW1obHqTNp0FoNYQonm5Lt53E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-k96n5z8yM_iM1I42yzUfKw-1; Wed, 11 Mar 2026 09:32:24 -0400
X-MC-Unique: k96n5z8yM_iM1I42yzUfKw-1
X-Mimecast-MFC-AGG-ID: k96n5z8yM_iM1I42yzUfKw_1773235943
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-485390246c8so42916605e9.0
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 06:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773235943; x=1773840743;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cULG/9SZWXdjX5jxM1S3h4FpyRKoxDjZmCjbMaAoiaM=;
 b=JzdLyWAt+DUvzH+lEZKotUZQUS/vojk63TWUW3dbOFZZYcQi18ARp+nT2VosnQKZlG
 XxiuicokDdw5ayWHYajqMjEau2d5ll0s02w+fz74Fi656k1SE6Bm3w4ArVDfYDPoZ130
 lksE95mOJ84QFukU2tsdwO5BfSzoq9czPmoHyRWzqk7TBOwaElcm7ze9n+usCLMf0kXt
 za3fn9Z61NjSuVZbgAQ51eoRHug/caEW6a9JZ/4qv5jsIfb7slQYwO/SHMz2xiTQwia9
 56NwgSaq/xMvmswwEOgageCh2aROv3zEoiTyuSEeSVBS1+B2SOYCKuNxda0Wyqv7O4uh
 ew2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuONenwTE/GqA1T/tP52MTNdicqw+OsjMKj8BFwueIGktS79yNC+MDzbkUTV4qTbjd3QlqzuYGmg==@nongnu.org
X-Gm-Message-State: AOJu0YwKLIt5bLM22D9ovHqzh3+QlkD27207wTJNXP9BJN6zciHrlMP5
 fTHiEdXPL+FBLDiNr3Crb2G+VBpVx5JWbh4k/SSERziW3JA0bShyT5eZ2/T2IxzlLI42z3LTbUQ
 e9qieWSuJN6nRoOwwvI7cvhPwzWwhelIVf3Vj8byI0HKE3mE4DzeBoA==
X-Gm-Gg: ATEYQzxnP74oKgyftZ05RU8OSGViNmD0ZbbLErMEJh8i55s7iRQO2lQdZHcGHuC2O11
 oRNC52paDjmZ3s8/v0SRtfwsBMf5nWi/vNyCW1zhMWi3yBTkLmEF3euhnmobxUe4s3qnijgV28h
 cdw6wT83DhOPrz9EzLb0TLV1W52N8VXNxGbfV5eKIhGjmXlEF1Z/JF7tQ96eeW1oHfh0vcuorCh
 uzzeAAIn5EcyvURB6i50MJDXfBLvWOKkTfzbSFzIR9Xd8wF1dkvlqXj/49irSlgQeVmXsl/6692
 VVC8yEp5QGMNo2MylrvTKqODfaEbUPDfAIK9mdm6Mr3i30A/Q1ooXtFdNhHfy0Pb2HnWpHMEPg+
 3/NwvIyj2+pekZJOgmOhpJXnOIUjcP8V6cmpeo7glZlg2neXp+NqZMTSYLvH4+bugxWN1Kw==
X-Received: by 2002:a05:600c:a404:b0:485:4bd1:4c64 with SMTP id
 5b1f17b1804b1-4854bd14edamr36055755e9.31.1773235942865; 
 Wed, 11 Mar 2026 06:32:22 -0700 (PDT)
X-Received: by 2002:a05:600c:a404:b0:485:4bd1:4c64 with SMTP id
 5b1f17b1804b1-4854bd14edamr36055025e9.31.1773235942307; 
 Wed, 11 Mar 2026 06:32:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b7f255sm155922645e9.12.2026.03.11.06.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 06:32:21 -0700 (PDT)
Message-ID: <812bf464-7e21-447a-a377-9119bcc4b37f@redhat.com>
Date: Wed, 11 Mar 2026 14:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/32] hw/arm/tegra241-cmdqv: Emulate global and VINTF
 VCMDQ register writes
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com, phrdina@redhat.com
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-17-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260226105056.897-17-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UjoIm7ZktDbOo4RG3PAwxegEQaLGIwe__Lu5d3DTwvs_1773235943
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 2/26/26 11:50 AM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> This is the write side counterpart of the VCMDQ read emulation.
>
> Add write handling for global VCMDQ and VI_VCMDQ register windows.
> Per-VCMDQ accesses are decoded into a VCMDQ index and normalized to
> VCMDQ0_* offsets, reusing the same layout assumptions as the read path.
>
> VI_VCMDQ registers are treated as a logical alias of the global VCMDQ
> registers and share the same decoding logic.
>
> Writes are backed by cached register state only; no hardware queue
> mapping is performed yet.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.c | 83 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index d2e6938e44..e1f1562c44 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -151,6 +151,70 @@ static uint64_t tegra241_cmdqv_read(void *opaque, hwaddr offset, unsigned size)
>      }
>  }
>  
> +/*
> + * Write a VCMDQ register using VCMDQ0_* offsets.
> + *
> + * The caller normalizes the MMIO offset such that @offset0 always refers
> + * to a VCMDQ0_* register, while @index selects the VCMDQ instance.
> + */
> +static void
> +tegra241_cmdqv_write_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0, int index,
> +                           uint64_t value, unsigned size)
> +{
> +    switch (offset0) {
> +    case A_VCMDQ0_CONS_INDX:
> +        cmdqv->vcmdq_cons_indx[index] = value;
> +        return;
> +    case A_VCMDQ0_PROD_INDX:
> +        cmdqv->vcmdq_prod_indx[index] = (uint32_t)value;
> +        return;
> +    case A_VCMDQ0_CONFIG:
> +        if (value & R_VCMDQ0_CONFIG_CMDQ_EN_MASK) {
> +            cmdqv->vcmdq_status[index] |= R_VCMDQ0_STATUS_CMDQ_EN_OK_MASK;
> +        } else {
> +            cmdqv->vcmdq_status[index] &= ~R_VCMDQ0_STATUS_CMDQ_EN_OK_MASK;
> +        }
> +        cmdqv->vcmdq_config[index] = (uint32_t)value;
> +        return;
> +    case A_VCMDQ0_GERRORN:
> +        cmdqv->vcmdq_gerrorn[index] = (uint32_t)value;
> +        return;
> +    case A_VCMDQ0_BASE_L:
> +        if (size == 8) {
> +            cmdqv->vcmdq_base[index] = value;
> +        } else if (size == 4) {
> +            cmdqv->vcmdq_base[index] =
> +                (cmdqv->vcmdq_base[index] & 0xffffffff00000000ULL) |
> +                (value & 0xffffffffULL);
> +        }
If we compare to smmuv3 std command queue API, we miss some checks. See
smmu_writel()
        if (!smmu_cmdq_base_writable(s, reg_sec_sid)) {
for CONS
        if (!smmu_cmdq_disabled_stable(s, reg_sec_sid)) {

In the spec I have access to I failed to find any details about
equivalent restrictions

Can you check if those write accesses are always allowed?

Thanks

Eric

> +        return;
> +    case A_VCMDQ0_BASE_H:
> +        cmdqv->vcmdq_base[index] =
> +            (cmdqv->vcmdq_base[index] & 0xffffffffULL) |
> +            ((uint64_t)value << 32);
> +        return;
> +    case A_VCMDQ0_CONS_INDX_BASE_DRAM_L:
> +        if (size == 8) {
> +            cmdqv->vcmdq_cons_indx_base[index] = value;
> +        } else if (size == 4) {
> +            cmdqv->vcmdq_cons_indx_base[index] =
> +                (cmdqv->vcmdq_cons_indx_base[index] & 0xffffffff00000000ULL) |
> +                (value & 0xffffffffULL);
> +        }
> +        return;
> +    case A_VCMDQ0_CONS_INDX_BASE_DRAM_H:
> +        cmdqv->vcmdq_cons_indx_base[index] =
> +            (cmdqv->vcmdq_cons_indx_base[index] & 0xffffffffULL) |
> +            ((uint64_t)value << 32);
> +        return;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s unhandled write access at 0x%" PRIx64 "\n",
> +                      __func__, offset0);
> +        return;
> +    }
> +}
> +
>  static void tegra241_cmdqv_write_vintf(Tegra241CMDQV *cmdqv, hwaddr offset,
>                                         uint64_t value)
>  {
> @@ -187,6 +251,7 @@ static void tegra241_cmdqv_write(void *opaque, hwaddr offset, uint64_t value,
>                                   unsigned size)
>  {
>      Tegra241CMDQV *cmdqv = (Tegra241CMDQV *)opaque;
> +    int index;
>  
>      if (offset >= TEGRA241_CMDQV_IO_LEN) {
>          qemu_log_mask(LOG_UNIMP,
> @@ -213,6 +278,24 @@ static void tegra241_cmdqv_write(void *opaque, hwaddr offset, uint64_t value,
>      case A_VINTF0_CONFIG ... A_VINTF0_LVCMDQ_ERR_MAP_3:
>          tegra241_cmdqv_write_vintf(cmdqv, offset, value);
>          break;
> +    case A_VI_VCMDQ0_CONS_INDX ... A_VI_VCMDQ1_GERRORN:
> +        /* Same decoding as read() case: See comments above */
> +        offset -= 0x20000;
> +        QEMU_FALLTHROUGH;
> +    case A_VCMDQ0_CONS_INDX ... A_VCMDQ1_GERRORN:
> +        index = (offset - 0x10000) / 0x80;
> +        tegra241_cmdqv_write_vcmdq(cmdqv, offset - 0x80 * index, index, value,
> +                                   size);
> +        break;
> +    case A_VI_VCMDQ0_BASE_L ... A_VI_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        /* Same decoding as read() case: See comments above */
> +        offset -= 0x20000;
> +        QEMU_FALLTHROUGH;
> +    case A_VCMDQ0_BASE_L ... A_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        index = (offset - 0x20000) / 0x80;
> +        tegra241_cmdqv_write_vcmdq(cmdqv, offset - 0x80 * index, index, value,
> +                                   size);
> +        break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s unhandled write access at 0x%" PRIx64 "\n",
>                        __func__, offset);


