Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp731061lfc;
        Tue, 13 Jul 2021 09:12:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP1Fsx1Ub53qzEYsNwRjVktA+suNuun2abLoTuop9qEmCCsVtfc1vnBNO+t/XcNUZIyzGj
X-Received: by 2002:a5d:4086:: with SMTP id o6mr6607049wrp.379.1626192723795;
        Tue, 13 Jul 2021 09:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626192723; cv=none;
        d=google.com; s=arc-20160816;
        b=zmJHw5VEciQgnruDet6t3vyuAZ/NlchVT5BbOsmUtrm/LVcLvdymh+0lU8giGGfI4M
         LyIunuRrgjp9EwaDnMQFYif9KRRupEr9//WRh+laAPb/YFkQS+SZBvSwObVzm0xgCN1m
         u/0wj4WFymJo55dApjhkGCgPrGBwdDzIghnWpMLOAiRbvtMa/xIe6Pvdzex85Hq3Coah
         PsHTWr3XT7wETlxGs7+tWhak+umtxkybfPo/gAnkqWfH+aydXFnBqkzWC9Nah2vXhWqi
         mjUkvFp3U1e63m1GD3wOw9Cim/Vz7xUeyV0iPN2XXUD3k3pW0Y1AJq+Xgd2APM+8dvBb
         q+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kfY6BCkwjlJ4LDV/iry76szb8KUaYGFeVpi5xEVG/nE=;
        b=PD4D1gTBwpLOGDKUdpNjOQdl+wQrmJ16xhTO+n8/IazBb+wq4dzn22CrhsY8/ByUEz
         kXOiviFYnQpkdP0eriINcyaD9f3WpA/T9k0DZt7+ZpKK/FDC99M1vcaeq/jFxQ7GeJ0q
         KZ2CfHgjvv3epQ+jVxnfLtIN+q7NIBsaScFI5eTgy32VXJbgOAd/NlLP2KpMkKkiN65p
         memb40BDTTxEBSxcz3lzoQWlx2kv5ppRnwHi09aMlfeBYuoT77zshjDwxjzcs6joHDYS
         5Kf9Z5tD92JDb9gFhuILYQEsyTGMGbZoNGCVC8rA1nmJ8HV6RVDNqk7GFI0HVk4lvSyU
         w1Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NPcyJvD7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si24732995wru.108.2021.07.13.09.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 09:12:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NPcyJvD7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3L0s-0005gd-J8
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 12:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3L0j-0005e4-E1
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 12:11:53 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3L0g-0001OI-GR
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 12:11:53 -0400
Received: by mail-ed1-x536.google.com with SMTP id x17so2585311edd.12
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kfY6BCkwjlJ4LDV/iry76szb8KUaYGFeVpi5xEVG/nE=;
 b=NPcyJvD7ChjAoidXvMJ+Lncnr+aMO0kRUnBvakYEYTsPF2ONtaTsv9ErtfcRMmD4HO
 XV1ufsDdeHxPpYv0LtuPAQhvUF4DDhIGqk87JmzVOTTHp2Trfl+LbjbcFLdADCdXlT8c
 xXeZ2Y6yCCOSDdezTt6buI/f/E+jESBYhbdE8euxLyrvRVimwTej3BUNh9J+PzDhuFmU
 foXw7J+gvwkps8X8xs16CWoKUbHO3g4P1n2NERljuPh4Ik7sq4KYt8teZleGG/7HexTZ
 Da8ikmOHqghjlVLSpTD21KyDv4fFQTBQujBPS29NgNIhnrYBBNAPWBfW3o5oSUX+Te7H
 a5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kfY6BCkwjlJ4LDV/iry76szb8KUaYGFeVpi5xEVG/nE=;
 b=DwoaAHC6kbCus/S9WmkyeVn8Ru/U+Opjl2/Ol21puAF81vCm38BwY8cvuNf5oDKrxd
 pugMfKaIOzW2CacszxKtnskXn6PTxHXV4PDT9dK7gv3dw7qacZjJhV/81tvGc9SAGdmK
 Rd30naHjMn9fTpHms/jycMvkiKiS5mYzXsoZMwFacD4VxmDtmQkv5cIGmpRgFiGz+5X9
 U5S9Y7cNambC7MJOl7JRcLZESEWz8KCX1SbNd6BKCwWIxQalBMIqBfFhEqhdnhV8dkR6
 3Ud+lOXuzjFyIzSrvzW+M/pVFZ0h4At8qJuQI6pofJ75r86UwHC0V2Qw1GMPP120sc6/
 OnTA==
X-Gm-Message-State: AOAM531vpVuG0VgTQOLRIustxCDUMMiKaBB6dvVf4oinfPBaPP8+Y8uu
 GEtu98tnWDNHNdHuYcit98f/QO8HjCsGFsns619PKA==
X-Received: by 2002:aa7:d809:: with SMTP id v9mr6864496edq.146.1626192708814; 
 Tue, 13 Jul 2021 09:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210707021815.45938-1-shashi.mallela@linaro.org>
 <20210707021815.45938-5-shashi.mallela@linaro.org>
In-Reply-To: <20210707021815.45938-5-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 17:11:09 +0100
Message-ID: <CAFEAcA8rvqNZ0RBrdp3pcWTguLYvkDRqLXz3ejJmjPfEvp4Rsw@mail.gmail.com>
Subject: Re: [PATCH v6 04/10] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qCtwwMOhxHA8

On Wed, 7 Jul 2021 at 03:18, Shashi Mallela <shashi.mallela@linaro.org> wrote:
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

Couple of minor things below; otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

> +static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> +                    uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t itt_addr;
> +    bool status = false;
> +    IteEntry ite;
> +
> +    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
> +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> +
> +    memset(&ite, 0 , sizeof(ite));

"IteEntry ite = {};" will zero-initialize it without the need for a memset.

> +    ite.itel = address_space_ldq_le(as, itt_addr +
> +                                    (eventid * sizeof(uint64_t)),
> +                                    MEMTXATTRS_UNSPECIFIED, res);
> +
> +    if (*res == MEMTX_OK) {
> +        ite.iteh = address_space_ldl_le(as, itt_addr + ((eventid +
> +                                    sizeof(uint64_t)) * sizeof(uint32_t)),
> +                                    MEMTXATTRS_UNSPECIFIED, res);
> +
> +        if (*res == MEMTX_OK) {
> +            if (ite.itel & TABLE_ENTRY_VALID_MASK) {
> +                if ((ite.itel >> ITE_ENTRY_INTTYPE_SHIFT) &
> +                    GITS_TYPE_PHYSICAL) {
> +                    *pIntid = (ite.itel & ITE_ENTRY_INTID_MASK) >>
> +                               ITE_ENTRY_INTID_SHIFT;
> +                    *icid = ite.iteh & ITE_ENTRY_ICID_MASK;
> +                    status = true;
> +                }
> +            }
> +        }
> +    }
> +    return status;
> +}


> +/*
> + * This function handles the processing of following commands based on
> + * the ItsCmdType parameter passed:-
> + * 1. triggering of lpi interrupt translation via ITS INT command
> + * 2. triggering of lpi interrupt translation via gits_translater register
> + * 3. handling of ITS CLEAR command
> + * 4. handling of ITS DISCARD command
> + */
> +static MemTxResult process_its_cmd(GICv3ITSState *s, uint64_t value,
> +                                   uint32_t offset, ItsCmdType cmd)
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
> +    IteEntry ite;
> +
> +    if (cmd == NONE) {
> +        devid = offset;
> +    } else {
> +        devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
> +
> +        offset += NUM_BYTES_IN_DW;
> +        value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                     MEMTXATTRS_UNSPECIFIED, &res);
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
> +    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
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
> +    if ((devid > s->dt.maxids.max_devids) || !dte_valid || !ite_valid ||
> +            !cte_valid || (eventid > max_eventid)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid command attributes "
> +                      "devid %d or eventid %d or invalid dte %d or"
> +                      "invalid cte %d or invalid ite %d\n",
> +                      __func__, devid, eventid, dte_valid, cte_valid,
> +                      ite_valid);
> +        /*
> +         * in this implementation, in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        /*
> +         * Current implementation only supports rdbase == procnum
> +         * Hence rdbase physical address is ignored
> +         */
> +        if (cmd == DISCARD) {
> +            memset(&ite, 0 , sizeof(ite));

Again here you could make 'ite' local to this code block and write
it "IteEntry ite = {};" instead of the memset.

> +            /* remove mapping from interrupt translation table */
> +            res = update_ite(s, eventid, dte, ite);
> +        }
> +    }
> +
> +    return res;
> +}
> +
> +static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
> +                                 uint32_t offset, bool ignore_pInt)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint32_t devid, eventid;
> +    uint32_t pIntid = 0;
> +    uint32_t max_eventid, max_Intid;
> +    bool dte_valid;
> +    MemTxResult res = MEMTX_OK;
> +    uint16_t icid = 0;
> +    uint64_t dte = 0;
> +    IteEntry ite;
> +    uint32_t int_spurious = INTID_SPURIOUS;
> +
> +    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    eventid = (value & EVENTID_MASK);
> +
> +    if (!ignore_pInt) {
> +        pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
> +    }
> +
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    icid = value & ICID_MASK;
> +
> +    dte = get_dte(s, devid, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
> +
> +    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
> +
> +    if (!ignore_pInt) {
> +        max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1));

This is off by one -- the maximum int ID is
(1ULL << (GICD_TYPER_IDBITS + 1)) - 1

(if you have N bits then the largest ID value is 0b111..111,
not 0b100...000).

> +    }
> +
> +    if ((devid > s->dt.maxids.max_devids) || (icid > s->ct.maxids.max_collids)
> +            || !dte_valid || (eventid > max_eventid) ||
> +            (!ignore_pInt && ((pIntid < GICV3_LPI_INTID_START) ||
> +               (pIntid > max_Intid)))) {

1023 is also a permitted value here (meaning "no interrupt").

> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid command attributes "
> +                      "devid %d or icid %d or eventid %d or pIntid %d or"
> +                      "unmapped dte %d\n", __func__, devid, icid, eventid,
> +                      pIntid, dte_valid);
> +        /*
> +         * in this implementation, in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        memset(&ite, 0 , sizeof(ite));

> +        /* add ite entry to interrupt translation table */
> +        ite.itel = (dte_valid & TABLE_ENTRY_VALID_MASK) |
> +                    (GITS_TYPE_PHYSICAL << ITE_ENTRY_INTTYPE_SHIFT);
> +
> +        if (ignore_pInt) {
> +            ite.itel |= (eventid << ITE_ENTRY_INTID_SHIFT);
> +        } else {
> +            ite.itel |= (pIntid << ITE_ENTRY_INTID_SHIFT);
> +        }
> +        ite.itel |= (int_spurious << ITE_ENTRY_INTSP_SHIFT);
> +        ite.iteh |= icid;

If you use "=" here instead of "|=" to set ite.iteh then you've
explicitly set all the members of "ite" and you don't need the
memset at all.

> +
> +        res = update_ite(s, eventid, dte, ite);
> +    }
> +
> +    return res;
> +}
> +
>  static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
>                                uint64_t rdbase)
>  {
> @@ -128,7 +461,8 @@ static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
>
>      icid = value & ICID_MASK;
>
> -    rdbase = (value >> R_MAPC_RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
> +    rdbase = (value & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
> +    rdbase &= RDBASE_PROCNUM_MASK;

This looks like something that should have been squashed into a
previous patch.

thanks
-- PMM
