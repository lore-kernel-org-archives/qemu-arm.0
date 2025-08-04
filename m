Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B23AC87FCF
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 22:44:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj3uQ-00026B-Ql; Mon, 04 Aug 2025 18:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj3uF-00021p-Uf
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:43:49 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj3uD-0003qo-DM
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:43:46 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-23636167afeso32799575ad.3
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 15:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754347424; x=1754952224; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8sn06oDs9DeCnEOpA36nFRdaDNe3BvouVSVNqYHrrMc=;
 b=y3/0mMXOT6Fu302e54tv0bi2loabko3KBOD1+Qg+x6EBYPnTRLjWKPkWSzMyzpWGEQ
 vDbXdEOW7Czxk9TgbdlvjAYOtf3YFxuLJGFWSxuSOAmSnA0Ol4gtNkumvj2Oe2Lz7Knt
 g6DVUbkipcsXQxBC/HTXApqnC83vF+3AxfpGPkxbXgvJ+XDUzY0+Q9dWHjjOz3t0ahum
 elr4PdSHGp/Yn4u8XyxHY4HlBZiLoXuaOUm5RoLJaXhxRMfgR55J+7Al0Dx2Xxsw6qNl
 gkfe38nOTKLI3sRmrFDHTTVufRNT8rEUA3YmZ3/JrTcGRZnrPxF/4nzUlggigl5eHrL9
 6h0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754347424; x=1754952224;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8sn06oDs9DeCnEOpA36nFRdaDNe3BvouVSVNqYHrrMc=;
 b=TaQHissQTpgZL6kMMjnRfBnLN60OueVLbcNroW9Q87Hb4jSJqquR+o0+gRHphtTdYB
 7V5jRT2Ttf7DTaKiZpQQ5uqEVuzUxMSEFPc+tbPfHjFq06vbuVg9TlpPZJhVnBShBE/Q
 7QTPuKPiEe65ZELuxLYfhsxSfkTD07saGeyS6I2UFhvA0Gftm8NTmETp8orMrEHkVImT
 wJsH/YaNTLPJKvQvFrAD8SqoY4BVvbEOdyZgA5kOR90tSzTIxSrEeFe9DngAq9Qf9sJo
 0mnmAOALX78caQ3m2kwc3J81eVYMDWvlWpL+GeelmKxdPf9z1wZQqlJT2Tb8E+RHg9T7
 krWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjT7kLrzdFkKjKDzIZoyVT0SqPd4ncYuo6ITTlVC1Rg5b/lVABz6Z+REqD/voVRF0/K4pLO5NW3w==@nongnu.org
X-Gm-Message-State: AOJu0Yw+j3Xb3z6FIBRQySziQIMPwvfb4Bt7gMYPdpbnA6O2anyj1Xnx
 kXjSCu9HQeF8jp68L5U4GQGIKDGrmgs5PKJX+7nERIx6jN24RVFbni+pDT6mPJNTnDQ=
X-Gm-Gg: ASbGncv7oilS+Nu3EFiU9sJKAXdmZ/STUswtN67cdehQCYN1iLcIwDpn/Fz5WN6sHdo
 eiXP5tT+Gba1LBKcN8+nOvOoPh3yvD3cIiJtNevwISjEGtglRDowMV1KxIvOdc5xMiGQ7fDZW1W
 1VK8z9RHTNnvBK1DQ6FmU/SHh8a8vgCeUOZ1XEkr2I5vPgUyjyxR3+ZYZUkY5G5RREH+m++wFkY
 /8c09Qu2KE0XqV9IL76wA83aDufjFYI70cL2dBWzU5zepnuT5lA+Zps0vusYcRgaSCGJ2eOZW5b
 p+LP28RbQzu3VaIp+dup99uCF8QETrmVUjqY4zWKpU/Xkyl84xr/cCuC0C8ORJ3KK0QAPW3ZpCB
 qwajpHW0ufoj+hSXJyi71nY/8xexbR9S+2YQ=
X-Google-Smtp-Source: AGHT+IHqBOGU26KiM30/Bpq7wP8OjuWKTMYsYwbRWPyO8L1h/C1CDXl6pjHCma2VWvOP7FTxpfEg4w==
X-Received: by 2002:a17:902:f54f:b0:23f:df56:c74c with SMTP id
 d9443c01a7336-24246f5e4abmr149500795ad.14.1754347423943; 
 Mon, 04 Aug 2025 15:43:43 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f22788sm119253965ad.74.2025.08.04.15.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:43:43 -0700 (PDT)
Message-ID: <a0d42e44-428a-4ad1-a027-81585819c260@linaro.org>
Date: Mon, 4 Aug 2025 15:43:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] semihosting/arm-compat-semi: replace
 target_ulong with uint64_t
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
 <20250804183950.3147154-10-pierrick.bouvier@linaro.org>
 <ca38be54-ec29-4fcd-be02-0aa526258920@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ca38be54-ec29-4fcd-be02-0aa526258920@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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

On 8/4/25 3:42 PM, Philippe Mathieu-Daudé wrote:
> Hi Pierrick,
> 
> On 4/8/25 20:39, Pierrick Bouvier wrote:
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    semihosting/arm-compat-semi.c | 24 ++++++++++++------------
>>    1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
>> index c03096b253d..f593239cc9a 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -123,7 +123,7 @@ static GuestFD console_out_gf;
>>     */
>>    
>>    typedef struct LayoutInfo {
>> -    target_ulong rambase;
>> +    vaddr rambase;
> 
> Subject says uint64_t but code use vaddr, is that expected?
>

I didn't update description since last version, indeed, should be vaddr.

>>        size_t ramsize;
>>        hwaddr heapbase;
>>        hwaddr heaplimit;
> 
> 
>> @@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
>>     * is defined by GDB's remote protocol and is not target-specific.)
>>     * We put this on the guest's stack just below SP.
>>     */
>> -static target_ulong common_semi_flen_buf(CPUState *cs)
>> +static uint64_t common_semi_flen_buf(CPUState *cs)
>>    {
>> -    target_ulong sp = common_semi_stack_bottom(cs);
>> +    vaddr sp = common_semi_stack_bottom(cs);
> 
> Ditto.
> 
>>        return sp - 64;
>>    }
> 


