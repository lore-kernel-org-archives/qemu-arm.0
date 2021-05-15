Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1385404lfg;
        Sat, 15 May 2021 09:25:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCKUv1CGE6F1bccE6QMe3T1uAHf8y+RhspcH1MkRmLQyb8HL/ERj8PPRZVTWwV3RuAeyQF
X-Received: by 2002:ab0:6096:: with SMTP id i22mr1066742ual.94.1621095954930;
        Sat, 15 May 2021 09:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621095954; cv=none;
        d=google.com; s=arc-20160816;
        b=R+SLvLEU4QKlZlMSlaeQRJIFSjAy3Fjiya884lKMej+0SGrdmpXeEmFQE64q65UsdN
         aj2oOUP4v6+Rf9uL6qtzV12xHYN2zBWn82wJ3ofANd3SkAxvukw4kRjyuTz/l55aPwnZ
         2Zvbd15CySUsPQ8MZ44ikMYFpUw+64PN7yh+kfXqOHVWB5L70/XhdbNLZhqh3szdHn+B
         U9kGLTtySHqh+rnBrELGxgdM7uitKO8t4rgfiJVazSB5f5TZ9MUL9HElMPLJtoc2t3xr
         2aVEKjICtL63C83HlIaGeXK2ut2XTJqtlFhQk7C/kT7AodBDu8qchuOb74bLFytzHENY
         uP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5YnQ3YIifzuU0VS0Vo8dZJ9XTMwwcIAepO0Y/B4psgo=;
        b=fhZjOKubDGdbq9W43rYMgPRRg6yBVOe4qW7TizVqHGNTNr9LXftLUihguygIk1a5vq
         2TvYzLWjXH/iaPLCXCdlGATxku1pik0GkHWW9p2HTGmHAyzxIgKo8+KtvE0eXl1/zVA9
         Dp2eNfmtNne1GWeUZrFJk8U8Yzi7fFkU7Zx5Ml9IMbqOSp9yFbdrbkyxIUMZzBFbcqBx
         Y/QMvar7ja8qpBlM/+fA+IrXszbZ/SofCW5AYMHaFOsTe3zU33v+rYCAJhp4afpXGZeY
         urpt3RVu/hWY3bmPrOkML1SLIBLpZFEdsWVMTOlZj/TF4iHZ2QCrBEkbiYWsC9S6jTCu
         S6xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uLpV4m8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si6187346uaf.205.2021.05.15.09.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 09:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uLpV4m8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhx6w-0008RS-An
	for alex.bennee@linaro.org; Sat, 15 May 2021 12:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhx6m-0008Nw-OH
 for qemu-arm@nongnu.org; Sat, 15 May 2021 12:25:44 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:34453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhx6k-0006ju-2i
 for qemu-arm@nongnu.org; Sat, 15 May 2021 12:25:44 -0400
Received: by mail-qk1-x72c.google.com with SMTP id v8so1967906qkv.1
 for <qemu-arm@nongnu.org>; Sat, 15 May 2021 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5YnQ3YIifzuU0VS0Vo8dZJ9XTMwwcIAepO0Y/B4psgo=;
 b=uLpV4m8QOTAv/aI74U5j7NPNXo4NKMV2KQp8F0sIokmxM7xscb9BynAvo3lD3yIziy
 xiOlOKZw61AlH/g6blQ12RMg+vUr3glCG4VhJxKT2hmMMXs49jqFn7z+cEkUVO6kvnJa
 JxdZ7/qX04MNr6TkpkRGbpvngM0+ipC2DTG08QMkFIdvRYBWFurO8WB7qENenAVANd6s
 WDm1vWlBtH8F0nm5QG4Tp3z5NVyyWyStJbbSGwrFW8bTApdLg8kwtlXQJzzg7NTxi/SI
 F9AGyI+tUzWidI9EBIdAfhIz7ctrYnvw1Wc6miTtXZs4/V3V2PPAdIVyGx/D60tbfYZ/
 albw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5YnQ3YIifzuU0VS0Vo8dZJ9XTMwwcIAepO0Y/B4psgo=;
 b=oaaan1x3126ogzQgFsg3bBUe9/xgO/2Y0zQAcRfbEmnekixBa6ZRW+/DxvwR+ynkKf
 y32FLBjmBHVHk4eGHTYRizDYkav9oSgvvwMMfWgSyEWLGt5rjfy1OfzRtsCAZODmjr1X
 ulwovUmodSoioeyK2GnARZNAeCt3QeO89XOaJ43eYKefNi16ewoIvUzvhN9GbPlLNgxk
 E+FwLPUV33wJYO3ND/pfoC6NtKFqhLbBy6yJHhzBr5aS/+S9Kxn53TBBO4OqwGaANBPD
 Q+4CNHYUsKcyHhv21lInsdjbEeAO9MgErgG83XaenDNfOGP3bgQmrcV4E0l/JtFT5Vpp
 DLXA==
X-Gm-Message-State: AOAM5330voiuOztSwYHGD6YZfFQhWejg1x/LQm9YQatiNxjCDKEjriR/
 jhgqvOFFQxoQkaOSPp4TG9hrWWf4nyXz4VxEkHU=
X-Received: by 2002:a37:a8c6:: with SMTP id
 r189mr48996251qke.446.1621095940973; 
 Sat, 15 May 2021 09:25:40 -0700 (PDT)
Received: from [192.168.183.51] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm7286613qke.13.2021.05.15.09.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 09:25:40 -0700 (PDT)
Subject: Re: [PATCH v6 69/82] target/arm: Share table of sve load functions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-70-richard.henderson@linaro.org>
 <CAFEAcA87ZLW1oxFuhY_-uHjvO37Wkd3gUCJqPTttOm8VYqaAHQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <050cb717-1277-0edb-0f49-29a4f488d8c7@linaro.org>
Date: Sat, 15 May 2021 11:25:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA87ZLW1oxFuhY_-uHjvO37Wkd3gUCJqPTttOm8VYqaAHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W0A9SSkCBVxr

On 5/13/21 9:25 AM, Peter Maydell wrote:
>> @@ -5551,7 +5547,9 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
>>       t_pg = tcg_temp_new_ptr();
>>       tcg_gen_addi_ptr(t_pg, cpu_env, poff);
>>
>> -    fns[s->be_data == MO_BE][msz](cpu_env, t_pg, addr, t_desc);
>> +    gen_helper_gvec_mem *fn
>> +        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
>> +    fn(cpu_env, t_pg, addr, t_desc);
> 
> Previously we didn't take account of MTE state, and now we do.
> Is this an intentional behaviour change?

Amusing that I didn't even notice.

> If it's fixing a bug, the commit message should say so.

Yes, this is fixing a bug in LDRQ.


r~
