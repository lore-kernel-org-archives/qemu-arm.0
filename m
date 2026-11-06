Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5F606A326
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 22:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cYgXDdci
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPSJ2-0003qH-Vb; Fri, 06 Nov 2026 17:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xPSJ1-0003pu-FK
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 17:21:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xPSIy-0001cZ-T6
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 17:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794003663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ry8PEl9lZL+PPPx7HP+9q0xJOuQw4Ja7AlMO/Pzmago=;
 b=cYgXDdcieWj4cRNopmuettCzQfCYXvLBDagrCvsRY+aGdFDM5/Y1+yaMvSE/Or0yC69bXY
 yr3PadlNvyGEIdyl5XBYQG4ZRf2napJCu3SIIy8Pw6ozQILnvu3Vn4Eg990ZH+EbYWqRNE
 XN/r9h4hNHUJtHEGI15cgvxEs0SxWYQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-d0c3kgaLNrS4OXVdkekWfQ-1; Fri, 06 Nov 2026 17:21:01 -0500
X-MC-Unique: d0c3kgaLNrS4OXVdkekWfQ-1
X-Mimecast-MFC-AGG-ID: d0c3kgaLNrS4OXVdkekWfQ_1794003660
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4925ef75fc4so1051938f8f.1
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 14:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794003660; x=1794608460;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ry8PEl9lZL+PPPx7HP+9q0xJOuQw4Ja7AlMO/Pzmago=;
 b=l2YVBSvp/OyuD4QM6VhzWJQK4hLdE6eY/+bUWmQiIArLqIBpcz7SpySKm4FN3qtrVV
 dvNYbfhPMhtv31ubTZFEiBPCnmzRr2hDyeKYwdyMSk4/1zBNiYWCxXslfw8xojHKPWot
 8/JkcRQOWuxgxKG+lVMS2mqYff+DR1emhZHcDVhH+sYWpa5y/3OZN1mVNEwrblDUWGOR
 2j8XPGC2DrDS9YVxJ3STpK+D3L+ihiTABp8MnhzJrI7C2P3hVPZ84QpJ8TVg/pSMkwJ6
 1lXiKWU1s0ttVPln3vZ7aFybRw5iraVcN/fWB3zaoJ1C+DBSog/I+U+rRkB6T2hRJjko
 t8Iw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw868AvMyXUa73/1ZycFpFDlCGhnzm1M2dapLUXRH/XXs23ed7Dj0zbISIYjHcF+rn84DDcNAtkyg==@nongnu.org
X-Gm-Message-State: APuU4Z+IUxzuVSDFqXnyd8AUy/ogXrdFn5MiiQ0tnHRL2GkbXIuWur92
 hmkymzUDEbNevOZb7rzG/GTcQWdysYwZUWLliLC5Qe61GJGuMD8g4Rc2o9p/pphNcM0Jl/c/Alo
 sEA76ibHsVdDEhaX8aFlKHjRXR6mqkk2dKU4WIK2l1BT0Dm2nRgyRrQ==
X-Gm-Gg: AYBFou1X+0OMUzfwmpX6e7RPyWBUapBSUEsvsRJr0AIOSGmc18+UKJwbNjMXsXp3qxu
 caM2IE6LNKLRAl3Z7+oyyxj42VAKt3f7tf/NY1HUs8eKFoqT0vtiOMyTOem4m/59jglpV8O0RKq
 +rsILlFGao3riyfPig+NhGlQ02gTHHr6dEkokK3TLjwV+CL3+ZVOThz6G2Wbb0j5BBplxIzL1TK
 I8N3bw8dIkJ5SVIqaegF3O08rGibEEGynTEXoFlsoIKP8HLz2yyu041vvQ27ZTNORHDZvO4EzSo
 dNyZYM9T03brNMFG7/qUaEuGBYDFJ1QzKI7/oqN0N2nmiPClAdTWDe8jsM8FHxuZcVGBMJgq+5o
 q46ml4xOttIzPmpNnY8AG0nIbNSWawX/4
X-Received: by 2002:a05:600c:19d4:b0:4a1:dda8:eb73 with SMTP id
 5b1f17b1804b1-4b6df8c91d2mr62643805e9.27.1794003660351; 
 Fri, 06 Nov 2026 14:21:00 -0800 (PST)
X-Received: by 2002:a05:600c:19d4:b0:4a1:dda8:eb73 with SMTP id
 5b1f17b1804b1-4b6df8c91d2mr62643485e9.27.1794003659871; 
 Fri, 06 Nov 2026 14:20:59 -0800 (PST)
Received: from x1 ([151.41.153.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7d2ad9b95sm14972525e9.0.2026.11.06.14.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 14:20:59 -0800 (PST)
Date: Fri, 6 Nov 2026 23:20:56 +0100
From: Gustavo Romero <gromero@redhat.com>
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] hw/arm/smmuv3: define Root registers
Message-ID: <isr4ew27ud6xmfrk444mdme2rqdtd5wgpbgjblgaavmzhpyppt@hhmxurpxh766>
References: <20261016-jmac-smmu-root-registers-v1-0-e78e8879d347@linaro.org>
 <20261016-jmac-smmu-root-registers-v1-1-e78e8879d347@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261016-jmac-smmu-root-registers-v1-1-e78e8879d347@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O0XrGYWl0pt5ixsL16OjfljEWGFUq_jazoHVvFchQVI_1794003660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gromero@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jim,

Thanks for sending it.

On Fri, Oct 16, 2026 at 10:40:51AM +0100, Jim MacArthur wrote:
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> Adds all the non-optional SMMUv3.3 Root registers. These registers
> do nothing at the moment, but RW registers can be written and all
> registers can be read.
> 
> Based on original work by Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>  hw/arm/smmuv3.c                | 229 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmuv3-common.h |  22 ++++
>  include/hw/arm/smmuv3.h        |  13 +++
>  3 files changed, 264 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ed19536a4d..9d9bc2601b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -316,6 +316,11 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>      s->aidr = 0x1;
>      smmuv3_accel_idr_override(s);
> +
> +    /* Initialize Root bank */
> +    s->root.idr0 = FIELD_DP32(s->root.idr0, ROOT_IDR0, ROOT_IMPL, 1);
> +    /* Set this to 1 when SMMU Realms are implemented */
> +    s->root.idr0 = FIELD_DP32(s->root.idr0, ROOT_IDR0, REALM_IMPL, 0);
>  }
>  
>  bool smmuv3_ats_enabled(SMMUv3State *s)
> @@ -1769,6 +1774,111 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>      return MEMTX_OK;
>  }
>  
> +/*
> + * Check we are from the Root PA space to read from or write to the
> + * SMMU Root register area.
> + */
> +static bool smmu_check_root_access(SMMUv3State *s, MemTxAttrs attrs,
> +                                     hwaddr offset, bool is_read)

Indentation is off ---------------------^

I think it makes sense also to call this function smmu_root_access(), but no
strong preference here.


> +{
> +    /* Check if the access is from Root PA */
> +    if (!(attrs.space == ARMSS_Root)) {

Could we use the comparison operator (!=) instead of the logical one here? I
think it's clearer than a negation.


> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "%s: Non-root %s attempt at offset 0x%" PRIx64 " (%s)\n",
> +            __func__, is_read ? "read" : "write", offset,
> +            is_read ? "RAZ" : "WI");
> +        return false;
> +    }
> +    return true;
> +}
> +
> +static MemTxResult smmu_root_writel(SMMUv3State *s, hwaddr offset,
> +                                    uint64_t data, MemTxAttrs attrs)
> +{
> +    switch (offset) {
> +    case A_ROOT_IDR0:
> +    case A_ROOT_IIDR:
> +    case A_ROOT_CR0ACK:
> +        /* RO registers, write ignored */
> +        return MEMTX_OK;
> +    case A_ROOT_TLBI_CTRL:
> +        /* Optional, not implemented. Present if IDR0.RGPTM == 1 */
> +        return MEMTX_OK;
> +    case A_ROOT_GPT_BASE_UPDATE:
> +        /* Unimplemented at present; has side effects */
> +        return MEMTX_OK;
> +    case A_ROOT_CR0:
> +        s->root.cr0 = data;
> +        s->root.cr0ack = s->root.cr0;
> +        return MEMTX_OK;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s unhandled 32-bit access at 0x%"PRIx64" (WI)\n",
> +                      __func__, offset);
> +        /*
> +         * Locations not associated with a register (including registers that we
> +         * have not implemented yet) are RES0, and will follow RAZ/WI behaviour.
> +         */
> +        return MEMTX_OK;
> +    }
> +}
> +
> +static MemTxResult smmu_root_writell(SMMUv3State *s, hwaddr offset,
> +                                     uint64_t data, MemTxAttrs attrs)
> +{
> +    switch (offset) {
> +    case A_ROOT_GPT_BASE:
> +        s->root.gpt_base = data;
> +        return MEMTX_OK;
> +    case A_ROOT_GPT_BASE_CFG:
> +        s->root.gpt_base_cfg = data;
> +        return MEMTX_OK;
> +    case A_ROOT_GPF_FAR:
> +        s->root.gpf_far = data;
> +        return MEMTX_OK;
> +    case A_ROOT_GPT_CFG_FAR:
> +        s->root.gpt_cfg_far = data;
> +        return MEMTX_OK;
> +    case A_ROOT_TLBI:
> +        /* Optional, not implemented. Present if ROOT_IDR0.RGPTM == 1 */
> +        return MEMTX_OK;
> +    case A_ROOT_GPT_BASE2:
> +        s->root.gpt_base2 = data;
> +        return MEMTX_OK;
> +    case A_ROOT_GPCBW:
> +        /* Optional, not implemented. Present if ROOT_IDR0.GPTS == 1 */
> +        return MEMTX_OK;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s unhandled 64-bit access at 0x%"PRIx64" (WI)\n",
> +                      __func__, offset);
> +        /* RES0; See smmu_root_writel */
> +        return MEMTX_OK;
> +    }
> +}

We might have some issues down the lane since TF-A seems to rely on the spec
that says that 64b registers can be written in 32b halves, since I see in the
TF-A code, drivers/arm/smmu/smmu_v3.c, in smmuv3_init():

[...]
                          /*
                           * TODO: SMMU_ROOT_GPT_BASE_CFG is 64b in the spec,
                           * but SMMU model only accepts 32b access.
                           */
                          mmio_write_32(smmu_base + SMMU_ROOT_GPT_BASE_CFG,
                                        gpccr_el3);

But for now it's ok. We can revisit it later.


> +
> +static MemTxResult smmu_write_mmio_root(SMMUv3State *s, hwaddr offset,
> +                                        uint64_t data, unsigned size,
> +                                        MemTxAttrs attrs)
> +{
> +    MemTxResult r;
> +
> +    switch (size) {
> +    case 8:
> +        r = smmu_root_writell(s, offset, data, attrs);
> +        break;
> +    case 4:
> +        r = smmu_root_writel(s, offset, data, attrs);
> +        break;
> +    default:
> +        r = MEMTX_ERROR;
> +        break;
> +    }
> +
> +    trace_smmuv3_write_mmio(offset, data, size, r);
> +    return r;
> +}
> +
>  static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
>                                     unsigned size, MemTxAttrs attrs)
>  {
> @@ -1776,6 +1886,18 @@ static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
>      SMMUv3State *s = ARM_SMMUV3(sys);
>      MemTxResult r;
>  
> +    if (offset >= SMMU_ROOT_REG_START) {
> +        if (!smmu_check_root_access(s, attrs, offset, false)) {
> +            /*
> +             * As per 6.2.8, accesses in any PA space other
> +             * than Root are completed as RAZ/WI.
> +             */
> +            trace_smmuv3_write_mmio(offset, data, size, MEMTX_OK);
> +            return MEMTX_OK;
> +        }
> +        return smmu_write_mmio_root(s, offset, data, size, attrs);
> +    }
> +
>      /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
>      offset &= ~0x10000;
>  
> @@ -1918,6 +2040,100 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
>      }
>  }
>  
> +static MemTxResult smmu_root_readl(SMMUv3State *s, hwaddr offset,
> +                                   uint64_t *data, MemTxAttrs attrs)
> +{
> +    switch (offset) {
> +    case A_ROOT_IDR0:
> +        *data = s->root.idr0;
> +        return MEMTX_OK;
> +    case A_ROOT_IIDR:
> +        *data = s->root.iidr;
> +        return MEMTX_OK;
> +    case A_ROOT_TLBI_CTRL:
> +        /* Optional, not implemented. Present if ROOT_IDR0.RGPTM == 1 */
> +        *data = 0;
> +        return MEMTX_OK;
> +    case A_ROOT_GPT_BASE_UPDATE:
> +        /* Not a regular register; reads as 0 once update is complete */
> +        *data = 0;
> +        return MEMTX_OK;
> +    case A_ROOT_CR0:
> +        *data = s->root.cr0;
> +        return MEMTX_OK;
> +    case A_ROOT_CR0ACK:
> +        *data = s->root.cr0ack;
> +        return MEMTX_OK;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s unhandled 32-bit access at 0x%"PRIx64" (RAZ)\n",
> +                      __func__, offset);
> +        *data = 0;
> +        /* RES0; See smmu_root_writel */
> +        return MEMTX_OK;
> +    }
> +}
> +
> +static MemTxResult smmu_root_readll(SMMUv3State *s, hwaddr offset,
> +                                    uint64_t *data, MemTxAttrs attrs)
> +{
> +    switch (offset) {
> +    case A_ROOT_GPT_BASE:
> +        *data = s->root.gpt_base;
> +        return MEMTX_OK;
> +    case A_ROOT_GPT_BASE_CFG:
> +        *data = s->root.gpt_base_cfg;
> +        return MEMTX_OK;
> +    case A_ROOT_GPF_FAR:
> +        *data = s->root.gpf_far;
> +        return MEMTX_OK;
> +    case A_ROOT_GPT_CFG_FAR:
> +        *data = s->root.gpt_cfg_far;
> +        return MEMTX_OK;
> +    case A_ROOT_TLBI:
> +        /* Optional, not implemented. Present if ROOT_IDR0.RGPTM == 1 */
> +        *data = 0;
> +        return MEMTX_OK;
> +    case A_ROOT_GPT_BASE2:
> +        *data = s->root.gpt_base2;
> +        return MEMTX_OK;
> +    case A_ROOT_GPCBW:
> +        /* Optional, not implemented. Present if ROOT_IDR0.GPTS == 0 */

                                         GPTS == 1 here? -----^


> +        *data = 0;
> +        return MEMTX_OK;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s unhandled 64-bit access at 0x%"PRIx64" (RAZ)\n",
> +                      __func__, offset);
> +        *data = 0;
> +        /* RES0; See smmu_root_writel */
> +        return MEMTX_OK;
> +    }
> +}
> +
> +static MemTxResult smmu_read_mmio_root(SMMUv3State *s, hwaddr offset,
> +                                       uint64_t *data, unsigned size,
> +                                       MemTxAttrs attrs)
> +{
> +    MemTxResult r;
> +
> +    switch (size) {
> +    case 8:
> +        r = smmu_root_readll(s, offset, data, attrs);
> +        break;
> +    case 4:
> +        r = smmu_root_readl(s, offset, data, attrs);
> +        break;
> +    default:
> +        r = MEMTX_ERROR;
> +        break;
> +    }
> +
> +    trace_smmuv3_read_mmio(offset, *data, size, r);
> +    return r;
> +}
> +
> +
>  static MemTxResult smmu_read_mmio(void *opaque, hwaddr offset, uint64_t *data,
>                                    unsigned size, MemTxAttrs attrs)
>  {
> @@ -1925,6 +2141,19 @@ static MemTxResult smmu_read_mmio(void *opaque, hwaddr offset, uint64_t *data,
>      SMMUv3State *s = ARM_SMMUV3(sys);
>      MemTxResult r;
>  
> +    if (offset >= SMMU_ROOT_REG_START) {
> +        if (!smmu_check_root_access(s, attrs, offset, true)) {
> +            /*
> +             * As per 6.2.8, accesses in any PA space other
> +             * than Root are completed as RAZ/WI.
> +             */
> +            trace_smmuv3_read_mmio(offset, *data, size, MEMTX_OK);
> +            return MEMTX_OK;
> +        }
> +
> +        return smmu_read_mmio_root(s, offset, data, size, attrs);
> +    }
> +
>      /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
>      offset &= ~0x10000;
>  
> diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3-common.h
> index 4609975edf..a538334066 100644
> --- a/include/hw/arm/smmuv3-common.h
> +++ b/include/hw/arm/smmuv3-common.h
> @@ -411,6 +411,28 @@ REG32(EVENTQ_IRQ_CFG2,     0xbc)
>  
>  #define A_IDREGS           0xfd0
>  
> +#define SMMU_ROOT_REG_START 0x20000

The base address for the Root Control Page is implementation defined, hence
0x20000 is not always true and depends on the machine/platform. We could add
property to set it externaly but it would also complicate unnecessarily the
offset math. So I think it's ok to follow what FVP is doing. Please just add a
note saying it's impl. defined so it might require a tweak in the
future.

I think we can follow TF-A code here and rename this macro. So how about
renaming it to:

SMMUV3_ROOT_REG_OFFSET ?


> +
> +REG32(ROOT_IDR0,            0x0)
> +    FIELD(ROOT_IDR0, ROOT_IMPL,   0,  1)
> +    FIELD(ROOT_IDR0, BGTPM,       1,  1)
         
Typo: BGPTM ------------^


> +    FIELD(ROOT_IDR0, RGPTM,       2,  1)
> +    FIELD(ROOT_IDR0, REALM_IMPL,  3,  1)
> +    FIELD(ROOT_IDR0, BA_REALM,   22, 10)
> +
> +REG32(ROOT_IIDR,             0x8)
> +REG32(ROOT_CR0,             0x20)
> +REG32(ROOT_CR0ACK,          0x24)
> +REG64(ROOT_GPT_BASE,        0x28)
> +REG64(ROOT_GPT_BASE_CFG,    0x30)
> +REG64(ROOT_GPF_FAR,         0x38)
> +REG64(ROOT_GPT_CFG_FAR,     0x40)
> +REG64(ROOT_TLBI,            0x50)
> +REG32(ROOT_TLBI_CTRL,       0x58)
> +REG64(ROOT_GPT_BASE2,       0x60)
> +REG32(ROOT_GPT_BASE_UPDATE, 0x68)
> +REG32(ROOT_GPCBW,           0x70)
> +
>  /* Commands */
>  
>  typedef enum SMMUCommandType {
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index d39fe8850b..e2708e13fe 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -34,6 +34,18 @@ typedef struct SMMUQueue {
>       uint8_t log2size;
>  } SMMUQueue;
>  
> +typedef struct SMMUv3RootRegBank {

How about naming this struct simply SMMUv3Root?


> +    uint32_t idr0;
> +    uint32_t iidr;
> +    uint32_t cr0;
> +    uint32_t cr0ack;
> +    uint64_t gpt_base;
> +    uint64_t gpt_base_cfg;
> +    uint64_t gpf_far;
> +    uint64_t gpt_cfg_far;
> +    uint64_t gpt_base2;

Looking at ARM IHI 0070 H.a Non-confidential spec I don't see

0x0068 SMMU_ROOT_GPT_BASE_UPDATE 32-bit, R/W and
0x0070 SMMU_ROOT_GPCBW 64-bit, R/W

as Optional like I see SMMU_ROOT_TLBI and SMMU_ROOT_TLBI_CTRL.

Should they be declared as well?


> +} SMMUv3RootRegBank;
> +
>  struct SMMUv3State {
>      SMMUState     smmu_state;
>  
> @@ -80,6 +92,7 @@ struct SMMUv3State {
>      OnOffAuto cmdqv;
>  
>      Notifier machine_done;
> +    SMMUv3RootRegBank root;
>  };
>  
>  typedef enum {
> 
> -- 
> 2.43.0
> 
> 

General comments:

smmu_read_mmio_root
smmu_write_mmio_root 

I think we can drop the "mmio_" for both functions. It's ok to have "mmio_" in
the "trace_smmuv3_write_mmio" trace function because afaics it has a generic use,
so its use is not tied to any bank.


I think we're missing to reset some registers in smmuv3_reset()? Like:

s->root.cr0 = 0;
s->root.cr0ack = 0;
s->root.gpf_far = 0;
s->root.gpt_cfg_far = 0;


Cheers,
Gustavo


