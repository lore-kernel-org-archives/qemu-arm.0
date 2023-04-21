Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1452208ejm;
        Fri, 21 Apr 2023 15:42:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350YQ21E+xVvC1KFBBbno3XTCGhau1Vn0DMkrKCUjqM4hgS8aaSMIh1QO+jO0ScIMuqc0T+jZ
X-Received: by 2002:a05:6214:2305:b0:5ef:653e:169b with SMTP id gc5-20020a056214230500b005ef653e169bmr10904819qvb.8.1682116975940;
        Fri, 21 Apr 2023 15:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682116975; cv=none;
        d=google.com; s=arc-20160816;
        b=BAwDRfN3M6GBIHzA4fY8N2hOdqEbDiEw6roXeyO7hkdRWToYdnH/f6jJRc5uAIGat5
         hDL4Ug7OBjUxPdH/mGDQBLsF3BIsmcvPYELahsEBabAXesQ8e3aBwRmMofpDr3g8qQBl
         e3She59xdCEH42S0gGIeawkjT5eZ3x2wfZt1AgDI+yXNPtt9F1W/JsIUMDC4g40SxqKb
         k/dZ/9ayaPvMan44jSthocTqbkUtoYrWDPTZX9kzIr521aXwhFHHR9maX8aL4LhCDzyH
         Dwic9GNndsWpMKcIt9IopXqhWpkXHzl/KYLSE+E9Xd8ggAPDhJdnSeuAewx6Y9nooBB2
         9vpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XIabMRxvxs+vexQQoUB3fhEDQVchu6pvyca4D9aUyys=;
        b=wFc4Z2aAiaqXkBvYA/Yxgds714gI+VoN6MRLKioH40ZsMRxzNsJEE1aUFhKlIvewHv
         0t1XNDdCcmmhn+9YkVxzpegR+vuZh1v0WkjPOSsecSwvbuQuzTtqsfrFxqBpD0z6lT2l
         M3v2LvohB4W9d+azQgSMI0uW0eWZnFxkdT+w84W+sqnFt191Zp3f4fH0lsK+7psbNDwa
         3qC72ZKU/ygUK6pP1GxRIre22jyRgoDKWbrflCep+UxDqAjtyGovc0NPC3KQtFpVHyWK
         X2UasW5PJ5GsXbRBs/i8bJqQfP0geGOizgLjdmT6Upa13IonHRa+dfpagr6lCVYgmypv
         WgGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pHchG8KS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05621421c800b005c1694c9d39si3920259qvh.166.2023.04.21.15.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pHchG8KS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppzSt-0003Xx-S7; Fri, 21 Apr 2023 18:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzSs-0003XZ-A0
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:42:50 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzSq-000188-CA
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:42:49 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so2172933f8f.2
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 15:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116967; x=1684708967;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XIabMRxvxs+vexQQoUB3fhEDQVchu6pvyca4D9aUyys=;
 b=pHchG8KSDvaKR56km9l/sU3UOVSJ7e++47+MH2rKl8HsB8eSr0ILyH0XWxB/OdmMh8
 5DIlaojW6p+7ItYC9FHvsx2XPRLUIQSdoZI1RFsWwhsTFj1KOLzih9xP47VMeSr5mW7N
 hOEPwDZeLxI4M2pHdTESlkRUk8tSiBu1Z+fw7timPnxzo34EPnfMQpTJ8kSpmPm1a8iQ
 936am8gHfkgXbaO7B8qtsd8uBj/xJqtWiFp24vUkea5Mc+7ri/yGMYBn6DC6v/HzVQFq
 G+cTN753Nj9TYWlydI4rGfbguqJuoBK9BIYvZUdfgAvMwR4rradcIvtFvc+zPJD0stPh
 vDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116967; x=1684708967;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XIabMRxvxs+vexQQoUB3fhEDQVchu6pvyca4D9aUyys=;
 b=Lm+bULArLvQ3kLISD2N2g/Rx4qYiawSO9eWnkVnqW5udTsdNIB65BdPKc+rGCqhuCI
 /cHVQQ+GrnKpXsNF17vaVHtcrUcFQ1GlcfKDFgdxRaOCXw0YXvtKZ4y50bxg2Sz4LUbA
 OvzITKHN2EZKZZTBIpL7pkf15ykbezMX2Q8+CbqMAyry1GSW9kkFnLymWRpeqdbTvISi
 hLYECzJJrY4H+Qi7iF3ul+d+eVh6XUtm3YDPe23mll9bg0o7a/uPanN44Me/KbR61juT
 uWZw/RI1YBbinB0PwO+DNFodQdDoSfRhA0mnorE5uJLu3slShvzeGH4xZqHoSmkWsWcA
 iCSg==
X-Gm-Message-State: AAQBX9c4hQqXvTeKN+0DbDsiTb3NMq+F3XAIYZbqnpex64wt1c3H4IUH
 el0qt4FoDqaW1N/25+SdHr9sohJcjssCJXhYZaI=
X-Received: by 2002:adf:e4d2:0:b0:2f2:7a0e:5cc9 with SMTP id
 v18-20020adfe4d2000000b002f27a0e5cc9mr5388147wrm.19.1682116966832; 
 Fri, 21 Apr 2023 15:42:46 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 h18-20020a5d6892000000b002f9bfac5baesm5329503wru.47.2023.04.21.15.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:42:46 -0700 (PDT)
Message-ID: <81a260d8-b104-57c7-050d-8aa631149fa4@linaro.org>
Date: Sat, 22 Apr 2023 00:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/54] tcg: Split out tcg_out_ext32s
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-8-richard.henderson@linaro.org>
 <e5cb9092-23c5-8449-9520-4494ccbc5e3c@linaro.org>
In-Reply-To: <e5cb9092-23c5-8449-9520-4494ccbc5e3c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0XFreO7HAyQ1

On 22/4/23 00:38, Philippe Mathieu-Daudé wrote:
> On 11/4/23 03:04, Richard Henderson wrote:
>> We will need a backend interface for performing 32-bit sign-extend.
>> Use it in tcg_reg_alloc_op in the meantime.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tcg.c                        |  4 ++++
>>   tcg/aarch64/tcg-target.c.inc     |  9 +++++++--
>>   tcg/arm/tcg-target.c.inc         |  5 +++++
>>   tcg/i386/tcg-target.c.inc        |  5 +++--
>>   tcg/loongarch64/tcg-target.c.inc |  2 +-
>>   tcg/mips/tcg-target.c.inc        | 12 +++++++++---
>>   tcg/ppc/tcg-target.c.inc         |  5 +++--
>>   tcg/riscv/tcg-target.c.inc       |  2 +-
>>   tcg/s390x/tcg-target.c.inc       | 10 +++++-----
>>   tcg/sparc64/tcg-target.c.inc     | 11 ++++++++---
>>   tcg/tci/tcg-target.c.inc         |  9 ++++++++-
>>   11 files changed, 54 insertions(+), 20 deletions(-)
> 
> 
> 
>> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
>> index f55829e9ce..d7964734c3 100644
>> --- a/tcg/aarch64/tcg-target.c.inc
>> +++ b/tcg/aarch64/tcg-target.c.inc
>> @@ -1429,6 +1429,11 @@ static void tcg_out_ext16s(TCGContext *s, 
>> TCGType type, TCGReg rd, TCGReg rn)
>>       tcg_out_sxt(s, type, MO_16, rd, rn);
>>   }
>> +static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
>> +{
>> +    tcg_out_sxt(s, TCG_TYPE_I64, MO_32, rd, rn);
>> +}
>> +
>>   static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
>>                                  TCGReg rd, TCGReg rn)
>>   {
>> @@ -2232,7 +2237,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode 
>> opc,
>>       case INDEX_op_bswap32_i64:
>>           tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
>>           if (a2 & TCG_BSWAP_OS) {
>> -            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
>> +            tcg_out_ext32s(s, a0, a0);
>>           }
>>           break;
>>       case INDEX_op_bswap32_i32:
>> @@ -2251,7 +2256,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode 
>> opc,
>>           break;
>>       case INDEX_op_ext_i32_i64:
>> -    case INDEX_op_ext32s_i64:
>>           tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
> 
> While here, maybe reuse the new helper (easier to read):
> 
>              tcg_out_ext32s(s, a0, a1);

Now I see you do that in tcg_out_exts_i32_i64() in 2 patches :)

>>           break;
>>       case INDEX_op_extu_i32_i64:
>> @@ -2322,6 +2326,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode 
>> opc,
>>       case INDEX_op_ext16s_i32:
>>       case INDEX_op_ext16u_i64:
>>       case INDEX_op_ext16u_i32:
>> +    case INDEX_op_ext32s_i64:
>>       default:
>>           g_assert_not_reached();
>>       }
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

