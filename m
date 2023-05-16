Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp429924ejq;
        Tue, 16 May 2023 06:56:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6bgo7kAAJu7pgiFFK2Rw72PHARXAvS+EgX3sDQPcug+w0uL9FbPFL4B6XpVp5rCInc6s8t
X-Received: by 2002:ac8:7e92:0:b0:3f5:2faf:7912 with SMTP id w18-20020ac87e92000000b003f52faf7912mr9576315qtj.61.1684245395092;
        Tue, 16 May 2023 06:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684245395; cv=none;
        d=google.com; s=arc-20160816;
        b=Bz/Lt6Z2LMlgnc91Slx6Iei/8Uy3qtmqtrnj8mhr5F43BD/St4MWF2LSXmrW0b8m9T
         TunFTeiWpBfVAkjKTwP3VZvhsV84Sex5cfS79MIqPTXH531H7mLuvjEoJsojy0aoshQt
         dW4XholPaV2CF+a+6RwfyCsHmL9NZp7W9V/e4NoqgI5ni9HAdk0LVNQ/j3Hj6JwGv3zL
         rlKsZuUzHMz8v4EYqY300JfsIjTQGAItU5clq1sidgdhtKZE+oLwa7Diu3yZihOIf8Wp
         zsyJOGdFxlNkz9q2Tnd92QiFbnVgAuyy4JbdhdDJvx1dEsB5SuSCtvNmHnH9/xTO8rvL
         PK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3WEaHI/gSVlHRgjCVBRB8TQJX49+OkP7QQkY6jMPBx4=;
        b=BPpxNHJAf2wq/Vmo5SMDWrXq/g2IP0ystEEPbbh+cc24h4MLRDj6Q2c8yTSaAbxDd7
         muTsvgKSyDA8cRK6vLl4KsDJC9gHZJ7sy7ur6z8s7W+mc596uZPkcdbYPimkT3HpGXYm
         A/NzWZ2GgZrRbEnBedF4ac8opgChkYQreunjH9FTiRnL8IBA4rsM3HSPKjKabKcV7wiG
         hSVWTs874bJpim9Ld2Tvc28+ZLbZCxtCVGy/UJJ/FWPLQSjiKlRxyc+LPQ/x/iQZIvO3
         DMe21CbN4MONDXclTiNzZjqYrySGKSgaVRiyAycSWy816gvc3q9+QpvTJXCeXppcwLVG
         /e8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UlcpUed+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h27-20020a05620a10bb00b0074cdcea5d2dsi1223968qkk.324.2023.05.16.06.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 06:56:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UlcpUed+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyv9v-0007wI-UX; Tue, 16 May 2023 09:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyv9u-0007vg-C6
 for qemu-arm@nongnu.org; Tue, 16 May 2023 09:56:10 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyv9s-0005mx-L8
 for qemu-arm@nongnu.org; Tue, 16 May 2023 09:56:10 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aaf70676b6so101471585ad.3
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 06:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684245367; x=1686837367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3WEaHI/gSVlHRgjCVBRB8TQJX49+OkP7QQkY6jMPBx4=;
 b=UlcpUed+Wc4DDTNR0zURqrcjU5tVclkRE9ynsXPKgbI8AlVV2n3m1eWoCpIhkO5En1
 32QjoxRtGqJ9TUVKtYgkyaOk4WRYOGxMfYqnqC4ufF85UAqMkRtC5OQrgyTS6A53/5l1
 YS+yTugobTtFoD+2xRkXL4pfIKfpBIfTAltgf3FEfrw27rwF6XLtLLITJyp4g5d+O/Qf
 oJLpX5oQFumuMvpAS+KxO+kqBaDgAWc6rpk8u937oLkohKH01hF0QUQY1s3IE4xpcqJl
 FLtUY1FcL76nC+xSnn1lvU9g4toQgstNPB/gl8NLLcvflhBJM5Bo4F7S3oWpCxr48Ttt
 UbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684245367; x=1686837367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3WEaHI/gSVlHRgjCVBRB8TQJX49+OkP7QQkY6jMPBx4=;
 b=JSccVcHbN8jQDwOaQtSzY0Zdm4pmzdDR9D2K7fOKlOzoqOYoYU12GIHTQslw0nU7vQ
 0l4/EYiznUJaZg12oh1IAYHYoNHcQ9g4/aAUYLJyBLiw81AGCviXRoBwSpbg1pyaV0/P
 nCgsPUbdsKiHzSfLRNriVaRFF7tZWZV2LE1iTpDg+PaZ8EHXbDxQNqR9Qr+PWHKMxV55
 CffWHASUrQKA99LOAD9kI8yqZfXN/3Ugure7q/Dor0mmyLcsy25nFUSDqOtWNH217GTM
 9vy1NQOeW/+SYunChnbm4wVKGBFe5NJVV1xmp15U6GzvBj9nNRQvpbl5Srr2kkC9v4oe
 8w2A==
X-Gm-Message-State: AC+VfDxWcc8cwgZE+0UsNUn16UKWHJIbgPJheoDgfyM2AII7MrNH+Ycy
 B92bnCCZHphH+vdh6GrGeiFyNg==
X-Received: by 2002:a17:903:2292:b0:1a2:3108:5cc9 with SMTP id
 b18-20020a170903229200b001a231085cc9mr50401700plh.40.1684245367236; 
 Tue, 16 May 2023 06:56:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:ec81:440e:33a4:40b9?
 ([2602:ae:1598:4c01:ec81:440e:33a4:40b9])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170902b60f00b001aafe232bcfsm15523274pls.44.2023.05.16.06.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 06:56:06 -0700 (PDT)
Message-ID: <847c896d-76cc-73c2-e147-da78c4a0b38b@linaro.org>
Date: Tue, 16 May 2023 06:56:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 36/54] tcg: Introduce tcg_out_movext3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-37-richard.henderson@linaro.org>
 <CAFEAcA9QxgOuzhQn7=9rXcMTtFiyL2vXtUni0ypSzMy+a2BuzA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9QxgOuzhQn7=9rXcMTtFiyL2vXtUni0ypSzMy+a2BuzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.666,
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
X-TUID: 1qHvwZsthPKU

On 5/16/23 03:03, Peter Maydell wrote:
> On Mon, 15 May 2023 at 15:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> With x86_64 as host, we do not have any temporaries with which to
>> resolve cycles, but we do have xchg.   As a side bonus, the set of
>> graphs that can be made with 3 nodes and all nodes conflicting is
>> small: two.  We can solve the cycle with a single temp.
>>
>> This is required for x86_64 to handle stores of i128: 1 address
>> register and 2 data registers.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> 
>>   static void tcg_out_helper_load_regs(TCGContext *s,
>>                                        unsigned nmov, TCGMovExtend *mov,
>> -                                     unsigned ntmp, const int *tmp)
>> +                                     const TCGLdstHelperParam *parm)
>>   {
>> +    TCGReg dst3;
>> +
>>       switch (nmov) {
>> -    default:
>> +    case 4:
>>           /* The backend must have provided enough temps for the worst case. */
>> -        tcg_debug_assert(ntmp + 1 >= nmov);
>> +        tcg_debug_assert(parm->ntmp >= 2);
>>
>> -        for (unsigned i = nmov - 1; i >= 2; --i) {
>> -            TCGReg dst = mov[i].dst;
>> -
>> -            for (unsigned j = 0; j < i; ++j) {
>> -                if (dst == mov[j].src) {
>> -                    /*
>> -                     * Conflict.
>> -                     * Copy the source to a temporary, recurse for the
>> -                     * remaining moves, perform the extension from our
>> -                     * scratch on the way out.
>> -                     */
>> -                    TCGReg scratch = tmp[--ntmp];
>> -                    tcg_out_mov(s, mov[i].src_type, scratch, mov[i].src);
>> -                    mov[i].src = scratch;
>> -
>> -                    tcg_out_helper_load_regs(s, i, mov, ntmp, tmp);
>> -                    tcg_out_movext1(s, &mov[i]);
>> -                    return;
>> -                }
>> +        dst3 = mov[3].dst;
>> +        for (unsigned j = 0; j < 3; ++j) {
>> +            if (dst3 == mov[j].src) {
>> +                /*
>> +                 * Conflict. Copy the source to a temporary, perform the
>> +                 * remaining moves, then the extension from our scratch
>> +                 * on the way out.
>> +                 */
>> +                TCGReg scratch = parm->tmp[1];
>> +                tcg_out_movext3(s, mov, mov + 1, mov + 2, parm->tmp[0]);
>> +                tcg_out_movext1_new_src(s, &mov[3], scratch);
> 
> Isn't this missing the "copy the source to a temporary" part?
> I was expecting an initial tcg_out_mov() like the old code has.

It is.  Sloppy of me, and I haven't re-tested ppc32 this week.


r~
