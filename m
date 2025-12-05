Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060C5D339A0
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Dec 2025 17:23:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRZWg-0007gg-1e; Fri, 05 Dec 2025 12:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vRZWe-0007fv-6V
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 12:23:24 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vRZWc-0004RC-3k
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 12:23:23 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2953e415b27so27123875ad.2
 for <qemu-arm@nongnu.org>; Fri, 05 Dec 2025 09:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764955401; x=1765560201; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PdS17f+WOxymdaFYdco6uVN7zwk8liLJzREHNVoYBYw=;
 b=K3e1iqwM7VXtWOlq7hRYq4Z4Dq5LUKVo5895Of/YHtP8rvt+SqmGIIKWmOsn1IUyd7
 D13D9XKgPG8Pufo2zhacDdPpYgwCESA6Bem3INn1oc0irCBwCqUG9rLCAFPYYfyTXe5D
 sLifh8c7JsZqrp3EsxemgzTZmrxUf1gs3GIcTVr31WJzIKjzSIQs8xATC4k9swr/M1/0
 nwAIZyrE558Re57oUu+1/uCbof4Ohv8qbEuiuLee/FdkpBKJn2fMDunf1jwPD26p6Jtu
 S1iwDutDAuKlgCxjQjbAh95hWGi1GwsAVIvsAjTu5VjYoB6pSwJ6YJ4RTMvVYct9aItD
 TveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764955401; x=1765560201;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PdS17f+WOxymdaFYdco6uVN7zwk8liLJzREHNVoYBYw=;
 b=fzBnYAse+Hr2Grzz5zrtEBh6sZruYhv3ywXN/n3s9iuVfvcY+3Y7dc1N529IdvWXzC
 xUPBkhPUrhXpZeqZAK2hSTU5E4eWy/Tr16u4PnvqGhmy1t9xfwpsD7BgDvDTWJ137+kN
 yZtUjSfzjlgAhtqOdjTa+UxO8vp04vnqGkA63jZwKvLi2YqAM7OKznu/rnLQG+sJyQR3
 bnBhRZkSKFhLwKe4bPp/R8dSGuUkA2RT0rA36BWvuxlxaBX5iiKsOuontvwL+fjZZv96
 9TCKu9ewnNmv9uOceBBAC1iy6o1qHYnhV4b/JaQGd+9INrukE/FBifXL/JXzi4ty8zlI
 YTlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlqBZyLKuKQrvf3u53KVCXzDtu1+AQmkHqOYMmwwGALYJ62tjWaWtW9QKZyPdjYJOrbt3wQ6FlAg==@nongnu.org
X-Gm-Message-State: AOJu0YzklV1MEcfwzAUHUcDp/EwnaMe6/elGVmPFHsifBirxMNPEMIS+
 FKHoBzSkDPt6FCN7eVO/d5JfTtuBQPr8wjYlaA9muil0PDDwa7he2MM2QgMUvhwya4o=
X-Gm-Gg: ASbGncuRKOvmkt+t2R+TDZtCRtqmi1T99Xj9J7MvfhLaf+ZSh9nVqPKfYI1oqfIcp+9
 91R5fm5r9jdvvHA99pCcCmKw2XhGX2FuSuDBGEhUCfUh7PcPcn6sqSHz9SxzUOjxgvDOlOZV03R
 u25w1si3nQFydqwOZkhy7H9CYxHeBMAU+oijHbr96jMvpexXgue6mxPXA2rnkigkV3huQNZ6SvB
 EqhSmvQ+geIPgcnKMSbV8+1146sFHujE7eMin2aCDZz6Bs8ir22qY5sPN62aD/zOow5k3+erH5e
 Q7MstfBDMuW9qU5CQ/TaNq8+34DgprkSQNxVjV/YFbNr6YMbQq4eaGfhu1HW0YeXwteQ+Q0ZWHX
 AxHrCX/SELP5whHzwXcf0NAryfClrxjO72P1MmGT9ZtQfoOWBRsdte5OHZWK0sJhERpoWHpIU+C
 de0H0QXCx7ebB19SiwPUobRhGJKObu/q1ZGPhtKEwiDgjng4aqQX4N34s=
X-Google-Smtp-Source: AGHT+IGyAu+qiptPiK/ZaILoDs6C+gnCVVv5utZCw0lKLzRdRzgKGRgw/C+SUfnzJLRaXbyoS4LRNg==
X-Received: by 2002:a17:903:19cf:b0:298:2cdf:56c8 with SMTP id
 d9443c01a7336-29da26797b2mr76269585ad.60.1764955400472; 
 Fri, 05 Dec 2025 09:23:20 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae4cf9d0sm53963585ad.29.2025.12.05.09.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 09:23:20 -0800 (PST)
Message-ID: <52accf06-e75e-4649-a97b-45fa7e08459f@linaro.org>
Date: Fri, 5 Dec 2025 09:23:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 18/21] hw/arm/smmuv3: Harden security checks in MMIO
 handlers
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, eric.auger@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
References: <20251012150701.4127034-1-tangtao1634@phytium.com.cn>
 <20251012151437.4130770-1-tangtao1634@phytium.com.cn>
 <04533911-e6f5-42d6-9813-85e97ce13d38@redhat.com>
 <ab0edbd5-9556-424a-83ab-452801d617a8@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ab0edbd5-9556-424a-83ab-452801d617a8@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 12/5/25 2:36 AM, Tao Tang wrote:
> Hi Eric,
> 
> On 2025/12/4 22:59, Eric Auger wrote:
>>
>> On 10/12/25 5:14 PM, Tao Tang wrote:
>>> This patch hardens the security validation within the main MMIO
>>> dispatcher functions (smmu_read_mmio and smmu_write_mmio).
>>>
>>> First, accesses to the secure register space are now correctly gated by
>>> whether the SECURE_IMPL feature is enabled in the model. This prevents
>>> guest software from accessing the secure programming interface when it is
>>> disabled, though some registers are exempt from this check as per the
>>> architecture.
>>>
>>> Second, the check for the input stream's security is made more robust.
>>> It now validates not only the legacy MemTxAttrs.secure bit, but also
>>> the .space field. This brings the SMMU's handling of security spaces
>>> into full alignment with the PE.
>>>
>>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>>> ---
>>>    hw/arm/smmuv3.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 64 insertions(+)
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index 4ac7a2f3c7..c9c742c80b 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -1458,6 +1458,12 @@ static bool smmu_eventq_irq_cfg_writable(SMMUv3State *s, SMMUSecSID sec_sid)
>>>        return smmu_irq_ctl_evtq_irqen_disabled(s, sec_sid);
>>>    }
>>>    
>>> +/* Check if the SMMU hardware itself implements secure state features */
>>> +static inline bool smmu_hw_secure_implemented(SMMUv3State *s)
>>> +{
>>> +    return FIELD_EX32(s->bank[SMMU_SEC_SID_S].idr[1], S_IDR1, SECURE_IMPL);
>>> +}
>>> +
>>>    static int smmuv3_cmdq_consume(SMMUv3State *s, SMMUSecSID sec_sid)
>>>    {
>>>        SMMUState *bs = ARM_SMMU(s);
>>> @@ -1712,6 +1718,55 @@ static int smmuv3_cmdq_consume(SMMUv3State *s, SMMUSecSID sec_sid)
>>>        return 0;
>>>    }
>>>    
>>> +/*
>>> + * Check if a register is exempt from the secure implementation check.
>>> + *
>>> + * The SMMU architecture specifies that certain secure registers, such as
>>> + * the secure Event Queue IRQ configuration registers, must be accessible
>>> + * even if the full secure hardware is not implemented. This function
>>> + * identifies those registers.
>>> + *
>>> + * Returns true if the register is exempt, false otherwise.
>>> + */
>>> +static bool is_secure_impl_exempt_reg(hwaddr offset)
>>> +{
>>> +    switch (offset) {
>>> +    case A_S_EVENTQ_IRQ_CFG0:
>>> +    case A_S_EVENTQ_IRQ_CFG1:
>>> +    case A_S_EVENTQ_IRQ_CFG2:
>>> +        return true;
>>> +    default:
>>> +        return false;
>>> +    }
>>> +}
>>> +
>>> +/* Helper function for Secure register access validation */
>> I think we shall improve the doc commennt for the function. I understand
>> @offset is a secure register offset and the function returns whether the
>> access to the secure register is possible. This requires a) the access
>> to be secure and in general secure state support exccet for few regs?
>>> +static bool smmu_check_secure_access(SMMUv3State *s, MemTxAttrs attrs,
>>> +                                     hwaddr offset, bool is_read)
>>> +{   /* Check if the access is secure */
>>> +    if (!(attrs.space == ARMSS_Secure ||
>>> +          attrs.secure == 1)) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +            "%s: Non-secure %s attempt at offset 0x%" PRIx64 " (%s)\n",
>>> +            __func__, is_read ? "read" : "write", offset,
>>> +            is_read ? "RAZ" : "WI");
>>> +        return false;
>>> +    }
>>> +
>>> +    /*
>>> +     * Check if the secure state is implemented. Some registers are exempted
>>> +     * from this check.
>>> +     */
>>> +    if (!is_secure_impl_exempt_reg(offset) && !smmu_hw_secure_implemented(s)) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +            "%s: Secure %s attempt at offset 0x%" PRIx64 ". But Secure state "
>>> +            "is not implemented (RES0)\n",
>>> +            __func__, is_read ? "read" : "write", offset);
>>> +        return false;
>>> +    }
>>> +    return true;
>>> +}
>>> +
>>>    static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
>>>                                    uint64_t data, MemTxAttrs attrs,
>>>                                    SMMUSecSID reg_sec_sid)
>>> @@ -2058,6 +2113,10 @@ static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
>>>         * statement to handle those specific security states.
>>>         */
>>>        if (offset >= SMMU_SECURE_REG_START) {
>>> +        if (!smmu_check_secure_access(s, attrs, offset, false)) {
>>> +            trace_smmuv3_write_mmio(offset, data, size, MEMTX_OK);
>>> +            return MEMTX_OK;
>> so the access to @offset is not permitted and we return MEMTX_OK? I am
>> confused
>>> +        }
>>>            reg_sec_sid = SMMU_SEC_SID_S;
>>>        }
>>>    
>>> @@ -2248,6 +2307,11 @@ static MemTxResult smmu_read_mmio(void *opaque, hwaddr offset, uint64_t *data,
>>>        offset &= ~0x10000;
>>>        SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>>>        if (offset >= SMMU_SECURE_REG_START) {
>>> +        if (!smmu_check_secure_access(s, attrs, offset, true)) {
>>> +            *data = 0;
>>> +            trace_smmuv3_read_mmio(offset, *data, size, MEMTX_OK);
>>> +            return MEMTX_OK;
>> same here?
>>> +        }
>>>            reg_sec_sid = SMMU_SEC_SID_S;
>>>        }
>>>    
>> Thanks
>>
>> Eric
> 
> 
> Thanks for the review and for calling out the confusion around this helper.
> 
> 
> The function `smmu_check_secure_access` and `return MEMTX_OK` statement
> after smmu_check_secure_access returned false is trying to follow the
> SECURE_IMPL rules from the architecture spec:
> 
> ARM IHI 0070 G.b , 6.2 Register overview
> 
> - When SMMU_S_IDR1.SECURE_IMPL == 1, SMMU_S_* registers are RAZ/WI to
> Non-secure access. See section 3.11 Reset, Enable and initialization
> regarding Non-secure access to SMMU_S_INIT. All other registers are
> accessible to both Secure and Non-secure accesses.
> - When SMMU_S_IDR1.SECURE_IMPL == 0, SMMU_S_* registers are RES0.
>

May be worth to add a comment quoting the spec, we have been two people 
to ask the same thing. It definitely looks like a mistake when reading 
for the first time.

> 
> So the MEMTX_OK in the MMIO handlers is deliberate: we are acknowledging
> the bus transaction while applying the architectural RAZ/WI/RES0
> semantics at the register level, rather than modelling a bus abort. Also
> there was another discussion about this issue [1]  in V1 series.
> 
> [1]
>    https://lore.kernel.org/qemu-devel/a5154459-a632-42b0-b599-d5dff85b5dd2@phytium.com.cn/
> 
> 
> I'll add these needed details and parameters introduction as comment
> in `smmu_check_secure_access` and `return MEMTX_OK`. How do you think
> about it?
> 
> 
> Thanks again for the feedback,
> 
> Tao
> 


