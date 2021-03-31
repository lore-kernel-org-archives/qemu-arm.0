Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp647546lfg;
        Wed, 31 Mar 2021 09:48:17 -0700 (PDT)
X-Received: by 2002:ae9:d60a:: with SMTP id r10mr3853441qkk.411.1617209297551;
        Wed, 31 Mar 2021 09:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617209297; cv=none;
        d=google.com; s=arc-20160816;
        b=xiv2w+/+1ZCC3fAnq9Rkr/jFFgyBXZSU7Nbq3Nu6JmykrHCPwQcWn3WuTULttOgqYb
         ahnnVlN3D8V8eQpRPVS0DeJg1nMLV6mRVDXrVlQ3I5m/qMeKQCpp1uMCUziY2odsY9d3
         v0wg+6OXsQJ403uvwvEmuzOqKvRFPPq0xRTNRkeyCEv+1NVNjzMg/1lowkzzpgQzvfui
         LlKhkLHOFRfwXih8TXoayWhSP+UmZOZvr+yWEJtdWhJ6Geif4ZC/ifcQTLefJeYpPwsz
         3B+QXLAQWtLziGscyzsJ7DksGs7yrJvhQjPw3NgP+jyeiT7+VZ/EsO3kT4ARuzDzYbdp
         oO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id:dkim-signature;
        bh=BrmnjGY9rSiZddWV346h4yTdcmLnWqqZAebcGSlU9uA=;
        b=riUR7cmiMQ+1S9yN+1xm68rVXBTMOe8vnHQW9wtLXPq2DDf2a+0Kv5MTfHZMA95Mlh
         o82eGJR21NAI/UatDm/TQa+WFPObzk37hyw+x9UCA2zB5joTFtiqtAr4egHmvw+ZRWuP
         hOe/S4rCz4xdHUfZJQybd7165IwfmRDwSqmnBXwXmzIaDg69XVkvRJBRjf6cuZaK6vfb
         anu6N2unfXRQUqUYU+F3V5ehqf9DJ06UbmyqFbEMyDa87TJr6qou4meSa5QWuFiYnolu
         o4mFgCcVWuuIZrFkWWtt60v2GyKaME26qpUkwWKl/TAxm6Z+uUHY0CMF1tBu9D6PM8Nn
         vxkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JEiQ4C7G;
       spf=pass (google.com: domain of shashi.mallela@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=shashi.mallela@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <shashi.mallela@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 77sor1097894qkl.24.2021.03.31.09.48.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Mar 2021 09:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of shashi.mallela@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JEiQ4C7G;
       spf=pass (google.com: domain of shashi.mallela@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=shashi.mallela@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BrmnjGY9rSiZddWV346h4yTdcmLnWqqZAebcGSlU9uA=;
        b=JEiQ4C7GvFYFhI3GPfedozUMWeRDhKhP6ZQQ9DjPYuuXkT+s0vlvIyd1iGi0ffmbWs
         HlohaYPdI80XiRva+mB5CvJDM9FS8C5n49s9nbiPm2rIO3pxNVjKqALFvmy3NqZlB8xM
         WZ8DNqlfv8GR65o+QiB/Qi37IyeeI9K0BLZKUYVPEqgvbg3rnIWI7o5YRHFNiedaFZgN
         J+IwfyXYi3MRAaE8rONfW3nRHdFj736dOCv3b705FwefXt55dXTtMdKoPQY5YEPMp+JM
         yI13Qh16VPYBgz4ARls8gTFOX4DN69Xx+CsjjKsPVuEUgTiAjo9uMqrNeAFoXromcLXx
         JMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BrmnjGY9rSiZddWV346h4yTdcmLnWqqZAebcGSlU9uA=;
        b=uEcyLxClkRHvHspD8XUaC7L3wmHkg+M8de2KbI4lSLzDciTTaCGwI98Z7vqlxocoIg
         ALHF5Qfc2Z7/tCAU9FeyZhJsaCjXtJZ162scYn8wponbBqHVybkvc+xF+BKq5bxrScw+
         dNGM1D3zB6zMghBzVb5m7nNSV5spf5C8ekhu1Vvdf/A1qLDcOFGIxL0VPJlsS/8Id/Zd
         wnXxjpwVM3dQysujRL8gLp/53H5YbSQ1cwUILzWfv9z3cPDOuD31pR5a/f79ev1coPtL
         cZwxZ7PyWTPnpeUii2O4xsBPNEhjIzeEqtDE7TdweYz+zpPyabuCPCNR3ZBmrvP4lZox
         Kt2A==
X-Gm-Message-State: AOAM533PyaZTw6oebkrpK2U5pR8LcqjEVcihaqYzvtWWH/96mm7u0y5D
	2KDk3Z2LpeqqpqgMSYTJxH/cUk9ITzVFzGoQ
X-Google-Smtp-Source: ABdhPJw1D/PPnrtsrXL0B02nlF550XEWRDSPxoDb5eq42gSIBM/BO4c+a0hohhqhEWuFdMKiD8eSkA==
X-Received: by 2002:ae9:e40b:: with SMTP id q11mr4120024qkc.318.1617209296982;
        Wed, 31 Mar 2021 09:48:16 -0700 (PDT)
Return-Path: <shashi.mallela@linaro.org>
Received: from localhost.localdomain (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
        by smtp.gmail.com with ESMTPSA id z89sm1764484qtd.5.2021.03.31.09.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 09:48:16 -0700 (PDT)
Message-ID: <35e6e1b000a4aae059b95ff24e83e66995e2917b.camel@linaro.org>
Subject: Re: [PATCH v1 2/8] hw/intc: GICv3 ITS register definitions added
From: shashi.mallela@linaro.org
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Wed, 31 Mar 2021 12:48:14 -0400
In-Reply-To: <87mtur10mu.fsf@linaro.org>
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
	 <20210323041238.133835-3-shashi.mallela@linaro.org>
	 <87mtur10mu.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: prcbFsksze0a

On Thu, 2021-03-25 at 19:34 +0000, Alex Bennée wrote:
> Shashi Mallela <shashi.mallela@linaro.org> writes:
> 
> > Defined descriptors for ITS device table,collection table and ITS
> > command queue entities.Implemented register read/write functions,
> > extract ITS table parameters and command queue parameters,extended
> > gicv3 common to capture qemu address space(which host the ITS table
> > platform memories required for subsequent ITS processing) and
> > initialize the same in its device.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_its.c            | 356 ++++++++++++++++++++
> >  include/hw/intc/arm_gicv3_common.h |   4 +
> >  2 files changed, 360 insertions(+)
> > 
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 34e49b4d63..4895d32e67 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -23,11 +23,179 @@ typedef struct GICv3ITSClass GICv3ITSClass;
> >  DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
> >                       ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
> >  
> > +typedef struct {
> > +    bool valid;
> > +    bool indirect;
> > +    uint16_t entry_sz;
> > +    uint32_t max_entries;
> > +    uint32_t max_devids;
> > +    uint64_t base_addr;
> > +} DevTableDesc;
> > +
> > +typedef struct {
> > +    bool valid;
> > +    bool indirect;
> > +    uint16_t entry_sz;
> > +    uint32_t max_entries;
> > +    uint32_t max_collids;
> > +    uint64_t base_addr;
> > +} CollTableDesc;
> > +
> > +typedef struct {
> > +    bool valid;
> > +    uint32_t max_entries;
> > +    uint64_t base_addr;
> > +} CmdQDesc;
> > +
> >  struct GICv3ITSClass {
> >      GICv3ITSCommonClass parent_class;
> >      void (*parent_reset)(DeviceState *dev);
> > +
> > +    DevTableDesc  dt;
> > +    CollTableDesc ct;
> > +    CmdQDesc      cq;
> >  };
> >  
> > +static bool extract_table_params(GICv3ITSState *s, int index)
> > +{
> > +    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
> > +    uint16_t num_pages = 0;
> > +    uint8_t  page_sz_type;
> > +    uint8_t type;
> > +    uint32_t page_sz = 0;
> > +    uint64_t value = s->baser[index];
> > +
> > +    num_pages = (value & GITS_BASER_SIZE);
> > +    page_sz_type = (value >> GITS_BASER_PAGESIZE_OFFSET) &
> > +                        GITS_BASER_PAGESIZE_MASK;
> 
> So these definitions can come in the header on the same patch where
> they
> are used. Also with the FIELD macros this then becomes:
> 
>   num_pages = FIELD_EX64(value, GITS_BASER, SIZE);
>   page_sz_type = FIELD_EX64(value, GITS_BASER, PAGESIZE);
> 
> etc...
> 
> basically anywhere where you are shift and masking you should be
> using
> the FIELD macros (or at the least the extract/deposit functions).
> 
> > +
> > +    if (page_sz_type == 0) {
> > +        page_sz = GITS_ITT_PAGE_SIZE_0;
> > +    } else if (page_sz_type == 0) {
> > +        page_sz = GITS_ITT_PAGE_SIZE_1;
> > +    } else if (page_sz_type == 2) {
> > +        page_sz = GITS_ITT_PAGE_SIZE_2;
> > +    } else {
> > +        return false;
> > +    }
> > +
> > +    type = (value >> GITS_BASER_TYPE_OFFSET) &
> > +                        GITS_BASER_TYPE_MASK;
> > +
> > +    if (type == GITS_ITT_TYPE_DEVICE) {
> > +        c->dt.valid = (value >> GITS_BASER_VALID) &
> > GITS_BASER_VALID_MASK;
> > +
> > +        if (c->dt.valid) {
> > +            c->dt.indirect = (value >> GITS_BASER_INDIRECT_OFFSET)
> > &
> > +                                       GITS_BASER_INDIRECT_MASK;
> > +            c->dt.entry_sz = (value >>
> > GITS_BASER_ENTRYSIZE_OFFSET) &
> > +                                   GITS_BASER_ENTRYSIZE_MASK;
> > +
> > +            if (!c->dt.indirect) {
> > +                c->dt.max_entries = ((num_pages + 1) * page_sz) /
> > +                                                       c-
> > >dt.entry_sz;
> > +            } else {
> > +                c->dt.max_entries = ((((num_pages + 1) * page_sz)
> > /
> > +                                        L1TABLE_ENTRY_SIZE) *
> > +                                    (page_sz / c->dt.entry_sz));
> > +            }
> > +
> > +            c->dt.max_devids = (1UL << (((value >>
> > GITS_TYPER_DEVBITS_OFFSET) &
> > +                                           GITS_TYPER_DEVBITS_MASK
> > ) + 1));
> > +
> > +            if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
> > +                    (page_sz == GITS_ITT_PAGE_SIZE_1)) {
> > +                c->dt.base_addr = (value >>
> > GITS_BASER_PHYADDR_OFFSET) &
> > +                                        GITS_BASER_PHYADDR_MASK;
> > +                c->dt.base_addr <<= GITS_BASER_PHYADDR_OFFSET;
> > +            } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
> > +                c->dt.base_addr = ((value >>
> > GITS_BASER_PHYADDR_OFFSETL_64K) &
> > +                                   GITS_BASER_PHYADDR_MASKL_64K)
> > <<
> > +                                     GITS_BASER_PHYADDR_OFFSETL_64
> > K;
> > +                c->dt.base_addr |= ((value >>
> > GITS_BASER_PHYADDR_OFFSET) &
> > +                                    GITS_BASER_PHYADDR_MASKH_64K)
> > <<
> > +                                     GITS_BASER_PHYADDR_OFFSETH_64
> > K;
> > +            }
> > +        }
> > +    } else if (type == GITS_ITT_TYPE_COLLECTION) {
> > +        c->ct.valid = (value >> GITS_BASER_VALID) &
> > GITS_BASER_VALID_MASK;
> > +
> > +        /*
> > +         * GITS_TYPER.HCC is 0 for this implementation
> > +         * hence writes are discarded if ct.valid is 0
> > +         */
> > +        if (c->ct.valid) {
> > +            c->ct.indirect = (value >> GITS_BASER_INDIRECT_OFFSET)
> > &
> > +                                       GITS_BASER_INDIRECT_MASK;
> > +            c->ct.entry_sz = (value >>
> > GITS_BASER_ENTRYSIZE_OFFSET) &
> > +                                    GITS_BASER_ENTRYSIZE_MASK;
> > +
> > +            if (!c->ct.indirect) {
> > +                c->ct.max_entries = ((num_pages + 1) * page_sz) /
> > +                                      c->ct.entry_sz;
> > +            } else {
> > +                c->ct.max_entries = ((((num_pages + 1) * page_sz)
> > /
> > +                                      L1TABLE_ENTRY_SIZE) *
> > +                                      (page_sz / c->ct.entry_sz));
> > +            }
> > +
> > +            if ((value >> GITS_TYPER_CIL_OFFSET) &
> > GITS_TYPER_CIL_MASK) {
> > +                c->ct.max_collids = (1UL << (((value >>
> > +                                               GITS_TYPER_CIDBITS_
> > OFFSET) &
> > +                                               GITS_TYPER_CIDBITS_
> > MASK) + 1));
> > +            } else {
> > +                /* 16-bit CollectionId supported when CIL == 0 */
> > +                c->ct.max_collids = (1UL << 16);
> > +            }
> > +
> > +            if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
> > +                 (page_sz == GITS_ITT_PAGE_SIZE_1)) {
> > +                c->ct.base_addr = (value >>
> > GITS_BASER_PHYADDR_OFFSET) &
> > +                                            GITS_BASER_PHYADDR_MAS
> > K;
> > +                c->ct.base_addr <<= GITS_BASER_PHYADDR_OFFSET;
> > +            } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
> > +                c->ct.base_addr = ((value >>
> > GITS_BASER_PHYADDR_OFFSETL_64K) &
> > +                                   GITS_BASER_PHYADDR_MASKL_64K)
> > <<
> > +                                    GITS_BASER_PHYADDR_OFFSETL_64K
> > ;
> > +                c->ct.base_addr |= ((value >>
> > GITS_BASER_PHYADDR_OFFSET) &
> > +                                    GITS_BASER_PHYADDR_MASKH_64K)
> > <<
> > +                                    GITS_BASER_PHYADDR_OFFSETH_64K
> > ;
> > +            }
> > +        }
> > +    } else {
> > +        /* unsupported ITS table type */
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unsupported ITS table
> > type %d",
> > +                         __func__, type);
> 
> LOG_UNIMP
> this is not LOG_UNIMP but error indication
> 
> > +        return false;
> > +    }
> > +    return true;
> > +}
> > +
> > +static bool extract_cmdq_params(GICv3ITSState *s)
> > +{
> > +    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
> > +    uint16_t num_pages = 0;
> > +    uint64_t value = s->cbaser;
> > +
> > +    num_pages = (value & GITS_CBASER_SIZE);
> > +
> > +    c->cq.valid = (value >> GITS_CBASER_VALID_OFFSET) &
> > +                                GITS_CBASER_VALID_MASK;
> > +
> > +    if (!num_pages || !c->cq.valid) {
> > +        return false;
> > +    }
> > +
> > +    if (c->cq.valid) {
> > +        c->cq.max_entries = ((num_pages + 1) *
> > GITS_ITT_PAGE_SIZE_0) /
> > +                                                GITS_CMDQ_ENTRY_SI
> > ZE;
> > +        c->cq.base_addr = (value >> GITS_CBASER_PHYADDR_OFFSET) &
> > +                                    GITS_CBASER_PHYADDR_MASK;
> > +        c->cq.base_addr <<= GITS_CBASER_PHYADDR_OFFSET;
> > +    }
> > +    return true;
> > +}
> > +
> >  static MemTxResult its_trans_writew(GICv3ITSState *s, hwaddr
> > offset,
> >                                 uint64_t value, MemTxAttrs attrs)
> >  {
> > @@ -126,7 +294,75 @@ static MemTxResult its_writel(GICv3ITSState
> > *s, hwaddr offset,
> >                                 uint64_t value, MemTxAttrs attrs)
> >  {
> >      MemTxResult result = MEMTX_OK;
> > +    int index;
> > +    uint64_t temp = 0;
> >  
> > +    switch (offset) {
> > +    case GITS_CTLR:
> > +        s->ctlr |= (value & ~(s->ctlr));
> > +        break;
> > +    case GITS_CBASER:
> > +        /* GITS_CBASER register becomes RO if ITS is already
> > enabled */
> > +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> > +            s->cbaser = deposit64(s->cbaser, 0, 32, value);
> > +            s->creadr = 0;
> > +        }
> > +        break;
> > +    case GITS_CBASER + 4:
> > +        /* GITS_CBASER register becomes RO if ITS is already
> > enabled */
> > +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> > +            s->cbaser = deposit64(s->cbaser, 32, 32, value);
> > +            if (!extract_cmdq_params(s)) {
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                       "%s: error extracting GITS_CBASER
> > parameters "
> > +                       TARGET_FMT_plx "\n", __func__, offset);
> > +                s->cbaser = 0;
> > +                result = MEMTX_ERROR;
> 
> LOG_UNIMP?
> this is not LOG_UNIMP but error indication
> 
> > +            } else {
> > +                s->creadr = 0;
> > +            }
> > +        }
> > +        break;
> > +    case GITS_CWRITER:
> > +        s->cwriter = deposit64(s->cwriter, 0, 32, value);
> > +        break;
> > +    case GITS_CWRITER + 4:
> > +        s->cwriter = deposit64(s->cwriter, 32, 32, value);
> > +        break;
> > +    case GITS_BASER ... GITS_BASER + 0x3f:
> > +        /* GITS_BASERn registers become RO if ITS is already
> > enabled */
> > +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> > +            index = (offset - GITS_BASER) / 8;
> > +
> > +            if (offset & 7) {
> > +                temp = s->baser[index];
> > +                temp = deposit64(temp, 32, 32, (value &
> > ~GITS_BASER_VAL_MASK));
> > +                s->baser[index] |= temp;
> > +
> > +                if (!extract_table_params(s, index)) {
> > +                    qemu_log_mask(LOG_GUEST_ERROR,
> > +                        "%s: error extracting GITS_BASER
> > parameters "
> > +                        TARGET_FMT_plx "\n", __func__, offset);
> 
> LOG_UNIMP again?
> this is not LOG_UNIMP but error indication
> 
> > +                    s->baser[index] = 0;
> > +                    result = MEMTX_ERROR;
> > +                }
> > +            } else {
> > +                s->baser[index] =  deposit64(s->baser[index], 0,
> > 32, value);
> > +            }
> > +        }
> > +        break;
> > +    case GITS_IIDR:
> > +    case GITS_TYPER:
> > +    case GITS_CREADR:
> > +        /* RO registers, ignore the write */
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +            "%s: invalid guest write to RO register at offset "
> > +            TARGET_FMT_plx "\n", __func__, offset);
> > +        break;
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> >      return result;
> >  }
> >  
> > @@ -134,7 +370,54 @@ static MemTxResult its_readl(GICv3ITSState *s,
> > hwaddr offset,
> >                                 uint64_t *data, MemTxAttrs attrs)
> >  {
> >      MemTxResult result = MEMTX_OK;
> > +    int index;
> >  
> > +    switch (offset) {
> > +    case GITS_CTLR:
> > +        *data = s->ctlr;
> > +        break;
> > +    case GITS_IIDR:
> > +        *data = s->iidr;
> > +        break;
> > +    case GITS_PIDR2:
> > +        *data = 0x30; /* GICv3 */
> > +        break;
> > +    case GITS_TYPER:
> > +        *data = extract64(s->typer, 0, 32);
> > +        break;
> > +    case GITS_TYPER + 4:
> > +        *data = extract64(s->typer, 32, 32);
> > +        break;
> > +    case GITS_CBASER:
> > +        *data = extract64(s->cbaser, 0, 32);
> > +        break;
> > +    case GITS_CBASER + 4:
> > +        *data = extract64(s->cbaser, 32, 32);
> > +        break;
> > +    case GITS_CREADR:
> > +        *data = extract64(s->creadr, 0, 32);
> > +        break;
> > +    case GITS_CREADR + 4:
> > +        *data = extract64(s->creadr, 32, 32);
> > +        break;
> > +    case GITS_CWRITER:
> > +        *data = extract64(s->cwriter, 0, 32);
> > +        break;
> > +    case GITS_CWRITER + 4:
> > +        *data = extract64(s->cwriter, 32, 32);
> > +        break;
> > +    case GITS_BASER ... GITS_BASER + 0x3f:
> > +        index = (offset - GITS_BASER) / 8;
> > +        if (offset & 7) {
> > +            *data = s->baser[index] >> 32;
> > +        } else {
> > +            *data = (uint32_t)s->baser[index];
> > +        }
> > +        break;
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> >      return result;
> >  }
> >  
> > @@ -142,7 +425,52 @@ static MemTxResult its_writell(GICv3ITSState
> > *s, hwaddr offset,
> >                                 uint64_t value, MemTxAttrs attrs)
> >  {
> >      MemTxResult result = MEMTX_OK;
> > +    int index;
> >  
> > +    switch (offset) {
> > +    case GITS_BASER ... GITS_BASER + 0x3f:
> > +        /* GITS_BASERn registers become RO if ITS is already
> > enabled */
> > +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> > +            index = (offset - GITS_BASER) / 8;
> > +            s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);
> > +            if (!extract_table_params(s, index)) {
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                        "%s: error extracting GITS_BASER
> > parameters "
> > +                        TARGET_FMT_plx "\n", __func__, offset);
> > +                s->baser[index] = 0;
> > +                result = MEMTX_ERROR;
> > +            }
> > +        }
> > +        break;
> > +    case GITS_CBASER:
> > +        /* GITS_CBASER register becomes RO if ITS is already
> > enabled */
> > +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> > +            s->cbaser = value;
> > +            if (!extract_cmdq_params(s)) {
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                       "%s: error extracting GITS_CBASER
> > parameters "
> > +                       TARGET_FMT_plx "\n", __func__, offset);
> 
> So are these all LOG_UNIMP or are they a programming failure on our
> part?
they are not LOG_UNIMP but error indications during processing which
could be due to invalid parameters passed from the driver
> 
> > +                s->cbaser = 0;
> > +                result = MEMTX_ERROR;
> > +            } else {
> > +                s->creadr = 0;
> > +            }
> > +        }
> > +        break;
> > +    case GITS_CWRITER:
> > +        s->cwriter = value;
> > +        break;
> > +    case GITS_TYPER:
> > +    case GITS_CREADR:
> > +        /* RO register, ignore the write */
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: invalid guest write to RO register at
> > offset "
> > +                      TARGET_FMT_plx "\n", __func__, offset);
> > +        break;
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> >      return result;
> >  }
> >  
> > @@ -150,7 +478,29 @@ static MemTxResult its_readll(GICv3ITSState
> > *s, hwaddr offset,
> >                                 uint64_t *data, MemTxAttrs attrs)
> >  {
> >      MemTxResult result = MEMTX_OK;
> > +    int index;
> >  
> > +    switch (offset) {
> > +    case GITS_TYPER:
> > +        *data = s->typer;
> > +        break;
> > +    case GITS_BASER ... GITS_BASER + 0x3f:
> > +        index = (offset - GITS_BASER) / 8;
> > +        *data = s->baser[index];
> > +        break;
> > +    case GITS_CBASER:
> > +        *data = s->cbaser;
> > +        break;
> > +    case GITS_CREADR:
> > +        *data = s->creadr;
> > +        break;
> > +    case GITS_CWRITER:
> > +        *data = s->cwriter;
> > +        break;
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> >      return result;
> >  }
> >  
> > @@ -250,6 +600,9 @@ static void gicv3_arm_its_realize(DeviceState
> > *dev, Error **errp)
> >      GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> >  
> >      gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > &gicv3_its_trans_ops);
> > +
> > +    address_space_init(&s->gicv3->sysmem_as, s->gicv3->sysmem,
> > +                        "gicv3-its-sysmem");
> >  }
> >  
> >  static void gicv3_its_reset(DeviceState *dev)
> > @@ -259,6 +612,9 @@ static void gicv3_its_reset(DeviceState *dev)
> >  
> >      if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> >          c->parent_reset(dev);
> > +        memset(&c->dt, 0 , sizeof(c->dt));
> > +        memset(&c->ct, 0 , sizeof(c->ct));
> > +        memset(&c->cq, 0 , sizeof(c->cq));
> >  
> >          /* set the ITS default features supported */
> >          s->typer = GITS_TYPER_PHYSICAL |
> > (GITS_TYPER_ITT_ENTRY_SIZE <<
> > diff --git a/include/hw/intc/arm_gicv3_common.h
> > b/include/hw/intc/arm_gicv3_common.h
> > index 91491a2f66..b0f2414fa3 100644
> > --- a/include/hw/intc/arm_gicv3_common.h
> > +++ b/include/hw/intc/arm_gicv3_common.h
> > @@ -226,12 +226,16 @@ struct GICv3State {
> >      int dev_fd; /* kvm device fd if backed by kvm vgic support */
> >      Error *migration_blocker;
> >  
> > +    MemoryRegion *sysmem;
> > +    AddressSpace sysmem_as;
> > +
> >      /* Distributor */
> >  
> >      /* for a GIC with the security extensions the NS banked
> > version of this
> >       * register is just an alias of bit 1 of the S banked version.
> >       */
> >      uint32_t gicd_ctlr;
> > +    uint32_t gicd_typer;
> >      uint32_t gicd_statusr[2];
> >      GIC_DECLARE_BITMAP(group);        /* GICD_IGROUPR */
> >      GIC_DECLARE_BITMAP(grpmod);       /* GICD_IGRPMODR */
> 
> 
