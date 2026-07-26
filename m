Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57844C531C9
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Jul 2026 14:23:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnzkU-0004tW-Sf; Sun, 26 Jul 2026 10:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wnzkS-0004sj-Mw
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 10:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wnzkQ-0002Vv-LA
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 10:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785075753;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9onKOvuadw2ucT1LclFaSpJKEsgm8Ez+YxGJOnocJ4=;
 b=aTujde8ahoibV2j7EdnMNc3NriHCOV3FDZw9BWFbQybmhBSz/hX/mvkKdPfqqbi+2z1Ii9
 xRkvViStrJIK2KI6iJOFv9HJkG7TrMMzgrJ3j5oQScKYwfVB4EJo6gT48BmxYQtLI6YP0F
 GFX8+RsvHmUNmYLunefQ4IstixKGOIk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-5tvQtdwJMZCQMD8NNvdHeA-1; Sun, 26 Jul 2026 10:22:31 -0400
X-MC-Unique: 5tvQtdwJMZCQMD8NNvdHeA-1
X-Mimecast-MFC-AGG-ID: 5tvQtdwJMZCQMD8NNvdHeA_1785075750
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-495569acf8dso12509345e9.1
 for <qemu-arm@nongnu.org>; Sun, 26 Jul 2026 07:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785075750; x=1785680550;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=F9onKOvuadw2ucT1LclFaSpJKEsgm8Ez+YxGJOnocJ4=;
 b=XIQl62lmBSwETEnHZRd9LVGODEdm6n6gwQHD74pLzd3x23e1RV+fX82+QgxvSBXoHF
 wQPsQa+WtkweHAMYrq6p5DCD4gUQRsWlOuQbRxi51g3+6IdXXLz9N3Lp8YphZZdOa3ly
 Mc7Qx44vhSqu2yEK3ykLOkwmtuLk850cyU0XsP4mTtYXDWmyAeGMZnvDzebPz5O3iaDT
 y4VWf5rBqcghnZUE/izu6ZZ4lyWj2a47FSMl/3i6S9haZ3FrbL2ITJr6uvNRi/CUvhtC
 2YCwTuutBTz8ice4ju2aUt2NiPRzlWGOoU/+wmL31mjkgg873EUTac0Gvbgkw2h1PFhF
 U/uQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrb1B6v72RA/Nw5txIgChTg+XSwPYDp3ZkSdhNLwe9FwZQEDSiwNef1wuwViK45ZsBnvKyYdjOjYg==@nongnu.org
X-Gm-Message-State: AOJu0YyyV9utz41Mp9NSlVUG/Ux1mtKHP7JX54zu539OIuZ+9XhUBjli
 rXsBZMRRMY7Ry4FMiR/MfrGdu1aZZZiFaO7lyMjwOs49MgDPoM1cVWDTN+9THPpmcwNQ7823gsX
 Yi6eEioLP0GluVrujtg+473lgTPt217sJNpH21ZFGKLj5ITUh4Woouw==
X-Gm-Gg: AR+sD10l3AwCkiQBY+MHOy4418SrVVVaQmtv3I4xLjOkfMl1R4OIDfqzfV8lhryDtIl
 OF+d5oEsM6KzmL+i1aTIELsv+KuViAoy7ZhpWapY1fvBF49yJaCRit9tJ099g220+i1K09iqGPn
 rP/tcbx05+JkLsMRuBGpwBwYsPeSwg2HeNOz9eRSDFsKp4otHmiO7qxCq9Zl6eioe+TfRGzjQDF
 1qhTUg50OPLXlAB802NHZcdpkxZLD8YkzJXBXrEtTKurowWsfE2BiYprPGFX29Okbwx//1/B1e2
 L8Py7/iga9bMslUFwOL8uvKBRbXg+VJTxME2bAIgyMt5S43ObP6r3c6O1APj7c5HMLaNHlgeppY
 MqTvfRdNiwluVcQBrvod1ib7xbCCcbR5z1YY=
X-Received: by 2002:a05:600c:4445:b0:495:4fd4:144b with SMTP id
 5b1f17b1804b1-496b5719f73mr62370495e9.21.1785075750382; 
 Sun, 26 Jul 2026 07:22:30 -0700 (PDT)
X-Received: by 2002:a05:600c:4445:b0:495:4fd4:144b with SMTP id
 5b1f17b1804b1-496b5719f73mr62370005e9.21.1785075749875; 
 Sun, 26 Jul 2026 07:22:29 -0700 (PDT)
Received: from [192.168.3.191] (228.246.150.77.rev.sfr.net. [77.150.246.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f939c1465sm25982791f8f.26.2026.07.26.07.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jul 2026 07:22:29 -0700 (PDT)
Message-ID: <fe76f638-81aa-43cf-aafb-c774ab1902f8@redhat.com>
Date: Sun, 26 Jul 2026 16:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 14/19] target/arm/kvm: compute supported values for
 ID register fields
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 prerna.saxena@nutanix.com
References: <20260716213858.609699-1-khushit.shah@nutanix.com>
 <20260716213858.609699-15-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260716213858.609699-15-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mEIOH0AXX6Hmnn86u7pRFoIEqNYoeHr7KdnBLk6Twdc_1785075750
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Khushit,

On 7/16/26 11:38 PM, Khushit Shah wrote:
> Add arm_field_get_supported_values() which, for a given ID register
> field, builds the set of values KVM allows it to take on the live host.
>
> Non-writable fields are pinned to the host value. Writable fields follow
> their per field constraints. This function likely needs change when
> KVM starts exposing a new writable field that is not lower-safe, hence,
> the special handling of TGranX_2/SpecSEI/L1Ip/MIDR/REVIDR/AIDR.
so this looks quite risky. 
>
> Cross-field constraints are not modelled; for example ID_AA64ZFR0_EL1
> is gated by SVE. Reproducing every inter-field dependency in QEMU
> would only duplicate KVM's logic and drift out of sync with it.

Isn't qmp_query_cpu_model_expansion sufficient? In general upper layers
will try to apply raw named models. If ajustements are needed between
source and destination, we know field candidate values (either the
source or dest one) and this latter can be directly tried using
qmp_query_cpu_model_expansion write. On top of that
qmp_query_cpu_model_expansion can be directly checked against a scratch
vcpu reusing the logic implemented at kernel level.
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  target/arm/kvm.c     | 99 ++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/kvm_arm.h | 26 ++++++++++++
>  2 files changed, 125 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index c38b99cfce..8f452f9570 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1262,6 +1262,105 @@ bool kvm_arm_cpu_post_load(ARMCPU *cpu)
>      return true;
>  }
>  
> +static bool arm_field_is_signed(const ARM64SysRegField *field)
> +{
> +    return field_matches(field, ID_AA64MMFR0_EL1_IDX, "TGran4")    ||
> +           field_matches(field, ID_AA64MMFR0_EL1_IDX, "TGran64")   ||
> +           field_matches(field, ID_MMFR0_EL1_IDX, "InnerShr")      ||
> +           field_matches(field, ID_MMFR0_EL1_IDX, "OuterShr")      ||
> +           field_matches(field, ID_AA64DFR0_EL1_IDX, "DoubleLock") ||
> +           field_matches(field, ID_AA64DFR0_EL1_IDX, "PMUVer")     ||
> +           field_matches(field, ID_DFR0_EL1_IDX, "PerfMon")        ||
> +           field_matches(field, ID_AA64PFR1_EL1_IDX, "MTE_frac")   ||
> +           field_matches(field, ID_AA64MMFR4_EL1_IDX, "E2H0")      ||
> +           field_matches(field, ID_DFR1_EL1_IDX, "MTPMU")          ||
> +           field_matches(field, ID_AA64PFR0_EL1_IDX, "FP")         ||
> +           field_matches(field, ID_AA64PFR0_EL1_IDX, "AdvSIMD");
Can't we extract this from Register.json instead?
> +}
> +
> +static void ranges_add(GArray *ranges, uint64_t min, uint64_t max)
> +{
> +    ArmFieldRange r = { .min = min, .max = max };
> +    g_array_append_val(ranges, r);
> +}
> +
> +void arm_field_get_supported_values(const ARM64SysRegField *field,
> +                                    const ARMISARegisters *host_isar,
> +                                    ArmFieldValueSet **value_set)
> +{
> +    bool is_signed = arm_field_is_signed(field);
> +    uint64_t host = extract64(host_isar->idregs[field->index],
> +                              field->shift, field->length);
> +    GArray *ranges = g_array_new(false, false, sizeof(ArmFieldRange));
> +
> +    /* A non-writable field can only ever hold the host value. */
> +    if (!arm_field_is_writable(field)) {
> +        ranges_add(ranges, host, host);
> +        goto done;
you already get this info from qmp_query_cpu_model_expansion
> +    }
> +
> +    if (field_matches(field, ID_AA64MMFR0_EL1_IDX, "TGran4_2")  ||
> +        field_matches(field, ID_AA64MMFR0_EL1_IDX, "TGran16_2") ||
> +        field_matches(field, ID_AA64MMFR0_EL1_IDX, "TGran64_2")) {
> +        /* Either support the host value or the "off" value */
> +        ranges_add(ranges, host, host);
> +        if (host != 1) { /* 1 = "off" */
> +            ranges_add(ranges, 1, 1);
> +        }
> +    } else if (field_matches(field, CTR_EL0_IDX, "L1Ip")) {
> +        /* Only safe to downgrade to VIPT, other values are reserved. */
> +        ranges_add(ranges, host, host);
> +        if (host != 2) { /* 2 = "VIPT" */
> +            ranges_add(ranges, 2, 2);
> +        }
> +    } else if (field_matches(field, ID_AA64MMFR1_EL1_IDX, "SpecSEI") ||
> +               field_matches(field, ID_MMFR4_EL1_IDX, "SpecSEI")) {
> +        /* It is safe to upgrade SpecSEI to 1, other values are reserved. */
> +        ranges_add(ranges, host, host);
> +        if (host != 1) {
> +            ranges_add(ranges, 1, 1);
> +        }
> +    } else if (field->index == MIDR_EL1_IDX ||
> +               field->index == REVIDR_EL1_IDX ||
> +               field->index == AIDR_EL1_IDX) {
> +        /*
> +         * No restriction on value that can be set for implementation ID
> +         * registers fields.
> +         */
> +        uint64_t max = 0;
> +        if (field->length == 64) {
> +            max = ~0ULL;
> +        } else {
> +            max = (1ULL << field->length) - 1;
> +        }
> +        ranges_add(ranges, 0, max);
> +    } else {
> +        /*
> +         * After handling the special cases, other writable fields are
> +         * either lower-safe or signed lower-safe.
> +         */
> +        if (field->arch_vals_count) {
> +            for (uint32_t i = 0; i < field->arch_vals_count; i++) {
> +                uint64_t av = field->arch_vals[i].value;
> +                int64_t v = is_signed ?
> +                    sextract64(av, 0, field->length) : (int64_t)av;
> +                int64_t hv = is_signed ?
> +                    sextract64(host, 0, field->length) : (int64_t)host;
> +                if (v <= hv) {
> +                    ranges_add(ranges, av, av);
> +                }
> +            }
> +        } else {
> +            g_assert(!is_signed); /* No signed field with no arch vals */
> +            ranges_add(ranges, 0, host);
> +        }
> +    }
> +done:
> +    *value_set = g_new0(ArmFieldValueSet, 1);
> +    (*value_set)->n_ranges = ranges->len;
> +    (*value_set)->ranges = (ArmFieldRange *)g_array_free(ranges, false);
> +}
> +
>  static bool arm_field_skip_writeback_always(const ARM64SysRegField *field)
>  {
>      /*
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 133a026036..9f15c91c4e 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -143,6 +143,32 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>  void kvm_arm_add_vcpu_properties(ARMCPU *cpu);
>  
>  typedef struct ARM64SysReg ARM64SysReg;
> +typedef struct ARM64SysRegField ARM64SysRegField;
> +typedef struct ARMISARegisters ARMISARegisters;
> +
> +typedef struct ArmFieldRange {
> +    uint64_t min;
> +    uint64_t max;
> +} ArmFieldRange;
> +
> +typedef struct ArmFieldValueSet {
> +    ArmFieldRange *ranges;
> +    size_t n_ranges;
> +} ArmFieldValueSet;
> +
> +/**
> + * arm_field_get_supported_values:
> + * @field: The field to get the supported values for
> + * @host_isar: The host ISAR registers
> + * @value_set: The set of supported values for the @field
> + *
> + * Will be allocated and filled in with the supported values for the @field
> + * based on the host_isar and whether the field is writable or not.
> + * The caller must free the value_set.
> + */
> +void arm_field_get_supported_values(const ARM64SysRegField *field,
> +                                    const ARMISARegisters *host_isar,
> +                                    ArmFieldValueSet **value_set);
>  
>  /**
>   * kvm_arm_steal_time_finalize:
Thanks

Eric


