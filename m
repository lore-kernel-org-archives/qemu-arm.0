Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4710925lfm;
        Tue, 25 May 2021 10:58:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQZpKnWOkmHo/rv31VTb0Uu7RdzFKUjGspnSUWhbm8nJ70/9grZ0ki8x9t9AORAkgzhQ79
X-Received: by 2002:a05:6e02:1348:: with SMTP id k8mr22589293ilr.104.1621965487611;
        Tue, 25 May 2021 10:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621965487; cv=none;
        d=google.com; s=arc-20160816;
        b=nfixky9GS8wCYZoy479Xn6yhI79Wy0rGHhHeI7lXS5oXX4P5aI9PXhbcZhwJE0+yvm
         iAoJgrti21N6T/otNtOqZLnCYFN0OZtsCu0WjLVR51/GG9tW4jVAlpM1vSXxQ8cnyxOe
         c4AlUB/bY/C43w5lIg4IJh7NZZvtdcdTAblv4VGAhwvet/wpF0WwqnQN8vKoxGa3Gf1h
         7/uvRhk9jHkvT7c121Jy36WE9eE2qSKprTJ5EThFrEXR8uwnQb4lCCjBzHp+ZWq4/S4r
         JY5TMe/+GQxuAb1FwR2VPR5rVqgZLqIApEuhVg+uEbzY5GIRu91PD95uVkj0E8h722cb
         5+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=SiGjnpegGkxpMlNbdVdZf+CUQfgRWri4yXBEp4clGQ0=;
        b=a3tS7hyGk29b64iwxJ9qs4P5lwSj3KeHdTC3tkNsaBee2k9DiK5my3gL8b8zWvmTKI
         wvFlh96REka/vRmNDnzyb+Qy94L9u5Yw8Vz2h3135V6kQySWLwi4lHUROmdQorVDb1pA
         1bJ56w/1IsDFgRf/vMbn8hCeRH9xJkFHQTUx6lq5787oNgsL/AeEZt6pP78nuV8cSKak
         zYrhqmcVsF5PmuiRBheWvNSD8FKDQtiGZmqiMLz4tWtL9ZrYVkF0cxPmSTpS/oGrDQv9
         WhdCiBsspOr349cRIoX2PpR/DXx+WwV6jmdp+nxZOyJJ2ts+zyUW6KSFW4Sut3cX99zl
         O3OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RdsRZo9y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si18022008jak.119.2021.05.25.10.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 10:58:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RdsRZo9y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llbJe-0000Qa-PA
	for alex.bennee@linaro.org; Tue, 25 May 2021 13:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1llbJW-0000QI-Le
 for qemu-arm@nongnu.org; Tue, 25 May 2021 13:57:58 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:41621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1llbJU-0004By-EM
 for qemu-arm@nongnu.org; Tue, 25 May 2021 13:57:58 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id ee9so16468073qvb.8
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiGjnpegGkxpMlNbdVdZf+CUQfgRWri4yXBEp4clGQ0=;
 b=RdsRZo9y/CX4PIgoZM2RAncl28KTEZ90faq7jMEA5vLVaLvD8xe1DVSmFaRS3p7pd4
 4SmOAkWj8PPF7ZrmPywurk38PECCUH9UsCv3obpdaq+/fvgsrCEB9mZNEwUyXkJxuPS2
 TgCN4HjxjE/YxpQRgOpnPHNsn6mgKZuKjwoY2bAHDTIxX9y6qOxxYFNQmmUFzYr07wNr
 z9oG+3+tC7B+jMdOQK2oLOkqKM4Rt6/t/0qw4uIILVPSfcQMzpqKJdj0HEqyPDMPKxAY
 +eR94bHfTz+cdhAyf4eqj6Vgj6ZHSqIoU0DWrBXqGmC9bH0nZLGcbjcBYTT1QU45RiQo
 DNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SiGjnpegGkxpMlNbdVdZf+CUQfgRWri4yXBEp4clGQ0=;
 b=XJS2RPQqZpz4iAQIGdmjX+2D1/RRnyWwDE/TLV9txfLSyP81bbmzZqjKbiBrs9sF5q
 iB34AJGM0hZ8m6F3NCmFC4KPNZyLv+PLZsIbjqfvHP5RYmLc2ZIyvHK+3+k9qIx/pwRN
 bAniIPFDzzZKICNT8uI5NCfcmP5VENx4j8ji6JtYJbqyRLycq95UBjlgRedyCDNTlnus
 FrG09YI80NQ8NHaqintVebtjNlTFxuls6t6o0HsBEIRkmLtgjoieTqlP+kXl8eOyMZr0
 eNhQyR5cYG5ruIfyvhNu/DZX6EMFf3VjzE90ZDRHCTmAIyUW9v3hedXT6B4kWlWCDH0t
 yn8A==
X-Gm-Message-State: AOAM530BS2KNW50opmCYys5WwBvsLp6pA1T5Q1PrD73CoDZPOB7if2ty
 mhtkR53G3xa0CcYDn7uCJNIUyQ==
X-Received: by 2002:a0c:f005:: with SMTP id z5mr38870831qvk.33.1621965474735; 
 Tue, 25 May 2021 10:57:54 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id f8sm11920545qko.131.2021.05.25.10.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 10:57:54 -0700 (PDT)
Message-ID: <1bbe9566f2c0549e82b229517634e3e7a6c80be7.camel@linaro.org>
Subject: Re: [PATCH v3 4/8] hw/intc: GICv3 ITS Command processing
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 13:57:53 -0400
In-Reply-To: <CAFEAcA8U_ByhVKFp9Y8+DEy9=eZrf+x86uANkW-=pnDjXWfq_g@mail.gmail.com>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-5-shashi.mallela@linaro.org>
 <CAFEAcA8U_ByhVKFp9Y8+DEy9=eZrf+x86uANkW-=pnDjXWfq_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2c.google.com
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
X-TUID: 8q+cnIE8P1u3

Have taken care of all comments ,except one with my inline response

On Tue, 2021-05-18 at 16:49 +0100, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Added ITS command queue handling for MAPTI,MAPI commands,handled
> > ITS
> > translation which triggers an LPI via INT command as well as write
> > to GITS_TRANSLATER register,defined enum to differentiate between
> > ITS
> > command interrupt trigger and GITS_TRANSLATER based interrupt
> > trigger.
> > Each of these commands make use of other functionalities
> > implemented to
> > get device table entry,collection table entry or interrupt
> > translation
> > table entry required for their processing.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_its.c            | 346
> > ++++++++++++++++++++++++++++-
> >  hw/intc/gicv3_internal.h           |  12 +
> >  include/hw/intc/arm_gicv3_common.h |   2 +
> >  3 files changed, 359 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 7cb465813a..98c984dd22 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -28,6 +28,156 @@ struct GICv3ITSClass {
> >      void (*parent_reset)(DeviceState *dev);
> >  };
> > 
> > +typedef enum ItsCmdType {
> > +    NONE = 0, /* internal indication for GITS_TRANSLATER write */
> > +    CLEAR = 1,
> > +    DISCARD = 2,
> > +    INT = 3,
> > +} ItsCmdType;
> > +
> > +static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t
> > *cte,
> > +    MemTxResult *res)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t l2t_addr;
> > +    uint64_t value;
> > +    bool valid_l2t;
> > +    uint32_t l2t_id;
> > +    uint32_t max_l2_entries;
> > +    bool status = false;
> > +
> > +    if (s->ct.indirect) {
> > +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> > +
> > +        value = address_space_ldq_le(as,
> > +                                     s->ct.base_addr +
> > +                                     (l2t_id *
> > L1TABLE_ENTRY_SIZE),
> > +                                     MEMTXATTRS_UNSPECIFIED, res);
> > +
> > +        if (*res == MEMTX_OK) {
> > +            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > +
> > +            if (valid_l2t) {
> > +                max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
> > +
> > +                l2t_addr = value & ((1ULL << 51) - 1);
> > +
> > +                *cte =  address_space_ldq_le(as, l2t_addr +
> > +                                    ((icid % max_l2_entries) *
> > GITS_CTE_SIZE),
> > +                                    MEMTXATTRS_UNSPECIFIED, res);
> > +           }
> > +       }
> > +    } else {
> > +        /* Flat level table */
> > +        *cte =  address_space_ldq_le(as, s->ct.base_addr +
> > +                                     (icid * GITS_CTE_SIZE),
> > +                                      MEMTXATTRS_UNSPECIFIED,
> > res);
> > +    }
> > +
> > +    if (*cte & VALID_MASK) {
> > +        status = true;
> > +    }
> > +
> > +    return status;
> > +}
> > +
> > +static MemTxResult update_ite(GICv3ITSState *s, uint32_t eventid,
> > uint64_t dte,
> > +    uint64_t itel, uint32_t iteh)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t itt_addr;
> > +    MemTxResult res = MEMTX_OK;
> > +
> > +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> > +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> > +
> > +    address_space_stq_le(as, itt_addr + (eventid *
> > sizeof(uint64_t)),
> > +                         itel, MEMTXATTRS_UNSPECIFIED, &res);
> > +
> > +    if (res == MEMTX_OK) {
> > +        address_space_stl_le(as, itt_addr + ((eventid +
> > sizeof(uint64_t)) *
> > +                             sizeof(uint32_t)), iteh,
> > MEMTXATTRS_UNSPECIFIED,
> > +                             &res);
> > +    }
> > +   return res;
> > +}
> > +
> > +static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t
> > dte,
> > +                      uint16_t *icid, uint32_t *pIntid,
> > MemTxResult *res)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t itt_addr;
> > +    bool status = false;
> > +    uint64_t itel = 0;
> > +    uint32_t iteh = 0;
> > +
> > +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> > +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> > +
> > +    itel = address_space_ldq_le(as, itt_addr + (eventid *
> > sizeof(uint64_t)),
> > +                                MEMTXATTRS_UNSPECIFIED, res);
> > +
> > +    if (*res == MEMTX_OK) {
> > +        iteh = address_space_ldl_le(as, itt_addr + ((eventid +
> > +                                    sizeof(uint64_t)) *
> > sizeof(uint32_t)),
> > +                                    MEMTXATTRS_UNSPECIFIED, res);
> > +
> > +        if (*res == MEMTX_OK) {
> > +            if (itel & VALID_MASK) {
> > +                if ((itel >> ITE_ENTRY_INTTYPE_SHIFT) &
> > GITS_TYPE_PHYSICAL) {
> > +                    *pIntid = (itel >> ITE_ENTRY_INTID_SHIFT) &
> > +                              ITE_ENTRY_INTID_MASK;
> > +                    *icid = iteh & ITE_ENTRY_ICID_MASK;
> > +                    status = true;
> > +                }
> > +            }
> > +        }
> > +    }
> > +    return status;
> > +}
> > +
> > +static uint64_t get_dte(GICv3ITSState *s, uint32_t devid,
> > MemTxResult *res)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint64_t l2t_addr;
> > +    uint64_t value;
> > +    bool valid_l2t;
> > +    uint32_t l2t_id;
> > +    uint32_t max_l2_entries;
> > +
> > +    if (s->dt.indirect) {
> > +        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
> > +
> > +        value = address_space_ldq_le(as,
> > +                                     s->dt.base_addr +
> > +                                     (l2t_id *
> > L1TABLE_ENTRY_SIZE),
> > +                                     MEMTXATTRS_UNSPECIFIED, res);
> > +
> > +        if (*res == MEMTX_OK) {
> > +            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > +
> > +            if (valid_l2t) {
> > +                max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
> > +
> > +                l2t_addr = value & ((1ULL << 51) - 1);
> > +
> > +                value = 0;
> 
> This assignment is pointless because we assign again to value
> immediately
> afterwards.
> 
> > +                value =  address_space_ldq_le(as, l2t_addr +
> > +                                   ((devid % max_l2_entries) *
> > GITS_DTE_SIZE),
> > +                                   MEMTXATTRS_UNSPECIFIED, res);
> > +            }
> > +        }
> > +    } else {
> > +        /* Flat level table */
> > +        value = 0;
> 
> Ditto.
> 
> > +        value = address_space_ldq_le(as, s->dt.base_addr +
> > +                                           (devid *
> > GITS_DTE_SIZE),
> > +                                    MEMTXATTRS_UNSPECIFIED, res);
> > +    }
> > +
> > +    return value;
> > +}
> > +
> >  static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
> >  {
> >      AddressSpace *as = &s->gicv3->dma_as;
> > @@ -55,6 +205,182 @@ static MemTxResult process_sync(GICv3ITSState
> > *s, uint32_t offset)
> >      return res;
> >  }
> > 
> > +static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
> > +                                uint32_t offset, ItsCmdType cmd)
> > +{
> > +    AddressSpace *as = &s->gicv3->dma_as;
> > +    uint32_t devid, eventid;
> > +    MemTxResult res = MEMTX_OK;
> > +    bool dte_valid;
> > +    uint64_t dte = 0;
> > +    uint32_t max_eventid;
> > +    uint16_t icid = 0;
> > +    uint32_t pIntid = 0;
> > +    bool ite_valid = false;
> > +    uint64_t cte = 0;
> > +    bool cte_valid = false;
> > +    uint64_t itel = 0;
> > +    uint32_t iteh = 0;
> > +
> > +    if (cmd == NONE) {
> > +        devid = offset;
> > +    } else {
> > +        devid = (value >> DEVID_SHIFT) & DEVID_MASK;
> > +
> > +        offset += NUM_BYTES_IN_DW;
> > +        value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > +    }
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +
> > +    eventid = (value & EVENTID_MASK);
> > +
> > +    dte = get_dte(s, devid, &res);
> > +
> > +    if (res != MEMTX_OK) {
> > +        return res;
> > +    }
> > +    dte_valid = dte & VALID_MASK;
> > +
> > +    if (dte_valid) {
> > +        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
> > +
> > +        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid,
> > &res);
> > +
> > +        if (res != MEMTX_OK) {
> > +            return res;
> > +        }
> > +
> > +        if (ite_valid) {
> > +            cte_valid = get_cte(s, icid, &cte, &res);
> > +        }
> > +
> > +        if (res != MEMTX_OK) {
> > +            return res;
> > +        }
> > +    }
> > +
> > +    if ((devid > s->dt.max_devids) || !dte_valid || !ite_valid ||
> > +            !cte_valid || (eventid > max_eventid)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +            "%s: invalid interrupt translation table attributes "
> > +            "devid %d or eventid %d\n",
> > +            __func__, devid, eventid);
> > +        /*
> > +         * in this implementation,in case of error
> > +         * we ignore this command and move onto the next
> > +         * command in the queue
> > +         */
> 
> ...but we could just return an error from this function and
> get the 'stall' behaviour. It would be more consistent to just
> stall for everything, if we're going to be stalling for various
> kinds of "failed to read memory" anyway. (Same for some instances
> of this in the previous patches.)
>
> The intent here was to chose the spec defined options to 'ignore and
> move on' for all ITS command specific errors but differentiate system
> errors like mem read/write with 'implementation defined' STALL.
>
> 
> > +    } else {
> > +        /*
> > +         * Current implementation only supports rdbase == procnum
> > +         * Hence rdbase physical address is ignored
> > +         */
> > +        if (cmd == DISCARD) {
> > +            /* remove mapping from interrupt translation table */
> > +            res = update_ite(s, eventid, dte, itel, iteh);
> > +        }
> > +    }
> > +
> > +    if (cmd != NONE) {
> > +        offset += NUM_BYTES_IN_DW;
> > +        offset += NUM_BYTES_IN_DW;
> 
> More dead increments.
> 
> > +    }
> > +
> > +    return res;
> > +}
> > +
> 
> -- PMM

