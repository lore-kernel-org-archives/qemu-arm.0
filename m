Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1887067lfg;
        Mon, 21 Jun 2021 02:52:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5ztEHGXyDqMxyoVB8wltzsse5hVehXjtmJf3sPKRqmIFy+BrXG6UH09apWNhq/ceWiW+G
X-Received: by 2002:a02:cf82:: with SMTP id w2mr16914153jar.3.1624269131018;
        Mon, 21 Jun 2021 02:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624269131; cv=none;
        d=google.com; s=arc-20160816;
        b=twJlcXLyGb1lgs5gtkclMWRIJBk6KXuVnSpRoXrmEBHof85i6bjK9ba/fEjWbj/mpF
         GUs25Pckdk9k602D8AH7K9qphaJFjdEavustW4h7Y8VP1/Ouqueo7SwXa0+sTW8DPvq7
         nQCHbjtsVWiaxMGQBP/dLt4nCTIcN02+ldE96lPR/5PE54jiQ35wggasle50U7P0S/Yl
         kBfnZD8Duz5uhxk2Sxm0uONYRgFiraaRFqu66qp+i/tZkajkWrU8tDa3uAhvmsvPOBcZ
         hyeyPsA7luQi251Vigv9eJDnSItlVSDb9tZW0cWHLcarguMpielmgS0QrGCwfiONglNF
         tT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=N0VoiJ2wKsa3/CZMLoYbSN2VmbMHw9zFcB9KSslcvBE=;
        b=oiP9AnI9gk/ys2CuyU5COiZ5jzJVT9KJkJBK/9T9TKkM5c7bDJD1L5htSRL5bxz1ne
         j8gziGglIjDBGiqmFoXwH2BNxUCJm8mREAEr4v+YMfJFxL8YbW/eSpNWMAiG9FuZdKBN
         717r64UeuHJxChkoAiEBhQ8pEV4g01OTRelyfi8JlaCt1IqnbYpETtLPG2y7zH7p+OKP
         JEiYcR1dk+M3Z7XOLqs57Il3l74dAlGTbqrWH6QRNIaBxPRSqs4cK7tvr+Lnlmoqwja+
         np9hFu/lNFHqbbcFQ0U35fK20r9QpyX5TVyUu8vKHitLNfkDDeXJWofROzCnmfWUWHh+
         qofw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LWt36QJH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si7353743ion.22.2021.06.21.02.52.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jun 2021 02:52:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LWt36QJH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvGbC-0001z1-8q
	for alex.bennee@linaro.org; Mon, 21 Jun 2021 05:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lvGas-0001yL-TD
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 05:51:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lvGao-0001tN-AX
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 05:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0VoiJ2wKsa3/CZMLoYbSN2VmbMHw9zFcB9KSslcvBE=;
 b=LWt36QJHgX3BHBvKGbMzAbMQEhb2a1olzYiy32Iy3Obf+8KkiTHyEXoq5zE7/qSsLrso+Z
 ufY1nfUpN13RnDu5PLBtHkU8xx/yADyrr1DY5DXRUl+61P75C2HQ11+blS+3zREfSjuwmJ
 eZo3c42KdNnOGJnynjvxuE9YgYN41i4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-HRPrBdDzOdGEg3r95ztFrQ-1; Mon, 21 Jun 2021 05:51:43 -0400
X-MC-Unique: HRPrBdDzOdGEg3r95ztFrQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 w186-20020a1cdfc30000b02901ced88b501dso5634643wmg.2
 for <qemu-arm@nongnu.org>; Mon, 21 Jun 2021 02:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N0VoiJ2wKsa3/CZMLoYbSN2VmbMHw9zFcB9KSslcvBE=;
 b=O6IWjfai3HMiZ4HXL/EVJqHgUkuUxfgYfgoqb9wi7brOnIEFMV4iZPDlKkU4qSsvbW
 w1IqAYD5rU0gpmxOs4IcUWK1sGTFvlFMUhWpaWCdxKG+i+dO/LwH7wRgKVwkof3zEhzj
 Oudrs/mMW1Rp48D6gBfkHDGRiXnYYUyp+l4Gee//6uMcCzvHmC0HYJznZUYtWM6jWWXM
 wxzpoAr6l8g/+zx73g7tLvC70DnVD8NWKF9N53+2ue1pReZjGmau0TGxDTMXG0qblZz/
 c402QNiMdyJJsjABiVGzQz7PI/HJccBbQ8K+TcIKGzPMVxd9y5uiMBQtTQVZoJJsjlJ7
 LOVw==
X-Gm-Message-State: AOAM532qzzHIoe6jxp+e8V5nHe5/SZr12F33ddgU9NX0Xx0pJy+z41d1
 i844wUsnQ9iOnawbmFtXj4bb4pvxZzjoq1f4kSBzPMyC1zGMuo4TGfDRs1cywIWwsOr8OS5zLEI
 D11EaSk/2Ety1
X-Received: by 2002:a1c:e456:: with SMTP id b83mr26325423wmh.178.1624269101914; 
 Mon, 21 Jun 2021 02:51:41 -0700 (PDT)
X-Received: by 2002:a1c:e456:: with SMTP id b83mr26325398wmh.178.1624269101685; 
 Mon, 21 Jun 2021 02:51:41 -0700 (PDT)
Received: from [192.168.43.95] ([37.173.110.237])
 by smtp.gmail.com with ESMTPSA id n10sm17529732wre.95.2021.06.21.02.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:51:41 -0700 (PDT)
Subject: Re: [PATCH v4 2/8] hw/intc: GICv3 ITS register definitions added
To: shashi.mallela@linaro.org, peter.maydell@linaro.org, leif@nuviainc.com,
 rad@semihalf.com
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-3-shashi.mallela@linaro.org>
 <0fd86cf3-b83d-6e82-2894-f7b8d76537aa@redhat.com>
 <a21b1f173d81fe55952c1795ca191c034991cf6d.camel@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <c5062d38-1376-400b-4f66-e0dddd5efd05@redhat.com>
Date: Mon, 21 Jun 2021 11:51:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a21b1f173d81fe55952c1795ca191c034991cf6d.camel@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: mgvlfm3RWb6W

Hi Shashi,

On 6/16/21 11:02 PM, shashi.mallela@linaro.org wrote:
> Hi Eric,
> 
> Please find my responses inline (below):-
> 
> On Sat, 2021-06-12 at 08:08 +0200, Eric Auger wrote:
>>
>> On 6/2/21 8:00 PM, Shashi Mallela wrote:
>>> Defined descriptors for ITS device table,collection table and ITS
>>> command queue entities.Implemented register read/write functions,
>>> extract ITS table parameters and command queue parameters,extended
>>> gicv3 common to capture qemu address space(which host the ITS table
>>> platform memories required for subsequent ITS processing) and
>>> initialize the same in ITS device.
>>>
>>> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
>>> ---
>>>  hw/intc/arm_gicv3_its.c                | 335
>>> +++++++++++++++++++++++++
>>>  hw/intc/gicv3_internal.h               |  28 ++-
>>>  include/hw/intc/arm_gicv3_common.h     |   3 +
>>>  include/hw/intc/arm_gicv3_its_common.h |  30 +++
>>>  4 files changed, 395 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
>>> index 545cda3665..af60f19c98 100644
>>> --- a/hw/intc/arm_gicv3_its.c
>>> +++ b/hw/intc/arm_gicv3_its.c
>>> @@ -28,6 +28,157 @@ struct GICv3ITSClass {
>>>      void (*parent_reset)(DeviceState *dev);
>>>  };
>>>  
>>> +static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
>>> +{
>>> +    uint64_t result = 0;
>>> +
>>> +    switch (page_sz) {
>>> +    case GITS_ITT_PAGE_SIZE_0:
>>> +    case GITS_ITT_PAGE_SIZE_1:
>>> +        result = value & R_GITS_BASER_PHYADDR_MASK;
>> Use FIELD_EX64 as well for homogeneity?
> Done
>>> +        break;
>>> +
>>> +    case GITS_ITT_PAGE_SIZE_2:
>>> +        result = value & R_GITS_BASER_PHYADDRL_64K_MASK;
>> here as well?
> Done
>>> +        result |= FIELD_EX64(value, GITS_BASER, PHYADDRH_64K) <<
>>> 48;
>>> +        break;
>>> +
>>> +    default:
>>> +        break;
>>> +    }
>>> +    return result;
>>> +}
>>> +
>>> +static void extract_table_params(GICv3ITSState *s)
>>> +{
>>> +    uint16_t num_pages = 0;
>>> +    uint8_t  page_sz_type;
>>> +    uint8_t type;
>>> +    uint32_t page_sz = 0;
>>> +    uint64_t value;
>>> +
>>> +    for (int i = 0; i < 8; i++) {
>>> +        value = s->baser[i];
>>> +
>>> +        if (!value) {
>>> +            continue;
>>> +        }
>>> +
>>> +        page_sz_type = FIELD_EX64(value, GITS_BASER, PAGESIZE);
>>> +
>>> +        switch (page_sz_type) {
>>> +        case 0:
>>> +            page_sz = GITS_ITT_PAGE_SIZE_0;
>>> +            break;
>>> +
>>> +        case 1:
>>> +            page_sz = GITS_ITT_PAGE_SIZE_1;
>>> +            break;
>>> +
>>> +        case 2:
>>> +        case 3:
>>> +            page_sz = GITS_ITT_PAGE_SIZE_2;
>>> +            break;
>>> +
>>> +        default:
>>> +            g_assert_not_reached();
>>> +        }
>>> +
>>> +        num_pages = FIELD_EX64(value, GITS_BASER, SIZE);
>>  + 1 directly? and remove num_pages + 1 below.
> Done
>>> +
>>> +        type = FIELD_EX64(value, GITS_BASER, TYPE);
>>> +
>>> +        switch (type) {
>>> +
>>> +        case GITS_ITT_TYPE_DEVICE:
>>> +            memset(&s->dt, 0 , sizeof(s->dt));
>>> +            s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
>>> +
>>> +            if (!s->dt.valid) {
>>> +                return;
>>> +            }
>>> +
>>> +            s->dt.page_sz = page_sz;
>>> +            s->dt.indirect = FIELD_EX64(value, GITS_BASER,
>>> INDIRECT);
>>> +            s->dt.entry_sz = FIELD_EX64(value, GITS_BASER,
>>> ENTRYSIZE);
>>> +
>>> +            if (!s->dt.indirect) {
>>> +                s->dt.max_entries = ((num_pages + 1) * page_sz) /
>>> +                                     s->dt.entry_sz;
>>> +            } else {
>>> +                s->dt.max_entries = ((((num_pages + 1) * page_sz)
>>> /
>>> +                                     L1TABLE_ENTRY_SIZE) *
>>> +                                     (page_sz / s->dt.entry_sz));
>>> +            }
>>> +
>>> +            s->dt.max_devids = (1UL << (FIELD_EX64(s->typer,
>>> GITS_TYPER,
>>> +                                DEVBITS) + 1));
>>> +
>>> +            s->dt.base_addr = baser_base_addr(value, page_sz);
>>> +
>>> +            break;
>>> +
>>> +        case GITS_ITT_TYPE_COLLECTION:
>>> +            memset(&s->ct, 0 , sizeof(s->ct));
>>> +            s->ct.valid = FIELD_EX64(value, GITS_BASER, VALID);
>>> +
>>> +            /*
>>> +             * GITS_TYPER.HCC is 0 for this implementation
>>> +             * hence writes are discarded if ct.valid is 0
>>> +             */
>>> +            if (!s->ct.valid) {
>>> +                return;
>> as this is an helper routine, I think it would be better to have this
>> check in the caller. Also you reset ct above.
> The idea here was to keep all the GITS_BASER fields parsing and
> extraction in one place in this function without the caller (like
> its_writel) having to know the GITS_BASER fields format and thereby
> split the logic between the caller and this function 
Maybe add a doc comment explaining what the function does and in which
context it is supposed to be called then.
>>> +            }
>>> +
>>> +            s->ct.page_sz = page_sz;
>>> +            s->ct.indirect = FIELD_EX64(value, GITS_BASER,
>>> INDIRECT);
>>> +            s->ct.entry_sz = FIELD_EX64(value, GITS_BASER,
>>> ENTRYSIZE);
>>> +
>>> +            if (!s->ct.indirect) {
>>> +                s->ct.max_entries = ((num_pages + 1) * page_sz) /
>>> +                                     s->ct.entry_sz;
>>> +            } else {
>>> +                s->ct.max_entries = ((((num_pages + 1) * page_sz)
>>> /
>>> +                                     L1TABLE_ENTRY_SIZE) *
>>> +                                     (page_sz / s->ct.entry_sz));
>>> +            }
>>> +
>>> +            if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
>>> +                s->ct.max_collids = (1UL << (FIELD_EX64(s->typer,
>>> +                                     GITS_TYPER, CIDBITS) + 1));
>>> +            } else {
>>> +                /* 16-bit CollectionId supported when CIL == 0 */
>>> +                s->ct.max_collids = (1UL << 16);
>>> +            }
>>> +
>>> +            s->ct.base_addr = baser_base_addr(value, page_sz);
>>> +
>>> +            break;
>>> +
>>> +        default:
>>> +            break;
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +static void extract_cmdq_params(GICv3ITSState *s)
>>> +{
>>> +    uint16_t num_pages = 0;
>>> +    uint64_t value = s->cbaser;
>>> +
>>> +    num_pages = FIELD_EX64(value, GITS_CBASER, SIZE);
>> + 1
>>> +
>>> +    memset(&s->cq, 0 , sizeof(s->cq));
>>> +    s->cq.valid = FIELD_EX64(value, GITS_CBASER, VALID);
>>> +
>>> +    if (s->cq.valid) {
>>> +        s->cq.max_entries = ((num_pages + 1) *
>>> GITS_ITT_PAGE_SIZE_0) /
>> nit: use of GITS_ITT_PAGE_SIZE_0 is misleading as ITT stands for
>> interrupt translation table and does not relate to CMDQ. Use 4K
>> define
>> instead.
> changed the names to GITS_PAGE_SIZE_4K/16K/64K
>>> +                             GITS_CMDQ_ENTRY_SIZE;
>>> +        s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
>>> +        s->cq.base_addr <<= R_GITS_CBASER_PHYADDR_SHIFT;
>>> +    }
>>> +}
>>> +
>>>  static MemTxResult gicv3_its_translation_write(void *opaque,
>>> hwaddr offset,
>>>                                                 uint64_t data,
>>> unsigned size,
>>>                                                 MemTxAttrs attrs)
>>> @@ -41,7 +192,73 @@ static MemTxResult its_writel(GICv3ITSState *s,
>>> hwaddr offset,
>>>                                uint64_t value, MemTxAttrs attrs)
>>>  {
>>>      MemTxResult result = MEMTX_OK;
>>> +    int index;
>>>  
>>> +    switch (offset) {
>>> +    case GITS_CTLR:
>>> +        s->ctlr |= (value & ~(s->ctlr));
>>> +
>>> +        if (s->ctlr & ITS_CTLR_ENABLED) {
>>> +            extract_table_params(s);
>>> +            extract_cmdq_params(s);
>>> +            s->creadr = 0;
>> The KVM code also checks the he CBASER and
>> device/collection BASER are valid
>> we do check CBASER and device/collection BASER are valid in this
>> implementation too (via extract_cmdq_params & extract_table_params)
>> To be further checked in subsequent patches:
>> - cache invalidation when turning off
>> - process commands if turned on?
>> - any cmd lock
>>
>>> +        }
>>> +        break;
>>> +    case GITS_CBASER:
>>> +        /*
>>> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS
>>> is
>>> +         *                 already enabled
>>> +         */
>>> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
>>> +            s->cbaser = deposit64(s->cbaser, 0, 32, value);
>>> +            s->creadr = 0;
>>> +        }
>>> +        break;
>>> +    case GITS_CBASER + 4:
>>> +        /*
>>> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS
>>> is
>>> +         *                 already enabled
>>> +         */
>>> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
>>> +            s->cbaser = deposit64(s->cbaser, 32, 32, value);
>> you need to reset creadr here also
> Done
>>
>> also CWRITER should be reset to CREADR.
> Done
>> KVM code comment:
>> /*
>>  * CWRITER is architecturally UNKNOWN on reset, but we need to reset
>>  * it to CREADR to make sure we start with an empty command buffer.
>>  */
>>
>>> +        }> +        break;
>>> +    case GITS_CWRITER:
>>> +        s->cwriter = deposit64(s->cwriter, 0, 32,
>>> +                               (value &
>>> ~R_GITS_CWRITER_RETRY_MASK));
>> how do you implement the overflow case?
>> "If GITS_CWRITER is written with a value outside of the valid range
>> specified by
>> GITS_CBASER.Physical_Address and GITS_CBASER.Size, behavior is a
>> CONSTRAINED UNPREDICTABLE choice"
>> for info the KVM code does not write the actual reg
> we write the reg and log a guest error
>> further check: process command?
>>
>>> +        break;
>>> +    case GITS_CWRITER + 4:
>>> +        s->cwriter = deposit64(s->cwriter, 32, 32,
>>> +                               (value &
>>> ~R_GITS_CWRITER_RETRY_MASK));
>>> +        break;
>>> +    case GITS_BASER ... GITS_BASER + 0x3f:
>>> +        /*
>>> +         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS
>>> is
>>> +         *                 already enabled
>>> +         */
>>> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
>>> +            index = (offset - GITS_BASER) / 8;
>>> +
>>> +            if (offset & 7) {
>>> +                s->baser[index] = deposit64(s->baser[index], 32,
>>> 32,
>>> +                                            (value &
>>> ~GITS_BASER_VAL_MASK));
>>> +            } else {
>>> +                s->baser[index] = deposit64(s->baser[index], 0,
>>> 32,
>>> +                                            (value &
>>> ~GITS_BASER_VAL_MASK));
>>> +            }
>>> +        }
>>> +        break;
>>> +    case GITS_IIDR:
>>> +    case GITS_IDREGS ... GITS_IDREGS + 0x2f:
>>> +        /* RO registers, ignore the write */
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "%s: invalid guest write to RO register at
>>> offset "
>>> +                      TARGET_FMT_plx "\n", __func__, offset);
>>> +        break;
>>> +    default:
>>> +        result = MEMTX_ERROR;
>>> +        break;
>>> +    }
>>>      return result;
>>>  }
>>>  
>>> @@ -49,7 +266,55 @@ static MemTxResult its_readl(GICv3ITSState *s,
>>> hwaddr offset,
>>>                               uint64_t *data, MemTxAttrs attrs)
>>>  {
>>>      MemTxResult result = MEMTX_OK;
>>> +    int index;
>>>  
>>> +    switch (offset) {
>>> +    case GITS_CTLR:
>>> +        *data = s->ctlr;
>>> +        break;
>>> +    case GITS_IIDR:
>>> +        *data = gicv3_iidr();
>>> +        break;
>>> +    case GITS_IDREGS ... GITS_IDREGS + 0x2f:
>>> +        /* ID registers */
>>> +        *data = gicv3_idreg(offset - GITS_IDREGS);
>> I am not sure those are the same as the gicv3
> Yes they are, and consistent with the distributor,redistributor gicv3
> idregs implementation too in qemu (as indicated in previous patch
> review comments)
Ah OK

Thanks

Eric
>> on KVM we have
>>         case GITS_PIDR0:
>>                 return 0x92;    /* part number, bits[7:0] */
>>         case GITS_PIDR1:
>>                 return 0xb4;    /* part number, bits[11:8] */
>>         case GITS_PIDR2:
>>                 return GIC_PIDR2_ARCH_GICv3 | 0x0b;
>>         case GITS_PIDR4:
>>                 return 0x40;    /* This is a 64K software visible
>> page */
>>         /* The following are the ID registers for (any) GIC. */
>>         case GITS_CIDR0:
>>                 return 0x0d;
>>         case GITS_CIDR1:
>>                 return 0xf0;
>>         case GITS_CIDR2:
>>                 return 0x05;
>>         case GITS_CIDR3:
>>                 return 0xb1;
>>
>>
>>> +        break;
>>> +    case GITS_TYPER:
>>> +        *data = extract64(s->typer, 0, 32);
>>> +        break;
>>> +    case GITS_TYPER + 4:
>>> +        *data = extract64(s->typer, 32, 32);
>>> +        break;
>>> +    case GITS_CBASER:
>>> +        *data = extract64(s->cbaser, 0, 32);
>>> +        break;
>>> +    case GITS_CBASER + 4:
>>> +        *data = extract64(s->cbaser, 32, 32);
>>> +        break;
>>> +    case GITS_CREADR:
>>> +        *data = extract64(s->creadr, 0, 32);
>>> +        break;
>>> +    case GITS_CREADR + 4:
>>> +        *data = extract64(s->creadr, 32, 32);
>>> +        break;
>>> +    case GITS_CWRITER:
>>> +        *data = extract64(s->cwriter, 0, 32);
>>> +        break;
>>> +    case GITS_CWRITER + 4:
>>> +        *data = extract64(s->cwriter, 32, 32);
>>> +        break;
>>> +    case GITS_BASER ... GITS_BASER + 0x3f:
>>> +        index = (offset - GITS_BASER) / 8;
>>> +        if (offset & 7) {
>>> +            *data = extract64(s->baser[index], 32, 32);
>>> +        } else {
>>> +            *data = extract64(s->baser[index], 0, 32);
>>> +        }
>>> +        break;
>>> +    default:
>>> +        result = MEMTX_ERROR;
>>> +        break;
>>> +    }
>>>      return result;
>>>  }
>>>  
>>> @@ -57,7 +322,42 @@ static MemTxResult its_writell(GICv3ITSState
>>> *s, hwaddr offset,
>>>                                 uint64_t value, MemTxAttrs attrs)
>>>  {
>>>      MemTxResult result = MEMTX_OK;
>>> +    int index;
>>>  
>>> +    switch (offset) {
>>> +    case GITS_BASER ... GITS_BASER + 0x3f:
>>> +        /*
>>> +         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS
>>> is
>>> +         *                 already enabled
>>> +         */
>>> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
>>> +            index = (offset - GITS_BASER) / 8;
>>> +            s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);
>>> +        }
>>> +        break;
>>> +    case GITS_CBASER:
>>> +        /*
>>> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS
>>> is
>>> +         *                 already enabled
>>> +         */
>>> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
>>> +            s->cbaser = value;
>> s->creadr = 0;
>> cwriter = creader?
> Done
>>> +        }
>>> +        break;
>>> +    case GITS_CWRITER:
>>> +        s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
>>> +        break;
>>> +    case GITS_CREADR:
>> RO if GICD_CTLR.DS = 0
>> On KVM side the write access is implemented
> Done
>>> +    case GITS_TYPER:
>>> +        /* RO registers, ignore the write */
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "%s: invalid guest write to RO register at
>>> offset "
>>> +                      TARGET_FMT_plx "\n", __func__, offset);
>>> +        break;
>>> +    default:
>>> +        result = MEMTX_ERROR;
>>> +        break;
>>> +    }
>>>      return result;
>>>  }
>>>  
>>> @@ -65,7 +365,29 @@ static MemTxResult its_readll(GICv3ITSState *s,
>>> hwaddr offset,
>>>                                uint64_t *data, MemTxAttrs attrs)
>>>  {
>>>      MemTxResult result = MEMTX_OK;
>>> +    int index;
>>>  
>>> +    switch (offset) {
>>> +    case GITS_TYPER:
>>> +        *data = s->typer;
>>> +        break;
>>> +    case GITS_BASER ... GITS_BASER + 0x3f:
>>> +        index = (offset - GITS_BASER) / 8;
>>> +        *data = s->baser[index];
>>> +        break;
>>> +    case GITS_CBASER:
>>> +        *data = s->cbaser;
>>> +        break;
>>> +    case GITS_CREADR:
>>> +        *data = s->creadr;
>>> +        break;
>>> +    case GITS_CWRITER:
>>> +        *data = s->cwriter;
>>> +        break;
>>> +    default:
>>> +        result = MEMTX_ERROR;
>>> +        break;
>>> +    }
>>>      return result;
>>>  }
>>>  
>>> @@ -162,6 +484,9 @@ static void gicv3_arm_its_realize(DeviceState
>>> *dev, Error **errp)
>>>      gicv3_its_init_mmio(s, &gicv3_its_control_ops,
>>> &gicv3_its_translation_ops);
>>>  
>>>      if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
>>> +        address_space_init(&s->gicv3->dma_as, s->gicv3->dma,
>>> +                           "gicv3-its-sysmem");
>>> +
>>>          /* set the ITS default features supported */
>>>          s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
>>>                                GITS_TYPE_PHYSICAL);
>>> @@ -208,6 +533,14 @@ static void gicv3_its_reset(DeviceState *dev)
>>>      }
>>>  }
>>>  
>>> +static void gicv3_its_post_load(GICv3ITSState *s)
>>> +{
>>> +    if (s->ctlr & ITS_CTLR_ENABLED) {
>>> +        extract_table_params(s);
>>> +        extract_cmdq_params(s);
>>> +    }
>>> +}
>>> +
>>>  static Property gicv3_its_props[] = {
>>>      DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-
>>> gicv3",
>>>                       GICv3State *),
>>> @@ -218,10 +551,12 @@ static void gicv3_its_class_init(ObjectClass
>>> *klass, void *data)
>>>  {
>>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>>      GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
>>> +    GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
>>>  
>>>      dc->realize = gicv3_arm_its_realize;
>>>      device_class_set_props(dc, gicv3_its_props);
>>>      device_class_set_parent_reset(dc, gicv3_its_reset, &ic-
>>>> parent_reset);
>>> +    icc->post_load = gicv3_its_post_load;
>>>  }
>>>  
>>>  static const TypeInfo gicv3_its_info = {
>>> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
>>> index e0b06930a7..d6aaa94e4c 100644
>>> --- a/hw/intc/gicv3_internal.h
>>> +++ b/hw/intc/gicv3_internal.h
>>> @@ -238,7 +238,7 @@ FIELD(GITS_BASER, PAGESIZE, 8, 2)
>>>  FIELD(GITS_BASER, SHAREABILITY, 10, 2)
>>>  FIELD(GITS_BASER, PHYADDR, 12, 36)
>>>  FIELD(GITS_BASER, PHYADDRL_64K, 16, 32)
>>> -FIELD(GITS_BASER, PHYADDRH_64K, 48, 4)
>>> +FIELD(GITS_BASER, PHYADDRH_64K, 12, 4)
>>>  FIELD(GITS_BASER, ENTRYSIZE, 48, 5)
>>>  FIELD(GITS_BASER, OUTERCACHE, 53, 3)
>>>  FIELD(GITS_BASER, TYPE, 56, 3)
>>> @@ -246,6 +246,17 @@ FIELD(GITS_BASER, INNERCACHE, 59, 3)
>>>  FIELD(GITS_BASER, INDIRECT, 62, 1)
>>>  FIELD(GITS_BASER, VALID, 63, 1)
>>>  
>>> +FIELD(GITS_CBASER, SIZE, 0, 8)
>>> +FIELD(GITS_CBASER, SHAREABILITY, 10, 2)
>>> +FIELD(GITS_CBASER, PHYADDR, 12, 40)
>>> +FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
>>> +FIELD(GITS_CBASER, INNERCACHE, 59, 3)
>>> +FIELD(GITS_CBASER, VALID, 63, 1)
>>> +
>>> +FIELD(GITS_CWRITER, RETRY, 0, 1)
>>> +FIELD(GITS_CWRITER, OFFSET, 5, 15)
>>> +
>>> +FIELD(GITS_CTLR, ENABLED, 0, 1)
>>>  FIELD(GITS_CTLR, QUIESCENT, 31, 1)
>>>  
>>>  FIELD(GITS_TYPER, PHYSICAL, 0, 1)
>>> @@ -257,6 +268,13 @@ FIELD(GITS_TYPER, PTA, 19, 1)
>>>  FIELD(GITS_TYPER, CIDBITS, 32, 4)
>>>  FIELD(GITS_TYPER, CIL, 36, 1)
>>>  
>>> +#define GITS_IDREGS           0xFFD0
>>> +
>>> +#define ITS_CTLR_ENABLED               (1U)  /* ITS Enabled */
>>> +
>>> +#define
>>> GITS_BASER_VAL_MASK                  (R_GITS_BASER_ENTRYSIZE_MASK |
>>> \
>>> +                                              R_GITS_BASER_TYPE_MA
>>> SK)
>>> +
>>>  #define GITS_BASER_PAGESIZE_4K                0
>>>  #define GITS_BASER_PAGESIZE_16K               1
>>>  #define GITS_BASER_PAGESIZE_64K               2
>>> @@ -264,6 +282,14 @@ FIELD(GITS_TYPER, CIL, 36, 1)
>>>  #define GITS_ITT_TYPE_DEVICE                  1ULL
>>>  #define GITS_ITT_TYPE_COLLECTION              4ULL
>>>  
>>> +#define GITS_ITT_PAGE_SIZE_0      0x1000
>>> +#define GITS_ITT_PAGE_SIZE_1      0x4000
>>> +#define GITS_ITT_PAGE_SIZE_2      0x10000
>> Why not naming _4K 16K 64K instead of _0, 1, 2?
> Done,as indicated above
>>> +
>>> +#define L1TABLE_ENTRY_SIZE         8
>>> +
>>> +#define GITS_CMDQ_ENTRY_SIZE               32
>>> +
>>>  /**
>>>   * Default features advertised by this version of ITS
>>>   */
>>> diff --git a/include/hw/intc/arm_gicv3_common.h
>>> b/include/hw/intc/arm_gicv3_common.h
>>> index 91491a2f66..1fd5cedbbd 100644
>>> --- a/include/hw/intc/arm_gicv3_common.h
>>> +++ b/include/hw/intc/arm_gicv3_common.h
>>> @@ -226,6 +226,9 @@ struct GICv3State {
>>>      int dev_fd; /* kvm device fd if backed by kvm vgic support */
>>>      Error *migration_blocker;
>>>  
>>> +    MemoryRegion *dma;
>>> +    AddressSpace dma_as;
>>> +
>>>      /* Distributor */
>>>  
>>>      /* for a GIC with the security extensions the NS banked
>>> version of this
>>> diff --git a/include/hw/intc/arm_gicv3_its_common.h
>>> b/include/hw/intc/arm_gicv3_its_common.h
>>> index 65d1191db1..78b1ba7e6b 100644
>>> --- a/include/hw/intc/arm_gicv3_its_common.h
>>> +++ b/include/hw/intc/arm_gicv3_its_common.h
>>> @@ -41,6 +41,32 @@
>>>  
>>>  #define GITS_TRANSLATER  0x0040
>>>  
>>> +typedef struct {
>>> +    bool valid;
>>> +    bool indirect;
>>> +    uint16_t entry_sz;
>>> +    uint32_t page_sz;
>>> +    uint32_t max_entries;
>>> +    uint32_t max_devids;
>>> +    uint64_t base_addr;
>>> +} DevTableDesc;
>>> +
>>> +typedef struct {
>>> +    bool valid;
>>> +    bool indirect;
>>> +    uint16_t entry_sz;
>>> +    uint32_t page_sz;
>>> +    uint32_t max_entries;
>>> +    uint32_t max_collids;
>>> +    uint64_t base_addr;
>>> +} CollTableDesc;
>>> +
>>> +typedef struct {
>>> +    bool valid;
>>> +    uint32_t max_entries;
>>> +    uint64_t base_addr;
>>> +} CmdQDesc;> +
>>>  struct GICv3ITSState {
>>>      SysBusDevice parent_obj;
>>>  
>>> @@ -63,6 +89,10 @@ struct GICv3ITSState {
>>>      uint64_t creadr;
>>>      uint64_t baser[8];
>>>  
>>> +    DevTableDesc  dt;
>>> +    CollTableDesc ct;
>>> +    CmdQDesc      cq;
>>> +
>>>      Error *migration_blocker;
>>>  };
>> Thanks
>>
>> Eric
>>>  
>>>
> 
> 
> 
> 

