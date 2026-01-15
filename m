Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EFAD41143
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 08:43:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgIx2-0005LJ-9p; Thu, 15 Jan 2026 03:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vgIx0-0005HO-1H
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 03:43:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vgIwx-000509-7b
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 03:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768466605;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7R/i8PSx6hkEYVtXAbLS4TG1LDEKBS4CWRWeDwI7Bk8=;
 b=PYxPXwSIPsJg4DfqeI2MEywqiCYZENwMrjBv9ylbloNoOB/wJkI+cJXXeQTe+pk5dQli1x
 n8mzVw8J2JHEn5qWK47PxW5Sy77M3SgKQTgerSPt1fxXDy2edvDHfc5W4aCfNiwwVYy5Xy
 wtSo6keURI6upxSZc8H+FTABwi3xXwo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-Xb-zG2kUPMWE6ds88_JeoQ-1; Thu, 15 Jan 2026 03:43:22 -0500
X-MC-Unique: Xb-zG2kUPMWE6ds88_JeoQ-1
X-Mimecast-MFC-AGG-ID: Xb-zG2kUPMWE6ds88_JeoQ_1768466601
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47d3c9b8c56so7942915e9.0
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 00:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768466601; x=1769071401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7R/i8PSx6hkEYVtXAbLS4TG1LDEKBS4CWRWeDwI7Bk8=;
 b=X80oe5Lj9dycS8QwJmyzsWXvgrWRWd6/q7SxTVf9+53xMucFuJTcGXBJ9NB7VJI+zg
 aQSE5+e0GzKu8Bn86dnNCB+xIyH7zK5WQZo9SHgBOD9mYFkpjUGCgObrKq14B3aJiOcO
 n2Pe9gIZMWLRvpKbXNBHMsUIqzAMAmi2KgvUeZZEYkmB8F+n9g1zifl/GUC0PHNFELCb
 YvQUohRHsQ/3rTQgHSvftYjiGhgwnCmxUYzIIYbh3PCX46QwNLRh/R/pmtOBrrFtajkw
 vs88241Tg6ZQacivpG98fhrZstu2bPS/pXSLYgChxFcgPbrS5MCRImVQQsPmJq1AynA2
 j7Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWi4hsc335dIcHlJNhAPXOFPmI4uiyXNvJX8kUPxPp7s1L9Sn1vkDNvQJljxEdifExwnhXYf/QAg==@nongnu.org
X-Gm-Message-State: AOJu0YzoSJedpg77WuDgeWGhnibisbgT0DOOe+kdpnL8KI1TJOJfEn99
 eDHY8qveAEC+uP6zhzDZUMoF7w8DRHDZ5VnI58eVAMaJ+OvHufyTfto9ZyjBIWtONm/v+SYRtoo
 pmf3BbQIHiqLiuQHVNGfveUTBWXnGgWrw5WhZiGZQtxxBqP41gBavGw==
X-Gm-Gg: AY/fxX4c+CtmgEk1AqNA4iiqrBZmyGlbEjMwv0kXkcQ4bP9i2jGMt3ZLfdsGzbKwEyg
 QA9wVSTVVntTXhZItq+fSng1yE0BNgUhQpcQyEiJGp5B//LTdizuRpgQNRp8XUJEI+QAL9bYR+v
 7aaw560uIkurymY5MUwYqMjUpLufm9y99mG1OIj4N7aIfXHK2HBgS/t3cmqNNxjIiEfdWkNpZ2n
 2NOvflNjm86V8ECSBnj/q9YFIgDSfBicKxhrX6Tu8bXqR61pjCg8FyJXq2D1iN78OFHBSXXvF3A
 6es1FffCQ/Vc5kN94ytVnKDcWY9XNpYigTUnm9CTcC8AormaVQN1ugUtxpGeBC+mxL01yoxoQG/
 uzGzuN7QOH45EHsa/21/rgMuZE3rjM60w+FyvwED98b6Zig5ejnz9qLtaxw==
X-Received: by 2002:a05:600c:a415:b0:47e:e779:36e with SMTP id
 5b1f17b1804b1-47ee7790531mr43397475e9.19.1768466601281; 
 Thu, 15 Jan 2026 00:43:21 -0800 (PST)
X-Received: by 2002:a05:600c:a415:b0:47e:e779:36e with SMTP id
 5b1f17b1804b1-47ee7790531mr43397085e9.19.1768466600814; 
 Thu, 15 Jan 2026 00:43:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6e09acsm4361880f8f.35.2026.01.15.00.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 00:43:20 -0800 (PST)
Message-ID: <f28112f7-5f54-4fa5-92b9-9e391e6630f2@redhat.com>
Date: Thu, 15 Jan 2026 09:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 1/7] hw/arm/smmuv3: Extract common definitions to
 smmuv3-common.h
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251224034647.2596434-1-tangtao1634@phytium.com.cn>
 <20251224034647.2596434-2-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251224034647.2596434-2-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kSg7XEtf2NA3zkmrNH7dHbrW-aeY8MpL4-wgpnn1YK4_1768466601
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 12/24/25 4:46 AM, Tao Tang wrote:
> Move register definitions, command enums, and Stream Table Entry (STE) /
> Context Descriptor (CD) structure definitions from the internal header
> hw/arm/smmuv3-internal.h to a new common header
> include/hw/arm/smmuv3-common.h.
>
> This allows other components, such as generic SMMUv3 tests or test devices,
> to utilize these definitions without including the specific SMMUv3 device
> internal state.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3-internal.h       | 255 +------------------------------
>  include/hw/arm/smmuv3-common.h | 268 +++++++++++++++++++++++++++++++++
>  2 files changed, 269 insertions(+), 254 deletions(-)
>  create mode 100644 include/hw/arm/smmuv3-common.h
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index b6b7399347..8679ab6d09 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -23,6 +23,7 @@
>  
>  #include "hw/registerfields.h"
>  #include "hw/arm/smmu-common.h"
> +#include "hw/arm/smmuv3-common.h"
>  
>  typedef enum SMMUTranslationStatus {
>      SMMU_TRANS_DISABLE,
> @@ -38,147 +39,6 @@ typedef enum SMMUTranslationClass {
>      SMMU_CLASS_IN,
>  } SMMUTranslationClass;
>  
> -/* MMIO Registers */
> -
> -REG32(IDR0,                0x0)
> -    FIELD(IDR0, S2P,         0 , 1)
> -    FIELD(IDR0, S1P,         1 , 1)
> -    FIELD(IDR0, TTF,         2 , 2)
> -    FIELD(IDR0, COHACC,      4 , 1)
> -    FIELD(IDR0, BTM,         5 , 1)
> -    FIELD(IDR0, HTTU,        6 , 2)
> -    FIELD(IDR0, DORMHINT,    8 , 1)
> -    FIELD(IDR0, HYP,         9 , 1)
> -    FIELD(IDR0, ATS,         10, 1)
> -    FIELD(IDR0, NS1ATS,      11, 1)
> -    FIELD(IDR0, ASID16,      12, 1)
> -    FIELD(IDR0, MSI,         13, 1)
> -    FIELD(IDR0, SEV,         14, 1)
> -    FIELD(IDR0, ATOS,        15, 1)
> -    FIELD(IDR0, PRI,         16, 1)
> -    FIELD(IDR0, VMW,         17, 1)
> -    FIELD(IDR0, VMID16,      18, 1)
> -    FIELD(IDR0, CD2L,        19, 1)
> -    FIELD(IDR0, VATOS,       20, 1)
> -    FIELD(IDR0, TTENDIAN,    21, 2)
> -    FIELD(IDR0, ATSRECERR,   23, 1)
> -    FIELD(IDR0, STALL_MODEL, 24, 2)
> -    FIELD(IDR0, TERM_MODEL,  26, 1)
> -    FIELD(IDR0, STLEVEL,     27, 2)
> -    FIELD(IDR0, RME_IMPL,    30, 1)
> -
> -REG32(IDR1,                0x4)
> -    FIELD(IDR1, SIDSIZE,      0 , 6)
> -    FIELD(IDR1, SSIDSIZE,     6 , 5)
> -    FIELD(IDR1, PRIQS,        11, 5)
> -    FIELD(IDR1, EVENTQS,      16, 5)
> -    FIELD(IDR1, CMDQS,        21, 5)
> -    FIELD(IDR1, ATTR_PERMS_OVR, 26, 1)
> -    FIELD(IDR1, ATTR_TYPES_OVR, 27, 1)
> -    FIELD(IDR1, REL,          28, 1)
> -    FIELD(IDR1, QUEUES_PRESET, 29, 1)
> -    FIELD(IDR1, TABLES_PRESET, 30, 1)
> -    FIELD(IDR1, ECMDQ,        31, 1)
> -
> -#define SMMU_IDR1_SIDSIZE 16
> -#define SMMU_CMDQS   19
> -#define SMMU_EVENTQS 19
> -
> -REG32(IDR2,                0x8)
> -     FIELD(IDR2, BA_VATOS, 0, 10)
> -
> -REG32(IDR3,                0xc)
> -     FIELD(IDR3, HAD,         2, 1);
> -     FIELD(IDR3, PBHA,        3, 1);
> -     FIELD(IDR3, XNX,         4, 1);
> -     FIELD(IDR3, PPS,         5, 1);
> -     FIELD(IDR3, MPAM,        7, 1);
> -     FIELD(IDR3, FWB,         8, 1);
> -     FIELD(IDR3, STT,         9, 1);
> -     FIELD(IDR3, RIL,        10, 1);
> -     FIELD(IDR3, BBML,       11, 2);
> -     FIELD(IDR3, E0PD,       13, 1);
> -     FIELD(IDR3, PTWNNC,     14, 1);
> -     FIELD(IDR3, DPT,        15, 1);
> -
> -REG32(IDR4,                0x10)
> -
> -REG32(IDR5,                0x14)
> -     FIELD(IDR5, OAS,         0, 3);
> -     FIELD(IDR5, GRAN4K,      4, 1);
> -     FIELD(IDR5, GRAN16K,     5, 1);
> -     FIELD(IDR5, GRAN64K,     6, 1);
> -     FIELD(IDR5, VAX,        10, 2);
> -     FIELD(IDR5, STALL_MAX,  16, 16);
> -
> -#define SMMU_IDR5_OAS 4
> -
> -REG32(IIDR,                0x18)
> -REG32(AIDR,                0x1c)
> -REG32(CR0,                 0x20)
> -    FIELD(CR0, SMMU_ENABLE,   0, 1)
> -    FIELD(CR0, EVENTQEN,      2, 1)
> -    FIELD(CR0, CMDQEN,        3, 1)
> -
> -#define SMMU_CR0_RESERVED 0xFFFFFC20
> -
> -REG32(CR0ACK,              0x24)
> -REG32(CR1,                 0x28)
> -REG32(CR2,                 0x2c)
> -REG32(STATUSR,             0x40)
> -REG32(GBPA,                0x44)
> -    FIELD(GBPA, ABORT,        20, 1)
> -    FIELD(GBPA, UPDATE,       31, 1)
> -
> -/* Use incoming. */
> -#define SMMU_GBPA_RESET_VAL 0x1000
> -
> -REG32(IRQ_CTRL,            0x50)
> -    FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
> -    FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
> -    FIELD(IRQ_CTRL, EVENTQ_IRQEN,        2, 1)
> -
> -REG32(IRQ_CTRL_ACK,        0x54)
> -REG32(GERROR,              0x60)
> -    FIELD(GERROR, CMDQ_ERR,           0, 1)
> -    FIELD(GERROR, EVENTQ_ABT_ERR,     2, 1)
> -    FIELD(GERROR, PRIQ_ABT_ERR,       3, 1)
> -    FIELD(GERROR, MSI_CMDQ_ABT_ERR,   4, 1)
> -    FIELD(GERROR, MSI_EVENTQ_ABT_ERR, 5, 1)
> -    FIELD(GERROR, MSI_PRIQ_ABT_ERR,   6, 1)
> -    FIELD(GERROR, MSI_GERROR_ABT_ERR, 7, 1)
> -    FIELD(GERROR, MSI_SFM_ERR,        8, 1)
> -
> -REG32(GERRORN,             0x64)
> -
> -#define A_GERROR_IRQ_CFG0  0x68 /* 64b */
> -REG32(GERROR_IRQ_CFG1, 0x70)
> -REG32(GERROR_IRQ_CFG2, 0x74)
> -
> -#define A_STRTAB_BASE      0x80 /* 64b */
> -
> -#define SMMU_BASE_ADDR_MASK 0xfffffffffffc0
> -
> -REG32(STRTAB_BASE_CFG,     0x88)
> -    FIELD(STRTAB_BASE_CFG, FMT,      16, 2)
> -    FIELD(STRTAB_BASE_CFG, SPLIT,    6 , 5)
> -    FIELD(STRTAB_BASE_CFG, LOG2SIZE, 0 , 6)
> -
> -#define A_CMDQ_BASE        0x90 /* 64b */
> -REG32(CMDQ_PROD,           0x98)
> -REG32(CMDQ_CONS,           0x9c)
> -    FIELD(CMDQ_CONS, ERR, 24, 7)
> -
> -#define A_EVENTQ_BASE      0xa0 /* 64b */
> -REG32(EVENTQ_PROD,         0xa8)
> -REG32(EVENTQ_CONS,         0xac)
> -
> -#define A_EVENTQ_IRQ_CFG0  0xb0 /* 64b */
> -REG32(EVENTQ_IRQ_CFG1,     0xb8)
> -REG32(EVENTQ_IRQ_CFG2,     0xbc)
> -
> -#define A_IDREGS           0xfd0
> -
>  static inline int smmu_enabled(SMMUv3State *s)
>  {
>      return FIELD_EX32(s->cr[0], CR0, SMMU_ENABLE);
> @@ -272,37 +132,6 @@ static inline void smmu_write_cmdq_err(SMMUv3State *s, uint32_t err_type)
>      s->cmdq.cons = FIELD_DP32(s->cmdq.cons, CMDQ_CONS, ERR, err_type);
>  }
>  
> -/* Commands */
> -
> -typedef enum SMMUCommandType {
> -    SMMU_CMD_NONE            = 0x00,
> -    SMMU_CMD_PREFETCH_CONFIG       ,
> -    SMMU_CMD_PREFETCH_ADDR,
> -    SMMU_CMD_CFGI_STE,
> -    SMMU_CMD_CFGI_STE_RANGE,
> -    SMMU_CMD_CFGI_CD,
> -    SMMU_CMD_CFGI_CD_ALL,
> -    SMMU_CMD_CFGI_ALL,
> -    SMMU_CMD_TLBI_NH_ALL     = 0x10,
> -    SMMU_CMD_TLBI_NH_ASID,
> -    SMMU_CMD_TLBI_NH_VA,
> -    SMMU_CMD_TLBI_NH_VAA,
> -    SMMU_CMD_TLBI_EL3_ALL    = 0x18,
> -    SMMU_CMD_TLBI_EL3_VA     = 0x1a,
> -    SMMU_CMD_TLBI_EL2_ALL    = 0x20,
> -    SMMU_CMD_TLBI_EL2_ASID,
> -    SMMU_CMD_TLBI_EL2_VA,
> -    SMMU_CMD_TLBI_EL2_VAA,
> -    SMMU_CMD_TLBI_S12_VMALL  = 0x28,
> -    SMMU_CMD_TLBI_S2_IPA     = 0x2a,
> -    SMMU_CMD_TLBI_NSNH_ALL   = 0x30,
> -    SMMU_CMD_ATC_INV         = 0x40,
> -    SMMU_CMD_PRI_RESP,
> -    SMMU_CMD_RESUME          = 0x44,
> -    SMMU_CMD_STALL_TERM,
> -    SMMU_CMD_SYNC,
> -} SMMUCommandType;
> -
>  static const char *cmd_stringify[] = {
>      [SMMU_CMD_PREFETCH_CONFIG] = "SMMU_CMD_PREFETCH_CONFIG",
>      [SMMU_CMD_PREFETCH_ADDR]   = "SMMU_CMD_PREFETCH_ADDR",
> @@ -525,64 +354,6 @@ typedef struct SMMUEventInfo {
>  
>  void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *event);
>  
> -/* Configuration Data */
> -
> -/* STE Level 1 Descriptor */
> -typedef struct STEDesc {
> -    uint32_t word[2];
> -} STEDesc;
> -
> -/* CD Level 1 Descriptor */
> -typedef struct CDDesc {
> -    uint32_t word[2];
> -} CDDesc;
> -
> -/* Stream Table Entry(STE) */
> -typedef struct STE {
> -    uint32_t word[16];
> -} STE;
> -
> -/* Context Descriptor(CD) */
> -typedef struct CD {
> -    uint32_t word[16];
> -} CD;
> -
> -/* STE fields */
> -
> -#define STE_VALID(x)   extract32((x)->word[0], 0, 1)
> -
> -#define STE_CONFIG(x)  extract32((x)->word[0], 1, 3)
> -#define STE_CFG_S1_ENABLED(config) (config & 0x1)
> -#define STE_CFG_S2_ENABLED(config) (config & 0x2)
> -#define STE_CFG_ABORT(config)      (!(config & 0x4))
> -#define STE_CFG_BYPASS(config)     (config == 0x4)
> -
> -#define STE_S1FMT(x)       extract32((x)->word[0], 4 , 2)
> -#define STE_S1CDMAX(x)     extract32((x)->word[1], 27, 5)
> -#define STE_S1STALLD(x)    extract32((x)->word[2], 27, 1)
> -#define STE_EATS(x)        extract32((x)->word[2], 28, 2)
> -#define STE_STRW(x)        extract32((x)->word[2], 30, 2)
> -#define STE_S2VMID(x)      extract32((x)->word[4], 0 , 16)
> -#define STE_S2T0SZ(x)      extract32((x)->word[5], 0 , 6)
> -#define STE_S2SL0(x)       extract32((x)->word[5], 6 , 2)
> -#define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
> -#define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
> -#define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
> -#define STE_S2ENDI(x)      extract32((x)->word[5], 20, 1)
> -#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
> -#define STE_S2HD(x)        extract32((x)->word[5], 23, 1)
> -#define STE_S2HA(x)        extract32((x)->word[5], 24, 1)
> -#define STE_S2S(x)         extract32((x)->word[5], 25, 1)
> -#define STE_S2R(x)         extract32((x)->word[5], 26, 1)
> -
> -#define STE_CTXPTR(x)                                   \
> -    ((extract64((x)->word[1], 0, 16) << 32) |           \
> -     ((x)->word[0] & 0xffffffc0))
> -
> -#define STE_S2TTB(x)                                    \
> -    ((extract64((x)->word[7], 0, 16) << 32) |           \
> -     ((x)->word[6] & 0xfffffff0))
> -
>  static inline int oas2bits(int oas_field)
>  {
>      switch (oas_field) {
> @@ -603,30 +374,6 @@ static inline int oas2bits(int oas_field)
>      g_assert_not_reached();
>  }
>  
> -/* CD fields */
> -
> -#define CD_VALID(x)   extract32((x)->word[0], 31, 1)
> -#define CD_ASID(x)    extract32((x)->word[1], 16, 16)
> -#define CD_TTB(x, sel)                                          \
> -    ((extract64((x)->word[(sel) * 2 + 3], 0, 19) << 32) |       \
> -     ((x)->word[(sel) * 2 + 2] & ~0xfULL))
> -
> -#define CD_HAD(x, sel)   extract32((x)->word[(sel) * 2 + 2], 1, 1)
> -
> -#define CD_TSZ(x, sel)   extract32((x)->word[0], (16 * (sel)) + 0, 6)
> -#define CD_TG(x, sel)    extract32((x)->word[0], (16 * (sel)) + 6, 2)
> -#define CD_EPD(x, sel)   extract32((x)->word[0], (16 * (sel)) + 14, 1)
> -#define CD_ENDI(x)       extract32((x)->word[0], 15, 1)
> -#define CD_IPS(x)        extract32((x)->word[1], 0 , 3)
> -#define CD_AFFD(x)       extract32((x)->word[1], 3 , 1)
> -#define CD_TBI(x)        extract32((x)->word[1], 6 , 2)
> -#define CD_HD(x)         extract32((x)->word[1], 10 , 1)
> -#define CD_HA(x)         extract32((x)->word[1], 11 , 1)
> -#define CD_S(x)          extract32((x)->word[1], 12, 1)
> -#define CD_R(x)          extract32((x)->word[1], 13, 1)
> -#define CD_A(x)          extract32((x)->word[1], 14, 1)
> -#define CD_AARCH64(x)    extract32((x)->word[1], 9 , 1)
> -
>  /**
>   * tg2granule - Decodes the CD translation granule size field according
>   * to the ttbr in use
> diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3-common.h
> new file mode 100644
> index 0000000000..9da817f41a
> --- /dev/null
> +++ b/include/hw/arm/smmuv3-common.h
> @@ -0,0 +1,268 @@
> +/*
> + * ARM SMMUv3 support - Common API
> + *
> + * Copyright (C) 2014-2016 Broadcom Corporation
> + * Copyright (c) 2017 Red Hat, Inc.
> + * Written by Prem Mallappa, Eric Auger
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_ARM_SMMUV3_COMMON_H
> +#define HW_ARM_SMMUV3_COMMON_H
> +
> +/* Configuration Data */
> +
> +/* STE Level 1 Descriptor */
> +typedef struct STEDesc {
> +    uint32_t word[2];
> +} STEDesc;
> +
> +/* CD Level 1 Descriptor */
> +typedef struct CDDesc {
> +    uint32_t word[2];
> +} CDDesc;
> +
> +/* Stream Table Entry(STE) */
> +typedef struct STE {
> +    uint32_t word[16];
> +} STE;
> +
> +/* Context Descriptor(CD) */
> +typedef struct CD {
> +    uint32_t word[16];
> +} CD;
> +
> +/* STE fields */
> +
> +#define STE_VALID(x)   extract32((x)->word[0], 0, 1)
> +
> +#define STE_CONFIG(x)  extract32((x)->word[0], 1, 3)
> +#define STE_CFG_S1_ENABLED(config) (config & 0x1)
> +#define STE_CFG_S2_ENABLED(config) (config & 0x2)
> +#define STE_CFG_ABORT(config)      (!(config & 0x4))
> +#define STE_CFG_BYPASS(config)     (config == 0x4)
> +
> +#define STE_S1FMT(x)       extract32((x)->word[0], 4 , 2)
> +#define STE_S1CDMAX(x)     extract32((x)->word[1], 27, 5)
> +#define STE_S1STALLD(x)    extract32((x)->word[2], 27, 1)
> +#define STE_EATS(x)        extract32((x)->word[2], 28, 2)
> +#define STE_STRW(x)        extract32((x)->word[2], 30, 2)
> +#define STE_S2VMID(x)      extract32((x)->word[4], 0 , 16)
> +#define STE_S2T0SZ(x)      extract32((x)->word[5], 0 , 6)
> +#define STE_S2SL0(x)       extract32((x)->word[5], 6 , 2)
> +#define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
> +#define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
> +#define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
> +#define STE_S2ENDI(x)      extract32((x)->word[5], 20, 1)
> +#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
> +#define STE_S2HD(x)        extract32((x)->word[5], 23, 1)
> +#define STE_S2HA(x)        extract32((x)->word[5], 24, 1)
> +#define STE_S2S(x)         extract32((x)->word[5], 25, 1)
> +#define STE_S2R(x)         extract32((x)->word[5], 26, 1)
> +
> +#define STE_CTXPTR(x)                                   \
> +    ((extract64((x)->word[1], 0, 16) << 32) |           \
> +     ((x)->word[0] & 0xffffffc0))
> +
> +#define STE_S2TTB(x)                                    \
> +    ((extract64((x)->word[7], 0, 16) << 32) |           \
> +     ((x)->word[6] & 0xfffffff0))
> +
> +/* CD fields */
> +
> +#define CD_VALID(x)   extract32((x)->word[0], 31, 1)
> +#define CD_ASID(x)    extract32((x)->word[1], 16, 16)
> +#define CD_TTB(x, sel)                                          \
> +    ((extract64((x)->word[(sel) * 2 + 3], 0, 19) << 32) |       \
> +     ((x)->word[(sel) * 2 + 2] & ~0xfULL))
> +
> +#define CD_HAD(x, sel)   extract32((x)->word[(sel) * 2 + 2], 1, 1)
> +
> +#define CD_TSZ(x, sel)   extract32((x)->word[0], (16 * (sel)) + 0, 6)
> +#define CD_TG(x, sel)    extract32((x)->word[0], (16 * (sel)) + 6, 2)
> +#define CD_EPD(x, sel)   extract32((x)->word[0], (16 * (sel)) + 14, 1)
> +#define CD_ENDI(x)       extract32((x)->word[0], 15, 1)
> +#define CD_IPS(x)        extract32((x)->word[1], 0 , 3)
> +#define CD_AFFD(x)       extract32((x)->word[1], 3 , 1)
> +#define CD_TBI(x)        extract32((x)->word[1], 6 , 2)
> +#define CD_HD(x)         extract32((x)->word[1], 10 , 1)
> +#define CD_HA(x)         extract32((x)->word[1], 11 , 1)
> +#define CD_S(x)          extract32((x)->word[1], 12, 1)
> +#define CD_R(x)          extract32((x)->word[1], 13, 1)
> +#define CD_A(x)          extract32((x)->word[1], 14, 1)
> +#define CD_AARCH64(x)    extract32((x)->word[1], 9 , 1)
> +
> +/* MMIO Registers */
> +
> +REG32(IDR0,                0x0)
> +    FIELD(IDR0, S2P,         0 , 1)
> +    FIELD(IDR0, S1P,         1 , 1)
> +    FIELD(IDR0, TTF,         2 , 2)
> +    FIELD(IDR0, COHACC,      4 , 1)
> +    FIELD(IDR0, BTM,         5 , 1)
> +    FIELD(IDR0, HTTU,        6 , 2)
> +    FIELD(IDR0, DORMHINT,    8 , 1)
> +    FIELD(IDR0, HYP,         9 , 1)
> +    FIELD(IDR0, ATS,         10, 1)
> +    FIELD(IDR0, NS1ATS,      11, 1)
> +    FIELD(IDR0, ASID16,      12, 1)
> +    FIELD(IDR0, MSI,         13, 1)
> +    FIELD(IDR0, SEV,         14, 1)
> +    FIELD(IDR0, ATOS,        15, 1)
> +    FIELD(IDR0, PRI,         16, 1)
> +    FIELD(IDR0, VMW,         17, 1)
> +    FIELD(IDR0, VMID16,      18, 1)
> +    FIELD(IDR0, CD2L,        19, 1)
> +    FIELD(IDR0, VATOS,       20, 1)
> +    FIELD(IDR0, TTENDIAN,    21, 2)
> +    FIELD(IDR0, ATSRECERR,   23, 1)
> +    FIELD(IDR0, STALL_MODEL, 24, 2)
> +    FIELD(IDR0, TERM_MODEL,  26, 1)
> +    FIELD(IDR0, STLEVEL,     27, 2)
> +    FIELD(IDR0, RME_IMPL,    30, 1)
> +
> +REG32(IDR1,                0x4)
> +    FIELD(IDR1, SIDSIZE,      0 , 6)
> +    FIELD(IDR1, SSIDSIZE,     6 , 5)
> +    FIELD(IDR1, PRIQS,        11, 5)
> +    FIELD(IDR1, EVENTQS,      16, 5)
> +    FIELD(IDR1, CMDQS,        21, 5)
> +    FIELD(IDR1, ATTR_PERMS_OVR, 26, 1)
> +    FIELD(IDR1, ATTR_TYPES_OVR, 27, 1)
> +    FIELD(IDR1, REL,          28, 1)
> +    FIELD(IDR1, QUEUES_PRESET, 29, 1)
> +    FIELD(IDR1, TABLES_PRESET, 30, 1)
> +    FIELD(IDR1, ECMDQ,        31, 1)
> +
> +#define SMMU_IDR1_SIDSIZE 16
> +#define SMMU_CMDQS   19
> +#define SMMU_EVENTQS 19
> +
> +REG32(IDR2,                0x8)
> +     FIELD(IDR2, BA_VATOS, 0, 10)
> +
> +REG32(IDR3,                0xc)
> +     FIELD(IDR3, HAD,         2, 1);
> +     FIELD(IDR3, PBHA,        3, 1);
> +     FIELD(IDR3, XNX,         4, 1);
> +     FIELD(IDR3, PPS,         5, 1);
> +     FIELD(IDR3, MPAM,        7, 1);
> +     FIELD(IDR3, FWB,         8, 1);
> +     FIELD(IDR3, STT,         9, 1);
> +     FIELD(IDR3, RIL,        10, 1);
> +     FIELD(IDR3, BBML,       11, 2);
> +     FIELD(IDR3, E0PD,       13, 1);
> +     FIELD(IDR3, PTWNNC,     14, 1);
> +     FIELD(IDR3, DPT,        15, 1);
> +
> +REG32(IDR4,                0x10)
> +
> +REG32(IDR5,                0x14)
> +     FIELD(IDR5, OAS,         0, 3);
> +     FIELD(IDR5, GRAN4K,      4, 1);
> +     FIELD(IDR5, GRAN16K,     5, 1);
> +     FIELD(IDR5, GRAN64K,     6, 1);
> +     FIELD(IDR5, VAX,        10, 2);
> +     FIELD(IDR5, STALL_MAX,  16, 16);
> +
> +#define SMMU_IDR5_OAS 4
> +
> +REG32(IIDR,                0x18)
> +REG32(AIDR,                0x1c)
> +REG32(CR0,                 0x20)
> +    FIELD(CR0, SMMU_ENABLE,   0, 1)
> +    FIELD(CR0, EVENTQEN,      2, 1)
> +    FIELD(CR0, CMDQEN,        3, 1)
> +
> +#define SMMU_CR0_RESERVED 0xFFFFFC20
> +
> +REG32(CR0ACK,              0x24)
> +REG32(CR1,                 0x28)
> +REG32(CR2,                 0x2c)
> +REG32(STATUSR,             0x40)
> +REG32(GBPA,                0x44)
> +    FIELD(GBPA, ABORT,        20, 1)
> +    FIELD(GBPA, UPDATE,       31, 1)
> +
> +/* Use incoming. */
> +#define SMMU_GBPA_RESET_VAL 0x1000
> +
> +REG32(IRQ_CTRL,            0x50)
> +    FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
> +    FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
> +    FIELD(IRQ_CTRL, EVENTQ_IRQEN,        2, 1)
> +
> +REG32(IRQ_CTRL_ACK,        0x54)
> +REG32(GERROR,              0x60)
> +    FIELD(GERROR, CMDQ_ERR,           0, 1)
> +    FIELD(GERROR, EVENTQ_ABT_ERR,     2, 1)
> +    FIELD(GERROR, PRIQ_ABT_ERR,       3, 1)
> +    FIELD(GERROR, MSI_CMDQ_ABT_ERR,   4, 1)
> +    FIELD(GERROR, MSI_EVENTQ_ABT_ERR, 5, 1)
> +    FIELD(GERROR, MSI_PRIQ_ABT_ERR,   6, 1)
> +    FIELD(GERROR, MSI_GERROR_ABT_ERR, 7, 1)
> +    FIELD(GERROR, MSI_SFM_ERR,        8, 1)
> +
> +REG32(GERRORN,             0x64)
> +
> +#define A_GERROR_IRQ_CFG0  0x68 /* 64b */
> +REG32(GERROR_IRQ_CFG1, 0x70)
> +REG32(GERROR_IRQ_CFG2, 0x74)
> +
> +#define A_STRTAB_BASE      0x80 /* 64b */
> +
> +#define SMMU_BASE_ADDR_MASK 0xfffffffffffc0
> +
> +REG32(STRTAB_BASE_CFG,     0x88)
> +    FIELD(STRTAB_BASE_CFG, FMT,      16, 2)
> +    FIELD(STRTAB_BASE_CFG, SPLIT,    6 , 5)
> +    FIELD(STRTAB_BASE_CFG, LOG2SIZE, 0 , 6)
> +
> +#define A_CMDQ_BASE        0x90 /* 64b */
> +REG32(CMDQ_PROD,           0x98)
> +REG32(CMDQ_CONS,           0x9c)
> +    FIELD(CMDQ_CONS, ERR, 24, 7)
> +
> +#define A_EVENTQ_BASE      0xa0 /* 64b */
> +REG32(EVENTQ_PROD,         0xa8)
> +REG32(EVENTQ_CONS,         0xac)
> +
> +#define A_EVENTQ_IRQ_CFG0  0xb0 /* 64b */
> +REG32(EVENTQ_IRQ_CFG1,     0xb8)
> +REG32(EVENTQ_IRQ_CFG2,     0xbc)
> +
> +#define A_IDREGS           0xfd0
> +
> +/* Commands */
> +
> +typedef enum SMMUCommandType {
> +    SMMU_CMD_NONE            = 0x00,
> +    SMMU_CMD_PREFETCH_CONFIG       ,
> +    SMMU_CMD_PREFETCH_ADDR,
> +    SMMU_CMD_CFGI_STE,
> +    SMMU_CMD_CFGI_STE_RANGE,
> +    SMMU_CMD_CFGI_CD,
> +    SMMU_CMD_CFGI_CD_ALL,
> +    SMMU_CMD_CFGI_ALL,
> +    SMMU_CMD_TLBI_NH_ALL     = 0x10,
> +    SMMU_CMD_TLBI_NH_ASID,
> +    SMMU_CMD_TLBI_NH_VA,
> +    SMMU_CMD_TLBI_NH_VAA,
> +    SMMU_CMD_TLBI_EL3_ALL    = 0x18,
> +    SMMU_CMD_TLBI_EL3_VA     = 0x1a,
> +    SMMU_CMD_TLBI_EL2_ALL    = 0x20,
> +    SMMU_CMD_TLBI_EL2_ASID,
> +    SMMU_CMD_TLBI_EL2_VA,
> +    SMMU_CMD_TLBI_EL2_VAA,
> +    SMMU_CMD_TLBI_S12_VMALL  = 0x28,
> +    SMMU_CMD_TLBI_S2_IPA     = 0x2a,
> +    SMMU_CMD_TLBI_NSNH_ALL   = 0x30,
> +    SMMU_CMD_ATC_INV         = 0x40,
> +    SMMU_CMD_PRI_RESP,
> +    SMMU_CMD_RESUME          = 0x44,
> +    SMMU_CMD_STALL_TERM,
> +    SMMU_CMD_SYNC,
> +} SMMUCommandType;
> +
> +#endif /* HW_ARM_SMMUV3_COMMON_H */


