Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp124538ejf;
        Thu, 22 Feb 2024 10:39:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGE0StEZ/G+EOvARELwCyZ+3g/A8zHKxtycgpYvZUYWQP9/azci1FnvIW1mg2XI5LdjFJdiq6usY3brOS1svzR+UoH+oV2
X-Google-Smtp-Source: AGHT+IEtjBTCX9xflCXkkJn8odA/4GX6+2JNuU/k/5SAGXVjAFKsKtNjlPw+LPsxy2vx/1jX9HeS
X-Received: by 2002:ac8:574b:0:b0:42e:2c8a:4f57 with SMTP id 11-20020ac8574b000000b0042e2c8a4f57mr10199qtx.11.1708627168124;
        Thu, 22 Feb 2024 10:39:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708627168; cv=none;
        d=google.com; s=arc-20160816;
        b=wioXYLNlFk21hUaGKet1PRhqf8Rl1Adu9OPWIAD2gDm6hsloh9jTazq30Y8tjFFguh
         LYZqVvfkpkDg3CA2J6DnSFsVfsz5q9tmOgApyZLySwzmHqna3HasMuBEC1ozDSdyHirk
         SXrDGhogN3jsvD6bwoIv881YyAs/aTEgrqLgZlvj8gQF5YfhW7M34F/tsES9GSSSqwr3
         976LPcdO8Cqy1BRBFms7HErZ1U51Uo9KIo+DwAt78QvJFWBEx+KEzLynk/LnV2u5ot0H
         fJhR79rAhBHcVkjAvgyXez/io4PSeQCLpQmkhLn84q1UDiiCObLlHVulD5dylq8LsHuZ
         aH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=5w8L/FhZ1WzIaiqItJofMyraJS2uSRvjwOlAvu5YBeI=;
        fh=YbDnDrvMh4sZRiyeQcAkaJQJ1AZAYkkfXP+dY75wWPE=;
        b=Bx8C76i+IYaEFil5FiHYNbSQZhly0GjyRA2K+fy/OXOdpgHII51Jdumo+gBhIU+2GJ
         8iQHqgunNwGckvmpE2gZXZGqRplHsd0aVBr9GV8TZNBk7LhRKxTPjDc/37HIhgSHQocW
         dzXPRuyOFSy7Zi9qZdk0cpOMaC19tyMiVB16ZjzO0aNkko4M6N3CkLvVFubOgZq2HlOY
         xJGmcLuuY0jyHzHI1GjopCSNqvrfkGVOZ5toBSAtEce/9hi/6xq6F1BLqPFc+HukmmEH
         OjW/rZXLfPDSvnzt8K8rtCc1hK4ERT0RULnNsgr+V6fXhVVVLh+CX5pR7j/ft2MBZWty
         /nog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mRYX2S1h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020ac8660d000000b0042e2aa110easi2120775qtp.691.2024.02.22.10.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 10:39:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mRYX2S1h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdDyQ-0004z5-6D; Thu, 22 Feb 2024 13:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdDyP-0004yj-02
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 13:39:09 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdDyM-0008N6-Kg
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 13:39:08 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d932f6ccfaso717835ad.1
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 10:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708627143; x=1709231943; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5w8L/FhZ1WzIaiqItJofMyraJS2uSRvjwOlAvu5YBeI=;
 b=mRYX2S1hWNfDSp2Rx5RsplaMYtV1RZKKxKIHe3iVXi3dGtg4EF9sI+aLfhUYIWAQkK
 /+NLK9tFfOZw/D1+nTTP62OLTc71wgV1EC1FgrMJhEpMPYkxx6DOB2eC+kXka9eo9/tM
 9VJtteiR17hRrf0bcRWozoQqcXPxrP977y7SmjpRnJHRRtZhLzx1s/s2v5hjl+sVIGMl
 xGW7h+vDYt5GQHDhqCKM89NHLPTfNET+E2ARRd7NjeEeSmzxz9Kf/sOJKDVxiCeC+1jv
 vasy/oY8lkyFOdYo+4wTJ4HW107LcZZsWlt/ReyYG0HRqVJ4RXXAZQ90gAmcoU96AGEp
 ir4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708627143; x=1709231943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5w8L/FhZ1WzIaiqItJofMyraJS2uSRvjwOlAvu5YBeI=;
 b=dWLdR0HSTBmR3yK6BpPvI5+0DxoxfAkjZ5w/6p89jfIGRjzE3rW4nTnisQWx+aV4sS
 sOXHgoydXnDnr00u92GIbTxCodb+ltjJOxuzLNH/8eu+OYXsiTAn7YsgOkZNz0loJyb9
 Mcd2tT8uxFhLz/WqbN67+x6txhKQM2hr9ubBk44JIbw5yMv0fpO2fQw+bdnMGSaUvocZ
 o2H7GwHgles8Cffp8TKNkJbGVP41eURAchX/XcUmQ+DIScL6064j8vKhRTE0ImryUW0P
 gD8EYuD1gDYGuasKJsKYcQRd5Hb96Z7Ib75S/ppJaMkHR2ZK8YDHVY1fq+N/Kds74a5l
 6cZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZI+MW+Y/EZhdHk76VYqp+I8xUBwbBt9qnlru+9CuaHRYMTPz1wlzCX/9M1mnLlcPVVzMRcRD1NKUVxoh4gdp9tWLx
X-Gm-Message-State: AOJu0Yx4cAmFg/XULumcqRejLgwQKdQadkY3HFUb7A7aKNJ6lMluX0yo
 KsJ+sie/n/1bdLdkxSdfaQr/sM6g89OLYPoXjuILQr0UeS9ER6As0zmAnma1leA=
X-Received: by 2002:a17:902:e843:b0:1db:ba1c:1b99 with SMTP id
 t3-20020a170902e84300b001dbba1c1b99mr18152775plg.37.1708627143636; 
 Thu, 22 Feb 2024 10:39:03 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 d17-20020a170903209100b001d9ef7f4bfdsm10281083plc.164.2024.02.22.10.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 10:39:03 -0800 (PST)
Message-ID: <1b690345-55eb-4655-b0d8-b9cac39dd851@linaro.org>
Date: Thu, 22 Feb 2024 08:38:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 07/22] target/arm: Add support for NMI event state
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-8-ruanjinjie@huawei.com>
 <c02228ea-4f24-46f9-b6b3-34cba3059d69@linaro.org>
 <a4c733be-450b-4d28-b869-fd80630f3ecb@linaro.org>
 <fc4c1ca9-09bf-89c7-a2bc-521f7972766c@huawei.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <fc4c1ca9-09bf-89c7-a2bc-521f7972766c@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q6S0MT693FGM

On 2/22/24 01:52, Jinjie Ruan wrote:
> 
> 
> On 2024/2/22 5:25, Richard Henderson wrote:
>> On 2/21/24 10:10, Richard Henderson wrote:
>>> On 2/21/24 03:08, Jinjie Ruan via wrote:
>>>> The NMI exception state include whether the interrupt with super
>>>> priority
>>>> is IRQ or FIQ, so add a nmi_is_irq flag in CPUARMState to distinguish
>>>> it.
>>>>
>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>> ---
>>>>    target/arm/cpu.h    | 2 ++
>>>>    target/arm/helper.c | 9 +++++++++
>>>>    2 files changed, 11 insertions(+)
>>>>
>>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>>> index 5257343bcb..051e589e19 100644
>>>> --- a/target/arm/cpu.h
>>>> +++ b/target/arm/cpu.h
>>>> @@ -603,6 +603,8 @@ typedef struct CPUArchState {
>>>>        /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
>>>>        uint32_t irq_line_state;
>>>> +    bool nmi_is_irq;
>>>
>>> Why would you need to add this to CPUARMState?
>>> This has the appearance of requiring only a local variable.
>>> But it is hard to tell since you do not set it within this patch at all.
>>
>> According to Arm GIC section 4.6.3 Interrupt superpriority, NMI is
>> always IRQ, never FIQ, so this is never required.
> 
> There is a bit of ambiguity here. The processor manual says that both
> irq and fiq can have superpriority attributes, but the gic manual only
> says that the IRQ has superpriority attributes.

Yes, it is possible to inject a superpriority FIQ via HCRX_EL2.  But you don't need an 
extra variable to handle this.


r~

