Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1918509lfg;
        Mon, 21 Jun 2021 03:34:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpO7RoYc+s39aMgyhEDJ3g+2tA4Gj82/l6VYD92rg9nszwDpYhCamZ1qwnXXuty8YEMRvS
X-Received: by 2002:ad4:5b85:: with SMTP id 5mr14824564qvp.15.1624271691499;
        Mon, 21 Jun 2021 03:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624271691; cv=none;
        d=google.com; s=arc-20160816;
        b=ulp+fRifHrfN7ayMo0tba9wA2n7w5/cMPNk2mUDfB3Bdo+IWefg/gCIggfrxZ6IzxN
         Ha1RY6FJY9J0T2EQAcfigRZ9FRzYDORou6na1s4S4lt9tQNxe9kF1oFo441pOVUvyAVJ
         q/0DYAf5lj+LrWAgJXjZdTT4V02LbAsDcUwvrER57hHOUYWmfzMVlT2GYc3orN12YcSm
         +F33kciIfGsswbDlBjKSfSL8gpRxdlP6/FOpSMzk5LH5eqf59/FYTd10HBSjZ9n/w2qI
         IhPiCVPiFvlXXPKiWOlijOi1d85cZNG+sVPIWv5jMZeUV6gXxtKzyqTpzESfksvOneDK
         FGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fpc7XJwQZoQD6qo0oATyAGnX5IK3AsjJRiGXlw+dypY=;
        b=bzxN42/81ixIHIkMuCIMPFb/9kwCQGwoDWKfQT0HpjyDRSxVvA/N3YVOYmeT79KXb3
         X2wHm0u4yScw7dxaAFd1jZnjqv4gBzITeUcKR1JsW3BpaJ2YO/IePFLUcPcDKPGxUQTx
         eUIriG3HtjGorLA8NA6ujBupQomrd3qVUAxs8mNvaAWVkDRueJYUyuDJyoJsmzDoSR83
         vzAC+fVK2ygfTyLq0tqqZ3PYYc5becwWp/x6/BXWvUcdLdMvvXYbGEkycLyGdTvX0qRR
         t9ODBXiUXMSU4sj9Cj1ZXlTMvQ6GCzNkhadw1k3FYd94mxtY5zfPCgKHA50CK486BBA6
         ouJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KufyKZUZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si10007873qkd.111.2021.06.21.03.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jun 2021 03:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KufyKZUZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvHGU-0000cW-Lk
	for alex.bennee@linaro.org; Mon, 21 Jun 2021 06:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lvGmP-0005r7-Er
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 06:03:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lvGmM-0001EE-FX
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 06:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fpc7XJwQZoQD6qo0oATyAGnX5IK3AsjJRiGXlw+dypY=;
 b=KufyKZUZi+JQw3SNVPqkb4f9Jlpk4nCNWTe3MuElsQUhzQD36RA/kFHKxp0gLCbffbTWM0
 6m4ZTnWKhFeG7RcV24sBnmEpvDY7/rQ//gw+fk5nDcTK24sT55NeYgdY3Cg8T56bjStzo+
 31Pyz23DiF4pbEnDHZ4s7SkxQjbnH/0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-bnX1fReSN5WABpS5QRodRg-1; Mon, 21 Jun 2021 06:03:40 -0400
X-MC-Unique: bnX1fReSN5WABpS5QRodRg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so1963193wms.8
 for <qemu-arm@nongnu.org>; Mon, 21 Jun 2021 03:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fpc7XJwQZoQD6qo0oATyAGnX5IK3AsjJRiGXlw+dypY=;
 b=gtQpd9ajxozogrW/98LMxN7alxZNiMBTpZN3MEDliyca5RWkorGiID20bqHc9tvt9t
 5ckWFFMFUoHXlIL1oW2fv6+gdVQ7l3tOsDRCS9yATDqdi/p0x98kfINoHNI3fp/VK7tf
 FVHr/CyOvfXTa1GdZXXgxnjGzuu+/d+Ic/fQlshEFZIp0ymV+UJ9ypdOx6DRAqsOiqr7
 SFKyhhsBvRmSPf5rcwYvcmah3VVg/Wt68fyxDBm7EOxnY8HvXH3fJ4lVq9x5+WU+pS+1
 EPdLvE0YIB9RlrBL4mkGA+kkFWXfiVkqJyQgZCTZxMC3PKelU/4FsxavFclV+4FL+MLj
 eV6A==
X-Gm-Message-State: AOAM533zPJRJRDzKIBkwKWtiuLaPDOleEkQOevQCiNw9VPPtVUDJNtLo
 TzSUsrhbvICrNht9mLotYAbanQze/twonSq68CcnOue+/DCLi8bmClfHLEZwqh2NJzuxwwi6ckx
 sSsjbc5K0IktI
X-Received: by 2002:a7b:ce8e:: with SMTP id q14mr11379217wmj.33.1624269819201; 
 Mon, 21 Jun 2021 03:03:39 -0700 (PDT)
X-Received: by 2002:a7b:ce8e:: with SMTP id q14mr11379178wmj.33.1624269818785; 
 Mon, 21 Jun 2021 03:03:38 -0700 (PDT)
Received: from [192.168.43.95] ([37.173.110.237])
 by smtp.gmail.com with ESMTPSA id p2sm5394711wro.16.2021.06.21.03.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 03:03:38 -0700 (PDT)
Subject: Re: [PATCH v4 3/8] hw/intc: GICv3 ITS command queue framework
To: shashi.mallela@linaro.org, peter.maydell@linaro.org, leif@nuviainc.com,
 rad@semihalf.com
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-4-shashi.mallela@linaro.org>
 <27cf428d-f22f-c336-2b6c-a2feca1103d7@redhat.com>
 <14fa559532fe2dde138b8c9b0688c7cdc5232e2c.camel@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <2d330011-16aa-9f2f-ac75-834dd63b25c5@redhat.com>
Date: Mon, 21 Jun 2021 12:03:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <14fa559532fe2dde138b8c9b0688c7cdc5232e2c.camel@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
X-TUID: SE2xx+bPY5j7



On 6/16/21 11:02 PM, shashi.mallela@linaro.org wrote:
> Hi Eric,
> 
> Please find my responses inline (below):-
> 
> On Sun, 2021-06-13 at 16:13 +0200, Eric Auger wrote:
>> Hi Sashi,
>>
>> On 6/2/21 8:00 PM, Shashi Mallela wrote:
>>> Added functionality to trigger ITS command queue processing on
>>> write to CWRITE register and process each command queue entry to
>>> identify the command type and handle commands like MAPD,MAPC,SYNC.
>>>
>>> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
>>> ---
>>>  hw/intc/arm_gicv3_its.c  | 295
>>> +++++++++++++++++++++++++++++++++++++++
>>>  hw/intc/gicv3_internal.h |  37 +++++
>>>  2 files changed, 332 insertions(+)
>>>
>>> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
>>> index af60f19c98..6551c577b3 100644
>>> --- a/hw/intc/arm_gicv3_its.c
>>> +++ b/hw/intc/arm_gicv3_its.c
>>> @@ -49,6 +49,295 @@ static uint64_t baser_base_addr(uint64_t value,
>>> uint32_t page_sz)
>>>      return result;
>>>  }
>>>  
>>> +static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid,
>>> bool valid,
>>> +                              uint64_t rdbase)
>>> +{
>>> +    AddressSpace *as = &s->gicv3->dma_as;
>>> +    uint64_t value;
>>> +    uint64_t l2t_addr;
>>> +    bool valid_l2t;
>>> +    uint32_t l2t_id;
>>> +    uint32_t max_l2_entries;
>>> +    uint64_t cte = 0;
>>> +    MemTxResult res = MEMTX_OK;
>>> +
>>> +    if (!s->ct.valid) {
>> Isn't it a guest log error case. Also you return MEMTX_OK in that
>> case.
>> Is that what you want?
> Yes,because the current implementation treats all command specific
> errors as "ignored" and moves onto next command in the queue.MEMTX
> return values are significant for dma read/write status and in case of
> error we stall the command processing 
OK
>>> +        return res;
>>> +    }
>>> +
>>> +    if (valid) {
>>> +        /* add mapping entry to collection table */
>>> +        cte = (valid & VALID_MASK) |
>>> +              ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL);
>> Do you really need to sanitize rdbase again?
> Not required,have rectified it.
>>> +    }
>>> +
>>> +    /*
>>> +     * The specification defines the format of level 1 entries of
>>> a
>>> +     * 2-level table, but the format of level 2 entries and the
>>> format
>>> +     * of flat-mapped tables is IMPDEF.
>>> +     */
>>> +    if (s->ct.indirect) {
>>> +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
>>> +
>>> +        value = address_space_ldq_le(as,
>>> +                                     s->ct.base_addr +
>>> +                                     (l2t_id *
>>> L1TABLE_ENTRY_SIZE),
>>> +                                     MEMTXATTRS_UNSPECIFIED,
>>> &res);
>>> +
>>> +        if (res != MEMTX_OK) {
>>> +            return res;
>>> +        }
>>> +
>>> +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
>>> +
>>> +        if (valid_l2t) {
>>> +            max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
>>> +
>>> +            l2t_addr = value & ((1ULL << 51) - 1);
>>> +
>>> +            address_space_stq_le(as, l2t_addr +
>>> +                                 ((icid % max_l2_entries) *
>>> GITS_CTE_SIZE),
>>> +                                 cte, MEMTXATTRS_UNSPECIFIED,
>>> &res);
>>> +        }
>>> +    } else {
>>> +        /* Flat level table */
>>> +        address_space_stq_le(as, s->ct.base_addr + (icid *
>>> GITS_CTE_SIZE),
>>> +                             cte, MEMTXATTRS_UNSPECIFIED, &res);
>>> +    }
>>> +    return res;
>>> +}
>>> +
>>> +static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
>>> +{
>>> +    AddressSpace *as = &s->gicv3->dma_as;
>>> +    uint16_t icid;
>>> +    uint64_t rdbase;
>>> +    bool valid;
>>> +    MemTxResult res = MEMTX_OK;
>>> +    uint64_t value;
>>> +
>>> +    offset += NUM_BYTES_IN_DW;
>>> +    offset += NUM_BYTES_IN_DW;
>> May be relevant to add some trace points for debuggability.
> Probably the trace functionality for ITS can be taken up as a seperate
> task/feature TODO.
Yes of course. It may just be useful for you as well to debug ;-)
>>> +
>>> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
>>> +                                 MEMTXATTRS_UNSPECIFIED, &res);
>>> +
>>> +    if (res != MEMTX_OK) {
>>> +        return res;
>>> +    }
>>> +
>>> +    icid = value & ICID_MASK;
>>> +
>>> +    rdbase = (value >> R_MAPC_RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
>> usually the mask is applied before the shift.
> Here we are extracting only 16 bit rdbase(processor number) value by
> masking with RDBASE_PROCNUM_MASK only after we have right shifted the
> rdbase offset from the 64 bit DW value.
> As an alternative,I could have used rdbase = (value &
> R_MAPC_RDBASE_MASK) to first extract the 32 bits rdbase value from DW
> and then later mask again with RDBASE_PROCNUM_MASK to narrow it down to
> 16 bit rdbase(processor number).
My comment rather was about the fact that generally the mask applied to
the shifted location and then you shift the masked field. I notived
Peter also made this comment in 4/8 (FIELD macro). You tend to use the
same pattern in different places in your series.
>>> +
>>> +    valid = (value >> VALID_SHIFT) & VALID_MASK;
>> use FIELD, see below
>>> +
>>> +    if ((icid > s->ct.max_collids) || (rdbase > s->gicv3-
>>>> num_cpu)) {
>> you also need to check against ITS_CIDBITS limit?
> CIDBITS limits is being checked through the s->ct.max_collids member
> above
Ah OK
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "ITS MAPC: invalid collection table
>>> attributes "
>>> +                      "icid %d rdbase %lu\n",  icid, rdbase);
>>> +        /*
>>> +         * in this implementation,in case of error
>>> +         * we ignore this command and move onto the next
>>> +         * command in the queue
>> spec says a command error occurs in that case.
> Yes,we chose to ignore the  error'ed command and move onto the next one
> in the queue as per command error options in the spec
>>> +         */
>>> +    } else {
>>> +        res = update_cte(s, icid, valid, rdbase);
>>> +    }
>>> +
>>> +    return res;
>>> +}
>>> +
>>> +static MemTxResult update_dte(GICv3ITSState *s, uint32_t devid,
>>> bool valid,
>>> +                              uint8_t size, uint64_t itt_addr)
>>> +{
>>> +    AddressSpace *as = &s->gicv3->dma_as;
>>> +    uint64_t value;
>>> +    uint64_t l2t_addr;
>>> +    bool valid_l2t;
>>> +    uint32_t l2t_id;
>>> +    uint32_t max_l2_entries;
>>> +    uint64_t dte = 0;
>>> +    MemTxResult res = MEMTX_OK;
>>> +
>>> +    if (s->dt.valid) {
>>> +        if (valid) {
>>> +            /* add mapping entry to device table */
>>> +            dte = (valid & VALID_MASK) |
>>> +                  ((size & SIZE_MASK) << 1U) |
>>> +                  ((itt_addr & ITTADDR_MASK) << 6ULL);
>>> +        }
>>> +    } else {
>>> +        return res;
>>> +    }
>>> +
>>> +    /*
>>> +     * The specification defines the format of level 1 entries of
>>> a
>>> +     * 2-level table, but the format of level 2 entries and the
>>> format
>>> +     * of flat-mapped tables is IMPDEF.
>>> +     */
>>> +    if (s->dt.indirect) {
>>> +        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
>>> +
>>> +        value = address_space_ldq_le(as,
>>> +                                     s->dt.base_addr +
>>> +                                     (l2t_id *
>>> L1TABLE_ENTRY_SIZE),
>>> +                                     MEMTXATTRS_UNSPECIFIED,
>>> &res);
>>> +
>>> +        if (res != MEMTX_OK) {
>>> +            return res;
>>> +        }
>>> +
>>> +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
>>> +
>>> +        if (valid_l2t) {
>>> +            max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
>>> +
>>> +            l2t_addr = value & ((1ULL << 51) - 1);
>>> +
>>> +            address_space_stq_le(as, l2t_addr +
>>> +                                 ((devid % max_l2_entries) *
>>> GITS_DTE_SIZE),
>>> +                                 dte, MEMTXATTRS_UNSPECIFIED,
>>> &res);
>>> +        }
>>> +    } else {
>>> +        /* Flat level table */
>>> +        address_space_stq_le(as, s->dt.base_addr + (devid *
>>> GITS_DTE_SIZE),
>>> +                             dte, MEMTXATTRS_UNSPECIFIED, &res);
>>> +    }
>>> +    return res;
>>> +}
>>> +
>>> +static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
>> you do not seem to use the input value, remove it?
> yes we are using the input value,which is the 1st DW from the command
> to extract the deviceid (devid) field below
Hum my mistake sorry.
>>> +                                uint32_t offset)
>>> +{
>>> +    AddressSpace *as = &s->gicv3->dma_as;
>>> +    uint32_t devid;
>>> +    uint8_t size;
>>> +    uint64_t itt_addr;
>>> +    bool valid;
>>> +    MemTxResult res = MEMTX_OK;
>>> +
>>> +    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
>>> +
>>> +    offset += NUM_BYTES_IN_DW;
>>> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
>>> +                                 MEMTXATTRS_UNSPECIFIED, &res);
>>> +
>>> +    if (res != MEMTX_OK) {
>>> +        return res;
>>> +    }
>>> +
>>> +    size = (value & SIZE_MASK);
>>> +
>>> +    offset += NUM_BYTES_IN_DW;
>>> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
>>> +                                 MEMTXATTRS_UNSPECIFIED, &res);
>>> +
>>> +    if (res != MEMTX_OK) {
>>> +        return res;
>>> +    }
>>> +
>>> +    itt_addr = (value >> ITTADDR_SHIFT) & ITTADDR_MASK;
>> this looks weird to me, usually we apply the mask first and then
>> shift.
> from the 64 bit DW,we right shift (by 8)to align the itt_addr at 0th
> position and extract 44 bits(0 to 43) using the mask 
ditto
>>> +
>>> +    valid = (value >> VALID_SHIFT) & VALID_MASK;
>> use FIELD_EX64()?
>>> +
>>> +    if ((devid > s->dt.max_devids) ||
>>> +        (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
>> ITS_IDBITS?
> IDBITS is one of the fields in GITS_TYPER and the field naming is
> consistent with the spec definition
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "ITS MAPD: invalid device table attributes "
>>> +                      "devid %d or size %d\n", devid, size);
>>> +        /*
>>> +         * in this implementation, in case of error
>>> +         * we ignore this command and move onto the next
>>> +         * command in the queue
>>> +         */
>>> +    } else {
>>> +        res = update_dte(s, devid, valid, size, itt_addr);
>>> +    }
>>> +
>>> +    return res;
>>> +}
>>> +
>>> +/*
>>> + * Current implementation blocks until all
>>> + * commands are processed
>>> + */
>>> +static void process_cmdq(GICv3ITSState *s)
>>> +{> +    uint32_t wr_offset = 0;
>>> +    uint32_t rd_offset = 0;
>>> +    uint32_t cq_offset = 0;
>>> +    uint64_t data;
>>> +    AddressSpace *as = &s->gicv3->dma_as;
>>> +    MemTxResult res = MEMTX_OK;
>>> +    uint8_t cmd;
>>> +
>>> +    if (!(s->ctlr & ITS_CTLR_ENABLED)) {
>>> +        return;
>>> +    }
>>> +
>>> +    wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
>>> +
>>> +    if (wr_offset > s->cq.max_entries) {
>> Shouldn't this be checked on cwrite write instead?
> Yes we are checking within the cwriter write scope,just that the check
> is happening through this function (called during cwrite write)
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "%s: invalid write offset "
>>> +                      "%d\n", __func__, wr_offset);
>>> +        return;
>>> +    }
>>> +
>>> +    rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
>>> +
>>> +    while (wr_offset != rd_offset) {
>>> +        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
>>> +        data = address_space_ldq_le(as, s->cq.base_addr +
>>> cq_offset,
>>> +                                    MEMTXATTRS_UNSPECIFIED, &res);
>>> +        cmd = (data & CMD_MASK);
>>> +
>>> +        switch (cmd) {
>>> +        case GITS_CMD_INT:
>>> +            break;
>>> +        case GITS_CMD_CLEAR:
>>> +            break;
>>> +        case GITS_CMD_SYNC:
>>> +            /*
>>> +             * Current implementation makes a blocking synchronous
>>> call
>>> +             * for every command issued earlier, hence the
>>> internal state
>>> +             * is already consistent by the time SYNC command is
>>> executed.
>>> +             * Hence no further processing is required for SYNC
>>> command.
>>> +             */
>>> +            break;
>>> +        case GITS_CMD_MAPD:
>>> +            res = process_mapd(s, data, cq_offset);
>>> +            break;
>>> +        case GITS_CMD_MAPC:
>>> +            res = process_mapc(s, cq_offset);
>>> +            break;
>>> +        case GITS_CMD_MAPTI:
>>> +            break;
>>> +        case GITS_CMD_MAPI:
>>> +            break;
>>> +        case GITS_CMD_DISCARD:
>>> +            break;
>>> +        default:
>>> +            break;
>>> +        }
>>> +        if (res == MEMTX_OK) {
>>> +            rd_offset++;
>>> +            rd_offset %= s->cq.max_entries;
>>> +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET,
>>> rd_offset);
>>> +        } else {
>>> +            /*
>>> +             * in this implementation,in case of dma read/write
>>> error
>>> +             * we stall the command processing
>>> +             */
>>> +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR,
>>> STALLED, 1);
>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>> +                          "%s: %x cmd processing failed!!\n",
>>> __func__, cmd);
>>> +            break;
>>> +        }
>>> +    }
>>> +}
>>> +
>>>  static void extract_table_params(GICv3ITSState *s)
>>>  {
>>>      uint16_t num_pages = 0;
>>> @@ -226,6 +515,9 @@ static MemTxResult its_writel(GICv3ITSState *s,
>>> hwaddr offset,
>>>      case GITS_CWRITER:
>>>          s->cwriter = deposit64(s->cwriter, 0, 32,
>>>                                 (value &
>>> ~R_GITS_CWRITER_RETRY_MASK));
>>> +        if (s->cwriter != s->creadr) {
>>> +            process_cmdq(s);
>> I would expect process_cmdq() to be called as well on ITS enable
> Done
>>> +        }
>>>          break;
>>>      case GITS_CWRITER + 4:
>>>          s->cwriter = deposit64(s->cwriter, 32, 32,
>>> @@ -346,6 +638,9 @@ static MemTxResult its_writell(GICv3ITSState
>>> *s, hwaddr offset,
>>>          break;
>>>      case GITS_CWRITER:
>>>          s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
>>> +        if (s->cwriter != s->creadr) {
>>> +            process_cmdq(s);
>>> +        }
>>>          break;
>>>      case GITS_CREADR:
>>>      case GITS_TYPER:
>>> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
>>> index d6aaa94e4c..0932a30560 100644
>>> --- a/hw/intc/gicv3_internal.h
>>> +++ b/hw/intc/gicv3_internal.h
>>> @@ -253,6 +253,9 @@ FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
>>>  FIELD(GITS_CBASER, INNERCACHE, 59, 3)
>>>  FIELD(GITS_CBASER, VALID, 63, 1)
>>>  
>>> +FIELD(GITS_CREADR, STALLED, 0, 1)
>>> +FIELD(GITS_CREADR, OFFSET, 5, 15)
>>> +
>>>  FIELD(GITS_CWRITER, RETRY, 0, 1)
>>>  FIELD(GITS_CWRITER, OFFSET, 5, 15)
>>>  
>>> @@ -289,6 +292,40 @@ FIELD(GITS_TYPER, CIL, 36, 1)
>>>  #define L1TABLE_ENTRY_SIZE         8
>>>  
>>>  #define GITS_CMDQ_ENTRY_SIZE               32
>>> +#define NUM_BYTES_IN_DW                     8
>>> +
>>> +#define CMD_MASK                  0xff
>>> +
>>> +/* ITS Commands */
>>> +#define GITS_CMD_CLEAR            0x04
>>> +#define GITS_CMD_DISCARD          0x0F
>>> +#define GITS_CMD_INT              0x03
>>> +#define GITS_CMD_MAPC             0x09
>>> +#define GITS_CMD_MAPD             0x08
>>> +#define GITS_CMD_MAPI             0x0B
>>> +#define GITS_CMD_MAPTI            0x0A
>>> +#define GITS_CMD_SYNC             0x05
>>> +
>>> +/* MAPC command fields */
>>> +#define ICID_LENGTH                  16
>>> +#define ICID_MASK                 ((1U << ICID_LENGTH) - 1)
>> can't you use FIELD') as well for the ICID?
> in addition to MAPC command ICID is a common field for MAPTI,MAPI
> commands as well,hence wanted to keep it common and seperate
>>> +FIELD(MAPC, RDBASE, 16, 32)
>>> +
>>> +#define RDBASE_PROCNUM_LENGTH        16
>>> +#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LENGTH)
>>> - 1)
>> why do we have both the RDBASE FIELD def and above defs?
> RDBASE FIELD def points to the rdbase field within the MAPC
> command,while the RDBASE_PROCNUM_ defines are used to consider 16 bit
> PE number as the target destination instead of redistributor base
> address option.
>>> +
>>> +#define DEVID_SHIFT                  32
>>> +#define DEVID_LENGTH                 32
>>> +#define DEVID_MASK                ((1ULL << DEVID_LENGTH) - 1)
>> we don't have any DEVID field in MAPC, I guess it belongs to MAPD?
> MAPC doesnt have a DEVID field ,but it is a common field in
> MAPD,INT,MAPI,MAPTI commands(at the same offset)
Yes but above there is a command saying "MAPC command fields */
>>> +
>>> +/* MAPD command fields */
>>> +#define ITTADDR_LENGTH               44
>>> +#define ITTADDR_SHIFT                 8
>>> +#define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
>>> +#define SIZE_MASK                 0x1f
>> Can't you homogenize the definition, use field() and/or prefix with
>> the
>> cmd name when not common to severals cmds?
> Since ITTADDR_MASK is common to both MAPD command as well as device
> table entry field,didnt want to go with field() as the MAPD tag-name in
> device table entry would be insignificant
>>
>>> +
>>> +#define VALID_SHIFT               63
>>> +#define VALID_MASK                1ULL
>>>  
>>>  /**
>>>   * Default features advertised by this version of ITS
>>>
>> Thanks
>>
>> Eric
>>
> 
> 
> 
> 
Thanks

Eric

