Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3056594lft;
        Mon, 4 Jul 2022 01:48:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t60ySnL4kKxfPV740b/TUf06yYPf27xJEAoK8Tls6qnIwWzMCleWrq/6g5t07WIBjWBzzl
X-Received: by 2002:a81:6c12:0:b0:31c:85e0:130f with SMTP id h18-20020a816c12000000b0031c85e0130fmr10138521ywc.415.1656924514123;
        Mon, 04 Jul 2022 01:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656924514; cv=none;
        d=google.com; s=arc-20160816;
        b=hVaOkKfvxOP7aX2D18gLTT9jJTHKaa3i0jAXaswEZd+w/YTQ6m88dOtDsNAK5rjx3P
         q8sU6x8PL30DIcpDhhXvjOp/3EbP6oCqaGSgobWtSBBBbsUYhq3CuRa/aySfNxjtnpkG
         9QRl47UOtzdjTjwuj4iyEcJYniyvzxE7PoBlV5p4/33gJKINYT/oyhyo3BhFGT4U/pnG
         9KikRYI14lGsuK5YnL89FogxKfEPnsoUux09kQw8EXw0NncoNcRlhGlupyXpzw8OahVF
         pSxuie6b3KRrCGOoPJMAnCrCcDAleyrUEvG4NOap+/gb6E/ja7VG4lJef19OehXF3Hor
         hSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wsx0yeJJxFYXWH+ozDvqjHpTMXCAhvYk5pn29Di5Tms=;
        b=iT3MqOizjl5uwSnS5tPhDi9hCO61vEBMrGbJiM2arkeoBV5BjBK6hj4bxSeeIm08xe
         HvU3RQZrmSgW9S7aF0N+h28y6YoaUNB6oWL8WlXvmuEBZuqrnQOatw3zyNppX5C1YKIu
         g9IUpN1zA4p2lL5o8bIce/+TXn45hJWo0Z3dnHxHPqFwk9YSr616bscb8U5nzmPVWBfJ
         k5lfe35fA5FnghyoIYZmEOwZyqvc4HPQeRI+i4KOw8S4VFAdz9p+E8hJGX1qsZs55sUI
         ng3J4o7JqLV2vMG48mmgiZRq36rJR264od8iHVCAZTu0OblF3/4d4e/HB+KWK9ZKuTGm
         6xZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SLRbivio;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66-20020a250a45000000b0066e573b4f63si804339ybk.72.2022.07.04.01.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 01:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SLRbivio;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Hkv-0006jV-HO
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 04:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Hki-0006iX-LI
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 04:48:20 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Hkg-0006dp-UL
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 04:48:20 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so8873156pjj.5
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wsx0yeJJxFYXWH+ozDvqjHpTMXCAhvYk5pn29Di5Tms=;
 b=SLRbiviofkiQGKpgJao1JSydMU6hz4Nr6m0cyInxMMxLb7BWOojgFgFmd0yDzg3LDI
 LtET8IOEoiRXdSFssd9T1pRVt2gfqmoVET4X+la1XsMrH60GUtV/NH45CdRq5a/6rwGB
 3u+E4gnsljAqgQbM2ZtZ3X1RO0maiewSjYT/q//8dMWnuTbS6QpnUqLeicRteFSq5nhz
 pDCBbJROoJFUR3odi+526qX2zzJq6rCnND6dmx37VnVB5L3Yonkyn2gwKkcxw9OtUoGk
 dUo/DjbkazcIy98d/24/KkqDPnpTfZpFZhYj11M8O9jdEU3tipd8MlbodYQ2Z4Mj0+lS
 ve5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wsx0yeJJxFYXWH+ozDvqjHpTMXCAhvYk5pn29Di5Tms=;
 b=1UHLYtgY6xkzzCUYV1llcXGcrCZDpv71qxv65enR9HQdgB0OMvvRdogkBLAY7Fum9g
 //fk5jj8nl0NZlLXa3paWMiINTGd9My4scgnZcY1Hw8KbPj3t1sp/5ZIqI/Neg37AkSG
 C+LtEVmP4R9p72mzSG0t1sNtXC4IYEbf7FNwY5IUxOhBokwF/dMIED83Qal8LyPBBuZo
 39eSvaq5CXXToMSmQuBh0dIFYmvdYNXI1aTKMa5LDhOULtgxSLH0AzHHxkwxfUGOtfZs
 NRrhZe6oGmTWrQZm/slQCxydMlCYu6UtWY6xvW8ZouX5n4pqEQppQGM7ethTyW396WKv
 QzIw==
X-Gm-Message-State: AJIora+1UEDT1Pse79qx2FGjC6jkNNsNgFV01tPiK6ld6uh8Tl6EaN3G
 djdIFPNVPQnP9UqY7tmjg8+Nog==
X-Received: by 2002:a17:90b:4a4f:b0:1ef:90fb:35a5 with SMTP id
 lb15-20020a17090b4a4f00b001ef90fb35a5mr58745pjb.161.1656924497445; 
 Mon, 04 Jul 2022 01:48:17 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a056a00234f00b0052542cbff9dsm21414852pfj.99.2022.07.04.01.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 01:48:16 -0700 (PDT)
Message-ID: <8a96f7c2-3d7d-619b-a1d3-452fc22cf494@linaro.org>
Date: Mon, 4 Jul 2022 14:18:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 07/45] target/arm: Mark PMULL, FMMLA as non-streaming
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-8-richard.henderson@linaro.org>
 <CAFEAcA9DrujnB==AXU3udYv_sfCcWT_sUxyqsYoMJDAoyOb+vw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9DrujnB==AXU3udYv_sfCcWT_sUxyqsYoMJDAoyOb+vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +2DPuDhEtpeP

On 7/1/22 17:48, Peter Maydell wrote:
> On Tue, 28 Jun 2022 at 05:28, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Mark these as a non-streaming instructions, which should trap
>> if full a64 support is not enabled in streaming mode.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/sme-fa64.decode |  2 --
>>   target/arm/translate-sve.c | 18 ++++++++++--------
>>   2 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
>> index c25bad5ee5..c75a94e0fc 100644
>> --- a/target/arm/sme-fa64.decode
>> +++ b/target/arm/sme-fa64.decode
>> @@ -58,8 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
>>   #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
>>   #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
>>
>> -FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
> 
> This encoding pattern (as the comment says) covers only the esize = 128 case...
> 
>> -TRANS_FEAT(PMULLB, aa64_sve2, do_trans_pmull, a, false)
>> -TRANS_FEAT(PMULLT, aa64_sve2, do_trans_pmull, a, true)
>> +TRANS_FEAT_NONSTREAMING(PMULLB, aa64_sve2, do_trans_pmull, a, false)
>> +TRANS_FEAT_NONSTREAMING(PMULLT, aa64_sve2, do_trans_pmull, a, true)
> 
> ..but these trans functions cover all the esize values.
> 
> In the pseudocode for PMULLB/PMULLT it explicitly does
>   if esize < 128 then CheckSVEEnabled(); else CheckNonStreamingSVEEnabled();
> so it is definitely intended to distinguish the 128 bit case
> from the 16 and 64 bit ones.

Whoops, too right.


r~
