Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp539052lfm;
        Tue, 18 May 2021 08:54:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbWHnFSPP6lWZRvPb7Ge/PO92nb99muN9dpKQAuVMIH30PZeuESheKI1P9NEebbMxlpGVf
X-Received: by 2002:a02:9081:: with SMTP id x1mr6274119jaf.2.1621353299609;
        Tue, 18 May 2021 08:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621353299; cv=none;
        d=google.com; s=arc-20160816;
        b=KyoFUrc27/Z6Ufx3NE7226lQ7MeUAbQSQq2n6u7r4P7HbemxBhbTx0ge0RYBe3sNSc
         m+U0O/9KoA2TXjPsK3UfwoQcW9QP2JQ/dW8DZG4bOMQLYkc+qDulI/dNd0hyteBVYGsq
         65yKYEAjy3v1+jt25N2V5gG+sTaC1m5e7xHlVbdNCRIrGiycPmR9GH583j2N15bkFHhn
         QnN9ijO2HaknKFYR13okbiPWY5TL9pJdd7pF0uMfbf2JcPJXtLI6jzqcJXBHLOh/yLjY
         2HUDM8+o3mLDN+qWzcP6b5QI9sNIiSOyVbjecRMeZW7IEmQl2SYgvt41UJ678EfcJJu/
         u06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8olBpVtaRnM+tiP9wDsl9jl9/PS9eTLIkxGy3IQzCs=;
        b=FuXV1u2YWACNVkOENU7gLoH9K/POy2gDDIhht6BUeY0a6YTkUyU0zbGDLYT3/2jDsz
         4e4/WgDM0lvGf0qeiU+IdPxrksqsS8RayDnWXY91weet9T/tQidYav4nW1jDSzy0Qfdc
         BoWwvdpRsG57AzZBuoTaBfbp2phnp8MnPpcdRwDE4wEQqAJaNS3bW1LpjJ4VWioabU3l
         nrONcQD+Zp8AmSE3Kr9L42rOdiTRrj9Gexgh0CNG35GsV/mBCVzoqcBRc4xb84/OwN6m
         VVuXXdvrQ02X1K539eZtG4k/LHsT0Tm3VZ4MYcbU8T9LGyQtfSBgoM6hj+OU656R78Jn
         8yKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CmqjmNYq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si276865ils.50.2021.05.18.08.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 08:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CmqjmNYq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj23e-0005Cx-Pu
	for alex.bennee@linaro.org; Tue, 18 May 2021 11:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj1z1-0005Pr-Hq
 for qemu-arm@nongnu.org; Tue, 18 May 2021 11:50:11 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj1yx-000303-RJ
 for qemu-arm@nongnu.org; Tue, 18 May 2021 11:50:11 -0400
Received: by mail-ed1-x52e.google.com with SMTP id di13so11806235edb.2
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8olBpVtaRnM+tiP9wDsl9jl9/PS9eTLIkxGy3IQzCs=;
 b=CmqjmNYq9tgjIMXtwZy6j2KwRFmPPcSQX2RwCh/PluOZd6Y6f4pZqpD9gMzciRZ9Be
 kiAVMAqvKuwPrBKp0tGqY2tJlyVg6NA8VIW57g0r5qx4dbFoMT1+tL1FgFxxpuM1J5BZ
 iumu0LdE+/YdWPmfGhxUaUr07lypd6WrrTOWW6xdKztMxeIdkV+149dVJoo42hn+hdiK
 RJp+q5F/4/QOwRsmXMLJg7p05PMpeatGTMM9cXOaKxFuHfjDC5nwdGPTBcsLQVi6ukEB
 LBZntoTjsfI58UYzUeyjB1l+1VC5iPVe7hNNSiW5IKqqrss/ehTZBmIPXw1AdA5+kJ+T
 DhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8olBpVtaRnM+tiP9wDsl9jl9/PS9eTLIkxGy3IQzCs=;
 b=KKGBdcKCJwldwmp2cZ242jeg7PF8uVa/rXO8ZwwBlT1dJCAGsQU2xv/sp0o0OGV7O/
 4rxskKyFoBEjDyJ8KApE2LW2lhHG4Sgw4QWDKTcujsgf8oYp9SIf3oC7ECBDoOZfc/y7
 hyUALajn18p5OsFHLPIWednR+VF7VPL/FU28djKZLpv2KfXfqFB4s5DSX5f/YkXxlKzb
 gZ5TNuZg2TjyfX4p7BB/7cWj8GTKTOlTJtZga7FYXFDC9k+5KNCZQ5NnQWlr3MXMSnEQ
 eyFTsdi58KkIm70ROhEmojPuFd2fKXodu94mo1/3dMNW05A557u2xyTE739aDaR2wGks
 HyKA==
X-Gm-Message-State: AOAM533WMlhwpZKAEPJuTGU2iv5+dSYyrPsPu+9m12g/SmthGq4Jqy/b
 C2gWjaFRBMeiXJt40ntteSuzrX7nPecFxnD6evEBOg==
X-Received: by 2002:a05:6402:5243:: with SMTP id
 t3mr7842958edd.146.1621353005961; 
 Tue, 18 May 2021 08:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-5-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-5-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 16:49:49 +0100
Message-ID: <CAFEAcA8U_ByhVKFp9Y8+DEy9=eZrf+x86uANkW-=pnDjXWfq_g@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 45TxlPTZ1/Jv

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
> translation which triggers an LPI via INT command as well as write
> to GITS_TRANSLATER register,defined enum to differentiate between ITS
> command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
> Each of these commands make use of other functionalities implemented to
> get device table entry,collection table entry or interrupt translation
> table entry required for their processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c            | 346 ++++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h           |  12 +
>  include/hw/intc/arm_gicv3_common.h |   2 +
>  3 files changed, 359 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 7cb465813a..98c984dd22 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -28,6 +28,156 @@ struct GICv3ITSClass {
>      void (*parent_reset)(DeviceState *dev);
>  };
>
> +typedef enum ItsCmdType {
> +    NONE = 0, /* internal indication for GITS_TRANSLATER write */
> +    CLEAR = 1,
> +    DISCARD = 2,
> +    INT = 3,
> +} ItsCmdType;
> +
> +static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
> +    MemTxResult *res)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t l2t_addr;
> +    uint64_t value;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t max_l2_entries;
> +    bool status = false;
> +
> +    if (s->ct.indirect) {
> +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->ct.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, res);
> +
> +        if (*res == MEMTX_OK) {
> +            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +            if (valid_l2t) {
> +                max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
> +
> +                l2t_addr = value & ((1ULL << 51) - 1);
> +
> +                *cte =  address_space_ldq_le(as, l2t_addr +
> +                                    ((icid % max_l2_entries) * GITS_CTE_SIZE),
> +                                    MEMTXATTRS_UNSPECIFIED, res);
> +           }
> +       }
> +    } else {
> +        /* Flat level table */
> +        *cte =  address_space_ldq_le(as, s->ct.base_addr +
> +                                     (icid * GITS_CTE_SIZE),
> +                                      MEMTXATTRS_UNSPECIFIED, res);
> +    }
> +
> +    if (*cte & VALID_MASK) {
> +        status = true;
> +    }
> +
> +    return status;
> +}
> +
> +static MemTxResult update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> +    uint64_t itel, uint32_t iteh)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t itt_addr;
> +    MemTxResult res = MEMTX_OK;
> +
> +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> +
> +    address_space_stq_le(as, itt_addr + (eventid * sizeof(uint64_t)),
> +                         itel, MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res == MEMTX_OK) {
> +        address_space_stl_le(as, itt_addr + ((eventid + sizeof(uint64_t)) *
> +                             sizeof(uint32_t)), iteh, MEMTXATTRS_UNSPECIFIED,
> +                             &res);
> +    }
> +   return res;
> +}
> +
> +static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> +                      uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t itt_addr;
> +    bool status = false;
> +    uint64_t itel = 0;
> +    uint32_t iteh = 0;
> +
> +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> +
> +    itel = address_space_ldq_le(as, itt_addr + (eventid * sizeof(uint64_t)),
> +                                MEMTXATTRS_UNSPECIFIED, res);
> +
> +    if (*res == MEMTX_OK) {
> +        iteh = address_space_ldl_le(as, itt_addr + ((eventid +
> +                                    sizeof(uint64_t)) * sizeof(uint32_t)),
> +                                    MEMTXATTRS_UNSPECIFIED, res);
> +
> +        if (*res == MEMTX_OK) {
> +            if (itel & VALID_MASK) {
> +                if ((itel >> ITE_ENTRY_INTTYPE_SHIFT) & GITS_TYPE_PHYSICAL) {
> +                    *pIntid = (itel >> ITE_ENTRY_INTID_SHIFT) &
> +                              ITE_ENTRY_INTID_MASK;
> +                    *icid = iteh & ITE_ENTRY_ICID_MASK;
> +                    status = true;
> +                }
> +            }
> +        }
> +    }
> +    return status;
> +}
> +
> +static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t l2t_addr;
> +    uint64_t value;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t max_l2_entries;
> +
> +    if (s->dt.indirect) {
> +        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->dt.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, res);
> +
> +        if (*res == MEMTX_OK) {
> +            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +            if (valid_l2t) {
> +                max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
> +
> +                l2t_addr = value & ((1ULL << 51) - 1);
> +
> +                value = 0;

This assignment is pointless because we assign again to value immediately
afterwards.

> +                value =  address_space_ldq_le(as, l2t_addr +
> +                                   ((devid % max_l2_entries) * GITS_DTE_SIZE),
> +                                   MEMTXATTRS_UNSPECIFIED, res);
> +            }
> +        }
> +    } else {
> +        /* Flat level table */
> +        value = 0;

Ditto.

> +        value = address_space_ldq_le(as, s->dt.base_addr +
> +                                           (devid * GITS_DTE_SIZE),
> +                                    MEMTXATTRS_UNSPECIFIED, res);
> +    }
> +
> +    return value;
> +}
> +
>  static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
>  {
>      AddressSpace *as = &s->gicv3->dma_as;
> @@ -55,6 +205,182 @@ static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
>      return res;
>  }
>
> +static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
> +                                uint32_t offset, ItsCmdType cmd)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint32_t devid, eventid;
> +    MemTxResult res = MEMTX_OK;
> +    bool dte_valid;
> +    uint64_t dte = 0;
> +    uint32_t max_eventid;
> +    uint16_t icid = 0;
> +    uint32_t pIntid = 0;
> +    bool ite_valid = false;
> +    uint64_t cte = 0;
> +    bool cte_valid = false;
> +    uint64_t itel = 0;
> +    uint32_t iteh = 0;
> +
> +    if (cmd == NONE) {
> +        devid = offset;
> +    } else {
> +        devid = (value >> DEVID_SHIFT) & DEVID_MASK;
> +
> +        offset += NUM_BYTES_IN_DW;
> +        value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +    }
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    eventid = (value & EVENTID_MASK);
> +
> +    dte = get_dte(s, devid, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +    dte_valid = dte & VALID_MASK;
> +
> +    if (dte_valid) {
> +        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
> +
> +        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
> +
> +        if (res != MEMTX_OK) {
> +            return res;
> +        }
> +
> +        if (ite_valid) {
> +            cte_valid = get_cte(s, icid, &cte, &res);
> +        }
> +
> +        if (res != MEMTX_OK) {
> +            return res;
> +        }
> +    }
> +
> +    if ((devid > s->dt.max_devids) || !dte_valid || !ite_valid ||
> +            !cte_valid || (eventid > max_eventid)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "%s: invalid interrupt translation table attributes "
> +            "devid %d or eventid %d\n",
> +            __func__, devid, eventid);
> +        /*
> +         * in this implementation,in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */

...but we could just return an error from this function and
get the 'stall' behaviour. It would be more consistent to just
stall for everything, if we're going to be stalling for various
kinds of "failed to read memory" anyway. (Same for some instances
of this in the previous patches.)

> +    } else {
> +        /*
> +         * Current implementation only supports rdbase == procnum
> +         * Hence rdbase physical address is ignored
> +         */
> +        if (cmd == DISCARD) {
> +            /* remove mapping from interrupt translation table */
> +            res = update_ite(s, eventid, dte, itel, iteh);
> +        }
> +    }
> +
> +    if (cmd != NONE) {
> +        offset += NUM_BYTES_IN_DW;
> +        offset += NUM_BYTES_IN_DW;

More dead increments.

> +    }
> +
> +    return res;
> +}
> +

-- PMM
