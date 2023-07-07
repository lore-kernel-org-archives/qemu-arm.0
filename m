Received: by 2002:a17:906:b1d4:b0:98d:b2f5:1316 with SMTP id bv20csp724479ejb;
        Fri, 7 Jul 2023 12:51:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFOTTE8RUX/9pna5aoCVbkd4rjgPjwTs/kWvOOpSDSQ7B3AEGDzTubidKJPv8W+AgVvv15d
X-Received: by 2002:a37:f708:0:b0:767:1613:cd2a with SMTP id q8-20020a37f708000000b007671613cd2amr4656067qkj.15.1688759459751;
        Fri, 07 Jul 2023 12:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688759459; cv=none;
        d=google.com; s=arc-20160816;
        b=02MU1c5R5cdWNz4nY0hZqI4KtdlyeFled9TWXn5qoi95fOd+0pj4lvBqIzuKJK7BEa
         LbLbTc8W7BKmUUtWaX1l3r5aJAlnwGVyhVvNKdtnj6Na+sxmPI9oXobr7bhrqHkUtynR
         eyK9re+T7euLvhdGC5W0DjMoJlwKaHX2jUcJdIHUAF1DGR8+RlXPNc+FcPzwnSlTMlkx
         rVge/BFJvkkkszm8q+EUgWM6eMSuF+MOjERxcFu5VDaJ55ywPOwFnLl8BfgDzSbuL++A
         HyVgYYRYRtYfXncfiSfzmkQpIIMMojvXePe34Z69I+jDShdBGdX7elbm7AvXuxD00t0i
         DgLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oeUR+SdX/6yesgIiuLAqr0CsQFOhF/7irAv5qteWJGE=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=xeLuFSA015z6CLu8ovN3BOctPrZawpmHYZiUjr9eDVIIKjahTPr445NdgyRn2MxLoG
         ZokG23tE0Djr242KYYz6AbArGXgUzPs6wqW1KHItBFuGM/iY5xRA5qrbX2l5MWbED7ex
         Wy+hch3jM3Bv8+yFlQz7yuGydN2GYkRPzSlh49ahglofmsu8X5tgMxQJpJfGT3UEWuCr
         U7Bj2oZYgZV5gqa6iCiF8dEinWUPMQ+LsPJ6a4DsbYM3k8qCOUc2gahb5iZjPloXGjc5
         P65+p4vGwIYAjOhvaVR5fSqJ8OVX6G+tYNQ8BegnM/Xq9H0V0t84RaNXinCZ2a/Y+Pss
         VLvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KvX+XASw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2-20020a05620a112200b007679d734e15si3141409qkk.360.2023.07.07.12.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jul 2023 12:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KvX+XASw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHrTY-00028K-P9; Fri, 07 Jul 2023 15:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHrTT-00021n-C9
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 15:50:40 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHrTQ-0007F3-Hi
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 15:50:39 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5149aafef44so2976734a12.0
 for <qemu-arm@nongnu.org>; Fri, 07 Jul 2023 12:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688759435; x=1691351435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oeUR+SdX/6yesgIiuLAqr0CsQFOhF/7irAv5qteWJGE=;
 b=KvX+XASwH8gFK2yBTejVf+FyxyXxC73W5+hPAUFkQmmoMONyfV0xUCctrLGAKrCpTK
 hfEcTsPO50TbvDydTD+rKGPr3rjaRHrnScPN1dq9LDrcaTuA1WOn6qtz5TJis2R6iKUz
 cPTUhX7yS7jaZBoRUN6qjS82wHznivvhjlB/ll0Z3WIN0KaRoJPnbXDeKeSVyvewdKwW
 mUsfjn1jOfaMJaCW8+0FhIbbQ8w6SBf6p4H28aTOkRMHeU7ZmiIJU10vVuW90apqavcO
 j+apNPf/WUMjJF4VOudkgOFGJkS7nWaB8nTH8EO9DJ0wkui1TjDqQ0ec+EckgA534VVe
 5now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688759435; x=1691351435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oeUR+SdX/6yesgIiuLAqr0CsQFOhF/7irAv5qteWJGE=;
 b=BGmfJjc440pQCv/d9TEgAW0VBu7g+ElcXbNVxJ4is4TFQvdtefpM5VtnjNR6osSI6p
 HLUoZy3YR8i8ajm6vTDy51sjdj+kUuLu+rMhVDVkDu7sTXmuXM4mS6H/3YIKoPvJJlPp
 RnnqPQ6sa/Q7FqPnF8BUNvzs6KVK1/t3coCDU0V5KGJvggzXvotC00SdDp01UWKPkvV4
 dyTEO7Zcn8HkdqDh7klNqR2t3Ge9T8NsVqc5rXlBHmFGDsLOKjKkPSqwfcvVrmrKVJS4
 hTz1hk1fALfoFmZO3ObDJ9V9CRwzXk14q3vqR17rWklMlbp0yVlr8BdjQpi5JCnzUY2y
 krkw==
X-Gm-Message-State: ABy/qLaBTHPHdbB61zEWZkkoCehBkGyUi/hEvPogfzFwmTYc51IU3Mnk
 /5eg5W5ycItLtkjIGft4fNedDQ==
X-Received: by 2002:aa7:ccd4:0:b0:51d:e255:6173 with SMTP id
 y20-20020aa7ccd4000000b0051de2556173mr4628748edt.0.1688759435091; 
 Fri, 07 Jul 2023 12:50:35 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.215.192])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa7c716000000b0051df13f1d8fsm2398964edq.71.2023.07.07.12.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 12:50:34 -0700 (PDT)
Message-ID: <35340e21-fff9-e04b-808f-0eb9775daea3@linaro.org>
Date: Fri, 7 Jul 2023 21:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 17/37] target/ppc: Use aesenc_SB_SR_MC_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-TUID: AVOrq699GRXj

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the VCIPHER instruction.
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/int_helper.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

