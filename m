Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1231582lff;
        Sun, 13 Jun 2021 07:39:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3b+9SaOYFTEPeLA5lEr+lHcCU8y6iossqKOsIbM0IvKwWmKs4XqDfy2CNg+vBzEem9wqN
X-Received: by 2002:a05:6638:3807:: with SMTP id i7mr12975565jav.5.1623595193941;
        Sun, 13 Jun 2021 07:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623595193; cv=none;
        d=google.com; s=arc-20160816;
        b=uGHNwzcXMhzqjmQlMokEjRjqah4Ye1O0W0wo3idgnNiUV2IYgklM/KHPFobjeFOxTj
         6D9ubAXZZA/KdjiQ/e1PkwPi5AKKYIfMxGknQ408UkTZf1/P+4anYEqcpw2UcTnYzmEY
         WWKW08SjjljF2WZg8Y6dx1rL3suHaS4op3GtBITq4x0Chztsk55b5xwIyN435qJfn0qz
         KsYpgWT8wzXNhn6W8b31OErEJ27jDudHxovkC5IBmtEAl7XHYsUt4N4ZIV749j92x6bB
         +tNugoqA96D6qRbQF+MZjUfHqy+GxxmD4P440bqM9UT2X1FdW4586ASI4s4QX2gcrBj8
         Q0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7pR9cTOQqmR5wHtO9q1C7ZXH7wUrAQlNjaFGUUli9KE=;
        b=o9dmpOFADo2VEn8y6o/dsxhG+uz/UThf40wGLElCzTSwcihjGSo5N3mnoxxohjMAyT
         cYn3RXqZBHETuGUkevqRTlDIMuuk8UqHWrtFKhwsXFqsvyq/vt5Vdp8syEp1CXKY2qXr
         R/VKmon+f+nSxzwWNb0bhEmGGr5pIYlsbK00qVhg2mJN112NSDaOZo5USCx9eKOfbAZ9
         uwn3vRQwIPT9CUKBJY/v8dFJ46t9IcAYa/6mmV1IieKtuo/CLt7SmSamxWSuzKqInphx
         g8YafmKIBwM90pkczZKdg80bZsNWC8W/zjJFRf61wA8mxQlJXjs9sLx+vtxjmg4XxBvK
         0SVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SsEFV0Dq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si12832224ilu.2.2021.06.13.07.39.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jun 2021 07:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SsEFV0Dq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsRHF-0000UE-7a
	for alex.bennee@linaro.org; Sun, 13 Jun 2021 10:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lsRH6-0000Tu-LJ
 for qemu-arm@nongnu.org; Sun, 13 Jun 2021 10:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lsRH2-0001Mo-G3
 for qemu-arm@nongnu.org; Sun, 13 Jun 2021 10:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623595179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pR9cTOQqmR5wHtO9q1C7ZXH7wUrAQlNjaFGUUli9KE=;
 b=SsEFV0DqYWI8wVe61NQzXnJMUovK05GLJL61M4KL85MgBy2d2+Dojf8G9C0sjKuiISJ+H7
 8cJ/Af6vjm6jSElk9e4eNySyhmJUQGF5r45CR/d7iauS8FfHhyCGaGnNpsqgsFdcG6ijSw
 7LMc2WC+q7pq6vGaoGlnXghvkF7h90s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-D2gEOmjaOa6jvBkazz8DZA-1; Sun, 13 Jun 2021 10:39:38 -0400
X-MC-Unique: D2gEOmjaOa6jvBkazz8DZA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l13-20020adfe9cd0000b0290119a0645c8fso5646022wrn.8
 for <qemu-arm@nongnu.org>; Sun, 13 Jun 2021 07:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7pR9cTOQqmR5wHtO9q1C7ZXH7wUrAQlNjaFGUUli9KE=;
 b=EYW1/QMJPalLVOCENCi1/rJ1TGBWvAENK4zuJ/Dxp+i26ejHYsy+Pow5ykeSqqECAx
 HjRL1mYTpYi6a+ZxTo8nmkC4QwZnsFkLi+FqkQnhPrxfV6Nu9wYhAvb7HRbRVRSv1SMo
 tviYxYxtMkN7Q1233hA2aK86WrVWZ0CxQmaW5KFDBvt1pi5n25M08bH+iSBchDUNGPsI
 IKTbnM95uyZMid48fpfFCADwL/XSE+m+n4Cp/o/aZAhJajqSNEPcmUxyNtt+JohM3Z8z
 JVb9xJJM182Ms02fikbb4+vOGmSMXqBiXjbfVDbSg9gvJOn/TBAHSFXuvneY6cqB53C5
 uTsQ==
X-Gm-Message-State: AOAM530CwDi0nj8kiP/QdfI18e898BBdLYHEyASOv2Ng05i1XBXxMGEk
 6HoyiTT9AGMxYBo8XfvoaKmPPKjr9H24EGl6wrNAxchFrtdtChtqvtWXpuZ+FiQVOcyACTlJ+YQ
 1qRAnam0ZMy9g
X-Received: by 2002:a5d:47ce:: with SMTP id o14mr14002612wrc.273.1623595177117; 
 Sun, 13 Jun 2021 07:39:37 -0700 (PDT)
X-Received: by 2002:a5d:47ce:: with SMTP id o14mr14002594wrc.273.1623595176839; 
 Sun, 13 Jun 2021 07:39:36 -0700 (PDT)
Received: from [192.168.43.95] ([37.170.26.89])
 by smtp.gmail.com with ESMTPSA id l20sm10596810wmq.3.2021.06.13.07.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jun 2021 07:39:36 -0700 (PDT)
Subject: Re: [PATCH v4 3/8] hw/intc: GICv3 ITS command queue framework
To: Shashi Mallela <shashi.mallela@linaro.org>, peter.maydell@linaro.org,
 leif@nuviainc.com, rad@semihalf.com
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-4-shashi.mallela@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <f455443a-abd4-789a-6977-9b8e014086e7@redhat.com>
Date: Sun, 13 Jun 2021 16:39:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602180042.111347-4-shashi.mallela@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: Dl87TJH4GbrU

Hi,

On 6/2/21 8:00 PM, Shashi Mallela wrote:
> Added functionality to trigger ITS command queue processing on
> write to CWRITE register and process each command queue entry to
> identify the command type and handle commands like MAPD,MAPC,SYNC.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c  | 295 +++++++++++++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h |  37 +++++
>  2 files changed, 332 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index af60f19c98..6551c577b3 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -49,6 +49,295 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
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
> +        cte = (valid & VALID_MASK) |
> +              ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL);
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
> +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
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

Looking at your DevTableDesc and CollTableDesc types again, they are
basically the same except max_devids/max_collids. You may use a single
one and it may be possible to define helpers to access an entry in the
DT or CT.

update_cte/update_dte looks quite similar if you compute the cte and dte
externally and pass a pointer to the associated TableDesc?

Thanks

Eric


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
> +
> +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +    if ((icid > s->ct.max_collids) || (rdbase > s->gicv3->num_cpu)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "ITS MAPC: invalid collection table attributes "
> +                      "icid %d rdbase %lu\n",  icid, rdbase);
> +        /*
> +         * in this implementation,in case of error
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
> +            dte = (valid & VALID_MASK) |
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
> +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
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
> +    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
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
> +    itt_addr = (value >> ITTADDR_SHIFT) & ITTADDR_MASK;
> +
> +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +    if ((devid > s->dt.max_devids) ||
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
> +        default:
> +            break;
> +        }
> +        if (res == MEMTX_OK) {
> +            rd_offset++;
> +            rd_offset %= s->cq.max_entries;
> +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
> +        } else {
> +            /*
> +             * in this implementation,in case of dma read/write error
> +             * we stall the command processing
> +             */
> +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: %x cmd processing failed!!\n", __func__, cmd);
> +            break;
> +        }
> +    }
> +}
> +
>  static void extract_table_params(GICv3ITSState *s)
>  {
>      uint16_t num_pages = 0;
> @@ -226,6 +515,9 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
>      case GITS_CWRITER:
>          s->cwriter = deposit64(s->cwriter, 0, 32,
>                                 (value & ~R_GITS_CWRITER_RETRY_MASK));
> +        if (s->cwriter != s->creadr) {
> +            process_cmdq(s);
> +        }
>          break;
>      case GITS_CWRITER + 4:
>          s->cwriter = deposit64(s->cwriter, 32, 32,
> @@ -346,6 +638,9 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
>          break;
>      case GITS_CWRITER:
>          s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
> +        if (s->cwriter != s->creadr) {
> +            process_cmdq(s);
> +        }
>          break;
>      case GITS_CREADR:
>      case GITS_TYPER:
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index d6aaa94e4c..0932a30560 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -253,6 +253,9 @@ FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
>  FIELD(GITS_CBASER, INNERCACHE, 59, 3)
>  FIELD(GITS_CBASER, VALID, 63, 1)
>  
> +FIELD(GITS_CREADR, STALLED, 0, 1)
> +FIELD(GITS_CREADR, OFFSET, 5, 15)
> +
>  FIELD(GITS_CWRITER, RETRY, 0, 1)
>  FIELD(GITS_CWRITER, OFFSET, 5, 15)
>  
> @@ -289,6 +292,40 @@ FIELD(GITS_TYPER, CIL, 36, 1)
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
> +#define DEVID_SHIFT                  32
> +#define DEVID_LENGTH                 32
> +#define DEVID_MASK                ((1ULL << DEVID_LENGTH) - 1)
> +
> +/* MAPD command fields */
> +#define ITTADDR_LENGTH               44
> +#define ITTADDR_SHIFT                 8
> +#define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
> +#define SIZE_MASK                 0x1f
> +
> +#define VALID_SHIFT               63
> +#define VALID_MASK                1ULL
>  
>  /**
>   * Default features advertised by this version of ITS
> 

