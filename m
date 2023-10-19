Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp816316ejb;
        Thu, 19 Oct 2023 14:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/I3sB4exfrOPvngQboQhEBCyykZuXoa3jZGnKzXHO+AQYRchZY6BI/CRvrxwX+ZHcOEjL
X-Received: by 2002:a05:622a:346:b0:41b:41a1:88a6 with SMTP id r6-20020a05622a034600b0041b41a188a6mr3847753qtw.11.1697752647387;
        Thu, 19 Oct 2023 14:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697752647; cv=none;
        d=google.com; s=arc-20160816;
        b=TlNgLJGTu/UQzMV//reOIOdUfWa6rijcyjP3rPOXTQZ1Prs9oCb7zLxlgOVFSkpe9e
         KnI0wbaD0+ec5vEqAPGBBDaPSfl6C9s0/K0SV7OqnT2ovXZN6jF0EkV1JgSSwSceoWcT
         FckawSh53GVoskUYvE/e3j9m6U4mifN3VERBlW35nMXlkaNc9N5FFSsDigyo5yqlMQRh
         C87Bc+3VbPxff6v0hAsLvWoNsvH4ouLoP76/FOEF26JYI9ocOHfZk7ZiSJTvZCryp1BL
         lxAkHB7NuEJOCkH+UfBxqceH50qnqcgwU8fiN1ImJNiIxmbmbhHD84jcVqXGD7JN8nmN
         DExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=q3Sr2fUKVpN1YpDy4gHDaG94E82b1qaIpPoDFISKM1Q=;
        fh=63fuqXWdafnbqVGIWl8IQUGmwh8qKCI6VosO+FSh+Ss=;
        b=f/I5wVY8H7+mL+kJI11ExkEIu1vFvJPVYt1uGxibFPi0M1w2lGc3uMz66soSAKqmd0
         26Up933XZsIgJSXLcIgHjxgm+856cC4YiCAs5oTpUr4Gx9pkjzqMn8klijOPkZjtSY3F
         HmdYXvjwrkWVP+sYuzU4emdfTvpei/bHyU5HH9vcx5PZrA77MTjzjTSaDzdAAVwvrdsX
         IJyhRAellwyeVKC/ZSD8+Ax21DwLdXqyw465rySSE9vsjieoueXz39HPK5wLVrswAiZf
         ZMRsU8dwEbhSk//dgkHIpsNGiZoGoCyAEstDgwfmmRhpxkP2pBXFIPaoMNkEKj7IE2gr
         nQJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSg2Cjbc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020a05622a055100b004180387dcc0si297520qtx.605.2023.10.19.14.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSg2Cjbc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtb12-0000Bl-TP; Thu, 19 Oct 2023 17:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtb11-0000BV-IH
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:57:15 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtb10-0006YD-20
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:57:15 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso2430401fa.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697752632; x=1698357432; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q3Sr2fUKVpN1YpDy4gHDaG94E82b1qaIpPoDFISKM1Q=;
 b=YSg2CjbcdNjChLGMSfAecmCEccrWzw/efu6k61HhD1gBrsWeJtsmUPD27uzTnUE4n7
 FEmrZrS7Yjko6FxuKeBshipoUHolDT1I8kXJD74cmG0KeOICe34GNVoOj+2spAEr9SFc
 qMXGABrWHfTrB2cUUxbqRbzFvi0yJtY/05vlmt6G35uVwYGkpCEyaqRkFcrx1qv9xUqj
 Y+AJdrmQ3bWvUig05VEAWKcIb6Ih8lI2KOu18HPa2iqaNQzkhGqUwmhKQp2eZ237dmDL
 5Fi+djK1fAoZnGCnG04UifvxJgoJrjEs9OIvFEj8Q495xzZf6btFy+CiDHNXmlXAy+Bp
 sFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697752632; x=1698357432;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q3Sr2fUKVpN1YpDy4gHDaG94E82b1qaIpPoDFISKM1Q=;
 b=c42G3EFy663zrhJE7LTnTn46sF0OT8U3JoV+Vpqj2PVaN1+eWr9kQf3PKj8WxJQQw/
 1/J9ZJLXaKlhLgdrUuLLxAhZSYdda7Tx0jbP1+T66AhS9CUJ/1oWv4OjVlKe74hoCZRp
 Eo5SrDnzUdmkophJlP7UfU6EA1USvUOruRRDqPNCA4pxJeLXDbATzw4mCs+gj+616VRk
 wv75ohwEf0GNy8EtbRWRnwlzbVId6pALWNM0A11itzdiNFTkxq6stf8bVdHvQuNUNgNp
 O3eOXs2R7uw+aMPBdEpWRhhqcyM4Ja9igV6kUu0KVGcnzUZxUcWDCD8cBIkjmsaNaRjA
 IujQ==
X-Gm-Message-State: AOJu0Yz11kOKSGiW26kqqUrepNfRSJwhPDHcww+SX9tE2Dnfk8ryvs4Q
 q1c9xKrk22RkNv03we38LTIxFw==
X-Received: by 2002:a2e:9992:0:b0:2c5:4718:5d45 with SMTP id
 w18-20020a2e9992000000b002c547185d45mr111787lji.52.1697752632081; 
 Thu, 19 Oct 2023 14:57:12 -0700 (PDT)
Received: from [192.168.69.115] (176-131-216-177.abo.bbox.fr.
 [176.131.216.177]) by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b00406443c8b4fsm5448109wmo.19.2023.10.19.14.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 14:57:11 -0700 (PDT)
Message-ID: <5f54e3e1-1c90-0249-04f4-df522e292abe@linaro.org>
Date: Thu, 19 Oct 2023 23:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 3/7] target/i386: Use tcg_gen_ext_tl
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, laurent@vivier.eu,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
 <20231019182921.1772928-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231019182921.1772928-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: D/FV4OcfV19Z

On 19/10/23 20:29, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 28 +++-------------------------
>   1 file changed, 3 insertions(+), 25 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 0c81e066de..d420ed8f0a 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -701,33 +701,11 @@ static inline void gen_op_movl_T0_Dshift(DisasContext *s, MemOp ot)
>   
>   static TCGv gen_ext_tl(TCGv dst, TCGv src, MemOp size, bool sign)
>   {
> -    switch (size) {
> -    case MO_8:
> -        if (sign) {
> -            tcg_gen_ext8s_tl(dst, src);
> -        } else {
> -            tcg_gen_ext8u_tl(dst, src);
> -        }
> -        return dst;
> -    case MO_16:
> -        if (sign) {
> -            tcg_gen_ext16s_tl(dst, src);
> -        } else {
> -            tcg_gen_ext16u_tl(dst, src);
> -        }
> -        return dst;
> -#ifdef TARGET_X86_64
> -    case MO_32:
> -        if (sign) {
> -            tcg_gen_ext32s_tl(dst, src);
> -        } else {
> -            tcg_gen_ext32u_tl(dst, src);
> -        }
> -        return dst;
> -#endif
> -    default:
> +    if (memop_size(size) == TARGET_LONG_BITS) {
>           return src;
>       }
> +    tcg_gen_ext_tl(dst, src, size | (sign ? MO_SIGN : 0));
> +    return dst;
>   }

While here, I'd rename 'size' -> 'mop'. Regardless,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
