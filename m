Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp903984ejq;
        Wed, 17 May 2023 00:28:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6McHa7a3Qs//jU654+aDPAy7Xlkg9fr34YkJ5ZJzynWMiRs79alXr/GoWeYHpOWkCqrz4I
X-Received: by 2002:a05:6214:c2b:b0:623:7707:5650 with SMTP id a11-20020a0562140c2b00b0062377075650mr7922547qvd.15.1684308493386;
        Wed, 17 May 2023 00:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684308493; cv=none;
        d=google.com; s=arc-20160816;
        b=tgRARH1B9lK6SeYkTYcKZV2WzLKYh7sck9gGr2uhDNEFLc9Fp4wJKIzvQ7RFVPY0x/
         BdAPUIbC9cu+1WDblZtzU11VfZX/0hzxFvwgljklLr+4MJR8Z9qV+LH7NBFSlCBix40Q
         z1Ttce53Mhr2cy1RPB39/CWopatvrVsOAfI4FxbvT1ehuIVIKeoWJngN8TRwJaMW8DwE
         blnwGVCM3rO0XDgeXJFBFWkhDEBpT9P3GcG9TgYNTOhW3Nu/2IC1k9ptDvkC+qp2yR/N
         5YiUsf7Le+vC7Xe1H0QUw4roZWOh1m3lrAbDQ3QjgtBaNgCP7L0fMRBYxWrD3Bevglk+
         vROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=O6K/TfKZE7IzpLZKOq2YKESOPYL2SR6py+vyn4dwzBU=;
        b=szSIFILwL8PliS6Vp4mRwKfsJbSNX+xrwc9Knm0s25WgiFQWzE4uUb6NoWgftQtm5V
         dtvD7DJG3Pv5Tu77v9xHrVSZLCDa3jqD1rgZds1v2EZIc9ms3rrPVtCL62tPG3wfxCiq
         AEl8GO8mk+NKIkkWWShCUL6Xq08mfvrah4mMlPCAYp9ROiD3wIeJ3waUdDwiRNL91dK5
         3ADdmia38UNniSGf1TD/QtBlQBQvIdeQGN2eLHNKe8WbcMGJbFZwHPLRzydvPjHAUu27
         e0t+sKvZeb97TSgxoa02Aem7P8S+qjkO9PdWI9CCEUSqozTCUWe201fARpNm8FbyRvld
         0VMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Clafsvqs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj13-20020a056214528d00b005efd3b426aasi12789196qvb.213.2023.05.17.00.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 May 2023 00:28:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Clafsvqs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pzBZj-0003QC-99; Wed, 17 May 2023 03:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pzBZi-0003Pw-18
 for qemu-arm@nongnu.org; Wed, 17 May 2023 03:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pzBZf-0002ng-Ip
 for qemu-arm@nongnu.org; Wed, 17 May 2023 03:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684308469;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6K/TfKZE7IzpLZKOq2YKESOPYL2SR6py+vyn4dwzBU=;
 b=Clafsvqsau6YZ81j3anrMbZIRKGTuYdlUCqh2ZkmMnStIF6MI1xSNuSqQP2WSaO1GHyr0K
 knQy4TeaAAUdh+PkcU2DOXGfeP7aUui44FA5sjhbm8zPT6srg8cDGOl+rVIxFedOz/jcQY
 EsLB32tEX1aSNq2A7TbSAG3uHxmsLgU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331--rk3YmfPMoOWLpfha0wFsA-1; Wed, 17 May 2023 03:27:47 -0400
X-MC-Unique: -rk3YmfPMoOWLpfha0wFsA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2f2981b8364so270105f8f.1
 for <qemu-arm@nongnu.org>; Wed, 17 May 2023 00:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684308466; x=1686900466;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O6K/TfKZE7IzpLZKOq2YKESOPYL2SR6py+vyn4dwzBU=;
 b=RpbUWY4kjIdfm8XkHAYWNSsy97Dl1ixRYzlK2f7BF/Q3T4twtQImfVYKWPRMe4rCVU
 5x2ArxtPqSxmlCoaerw51eQ1B0OkAuTno3FYiT4ExQCe09mr+TOjoAZB6Wc232wceEDz
 24wFcK02BChewZzV00x25E6pj0KpkkghvrL+98d51JkGf9KpMKld1GN/HvUjiDrIXK8Z
 2yM6bXenIpsX1izG1HTomZ5z6X2cUQYs3yVHvE7N7HrH/aKoMk7Zxp3O1tJGijTe88cc
 ZeK8Xi7S78xaRjrQuwDswqs2bIsTapejmwmAn3mU9LXB5vUOZb9/QN2pWIj3oz7yaDA7
 Gq6Q==
X-Gm-Message-State: AC+VfDwiaixj60rhnMgUZ+Usp/FdKrNY1t2UggVDQ4RW8+jCrTb3l5C8
 sw8l0WHGk7gCyRcbcYAjgwsKnzFIZ9+wwTeoicDKrH9wMt/N6y+/1c762/B9/q4DlKiZXuqNNX6
 Be3NzPOdyoYDq
X-Received: by 2002:adf:fccd:0:b0:2f5:7e67:9c68 with SMTP id
 f13-20020adffccd000000b002f57e679c68mr33209130wrs.30.1684308465972; 
 Wed, 17 May 2023 00:27:45 -0700 (PDT)
X-Received: by 2002:adf:fccd:0:b0:2f5:7e67:9c68 with SMTP id
 f13-20020adffccd000000b002f57e679c68mr33209112wrs.30.1684308465602; 
 Wed, 17 May 2023 00:27:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d4e01000000b003078c535277sm1745151wrt.91.2023.05.17.00.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 00:27:45 -0700 (PDT)
Message-ID: <7d69b5f1-b1dc-5ad6-ba3e-da90d669bb1d@redhat.com>
Date: Wed, 17 May 2023 09:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 05/10] hw/arm/smmuv3: Parse STE config for stage-2
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230516203327.2051088-1-smostafa@google.com>
 <20230516203327.2051088-6-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230516203327.2051088-6-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.666, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: HjXtRLYRZKN5

Hi Mostafa,

On 5/16/23 22:33, Mostafa Saleh wrote:
> Parse stage-2 configuration from STE and populate it in SMMUS2Cfg.
> Validity of field values are checked when possible.
>
> Only AA64 tables are supported and Small Translation Tables (STT) are
> not supported.
>
> According to SMMUv3 UM(IHI0070E) "5.2 Stream Table Entry": All fields
> with an S2 prefix (with the exception of S2VMID) are IGNORED when
> stage-2 bypasses translation (Config[1] == 0).
>
> Which means that VMID can be used(for TLB tagging) even if stage-2 is
> bypassed, so we parse it unconditionally when S2P exists. Otherwise
> it is set to -1.(only S1P)
>
> As stall is not supported, if S2S is set the translation would abort.
> For S2R, we reuse the same code used for stage-1 with flag
> record_faults. However when nested translation is supported we would
> need to separate stage-1 and stage-2 faults.
>
> Fix wrong shift in STE_S2HD, STE_S2HA, STE_S2S.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
> Changes in V4:
> - Rename and simplify PTW_FAULT_ALLOWED
> - Fix comment indent
> Changes in V3:
> - Separate fault handling.
> - Fix shift in STE_S2HD, STE_S2HA, STE_S2S, STE_S2R.
> - Rename t0sz_valid to s2t0sz_valid.
> - separate stage-2 STE parsing in decode_ste_s2_cfg.
> - Add a log for invalid S2ENDI and S2TTB.
> - Set default value for stage-1 OAS.
> - Move and rename SMMU_MAX_S2_CONCAT to VMSA_MAX_S2_CONCAT.
> Changes in V2:
> - Parse S2PS and S2ENDI
> - Squash with S2VMID parsing patch
> - Squash with S2AFF parsing
> - Squash with fault reporting patch
> - Add check for S2T0SZ
> - Renaming and refactoring code
> ---
>  hw/arm/smmuv3-internal.h     |  10 +-
>  hw/arm/smmuv3.c              | 181 +++++++++++++++++++++++++++++++++--
>  include/hw/arm/smmu-common.h |   1 +
>  include/hw/arm/smmuv3.h      |   3 +
>  4 files changed, 185 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 183d5ac8dc..6d1c1edab7 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -526,9 +526,13 @@ typedef struct CD {
>  #define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
>  #define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
>  #define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
> -#define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
> -#define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
> -#define STE_S2S(x)         extract32((x)->word[5], 26, 1)
> +#define STE_S2ENDI(x)      extract32((x)->word[5], 20, 1)
> +#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
> +#define STE_S2HD(x)        extract32((x)->word[5], 23, 1)
> +#define STE_S2HA(x)        extract32((x)->word[5], 24, 1)
> +#define STE_S2S(x)         extract32((x)->word[5], 25, 1)
> +#define STE_S2R(x)         extract32((x)->word[5], 26, 1)
> +
>  #define STE_CTXPTR(x)                                           \
>      ({                                                          \
>          unsigned long addr;                                     \
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 4e90343996..27840f2d66 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -33,6 +33,9 @@
>  #include "smmuv3-internal.h"
>  #include "smmu-internal.h"
>  
> +#define PTW_RECORD_FAULT(cfg)   (((cfg)->stage == 1) ? (cfg)->record_faults : \
> +                                 (cfg)->s2cfg.record_faults)
> +
>  /**
>   * smmuv3_trigger_irq - pulse @irq if enabled and update
>   * GERROR register in case of GERROR interrupt
> @@ -329,11 +332,141 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
>      return 0;
>  }
>  
> +/*
> + * Max valid value is 39 when SMMU_IDR3.STT == 0.
> + * In architectures after SMMUv3.0:
> + * - If STE.S2TG selects a 4KB or 16KB granule, the minimum valid value for this
> + *   field is MAX(16, 64-IAS)
> + * - If STE.S2TG selects a 64KB granule, the minimum valid value for this field
> + *   is (64-IAS).
> + * As we only support AA64, IAS = OAS.
> + */
> +static bool s2t0sz_valid(SMMUTransCfg *cfg)
> +{
> +    if (cfg->s2cfg.tsz > 39) {
> +        return false;
> +    }
> +
> +    if (cfg->s2cfg.granule_sz == 16) {
> +        return (cfg->s2cfg.tsz >= 64 - oas2bits(SMMU_IDR5_OAS));
> +    }
> +
> +    return (cfg->s2cfg.tsz >= MAX(64 - oas2bits(SMMU_IDR5_OAS), 16));
> +}
> +
> +/*
> + * Return true if s2 page table config is valid.
> + * This checks with the configured start level, ias_bits and granularity we can
> + * have a valid page table as described in ARM ARM D8.2 Translation process.
> + * The idea here is to see for the highest possible number of IPA bits, how
> + * many concatenated tables we would need, if it is more than 16, then this is
> + * not possible.
> + */
> +static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
> +{
> +    int level = get_start_level(sl0, gran);
> +    uint64_t ipa_bits = 64 - t0sz;
> +    uint64_t max_ipa = (1ULL << ipa_bits) - 1;
> +    int nr_concat = pgd_concat_idx(level, gran, max_ipa) + 1;
> +
> +    return nr_concat <= VMSA_MAX_S2_CONCAT;
> +}
> +
> +static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
> +{
> +    cfg->stage = 2;
> +
> +    if (STE_S2AA64(ste) == 0x0) {
> +        qemu_log_mask(LOG_UNIMP,
> +                      "SMMUv3 AArch32 tables not supported\n");
> +        g_assert_not_reached();
> +    }
> +
> +    switch (STE_S2TG(ste)) {
> +    case 0x0: /* 4KB */
> +        cfg->s2cfg.granule_sz = 12;
> +        break;
> +    case 0x1: /* 64KB */
> +        cfg->s2cfg.granule_sz = 16;
> +        break;
> +    case 0x2: /* 16KB */
> +        cfg->s2cfg.granule_sz = 14;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMMUv3 bad STE S2TG: %x\n", STE_S2TG(ste));
> +        goto bad_ste;
> +    }
> +
> +    cfg->s2cfg.vttb = STE_S2TTB(ste);
> +
> +    cfg->s2cfg.sl0 = STE_S2SL0(ste);
> +    /* FEAT_TTST not supported. */
> +    if (cfg->s2cfg.sl0 == 0x3) {
> +        qemu_log_mask(LOG_UNIMP, "SMMUv3 S2SL0 = 0x3 has no meaning!\n");
> +        goto bad_ste;
> +    }
> +
> +    /* For AA64, The effective S2PS size is capped to the OAS. */
> +    cfg->s2cfg.eff_ps = oas2bits(MIN(STE_S2PS(ste), SMMU_IDR5_OAS));
> +    /*
> +     * It is ILLEGAL for the address in S2TTB to be outside the range
> +     * described by the effective S2PS value.
> +     */
> +    if (cfg->s2cfg.vttb & ~(MAKE_64BIT_MASK(0, cfg->s2cfg.eff_ps))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMMUv3 S2TTB too large 0x%lx, effective PS %d bits\n",
> +                      cfg->s2cfg.vttb,  cfg->s2cfg.eff_ps);
> +        goto bad_ste;
> +    }
> +
> +    cfg->s2cfg.tsz = STE_S2T0SZ(ste);
> +
> +    if (!s2t0sz_valid(cfg)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 bad STE S2T0SZ = %d\n",
> +                      cfg->s2cfg.tsz);
> +        goto bad_ste;
> +    }
> +
> +    if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
> +                                    cfg->s2cfg.granule_sz)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMMUv3 STE stage 2 config not valid!\n");
> +        goto bad_ste;
> +    }
> +
> +    /* Only LE supported(IDR0.TTENDIAN). */
> +    if (STE_S2ENDI(ste)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMMUv3 STE_S2ENDI only supports LE!\n");
> +        goto bad_ste;
> +    }
> +
> +    cfg->s2cfg.affd = STE_S2AFFD(ste);
> +
> +    cfg->s2cfg.record_faults = STE_S2R(ste);
> +    /* As stall is not supported. */
> +    if (STE_S2S(ste)) {
> +        qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
> +        goto bad_ste;
> +    }
> +
> +    /* This is still here as stage 2 has not been fully enabled yet. */
> +    qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
> +    goto bad_ste;
> +
> +    return 0;
> +
> +bad_ste:
> +    return -EINVAL;
> +}
> +
>  /* Returns < 0 in case of invalid STE, 0 otherwise */
>  static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>                        STE *ste, SMMUEventInfo *event)
>  {
>      uint32_t config;
> +    int ret;
>  
>      if (!STE_VALID(ste)) {
>          if (!event->inval_ste_allowed) {
> @@ -354,11 +487,39 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          return 0;
>      }
>  
> -    if (STE_CFG_S2_ENABLED(config)) {
> -        qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
> +    /*
> +     * If a stage is enabled in SW while not advertised, throw bad ste
> +     * according to user manual(IHI0070E) "5.2 Stream Table Entry".
> +     */
> +    if (!STAGE1_SUPPORTED(s) && STE_CFG_S1_ENABLED(config)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S1 used but not supported.\n");
> +        goto bad_ste;
> +    }
> +    if (!STAGE2_SUPPORTED(s) && STE_CFG_S2_ENABLED(config)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S2 used but not supported.\n");
>          goto bad_ste;
>      }
>  
> +    if (STAGE2_SUPPORTED(s)) {
> +        /* VMID is considered even if s2 is disabled. */
> +        cfg->s2cfg.vmid = STE_S2VMID(ste);
> +    } else {
> +        /* Default to -1 */
> +        cfg->s2cfg.vmid = -1;
> +    }
> +
> +    if (STE_CFG_S2_ENABLED(config)) {
> +        /*
> +         * Stage-1 OAS defaults to OAS even if not enabled as it would be used
> +         * in input address check for stage-2.
> +         */
> +        cfg->oas = oas2bits(SMMU_IDR5_OAS);
> +        ret = decode_ste_s2_cfg(cfg, ste);
> +        if (ret) {
> +            goto bad_ste;
> +        }
> +    }
> +
>      if (STE_S1CDMAX(ste) != 0) {
>          qemu_log_mask(LOG_UNIMP,
>                        "SMMUv3 does not support multiple context descriptors yet\n");
> @@ -702,7 +863,13 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      if (cached_entry) {
>          if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
>              status = SMMU_TRANS_ERROR;
> -            if (cfg->record_faults) {
> +            /*
> +             * We know that the TLB only contains either stage-1 or stage-2 as
> +             * nesting is not supported. So it is sufficient to check the
> +             * translation stage to know the TLB stage for now.
> +             */
> +            event.u.f_walk_eabt.s2 = (cfg->stage == 2);
> +            if (PTW_RECORD_FAULT(cfg)) {
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
>                  event.u.f_permission.rnw = flag & 0x1;
> @@ -728,28 +895,28 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              event.u.f_walk_eabt.addr2 = ptw_info.addr;
>              break;
>          case SMMU_PTW_ERR_TRANSLATION:
> -            if (cfg->record_faults) {
> +            if (PTW_RECORD_FAULT(cfg)) {
>                  event.type = SMMU_EVT_F_TRANSLATION;
>                  event.u.f_translation.addr = addr;
>                  event.u.f_translation.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_ADDR_SIZE:
> -            if (cfg->record_faults) {
> +            if (PTW_RECORD_FAULT(cfg)) {
>                  event.type = SMMU_EVT_F_ADDR_SIZE;
>                  event.u.f_addr_size.addr = addr;
>                  event.u.f_addr_size.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_ACCESS:
> -            if (cfg->record_faults) {
> +            if (PTW_RECORD_FAULT(cfg)) {
>                  event.type = SMMU_EVT_F_ACCESS;
>                  event.u.f_access.addr = addr;
>                  event.u.f_access.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_PERMISSION:
> -            if (cfg->record_faults) {
> +            if (PTW_RECORD_FAULT(cfg)) {
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
>                  event.u.f_permission.rnw = flag & 0x1;
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 97cea8ea06..4f1405d4e4 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -29,6 +29,7 @@
>  
>  /* VMSAv8-64 Translation constants and functions */
>  #define VMSA_LEVELS                         4
> +#define VMSA_MAX_S2_CONCAT                  16
>  
>  #define VMSA_STRIDE(gran)                   ((gran) - VMSA_LEVELS + 1)
>  #define VMSA_BIT_LVL(isz, strd, lvl)        ((isz) - (strd) * \
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index a0c026402e..6031d7d325 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -83,4 +83,7 @@ struct SMMUv3Class {
>  #define TYPE_ARM_SMMUV3   "arm-smmuv3"
>  OBJECT_DECLARE_TYPE(SMMUv3State, SMMUv3Class, ARM_SMMUV3)
>  
> +#define STAGE1_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S1P)
> +#define STAGE2_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S2P)
> +
>  #endif

