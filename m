Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4298808lfa;
        Tue, 8 Jun 2021 03:47:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyfr4as0baTrNwKaBzIFkv/3FFsdTokgsXdtc9+YiMnEmwIQd0u57GLaBaovQOCs9xYZxC
X-Received: by 2002:ac8:67d5:: with SMTP id r21mr20658989qtp.92.1623149259615;
        Tue, 08 Jun 2021 03:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623149259; cv=none;
        d=google.com; s=arc-20160816;
        b=f+gRahLImNuyyFy10BcNssXSnObb4Zu89D4/I4ccqaShn4v1wJq3dKv5mNnKlD0S71
         jUcGXKX+HtIieBEmB34FSI80LxxyanfBYkIoLeot8HGnxwqzgOdntZy9RkPqYHWSdo/v
         kGQtzhxFUjS7DJ5D5iMsDccn4PowpFUf5VfInb/JffitJKPMxa5c8R+Rl/ruEu0WePy7
         B9CytLgrDvQUz0QTVnBcfV26EzCjaIa7N4lQXeFQ63y3LEJtdfpHDqbmEqtBcTUvm9A8
         tTnWRYk9917Tf9Xnxc59+6T7HrY+/nAsm7O9HDR7dIaDTqChVeWRaWfILE11MUm4X7aN
         vukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6pG23VniTT3RwzARAXXP/DMc2zOiwH8K/x1MxD0JYs=;
        b=E3PSGM7sv0i3SytWXHESPLyjecB9hgV2tKiHONfwF+lTYkIuIXXyRbiNrduHRtOsHs
         WoPOORPCnZf988CrqKNP4dt5/sxigON4zKAnofV0TvqnEadN2fsN+CYVHOpUKuiYEwrl
         Zob01YvwHvxckv9yhuKT0i9pA+HYq+ULYQX3jhLGvsC/lnbrHPY6t5Wl2w1ttq0YqYQ3
         OjPR2nxF+vo6gt0ntcw4jGiRiPyzJzrCMh7eRZtwRY/2wSBwQCHlqlMOotkdDmoIyNng
         WRDCfJx3OvPnLl8DmIVAyY6hpBIaYDO+IpFY7yHjy3KDCOoGVqoWKJ2PLbTFwHIo50Mb
         wzQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b8+KM3pi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26si3703161qkg.369.2021.06.08.03.47.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 03:47:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b8+KM3pi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqZGk-00067A-UN
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 06:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZFY-0004hb-9I
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:46:24 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZFW-0001f3-En
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:46:23 -0400
Received: by mail-ed1-x531.google.com with SMTP id i13so23981358edb.9
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u6pG23VniTT3RwzARAXXP/DMc2zOiwH8K/x1MxD0JYs=;
 b=b8+KM3piQCpKWXMcG40ounua/qp8aHv5QEJXs2FuuJXgKHAScwkqjnVAi9p8EZ1+o+
 AJKI9TrGjPiOM6s/BJmcFBv5TBSGdMCRoXt6/DlcrP4BeL2IZDbGv5PaOavLCJaj56UP
 iIq0Rnh2/l2CJuRuN9oH0GbTqqbQHchRw2Ka6+O93HrJrO+BpcESjADPQ3RmNzjtSGw1
 1lvdU2cQou9OHdMnUmabyPS/m9/lcFPvsHw28+hPPg8mPJi4cDDVDYFgE0vLxo3XxR+J
 MUPP29m3wdIAMK7Tk539+X9ndim21eDZ7v9LWNkqNsWmwuK4j+G5WQsYXZmaTGMjmAeR
 8jHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u6pG23VniTT3RwzARAXXP/DMc2zOiwH8K/x1MxD0JYs=;
 b=RMzsFeAUwjb+jP0JwcL5vCi6xtR5B10X2d6+XJvBmKm9eXaFSjY6e8mGciKpFF7nva
 UjdB53basj1pWS6RAbZRjMtytbJzxjuPWiTR68u+NejLC9s6yH4405p5vmBEnuDO0K8n
 Z/TNDCqcCUMLIOeVNz4CrauKw+U8r2a6PURvHL7MNOmTREw/LqTIGnWEDChSXLWb9LBz
 aCVT0c3pq6t0bHyPQbRtNJ/dtzyMRCLgsCMtDgIOXizgz9Kc3JF88aOskZVfIK0O0ycN
 LnjIi2i0yRDcRBbE1p4niRM0692CrpdWEoM/cdidwd3n9YAaB4EWws1XsBo0I5Ou1Viz
 3Gww==
X-Gm-Message-State: AOAM533NuMwKDQvIw6NmD+lquJ0ZwLVzQ2hj/F3avzC43fZIrlPvLeNn
 mj0Lz7/S2pnAzEBmF+ZsGKnhdPoMRKmIcUANZVi5Gg==
X-Received: by 2002:a05:6402:1216:: with SMTP id
 c22mr24614915edw.36.1623149180403; 
 Tue, 08 Jun 2021 03:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-5-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-5-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 11:45:47 +0100
Message-ID: <CAFEAcA983niE409cJtWAZ3A03uR21eZGmGsncR09aQ9QLc=syw@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hmdV0PVRfQwI

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
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
>  hw/intc/arm_gicv3_its.c            | 334 +++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h           |  12 ++
>  include/hw/intc/arm_gicv3_common.h |   2 +
>  3 files changed, 348 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 6551c577b3..82bb5b84ef 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -28,6 +28,13 @@ struct GICv3ITSClass {
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
>  static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
>  {
>      uint64_t result = 0;
> @@ -49,6 +56,315 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
>      return result;
>  }
>
> +static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
> +                    MemTxResult *res)
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

VALID_MASK should be the mask in its shifted location
(for consistency with how the FIELD macros do it). Then
this is just
   valid_l2t = (value & VALID_MASK) != 0;

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

You don't need the 'status' variable, you can just
     return (*cte & VALID_MASK) != 0;

(Looks like this code is already assuming VALID_MASK is the mask
in its shifted location, and so inconsistent with your current definition ?)

> +static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> +                    uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
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
> +                               ITE_ENTRY_INTID_MASK;

More _MASK constants that don't have the same semantics as the
registerfields versions. Please can you change all of these ?

> +                    *icid = iteh & ITE_ENTRY_ICID_MASK;
> +                    status = true;
> +                }
> +            }
> +        }
> +    }
> +    return status;
> +}
> +
> +    if ((devid > s->dt.max_devids) || !dte_valid || !ite_valid ||
> +            !cte_valid || (eventid > max_eventid)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid interrupt translation table attributes "
> +                      "devid %d or eventid %d\n",
> +                      __func__, devid, eventid);
> +        /*
> +         * in this implementation,in case of error

Another missing space after comma.

> +        /*
> +         * in this implementation,in case of error

And again.

> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */

thanks
-- PMM
