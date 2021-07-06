Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1975167lfk;
        Tue, 6 Jul 2021 02:31:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgEjpa9fj0Hls/PSAx/gkhkq2a3spHfFm7NTS1iFEOZzV47OodY5GIA0rBMboiPIaXJLnc
X-Received: by 2002:a05:6402:b06:: with SMTP id bm6mr19495697edb.388.1625563899520;
        Tue, 06 Jul 2021 02:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625563899; cv=none;
        d=google.com; s=arc-20160816;
        b=HxEbKvQuN38OOJwAaoswfbadjSBrql9Hr0s345FRdQZQZKhpFCAfrbF0oaq5AMTz4C
         s4DU4Hn9ebBoTQMIDa24ZCOpIinMuxu7tjivADwAlTiQkPukz6WmYuctschCdnQiwMW9
         dRhnhyXhJlhoShK9UIhoMT36al8jYrBbemJi3Eyx37MuAjZf3hUW95822yQE5k4wYbLD
         +hHSGApGRly+345ZeGQtWdYARxeePh4yu6dBZWqX9N7dJpVWXLq39HL4Ozd5cesFZ98P
         Zum6PhXzqZy2HWrcd+EueUck8R1F0MWiv/AUEr2dHx9sLQH5iBRjcTW7RWkr0paxo8yR
         S5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GgE4vOb0D+YJ2wQu1OZ+jnuykbCf+h2NjfafBkpiFgI=;
        b=V/z/20mUAOhTZ13Psiglsj6QyccMg92OEhkAp52VZEbeuDzb6RppuiCFM0QZ/9Mn7Q
         IIKocHGfDux30mY/wZcxeoJXXejJA6K6VvoS/hXY9Vaw3lKug5ApPnJb5oJN1IMSxXZV
         ZetkDoVawDZOtfle9jDHmEhddZxKF5QZieky0W8USjYDZnFeu59fiDmbGYF/mh8/pm2r
         NVEzgxHOtJbaaAk8BYasYEk5GFuxLyzPYDqRmmPDCHyUIbBN/WyJOLIMYsBKO0ZdE8yL
         L4AiqQZjN7VGr8fn8tnRDTQHb73nqIA+CC8PCyQNxI676yX2xVCl4uTpAbeX5SfWbRPA
         BtdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QuDk6efz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qw15si13448452ejb.24.2021.07.06.02.31.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 02:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QuDk6efz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0hQY-0005Gz-6Q
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 05:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m0hQK-0005DO-Ai
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 05:31:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m0hQB-00072p-2q
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 05:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625563874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgE4vOb0D+YJ2wQu1OZ+jnuykbCf+h2NjfafBkpiFgI=;
 b=QuDk6efzCUZok3lV6GtqG6pUlL23QtgAnAbtVPxfLDa0fjBscs8L2A+bSlTRnFqU/rU6gm
 JVSibo6ptKwjdL84Y0mxqcgnJZ6OI2+LKd0JXtRaRDDz+YKrxEVr6GQGldtuvKd6PPmYbK
 6U0CbeJlx6BhSenXdKWoo+/zgNaNBEI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-HKcn5lp0P86B4MqJ83KY8A-1; Tue, 06 Jul 2021 05:31:13 -0400
X-MC-Unique: HKcn5lp0P86B4MqJ83KY8A-1
Received: by mail-wr1-f71.google.com with SMTP id
 t12-20020adff04c0000b029013253c3389dso2543230wro.7
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 02:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GgE4vOb0D+YJ2wQu1OZ+jnuykbCf+h2NjfafBkpiFgI=;
 b=Nnpbpdm11QCNG9wUgKu45dlfKj2oEyJ3YrrzxPZijd9jYfQ5PcTOzBFLrFWib+9ozx
 drExTbFIS4jpuoArSBYo8bdVRi7pVM76ti+aOqvqwrcl15IDQ7LH96734JJ9m5MYyyn2
 esbUHg5j5yfxhLRk/Pm3QVJAF991fVSWq+opgHLhYy4Px7I8RKe/Dq2hKzhApIH7zjDe
 bItuIC5pL7Yrkx/f8CbFmhyj00b5m/eKVkjzZkL2KA8Nj9PN2K2nmnkGqJJk3gVoilYB
 gbMC16uF0QZNxqhoipKXT/3j55lxPTuzMhxU4c/auDDnY/NJfJ+Ybik2BR0S9qpYqvtu
 9kZQ==
X-Gm-Message-State: AOAM533Yv+UG/HBdo9xbXwkAYvRnb9cSUkgaDBxXOrKhVVH2bGUAjqBo
 GJBvrC8m+sarpBsweLTOrLfUhbnB17YYLW0/oCM11IPpI93JZGcEt+rOJdR45MfljdqLOroWSml
 2VEBlnw+fQgLg
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr21104362wrd.404.1625563872204; 
 Tue, 06 Jul 2021 02:31:12 -0700 (PDT)
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr21104344wrd.404.1625563872041; 
 Tue, 06 Jul 2021 02:31:12 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id t16sm15947064wrp.44.2021.07.06.02.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 02:31:11 -0700 (PDT)
Subject: Re: [PATCH v5 03/10] hw/intc: GICv3 ITS command queue framework
To: Shashi Mallela <shashi.mallela@linaro.org>, peter.maydell@linaro.org,
 leif@nuviainc.com, rad@semihalf.com, mst@redhat.com, imammedo@redhat.com
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-4-shashi.mallela@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <4d601f43-a22f-703a-b180-6a157d3f3c07@redhat.com>
Date: Tue, 6 Jul 2021 11:31:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210630153156.9421-4-shashi.mallela@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8bYdaES2f2Mw

Hi Shashi,

On 6/30/21 5:31 PM, Shashi Mallela wrote:
> Added functionality to trigger ITS command queue processing on
> write to CWRITE register and process each command queue entry to
> identify the command type and handle commands like MAPD,MAPC,SYNC.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c  | 305 +++++++++++++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h |  37 +++++
>  2 files changed, 342 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 2d786a1e21..5919d8d7b1 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -49,6 +49,304 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
>      return result;
>  }
>  
> +static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
> +                              uint64_t rdbase)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t value;
> +    uint64_t l2t_addr;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t max_l2_entries;
> +    uint64_t cte = 0;
> +    MemTxResult res = MEMTX_OK;
> +
> +    if (!s->ct.valid) {
> +        return res;
> +    }
> +
> +    if (valid) {
> +        /* add mapping entry to collection table */
> +        cte = (valid & TABLE_ENTRY_VALID_MASK) | (rdbase << 1ULL);
> +    }
> +
> +    /*
> +     * The specification defines the format of level 1 entries of a
> +     * 2-level table, but the format of level 2 entries and the format
> +     * of flat-mapped tables is IMPDEF.
> +     */
> +    if (s->ct.indirect) {
> +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->ct.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, &res);
> +
> +        if (res != MEMTX_OK) {
> +            return res;
> +        }
> +
> +        valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
> +
> +        if (valid_l2t) {
> +            max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
> +
> +            l2t_addr = value & ((1ULL << 51) - 1);
> +
> +            address_space_stq_le(as, l2t_addr +
> +                                 ((icid % max_l2_entries) * GITS_CTE_SIZE),
> +                                 cte, MEMTXATTRS_UNSPECIFIED, &res);
> +        }
> +    } else {
> +        /* Flat level table */
> +        address_space_stq_le(as, s->ct.base_addr + (icid * GITS_CTE_SIZE),
> +                             cte, MEMTXATTRS_UNSPECIFIED, &res);
> +    }
> +    return res;
> +}
> +
> +static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint16_t icid;
> +    uint64_t rdbase;
> +    bool valid;
> +    MemTxResult res = MEMTX_OK;
> +    uint64_t value;
> +
> +    offset += NUM_BYTES_IN_DW;
> +    offset += NUM_BYTES_IN_DW;
> +
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    icid = value & ICID_MASK;
> +
> +    rdbase = (value >> R_MAPC_RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
unusual masking pattern
> +
> +    valid = (value & CMD_FIELD_VALID_MASK);
> +
> +    if ((icid > s->ct.maxids.max_collids) || (rdbase > s->gicv3->num_cpu)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "ITS MAPC: invalid collection table attributes "
> +                      "icid %d rdbase %lu\n",  icid, rdbase);
> +        /*
> +         * in this implementation, in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        res = update_cte(s, icid, valid, rdbase);
> +    }
> +
> +    return res;
> +}
> +
> +static MemTxResult update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
> +                              uint8_t size, uint64_t itt_addr)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t value;
> +    uint64_t l2t_addr;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t max_l2_entries;
> +    uint64_t dte = 0;
> +    MemTxResult res = MEMTX_OK;
> +
> +    if (s->dt.valid) {
> +        if (valid) {
> +            /* add mapping entry to device table */
> +            dte = (valid & TABLE_ENTRY_VALID_MASK) |
> +                  ((size & SIZE_MASK) << 1U) |
> +                  ((itt_addr & ITTADDR_MASK) << 6ULL);
> +        }
> +    } else {
> +        return res;
> +    }
> +
> +    /*
> +     * The specification defines the format of level 1 entries of a
> +     * 2-level table, but the format of level 2 entries and the format
> +     * of flat-mapped tables is IMPDEF.
> +     */
> +    if (s->dt.indirect) {
> +        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->dt.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, &res);
> +
> +        if (res != MEMTX_OK) {
> +            return res;
> +        }
> +
> +        valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
> +
> +        if (valid_l2t) {
> +            max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
> +
> +            l2t_addr = value & ((1ULL << 51) - 1);
> +
> +            address_space_stq_le(as, l2t_addr +
> +                                 ((devid % max_l2_entries) * GITS_DTE_SIZE),
> +                                 dte, MEMTXATTRS_UNSPECIFIED, &res);
> +        }
> +    } else {
> +        /* Flat level table */
> +        address_space_stq_le(as, s->dt.base_addr + (devid * GITS_DTE_SIZE),
> +                             dte, MEMTXATTRS_UNSPECIFIED, &res);
> +    }
> +    return res;
> +}
> +
> +static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
> +                                uint32_t offset)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint32_t devid;
> +    uint8_t size;
> +    uint64_t itt_addr;
> +    bool valid;
> +    MemTxResult res = MEMTX_OK;
> +
> +    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
> +
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    size = (value & SIZE_MASK);
> +
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    itt_addr = (value & ITTADDR_MASK) >> ITTADDR_SHIFT;
> +
> +    valid = (value & CMD_FIELD_VALID_MASK);
> +
> +    if ((devid > s->dt.maxids.max_devids) ||
> +        (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "ITS MAPD: invalid device table attributes "
> +                      "devid %d or size %d\n", devid, size);
> +        /*
> +         * in this implementation, in case of error
> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        res = update_dte(s, devid, valid, size, itt_addr);
> +    }
> +
> +    return res;
> +}
> +
> +/*
> + * Current implementation blocks until all
> + * commands are processed
> + */
> +static void process_cmdq(GICv3ITSState *s)
> +{
> +    uint32_t wr_offset = 0;
> +    uint32_t rd_offset = 0;
> +    uint32_t cq_offset = 0;
> +    uint64_t data;
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    MemTxResult res = MEMTX_OK;
> +    uint8_t cmd;
> +
> +    if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +        return;
> +    }
> +
> +    wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
> +
> +    if (wr_offset > s->cq.max_entries) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid write offset "
> +                      "%d\n", __func__, wr_offset);
> +        return;
> +    }
> +
> +    rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
> +
> +    if (rd_offset > s->cq.max_entries) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid read offset "
> +                      "%d\n", __func__, rd_offset);
> +        return;
> +    }
> +
> +    while (wr_offset != rd_offset) {
> +        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
> +        data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
> +                                    MEMTXATTRS_UNSPECIFIED, &res);
> +        cmd = (data & CMD_MASK);
> +
> +        switch (cmd) {
> +        case GITS_CMD_INT:
> +            break;
> +        case GITS_CMD_CLEAR:
> +            break;
> +        case GITS_CMD_SYNC:
> +            /*
> +             * Current implementation makes a blocking synchronous call
> +             * for every command issued earlier, hence the internal state
> +             * is already consistent by the time SYNC command is executed.
> +             * Hence no further processing is required for SYNC command.
> +             */
> +            break;
> +        case GITS_CMD_MAPD:
> +            res = process_mapd(s, data, cq_offset);
> +            break;
> +        case GITS_CMD_MAPC:
> +            res = process_mapc(s, cq_offset);
> +            break;
> +        case GITS_CMD_MAPTI:
> +            break;
> +        case GITS_CMD_MAPI:
> +            break;
> +        case GITS_CMD_DISCARD:
> +            break;
> +        case GITS_CMD_INV:
> +        case GITS_CMD_INVALL:
> +            break;
> +        default:
> +            break;
> +        }
> +        if (res == MEMTX_OK) {
> +            rd_offset++;
> +            rd_offset %= s->cq.max_entries;
> +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
> +        } else {
> +            /*
> +             * in this implementation, in case of dma read/write error
> +             * we stall the command processing
> +             */
> +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: %x cmd processing failed\n", __func__, cmd);
> +            break;
> +        }
> +    }
> +}
> +
>  /*
>   * This function extracts the ITS Device and Collection table specific
>   * parameters (like base_addr, size etc) from GITS_BASER register.
> @@ -205,6 +503,7 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
>              extract_table_params(s);
>              extract_cmdq_params(s);
>              s->creadr = 0;
> +            process_cmdq(s);
>          }
>          break;
>      case GITS_CBASER:
> @@ -232,6 +531,9 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
>      case GITS_CWRITER:
>          s->cwriter = deposit64(s->cwriter, 0, 32,
>                                 (value & ~R_GITS_CWRITER_RETRY_MASK));
> +        if (s->cwriter != s->creadr) {
> +            process_cmdq(s);
> +        }
>          break;
>      case GITS_CWRITER + 4:
>          s->cwriter = deposit64(s->cwriter, 32, 32, value);
> @@ -378,6 +680,9 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
>          break;
>      case GITS_CWRITER:
>          s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
> +        if (s->cwriter != s->creadr) {
> +            process_cmdq(s);
> +        }
>          break;
>      case GITS_CREADR:
>          if (s->gicv3->gicd_ctlr & GICD_CTLR_DS) {
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index dc2c1bc45b..a27b1e4d19 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -292,6 +292,43 @@ FIELD(GITS_TYPER, CIL, 36, 1)
>  #define L1TABLE_ENTRY_SIZE         8
>  
>  #define GITS_CMDQ_ENTRY_SIZE               32
> +#define NUM_BYTES_IN_DW                     8
> +
> +#define CMD_MASK                  0xff
> +
> +/* ITS Commands */
> +#define GITS_CMD_CLEAR            0x04
> +#define GITS_CMD_DISCARD          0x0F
> +#define GITS_CMD_INT              0x03
> +#define GITS_CMD_MAPC             0x09
> +#define GITS_CMD_MAPD             0x08
> +#define GITS_CMD_MAPI             0x0B
> +#define GITS_CMD_MAPTI            0x0A
> +#define GITS_CMD_INV              0x0C
> +#define GITS_CMD_INVALL           0x0D
> +#define GITS_CMD_SYNC             0x05
> +
> +/* MAPC command fields */
> +#define ICID_LENGTH                  16
> +#define ICID_MASK                 ((1U << ICID_LENGTH) - 1)
> +FIELD(MAPC, RDBASE, 16, 32)
> +
> +#define RDBASE_PROCNUM_LENGTH        16
> +#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LENGTH) - 1)
> +
> +/* MAPD command fields */
> +#define ITTADDR_LENGTH               44
> +#define ITTADDR_SHIFT                 8
> +#define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
> +#define SIZE_MASK                 0x1f
> +
> +#define DEVID_SHIFT                  32
> +#define DEVID_MASK                MAKE_64BIT_MASK(32, 32)
> +
> +#define VALID_SHIFT               63
> +#define CMD_FIELD_VALID_MASK      (1ULL << VALID_SHIFT)
> +#define L2_TABLE_VALID_MASK       CMD_FIELD_VALID_MASK
> +#define TABLE_ENTRY_VALID_MASK    (1ULL << 0)
>  
>  /**
>   * Default features advertised by this version of ITS
> 
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

