Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp939250njh;
        Mon, 12 Aug 2024 15:07:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVh1fXkEEmf53XrHIB4jU17cW41rih6oqzu9kaVTIyw5bywLq6nl3G3x5/IRI0JhGAVyLawYqcmOulC+aZBecRtRB9ZiZ0q
X-Google-Smtp-Source: AGHT+IGDkNemdeXmo7+UiD1yhyefe5/8LJcxUtBO5aulSa/yUfX9Ecj316WXSwGgvUp/W9u5Lohw
X-Received: by 2002:a05:6808:bc1:b0:3d9:3649:906f with SMTP id 5614622812f47-3dd1eed2b88mr2284684b6e.37.1723500467863;
        Mon, 12 Aug 2024 15:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723500467; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6drue4zEJI5xFR4SGjfP/9j1PPHyn5GJsycx9Ecp09k8nJ3ba+YjounpFZ9H2IAn8
         t4umAZ1T+uHKChG3p00gx7LNvZBplmlhV2e3rFkFV613mnZ1RrJ4F9G2u1+ohRQ+GgsK
         eskIx12hCnoZP5mqWhS/FA0hTvSz3/5hd+4fld4C4+VdRzLONauCXIn0eDsj5h7h+xVz
         Zq+QGsVisVijtlU3gsLLAtW/1vT0DHCSvti3gN8hKuIe8xxnniD62OiKHeRFb/Okb9wP
         VY5mDff3upthVz0gYfULZyBreAl0ev8V/4r74huWIRBEk4fThn1Tvw9Du+1I8ZjVncu7
         WTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OBboSqU+szwUEzyZRoEDmY+PcSklSTLDfjw1jqmoXEo=;
        fh=OC8ZZvt7g9MZQcPYRidbn2TV+8cw8jzgingWt3Y1nxU=;
        b=EPo0tpfp88f9mLW+dVIwIpYrZvBc4C9eJL9AdyBSdh9KLfpFHpakHDTfeshohW15co
         yXKUTEGlvCqCZeb5Qsmk2IQen7kkX1gw8QuPMenDHOd2BhlemRqak1VtDTJIeHZZotqH
         QJ481GC3C7RovaOD5073+0xMGRXL4m3Fgjn9auVQM2QmHBybkApn8ZthbizxhBSbW1af
         jyHQZIE3G4QS61iWzBgSx/4gEFt2H1ooDKgIWcxHBLLVM8F1Yej6RFYn9bjk9b7JJ8xR
         CvpswujUAHDvKvZ8/fJRqhvxmE4u4fpPdwK21ny6EDLrFYIlNWVQ3X11r1CwNm/yY2nn
         suJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z4Axuw5b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c2c8b99si69107631cf.738.2024.08.12.15.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2024 15:07:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z4Axuw5b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sddCW-0007Z4-Qe; Mon, 12 Aug 2024 18:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sddCU-0007R4-QY
 for qemu-arm@nongnu.org; Mon, 12 Aug 2024 18:07:38 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sddCS-0002ZT-Gn
 for qemu-arm@nongnu.org; Mon, 12 Aug 2024 18:07:38 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2d396fde759so65054a91.3
 for <qemu-arm@nongnu.org>; Mon, 12 Aug 2024 15:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723500455; x=1724105255; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OBboSqU+szwUEzyZRoEDmY+PcSklSTLDfjw1jqmoXEo=;
 b=Z4Axuw5bAn3pLqOHZ2p8KYI0wn1Hia8LYbwsWohww1kY2oUE7frU8SGkxLQMCg14lq
 KAv6oDxAx8xxVBvUAaLavFq3m0U3YNZu5TT1nWnHIaYF9wMPxpvQAA2y9XHP2dMswwIO
 xgoLmGARxaYVWQJpFIcrni70OkmO2VTgwuKOAKHpy1+eQj2yRgwVhQJdckXrSeu+5CAi
 vnikdcnpSLAzaEEXQ9ugYfpGj2nYlQg7svDa4BmtkBYaRP+UIwaQz6pxod+EOiyv121n
 RKhyOk7X06YhLi6EidRNQi4cIMIHt7TQmnfLUV4U8P+WfeGwrjGcxhwiATuNHW2ilYjJ
 ebjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723500455; x=1724105255;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OBboSqU+szwUEzyZRoEDmY+PcSklSTLDfjw1jqmoXEo=;
 b=RMoXWzC0tKL+n5Iyx7QprOo+UDXQE4zSBOshqNx60Yjeai8vMhljlyMq7ZLMoV+EJe
 B9lkoPvbYFsKCjeMS71SK3jpn+/3iwJ6RY3qXlgL3Iv/+kurXGLp/nQchNUZO5xLQoGK
 sQBEaZJHHMaBtoSti6y3buXxseckFj9K/DtzI6ismkyhkjs43Nam15taDr2yntCo+7py
 5uWESgWBP43HSgk+/789WSFa+9VKxRGB701h0/TRYuLm3vkRI/i2hbhNn/21VJ/J4TPt
 npQEbGgtBb7mivSDcdJe6rm1kimVBUpLGDjBNAfIoLfO8dzIJQ5ZtD8y4K2gTla9otKd
 pARg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6BOv+wgqtoAq7uVEnP4gH9j7K2gDp70dHmMZONgqkk47nRNwPnihGcT1Fwslxo2rth/PdhXY9ZGEy8HxAPUBCOy3E
X-Gm-Message-State: AOJu0YzLZJylDRp+ikdJzurKfaA0ZJKr+QTCWE2L9mQ9/HS9pAuUiSYT
 69Rd3CIyRc+QVGrasBBk5fs7RLwVbB3pFp0p9JBYh1FZnPqYdaHJfbu8F081sQWG9HI2xdINPMF
 n9/I=
X-Received: by 2002:a17:90a:d357:b0:2c9:80fd:a111 with SMTP id
 98e67ed59e1d1-2d392513090mr1877526a91.18.1723500454588; 
 Mon, 12 Aug 2024 15:07:34 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.4.111])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d1fcf275aesm5664304a91.32.2024.08.12.15.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 15:07:34 -0700 (PDT)
Message-ID: <8e0bf252-bc74-4086-872b-a11eb3b0b9ad@linaro.org>
Date: Tue, 13 Aug 2024 08:07:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] target/arm: Convert handle_vec_simd_shri to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240717060903.205098-1-richard.henderson@linaro.org>
 <20240717060903.205098-13-richard.henderson@linaro.org>
 <CAFEAcA_yikLcv2gSc6FVbue+HSFuk4w6oUg8H37jCaRJhtPD=w@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_yikLcv2gSc6FVbue+HSFuk4w6oUg8H37jCaRJhtPD=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 786EYsDPcqP6

On 8/12/24 23:14, Peter Maydell wrote:
> On Wed, 17 Jul 2024 at 07:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This includes SSHR, USHR, SSRA, USRA, SRSHR, URSHR, SRSRA, URSRA, SRI.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/translate-a64.c | 109 +++++++++++++++------------------
>>   target/arm/tcg/a64.decode      |  27 +++++++-
>>   2 files changed, 74 insertions(+), 62 deletions(-)
>>
>> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
>> index d0a3450d75..1e482477c5 100644
>> --- a/target/arm/tcg/translate-a64.c
>> +++ b/target/arm/tcg/translate-a64.c
>> @@ -68,6 +68,22 @@ static int scale_by_log2_tag_granule(DisasContext *s, int x)
>>       return x << LOG2_TAG_GRANULE;
>>   }
>>
>> +/*
>> + * For Advanced SIMD shift by immediate, extract esz from immh.
>> + * The result must be validated by the translator: MO_8 <= x <= MO_64.
>> + */
>> +static int esz_immh(DisasContext *s, int x)
>> +{
>> +    return 32 - clz32(x) - 1;
>> +}
>> +
>> +/* For Advanced SIMD shift by immediate, right shift count. */
>> +static int rcount_immhb(DisasContext *s, int x)
>> +{
>> +    int size = esz_immh(s, x >> 3);
>> +    return (16 << size) - x;
> 
> We need to avoid shift-by-negative-value if esz_immh()
> returns < 0 here, right? (like commit 76916dfa8 did
> for tszimm_esz())

In the interim, I have rewritten this to be more like neon-dp.decode, to decode each 
element size separately.

r~
