Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp592817ejn;
        Fri, 14 Oct 2022 11:46:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57gihPvTU87Fdm57VPTdC0NE9/DN/NGjnMQznQqlp2WY+1G70zhZ4XaXyPrMZYy+vgse9n
X-Received: by 2002:a05:620a:29c4:b0:6ed:2379:7be4 with SMTP id s4-20020a05620a29c400b006ed23797be4mr4751302qkp.208.1665773215002;
        Fri, 14 Oct 2022 11:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665773214; cv=none;
        d=google.com; s=arc-20160816;
        b=Kfx3B36DnaxuV2wqiN32wBf3KNkVluNSc4jGUdaUR7ij6RrtmZ63sdFgWWGfvL+UFu
         qsRctVZKySMvbjVddZ0xkE7Par6w+aA1AfvH0E3yHGwx8w4f/rSGrv1GRxfaBejGzbOS
         VHx3wG4lOUjKeE6YREkVEvq0bqUn1aBqvEBK6GGtkXmIyJFsx4Ov6jz5hN5s2KL06tbD
         /VHcgbwWbY7O3Zx6+9Rlrpsr1N1OQzFyGBKk12rZNDMtoKdUs1+VfM3hwECFPjSz8ZFh
         7JvZ/LiEDKWZwUAVsF4plGd9OzM+fxVfNyllI/f94Re8ER58tqIB5oEP1/BWtOpj7M0g
         2Uow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bVRISwWg+YApByjtm9TBzbXPhejuAEJFZrHBh71/t+E=;
        b=fAnY9GdHP2SJCwSg7zGfvCs8gphftvrgZ2civBbDZtwt6zsYzKQO9jb9mcl7ipD79Y
         ocsUlzi3lMao9qAW7W1HgzzGp8VPOszTDr39aGJeFffScLHPG0l67r7QgjvzD6UAh5qX
         aPWDXLFG8LFC5bLhQgYu7/THo7V9wIyeIt5ExX0LJjb7jI1KTvoPsEFLDTURUc2FIbZM
         gs0JXdLR/Ymjs5yFEGslYTOLCN6yYMFiI6z9YPXtRG+tPNL5ucDiUKrm5OCg1LiPiPHz
         sz/A2lDPCFYxRQOj4tkLZYjhRBtN8a0u1OjzBxbMGjaIIgpzUNPa816K/e0pHJLjNKVc
         VVDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="whIE/pNN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu11-20020a056214260b00b004afb3ed8ba4si1859608qvb.396.2022.10.14.11.46.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Oct 2022 11:46:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="whIE/pNN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ojPhu-0007r4-Fv
	for alex.bennee@linaro.org; Fri, 14 Oct 2022 14:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ojPhT-0007oH-T3
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 14:46:27 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ojPhR-0001QR-N1
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 14:46:26 -0400
Received: by mail-pl1-x631.google.com with SMTP id o21so3142980ple.5
 for <qemu-arm@nongnu.org>; Fri, 14 Oct 2022 11:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bVRISwWg+YApByjtm9TBzbXPhejuAEJFZrHBh71/t+E=;
 b=whIE/pNN/Cxgo/qLSuXc0KXlfL06dlZY6Ye0TgfBE6i8Ov/61iumfUjwi9nxuD2mTW
 PNR6czu4WnGS25X9g7kBFbjdkKscx/JwBmM3C6P0pnou7IM6g5tjoxViqMjiTDJ09U0P
 2+FwvKgqP5Ao5mN4qUZjjacbBUF5e7/mMjEFOkWTI5UNkZGnQ26CyBJ29+ldPDeGnvz4
 ysZkUOTIGWUI4gmeSaOwfLd6MAj0LxcliHv5xCASR4aY01wXNz+2S/UOnDbOeuoZotnp
 jG8jh8FRwsEbwXAGApOMBAfVPj3RzhAycNfzTVw3L2xNykspuaGAW4ywgO8ZMDWijZX4
 dqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bVRISwWg+YApByjtm9TBzbXPhejuAEJFZrHBh71/t+E=;
 b=WYHVxcBg97xCO2yKq7qNZz5pRW3xgal4sOJRAADKDAm2uCgR83M1rD7U6Q+WG9XqjS
 zY1vXNSqbkuo+pyZy1l782SSL2mnTGmPbhUaOWePEChWxHXI4rM4V3bp6CdzNN0hVPhH
 Sex5TbEIhnes37WTUJudfI91e1/YkQTzVzhLVbZcDIzD8EzBMTQe88lbSPQzHpn9id76
 Gn9O9A3P42pjDVZXUihmzPM0ZRA3c5sB52+CfW+kLlWDTnozd4lIR1bX7sfeoaTmMLJc
 YrNkjLngFe0mn9wzPcfxe4y/i8KIoXnc2N1PVLeg4MvYVpc/ZkhkvMa6QmolVLGcMtEK
 EOSA==
X-Gm-Message-State: ACrzQf2BLvmcGLeUYcwNviqMYD9rGdyDnDbj4ZJTeG2jXpWDd2aHguUq
 KOpv6Jjw0ZD+T0q0LSlbP5ZKmw==
X-Received: by 2002:a17:902:d34a:b0:17f:9be0:cdf9 with SMTP id
 l10-20020a170902d34a00b0017f9be0cdf9mr6646251plk.132.1665773183719; 
 Fri, 14 Oct 2022 11:46:23 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 a1-20020a170902710100b00178ac4e70dcsm2031567pll.185.2022.10.14.11.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 11:46:23 -0700 (PDT)
Message-ID: <23cafb0e-cd1b-d0d6-e2ab-6309296e4f50@linaro.org>
Date: Sat, 15 Oct 2022 05:46:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
 <20221006033846.1178422-9-richard.henderson@linaro.org>
 <CAFEAcA8zy2J06hZVt2ULJmbhQzDKRKrKBX9KaKLVHJhuudZQnA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8zy2J06hZVt2ULJmbhQzDKRKrKBX9KaKLVHJhuudZQnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.856,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tpjZjhazLDDs

On 10/15/22 04:53, Peter Maydell wrote:
> On Thu, 6 Oct 2022 at 04:55, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> @@ -296,7 +301,8 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
>>       TCGv_i32 tmp = tcg_temp_new_i32();
>>
>>       if (reg == 15) {
>> -        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
>> +        /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
>> +        gen_pc_plus_diff(s, tmp, (read_pc(s) & ~3) - s->pc_curr + ofs);
>>       } else {
>>           tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
>>       }
> 
> This is still doing the pc - pc thing -- I guess my comment on v5
> crossed in the mail with your v6 repost.

Yes, v6 was posted a couple of days beforehand.
I'll do a v7 with the change soon.


r~

