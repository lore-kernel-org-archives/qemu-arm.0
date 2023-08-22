Received: by 2002:a17:906:f150:b0:9a1:ac8c:26bb with SMTP id gw16csp39305ejb;
        Tue, 22 Aug 2023 09:11:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgMsOXDWKKX+VOWEoSRXa+8+stJ+bY0CsGJPLgDTmjR4rDBqdy/UTpBIArpAOdq4qx0HIG
X-Received: by 2002:a05:620a:4546:b0:76c:cac4:5560 with SMTP id u6-20020a05620a454600b0076ccac45560mr14135079qkp.52.1692720693038;
        Tue, 22 Aug 2023 09:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692720693; cv=none;
        d=google.com; s=arc-20160816;
        b=J4RXy4zW7k9r/qxnH8bhDiZAXIiydrzRwquofC99KzyFao6Rzbs1XyFxjo2T9Gks9S
         G5oqLinoZ714igtNHjbh3gEHmDESaMMC0dd+TgAyD00B+oFYo2zQbRDAR3zzJl3Op40b
         HK3RfZHsuT9uYdLRhWomovjZzZuiAyHCznid4ZR7Y6bMu6EahJv6nTmn5fmY7ccF4Zi/
         kqFrtrn/XsMeZoe/LyOpNaw/b0xM9MB0jG4BIjHNR/3UC4ZLLvyvvjpjlbXflMJ/GbU+
         uaOMN6TXtePJmRroZPmmJzGYtAo4Tq9wh6/M3V3bCv/wZm4l4fWI1oWXMgtq7r/KuI7u
         Q2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fYXOxCO8GCfJ+uJeY+lM2xEQWVhSlqX7B6CBlP/rDRw=;
        fh=8L+Y0sX5ka1vdDXPooEkad+lygkQX3M6wbqmj3mQddc=;
        b=s09th9qnygmZ3W04hvLJSXSnB4R3JE4ODlFMQErVD6V7/YSBJTrL/HohdydoEbYCR2
         /VpeKAk6a8IaeyN0v1iPC/BGub35Ei3wgc+030kXtGb56Pzlr4gdwGBXDgjOtQyb/dg9
         u8aa6bs4TOf7iMkdtc6g1GljugAdu/0XOOiEhGRtCUYxKUjp5eizZ9JSZ5N8ty30gjrh
         uXXtTOz/i75tfFRGoGh2jI9WWnnWIKom7v0O9O32X0kC9LvzJ5Y2rD9M19uOtLnVpK7Y
         vJa69FY3VGH8PTcDR1rrywAjj3+DVUAFgBT/Q8Y+BvbAtQbNzX4NF+QivP14muY8NAGe
         wTAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k6njMkkD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id py4-20020a05620a878400b00767c533af76si5941326qkn.686.2023.08.22.09.11.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 09:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k6njMkkD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYTyY-0003ZA-JF; Tue, 22 Aug 2023 12:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYTyX-0003Yp-DR
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 12:11:25 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYTyU-0007ve-QU
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 12:11:25 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fee5ddc23eso32588205e9.1
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692720681; x=1693325481;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fYXOxCO8GCfJ+uJeY+lM2xEQWVhSlqX7B6CBlP/rDRw=;
 b=k6njMkkDDgSKtykAiW2sykCWDPGt4ZOWHGn+6pHzR7EZB+3R6gveFge3obp6bhsxEh
 QpnkhOTnoc7saRf0V9pvs2cjniV4Dr8bxuNmK8mJLsK1RrIXRYwqEs+O/VE6BhiE0EPq
 pG5X7AuT/glrKVY09mOSZxqpfdhfTpK5IOhd/HQt3Ut7KcaX150ZlppnQHHRWkSmEb43
 hpqHzSD47oqDzSs8z5SrgiyvhhruY/fwAZTTzuLBnWAuYYuzarGL4bWS9vLEeNjuwpBz
 kyzQeHbiXXKMZnS6DR9TDZc4PfhvlAk0PWMK9ckOmrKGMf41GENt7AEv1uQQxMr/Q/DH
 1ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692720681; x=1693325481;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fYXOxCO8GCfJ+uJeY+lM2xEQWVhSlqX7B6CBlP/rDRw=;
 b=FAprnvW76fVt9IB+Ltc+bBCZmisxCmg40Y+FxUug1qjrYcKmAdErEUPuQwIeud4QSz
 7D1L0GGOiXXDi8z4bLNRIzse1UId50YH0dQOjTz2UOmHyXX/P7WlLQNEqRAsCFXTHdo9
 u2ZR4LdlMrTGrb8BnAdZlhhVUzRFaxG3A96c15gtsR+8oAd0IJY3c2oVbu5H9oOxy1Ng
 mJXFdSbPz3H6TtPcQ0tUn61Q/TaEKX84/VH04IV2foin009cwxV+u/UjK/JNARz9w1y8
 iQ4wOmrkp5Va4ysMrdxlcA66AkgDQdtoupF7Nvy0QvgKWVEz6SDG9Wm4c024XAhOunmN
 7GBg==
X-Gm-Message-State: AOJu0Yy4STFBaz6WqzY41fuseWpQB8gAxXa2Y/e2pKjIUeZAxzqFdwDl
 MNmQ5/nir+Ew9OzqGcSbFRGmyQ==
X-Received: by 2002:a5d:4389:0:b0:306:46c4:d313 with SMTP id
 i9-20020a5d4389000000b0030646c4d313mr6435045wrq.28.1692720681057; 
 Tue, 22 Aug 2023 09:11:21 -0700 (PDT)
Received: from [10.2.0.2] ([37.19.214.4]) by smtp.gmail.com with ESMTPSA id
 b4-20020adff904000000b003197c7d08ddsm16289194wrr.71.2023.08.22.09.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 09:11:20 -0700 (PDT)
Message-ID: <9ad24cdc-adf4-0a38-9362-e46c559fae7d@linaro.org>
Date: Tue, 22 Aug 2023 18:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 11/12] target/loongarch: Use generic hrev64_i32() in
 REVB.2H opcode
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230822124042.54739-1-philmd@linaro.org>
 <20230822125221.55046-1-philmd@linaro.org>
 <1ea2097b-fb72-29c4-622a-79f96f69c2c1@linaro.org>
In-Reply-To: <1ea2097b-fb72-29c4-622a-79f96f69c2c1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.767,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qhHjgtAEYOPO

On 22/8/23 15:30, Philippe Mathieu-Daudé wrote:
> On 22/8/23 14:52, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/loongarch/insn_trans/trans_bit.c.inc | 15 +--------------
>>   1 file changed, 1 insertion(+), 14 deletions(-)
>>
>> diff --git a/target/loongarch/insn_trans/trans_bit.c.inc 
>> b/target/loongarch/insn_trans/trans_bit.c.inc
>> index c04806dc21..9d564a0999 100644
>> --- a/target/loongarch/insn_trans/trans_bit.c.inc
>> +++ b/target/loongarch/insn_trans/trans_bit.c.inc
>> @@ -111,19 +111,6 @@ static void gen_revb_2w(TCGv dest, TCGv src1)
>>       tcg_gen_rotri_i64(dest, dest, 32);
>>   }
>> -static void gen_revb_2h(TCGv dest, TCGv src1)
>> -{
>> -    TCGv mask = tcg_constant_tl(0x00FF00FF);
>> -    TCGv t0 = tcg_temp_new();
>> -    TCGv t1 = tcg_temp_new();
>> -
>> -    tcg_gen_shri_tl(t0, src1, 8);
>> -    tcg_gen_and_tl(t0, t0, mask);
>> -    tcg_gen_and_tl(t1, src1, mask);
>> -    tcg_gen_shli_tl(t1, t1, 8);

Looking at 
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#_revb_2h4h2wd
the sign extension is missing, so the next line:

>> -    tcg_gen_or_tl(dest, t0, t1);

should be replaced by smth like:

         tcg_gen_or_tl(t0, t0, t1);
         tcg_gen_ext32s_tl(dest, t0);

>> -}

