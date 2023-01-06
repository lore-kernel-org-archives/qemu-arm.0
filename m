Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp272873ejc;
        Fri, 6 Jan 2023 05:08:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs3gMVzxjWlMGyOTTQVEBxNyHXpgeozxXlWZYJdPV1l1YMuijvQxTRAD5v6PlxPiQPxbaPH
X-Received: by 2002:a05:622a:17cb:b0:3ab:5d98:99da with SMTP id u11-20020a05622a17cb00b003ab5d9899damr76785280qtk.68.1673010497650;
        Fri, 06 Jan 2023 05:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673010497; cv=none;
        d=google.com; s=arc-20160816;
        b=zVSLqt8iH1ePTkAgAoWZRXc3gMoFZsGQcF7FkRoSOOxalQISQVZIb4saCWdd751c6k
         UQubV0Ixm1QVR9GklemkoI3mADnlFOlNZtVpliWWb6AMOv/5RiNF8pbD+UaLuFzPo22R
         iyWicB9hx4K/gAAqkpLWLZygON4MPt9B5yn6j4R5bHN+PcBV67oVPt8zLb8h9mNQh0Tp
         BkqBC+IQ0QxI4tOeg3VCpn2aSWFSRowI1XvhYNdhYDXB3fs4GtCPbLU+KZG6QRE1iFeM
         T1z6Bu95X+rOh/eomjTIWY7KjmWLzke8ow/0/D/GVZsUWFqgNLuAWzhV8f/VLr5yIKn1
         Nezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kEJvntWPZyw28fOXC6OnP43XRq11mZZvqI4KebvkNb0=;
        b=HDVPZc7TLMETglhyYw4nxfz5SKcRCCcBFQn9SJMwIc7oisXdHGMe1K5Z8ktPxjpG1B
         38ghSr88NEmOAJwSO1V3uUP7QnRPGcNvZt8nMVI1/nXMLSDpYdDEa5eQYzICvHY3j8hy
         wr7PE4SPYqcn1dY5GPD19yvPkrfgLGFcS6+f0+F3eqR51v5ajuN2IbHVBgwQjBwZI+VT
         b3Mn3DEamtNdqEPe6/iL83KSMqa50ExdEz53gm0LEhtCq9juDWADNic8F9ey39TNs3lu
         otkKWMjQ/S9Z2PNxXAjYnZ5eI5LeFBiZ8/jG/2fFVh4UAK/0S8Rva94uTQu3AVKsEvr2
         aaTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DJZr7Jlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1-20020ac84141000000b003a6a7a6ac07si662344qtm.227.2023.01.06.05.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jan 2023 05:08:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DJZr7Jlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDmRr-0003RR-ID; Fri, 06 Jan 2023 08:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pDmRp-0003Qf-U4
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 08:07:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pDmRn-0005ka-Rz
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 08:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673010463;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kEJvntWPZyw28fOXC6OnP43XRq11mZZvqI4KebvkNb0=;
 b=DJZr7JlvFtIW3zNUR5DXwuF2klXED3wnbvJyOOwqCgCHOA89dDWu2TUCnT34ca2tVGEeex
 SjDmCJB1//Pz2CrnusVjRLKZNetL9YsVVA8MZJ7QnpJ3Htn9bQX+Vinwcq7Fzx+dKvXuxX
 2oi4TXn61Ih+DSJIPwNQV0BcKpNzMfc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-cNIiKKGaNM-qZJ84WfOsyA-1; Fri, 06 Jan 2023 08:07:43 -0500
X-MC-Unique: cNIiKKGaNM-qZJ84WfOsyA-1
Received: by mail-qv1-f72.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso745833qvu.12
 for <qemu-arm@nongnu.org>; Fri, 06 Jan 2023 05:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kEJvntWPZyw28fOXC6OnP43XRq11mZZvqI4KebvkNb0=;
 b=yS7dx+aLJ+T5WP6yAo3C0MpbS/mt+LuyZ7xQN1aRSr6Ol9NxnzbOccKi8wKRlylWGw
 uXuHpDLjphfvwV52LcqTxx1kNkjjxRPhRJYTAcrnh376NDMupqZ6g4txD8hBljjFQIqy
 CvtQP73OTjUOrqDLFt0rg6ZQsQAonEmwexcTdA0If56xDVlMCbX+t5NSfj2dDj8Tav0E
 d4id5t2rpAqA/rR2q/+vznJ4cx8RTCBeCqIkbQpWF766ONgGhsM/YYRUQ9blwNTakyHO
 ygEHDk8vCPNcKDmDmKns+eyii2bS1W88zc+4dAZ1rb+00dB0ndUbmeTotn782sK9iDxl
 O6BA==
X-Gm-Message-State: AFqh2krDsQ6Zg51tmRoJSQcl9WbyUNQXxwteoWkyCs4FBldk+g8ktfCA
 EsQPHk0/bGtdtCC7YKEZuqWX7cqcOWZ/mg243bnkLS/D5wHpmRw9pFeZ04+XO+yRYbuvy3qP7ku
 +S3Q2zxOhtYnB
X-Received: by 2002:ac8:5295:0:b0:3a8:fdf:8ff8 with SMTP id
 s21-20020ac85295000000b003a80fdf8ff8mr71711910qtn.36.1673010461857; 
 Fri, 06 Jan 2023 05:07:41 -0800 (PST)
X-Received: by 2002:ac8:5295:0:b0:3a8:fdf:8ff8 with SMTP id
 s21-20020ac85295000000b003a80fdf8ff8mr71711876qtn.36.1673010461428; 
 Fri, 06 Jan 2023 05:07:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 bi1-20020a05620a318100b007025753c4a5sm501397qkb.6.2023.01.06.05.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 05:07:40 -0800 (PST)
Message-ID: <e00838c0-8cd6-8fa0-8c88-d81c58ded8ab@redhat.com>
Date: Fri, 6 Jan 2023 14:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] hw/arm/smmuv3: Add GBPA register
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20221219125720.1369027-1-smostafa@google.com>
 <Y7VxFpoTjwNaolTG@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y7VxFpoTjwNaolTG@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6rDrSg4wWV1a

Hi Mostafan jean,

On 1/4/23 13:29, Jean-Philippe Brucker wrote:
> Hi Mostafa,
>
> On Mon, Dec 19, 2022 at 12:57:20PM +0000, Mostafa Saleh wrote:
>> GBPA register can be used to globally abort all
>> transactions.
>>
>> Only UPDATE and ABORT bits are considered in this patch.
> That's fair, although it effectively implements all bits since
> smmuv3_translate() ignores memory attributes anyway

I see SHCFG 0b00 value means non shareable whereas other reset values
correspond to "Use Incoming". Isn't it a bit weird? Is it better to have
"non shareable" or "Use Incoming" as de fault value (which is
IMPLEMENTATION DEFINED)
>
>> It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
>> ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
>> be zero(Do not abort incoming transactions).
>>
>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>> ---
>>  hw/arm/smmuv3-internal.h |  4 ++++
>>  hw/arm/smmuv3.c          | 14 ++++++++++++++
>>  include/hw/arm/smmuv3.h  |  1 +
>>  3 files changed, 19 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>> index bce161870f..71f70141e8 100644
>> --- a/hw/arm/smmuv3-internal.h
>> +++ b/hw/arm/smmuv3-internal.h
>> @@ -79,6 +79,10 @@ REG32(CR0ACK,              0x24)
>>  REG32(CR1,                 0x28)
>>  REG32(CR2,                 0x2c)
>>  REG32(STATUSR,             0x40)
>> +REG32(GBPA,                0x44)
>> +    FIELD(GBPA, ABORT,        20, 1)
>> +    FIELD(GBPA, UPDATE,       31, 1)
>> +
>>  REG32(IRQ_CTRL,            0x50)
>>      FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
>>      FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 955b89c8d5..2843bc3da9 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -285,6 +285,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>>      s->gerror = 0;
>>      s->gerrorn = 0;
>>      s->statusr = 0;
>> +    s->gbpa = 0;
>>  }
>>  
>>  static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
>> @@ -663,6 +664,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>          goto epilogue;
>>      }
>>  
>> +    if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
>> +        status = SMMU_TRANS_ABORT;
>> +        goto epilogue;
>> +    }
>> +
> GBPA is only taken into account when SMMU_CR0.SMMUEN is 0 (6.3.9.6 SMMUEN)
indeed "This register controls the global bypass attributes used for
transactions from Non-secure StreamIDs (as determined
by SSD, if supported) when SMMU_CR0.SMMUEN == 0"
>
>>      cfg = smmuv3_get_config(sdev, &event);
>>      if (!cfg) {
>>          status = SMMU_TRANS_ERROR;
>> @@ -1170,6 +1176,10 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>>      case A_GERROR_IRQ_CFG2:
>>          s->gerror_irq_cfg2 = data;
>>          return MEMTX_OK;
>> +    case A_GBPA:
>> +        /* Ignore update bit as write is synchronous. */
actually you immediataly reset the update bit and not really "ignore" it.
> We could also ignore a write that has Update=0, since that's required for
> SMMUv3.2+ implementations (6.3.14.1 Update procedure)
agreed:
"If this register is written without simultaneously setting Update to 1,
the effect is CONSTRAINED UNPREDICTABLE
and has one of the following behaviors:
• The write is IGNORED. This is the only permitted behavior in SMMUv3.2
and later."
>
>> +        s->gbpa = data & ~R_GBPA_UPDATE_MASK;
> Do we need to synchronize with concurrent transactions here?
> I couldn't find if QEMU already serializes MMIO writes and IOMMU
> translation.

my understanding is qemu_global_mutex also is enough. BQL usage was
discussed in
https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg02403.html
>
> "Transactions arriving at the SMMU after completion of a GPBA update are
> guaranteed to take the new attributes written." The guest tests completion
> by reading the Update bit:
>
> 	vCPU (host CPU 0)		Device thread (host CPU 1)
>
> 	(a) read GBPA.abort = 1
> 	(b) write GBPA.{update,abort} = {1,0}
> 	(c) read GBPA.update = 0
> 	(d) launch DMA			(e) execute DMA
> 					(f) translation must read GBPA.abort = 0
>
> I guess memory barriers after (b) and before (f) would ensure that. But I
> wonder if SMMUEN also needs additional synchronization, and in that case a
> rwlock would probably be simpler.
>
> Thanks,
> Jean
>
>> +        return MEMTX_OK;
>>      case A_STRTAB_BASE: /* 64b */
>>          s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
>>          return MEMTX_OK;
>> @@ -1318,6 +1328,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
>>      case A_STATUSR:
>>          *data = s->statusr;
>>          return MEMTX_OK;
>> +    case A_GBPA:
>> +        *data = s->gbpa;
>> +        return MEMTX_OK;
>>      case A_IRQ_CTRL:
>>      case A_IRQ_CTRL_ACK:
>>          *data = s->irq_ctrl;
>> @@ -1495,6 +1508,7 @@ static const VMStateDescription vmstate_smmuv3 = {
>>          VMSTATE_UINT32_ARRAY(cr, SMMUv3State, 3),
>>          VMSTATE_UINT32(cr0ack, SMMUv3State),
>>          VMSTATE_UINT32(statusr, SMMUv3State),
>> +        VMSTATE_UINT32(gbpa, SMMUv3State),
This will break migration (see
https://www.qemu.org/docs/master/devel/migration.html)
>>          VMSTATE_UINT32(irq_ctrl, SMMUv3State),
>>          VMSTATE_UINT32(gerror, SMMUv3State),
>>          VMSTATE_UINT32(gerrorn, SMMUv3State),
>> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
>> index f1921fdf9e..9899fa1860 100644
>> --- a/include/hw/arm/smmuv3.h
>> +++ b/include/hw/arm/smmuv3.h
>> @@ -46,6 +46,7 @@ struct SMMUv3State {
>>      uint32_t cr[3];
>>      uint32_t cr0ack;
>>      uint32_t statusr;
>> +    uint32_t gbpa;
>>      uint32_t irq_ctrl;
>>      uint32_t gerror;
>>      uint32_t gerrorn;
>> -- 
>> 2.39.0.314.g84b9a713c41-goog
>>
>>
Thanks

Eric

