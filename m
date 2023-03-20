Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2923622ejb;
        Mon, 20 Mar 2023 08:15:09 -0700 (PDT)
X-Google-Smtp-Source: AK7set/o45lAod9m6p6NFr3NkQGMoeuD/e42Mhn9DKX0kBFu2sJ/jELbSviwOAWwXObEU+VfjP2x
X-Received: by 2002:a05:622a:1a8c:b0:3d2:a927:21b8 with SMTP id s12-20020a05622a1a8c00b003d2a92721b8mr29309338qtc.11.1679325308764;
        Mon, 20 Mar 2023 08:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679325308; cv=none;
        d=google.com; s=arc-20160816;
        b=dBWabFIZDZihqGp7YgGxwsyWwrcV4fRVOXHrivPXMT29ytCj1uJNlTvRixB3zKwaXw
         16JdfNXQ9jEe40b+IQXgQ6IBHXhItFUTsTKwuTqGHVM1YhYOija6zdBXtNo6Z3oifKjC
         VYTVRINhrtOgVa0PDskC7iVIYmcM7p0BdF0nrL3Gqz+w7/Oet4F/jLB6cdL/MuzHHaBI
         reJJmj80/Z6ycJEUXk/iINb1OyXK/z55r+Q1KG08K0zc4/7EZu2eeyimqz5ZTUbrggYW
         yevnoE7Gfr5BCgN7ApoZWMRurMb6P67wRvSFnDZCjDAqR5pu33sIBbwJ0xb6EJ0OG90Z
         NXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9704uFkS13kobmIrI/iVy8sLmlOw+uneTDbqmfJ/xV8=;
        b=ISafoxlBgBhDftY45xY7rt72VuJW5uPbkLWLINHL8AGF8BBjvQ7eamDF8Hbiwq8yF3
         5DL97AkZBxc/gcRvgZvU+iXe78wgMOnGfPsMY7jbuy/yQoQtXp4qTO3oayYnbgOgkZfi
         HvBQVFqh0OYmDFw4MMOwgr2NsAYiFBcPQ3+U8kusAcBWZooc+doH6b9OUauhy15f5MMr
         fAh1wMUDkCe4yYleeEmYsxMjyJUOlrGXR4sdytzQTrhrMRUyJQW1Nfzx8IsUi8bpYKBR
         S8xkxOB2GkYAWmEIn4uFickpGGNNro14A9nOUNqNej3ZV9S6LosTerP5/yOzlmW/xAEV
         gi1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c4MA6PWV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020a05622a000f00b003d4c9b6488fsi6195653qtw.33.2023.03.20.08.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Mar 2023 08:15:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c4MA6PWV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peHDz-0001OQ-KN; Mon, 20 Mar 2023 11:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peHDv-0001Nt-7g
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 11:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peHDs-0002Bm-Q5
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 11:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679325295;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9704uFkS13kobmIrI/iVy8sLmlOw+uneTDbqmfJ/xV8=;
 b=c4MA6PWVuqov2F/FZC+YV+EGo71RqK/3FiAkoDtW2LSvEyE/aIJZ65skInysl8BknR7xdQ
 bAtFxLbq7SXCCVNq5S71GxsrUvA954CwmSZOyOVoN9FP1S/D8qxOlCpLBg8ziluDdu0JPz
 677jZUIvSWUs4uaij3yQAvHjdihlFM8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-4pjLWFpdM8eoJ5lRAv9U9Q-1; Mon, 20 Mar 2023 11:14:54 -0400
X-MC-Unique: 4pjLWFpdM8eoJ5lRAv9U9Q-1
Received: by mail-qk1-f200.google.com with SMTP id
 o7-20020a05620a130700b00745fa7586a0so5507260qkj.20
 for <qemu-arm@nongnu.org>; Mon, 20 Mar 2023 08:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679325292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9704uFkS13kobmIrI/iVy8sLmlOw+uneTDbqmfJ/xV8=;
 b=i3bSzbZ09X4b/hShC7A9067IR0G02mMKyTcgh4iakOOtdMCfZFh8Ad1FPyUS5cwmi1
 HZYvLLj9/q3rxUB1SAOf282t1i4u2J4DNnHPt5Jf8aRx9HCuLn6G72ZWjaVymauezBGp
 1RwKeWoZb9wOzqq8mJFB0Qaq74LEA5SnT4A5Ec/EMjzocH4w1wztqpuvwSD4jB9JlQ8+
 8JmObQYIHP+fMfpn6oGACt6b0zl774BQe71nS7pAckw7f7T+lOQ8rt56tI68MSJa2C8B
 VegY5nhgN4GvCITTOhxel8Q1CDSK9ueJ4F7xEUnfo+LTbDiKozBurV6mIk7ZrIJKOo+2
 CsaA==
X-Gm-Message-State: AO0yUKUGfXj4GWl5t3aS/piQZYBPXhptZ7dqMgcWb2ZK1HlaaEKrdMFy
 9cM3YN2b7/s5lIqovw/lT6VJPm0NkEGMwWA179xAFF8hjJ3dFm1z6Rp0AjTBC0lVpesWw3LsTws
 YqczNjhvwlpsZ
X-Received: by 2002:ac8:5acf:0:b0:3da:aa9b:105a with SMTP id
 d15-20020ac85acf000000b003daaa9b105amr19541462qtd.17.1679325292593; 
 Mon, 20 Mar 2023 08:14:52 -0700 (PDT)
X-Received: by 2002:ac8:5acf:0:b0:3da:aa9b:105a with SMTP id
 d15-20020ac85acf000000b003daaa9b105amr19541414qtd.17.1679325292147; 
 Mon, 20 Mar 2023 08:14:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q6-20020ac87346000000b003df5fd89e21sm3288301qtp.0.2023.03.20.08.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:14:51 -0700 (PDT)
Message-ID: <de65ac97-7566-98a1-052c-f175a950e995@redhat.com>
Date: Mon, 20 Mar 2023 16:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 05/11] hw/arm/smmuv3: Parse STE config for stage-2
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-6-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230226220650.1480786-6-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: v1iGkLWR7JMm

Hi Mostafa,

On 2/26/23 23:06, Mostafa Saleh wrote:
> Parse stage-2 configuration from STE and populate it in SMMUS2Cfg.
> Validity of these value are checked when possible.
s/these value/field values
>
> Only AA64 tables are supported and STT is not supported.
Small Translation Tables (STT)
>
> According to SMMUv3 user manual "5.2 Stream Table Entry": All fields
it is not a user manual but rather an IP architecture spec. put the full
ref?
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
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in V2:
> - Parse S2PS and S2ENDI
> - Squash with S2VMID parsing patch
> - Squash with S2AFF parsing
> - Squash with fault reporting patch
> - Add check for S2T0SZ
> - Renaming and refactoring code
> ---
>  hw/arm/smmuv3-internal.h |   4 ++
>  hw/arm/smmuv3.c          | 138 +++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmuv3.h  |   3 +
>  3 files changed, 145 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 183d5ac8dc..3388e1a5f8 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -526,9 +526,13 @@ typedef struct CD {
>  #define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
>  #define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
>  #define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
> +#define STE_S2ENDI(x)      extract32((x)->word[5], 20, 1)
> +#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
I am afraid there is a shift in the fields below. S2HD should be 23
(problem in the original code) and everything is shifted.
>  #define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
>  #define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
>  #define STE_S2S(x)         extract32((x)->word[5], 26, 1)
> +#define STE_S2R(x)         extract32((x)->word[5], 27, 1)
> +
>  #define STE_CTXPTR(x)                                           \
>      ({                                                          \
>          unsigned long addr;                                     \
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 4e90343996..dc74a5442d 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -329,6 +329,46 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
>      return 0;
>  }
>  
> +/*
> + * Max valid value is 39 when SMMU_IDR3.STT == 0.
> + * In architectures after SMMUv3.0:
> + * - If STE.S2TG selects a 4KB or 16KB granule, the minimum valid value for this
> + * field is MAX(16, 64-IAS)
> + * - If STE.S2TG selects a 64KB granule, the minimum valid value for this field
> + * is (64-IAS).
> + * As we only support AA64, IAS = OAS.
OK this comes from STE.S2T0SZ description on the SMMU arch spec. You can
add this in previous patch too.
> + */
> +static bool t0sz_valid(SMMUTransCfg *cfg)
use S2t0sz to avoid confusion with S1 stuff
> +{
> +    if (cfg->s2cfg.tsz > 39) {
> +        return false;
> +    }
> +
> +    if (cfg->s2cfg.granule_sz == 16) {
> +        return (cfg->s2cfg.tsz >= 64 - cfg->s2cfg.oas);
> +    }
> +
> +    return (cfg->s2cfg.tsz >= MAX(64 - cfg->s2cfg.oas, 16));
> +}

this chapter also states:
"The usable range of values is further constrained by a function of the
starting level set by S2SL0 and, if S2AA64 == 1, granule size set by
S2TG as described by the Armv8 translation system. Use of a value of
S2T0SZ that is inconsistent with the permitted range (given S2SL0 and
S2TG) is ILLEGAL."
> +
> +/*
> + * Return true if s2 page table config is valid.
> + * This checks with the configured start level, ias_bits and granularity we can
> + * have a valid page table as described in ARM ARM D8.2 Translation process.
> + * The idea here is to see for the highest possible number of IPA bits, how
> + * many concatenated tables we would need, if it is more than 16, then this is
> + * not possible.
why? in that case doesn't it mean that we can't use concatanated tables?
> + */
> +static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
> +{
> +    int level = get_start_level(sl0, gran);
> +    uint64_t ipa_bits = 64 - t0sz;
> +    uint64_t max_ipa = (1ULL << ipa_bits) - 1;
> +    int nr_concat = pgd_idx(level, gran, max_ipa) + 1;
> +
> +    return nr_concat <= SMMU_MAX_S2_CONCAT;
> +}
> +
>  /* Returns < 0 in case of invalid STE, 0 otherwise */
>  static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>                        STE *ste, SMMUEventInfo *event)
> @@ -354,7 +394,105 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          return 0;
>      }
>  
> +    /*
> +     * If a stage is enabled in SW while not advertised, throw bad ste
> +     * according to SMMU manual 5.2 Stream Table Entry - [3:1] Config.
> +     */
> +    if (!STAGE1_SUPPORTED(s) && STE_CFG_S1_ENABLED(config)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S1 used but not supported.\n");
> +        goto bad_ste;
> +    }
> +    if (!STAGE2_SUPPORTED(s) && STE_CFG_S2_ENABLED(config)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S2 used but not supported.\n");
> +        goto bad_ste;
> +    }
> +
> +    if (STAGE2_SUPPORTED(s)) {
> +        /* VMID is considered even if s2 is disabled. */
> +        cfg->s2cfg.vmid = STE_S2VMID(ste);
> +    } else {
> +        /* Default to -1 */
> +        cfg->s2cfg.vmid = -1;
> +    }
> +
>      if (STE_CFG_S2_ENABLED(config)) {
I think it would improve the readability to introduce a separate
function decode_ste_s2_cftg() taking the s2cfg to be populated
> +        cfg->stage = 2;
> +
> +        if (STE_S2AA64(ste) == 0x0) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "SMMUv3 AArch32 tables not supported\n");
> +            g_assert_not_reached();
> +        }
> +
> +        switch (STE_S2TG(ste)) {
> +        case 0x0: /* 4KB */
> +            cfg->s2cfg.granule_sz = 12;
> +            break;
> +        case 0x1: /* 64KB */
> +            cfg->s2cfg.granule_sz = 16;
> +            break;
> +        case 0x2: /* 16KB */
> +            cfg->s2cfg.granule_sz = 14;
> +            break;
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "SMMUv3 bad STE S2TG: %x\n", STE_S2TG(ste));
> +            goto bad_ste;
> +        }
> +
> +        cfg->s2cfg.vttb = STE_S2TTB(ste);
> +
> +        cfg->s2cfg.sl0 = STE_S2SL0(ste);
> +        /* FEAT_TTST not supported. */
> +        if (cfg->s2cfg.sl0 == 0x3) {
> +            qemu_log_mask(LOG_UNIMP, "SMMUv3 S2SL0 = 0x3 has no meaning!\n");
> +            goto bad_ste;
> +        }
> +
> +
> +        cfg->s2cfg.oas = oas2bits(MIN(STE_S2PS(ste), SMMU_IDR5_OAS));
> +        /*
> +         * It is ILLEGAL for the address in S2TTB to be outside the range
> +         * described by the effective S2PS value.
> +         */
> +        if (cfg->s2cfg.vttb & ~(MAKE_64BIT_MASK(0, cfg->s2cfg.oas))) {
> +            goto bad_ste;
> +        }
> +
> +        cfg->s2cfg.tsz = STE_S2T0SZ(ste);
> +
> +        if (!t0sz_valid(cfg)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 bad STE S2T0SZ = %d\n",
> +                          cfg->s2cfg.tsz);
> +            goto bad_ste;
> +        }
> +
> +        if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
> +                                     cfg->s2cfg.granule_sz)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "SMMUv3 STE stage 2 config not valid!\n");
> +            goto bad_ste;
> +        }
> +
> +        /* Only LE supported(IDR0.TTENDIAN). */
> +        if (STE_S2ENDI(ste)) {
qemu_log
> +            goto bad_ste;
> +        }
> +
> +        cfg->s2cfg.affd = STE_S2AFFD(ste);
> +        /*
> +         * We reuse the same code used for stage-1 with flag record_faults.
> +         * However when nested translation is supported we would
> +         * need to separate stage-1 and stage-2 faults.
> +         */
> +        cfg->record_faults = STE_S2R(ste);
> +        /* As stall is not supported. */
> +        if (STE_S2S(ste)) {
> +            qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
> +            goto bad_ste;
> +        }
> +
> +        /* This is still here as stage 2 has not been fully enabled yet. */
>          qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
>          goto bad_ste;
>      }
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
Thanks

Eric

