Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4123039lfg;
        Mon, 28 Jun 2021 08:55:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvgr7WATC3bveRiRgA/H8qvh/32DZ+HTYfJdyxdgPEq1HJ3fjZfZS3I6ObBI0klcl+/ZLq
X-Received: by 2002:a9f:3e86:: with SMTP id x6mr6558953uai.90.1624895728505;
        Mon, 28 Jun 2021 08:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624895728; cv=none;
        d=google.com; s=arc-20160816;
        b=dDmBK94lH1ir2Hia4F/DXHWWyx0K7Wk9v/KwgiFtaOYe2UA8fSn/ecTnm/lI+6RVJ6
         GB4ZGhKPGskTzAsVA8aY/MBR5IrWZbl50YG9/jA7IUGhOgb4DIcaUJw6jHmB5JQZagFd
         yj1NUCtnOWV9J20HpnHyHZ7wUIHsbFtIBlkFhPFXcN1GChcltxoMg7L8QQPXYDcXmnei
         9/vDaV0FNNZTzubLSrDtwagvk1LLInR3OA6P7LxenCZp6yf2dKrvgQWKrL1gAdK1m56F
         ALvNXhfrW0CJR7guPwRF40nABtZJcPLcmj2xdzkawePBMJyQCM00p60IQ/iovccCfUCa
         LJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=rVvZos/srwh1ttliAtM9OVzlU9MFSBQ3aOLVJRs3eA8=;
        b=Hi1XM6n5EIKzjDIcF5zaWIWA8DGuEqBWDeohGhBKHDfaeBUECk/Y+7cWhbxcAmZG1z
         SIKNaqg9n1WsZmO54kW4/oE2+5zPJmcF1gt4v4DbA3L0kLqLRD/1NF7j9AmQYwfdUOCo
         94KbqJ3Zs9c/k3kcQn3mMT6IMOvSGO03eziDn7unYp4Gtx56jqu3H60oU9wuylCw7fE0
         WbFpfpKqzYp8FTKnpTqt9FsVzG2Dbhu2nhSsKZidduvlrPGXNPshGInH9E8IPjsegC+9
         Ej9YCKX/efqiSq4crGqjwtG3J4baNSMtVZtAwTHSCdPhc9gukhgD8cpllBTTue+/5BYm
         aokw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dgqrpt+T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20si2985529vsq.98.2021.06.28.08.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 08:55:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dgqrpt+T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxtbb-0003mq-9N
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 11:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lxtbR-0003mW-6I
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:55:18 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:37442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lxtbO-0001Qn-Hz
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:55:16 -0400
Received: by mail-qk1-x72d.google.com with SMTP id z3so1452954qkl.4
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 08:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rVvZos/srwh1ttliAtM9OVzlU9MFSBQ3aOLVJRs3eA8=;
 b=Dgqrpt+TmeR5NgfekmoZda3YV7CEqGxQaNWgjrN3HoGYlKsfZpQYt4iHg48kUwam9e
 ZfiJDTtsAdgmEFRJSkYgg/N2HpNZ0bJAwvhyYSwbo6cRDlZS7KX7mH6LEiASWpntpt3u
 ZZbW10MgbJRnPCbX1BQfvttT9lH2BFWu5iaRRmpk3F/sUCt3lolYQ6APHEWvc3nypNYc
 MudOrYDqv5hEPGkct7lBy213TJhpDpwAYKcTJ3OKBx+4rrOsD39synDJth8GP7+aOAtD
 Yuq6Aq+5y583G3wVTvNY98TtEgYrrlfg7H6DBmnkU7eKXPQ5bVmEoToMY3cLCMecgo4a
 1u/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rVvZos/srwh1ttliAtM9OVzlU9MFSBQ3aOLVJRs3eA8=;
 b=Nww79OMzrOTeoqgX0kH2ZIJLo4d3sZ3dsGavhxM6RurrIdXwj58xRt837C6AUv1nlj
 Ivn3w9FH4rhLy2Y6lcX+Oa4ZNvzM8fb99Ubqmr7m1MDZbWMvkgvvYmsM0I9DoSBh5ZIb
 fyReDTdK7c0N03FMQ4KPBFYIs9A0XNyzeM2jYUmHKX+mNXn9kIt0264Zp9UlwKPqmH/2
 W9fSjQnkFbyqoaVriTLF+5NTbdhvyqW+85z1dDH5gpxV8251SDV2G7cewTD9N3jch6VQ
 CPEN1Sf4iYPk8S/+sPAvZFAPNtYa5WbF0PFPHHZdUmT0rPVXhU9LtVHS0PyxHru+QMIE
 kgiw==
X-Gm-Message-State: AOAM530EoOCole9PJ80kFaB/IXUHXH/uHSBjuusgGrv7LYZD7os0EqU0
 AhNooBa5JgTZOyP/+jDblloteA==
X-Received: by 2002:a37:c09:: with SMTP id 9mr9097884qkm.453.1624895712759;
 Mon, 28 Jun 2021 08:55:12 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id h1sm2460055qkm.50.2021.06.28.08.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 08:55:12 -0700 (PDT)
Message-ID: <b0c853554103354a7dd8b6d328a6d07fca2028f1.camel@linaro.org>
Subject: Re: [PATCH v4 3/8] hw/intc: GICv3 ITS command queue framework
From: shashi.mallela@linaro.org
To: Eric Auger <eauger@redhat.com>, peter.maydell@linaro.org,
 leif@nuviainc.com,  rad@semihalf.com
Date: Mon, 28 Jun 2021 11:55:11 -0400
In-Reply-To: <f455443a-abd4-789a-6977-9b8e014086e7@redhat.com>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-4-shashi.mallela@linaro.org>
 <f455443a-abd4-789a-6977-9b8e014086e7@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72d.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vvd8u8aOek4O

Hi Eric,

Had missed this comment earlier.Please find my response (inline)below:-

On Sun, 2021-06-13 at 16:39 +0200, Eric Auger wrote:
> Hi,
> 
> On 6/2/21 8:00 PM, Shashi Mallela wrote:
> > Added functionality to trigger ITS command queue processing on
> > write to CWRITE register and process each command queue entry to
> > identify the command type and handle commands like MAPD,MAPC,SYNC.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_its.c  | 295
> > +++++++++++++++++++++++++++++++++++++++
> >  hw/intc/gicv3_internal.h |  37 +++++
> >  2 files changed, 332 insertions(+)
> > 
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index af60f19c98..6551c577b3 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -49,6 +49,295 @@ static uint64_t baser_base_addr(uint64_t value,
> > uint32_t page_sz)
> >      return result;
> >  }
> >  
> > +static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid,
> > bool valid,
> > +                              uint64_t rdbase)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t value;
> > +    uint64_t l2t_addr;
> > +    bool valid_l2t;
> > +    uint32_t l2t_id;
> > +    uint32_t max_l2_entries;
> > +    uint64_t cte = 0;
> > +    MemTxResult res = MEMTX_OK;
> > +
> > +    if (!s->ct.valid) {
> > +        return res;
> > +    }
> > +
> > +    if (valid) {
> > +        /* add mapping entry to collection table */
> > +        cte = (valid & VALID_MASK) |
> > +              ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL);
> > +    }
> > +
> > +    /*
> > +     * The specification defines the format of level 1 entries of
> > a
> > +     * 2-level table, but the format of level 2 entries and the
> > format
> > +     * of flat-mapped tables is IMPDEF.
> > +     */
> > +    if (s->ct.indirect) {
> > +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> > +
> > +        value = address_space_ldq_le(as,
> > +                                     s->ct.base_addr +
> > +                                     (l2t_id *
> > L1TABLE_ENTRY_SIZE),
> > +                                     MEMTXATTRS_UNSPECIFIED,
> > &res);
> > +
> > +        if (res != MEMTX_OK) {
> > +            return res;
> > +        }
> > +
> > +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > +
> > +        if (valid_l2t) {
> > +            max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
> > +
> > +            l2t_addr = value & ((1ULL << 51) - 1);
> > +
> > +            address_space_stq_le(as, l2t_addr +
> > +                                 ((icid % max_l2_entries) *
> > GITS_CTE_SIZE),
> > +                                 cte, MEMTXATTRS_UNSPECIFIED,
> > &res);
> > +        }
> > +    } else {
> > +        /* Flat level table */
> > +        address_space_stq_le(as, s->ct.base_addr + (icid *
> > GITS_CTE_SIZE),
> > +                             cte, MEMTXATTRS_UNSPECIFIED, &res);
> > +    }
> > +    return res;
> > +}
> 
> Looking at your DevTableDesc and CollTableDesc types again, they are
> basically the same except max_devids/max_collids. You may use a
> single
> one and it may be possible to define helpers to access an entry in
> the
> DT or CT.
will replace DevTableDesc/CollTableDesc types with a common TableDesc
type and introduce a new union member to hold one of
max_devids/max_collids to be referenced by all relevant functions.
> 
> update_cte/update_dte looks quite similar if you compute the cte and
> dte
> externally and pass a pointer to the associated TableDesc?
update_cte/update_cte will (continue) to reference their respective
tables via existing Gicv3ItsState type but through the newly defined
common TableDesc type.
Hope this helps. 
> 
> Thanks
> 
> Eric
> 
> 
> > +
> > +static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint16_t icid;
> > +    uint64_t rdbase;
> > +    bool valid;
> > +    MemTxResult res = MEMTX_OK;
> > +    uint64_t value;
> > +
> > +    offset += NUM_BYTES_IN_DW;
> > +    offset += NUM_BYTES_IN_DW;
> > +
> > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +
> > +    icid = value & ICID_MASK;
> > +
> > +    rdbase = (value >> R_MAPC_RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
> > +
> > +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> > +
> > +    if ((icid > s->ct.max_collids) || (rdbase > s->gicv3-
> > >num_cpu)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "ITS MAPC: invalid collection table
> > attributes "
> > +                      "icid %d rdbase %lu\n",  icid, rdbase);
> > +        /*
> > +         * in this implementation,in case of error
> > +         * we ignore this command and move onto the next
> > +         * command in the queue
> > +         */
> > +    } else {
> > +        res = update_cte(s, icid, valid, rdbase);
> > +    }
> > +
> > +    return res;
> > +}
> > +
> > +static MemTxResult update_dte(GICv3ITSState *s, uint32_t devid,
> > bool valid,
> > +                              uint8_t size, uint64_t itt_addr)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t value;
> > +    uint64_t l2t_addr;
> > +    bool valid_l2t;
> > +    uint32_t l2t_id;
> > +    uint32_t max_l2_entries;
> > +    uint64_t dte = 0;
> > +    MemTxResult res = MEMTX_OK;
> > +
> > +    if (s->dt.valid) {
> > +        if (valid) {
> > +            /* add mapping entry to device table */
> > +            dte = (valid & VALID_MASK) |
> > +                  ((size & SIZE_MASK) << 1U) |
> > +                  ((itt_addr & ITTADDR_MASK) << 6ULL);
> > +        }
> > +    } else {
> > +        return res;
> > +    }
> > +
> > +    /*
> > +     * The specification defines the format of level 1 entries of
> > a
> > +     * 2-level table, but the format of level 2 entries and the
> > format
> > +     * of flat-mapped tables is IMPDEF.
> > +     */
> > +    if (s->dt.indirect) {
> > +        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
> > +
> > +        value = address_space_ldq_le(as,
> > +                                     s->dt.base_addr +
> > +                                     (l2t_id *
> > L1TABLE_ENTRY_SIZE),
> > +                                     MEMTXATTRS_UNSPECIFIED,
> > &res);
> > +
> > +        if (res != MEMTX_OK) {
> > +            return res;
> > +        }
> > +
> > +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > +
> > +        if (valid_l2t) {
> > +            max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
> > +
> > +            l2t_addr = value & ((1ULL << 51) - 1);
> > +
> > +            address_space_stq_le(as, l2t_addr +
> > +                                 ((devid % max_l2_entries) *
> > GITS_DTE_SIZE),
> > +                                 dte, MEMTXATTRS_UNSPECIFIED,
> > &res);
> > +        }
> > +    } else {
> > +        /* Flat level table */
> > +        address_space_stq_le(as, s->dt.base_addr + (devid *
> > GITS_DTE_SIZE),
> > +                             dte, MEMTXATTRS_UNSPECIFIED, &res);
> > +    }
> > +    return res;
> > +}
> > +
> > +static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
> > +                                uint32_t offset)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint32_t devid;
> > +    uint8_t size;
> > +    uint64_t itt_addr;
> > +    bool valid;
> > +    MemTxResult res = MEMTX_OK;
> > +
> > +    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
> > +
> > +    offset += NUM_BYTES_IN_DW;
> > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +
> > +    size = (value & SIZE_MASK);
> > +
> > +    offset += NUM_BYTES_IN_DW;
> > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +
> > +    itt_addr = (value >> ITTADDR_SHIFT) & ITTADDR_MASK;
> > +
> > +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> > +
> > +    if ((devid > s->dt.max_devids) ||
> > +        (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "ITS MAPD: invalid device table attributes "
> > +                      "devid %d or size %d\n", devid, size);
> > +        /*
> > +         * in this implementation, in case of error
> > +         * we ignore this command and move onto the next
> > +         * command in the queue
> > +         */
> > +    } else {
> > +        res = update_dte(s, devid, valid, size, itt_addr);
> > +    }
> > +
> > +    return res;
> > +}
> > +
> > +/*
> > + * Current implementation blocks until all
> > + * commands are processed
> > + */
> > +static void process_cmdq(GICv3ITSState *s)
> > +{
> > +    uint32_t wr_offset = 0;
> > +    uint32_t rd_offset = 0;
> > +    uint32_t cq_offset = 0;
> > +    uint64_t data;
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    MemTxResult res = MEMTX_OK;
> > +    uint8_t cmd;
> > +
> > +    if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> > +        return;
> > +    }
> > +
> > +    wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
> > +
> > +    if (wr_offset > s->cq.max_entries) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: invalid write offset "
> > +                      "%d\n", __func__, wr_offset);
> > +        return;
> > +    }
> > +
> > +    rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
> > +
> > +    while (wr_offset != rd_offset) {
> > +        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
> > +        data = address_space_ldq_le(as, s->cq.base_addr +
> > cq_offset,
> > +                                    MEMTXATTRS_UNSPECIFIED, &res);
> > +        cmd = (data & CMD_MASK);
> > +
> > +        switch (cmd) {
> > +        case GITS_CMD_INT:
> > +            break;
> > +        case GITS_CMD_CLEAR:
> > +            break;
> > +        case GITS_CMD_SYNC:
> > +            /*
> > +             * Current implementation makes a blocking synchronous
> > call
> > +             * for every command issued earlier, hence the
> > internal state
> > +             * is already consistent by the time SYNC command is
> > executed.
> > +             * Hence no further processing is required for SYNC
> > command.
> > +             */
> > +            break;
> > +        case GITS_CMD_MAPD:
> > +            res = process_mapd(s, data, cq_offset);
> > +            break;
> > +        case GITS_CMD_MAPC:
> > +            res = process_mapc(s, cq_offset);
> > +            break;
> > +        case GITS_CMD_MAPTI:
> > +            break;
> > +        case GITS_CMD_MAPI:
> > +            break;
> > +        case GITS_CMD_DISCARD:
> > +            break;
> > +        default:
> > +            break;
> > +        }
> > +        if (res == MEMTX_OK) {
> > +            rd_offset++;
> > +            rd_offset %= s->cq.max_entries;
> > +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET,
> > rd_offset);
> > +        } else {
> > +            /*
> > +             * in this implementation,in case of dma read/write
> > error
> > +             * we stall the command processing
> > +             */
> > +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR,
> > STALLED, 1);
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "%s: %x cmd processing failed!!\n",
> > __func__, cmd);
> > +            break;
> > +        }
> > +    }
> > +}
> > +
> >  static void extract_table_params(GICv3ITSState *s)
> >  {
> >      uint16_t num_pages = 0;
> > @@ -226,6 +515,9 @@ static MemTxResult its_writel(GICv3ITSState *s,
> > hwaddr offset,
> >      case GITS_CWRITER:
> >          s->cwriter = deposit64(s->cwriter, 0, 32,
> >                                 (value &
> > ~R_GITS_CWRITER_RETRY_MASK));
> > +        if (s->cwriter != s->creadr) {
> > +            process_cmdq(s);
> > +        }
> >          break;
> >      case GITS_CWRITER + 4:
> >          s->cwriter = deposit64(s->cwriter, 32, 32,
> > @@ -346,6 +638,9 @@ static MemTxResult its_writell(GICv3ITSState
> > *s, hwaddr offset,
> >          break;
> >      case GITS_CWRITER:
> >          s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
> > +        if (s->cwriter != s->creadr) {
> > +            process_cmdq(s);
> > +        }
> >          break;
> >      case GITS_CREADR:
> >      case GITS_TYPER:
> > diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> > index d6aaa94e4c..0932a30560 100644
> > --- a/hw/intc/gicv3_internal.h
> > +++ b/hw/intc/gicv3_internal.h
> > @@ -253,6 +253,9 @@ FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
> >  FIELD(GITS_CBASER, INNERCACHE, 59, 3)
> >  FIELD(GITS_CBASER, VALID, 63, 1)
> >  
> > +FIELD(GITS_CREADR, STALLED, 0, 1)
> > +FIELD(GITS_CREADR, OFFSET, 5, 15)
> > +
> >  FIELD(GITS_CWRITER, RETRY, 0, 1)
> >  FIELD(GITS_CWRITER, OFFSET, 5, 15)
> >  
> > @@ -289,6 +292,40 @@ FIELD(GITS_TYPER, CIL, 36, 1)
> >  #define L1TABLE_ENTRY_SIZE         8
> >  
> >  #define GITS_CMDQ_ENTRY_SIZE               32
> > +#define NUM_BYTES_IN_DW                     8
> > +
> > +#define CMD_MASK                  0xff
> > +
> > +/* ITS Commands */
> > +#define GITS_CMD_CLEAR            0x04
> > +#define GITS_CMD_DISCARD          0x0F
> > +#define GITS_CMD_INT              0x03
> > +#define GITS_CMD_MAPC             0x09
> > +#define GITS_CMD_MAPD             0x08
> > +#define GITS_CMD_MAPI             0x0B
> > +#define GITS_CMD_MAPTI            0x0A
> > +#define GITS_CMD_SYNC             0x05
> > +
> > +/* MAPC command fields */
> > +#define ICID_LENGTH                  16
> > +#define ICID_MASK                 ((1U << ICID_LENGTH) - 1)
> > +FIELD(MAPC, RDBASE, 16, 32)
> > +
> > +#define RDBASE_PROCNUM_LENGTH        16
> > +#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LENGTH)
> > - 1)
> > +
> > +#define DEVID_SHIFT                  32
> > +#define DEVID_LENGTH                 32
> > +#define DEVID_MASK                ((1ULL << DEVID_LENGTH) - 1)
> > +
> > +/* MAPD command fields */
> > +#define ITTADDR_LENGTH               44
> > +#define ITTADDR_SHIFT                 8
> > +#define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
> > +#define SIZE_MASK                 0x1f
> > +
> > +#define VALID_SHIFT               63
> > +#define VALID_MASK                1ULL
> >  
> >  /**
> >   * Default features advertised by this version of ITS
> > 

