Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3760183ejc;
        Tue, 29 Aug 2023 08:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC7coMiUUmgCpP2nPC2obgvxNZrwdIzAUPJ6aN/C0mKlOjWayNd0KxKsYL8urCLmhzHPQ/
X-Received: by 2002:a05:6214:1395:b0:649:cbd0:8127 with SMTP id pp21-20020a056214139500b00649cbd08127mr31405875qvb.57.1693324453193;
        Tue, 29 Aug 2023 08:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693324453; cv=none;
        d=google.com; s=arc-20160816;
        b=ZyF4kKJGLK0WzFdth9bus0mqisV04aXPMT/bVsCnQ1m66uc7IFWwBWGK0fv5mQ73ar
         qdHiaA/BMdWCy6eDeqAoPXBJVryz6sxQzbhj1z7qVpLzrqqm9j8CtiYb4vNis3Fycu5L
         HLfkTeKxj5XI6cB1X8nbrIUnglEkbxVb7vpqeH+P2/4Z3fzqnvtCOyF/N2Ttur7WfE7j
         UKNxJi4ouE9uoVwYaXDJIEUUQCWIoQ6vyXbjggqeqgNvu66WstwthzMZkUmTYCYEvi2L
         WCnjNh2pE6woeVFsuOPz6nQpxtBgO5/WJHE6WoHXs8HEeWre5FRpk8rQ1HnMEY6ByuIY
         Qy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NPUupQhjPaZscIMuSsKoDXRu6UZtAAPe3Rb66X0uhb4=;
        fh=VQUMc85x8ANizanga/Uk0eVpSOWbPwTPWK+d/C2OKHM=;
        b=PNsr+qlJHZ51iLJJKIwYtQtogEfGEOi+W1LcoUeAHY1aDlJ2YxupIZIa316atYdh62
         nZalPHS6KA7cQt+uoGDNEm5FVLuhMi7N69SAlayyFphjwSbmZER/Ow8F26oSmCAhkjZ4
         mv69EB8vZRxEcFXWt0XhvFEUiKOrJsfOpGZ4ezfFZ1G7pa/eQFg/5trtFx8+rAa9/isw
         mFFX2Yoc3aMIafP8OX9gOx483rHRWse63jBthFfE/wm1Q87pOlk0D0vxLHAb8YH2suXH
         kzmEVBnESjm9e41mgm7C7PCkI0DAwIhbmZBQDY+YVGeTt47x/9XOE9crvuuJIADF4XWf
         YBjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVrmFpwU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a0ce107000000b006490bf29de6si5988303qvk.309.2023.08.29.08.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 08:54:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVrmFpwU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb12B-0004Xe-MF; Tue, 29 Aug 2023 11:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qb128-0004X2-Qj
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 11:53:36 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qb120-0007M4-Vi
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 11:53:33 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50091b91a83so7063448e87.3
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693324406; x=1693929206;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NPUupQhjPaZscIMuSsKoDXRu6UZtAAPe3Rb66X0uhb4=;
 b=zVrmFpwUKp9HPV15y93B4oadeW9RA4r+OjpXOQxqxfzJHCiwyFkvSwlAb1s95IOJda
 vV3ZGs2BwDxAJrsNyXtyR+t73rbcoV1UgBjFEWYceTqF0WgMOUhpiPcouRTPxfClINuy
 MO6rcoSBuxsq9DVwkaRyQi1AAmfaSpwkcJypzBRCQx0DYf+NFvXUbVMnxtU2XCxfenNA
 RmIyoXvA6UO4l3gPwkC+EHzNKSQpgtcXdNDXT8jnyIFlc11EL5EmUS/oJ2NzO2KAx1zk
 w/nHGj9G7FueQLsIoTMn44T5VQcql+EgMbU2YziNVFxEmKQlUNeBNlz1rhWa++I0RDcp
 NCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693324406; x=1693929206;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NPUupQhjPaZscIMuSsKoDXRu6UZtAAPe3Rb66X0uhb4=;
 b=X7PYVLr9pj2Y5Axk9p75MXFNMV6DwVrLo0ItMEwjl0vvTIAGPXdTxqkUS0gXhYXfVD
 8qxtmjytMDaLquVFddiAnkhAEMKQwcbn4t0xFz5BAN+w0wwyXNKA6YlVHPU//M74/3wt
 fF6tz+sKqeQeSRdhpAGqXpmuVKJkJyBLAiY2Ijnt27ONTGjoJhPvJTGbDDHxVJvxtkYY
 AuEDbOCZUxvEy5z5xVrEbpwKXdXt/csRGJwBB9MzP4POhzNGrH7PlFumAwsop3rWE3vH
 n5BAYMzb2+7/kEmKQZPHBlBUIDsVAiQPRD+mTdu4HZgiMQ/HeFQvaNlkjB1zKzbmgHxC
 kv1A==
X-Gm-Message-State: AOJu0YwrUF6XNf7C2PZ0qtJgEiUAWfRhphfGgCfIGvEAwPfcNtZkc/3/
 rksEU1pVi3TW6OIbofZNcka5pg==
X-Received: by 2002:a05:6512:ea4:b0:4f8:7897:55e6 with SMTP id
 bi36-20020a0565120ea400b004f8789755e6mr25619892lfb.45.1693324405943; 
 Tue, 29 Aug 2023 08:53:25 -0700 (PDT)
Received: from [192.168.69.115] (sml13-h01-176-184-15-56.dsl.sta.abo.bbox.fr.
 [176.184.15.56]) by smtp.gmail.com with ESMTPSA id
 h12-20020aa7c94c000000b00528922bb53bsm5786887edt.76.2023.08.29.08.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 08:53:25 -0700 (PDT)
Message-ID: <02cd3850-49f4-7a0c-7f92-2461582dabc1@linaro.org>
Date: Tue, 29 Aug 2023 17:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH] target/arm: Use deposit_z() in BCF opcode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230822095156.39868-1-philmd@linaro.org>
 <CAFEAcA8CWDg8cBjr_KJdTE2AvvdksU7jGhfHp5sdQU7FHbAb4w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8CWDg8cBjr_KJdTE2AvvdksU7jGhfHp5sdQU7FHbAb4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GlosMf5HBZ/5

On 29/8/23 15:20, Peter Maydell wrote:
> On Tue, 22 Aug 2023 at 10:51, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> When clearing a bitfield we don't need to lead the
> 
> "load" ?
> 
>> source register. Use deposit_z_i32() with the BFC
>> opcode to save a load_reg() call.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/arm/tcg/translate.c | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
>> index b71ac2d0d5..1a6938d1b3 100644
>> --- a/target/arm/tcg/translate.c
>> +++ b/target/arm/tcg/translate.c
>> @@ -7255,7 +7255,7 @@ static bool trans_UBFX(DisasContext *s, arg_UBFX *a)
>>   static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
>>   {
>>       int msb = a->msb, lsb = a->lsb;
>> -    TCGv_i32 t_in, t_rd;
>> +    TCGv_i32 t_rd;
>>       int width;
>>
>>       if (!ENABLE_ARCH_6T2) {
>> @@ -7268,15 +7268,14 @@ static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
>>       }
>>
>>       width = msb + 1 - lsb;
>> +    t_rd = load_reg(s, a->rd);
>>       if (a->rn == 15) {
>>           /* BFC */
>> -        t_in = tcg_constant_i32(0);
>> +        tcg_gen_deposit_z_i32(t_rd, t_rd, lsb, width);
>>       } else {
>>           /* BFI */
>> -        t_in = load_reg(s, a->rn);
>> +        tcg_gen_deposit_i32(t_rd, t_rd, load_reg(s, a->rn), lsb, width);
>>       }
>> -    t_rd = load_reg(s, a->rd);
>> -    tcg_gen_deposit_i32(t_rd, t_rd, t_in, lsb, width);
>>       store_reg(s, a->rd, t_rd);
>>       return true;
> 
> The comment says we are saving a load_reg() call, but the
> code change doesn't seem to do that. Before the change:
>   * for BFC we call load_reg for rd
>   * for BFI we call load_reg for rn and rd
> 
> After the change:
>   * for BFC we call load_reg for rd
>   * for BFI we call load_reg for rn and rd
> 
> So we're not saving any load_reg() calls as far as I can see ?

Indeed you are right.

The optimizations are in tcg_gen_deposit_z_i32() vs using
tcg_gen_deposit_i32(). I'll reword the description.

Thanks,

Phil.
