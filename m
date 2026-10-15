Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0130CC6B34
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 12:13:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHKKn-0007Vd-J2; Thu, 15 Oct 2026 08:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHKKk-0007UH-MV
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:13:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHKKh-0003lk-NP
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792066392;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZS8O6pAKs14B2vAv0EVl9bnzCeWoqf8Dh1MzJORQ00=;
 b=ZuT/IJa6fID9QvCqB0CIzsU3UceA88QEcqNJglmE1SSaQgAy2qmCROkUmbD8zAisq/wQYZ
 4aATdvqaC8zMXbNb7OHXK8rfUFHDgJFavjcsHh4Al/4vDlg6C/dQ4rY3QubY7QNOOAQgiK
 H+MKCDEaT392PSq4THjJhqrLZbvvDSU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-lRJMb19XOHWiYgU4nhkmSQ-1; Thu, 15 Oct 2026 12:13:11 +0000
X-MC-Unique: lRJMb19XOHWiYgU4nhkmSQ-1
X-Mimecast-MFC-AGG-ID: lRJMb19XOHWiYgU4nhkmSQ_1792066390
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4a0761224e1so18116665e9.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 05:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792066390; x=1792671190;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6ZS8O6pAKs14B2vAv0EVl9bnzCeWoqf8Dh1MzJORQ00=;
 b=IY26sTqN45sKt42TPjadw73Gg2VIYENOfmUbdX0fHL6ELoBiFKLt5xlmuiS8kf0Z4n
 gD2taTJ9Gnn2s8uMcJvjEJhFVEioG8i+qDCryWrmpCKDA/xnHdGofDk4kWIMyqmIsHCj
 BW1OEJCFsup/1pM4P/4MlldFZwObNPbCMtqFpBHAiweDACumqHRaqnzSVL3RcHJqvsz3
 lOP23uhK1kWI9iXbgCzciyXi26Hbf9zDS7E5JF9UO4k8CbVEU3S51YhAaYyKD+kFxOSM
 4xn8kl0QTm4akUHb6tgWMK7Gzdh9GNivMuQtSycjKfoxzjfSaKqOb4IAjQg5kOier3VT
 BxDA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzhYmSDHyq9oFiNPhVj0rtRFWXtj4+4wm6M2eEX2slMA9LmO2cUzkRcHmjvpvPNiiZNUu6xm2La+A==@nongnu.org
X-Gm-Message-State: AFq9FYJiRNYyB+wjfLVAcZwAWOAcqWPl54YHXZn/AiF3GTe2YSmGRzR/
 CflEpoVo5dkTRnEIUj4W2nl9NPf3F2JqRR4kPf7Xu5qqDYbQFzQFAIqkYmhLccJvyrUG2X1b+en
 DjSHy0VAMqAvXk1DK6Pi6dpWVDyfwOSaaSh3qRZZ4N7OVKJfvkRRuRQ==
X-Gm-Gg: AYBFou2TxmN8HEZxWFOLBNQc70Gr/KXERN9r5k11YEP4CIr3ElD9kn8HgbOYla02iXe
 w4tvaVvfF6YnG3LTAj+CtUUv8dEiWGjxGwO+MMt/pV8uj2/pc88Zr9eprm+PNd8hvi99fd/vySl
 mNQaD6gL0GUZuZSmIcKROg6wNdf/u8Y5nmXuVEL9KgSv96Br9bsGQrqOkS+0qtSV+gqmr465Eyh
 GBVfcvlJcUs9/27erLTjrJxFmTqtJjBiJzVIoJmwuowBgVXghDQ3H3j4JoFzU2pVZF6+1Di+K0I
 epmo7CQ8JjoN+bWgMTrI28/A3SG4Kc22dACDWoSLfWgs+lfcPQGS3j4kvfJVWJVVJyNahFuCIY9
 rVvxY34HeDD4H7YBn+670dA0oLdDTiUQQC9aGB0X8R3FiPTbO
X-Received: by 2002:a05:600c:3b98:b0:499:79b9:e220 with SMTP id
 5b1f17b1804b1-4a18e49886amr424421115e9.10.1792066390247; 
 Thu, 15 Oct 2026 05:13:10 -0700 (PDT)
X-Received: by 2002:a05:600c:3b98:b0:499:79b9:e220 with SMTP id
 5b1f17b1804b1-4a18e49886amr424420585e9.10.1792066389771; 
 Thu, 15 Oct 2026 05:13:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd99faf3sm66449875e9.14.2026.10.15.05.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 05:13:09 -0700 (PDT)
Message-ID: <395b66c9-4173-401b-b469-8972b710aae2@redhat.com>
Date: Thu, 15 Oct 2026 14:13:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 14/25] target/arm: add neoverse-v2-v2 named CPU
 model
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 ping@khushitshah.com, sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-15-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260921123249.1708067-15-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vJ7i8zjoONovs6DdYLwO22M1X2nf6ILer33vqnHt7DA_1792066390
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/21/26 2:32 PM, Khushit Shah wrote:
> Add a KVM-only named CPU model for Neoverse V2 r0p1 (TRM 102375),
> inheriting from neoverse-v2-v1 (r0p0).
>
> r0p1 only changes MIDR_EL1.Revision and adds FEAT_ECBHB
> (ID_AA64MMFR1_EL1.ECBHB).
>
> Final ID register state requested from KVM for "neoverse-v2-v2":
> [  0] AIDR_EL1                 = 0x0000000000000000
> [  1] CLIDR_EL1                = 0x0000000000000000
> [  2] CTR_EL0                  = 0x000000009444c004
> [  3] DCZID_EL0                = 0x0000000000000004
> [  4] GMID_EL1                 = 0x0000000000000000
> [  5] ID_AA64AFR0_EL1          = 0x0000000000000000
> [  6] ID_AA64AFR1_EL1          = 0x0000000000000000
> [  7] ID_AA64DFR0_EL1          = 0x000000f010305009
> [  8] ID_AA64DFR1_EL1          = 0x0000000000000000
> [  9] ID_AA64DFR2_EL1          = 0x0000000000000000
> [ 10] ID_AA64FPFR0_EL1         = 0x0000000000000000
> [ 11] ID_AA64ISAR0_EL1         = 0x0221100010210000
> [ 12] ID_AA64ISAR1_EL1         = 0x0011111101211052
> [ 13] ID_AA64ISAR2_EL1         = 0x0000000000000000
> [ 14] ID_AA64ISAR3_EL1         = 0x0000000000000000
> [ 15] ID_AA64MMFR0_EL1         = 0x0000011100101125
> [ 16] ID_AA64MMFR1_EL1         = 0x1000000010312122
> [ 17] ID_AA64MMFR2_EL1         = 0x1221011110001011
> [ 18] ID_AA64MMFR3_EL1         = 0x0000000000000000
> [ 19] ID_AA64MMFR4_EL1         = 0x0000000000000000
> [ 20] ID_AA64PFR0_EL1          = 0x1101000120110011
> [ 21] ID_AA64PFR1_EL1          = 0x0000000000000021
> [ 22] ID_AA64PFR2_EL1          = 0x0000000000000000
> [ 23] ID_AA64SMFR0_EL1         = 0x0000000000000000
> [ 24] ID_AA64ZFR0_EL1          = 0x0000100000110001
> [ 25] ID_AFR0_EL1              = 0x0000000000000000
> [ 26] ID_DFR0_EL1              = 0x0000000000000000
> [ 27] ID_DFR1_EL1              = 0x0000000000000000
> [ 28] ID_ISAR0_EL1             = 0x0000000000000000
> [ 29] ID_ISAR1_EL1             = 0x0000000000000000
> [ 30] ID_ISAR2_EL1             = 0x0000000000000000
> [ 31] ID_ISAR3_EL1             = 0x0000000000000000
> [ 32] ID_ISAR4_EL1             = 0x0000000000000000
> [ 33] ID_ISAR5_EL1             = 0x0000000000000000
> [ 34] ID_ISAR6_EL1             = 0x0000000000000000
> [ 35] ID_MMFR0_EL1             = 0x0000000000000000
> [ 36] ID_MMFR1_EL1             = 0x0000000000000000
> [ 37] ID_MMFR2_EL1             = 0x0000000000000000
> [ 38] ID_MMFR3_EL1             = 0x0000000000000000
> [ 39] ID_MMFR4_EL1             = 0x0000000000000000
> [ 40] ID_MMFR5_EL1             = 0x0000000000000000
> [ 41] ID_PFR0_EL1              = 0x0000000000000000
> [ 42] ID_PFR1_EL1              = 0x0000000000000000
> [ 43] ID_PFR2_EL1              = 0x0000000000000000
> [ 44] MIDR_EL1                 = 0x00000000410fd4f1
> [ 45] MPIDR_EL1                = 0x0000000080000000
> [ 46] MVFR0_EL1                = 0x0000000000000000
> [ 47] MVFR1_EL1                = 0x0000000000000000
> [ 48] MVFR2_EL1                = 0x0000000000000000
> [ 49] REVIDR_EL1               = 0x0000000000000000
> [ 50] SMIDR_EL1                = 0x0000000000000000
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  hw/arm/virt.c           |  1 +
>  target/arm/cpu-models.c | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f5a8ea1145..90e818690c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -4147,6 +4147,7 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
>      if (kvm_enabled() && target_aarch64()) {
>          g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("arm-v9.0-a-v1")));
>          g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-v2-v1")));
> +        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-v2-v2")));
>      }
>      if (target_aarch64()) {
>          g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a53")));
> diff --git a/target/arm/cpu-models.c b/target/arm/cpu-models.c
> index 2de67f353b..af60924953 100644
> --- a/target/arm/cpu-models.c
> +++ b/target/arm/cpu-models.c
> @@ -16,6 +16,7 @@
>   * Current Hierarchy:
>   * arm-v9.0-a-v1
>   *   neoverse-v2-v1 (r0p0)
> + *     neoverse-v2-v2 (r0p1)
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>  
> @@ -212,9 +213,21 @@ static const ArmModelPropValue neoverse_v2_v1_props[] = {
>      MODEL_PROP_END
>  };
>  
> +/* Neoverse V2 CPU model (TRM 102375, r0p1), inherits from neoverse-v2-v1. */
> +static const ArmModelPropValue neoverse_v2_v2_props[] = {
> +    /* MIDR_EL1 */
> +    MODEL_PROP("SYSREG_MIDR_EL1_Revision", NUM, 0x1), /* r0p1 */
> +
> +    /* ID_AA64MMFR1_EL1 */
> +    MODEL_PROP("SYSREG_ID_AA64MMFR1_EL1_ECBHB", NUM, 1), /* FEAT_ECBHB */
> +
> +    MODEL_PROP_END,
> +};
> +
>  static const ArmNamedCpuModel arm_cpu_models[] = {
>      {"arm-v9.0-a-v1", NULL, arm_v9_0_a_v1_props},
>      {"neoverse-v2-v1", "arm-v9.0-a-v1", neoverse_v2_v1_props},
> +    {"neoverse-v2-v2", "neoverse-v2-v1", neoverse_v2_v2_props},
nit I would call it directly neoverse-v2-r0p1 and leave the -v<n> suffix
for potential fixes. Same for r0p0 obviously.

Thanks

Eric
>      {NULL, NULL, NULL}
>  };
>  


