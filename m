Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp224646lff;
        Fri, 11 Jun 2021 23:09:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn1IBXvys+WtvbmACEKWt9a5cKr29nVgd9u6tgTc/R9GSVCAo6+15NFKwxU/066nJr3TwW
X-Received: by 2002:ac8:65c9:: with SMTP id t9mr7177144qto.19.1623478156508;
        Fri, 11 Jun 2021 23:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623478156; cv=none;
        d=google.com; s=arc-20160816;
        b=SW2mlqoi9TaEk6x0mYS8Cttovr2+eSSPsgfLKdm4B9nb2+Mx0mONdDoj2+cTPN9MaA
         yE252JRxq/fREDn26vYYJH/3/V9BtP0TPTN6l7pBtpD/T8c2rExFJbfzdiDgrnFXnqtu
         XoxFKeoKIkiaCJ/qVFbFubxw0oMqo7IE1z5ftx94R30jF+BsLFZjwwAqLfEn2huiQuwT
         sdFZqnpNR2eupJ6BRVMTCeZeyLJYH+93sK0DwYgUX+nbXlW8bwoJwofCMDmC/0+923IR
         rv9ox3KMfNRnNqdsJMu1tmXqXJObA6slHaczO9Gkt2IZ5BJeHx9GCMCrDU3tEEHFZYSj
         Vp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qyAZ5dZPUaF5Cm7DUlxGTSGHq/ZwammdIdirmKksleY=;
        b=xSyu7iHqWmWNl6su7okhIKDqU31iGS+695+WdwzT7ZZSAE8jLIUTZSgtgnqmsTV23e
         Nm1dFAHqdUXwp9adpFlYdFBcuPP+ztKq0r2cuezVhbk6Bc0/CPapgJRJxsmKe27Jrn1r
         hkTSneER3kEsJlRZ71WrkKMk1tr1yGmlvVUPp9XD5zk31hBqsAKN0GCqH3IkIj5w5yd2
         Q9OxSaxTVCF5uuLFNeyzZeKUkJv3xGbONpBelIqzcTJpB+/YpQYaNblC0PZzf4Nxcbpe
         z6AxTbokicfDiieJ/v3E1vmeuMi3jjyAKtf5DakJi9eVRgcySct3IbldXXBJKpH59eqC
         y4Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JEyJE/e/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n22si5456601qke.235.2021.06.11.23.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jun 2021 23:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JEyJE/e/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrwpX-0007zh-O9
	for alex.bennee@linaro.org; Sat, 12 Jun 2021 02:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lrwpK-0007vC-G9
 for qemu-arm@nongnu.org; Sat, 12 Jun 2021 02:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lrwpF-0005hO-Vs
 for qemu-arm@nongnu.org; Sat, 12 Jun 2021 02:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623478136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyAZ5dZPUaF5Cm7DUlxGTSGHq/ZwammdIdirmKksleY=;
 b=JEyJE/e/1c7FZJwO9U7BNS94PlWg9Hs+r+DcIsLNon51OsUCmNhbIrUcaGn1PjiK/S+jgX
 HnbaYjRU4HiHnoH7m1vUgDI/jw5r+EPtLvpmaRmJ0DU8eklpMhJmz+Aw72SUWmtjcQFm0V
 PDdJHzaV58e6geoEj5CdrFm/jptfgmY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-W0PUcWl-PrelNEURK_akCQ-1; Sat, 12 Jun 2021 02:08:54 -0400
X-MC-Unique: W0PUcWl-PrelNEURK_akCQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 t14-20020adfe44e0000b029011851efa802so3672876wrm.11
 for <qemu-arm@nongnu.org>; Fri, 11 Jun 2021 23:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qyAZ5dZPUaF5Cm7DUlxGTSGHq/ZwammdIdirmKksleY=;
 b=NxqJORSLWcU613IeUZ1i/1OyaFCFRg/iv3o5sgqQSXn49v2sH4X2+QNe/KSkcs44p1
 cjKD8LbEerF6lNyK4oS4f9OrQboyy66YrYJ1Sp/3Wb7grVCeCbzm2uqh7DmyjQahJVv1
 rFfeu61SkgbwAfGQdr2keH6F2ScQs6M+zSwjZiuSlSKn91equGBpaYSykPQIunbmN2k1
 sMBanilA1STjgTMWEIqywtQzIxvkGyvsCCQJRD9I0RdoLRjYiKk5b6m3LMUrXLtoSG/N
 S62iKYmGluNWytdx+85x1gO/NrVIe7Rwx7zZHaXCp623aaRzEjw4zgyA+IRSRdUGPJB+
 fnbg==
X-Gm-Message-State: AOAM532BmDqzaj/PftP/uMgFn9lGFUjRTK6NrAhGsOWdAlv2RTdbL3nb
 sY4rUwmm+XNXC17uL7KnLoLIH3ZjiLLEa++PhAh3fR2duxiISR39k6QmCvj8WHkpDTBYHUcdkRN
 /Zx6h4WDjsajf
X-Received: by 2002:a7b:c042:: with SMTP id u2mr6806799wmc.127.1623478133485; 
 Fri, 11 Jun 2021 23:08:53 -0700 (PDT)
X-Received: by 2002:a7b:c042:: with SMTP id u2mr6806775wmc.127.1623478133124; 
 Fri, 11 Jun 2021 23:08:53 -0700 (PDT)
Received: from [192.168.43.95] ([37.164.208.230])
 by smtp.gmail.com with ESMTPSA id z12sm10083525wmc.5.2021.06.11.23.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 23:08:52 -0700 (PDT)
Subject: Re: [PATCH v4 2/8] hw/intc: GICv3 ITS register definitions added
To: Shashi Mallela <shashi.mallela@linaro.org>, peter.maydell@linaro.org,
 leif@nuviainc.com, rad@semihalf.com
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-3-shashi.mallela@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <0fd86cf3-b83d-6e82-2894-f7b8d76537aa@redhat.com>
Date: Sat, 12 Jun 2021 08:08:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602180042.111347-3-shashi.mallela@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
X-TUID: E1ZMAgSnLRnr



On 6/2/21 8:00 PM, Shashi Mallela wrote:
> Defined descriptors for ITS device table,collection table and ITS
> command queue entities.Implemented register read/write functions,
> extract ITS table parameters and command queue parameters,extended
> gicv3 common to capture qemu address space(which host the ITS table
> platform memories required for subsequent ITS processing) and
> initialize the same in ITS device.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c                | 335 +++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h               |  28 ++-
>  include/hw/intc/arm_gicv3_common.h     |   3 +
>  include/hw/intc/arm_gicv3_its_common.h |  30 +++
>  4 files changed, 395 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 545cda3665..af60f19c98 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -28,6 +28,157 @@ struct GICv3ITSClass {
>      void (*parent_reset)(DeviceState *dev);
>  };
>  
> +static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
> +{
> +    uint64_t result = 0;
> +
> +    switch (page_sz) {
> +    case GITS_ITT_PAGE_SIZE_0:
> +    case GITS_ITT_PAGE_SIZE_1:
> +        result = value & R_GITS_BASER_PHYADDR_MASK;
Use FIELD_EX64 as well for homogeneity?
> +        break;
> +
> +    case GITS_ITT_PAGE_SIZE_2:
> +        result = value & R_GITS_BASER_PHYADDRL_64K_MASK;
here as well?
> +        result |= FIELD_EX64(value, GITS_BASER, PHYADDRH_64K) << 48;
> +        break;
> +
> +    default:
> +        break;
> +    }
> +    return result;
> +}
> +
> +static void extract_table_params(GICv3ITSState *s)
> +{
> +    uint16_t num_pages = 0;
> +    uint8_t  page_sz_type;
> +    uint8_t type;
> +    uint32_t page_sz = 0;
> +    uint64_t value;
> +
> +    for (int i = 0; i < 8; i++) {
> +        value = s->baser[i];
> +
> +        if (!value) {
> +            continue;
> +        }
> +
> +        page_sz_type = FIELD_EX64(value, GITS_BASER, PAGESIZE);
> +
> +        switch (page_sz_type) {
> +        case 0:
> +            page_sz = GITS_ITT_PAGE_SIZE_0;
> +            break;
> +
> +        case 1:
> +            page_sz = GITS_ITT_PAGE_SIZE_1;
> +            break;
> +
> +        case 2:
> +        case 3:
> +            page_sz = GITS_ITT_PAGE_SIZE_2;
> +            break;
> +
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        num_pages = FIELD_EX64(value, GITS_BASER, SIZE);
 + 1 directly? and remove num_pages + 1 below.
> +
> +        type = FIELD_EX64(value, GITS_BASER, TYPE);
> +
> +        switch (type) {
> +
> +        case GITS_ITT_TYPE_DEVICE:
> +            memset(&s->dt, 0 , sizeof(s->dt));
> +            s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
> +
> +            if (!s->dt.valid) {
> +                return;
> +            }
> +
> +            s->dt.page_sz = page_sz;
> +            s->dt.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
> +            s->dt.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
> +
> +            if (!s->dt.indirect) {
> +                s->dt.max_entries = ((num_pages + 1) * page_sz) /
> +                                     s->dt.entry_sz;
> +            } else {
> +                s->dt.max_entries = ((((num_pages + 1) * page_sz) /
> +                                     L1TABLE_ENTRY_SIZE) *
> +                                     (page_sz / s->dt.entry_sz));
> +            }
> +
> +            s->dt.max_devids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
> +                                DEVBITS) + 1));
> +
> +            s->dt.base_addr = baser_base_addr(value, page_sz);
> +
> +            break;
> +
> +        case GITS_ITT_TYPE_COLLECTION:
> +            memset(&s->ct, 0 , sizeof(s->ct));
> +            s->ct.valid = FIELD_EX64(value, GITS_BASER, VALID);
> +
> +            /*
> +             * GITS_TYPER.HCC is 0 for this implementation
> +             * hence writes are discarded if ct.valid is 0
> +             */
> +            if (!s->ct.valid) {
> +                return;
as this is an helper routine, I think it would be better to have this
check in the caller. Also you reset ct above.
> +            }
> +
> +            s->ct.page_sz = page_sz;
> +            s->ct.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
> +            s->ct.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
> +
> +            if (!s->ct.indirect) {
> +                s->ct.max_entries = ((num_pages + 1) * page_sz) /
> +                                     s->ct.entry_sz;
> +            } else {
> +                s->ct.max_entries = ((((num_pages + 1) * page_sz) /
> +                                     L1TABLE_ENTRY_SIZE) *
> +                                     (page_sz / s->ct.entry_sz));
> +            }
> +
> +            if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
> +                s->ct.max_collids = (1UL << (FIELD_EX64(s->typer,
> +                                     GITS_TYPER, CIDBITS) + 1));
> +            } else {
> +                /* 16-bit CollectionId supported when CIL == 0 */
> +                s->ct.max_collids = (1UL << 16);
> +            }
> +
> +            s->ct.base_addr = baser_base_addr(value, page_sz);
> +
> +            break;
> +
> +        default:
> +            break;
> +        }
> +    }
> +}
> +
> +static void extract_cmdq_params(GICv3ITSState *s)
> +{
> +    uint16_t num_pages = 0;
> +    uint64_t value = s->cbaser;
> +
> +    num_pages = FIELD_EX64(value, GITS_CBASER, SIZE);
+ 1
> +
> +    memset(&s->cq, 0 , sizeof(s->cq));
> +    s->cq.valid = FIELD_EX64(value, GITS_CBASER, VALID);
> +
> +    if (s->cq.valid) {
> +        s->cq.max_entries = ((num_pages + 1) * GITS_ITT_PAGE_SIZE_0) /
nit: use of GITS_ITT_PAGE_SIZE_0 is misleading as ITT stands for
interrupt translation table and does not relate to CMDQ. Use 4K define
instead.
> +                             GITS_CMDQ_ENTRY_SIZE;
> +        s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
> +        s->cq.base_addr <<= R_GITS_CBASER_PHYADDR_SHIFT;
> +    }
> +}
> +
>  static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
>                                                 uint64_t data, unsigned size,
>                                                 MemTxAttrs attrs)
> @@ -41,7 +192,73 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
>                                uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
>  
> +    switch (offset) {
> +    case GITS_CTLR:
> +        s->ctlr |= (value & ~(s->ctlr));
> +
> +        if (s->ctlr & ITS_CTLR_ENABLED) {
> +            extract_table_params(s);
> +            extract_cmdq_params(s);
> +            s->creadr = 0;
The KVM code also checks the he CBASER and
device/collection BASER are valid

To be further checked in subsequent patches:
- cache invalidation when turning off
- process commands if turned on?
- any cmd lock

> +        }
> +        break;
> +    case GITS_CBASER:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = deposit64(s->cbaser, 0, 32, value);
> +            s->creadr = 0;
> +        }
> +        break;
> +    case GITS_CBASER + 4:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = deposit64(s->cbaser, 32, 32, value);
you need to reset creadr here also

also CWRITER should be reset to CREADR.
KVM code comment:
/*
 * CWRITER is architecturally UNKNOWN on reset, but we need to reset
 * it to CREADR to make sure we start with an empty command buffer.
 */

> +        }> +        break;
> +    case GITS_CWRITER:
> +        s->cwriter = deposit64(s->cwriter, 0, 32,
> +                               (value & ~R_GITS_CWRITER_RETRY_MASK));
how do you implement the overflow case?
"If GITS_CWRITER is written with a value outside of the valid range
specified by
GITS_CBASER.Physical_Address and GITS_CBASER.Size, behavior is a
CONSTRAINED UNPREDICTABLE choice"
for info the KVM code does not write the actual reg

further check: process command?

> +        break;
> +    case GITS_CWRITER + 4:
> +        s->cwriter = deposit64(s->cwriter, 32, 32,
> +                               (value & ~R_GITS_CWRITER_RETRY_MASK));
> +        break;
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        /*
> +         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            index = (offset - GITS_BASER) / 8;
> +
> +            if (offset & 7) {
> +                s->baser[index] = deposit64(s->baser[index], 32, 32,
> +                                            (value & ~GITS_BASER_VAL_MASK));
> +            } else {
> +                s->baser[index] = deposit64(s->baser[index], 0, 32,
> +                                            (value & ~GITS_BASER_VAL_MASK));
> +            }
> +        }
> +        break;
> +    case GITS_IIDR:
> +    case GITS_IDREGS ... GITS_IDREGS + 0x2f:
> +        /* RO registers, ignore the write */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid guest write to RO register at offset "
> +                      TARGET_FMT_plx "\n", __func__, offset);
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>  
> @@ -49,7 +266,55 @@ static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
>                               uint64_t *data, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
>  
> +    switch (offset) {
> +    case GITS_CTLR:
> +        *data = s->ctlr;
> +        break;
> +    case GITS_IIDR:
> +        *data = gicv3_iidr();
> +        break;
> +    case GITS_IDREGS ... GITS_IDREGS + 0x2f:
> +        /* ID registers */
> +        *data = gicv3_idreg(offset - GITS_IDREGS);
I am not sure those are the same as the gicv3
on KVM we have
        case GITS_PIDR0:
                return 0x92;    /* part number, bits[7:0] */
        case GITS_PIDR1:
                return 0xb4;    /* part number, bits[11:8] */
        case GITS_PIDR2:
                return GIC_PIDR2_ARCH_GICv3 | 0x0b;
        case GITS_PIDR4:
                return 0x40;    /* This is a 64K software visible page */
        /* The following are the ID registers for (any) GIC. */
        case GITS_CIDR0:
                return 0x0d;
        case GITS_CIDR1:
                return 0xf0;
        case GITS_CIDR2:
                return 0x05;
        case GITS_CIDR3:
                return 0xb1;


> +        break;
> +    case GITS_TYPER:
> +        *data = extract64(s->typer, 0, 32);
> +        break;
> +    case GITS_TYPER + 4:
> +        *data = extract64(s->typer, 32, 32);
> +        break;
> +    case GITS_CBASER:
> +        *data = extract64(s->cbaser, 0, 32);
> +        break;
> +    case GITS_CBASER + 4:
> +        *data = extract64(s->cbaser, 32, 32);
> +        break;
> +    case GITS_CREADR:
> +        *data = extract64(s->creadr, 0, 32);
> +        break;
> +    case GITS_CREADR + 4:
> +        *data = extract64(s->creadr, 32, 32);
> +        break;
> +    case GITS_CWRITER:
> +        *data = extract64(s->cwriter, 0, 32);
> +        break;
> +    case GITS_CWRITER + 4:
> +        *data = extract64(s->cwriter, 32, 32);
> +        break;
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        index = (offset - GITS_BASER) / 8;
> +        if (offset & 7) {
> +            *data = extract64(s->baser[index], 32, 32);
> +        } else {
> +            *data = extract64(s->baser[index], 0, 32);
> +        }
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>  
> @@ -57,7 +322,42 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
>  
> +    switch (offset) {
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        /*
> +         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            index = (offset - GITS_BASER) / 8;
> +            s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);
> +        }
> +        break;
> +    case GITS_CBASER:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = value;
s->creadr = 0;
cwriter = creader?
> +        }
> +        break;
> +    case GITS_CWRITER:
> +        s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
> +        break;
> +    case GITS_CREADR:
RO if GICD_CTLR.DS = 0
On KVM side the write access is implemented
> +    case GITS_TYPER:
> +        /* RO registers, ignore the write */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid guest write to RO register at offset "
> +                      TARGET_FMT_plx "\n", __func__, offset);
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>  
> @@ -65,7 +365,29 @@ static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
>                                uint64_t *data, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
>  
> +    switch (offset) {
> +    case GITS_TYPER:
> +        *data = s->typer;
> +        break;
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        index = (offset - GITS_BASER) / 8;
> +        *data = s->baser[index];
> +        break;
> +    case GITS_CBASER:
> +        *data = s->cbaser;
> +        break;
> +    case GITS_CREADR:
> +        *data = s->creadr;
> +        break;
> +    case GITS_CWRITER:
> +        *data = s->cwriter;
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }
>  
> @@ -162,6 +484,9 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
>      gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
>  
>      if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> +        address_space_init(&s->gicv3->dma_as, s->gicv3->dma,
> +                           "gicv3-its-sysmem");
> +
>          /* set the ITS default features supported */
>          s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
>                                GITS_TYPE_PHYSICAL);
> @@ -208,6 +533,14 @@ static void gicv3_its_reset(DeviceState *dev)
>      }
>  }
>  
> +static void gicv3_its_post_load(GICv3ITSState *s)
> +{
> +    if (s->ctlr & ITS_CTLR_ENABLED) {
> +        extract_table_params(s);
> +        extract_cmdq_params(s);
> +    }
> +}
> +
>  static Property gicv3_its_props[] = {
>      DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-gicv3",
>                       GICv3State *),
> @@ -218,10 +551,12 @@ static void gicv3_its_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
> +    GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
>  
>      dc->realize = gicv3_arm_its_realize;
>      device_class_set_props(dc, gicv3_its_props);
>      device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset);
> +    icc->post_load = gicv3_its_post_load;
>  }
>  
>  static const TypeInfo gicv3_its_info = {
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index e0b06930a7..d6aaa94e4c 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -238,7 +238,7 @@ FIELD(GITS_BASER, PAGESIZE, 8, 2)
>  FIELD(GITS_BASER, SHAREABILITY, 10, 2)
>  FIELD(GITS_BASER, PHYADDR, 12, 36)
>  FIELD(GITS_BASER, PHYADDRL_64K, 16, 32)
> -FIELD(GITS_BASER, PHYADDRH_64K, 48, 4)
> +FIELD(GITS_BASER, PHYADDRH_64K, 12, 4)
>  FIELD(GITS_BASER, ENTRYSIZE, 48, 5)
>  FIELD(GITS_BASER, OUTERCACHE, 53, 3)
>  FIELD(GITS_BASER, TYPE, 56, 3)
> @@ -246,6 +246,17 @@ FIELD(GITS_BASER, INNERCACHE, 59, 3)
>  FIELD(GITS_BASER, INDIRECT, 62, 1)
>  FIELD(GITS_BASER, VALID, 63, 1)
>  
> +FIELD(GITS_CBASER, SIZE, 0, 8)
> +FIELD(GITS_CBASER, SHAREABILITY, 10, 2)
> +FIELD(GITS_CBASER, PHYADDR, 12, 40)
> +FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
> +FIELD(GITS_CBASER, INNERCACHE, 59, 3)
> +FIELD(GITS_CBASER, VALID, 63, 1)
> +
> +FIELD(GITS_CWRITER, RETRY, 0, 1)
> +FIELD(GITS_CWRITER, OFFSET, 5, 15)
> +
> +FIELD(GITS_CTLR, ENABLED, 0, 1)
>  FIELD(GITS_CTLR, QUIESCENT, 31, 1)
>  
>  FIELD(GITS_TYPER, PHYSICAL, 0, 1)
> @@ -257,6 +268,13 @@ FIELD(GITS_TYPER, PTA, 19, 1)
>  FIELD(GITS_TYPER, CIDBITS, 32, 4)
>  FIELD(GITS_TYPER, CIL, 36, 1)
>  
> +#define GITS_IDREGS           0xFFD0
> +
> +#define ITS_CTLR_ENABLED               (1U)  /* ITS Enabled */
> +
> +#define GITS_BASER_VAL_MASK                  (R_GITS_BASER_ENTRYSIZE_MASK | \
> +                                              R_GITS_BASER_TYPE_MASK)
> +
>  #define GITS_BASER_PAGESIZE_4K                0
>  #define GITS_BASER_PAGESIZE_16K               1
>  #define GITS_BASER_PAGESIZE_64K               2
> @@ -264,6 +282,14 @@ FIELD(GITS_TYPER, CIL, 36, 1)
>  #define GITS_ITT_TYPE_DEVICE                  1ULL
>  #define GITS_ITT_TYPE_COLLECTION              4ULL
>  
> +#define GITS_ITT_PAGE_SIZE_0      0x1000
> +#define GITS_ITT_PAGE_SIZE_1      0x4000
> +#define GITS_ITT_PAGE_SIZE_2      0x10000
Why not naming _4K 16K 64K instead of _0, 1, 2?
> +
> +#define L1TABLE_ENTRY_SIZE         8
> +
> +#define GITS_CMDQ_ENTRY_SIZE               32
> +
>  /**
>   * Default features advertised by this version of ITS
>   */
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 91491a2f66..1fd5cedbbd 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -226,6 +226,9 @@ struct GICv3State {
>      int dev_fd; /* kvm device fd if backed by kvm vgic support */
>      Error *migration_blocker;
>  
> +    MemoryRegion *dma;
> +    AddressSpace dma_as;
> +
>      /* Distributor */
>  
>      /* for a GIC with the security extensions the NS banked version of this
> diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
> index 65d1191db1..78b1ba7e6b 100644
> --- a/include/hw/intc/arm_gicv3_its_common.h
> +++ b/include/hw/intc/arm_gicv3_its_common.h
> @@ -41,6 +41,32 @@
>  
>  #define GITS_TRANSLATER  0x0040
>  
> +typedef struct {
> +    bool valid;
> +    bool indirect;
> +    uint16_t entry_sz;
> +    uint32_t page_sz;
> +    uint32_t max_entries;
> +    uint32_t max_devids;
> +    uint64_t base_addr;
> +} DevTableDesc;
> +
> +typedef struct {
> +    bool valid;
> +    bool indirect;
> +    uint16_t entry_sz;
> +    uint32_t page_sz;
> +    uint32_t max_entries;
> +    uint32_t max_collids;
> +    uint64_t base_addr;
> +} CollTableDesc;
> +
> +typedef struct {
> +    bool valid;
> +    uint32_t max_entries;
> +    uint64_t base_addr;
> +} CmdQDesc;> +
>  struct GICv3ITSState {
>      SysBusDevice parent_obj;
>  
> @@ -63,6 +89,10 @@ struct GICv3ITSState {
>      uint64_t creadr;
>      uint64_t baser[8];
>  
> +    DevTableDesc  dt;
> +    CollTableDesc ct;
> +    CmdQDesc      cq;
> +
>      Error *migration_blocker;
>  };
Thanks

Eric
>  
> 

