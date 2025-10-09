Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9712ACCD183
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Oct 2025 17:43:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6ufq-0004VR-BV; Thu, 09 Oct 2025 13:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6ufl-0004S2-MQ
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 13:43:27 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6ufd-0005nN-B7
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 13:43:25 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-26983b5411aso8634815ad.1
 for <qemu-arm@nongnu.org>; Thu, 09 Oct 2025 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760031793; x=1760636593; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1rw47ZkWgjMwlr6iJUjZpho1/IE4CCt9CzOsiPMXHNg=;
 b=SRNgdnwj6D75Y0Bjbocz6yXsH1YnsRPIJqNSDJ9yffss69iVeugJhDP7rp8SfXRQEQ
 3mzrssieught0lfAHs/jPIZISKAV85unMpi1KXALh7nzGscrCmK+/m5VXeaxAjv+5Wzm
 Vs81eY6DH3zuCEyzQz/A0/1LSuy4NJ7FdO7IU8GjWe9/CcAGN0bpW/ip1swrmIl7CLsJ
 d3+mHLhFY3HR3MkmvdG3h7fdaopPtKTZ61/su65Nf8M3eK/RuQ4lS4RP09eKaPEYU2BS
 fUIwrbUzL1ruf4fITykN4pHj4TUaN88mBjVqcJMylqumYedsfzGRZMkxLGwv9zhsaga5
 ujiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760031793; x=1760636593;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1rw47ZkWgjMwlr6iJUjZpho1/IE4CCt9CzOsiPMXHNg=;
 b=jfTZzjp5idRT45424OgGIgEbKXF+P4MpmDoHntO1sEe2U3ZBAAY6Yr51dZNBfhnS95
 CvnNxlwbPal3Zvl6s3+cVY9YagPDX6x5L0RSr39lVjYQWmwEB0ueZFY0Y18h4YvgiB/7
 R64cY6iVVXybKvH9VJzAQTJkLx4PJ54QK2ZZzSJe6OLcqKz6q8bRtnoCJJ2G0mrAxr/G
 3mfsdUOt8K11oRnD5BUu+oeNP3upnSxZniIYUkb1b80QHbCC2XuZy8en1Yf7L4xyJp6f
 0hnB4x66Qy+MBaYkLl1NSYimUFvQV1TEoc/q1IDH9hDkcyMeXRtV80ZHSADZRSFa9U8m
 9saw==
X-Gm-Message-State: AOJu0YxbVFjMLtmtxs1Z6//4P1aXfMOpvB7O4fZ35r1yRb3nRFcmrHpf
 2GmT3JHxstxl7I88QU7CpF6o4LV/s3EYizRhWJGkoTUgFMGWbCDeYNogBUl8R/Suec/ZYG+pOXC
 bv1tPeFg=
X-Gm-Gg: ASbGnctuX2sfUTnZPLECi3rsWYGhjyhCDHsWQE2zmOctaEPY+kQRgx1nXV1/buca46b
 YAzSFbF6jid8RmAUks7MfP6tmQTgqek8uIgtjsussx9QD6jFYuniQ8i6z1NgFKao2fKar+CvxBd
 sINIMd3xA+YaccrTE2NbQMw5p24AFC9r12MHgb/3FiiVU9B07YpseVytj69t3a8iOEzdxk1I+8Q
 N+cWAiIaWyVHq5BMoPXwvrQotdGnBSzmguwZOyAgRlOkLxIrjJF0iWzIsCUFGVzmlU08jBurXzz
 5RbMCng3rjckXgpkdw/IFIxegBAHTOhOQfecgARVyqH0zi1C1+WnP6VZ8dpFQ+rlMCi7lbayGEM
 l/YAyVMj/6fgqjKJ/1jKdk/jK+kGqXq9IIvdEmW+/PWFiYdPFeRhIZYNhB5mZTfKA
X-Google-Smtp-Source: AGHT+IFijQOI+hnyHC/G8T9aE9lw2O606LXRIao4dB1BkFibDc/LSU5JKVNUga+avjUIkvQkSVAqVg==
X-Received: by 2002:a17:902:d54b:b0:288:e46d:b318 with SMTP id
 d9443c01a7336-290274008ddmr125193985ad.40.1760031793413; 
 Thu, 09 Oct 2025 10:43:13 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f8770dsm34334805ad.117.2025.10.09.10.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 10:43:13 -0700 (PDT)
Message-ID: <081b5886-56de-4037-9be3-5f60345bf5b5@linaro.org>
Date: Thu, 9 Oct 2025 10:43:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/73] target/arm: Expand
 CPUARMState.exception.syndrome to 64 bits
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
 <20251008215613.300150-11-richard.henderson@linaro.org>
 <e16277df-c8e1-41ea-8a59-da2ae11dafe1@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <e16277df-c8e1-41ea-8a59-da2ae11dafe1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/9/25 07:14, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 8/10/25 23:55, Richard Henderson wrote:
>> This will be used for storing the ISS2 portion of the
>> ESR_ELx registers in aarch64 state.  Re-order the fsr
>> member to eliminate two structure holes.
>>
>> Drop the comment about "if we implement EL2" since we
>> have already done so.
>>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.h     |  7 ++-----
>>   target/arm/helper.c  |  2 +-
>>   target/arm/machine.c | 32 +++++++++++++++++++++++++++++++-
>>   3 files changed, 34 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index c9ea160d03..04b57f1dc5 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -633,13 +633,10 @@ typedef struct CPUArchState {
>>        * entry process.
>>        */
>>       struct {
>> -        uint32_t syndrome; /* AArch64 format syndrome register */
>> -        uint32_t fsr; /* AArch32 format fault status register info */
>> +        uint64_t syndrome; /* AArch64 format syndrome register */
>>           uint64_t vaddress; /* virtual addr associated with exception, if any */
>> +        uint32_t fsr; /* AArch32 format fault status register info */
>>           uint32_t target_el; /* EL the exception should be targeted for */
>> -        /* If we implement EL2 we will also need to store information
>> -         * about the intermediate physical address for stage 2 faults.
>> -         */
>>       } exception;
> 
> 
>> diff --git a/target/arm/machine.c b/target/arm/machine.c
>> index 6666a0c50c..ce20b46f50 100644
>> --- a/target/arm/machine.c
>> +++ b/target/arm/machine.c
>> @@ -848,6 +848,23 @@ static const VMStateInfo vmstate_powered_off = {
>>       .put = put_power,
>>   };
>> +static bool syndrome64_needed(void *opaque)
>> +{
>> +    ARMCPU *cpu = opaque;
>> +    return cpu->env.exception.syndrome > UINT32_MAX;
> 
> Hmm...
> 
>> +}
>> +
>> +static const VMStateDescription vmstate_syndrome64 = {
>> +    .name = "cpu/syndrome64",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .needed = syndrome64_needed,
> 
> Why not simply add a new description for the high bits and
> always migrate?
> 
>         .info = &vmstate_info_uint32,
>         .offset = offsetofhigh32(ARMCPU, env.exception.syndrome),
> 
>> +    .fields = (const VMStateField[]) {
>> +        VMSTATE_UINT64(env.exception.syndrome, ARMCPU),
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +};
>> +

Because that's more complicated, IMO.


r~

