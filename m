Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2024163lfk;
        Tue, 6 Jul 2021 03:39:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc23tQWJUkfctd4Ce3mjEkfOZ4S6dT/8zAVaumdY1T+rk2l0CKNCJlD4Jxoa711OlzNNyN
X-Received: by 2002:a05:622a:11cd:: with SMTP id n13mr16820311qtk.233.1625567945446;
        Tue, 06 Jul 2021 03:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625567945; cv=none;
        d=google.com; s=arc-20160816;
        b=ipJZZWKTKAQUwngW9PbKryKyxR+3xIa7Y9dxg+WuCq/qMWQobSeyz9Kkbs+SFbzRGs
         2nSnOqV4BQfWrjj3HxoJbspC80J+Q1uIDmuaUzuP4dF8e7J9LZIwlpz7J0IoMzBa5ZK0
         ttvKZD/h5bfuOFkjafDvoEy706qNhjxI2Y9gyl8cJXIt0TGZn0rRNx7lrXkhS8R4UbAb
         1pjbatIIv2bDGIkQaTB+i3PWYOfNd1YVevFVmgwTYkZ5q0eusycXWe1lnmkT3ILmjNVb
         E936Lw43qoCWDJV26xU4lGVhQiPqoL+D5eUFqrUYkMcmwqKJtjGLzcikDdJ35txvQW+q
         c+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=f0ohermNdZzygDE4YZ1r5oNj4rUQC5HuIguUtm+IXSY=;
        b=cTmd+CqZKD1R9YDVDnwxu2CBT5KqIAlrpMIO5lrnhToceSsrxWpePuyJC8dJSmOavx
         6sQlkOlwW8e16FfjtwVepjdYww8YSH4fKBTl6Gl653+VpcyXVSSE9zZPx63i2PmVSVSB
         0k2ctZAhfBcfNOJKIuWX+dm8r0QoDve7N64Xcmqt2IquIwOJCEzkh9ci1IRpNEHApOsp
         7ry7MdL63CktC4GrLOCYyBPmxmiGwUEd+cb1qXvfAYmp49xcBGDjK81q034i2HBVQFfp
         t5KBjOJsIMNlUNxGkrJTI6nUGNaVFzRhwZuiJb3UctYiH9GuPBsDt+/Jy++GBjXzF5An
         +NAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3GmPZC5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk7si12129915qvb.86.2021.07.06.03.39.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 03:39:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3GmPZC5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0iTo-0005b0-LW
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 06:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m0hxa-0000dQ-GB
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 06:05:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m0hxX-0004QY-BO
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 06:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0ohermNdZzygDE4YZ1r5oNj4rUQC5HuIguUtm+IXSY=;
 b=X3GmPZC5Cs9zapi9UDPtETkSQ4KSeJv2d/Do7LLc+uu+zql7RDj7uRziLUKkT/X4JO4R5p
 E7Wea8DGFE0Z5ez/cDLDw0ZPuIzwgGGYiRbkxydQfHFHVyO/Yd1+EodB6JBP23gq60JvPY
 RapBrBoy3wGe6EtQbBHPOTbL3uE1oAE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-_BP85hS7PH-pktIynqgpKw-1; Tue, 06 Jul 2021 06:05:41 -0400
X-MC-Unique: _BP85hS7PH-pktIynqgpKw-1
Received: by mail-wr1-f72.google.com with SMTP id
 l12-20020a5d410c0000b029012b4f055c9bso6751399wrp.4
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 03:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f0ohermNdZzygDE4YZ1r5oNj4rUQC5HuIguUtm+IXSY=;
 b=PBAzkNN/B3KfoeGmYb1KaacbEABlaL0c0SjVCQlRj1EMZVjMnNdGZ3qHtfr3RLkSJY
 C8gQQDyjTw7z2UQgOJtXMH3B+a/3O3uYtVNtpn5M75tGCOXgebUL03SiBl48IjLHoIcj
 ciZk7Mys6gxHAM4SRAbZl2efi5f0XC4gn8LIPxgWtA5q/1EE4wOpRQgx5hkS3X756/Ba
 BuYqjZUWYVfd2vy6egTpiiIBR56Fd1hPdpLt6PUzsaWj/2pBSwY8wYSwxR1ufZNCeNw0
 brUreYKh+K/GlDQjqnR5AJt1ZaiNyq64BDuBZj2Lw0Go2r5PugmV1mo0W3lwBCQjDhAX
 KUnw==
X-Gm-Message-State: AOAM530TtXdOCXbabBaeGufpcGuiRi9HGOVTSCXrqMfKC368NySgn9kj
 IaGZ3yUc4rytUGYwVzBQvNNmsd2qgWG75piP4e/kMU8d54uBH+p5ceAGMwB2htmYyNHPWwrMSeu
 OnMoP7KEpNvDI
X-Received: by 2002:a5d:6a51:: with SMTP id t17mr20981499wrw.255.1625565940546; 
 Tue, 06 Jul 2021 03:05:40 -0700 (PDT)
X-Received: by 2002:a5d:6a51:: with SMTP id t17mr20981473wrw.255.1625565940362; 
 Tue, 06 Jul 2021 03:05:40 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id d17sm16060755wro.93.2021.07.06.03.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 03:05:39 -0700 (PDT)
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>, peter.maydell@linaro.org,
 leif@nuviainc.com, rad@semihalf.com, mst@redhat.com, imammedo@redhat.com
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <f9afb1e8-0757-0190-a0e4-aa5d08005699@redhat.com>
Date: Tue, 6 Jul 2021 12:05:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210630153156.9421-5-shashi.mallela@linaro.org>
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
X-TUID: 2VKT1vxlpgTF

Hi Shashi,
On 6/30/21 5:31 PM, Shashi Mallela wrote:
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
>  hw/intc/arm_gicv3_its.c            | 361 ++++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h           |  26 +++
>  include/hw/intc/arm_gicv3_common.h |   2 +
>  3 files changed, 388 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 5919d8d7b1..adaee72c1f 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -28,6 +28,22 @@ struct GICv3ITSClass {
>      void (*parent_reset)(DeviceState *dev);
>  };
>  
> +/*
> + * This is an internal enum used to distinguish between LPI triggered
> + * via command queue and LPI triggered via gits_translater write.
> + */
> +typedef enum ItsCmdType {
> +    NONE = 0, /* internal indication for GITS_TRANSLATER write */
> +    CLEAR = 1,
> +    DISCARD = 2,
> +    INT = 3,
> +} ItsCmdType;
> +
> +typedef struct {
> +    uint32_t iteh;
> +    uint64_t itel;
> +} IteEntry;
> +
>  static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
>  {
>      uint64_t result = 0;
> @@ -49,6 +65,330 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
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
> +            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
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
> +    return (*cte & TABLE_ENTRY_VALID_MASK) != 0;
> +}
> +
> +static MemTxResult update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> +                              IteEntry ite)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t itt_addr;
> +    MemTxResult res = MEMTX_OK;
> +
> +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
usual mask scheme
> +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> +
> +    address_space_stq_le(as, itt_addr + (eventid * sizeof(uint64_t)),
> +                         ite.itel, MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res == MEMTX_OK) {
> +        address_space_stl_le(as, itt_addr + ((eventid + sizeof(uint64_t)) *
> +                             sizeof(uint32_t)), ite.iteh,
> +                             MEMTXATTRS_UNSPECIFIED, &res);
> +    }
> +   return res;
> +}
> +
> +static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> +                    uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint64_t itt_addr;
> +    bool status = false;
> +    IteEntry ite;
> +
> +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
usual mask scheme
> +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> +
> +    memset(&ite, 0 , sizeof(ite));
nit you could have initialized ite directly = {}.
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
> +                    *pIntid = (ite.itel >> ITE_ENTRY_INTID_SHIFT) &
> +                               ITE_ENTRY_INTID_MASK;
> +                    *icid = ite.iteh & ITE_ENTRY_ICID_MASK;
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
> +            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
> +
> +            if (valid_l2t) {
> +                max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
> +
> +                l2t_addr = value & ((1ULL << 51) - 1);
> +
> +                value =  address_space_ldq_le(as, l2t_addr +
> +                                   ((devid % max_l2_entries) * GITS_DTE_SIZE),
> +                                   MEMTXATTRS_UNSPECIFIED, res);
> +            }
> +        }
> +    } else {
> +        /* Flat level table */
> +        value = address_space_ldq_le(as, s->dt.base_addr +
> +                                     (devid * GITS_DTE_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, res);
> +    }
> +
> +    return value;
> +}
> +
> +/*
> + * This function handles the processing of following commands based on
> + * the ItsCmdType parameter passed:-
> + * 1. trigerring of lpi interrupt translation via ITS INT command
> + * 2. trigerring of lpi interrupt translation via gits_translater register
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
> +    } else {> +        devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
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
> +    uint64_t idbits;
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
> +        idbits = MIN(FIELD_EX64(s->gicv3->cpu->gicr_propbaser, GICR_PROPBASER,
> +                                IDBITS), GICD_TYPER_IDBITS);
> +
> +        if (idbits < GICR_PROPBASER_IDBITS_THRESHOLD) {
> +            return res;
> +        }
> +        max_Intid = (1ULL << (idbits + 1));
> +    }
> +
> +    if ((devid > s->dt.maxids.max_devids) || (icid > s->ct.maxids.max_collids)
> +            || !dte_valid || (eventid > max_eventid) ||
> +            (!ignore_pInt && ((pIntid < GICV3_LPI_INTID_START) ||
> +               (pIntid > max_Intid)))) {
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
> @@ -127,7 +467,8 @@ static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
>  
>      icid = value & ICID_MASK;
>  
> -    rdbase = (value >> R_MAPC_RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
> +    rdbase = (value & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
> +    rdbase &= RDBASE_PROCNUM_MASK;
>  
>      valid = (value & CMD_FIELD_VALID_MASK);
>  
> @@ -301,8 +642,10 @@ static void process_cmdq(GICv3ITSState *s)
>  
>          switch (cmd) {
>          case GITS_CMD_INT:
> +            res = process_its_cmd(s, data, cq_offset, INT);
>              break;
>          case GITS_CMD_CLEAR:
> +            res = process_its_cmd(s, data, cq_offset, CLEAR);
>              break;
>          case GITS_CMD_SYNC:
>              /*
> @@ -319,10 +662,13 @@ static void process_cmdq(GICv3ITSState *s)
>              res = process_mapc(s, cq_offset);
>              break;
>          case GITS_CMD_MAPTI:
> +            res = process_mapti(s, data, cq_offset, false);
>              break;
>          case GITS_CMD_MAPI:
> +            res = process_mapti(s, data, cq_offset, true);
>              break;
>          case GITS_CMD_DISCARD:
> +            res = process_its_cmd(s, data, cq_offset, DISCARD);
>              break;
>          case GITS_CMD_INV:
>          case GITS_CMD_INVALL:
> @@ -484,7 +830,20 @@ static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
>                                                 uint64_t data, unsigned size,
>                                                 MemTxAttrs attrs)
>  {
> +    GICv3ITSState *s = (GICv3ITSState *)opaque;
>      MemTxResult result = MEMTX_OK;
> +    uint32_t devid = 0;
> +
> +    switch (offset) {
> +    case GITS_TRANSLATER:
> +        if (s->ctlr & ITS_CTLR_ENABLED) {
> +            devid = attrs.requester_id;
> +            result = process_its_cmd(s, data, devid, NONE);
> +        }
> +        break;
> +    default:
> +        break;
> +    }
>  
>      return result;
>  }
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index a27b1e4d19..f7675a5adc 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -123,6 +123,20 @@
>  #define GICR_TYPER_COMMONLPIAFF      (0x3 << 24)
>  #define GICR_TYPER_AFFINITYVALUE     (0xFFFFFFFFULL << 32)
>  
> +FIELD(GICR_PROPBASER, IDBITS, 0, 5)
> +FIELD(GICR_PROPBASER, INNERCACHE, 7, 3)
> +FIELD(GICR_PROPBASER, SHAREABILITY, 10, 2)
> +FIELD(GICR_PROPBASER, PHYADDR, 12, 40)
> +FIELD(GICR_PROPBASER, OUTERCACHE, 56, 3)
> +
> +#define GICR_PROPBASER_IDBITS_THRESHOLD          0xd
> +
> +FIELD(GICR_PENDBASER, INNERCACHE, 7, 3)
> +FIELD(GICR_PENDBASER, SHAREABILITY, 10, 2)
> +FIELD(GICR_PENDBASER, PHYADDR, 16, 36)
> +FIELD(GICR_PENDBASER, OUTERCACHE, 56, 3)
> +FIELD(GICR_PENDBASER, PTZ, 62, 1)
> +
>  #define GICR_WAKER_ProcessorSleep    (1U << 1)
>  #define GICR_WAKER_ChildrenAsleep    (1U << 2)
>  
> @@ -322,6 +336,13 @@ FIELD(MAPC, RDBASE, 16, 32)
>  #define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
>  #define SIZE_MASK                 0x1f
>  
> +/* MAPI command fields */
> +#define EVENTID_MASK              ((1ULL << 32) - 1)
> +
> +/* MAPTI command fields */
> +#define pINTID_SHIFT                 32
> +#define pINTID_MASK               MAKE_64BIT_MASK(32, 32)
> +
>  #define DEVID_SHIFT                  32
>  #define DEVID_MASK                MAKE_64BIT_MASK(32, 32)
>  
> @@ -347,6 +368,11 @@ FIELD(MAPC, RDBASE, 16, 32)
>   * vPEID = 16 bits
>   */
>  #define ITS_ITT_ENTRY_SIZE            0xC
> +#define ITE_ENTRY_INTTYPE_SHIFT        1
> +#define ITE_ENTRY_INTID_SHIFT          2
> +#define ITE_ENTRY_INTID_MASK         ((1ULL << 24) - 1)
> +#define ITE_ENTRY_INTSP_SHIFT          26
> +#define ITE_ENTRY_ICID_MASK          ((1ULL << 16) - 1)
>  
>  /* 16 bits EventId */
>  #define ITS_IDBITS                   GICD_TYPER_IDBITS
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 1fd5cedbbd..0715b0bc2a 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -36,6 +36,8 @@
>  #define GICV3_MAXIRQ 1020
>  #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
>  
> +#define GICV3_LPI_INTID_START 8192
> +
>  #define GICV3_REDIST_SIZE 0x20000
>  
>  /* Number of SGI target-list bits */
> 
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric

