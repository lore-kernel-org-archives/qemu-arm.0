Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5117106lft;
        Wed, 6 Jul 2022 17:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tr8kCAYv2Prgf80FdSOJNXdbt4rawE5GYFTt6FHMQyNaH68lDDnGeBCjbN1Op9fA44tpoG
X-Received: by 2002:ac8:5991:0:b0:31d:2bfb:f089 with SMTP id e17-20020ac85991000000b0031d2bfbf089mr30881826qte.663.1657155419645;
        Wed, 06 Jul 2022 17:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657155419; cv=none;
        d=google.com; s=arc-20160816;
        b=tNKU3KjXJbXCE275E+HQmit+BE5cwphzLZWsE7gsg6AcdKq/LuAPaR8a+OQWKUYJiP
         B/8bmEevpfH7Ms9CtTYPT/Hg/hpr2pwMEtx9eGyul5WAymJdi+vB6/zp/R5CIdKSBW38
         PX7XopPXOo5ufuQUtvXzwKrL6rgMjNtOqLngt1m5BxAPk63PfRbvHYK588bSvEmcO7PZ
         smTTnDtASMDvSzBo8svQLQbk0A64Km9Zv5FinW8XaDOJgLYxrknbPHvQaxPfJnK6uxKm
         5s+wnUrG6FtZk20v+VQa6S1VCvNZbcZOAsIRmtpaV7azG2vxcFhCtzFiDqP07SIJ8CtI
         1OOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=k4ICq4fWpDtAxbmYLOgRCh/DKTvg1MRkFvPP7ShO8wg=;
        b=GiBFTtIl/6eaaSz6ypsZ9BOFySrOifF5sYJ8eaayxz50LquDcXSKpCy2KHEOB6N4O4
         ykCOcwgH1Hylzpn131ctvnHoy+dada6+bskvUc132Bh2dLRWhpPTog6XqQ34t60CW/i7
         dj60woiuhs8Z8niWd739DNeqWUiF3Yyg40MwAB+82qRDo7ICLCHyJWJ7TjbrYl2wmorY
         +gFxXrSUAloy0v4cCH8SMjVagpK/sRFC52EhrZa8zo2yidASpGXiiQZNLoQY4ZDK2Ru9
         nK4NquaIYt+t0SinD3mwHe4YIXK7sSHmfuXo9opSjEDcwZ471CZZd+Ajc5mnYnYbmgS+
         L8rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KauHt9p9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12-20020a05622a014c00b0030665f60e2esi22768254qtw.591.2022.07.06.17.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 17:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KauHt9p9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9FpD-0007SL-40
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 20:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9Fos-0007Qg-Pp
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 20:56:38 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9Fop-00088k-2q
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 20:56:37 -0400
Received: by mail-pf1-x436.google.com with SMTP id n12so16286388pfq.0
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 17:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k4ICq4fWpDtAxbmYLOgRCh/DKTvg1MRkFvPP7ShO8wg=;
 b=KauHt9p9W506eq4CNmXfhpBvSItCbvgIzAWG/t+JyTqQ6rpTgTzNHV4h3k+Ct+jK6j
 1IzAEAtPa6hJnTYYgjsZ3xkx2yrohOw/WTV8OfstAyHmkLfa9G8yfLzGUwSGv1ejGoSh
 N47sVKawOANlD6ha3gXuaLbXFaTk4dDuE9vomyeHNqVVPHtn0oev4+t01IGyGG57EZGV
 ci00zcDE62cpMxiLoh/J+C/bU9tLoyRCtFcZuDrdk9KF3J7bcn6J/O1MwYyBtYknouT8
 7U2tCOlOZ3cvjsjikhn1aZ/hIpXTR9P4V7mk+r/vjYoN9zEsTj1hyyR2Cne7vpsAiAdv
 YdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k4ICq4fWpDtAxbmYLOgRCh/DKTvg1MRkFvPP7ShO8wg=;
 b=uiDsT9Zhn9tHOpDSIol4ne6wtrQ7HbxIwhefBv3zi1TnI0+wWnqtC1+K7RdoUqk5oB
 nS6kq+9O5OoJduiLmztV8unujIl4j2IZLVwszkivAoVQixOvqrKIy81o4Z0J2vFbd29o
 IE8N60t4NVMPPeKm0cPFeWhyPAb/XCxgbn28FjzluR1rPePAbjQwA2yvdAf03fLqdf7I
 vIWTdBdqgn8HCkNP/NpQh0iJKn9VKNpO0ik1VSI4vrbyQd1r6B7O7pxtNjUTqEO6EJCL
 47wpKfWCluVIkIwOH37to55DnfjaiqkcUvZqHG1splFpVZdVhkTBgpOqv62gGmZ/kWR3
 Ixpw==
X-Gm-Message-State: AJIora/oh89IepaJJnvQG+lczkq+YoCcM5UjbKoDS7HsD9BME49NYXGD
 Xgxh0bH2odItPeZzRA657yrkFA==
X-Received: by 2002:a05:6a00:1990:b0:525:565d:8ce7 with SMTP id
 d16-20020a056a00199000b00525565d8ce7mr50660988pfl.82.1657155392894; 
 Wed, 06 Jul 2022 17:56:32 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a056a000bcd00b005206d4fd636sm25355291pfu.2.2022.07.06.17.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 17:56:32 -0700 (PDT)
Message-ID: <770adbb2-6ac9-f319-4841-c9746412a956@linaro.org>
Date: Thu, 7 Jul 2022 06:26:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 19/45] target/arm: Implement SME MOVA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-20-richard.henderson@linaro.org>
 <CAFEAcA91ibFPZy61jEJ3dx4foNRHpgnbAYe4W2wwtRpUsa3UfA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA91ibFPZy61jEJ3dx4foNRHpgnbAYe4W2wwtRpUsa3UfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: sQf+gwo3d1YU

On 7/6/22 22:17, Peter Maydell wrote:
> On Wed, 6 Jul 2022 at 10:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We can reuse the SVE functions for implementing moves to/from
>> horizontal tile slices, but we need new ones for moves to/from
>> vertical tile slices.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> +/*
>> + * Move Zreg vector to ZArray column.
>> + */
>> +#define DO_MOVA_C(NAME, TYPE, H)                                        \
>> +void HELPER(NAME)(void *za, void *vn, void *vg, uint32_t desc)          \
>> +{                                                                       \
>> +    int i, oprsz = simd_oprsz(desc);                                    \
>> +    for (i = 0; i < oprsz; ) {                                          \
>> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
>> +        do {                                                            \
>> +            if (pg & 1) {                                               \
>> +                *(TYPE *)(za + tile_vslice_offset(i)) = *(TYPE *)(vn + H(i)); \
>> +            }                                                           \
>> +            i += sizeof(TYPE);                                          \
>> +            pg >>= sizeof(TYPE);                                        \
>> +        } while (i & 15);                                               \
>> +    }                                                                   \
>> +}
>> +
>> +DO_MOVA_C(sme_mova_cz_b, uint8_t, H1)
>> +DO_MOVA_C(sme_mova_cz_h, uint16_t, H2)
>> +DO_MOVA_C(sme_mova_cz_s, uint32_t, H4)
> 
> i is a byte offset in this loop, so shouldn't these be using H1_2 and H1_4 ?

Oops, yes.


r~
