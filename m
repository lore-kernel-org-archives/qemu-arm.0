Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp107773ejk;
        Tue, 28 May 2024 10:41:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWy+wHmwD30l5AGosGvnFkMv9duvpMhBw7z9fxbn7EUG7HE4NDea0sc7qDvzJRgCNCAKUGWIw7x26bchLwTT26A6rFBEO1
X-Google-Smtp-Source: AGHT+IFnw+aQQ08PR+YPXpgL+67LKGbVETRgS1rBRVrU/yaEP+5EM3wLrr9H+gh9272ubfV74f89
X-Received: by 2002:a05:6808:1149:b0:3d1:d35c:778b with SMTP id 5614622812f47-3d1d35c779bmr1276458b6e.5.1716918087271;
        Tue, 28 May 2024 10:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716918087; cv=none;
        d=google.com; s=arc-20160816;
        b=yL76fFywBuj06Lb9P6lTAmcPgOPHKrM813YbHqlp7Oa2wZhmTSHFyiB9ddRi0dkZLi
         fTgGxmuN/Ovb6brqlVl/gCF3JQhxGkvv8RKYOxURJA9zAbFlRcj9hVdVK/A1HXCTSSjM
         ovL5/FTslhWKJ3kUoCmhLDVHkINeMlpYxdYbPJQzemwpgNGYzYnlZWn4CanA2J95Klmw
         PWvSbu41i8E9RviF2KdYtMJW+BA7py1AkFyTxJXRuKhuY41o8qG3JM+n966sg0DqGp3z
         n/FhaAkMtp4xpwpQLe3hSVtpLRQQOqUE3PiJRnTNPxe/oRjRRA0Ye8NC6nTA0i/eBQrS
         edHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=b8regoAjpO+UU6Vl5OocXpkP0xE6mgOtLUjS45BneZQ=;
        fh=Tdr1Jb9TI/QJb5H5YF0FTXyn4THfYq2bDo6aVmLo+kQ=;
        b=GRqGKJFXPP+jBZ1I9VPO2vMqN1Qtn0MUOSO9XLxbRIizIAnolhOMtcRijLciEIifWk
         tlyZJsXx2rhP6GZiJ9bSLhm0cQ8tnIiXtbdhcmUS+M4LNHfBl5Fkb3RQaaq2Qcb+5EIa
         uze048byOjzTIV7hX+COhj8bkRJoz6NIwRXq1Lt3UiYkTzgArARv1GsUXw7OP8IDjEsh
         XBdj3ex98lGTN74LeuaOYW/MCqwFVX6sFqM4qUTWbRC+3DYdug6qqncNuP8gy4tYhkys
         eVayGewcVy8yw6iFFwIE815SNXX4xbRA2uMkGoyn64203CIH08sq7Yk6VFi4U/Bn6Tzj
         RN6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ysoSJD9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac06f4f2c6si109656766d6.39.2024.05.28.10.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 10:41:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ysoSJD9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC0p4-000159-FW; Tue, 28 May 2024 13:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0p3-00012X-5o
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:41:17 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0p0-00058A-Se
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:41:16 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1f48bd643a0so8757165ad.3
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 10:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716918073; x=1717522873; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b8regoAjpO+UU6Vl5OocXpkP0xE6mgOtLUjS45BneZQ=;
 b=ysoSJD9qlUNkUp7Pbbll1WvDaOUMz7p5FYlEbNkbdXK4mO9QkZgewkPEBluhuhxlRl
 SX8DS7/I7JdUlfNf00OX6MsbPqbgF1MK5lmUBjxA33Utts/5KYgc1Pw344ufPQs/Mb17
 eqi4OyywFCbYcsrc7fpnwf5Nfb0I6KhMfHzBZ/kIr/8g5oDNjKXd1vZ+Ux/tMKG4WfpV
 kDWjPvmxfShgA1UIaanbJKPVGajX//iOHuYiZEdrWsBzEBA1Sz2/DK7+ldfAht+jDwx0
 6Jy/VDaMKPyKrrZYAD8ixUBo1A1yBKc3I89lca6eT+aLw1Be5xRf7wlcF1hRV9uvBWcK
 0sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716918073; x=1717522873;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b8regoAjpO+UU6Vl5OocXpkP0xE6mgOtLUjS45BneZQ=;
 b=ep6guLtRBHOwYuOJ0qd05OmrRdRb59sX2db8jTEG0M9Mm28BaDiZvHQsKznb0pWl1f
 JqjdUFYL5Ga2+Uu2TPC43nWbcYv0VM2l2d3VRUezNFFUiR4Y2vEZ1P7EqxWxHgWvwgJd
 YEYdj55Lq29SkyRI624sOlOhWUC1VFycXBd33GaoMDDM5BC93c6iqkgvhJSlhhkdprw8
 +zBT2KrB7uV/R7s7hS9sR8dDPUG1IO9rdNO3L+cl242wDKGV4pyzlzXBWH1TUdSaOcd3
 5vZsw4NTthBJYHHvhzyc/J1vhSvrvdBX96916bmg8m3g1KKIxwr350m/nVYrQXGAKimw
 nRxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdnC1ddZ+25i87TnpKH8HqKFoB8d+gPe4WsTtHHWAyfMJSSxg7pN0I1oB75ZErWLuPr2GQ/I7Az8Q8OmtB2lWXVlPS
X-Gm-Message-State: AOJu0YzfiKwdX5cMyvrGNrJUfVVBklolI5htKDW7LdVIPKKq7KUyOXJS
 O5k3soQljJhq3acwAAC2YRs8VMcSpNynamcfEKK4vRgDQ4AUueHqRYaqKvGk9BU=
X-Received: by 2002:a17:903:1107:b0:1eb:d7bd:c0d0 with SMTP id
 d9443c01a7336-1f4498f2a5dmr143226965ad.60.1716918073124; 
 Tue, 28 May 2024 10:41:13 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c968516sm82990535ad.179.2024.05.28.10.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 10:41:12 -0700 (PDT)
Message-ID: <6db11e9a-34c4-481f-938d-df8e3c2decb9@linaro.org>
Date: Tue, 28 May 2024 10:41:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 38/67] target/arm: Convert SUQADD and USQADD to gvec
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-39-richard.henderson@linaro.org>
 <CAFEAcA9oBzyrjBKcX6NdkDGde5YJzfHUYpPKfx4w20KaqhpS_Q@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9oBzyrjBKcX6NdkDGde5YJzfHUYpPKfx4w20KaqhpS_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Wo1vJ0+I0T+m

On 5/28/24 08:37, Peter Maydell wrote:
> On Sat, 25 May 2024 at 00:32, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper.h            |  16 +++++
>>   target/arm/tcg/translate-a64.h |   6 ++
>>   target/arm/tcg/gengvec64.c     | 106 +++++++++++++++++++++++++++++++
>>   target/arm/tcg/translate-a64.c | 113 ++++++++++++++-------------------
>>   target/arm/tcg/vec_helper.c    |  64 +++++++++++++++++++
>>   5 files changed, 241 insertions(+), 64 deletions(-)
> 
>> diff --git a/target/arm/tcg/gengvec64.c b/target/arm/tcg/gengvec64.c
>> index 093b498b13..4b76e476a0 100644
>> --- a/target/arm/tcg/gengvec64.c
>> +++ b/target/arm/tcg/gengvec64.c
>> @@ -188,3 +188,109 @@ void gen_gvec_bcax(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
>>       tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
>>   }
>>
>> +static void gen_suqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec qc,
>> +                           TCGv_vec a, TCGv_vec b)
>> +{
>> +    TCGv_vec max =
>> +        tcg_constant_vec_matching(t, vece, (1ull << ((8 << vece) - 1)) - 1);
>> +    TCGv_vec u = tcg_temp_new_vec_matching(t);
>> +
>> +    /* Maximum value that can be added to @a without overflow. */
>> +    tcg_gen_sub_vec(vece, u, max, a);
>> +
>> +    /* Constrain addend so that the next addition never overflows. */
>> +    tcg_gen_umin_vec(vece, u, u, b);
>> +    tcg_gen_add_vec(vece, t, u, a);
>> +
>> +    /* Compute QC by comparing the adjusted @b. */
>> +    tcg_gen_xor_vec(vece, u, u, b);
>> +    tcg_gen_or_vec(vece, qc, qc, u);
> 
> With this kind of code where we wind up doing a vector op
> into vfp.qc, is there anything somewhere that asserts that
> we don't try to do it with a vector length bigger than
> sizeof(vfp.qc) (i.e. 128) ?

No, but I could add an assert to the top-level expander below.
(In this case gen_gvec_usqadd_qc.)


r~
