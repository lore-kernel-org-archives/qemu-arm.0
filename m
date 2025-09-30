Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D170DCCA470
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 13:14:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3aBD-0007jP-Vc; Tue, 30 Sep 2025 09:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v3aBA-0007aX-9r
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 09:14:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v3aB0-0003HK-9W
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 09:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759238029;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjRIhaZR8ZlE9lRBTTO3oPPJoTeikj7GqYFH/IFWeKY=;
 b=Iznn+TvWplRQmoCk2xOGHLFRwakQP1KtmnXElAxqCKe8NPTWWGU4Oz2x3bzkrhZezcKa2G
 7iJJ9cGfYKzAI4zp6tz0Y9b/5NJYmqO/304vjLP4Z4ER74oOEOejMWokxwDdqM6pkgTlm6
 GoFbBN8TgoPSEe1lA4a32h0Xv1/bDtY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-WjjEpy3UOWKiKNSUlLdU0g-1; Tue, 30 Sep 2025 09:13:48 -0400
X-MC-Unique: WjjEpy3UOWKiKNSUlLdU0g-1
X-Mimecast-MFC-AGG-ID: WjjEpy3UOWKiKNSUlLdU0g_1759238027
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-40fd1b17d2bso2922175f8f.1
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 06:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759238027; x=1759842827;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jjRIhaZR8ZlE9lRBTTO3oPPJoTeikj7GqYFH/IFWeKY=;
 b=m4ZuasXvk8aRw7ozkyTOUBzWScw0O958CZWqnNtkXe0UV5ETlTHKttcvRSxV/dN17h
 xvKnWUEkGwj6dzIamy3L94LhsWZsNbMDzeBmMDG6M/bCKJFvzW9NwGveTPwh97vKF7Ve
 jNSubZvBUG4EzzsiaPun9vTQe9DI2g55y7+vFCU4AR/09JlQilO1EV3wF6igRQYZCnm3
 i9Fn++Mg3YVbBBDYicQ0+yuztt1SCA6/oIrjpu4ybQQapogfJGidz9Gn5eeyb1oJ4t0P
 +GlNrNXfPeuQyVZK3YRhpIAfW++ifOu24jrWHKCZgjfIPb+hQH/QYGMx6XYCiRGbbO7X
 AkOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoa7V1UUOyb9cJRF2tCGroyGrS+iX0ubtjm58+8AA5wok4Q17ri3Viv5FzVu2VRjiRynSz7cP6Lw==@nongnu.org
X-Gm-Message-State: AOJu0Yy7PptFBXqzJ5ohPlazCvkq+iBqtReyxapX1AEhYfqspgtkqKed
 Xy0aF5yOHTwLuWbFezNnri3quwjyo/Qn7XXFgxydRJFtpUEkfL+11kYNtJSYiy00BvSzjBIbbXS
 axOReuI5vvyTr9kKtiLgMDeDlYnWB0gsrZra5X+G9usxKJr7IeWY57w==
X-Gm-Gg: ASbGncv3sofOhOTprSZWZsTrTWbG8IYZvsgOVq8JhLIpNTW6CECBccmPyDGY5y/SkSR
 gS7YKhNXPU5+EDPV0ZtwgxX6XJtj7rzlBmKZ5/1IABt9YIsTlim4d9ZBM6S0YrAsEQdH0tblmaC
 xoKLkc+Ka3ozBVe3CseCyRW3F4j/1eOTJYrHscd3wcjCCQPU6r/SNrAfPMXrFMYYuGb5q6nIPgX
 /eDOE1TgOfDaJHEEYZrxT/zstsExIOjlLyGw5W5++CoEBteoGpuKTgJY7Oma2UMhyToysaqzcW8
 prhU3N9t8lqKdVNzQgVfnYrrqkHdkPyQfzAM4YRLeIbPkQnDCXXyzs2upZIrkhlarBW9Xil+aCJ
 vtuIM+vP4M74gonFV
X-Received: by 2002:a05:6000:26ce:b0:3ee:15b4:8470 with SMTP id
 ffacd0b85a97d-40e4be0c962mr18472475f8f.45.1759238026993; 
 Tue, 30 Sep 2025 06:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0stWe80laMO9K0dNAx9yMp9to1ZAmp75cvF65yUu1FkD7ErgcfXrN9KYbbASkScdYaHyF9w==
X-Received: by 2002:a05:6000:26ce:b0:3ee:15b4:8470 with SMTP id
 ffacd0b85a97d-40e4be0c962mr18472442f8f.45.1759238026517; 
 Tue, 30 Sep 2025 06:13:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc749b8f9sm22267946f8f.50.2025.09.30.06.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 06:13:45 -0700 (PDT)
Message-ID: <d6049019-e45b-4b65-a55f-be52184e5ff9@redhat.com>
Date: Tue, 30 Sep 2025 15:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] hw/arm/smmuv3: Harden security checks in MMIO
 handlers
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
References: <20250925162618.191242-1-tangtao1634@phytium.com.cn>
 <20250925162618.191242-12-tangtao1634@phytium.com.cn>
 <81c98959-45dc-4cbc-836f-a34fdf160801@redhat.com>
 <e43de190-7643-49e1-8e57-0b5f28c33fe9@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <e43de190-7643-49e1-8e57-0b5f28c33fe9@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ktz5ry91DNkX25zbFzF1BqsApX9RI_cSsSjdk29oCAA_1759238027
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Hi Tao,

On 9/29/25 5:56 PM, Tao Tang wrote:
> Hi Eric,
>
> On 2025/9/29 23:30, Eric Auger wrote:
>> Hi Tao,
>>
>> On 9/25/25 6:26 PM, Tao Tang wrote:
>>> This patch hardens the security validation within the main MMIO
>>> dispatcher functions (smmu_read_mmio and smmu_write_mmio).
>>>
>>> First, accesses to the secure register space are now correctly gated by
>>> whether the SECURE_IMPL feature is enabled in the model. This prevents
>>> guest software from accessing the secure programming interface when
>>> it is
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
>>>   hw/arm/smmuv3.c | 58
>>> +++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 58 insertions(+)
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index 53c7eff0e3..eec36d5fd2 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -1484,6 +1484,12 @@ static bool
>>> smmu_eventq_irq_cfg_writable(SMMUv3State *s,
>>>       return smmu_irq_ctl_evtq_irqen_disabled(s, sec_idx);
>>>   }
>>>   +/* Check if the SMMU hardware itself implements secure state
>>> features */
>>> +static inline bool smmu_hw_secure_implemented(SMMUv3State *s)
>>> +{
>>> +    return FIELD_EX32(s->bank[SMMU_SEC_IDX_S].idr[1], S_IDR1,
>>> SECURE_IMPL);
>>> +}
>>> +
>>>   static int smmuv3_cmdq_consume(SMMUv3State *s, SMMUSecurityIndex
>>> sec_idx)
>>>   {
>>>       SMMUState *bs = ARM_SMMU(s);
>>> @@ -1723,6 +1729,43 @@ static int smmuv3_cmdq_consume(SMMUv3State
>>> *s, SMMUSecurityIndex sec_idx)
>>>       return 0;
>>>   }
>>>   +static bool is_secure_impl_exempt_reg(hwaddr offset)
>> Worth a comment: some secure registers can be accessed even if secure HW
>> is not implemented. Returns true if this is the case or something alike.
>
>
> You're right, that function definitely needs a comment to explain the
> architectural exception it handles. I will add one in the next version
> to improve clarity.
>
>>> +{
>>> +    switch (offset) {
>>> +    case A_S_EVENTQ_IRQ_CFG0:
>>> +    case A_S_EVENTQ_IRQ_CFG1:
>>> +    case A_S_EVENTQ_IRQ_CFG2:
>>> +        return true;
>>> +    default:
>>> +        return false;
>>> +    }
>>> +}
>>> +
>>> +/* Helper function for Secure register access validation */
>>> +static bool smmu_check_secure_access(SMMUv3State *s, MemTxAttrs attrs,
>>> +                                     hwaddr offset, bool is_read)
>>> +{   /* Check if the access is secure */
>>> +    if (!(attrs.space == ARMSS_Secure || attrs.space == ARMSS_Root ||
>> First occurence of ARMSS_Root in hw dir? Is it needed?
>
>
> This is a good question, and I'd like to clarify your expectation. My
> thinking was that if we are using ARMSecuritySpace to propagate the
> security context at the device level, then ARMSS_Root will eventually
> be part of this check.
>
> Is your suggestion that I should remove the ARMSS_Root check for now,
> as it's not strictly necessary for the current Secure-state
> implementation, and only re-introduce it when full Realm/Root support
> is added to the SMMU model? I'm happy to do that to keep this patch
> focused.

Well I think I would remove it if not supported anywhere. As an
alternative If we can get this value and if this is definitively not
supported by the code we can assert.

Thanks

Eric
>
> Thanks,
> Tao
>
>>> +          attrs.secure == 1)) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +            "%s: Non-secure %s attempt at offset 0x%" PRIx64 "
>>> (%s)\n",
>>> +            __func__, is_read ? "read" : "write", offset,
>>> +            is_read ? "RAZ" : "WI");
>>> +        return false;
>>> +    }
>>> +
>>> +    /* Check if the secure state is implemented. Some registers are
>>> exempted */
>>> +    /* from this check. */
>>> +    if (!is_secure_impl_exempt_reg(offset) &&
>>> !smmu_hw_secure_implemented(s)) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +            "%s: Secure %s attempt at offset 0x%" PRIx64 ". But
>>> Secure state "
>>> +            "is not implemented (RES0)\n",
>>> +            __func__, is_read ? "read" : "write", offset);
>>> +        return false;
>>> +    }
>>> +    return true;
>>> +}
>>> +
>>>   static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
>>>                                  uint64_t data, MemTxAttrs attrs,
>>>                                  SMMUSecurityIndex reg_sec_idx)
>>> @@ -2038,6 +2081,13 @@ static MemTxResult smmu_write_mmio(void
>>> *opaque, hwaddr offset, uint64_t data,
>>>       /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact
>>> aliases */
>>>       offset &= ~0x10000;
>>>       SMMUSecurityIndex reg_sec_idx = SMMU_SEC_IDX_NS;
>>> +    if (offset >= SMMU_SECURE_BASE_OFFSET) {
>>> +        if (!smmu_check_secure_access(s, attrs, offset, false)) {
>>> +            trace_smmuv3_write_mmio(offset, data, size, MEMTX_OK);
>>> +            return MEMTX_OK;
>>> +        }
>>> +        reg_sec_idx = SMMU_SEC_IDX_S;
>>> +    }
>>>         switch (size) {
>>>       case 8:
>>> @@ -2252,6 +2302,14 @@ static MemTxResult smmu_read_mmio(void
>>> *opaque, hwaddr offset, uint64_t *data,
>>>       /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact
>>> aliases */
>>>       offset &= ~0x10000;
>>>       SMMUSecurityIndex reg_sec_idx = SMMU_SEC_IDX_NS;
>>> +    if (offset >= SMMU_SECURE_BASE_OFFSET) {
>>> +        if (!smmu_check_secure_access(s, attrs, offset, true)) {
>>> +            *data = 0;
>>> +            trace_smmuv3_read_mmio(offset, *data, size, MEMTX_OK);
>>> +            return MEMTX_OK;
>>> +        }
>>> +        reg_sec_idx = SMMU_SEC_IDX_S;
>>> +    }
>>>         switch (size) {
>>>       case 8:
>> Thanks
>>
>> Eric
>


