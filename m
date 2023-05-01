Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1361761ejm;
        Mon, 1 May 2023 00:23:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4/lqzXhkZrdntokd2ZJS0TrHhn1zDr6xkZoVVy0abH9RyuCzqoBFOI0zekv4p+1rGGbEZn
X-Received: by 2002:ac8:7c50:0:b0:3f0:df4d:40b7 with SMTP id o16-20020ac87c50000000b003f0df4d40b7mr21228446qtv.7.1682925830316;
        Mon, 01 May 2023 00:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682925830; cv=none;
        d=google.com; s=arc-20160816;
        b=fHVVExNZSC8cO4ozZyFL7GfrRmmz51ZEap5zr5p/e2LH0hE8An6JEBHrjNPsz9nkFT
         9Z9lRq63q1qZbiScJOfepJ8z/j9y8NgVcSqgvPlua2wXMyG6vQYP9vigt4s954eQ6GLn
         Ps2gmucLozZ9TBRX54ccTScDcqeHLZBwRQoPixCykWw4WoUrG2BRM0fT4yrTw72ilNoq
         NFCDuBA+FS/zcIAJMc/V2TYhVrnXCkNmSjODawzf9gCYdBHa7nZ192Qhrd4TarwTwr/k
         gnbb1t0xdQgZuabpgeOGp5RfPWVet3x5Err5pCr5j/cgrnzO9o5L3/y9s1lUJaJfjQeq
         EgRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QkEQYBpga+gb0GKmst2KRP17ziGBhkAyFxuigIpKMwA=;
        b=VIG7NUxwKHbwP8NW3XlBD57XDc46g7ka+ZrEOG55qTJkdmIKfZK7sf88W2HA8G8mz9
         vXCUO4AAh/23BOAgKjB1RtPPov6+3zPhOVXgM6gP4P7BY16+aW2V6bdcpwDE9tx6XkU4
         S+7626lEJ4/VXqkQ56DNx8Ke+XlIAbNSjjoZMr8+1codYagzw4OKV9nme+bq6bDk5Ovr
         d/AheJ1NqZ8LZ1EAC69rTz/HJmBcCkUIZz4NtKdEhCqu/KBiKcwE7L12YR3Y4Q2qy0Vo
         7OlG81w4mkxco+qUE5+83yr7WoceG0dAhtvti0ebLRx5x5PScBQ//ZdD1J2/XzAdDZCy
         oAkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WEbbnNDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c76-20020a379a4f000000b00748750a33adsi15895995qke.261.2023.05.01.00.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 May 2023 00:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WEbbnNDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ptNsp-0001w0-Vh; Mon, 01 May 2023 03:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptNsn-0001uh-3N
 for qemu-arm@nongnu.org; Mon, 01 May 2023 03:23:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptNsk-0001P8-73
 for qemu-arm@nongnu.org; Mon, 01 May 2023 03:23:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso1241658f8f.0
 for <qemu-arm@nongnu.org>; Mon, 01 May 2023 00:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682925812; x=1685517812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QkEQYBpga+gb0GKmst2KRP17ziGBhkAyFxuigIpKMwA=;
 b=WEbbnNDOXQnprcdBmQS/bKjVG0pq87SF4YSOlII+wtSqkEV/2rgerD2lyHCq2Z27jO
 /nPBlbK9Y2Tr5xUcil5KhZoFGy6fnkgi3q0o394y6YcT/jdqhi81/QNF5BpRsxY/+VEn
 USEr6XJSfmnXUFHRec5VwljSYB1KgUZ+PUAbdpJGJRiEwcp/LwzfnoVw1ruMaETNJOhD
 T31+My4NG3PjqldCCjQerl+Mg9qm62RC2EywJkX6ltdUnWGM1E2lVoZjtOxw2jWxSee5
 nPh+4OydNgkDd5VqDUBX1qTse9/jdWOgFwP82afxzPeGmUmUCYfI+QxHycsJYsSCt869
 U+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682925812; x=1685517812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QkEQYBpga+gb0GKmst2KRP17ziGBhkAyFxuigIpKMwA=;
 b=HGto5DB+AhcJbVT9/+ms/ongphscId55o3sBaNd0kSRpaeRcknqMC1EJCyAEhipN3x
 JMc3cj6HMTlKQPyTECrqgrlxRNrRThv2epG0otfT0IQyOMwT7kZy7c8J/ebIuLjkgSk6
 BpPVX08A/7N8/7x5WBBAeDwM/ouwxTevQj8+H62EdKNBH2trXfVCIp5ycjC2x3zeHqMM
 FCNTeNKWkJ78VUzx3h8nFEbeCGHBW7GmPXsL8WvGkecWjtTC67wjwWxFSjEg16+NQ3Hf
 AybBkQ3sNZHV5XfyyVGDJx4xvyGa0e9bS5r9RD4RQxLAjwwV/nkepHi6j1nw8vWlfCW/
 EkGw==
X-Gm-Message-State: AC+VfDwqzxwX8UHlaI5Cj/5X1N51utRxWvaW61JfAjAIH7cdrPZQ1vFC
 +fLPQ099IpejChiqXbLC0oeDdA==
X-Received: by 2002:adf:ef8f:0:b0:2f8:e190:e719 with SMTP id
 d15-20020adfef8f000000b002f8e190e719mr9699690wro.65.1682925811845; 
 Mon, 01 May 2023 00:23:31 -0700 (PDT)
Received: from [10.175.90.180] ([86.111.162.250])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a7bc045000000b003f32c9ea20fsm7087316wmc.11.2023.05.01.00.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 00:23:31 -0700 (PDT)
Message-ID: <5e6e4294-6b29-79d1-4054-48748256f843@linaro.org>
Date: Mon, 1 May 2023 08:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 54/57] tcg/ppc: Remove unused constraints A, B, C, D
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-55-richard.henderson@linaro.org>
 <ad6f28e8-e60e-ace4-5eaf-b754e8ac36c8@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ad6f28e8-e60e-ace4-5eaf-b754e8ac36c8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: j56hBl4jM00N

On 4/29/23 13:29, Philippe Mathieu-Daudé wrote:
> On 24/4/23 07:41, Richard Henderson wrote:
>> These constraints have not been used for quite some time.
>>
>> Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/ppc/tcg-target-con-str.h | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
>> index f3bf030bc3..9dcbc3df50 100644
>> --- a/tcg/ppc/tcg-target-con-str.h
>> +++ b/tcg/ppc/tcg-target-con-str.h
>> @@ -10,10 +10,6 @@
>>    */
>>   REGS('r', ALL_GENERAL_REGS)
>>   REGS('v', ALL_VECTOR_REGS)
>> -REGS('A', 1u << TCG_REG_R3)
>> -REGS('B', 1u << TCG_REG_R4)
>> -REGS('C', 1u << TCG_REG_R5)
>> -REGS('D', 1u << TCG_REG_R6)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Is the J constraint introduced in commit 3d582c6179
> ("tcg-ppc64: Rearrange integer constant constraints")
> ever used?

Nope, not anymore.  Used to be for and/or/xor, now replaced by more general constraints. 
Will remove.

r~
