Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4366295lfg;
        Mon, 28 Jun 2021 14:58:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMMnCFzAuovL9FwmRILP7j6EaoOYBfoUVkow30gWLMIGmFb7F3iNB/GSjY3yvR1boBf+m6
X-Received: by 2002:a37:6388:: with SMTP id x130mr27596607qkb.432.1624917522697;
        Mon, 28 Jun 2021 14:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624917522; cv=none;
        d=google.com; s=arc-20160816;
        b=h8JrFej9ZUnYx/6t7mi9d0GfE+tDZFQKygZZFn3b7ApNx1ZiEx51aazX4KdSiB9rWZ
         5KV/bANUXRCdt5gIZj2kdpGP8XMhdxWW/A+GNP3+tab1IXP1CYMgx5A3PbSACftUvHdr
         lQ3eKSxtSsVxgHZSWXjgLjY4QB823o+xoKHBYlKCC7HdjE8APUwovBq8lLPc3SHFhGZQ
         89Od2XPJObBGVl6KdJNe0/kqckpTOftLKWQq+k1MEItcDJFD/aVLGTBAordBnvzRJkNw
         NPF3ytCstzYN872FB5iAFO2fiLCpoftImrTFISTaeL1BGgB3WRmpb793usZWmYiwwVHM
         BhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=F3Yq7roblHtWN1xd1j9QA48GATfICKWN019Kc3QJ9wk=;
        b=nERFEU/0fOFcHJndZFMT/sEf3K+8+wanXcw0enFSJnkoQ9glFNcF1NENRs0ZXmAraU
         2k29zcUo/eVZCg1OeTNW+AB7oo9hxUG9zM0O5AW6CZUSCc9PD97WxG3y5sHc1riEGBmQ
         0XpWXhfsAJr8AlB7W4dnDGZ2A0IKLsuHOOf+QDTWfQsmNmmkakLjYeocwOCFs43wy7ZL
         A041GAa+IfbTR6ZG4aw5u8Fi2ldNT0mm+yiEW4JM0ojW3BIjNb1N5lN7cFxYWgYpEMUY
         YbhCaIMeQURJsAedTJf6yS6A7br4HXDYF/s/X92tQydxvQPkWLF7uSpm4ot1IiGLsoX/
         v0Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPD99WDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si11479386qke.76.2021.06.28.14.58.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 14:58:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPD99WDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxzH7-0004Id-Vw
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 17:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lxzGv-0004GR-UW
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 17:58:29 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:33445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lxzGp-0000D8-HL
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 17:58:29 -0400
Received: by mail-qt1-x82b.google.com with SMTP id e3so14728433qte.0
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F3Yq7roblHtWN1xd1j9QA48GATfICKWN019Kc3QJ9wk=;
 b=XPD99WDfHvka5HRuTqxP4pB6zBGaVnkyLoe4/5Pffnaay+WhE22HoxMwT9GrLsxTd1
 1yXYe8nKUphUYABZ8DsKvGNMT9Zhmjc1kwMpNTvPgKqAXynobMQDBDgsS/ln9GuIcCzK
 T6NGekNTkqitDznAiKwNdsvKVnfdH7jE8BPiZoiYERvNC5vuGfCHkMbefokiTb7HqFK5
 IU5q2xMKguIv6Y55i2iJrN60ESzFuLXZzlhJmpuV9sq+RQpnDzoJPv6rVt1jMRYZOjmE
 3M/dvdEVnO50xiPyZzT3Ix+nwndBtWUwrDfbtXWoMPT8oc1WNW44P0btAocvc9rXNrbm
 UJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F3Yq7roblHtWN1xd1j9QA48GATfICKWN019Kc3QJ9wk=;
 b=ZiafrZ59dYVO7brea80I9k5BMhRgHn+OuR0PuqNPBQ1MwU7FZs/ygMC6sE3kk8dEr/
 502N8xfTnrtrI4+Uwu1n8WWibXmDT9+shmUoz3hb/8WhXqREVsgJXml6RPkf9nR9+pB7
 tau39O34cG4y0axbKyu+n12J+QKUYUw9MbK272tcPk32WwE9UW8NfFo2IaIBsxXu1Zz6
 9jdZqnEUHKoC1wOuDKJkd8wmKDjV0eiJ9IRMKaFsLIPFN41qB1Z+3cTl5uyCA9VbR9l2
 SRuKTyJ7RXTaBn9PHTOnVy36NfZGWaKxf+bIwRxnTglFJkTC7GYfqyNLcV1uVYbRtv6D
 mCpw==
X-Gm-Message-State: AOAM531uXzeQhZwXZOlFaaf74o5vh5MdxtSKiZ2m+3GOeGhR3eXHKPZd
 DTP4Dox1a7T5ufcf2S8q17gUOg==
X-Received: by 2002:a05:622a:149:: with SMTP id
 v9mr24074625qtw.144.1624917502327; 
 Mon, 28 Jun 2021 14:58:22 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id v5sm45794qtp.25.2021.06.28.14.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 14:58:22 -0700 (PDT)
Message-ID: <5f27806f097493171e35f0f56b2b312e77a2bf0a.camel@linaro.org>
Subject: Re: [PATCH v4 3/8] hw/intc: GICv3 ITS command queue framework
From: shashi.mallela@linaro.org
To: Eric Auger <eauger@redhat.com>, peter.maydell@linaro.org,
 leif@nuviainc.com,  rad@semihalf.com
Date: Mon, 28 Jun 2021 17:58:20 -0400
In-Reply-To: <2d330011-16aa-9f2f-ac75-834dd63b25c5@redhat.com>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-4-shashi.mallela@linaro.org>
 <27cf428d-f22f-c336-2b6c-a2feca1103d7@redhat.com>
 <14fa559532fe2dde138b8c9b0688c7cdc5232e2c.camel@linaro.org>
 <2d330011-16aa-9f2f-ac75-834dd63b25c5@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /XhluHYIDg0X

Hi Eric,

Please find my responses to your latest comments (taken care of)
inline:-

On Mon, 2021-06-21 at 12:03 +0200, Eric Auger wrote:
> 
> On 6/16/21 11:02 PM, shashi.mallela@linaro.org wrote:
> > Hi Eric,
> > 
> > Please find my responses inline (below):-
> > 
> > On Sun, 2021-06-13 at 16:13 +0200, Eric Auger wrote:
> > > Hi Sashi,
> > > 
> > > On 6/2/21 8:00 PM, Shashi Mallela wrote:
> > > > Added functionality to trigger ITS command queue processing on
> > > > write to CWRITE register and process each command queue entry
> > > > to
> > > > identify the command type and handle commands like
> > > > MAPD,MAPC,SYNC.
> > > > 
> > > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > > ---
> > > >  hw/intc/arm_gicv3_its.c  | 295
> > > > +++++++++++++++++++++++++++++++++++++++
> > > >  hw/intc/gicv3_internal.h |  37 +++++
> > > >  2 files changed, 332 insertions(+)
> > > > 
> > > > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > > > index af60f19c98..6551c577b3 100644
> > > > --- a/hw/intc/arm_gicv3_its.c
> > > > +++ b/hw/intc/arm_gicv3_its.c
> > > > @@ -49,6 +49,295 @@ static uint64_t baser_base_addr(uint64_t
> > > > value,
> > > > uint32_t page_sz)
> > > >      return result;
> > > >  }
> > > >  
> > > > +static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid,
> > > > bool valid,
> > > > +                              uint64_t rdbase)
> > > > +{
> > > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > > +    uint64_t value;
> > > > +    uint64_t l2t_addr;
> > > > +    bool valid_l2t;
> > > > +    uint32_t l2t_id;
> > > > +    uint32_t max_l2_entries;
> > > > +    uint64_t cte = 0;
> > > > +    MemTxResult res = MEMTX_OK;
> > > > +
> > > > +    if (!s->ct.valid) {
> > > Isn't it a guest log error case. Also you return MEMTX_OK in that
> > > case.
> > > Is that what you want?
> > Yes,because the current implementation treats all command specific
> > errors as "ignored" and moves onto next command in the queue.MEMTX
> > return values are significant for dma read/write status and in case
> > of
> > error we stall the command processing 
> OK
> > > > +        return res;
> > > > +    }
> > > > +
> > > > +    if (valid) {
> > > > +        /* add mapping entry to collection table */
> > > > +        cte = (valid & VALID_MASK) |
> > > > +              ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL);
> > > Do you really need to sanitize rdbase again?
> > Not required,have rectified it.
> > > > +    }
> > > > +
> > > > +    /*
> > > > +     * The specification defines the format of level 1 entries
> > > > of
> > > > a
> > > > +     * 2-level table, but the format of level 2 entries and
> > > > the
> > > > format
> > > > +     * of flat-mapped tables is IMPDEF.
> > > > +     */
> > > > +    if (s->ct.indirect) {
> > > > +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> > > > +
> > > > +        value = address_space_ldq_le(as,
> > > > +                                     s->ct.base_addr +
> > > > +                                     (l2t_id *
> > > > L1TABLE_ENTRY_SIZE),
> > > > +                                     MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +
> > > > +        if (res != MEMTX_OK) {
> > > > +            return res;
> > > > +        }
> > > > +
> > > > +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > > > +
> > > > +        if (valid_l2t) {
> > > > +            max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
> > > > +
> > > > +            l2t_addr = value & ((1ULL << 51) - 1);
> > > > +
> > > > +            address_space_stq_le(as, l2t_addr +
> > > > +                                 ((icid % max_l2_entries) *
> > > > GITS_CTE_SIZE),
> > > > +                                 cte, MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +        }
> > > > +    } else {
> > > > +        /* Flat level table */
> > > > +        address_space_stq_le(as, s->ct.base_addr + (icid *
> > > > GITS_CTE_SIZE),
> > > > +                             cte, MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +    }
> > > > +    return res;
> > > > +}
> > > > +
> > > > +static MemTxResult process_mapc(GICv3ITSState *s, uint32_t
> > > > offset)
> > > > +{
> > > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > > +    uint16_t icid;
> > > > +    uint64_t rdbase;
> > > > +    bool valid;
> > > > +    MemTxResult res = MEMTX_OK;
> > > > +    uint64_t value;
> > > > +
> > > > +    offset += NUM_BYTES_IN_DW;
> > > > +    offset += NUM_BYTES_IN_DW;
> > > May be relevant to add some trace points for debuggability.
> > Probably the trace functionality for ITS can be taken up as a
> > seperate
> > task/feature TODO.
> Yes of course. It may just be useful for you as well to debug ;-)
> > > > +
> > > > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > > > +                                 MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +
> > > > +    if (res != MEMTX_OK) {
> > > > +        return res;
> > > > +    }
> > > > +
> > > > +    icid = value & ICID_MASK;
> > > > +
> > > > +    rdbase = (value >> R_MAPC_RDBASE_SHIFT) &
> > > > RDBASE_PROCNUM_MASK;
> > > usually the mask is applied before the shift.
> > Here we are extracting only 16 bit rdbase(processor number) value
> > by
> > masking with RDBASE_PROCNUM_MASK only after we have right shifted
> > the
> > rdbase offset from the 64 bit DW value.
> > As an alternative,I could have used rdbase = (value &
> > R_MAPC_RDBASE_MASK) to first extract the 32 bits rdbase value from
> > DW
> > and then later mask again with RDBASE_PROCNUM_MASK to narrow it
> > down to
> > 16 bit rdbase(processor number).
> My comment rather was about the fact that generally the mask applied
> to
> the shifted location and then you shift the masked field. I notived
> Peter also made this comment in 4/8 (FIELD macro). You tend to use
> the
> same pattern in different places in your series.
Accepted and have made changes across all relevant sections in all
patch series 
> > > > +
> > > > +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> > > use FIELD, see below
> > > > +
> > > > +    if ((icid > s->ct.max_collids) || (rdbase > s->gicv3-
> > > > > num_cpu)) {
> > > you also need to check against ITS_CIDBITS limit?
> > CIDBITS limits is being checked through the s->ct.max_collids
> > member
> > above
> Ah OK
> > > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > > +                      "ITS MAPC: invalid collection table
> > > > attributes "
> > > > +                      "icid %d rdbase %lu\n",  icid, rdbase);
> > > > +        /*
> > > > +         * in this implementation,in case of error
> > > > +         * we ignore this command and move onto the next
> > > > +         * command in the queue
> > > spec says a command error occurs in that case.
> > Yes,we chose to ignore the  error'ed command and move onto the next
> > one
> > in the queue as per command error options in the spec
> > > > +         */
> > > > +    } else {
> > > > +        res = update_cte(s, icid, valid, rdbase);
> > > > +    }
> > > > +
> > > > +    return res;
> > > > +}
> > > > +
> > > > +static MemTxResult update_dte(GICv3ITSState *s, uint32_t
> > > > devid,
> > > > bool valid,
> > > > +                              uint8_t size, uint64_t itt_addr)
> > > > +{
> > > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > > +    uint64_t value;
> > > > +    uint64_t l2t_addr;
> > > > +    bool valid_l2t;
> > > > +    uint32_t l2t_id;
> > > > +    uint32_t max_l2_entries;
> > > > +    uint64_t dte = 0;
> > > > +    MemTxResult res = MEMTX_OK;
> > > > +
> > > > +    if (s->dt.valid) {
> > > > +        if (valid) {
> > > > +            /* add mapping entry to device table */
> > > > +            dte = (valid & VALID_MASK) |
> > > > +                  ((size & SIZE_MASK) << 1U) |
> > > > +                  ((itt_addr & ITTADDR_MASK) << 6ULL);
> > > > +        }
> > > > +    } else {
> > > > +        return res;
> > > > +    }
> > > > +
> > > > +    /*
> > > > +     * The specification defines the format of level 1 entries
> > > > of
> > > > a
> > > > +     * 2-level table, but the format of level 2 entries and
> > > > the
> > > > format
> > > > +     * of flat-mapped tables is IMPDEF.
> > > > +     */
> > > > +    if (s->dt.indirect) {
> > > > +        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
> > > > +
> > > > +        value = address_space_ldq_le(as,
> > > > +                                     s->dt.base_addr +
> > > > +                                     (l2t_id *
> > > > L1TABLE_ENTRY_SIZE),
> > > > +                                     MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +
> > > > +        if (res != MEMTX_OK) {
> > > > +            return res;
> > > > +        }
> > > > +
> > > > +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > > > +
> > > > +        if (valid_l2t) {
> > > > +            max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
> > > > +
> > > > +            l2t_addr = value & ((1ULL << 51) - 1);
> > > > +
> > > > +            address_space_stq_le(as, l2t_addr +
> > > > +                                 ((devid % max_l2_entries) *
> > > > GITS_DTE_SIZE),
> > > > +                                 dte, MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +        }
> > > > +    } else {
> > > > +        /* Flat level table */
> > > > +        address_space_stq_le(as, s->dt.base_addr + (devid *
> > > > GITS_DTE_SIZE),
> > > > +                             dte, MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +    }
> > > > +    return res;
> > > > +}
> > > > +
> > > > +static MemTxResult process_mapd(GICv3ITSState *s, uint64_t
> > > > value,
> > > you do not seem to use the input value, remove it?
> > yes we are using the input value,which is the 1st DW from the
> > command
> > to extract the deviceid (devid) field below
> Hum my mistake sorry.
> > > > +                                uint32_t offset)
> > > > +{
> > > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > > +    uint32_t devid;
> > > > +    uint8_t size;
> > > > +    uint64_t itt_addr;
> > > > +    bool valid;
> > > > +    MemTxResult res = MEMTX_OK;
> > > > +
> > > > +    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
> > > > +
> > > > +    offset += NUM_BYTES_IN_DW;
> > > > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > > > +                                 MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +
> > > > +    if (res != MEMTX_OK) {
> > > > +        return res;
> > > > +    }
> > > > +
> > > > +    size = (value & SIZE_MASK);
> > > > +
> > > > +    offset += NUM_BYTES_IN_DW;
> > > > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > > > +                                 MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +
> > > > +    if (res != MEMTX_OK) {
> > > > +        return res;
> > > > +    }
> > > > +
> > > > +    itt_addr = (value >> ITTADDR_SHIFT) & ITTADDR_MASK;
> > > this looks weird to me, usually we apply the mask first and then
> > > shift.
> > from the 64 bit DW,we right shift (by 8)to align the itt_addr at
> > 0th
> > position and extract 44 bits(0 to 43) using the mask 
> ditto
Accepted and taken care of as indicated in the previous response
> > > > +
> > > > +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> > > use FIELD_EX64()?
> > > > +
> > > > +    if ((devid > s->dt.max_devids) ||
> > > > +        (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
> > > ITS_IDBITS?
> > IDBITS is one of the fields in GITS_TYPER and the field naming is
> > consistent with the spec definition
> > > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > > +                      "ITS MAPD: invalid device table
> > > > attributes "
> > > > +                      "devid %d or size %d\n", devid, size);
> > > > +        /*
> > > > +         * in this implementation, in case of error
> > > > +         * we ignore this command and move onto the next
> > > > +         * command in the queue
> > > > +         */
> > > > +    } else {
> > > > +        res = update_dte(s, devid, valid, size, itt_addr);
> > > > +    }
> > > > +
> > > > +    return res;
> > > > +}
> > > > +
> > > > +/*
> > > > + * Current implementation blocks until all
> > > > + * commands are processed
> > > > + */
> > > > +static void process_cmdq(GICv3ITSState *s)
> > > > +{> +    uint32_t wr_offset = 0;
> > > > +    uint32_t rd_offset = 0;
> > > > +    uint32_t cq_offset = 0;
> > > > +    uint64_t data;
> > > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > > +    MemTxResult res = MEMTX_OK;
> > > > +    uint8_t cmd;
> > > > +
> > > > +    if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
> > > > +
> > > > +    if (wr_offset > s->cq.max_entries) {
> > > Shouldn't this be checked on cwrite write instead?
> > Yes we are checking within the cwriter write scope,just that the
> > check
> > is happening through this function (called during cwrite write)
> > > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > > +                      "%s: invalid write offset "
> > > > +                      "%d\n", __func__, wr_offset);
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
> > > > +
> > > > +    while (wr_offset != rd_offset) {
> > > > +        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
> > > > +        data = address_space_ldq_le(as, s->cq.base_addr +
> > > > cq_offset,
> > > > +                                    MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +        cmd = (data & CMD_MASK);
> > > > +
> > > > +        switch (cmd) {
> > > > +        case GITS_CMD_INT:
> > > > +            break;
> > > > +        case GITS_CMD_CLEAR:
> > > > +            break;
> > > > +        case GITS_CMD_SYNC:
> > > > +            /*
> > > > +             * Current implementation makes a blocking
> > > > synchronous
> > > > call
> > > > +             * for every command issued earlier, hence the
> > > > internal state
> > > > +             * is already consistent by the time SYNC command
> > > > is
> > > > executed.
> > > > +             * Hence no further processing is required for
> > > > SYNC
> > > > command.
> > > > +             */
> > > > +            break;
> > > > +        case GITS_CMD_MAPD:
> > > > +            res = process_mapd(s, data, cq_offset);
> > > > +            break;
> > > > +        case GITS_CMD_MAPC:
> > > > +            res = process_mapc(s, cq_offset);
> > > > +            break;
> > > > +        case GITS_CMD_MAPTI:
> > > > +            break;
> > > > +        case GITS_CMD_MAPI:
> > > > +            break;
> > > > +        case GITS_CMD_DISCARD:
> > > > +            break;
> > > > +        default:
> > > > +            break;
> > > > +        }
> > > > +        if (res == MEMTX_OK) {
> > > > +            rd_offset++;
> > > > +            rd_offset %= s->cq.max_entries;
> > > > +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR,
> > > > OFFSET,
> > > > rd_offset);
> > > > +        } else {
> > > > +            /*
> > > > +             * in this implementation,in case of dma
> > > > read/write
> > > > error
> > > > +             * we stall the command processing
> > > > +             */
> > > > +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR,
> > > > STALLED, 1);
> > > > +            qemu_log_mask(LOG_GUEST_ERROR,
> > > > +                          "%s: %x cmd processing failed!!\n",
> > > > __func__, cmd);
> > > > +            break;
> > > > +        }
> > > > +    }
> > > > +}
> > > > +
> > > >  static void extract_table_params(GICv3ITSState *s)
> > > >  {
> > > >      uint16_t num_pages = 0;
> > > > @@ -226,6 +515,9 @@ static MemTxResult its_writel(GICv3ITSState
> > > > *s,
> > > > hwaddr offset,
> > > >      case GITS_CWRITER:
> > > >          s->cwriter = deposit64(s->cwriter, 0, 32,
> > > >                                 (value &
> > > > ~R_GITS_CWRITER_RETRY_MASK));
> > > > +        if (s->cwriter != s->creadr) {
> > > > +            process_cmdq(s);
> > > I would expect process_cmdq() to be called as well on ITS enable
> > Done
> > > > +        }
> > > >          break;
> > > >      case GITS_CWRITER + 4:
> > > >          s->cwriter = deposit64(s->cwriter, 32, 32,
> > > > @@ -346,6 +638,9 @@ static MemTxResult
> > > > its_writell(GICv3ITSState
> > > > *s, hwaddr offset,
> > > >          break;
> > > >      case GITS_CWRITER:
> > > >          s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
> > > > +        if (s->cwriter != s->creadr) {
> > > > +            process_cmdq(s);
> > > > +        }
> > > >          break;
> > > >      case GITS_CREADR:
> > > >      case GITS_TYPER:
> > > > diff --git a/hw/intc/gicv3_internal.h
> > > > b/hw/intc/gicv3_internal.h
> > > > index d6aaa94e4c..0932a30560 100644
> > > > --- a/hw/intc/gicv3_internal.h
> > > > +++ b/hw/intc/gicv3_internal.h
> > > > @@ -253,6 +253,9 @@ FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
> > > >  FIELD(GITS_CBASER, INNERCACHE, 59, 3)
> > > >  FIELD(GITS_CBASER, VALID, 63, 1)
> > > >  
> > > > +FIELD(GITS_CREADR, STALLED, 0, 1)
> > > > +FIELD(GITS_CREADR, OFFSET, 5, 15)
> > > > +
> > > >  FIELD(GITS_CWRITER, RETRY, 0, 1)
> > > >  FIELD(GITS_CWRITER, OFFSET, 5, 15)
> > > >  
> > > > @@ -289,6 +292,40 @@ FIELD(GITS_TYPER, CIL, 36, 1)
> > > >  #define L1TABLE_ENTRY_SIZE         8
> > > >  
> > > >  #define GITS_CMDQ_ENTRY_SIZE               32
> > > > +#define NUM_BYTES_IN_DW                     8
> > > > +
> > > > +#define CMD_MASK                  0xff
> > > > +
> > > > +/* ITS Commands */
> > > > +#define GITS_CMD_CLEAR            0x04
> > > > +#define GITS_CMD_DISCARD          0x0F
> > > > +#define GITS_CMD_INT              0x03
> > > > +#define GITS_CMD_MAPC             0x09
> > > > +#define GITS_CMD_MAPD             0x08
> > > > +#define GITS_CMD_MAPI             0x0B
> > > > +#define GITS_CMD_MAPTI            0x0A
> > > > +#define GITS_CMD_SYNC             0x05
> > > > +
> > > > +/* MAPC command fields */
> > > > +#define ICID_LENGTH                  16
> > > > +#define ICID_MASK                 ((1U << ICID_LENGTH) - 1)
> > > can't you use FIELD') as well for the ICID?
> > in addition to MAPC command ICID is a common field for MAPTI,MAPI
> > commands as well,hence wanted to keep it common and seperate
> > > > +FIELD(MAPC, RDBASE, 16, 32)
> > > > +
> > > > +#define RDBASE_PROCNUM_LENGTH        16
> > > > +#define RDBASE_PROCNUM_MASK       ((1ULL <<
> > > > RDBASE_PROCNUM_LENGTH)
> > > > - 1)
> > > why do we have both the RDBASE FIELD def and above defs?
> > RDBASE FIELD def points to the rdbase field within the MAPC
> > command,while the RDBASE_PROCNUM_ defines are used to consider 16
> > bit
> > PE number as the target destination instead of redistributor base
> > address option.
> > > > +
> > > > +#define DEVID_SHIFT                  32
> > > > +#define DEVID_LENGTH                 32
> > > > +#define DEVID_MASK                ((1ULL << DEVID_LENGTH) - 1)
> > > we don't have any DEVID field in MAPC, I guess it belongs to
> > > MAPD?
> > MAPC doesnt have a DEVID field ,but it is a common field in
> > MAPD,INT,MAPI,MAPTI commands(at the same offset)
> Yes but above there is a command saying "MAPC command fields */
Have moved the DEVID defs to common section to avoid the confusion with
MAPC related define
> > > > +
> > > > +/* MAPD command fields */
> > > > +#define ITTADDR_LENGTH               44
> > > > +#define ITTADDR_SHIFT                 8
> > > > +#define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) -
> > > > 1)
> > > > +#define SIZE_MASK                 0x1f
> > > Can't you homogenize the definition, use field() and/or prefix
> > > with
> > > the
> > > cmd name when not common to severals cmds?
> > Since ITTADDR_MASK is common to both MAPD command as well as device
> > table entry field,didnt want to go with field() as the MAPD tag-
> > name in
> > device table entry would be insignificant
> > > > +
> > > > +#define VALID_SHIFT               63
> > > > +#define VALID_MASK                1ULL
> > > >  
> > > >  /**
> > > >   * Default features advertised by this version of ITS
> > > > 
> > > Thanks
> > > 
> > > Eric
> > > 
> > 
> > 
> > 
> Thanks
> 
> Eric
> 

