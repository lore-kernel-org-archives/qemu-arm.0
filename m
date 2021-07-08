Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp494727lfg;
        Thu, 8 Jul 2021 09:44:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8B84KTvF/utC0O0o+Rl5KV0hMX/AWyH7bjzlnx/x4ArKCRWRPtqElny2CSkFFTuFp9T1e
X-Received: by 2002:a17:906:7946:: with SMTP id l6mr32116866ejo.216.1625762666892;
        Thu, 08 Jul 2021 09:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625762666; cv=none;
        d=google.com; s=arc-20160816;
        b=VY+zrc+filU5Jx5r35XxTMr+JITKm7OuKl7o1tc6aUX6tR/9BRV8DwVLnJicOtoOHw
         5b26xW4Jyr2/V+Ks4MHFDfXReGdlweE/yKW57fo6bDoqyyyegxJSoCJ+yOCc+9Mr4pYM
         bct9B3W0D6MCGNQijWviA5XOWQF7SQhl9z+ENH9Aibh1Bu6DX5xDB70xQ5+wlA5Ys6Nr
         7gqOjXAvSIfrrKTEXJOIzPJ6e0n+ctyQhc0wjPJqftNhQzkd05qu2DfTb5VJOf6JdEWR
         8PdZ70JvuprgkwL+7Qh/CNLSNQ4C9lV8YABp83WzCHlQQ2iBg1zaLomtv+PjXX+R7K0w
         9Ixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fygWJfwDNSSDF4VUyI0K1AU2fBwaAUpGuNPoR+oaYGg=;
        b=PYqEW/FjgymZtGs6JaDPr9w5hOCcOqrHPLR3xEXfrtcjpQs0+kEGINamw1bvkwciT/
         W5Rb6Lo92ft6Om9iRGIKNMwj+RmMsR73QIdR2Bv29hJKu8TKU65VQznCFBQBXZ31b5P4
         qRTvgTh1+XnLkTuMS5cC2Xa7fxu26qygD3t8WbvO2xi4Lq3INtO0Awfcmc+jOAmUBnXV
         nqGtuYNRWCA1orXSA0xnqQVBp1HSSPBhlue55cCWLIqJ60F0tJ485TZKAa8BtLGA1GOV
         3Xe8dnECh9iKJLNMrDCuaud4CQazt1qzqaMZrkni4d8g+yCjCZxnk+NiH8Qhbk6FCT/t
         UlFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N5XzCFjT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id em21si3437932ejc.10.2021.07.08.09.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 09:44:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N5XzCFjT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1X8T-0000Jw-WC
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 12:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WWD-0007z7-TT
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:04:54 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WWA-0005zO-H9
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:04:53 -0400
Received: by mail-pl1-x629.google.com with SMTP id a14so3234638pls.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fygWJfwDNSSDF4VUyI0K1AU2fBwaAUpGuNPoR+oaYGg=;
 b=N5XzCFjTcDZVc0ZlzsZvPq2g3ZQAl1iUVwcytOZALG11Z6YfQRNzrmE7AGuUjtxG4A
 u4BaawU0dAOPgSUlAkoGk13+rM/nqKhizKE3KX91DYQLAsb/y5VVBqCccDAg5KmXe+/V
 5FWPXUrAhLNYrxV11KTdsv3zts0Yc9xMM1MKhoFz8jywUUY1fd74Q8AW9D+DrM3AVC40
 jEI7fH9atIjdGM9IssiNs8DTTQQYeZsnPNqSODevSsERHazWfXw47WhxCkqhfM7R1gwT
 KBwoqP1IWBumSdmbwOSfoqJw6MtTBTK34vwBi4EoaSgdDJFe0iPceh1ugGnXcVX4aOID
 ywwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fygWJfwDNSSDF4VUyI0K1AU2fBwaAUpGuNPoR+oaYGg=;
 b=p5dXYAcpwb8t8LirSZ+dOfmhPzfDgNYuq05N6j0ATTiSjidGhmCQAkWFy0knNfOTbj
 i0s/vSmFw//UZyvPl+b3ayq9Li3aKgOrHvpIppvCkFWxD+5gQVWeA20fN0D2VX/tAxvj
 XBzqU0jTNcIr9Xi4aVyxznrm47dlGZVWyVIEm9rcjK9PbqiSEwVmMjCKod6eteHIvudH
 Z7SroHidZ4yDBWFEQOf1vYDFI6WP15pZ+sA0urcxjHpno3dSbOkozjhYqVGBQLibEvPY
 7Ljhdz2lGiB0hu3mxd7+t6xmutMWymvMZdiN9bw9XKTqwC+svNAQHWntsUfIyG6DCIqQ
 0DRg==
X-Gm-Message-State: AOAM533QpW3Q0LL19WGihAldfYId0+oqGT8D+VnSCv2r2utO2STYhTit
 VKn8BXKKcNVOYju5ZjQpnaEI8A==
X-Received: by 2002:a17:90a:eac3:: with SMTP id
 ev3mr5759075pjb.161.1625760288847; 
 Thu, 08 Jul 2021 09:04:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b62sm3468329pfb.149.2021.07.08.09.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 09:04:48 -0700 (PDT)
Subject: Re: [PATCH v2 05/28] target/arm: Use gen_jmp for ISB and SB
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-6-richard.henderson@linaro.org>
 <CAFEAcA_EkW7a6SFuAHxdYvu_gdcdDwY4xQVOFnmtatcx+T1qGg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <88562e08-3d6c-3224-5d84-67e3ffd3774b@linaro.org>
Date: Thu, 8 Jul 2021 09:04:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_EkW7a6SFuAHxdYvu_gdcdDwY4xQVOFnmtatcx+T1qGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Opw8CcogebNF

On 7/8/21 5:05 AM, Peter Maydell wrote:
> On Wed, 30 Jun 2021 at 19:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Using gen_goto_tb directly misses the single-step check.
>>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/translate.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index a0c6cfa902..8cd31feeaa 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -8582,7 +8582,7 @@ static bool trans_ISB(DisasContext *s, arg_ISB *a)
>>        * self-modifying code correctly and also to take
>>        * any pending interrupts immediately.
>>        */
>> -    gen_goto_tb(s, 0, s->base.pc_next);
>> +    gen_jmp(s, s->base.pc_next);
>>       return true;
>>   }
>>
>> @@ -8596,7 +8596,7 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
>>        * for TCG; MB and end the TB instead.
>>        */
>>       tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
>> -    gen_goto_tb(s, 0, s->base.pc_next);
>> +    gen_jmp(s, s->base.pc_next);
>>       return true;
> 
> Why isn't it enough here just to set is_jmp to DISAS_NEXT ?

You mean DISAS_TOO_MANY?  That would work, yes.
At the time I was just thinking of replacing one jump with another.


r~

