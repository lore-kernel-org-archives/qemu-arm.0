Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1462203ejm;
        Fri, 21 Apr 2023 16:08:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350awz/z8bnWdRFGW1eCeKUMQoUKiVmmRSm1oo8DvdSFi27OzAc4vI1gcfzpvT/XXHPjzItyE
X-Received: by 2002:a05:6214:2501:b0:5e9:d204:152e with SMTP id gf1-20020a056214250100b005e9d204152emr14756962qvb.8.1682118535632;
        Fri, 21 Apr 2023 16:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682118535; cv=none;
        d=google.com; s=arc-20160816;
        b=C/iOcTVKYfjolo1uX9X3/RDMJD8CLHkr6L9FQxNOEVEzoZfJmNIwCDFrpPBMbry5mj
         X0WPq1Oc/wvnaN5VjC2wnYv0iISk2VXjnzheTXQ3szLtYd5uj8kq3fWcB2xxsCglKvGj
         8CKYJ67DrRSqtasnmV6Iiu+dTliscT8gTjciXaYrxFCqlUDca5HEccEWBL3nNMS78QNm
         OvDivSWNYUVT/pFRCx8BaK+2aQvaT1V963UvavgZd3O7oy3rXbLp8//HEkxaZno+mWIr
         sv11QE4LvrU58DUM9xHupy0weG5Zr+0OdQadxDc5196KluSZAS9YduFIAZEFl7Yx2MMA
         6OOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xs8L7cCcY1Imzf2gf3GSzXKFKQTawzjOQM0MMyiPR3U=;
        b=ml6wMlmXr5cJxSm6+liExOfK0GuBZfyDy0jY5TJJFS65gzHKhcxQtTZziDd+2lEnHX
         KWfvoMWbMGIZQFbJ7HtVEUs7+P6EkJyiVnkEu+u+f6RKwtVVyE6NkLOhO3MlQhU+OlP1
         /35oA1QGl/aTYPUG6vRx2hKrlD3QAyQR5aQ/vI4K2kqOe5uyweXBlHiZGCt1nBTfvX3O
         av/DGYPIrG7ozz7HDtQhc7kljl8URYnoXeW65leyhEX5Fwv4NMjMz3WMZOKm3mmKxnye
         B1cNQWU5ygwYbeWaQPtW+kvRkAVSBhuwQcrqx8YhiaVXao9AHUeSOGubnhNJBaosKhli
         F1Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CZ/S5W3q";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn8-20020a05620a2ac800b0074df54bacfesi3509270qkb.274.2023.04.21.16.08.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 16:08:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CZ/S5W3q";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzrm-0006Vq-RS; Fri, 21 Apr 2023 19:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzrl-0006P8-Fz
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 19:08:33 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzrj-0007TD-Jv
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 19:08:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so16077275e9.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 16:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682118510; x=1684710510;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xs8L7cCcY1Imzf2gf3GSzXKFKQTawzjOQM0MMyiPR3U=;
 b=CZ/S5W3qNrYwq5Ay+p5mFHQumWdph/av8XKazDg2eLfiI2by4raux4dIRyGDRSMxIJ
 dt9MkYfmtbIItMeStsEQZEE7f4qi81BLhJdARd7OM0faJGbWJyzn4usSnFzZfqm1k6/3
 RgPdoV+QcIJDA9Kvm4871xEABLDI/PpfIgH2RS9JJH8GqroLvGp+Ff4F3n9IR9InO1ii
 ojZL2CNCKUIlDA4ls+JJGhuUlyg86dM+4OQItO1nxadCsuQqTnVwUusQn/55JrtrQ57s
 e6vkNh6zlaVFLtrdzr7oZEuSD4h0L3ByFZKHm23KWkxPYUDaNtx2X0TFZ5sr6UKMozmg
 LjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682118510; x=1684710510;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xs8L7cCcY1Imzf2gf3GSzXKFKQTawzjOQM0MMyiPR3U=;
 b=lPGq0qj7Rgr0rH7hC71giF1/a9ogRrsJ+o8iBZzYUexf59d9Mk9/0VdDhtKbKERlTz
 WPoSAkVhUK+AObxBTztujW9F90E03E1EPwOKUjanYjd4x8inV+u1NlAqbxiUFxHeAKrA
 WpvPygbHz5H3ACihOYkA98KWu16dTDKa8JenptkEvPClOnQXzi8H2reA48HWkmjBtM4g
 yMNJZPnMRbJOj2Gj276nvPM/83zvKvL+47FRf5/1WvHB5NiTArMYNaJhWXDZ2w6okAjU
 Vjc+qytL28bdBAaiTYUVhV0YJ+u+apvIgzvPbyZqzFqbO2br4iQx/+L7//Ir1EaENBba
 Qrxw==
X-Gm-Message-State: AAQBX9e1aK527U05pp2ZAKcLiztQq0tkPaADbNTxc1YbA67IiFdl7gFP
 x3xkDmvPM1VQVJ2lI9mAs7yUlw==
X-Received: by 2002:adf:fe49:0:b0:2fa:631a:9f38 with SMTP id
 m9-20020adffe49000000b002fa631a9f38mr5123330wrs.2.1682118509965; 
 Fri, 21 Apr 2023 16:08:29 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 s3-20020a5d6a83000000b002fe13ec49fasm5301437wru.98.2023.04.21.16.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 16:08:29 -0700 (PDT)
Message-ID: <30effe32-0586-14a1-4d15-0d5008ab4288@linaro.org>
Date: Sat, 22 Apr 2023 01:08:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 17/54] tcg: Introduce tcg_out_xchg
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-18-richard.henderson@linaro.org>
 <1c175f9c-180b-5181-1e33-4d9fa13a00ed@linaro.org>
In-Reply-To: <1c175f9c-180b-5181-1e33-4d9fa13a00ed@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 949w0dry52XZ

On 22/4/23 01:05, Philippe Mathieu-Daudé wrote:
> On 11/4/23 03:04, Richard Henderson wrote:
>> We will want a backend interface for register swapping.
>> This is only properly defined for x86; all others get a
>> stub version that always indicates failure.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tcg.c                        | 2 ++
>>   tcg/aarch64/tcg-target.c.inc     | 5 +++++
>>   tcg/arm/tcg-target.c.inc         | 5 +++++
>>   tcg/i386/tcg-target.c.inc        | 8 ++++++++
>>   tcg/loongarch64/tcg-target.c.inc | 5 +++++
>>   tcg/mips/tcg-target.c.inc        | 5 +++++
>>   tcg/ppc/tcg-target.c.inc         | 5 +++++
>>   tcg/riscv/tcg-target.c.inc       | 5 +++++
>>   tcg/s390x/tcg-target.c.inc       | 5 +++++
>>   tcg/sparc64/tcg-target.c.inc     | 5 +++++
>>   tcg/tci/tcg-target.c.inc         | 5 +++++
>>   11 files changed, 55 insertions(+)
>>
>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>> index 328e018a80..fde5ccc57c 100644
>> --- a/tcg/tcg.c
>> +++ b/tcg/tcg.c
>> @@ -115,6 +115,8 @@ static void tcg_out_exts_i32_i64(TCGContext *s, 
>> TCGReg ret, TCGReg arg);
>>   static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg 
>> arg);
>>   static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg 
>> arg);
>>   static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, 
>> tcg_target_long);
>> +static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, 
>> TCGReg r2)
>> +    __attribute__((unused));
> 
> Can you document this in docs/devel/tcg-ops.rst?

Oops this is the backend, thus not needed.

> Otherwise,
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

