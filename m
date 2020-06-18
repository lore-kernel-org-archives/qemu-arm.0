Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1939215lfm;
        Thu, 18 Jun 2020 12:20:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqUAXLP99MOq1if0sOdZXK2j8pgdcaqR0oDM6ufSPEARvBIu0UwmlwOAZpCEe0jmiayfCs
X-Received: by 2002:a25:ba0f:: with SMTP id t15mr242882ybg.376.1592508015185;
        Thu, 18 Jun 2020 12:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592508015; cv=none;
        d=google.com; s=arc-20160816;
        b=AdTzNnOkDr5OtzKxqjL6c99SHrnKcMCcL3sPL8t62OdWbicCxQWUp3S/MoXUAdjRtd
         iioNNvnckflkZZe2vAcAy5nldvcAzc3LxkU0d43EcYSc9ym07E6CfZZ+7qeXqVCdL41z
         kF4xN/h1LKVwu9pX5URN20dApNrhhRYGGDKe+WBm6kP9UqsRTbroWlChZdULlyxReDhO
         n3PrGOH8wv+kSz7CdZvSDMH2waeEGsP8fsIeJLjOAhAg+qJP13+dF63Y8vq6VCJJi3jG
         i6ft6eUCAUHtQIG5lhdh8k2B9rdoDwrsZJ/MrJM3ArSScJCouV0krX0xyqA7HjjkroO9
         cWKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zTEpJStbwpec8+oM3y3EvE/o3v/vYYV2Kl76GPb4ZZ4=;
        b=YseEgg+FKf4cX+lYs0jIht8Cng5xnvxQ6SAHe/xdSCCewcoNVg3ny49P8ZxZcHrV7n
         6Ki5lO+/rNbBP3DVeEb5lxux0Ju6Q9cYLddD/OGsA/e+ewU2La0cQQOdxbNVyjjDcrRF
         UGOTGXl08mrJY2cgE7yhV4+C2el1zW+WivDYSz2EiP8xVy2wFAkC+Bk6Fmig3o8LICHk
         TOf4Vcom2YJER2QvEPkEf0J5k2fNP0tj0SbomnugxG8Wc9v7ofFcvbLuwQrcd97XfxbO
         zeD9FhsTR1Vvbq4mpoFQOJvGrAJ8M32QykkWAQdoi65YzzYWJHl6YeFwEntsU0TnDLKf
         g7xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LGbKy+eF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si3221989ybg.57.2020.06.18.12.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 12:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LGbKy+eF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jm058-0000bz-Fy
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 15:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jm04y-0000bk-0k
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 15:20:04 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:46265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jm04w-0000sR-2q
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 15:20:03 -0400
Received: by mail-pl1-x642.google.com with SMTP id n2so2834379pld.13
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 12:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zTEpJStbwpec8+oM3y3EvE/o3v/vYYV2Kl76GPb4ZZ4=;
 b=LGbKy+eFx3IeATyVhS/8yOZKfbNAFHpdjefWOpQibbQmeDO8j+tpRTDCSxekqT6aPh
 TeIz31pE2gmn1EXKG6/yl/ts6P+BPoaVOd2Qw5XeGNXg+ElifByq5P3G7W4xF3MiOly4
 KmOX1GPHNAv8y6+CFWR2gD0twuiy8FK+TA8hSkG3QNm4tX2F6gYVRN6ciE4lXMT4FDgV
 gGTxR2LOcPyPn2KpM+AbXFJJuE03YLKPv0wLNMBns4hw7uJ9cB58HrTnbITk6X5pDIkD
 Duv1ZXc1RmAdH+h151clogxzb9seS4/MsFsluh0/lYOTGoZ9cICXE78iku3GCCI3V4hS
 Po1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zTEpJStbwpec8+oM3y3EvE/o3v/vYYV2Kl76GPb4ZZ4=;
 b=Yu0RDu21qONb0aYEFp4ibwdPpUMmn8yQV+Mfj/c34XbNXOYEjO0KzRtAcE69vmDoN8
 8LVlGTnEiSzfdPSTs+AhGRXaQXTeVzMnTnaYSa+ak7SiKg8IadA/NuWl70vkuU8Uy/Ne
 HnlzlsR1Fla3DjglLoB9xJVuhdKFpD0bRTMVuyBcEUlFK+lpdfpTD1YPU0xZpoBwWKds
 +GfL61cAMvlCgzaR42iyPMZCAmrqb4+h63rMTmLAYJYNR0n5UzX7fuw09mXU2oz51Pq4
 RDqH/qwcg+clki/NGoPud7y5TrO4Z38B4SgJM0VAxWg+zRaDZT51D7DkPevWg8lZmzRI
 nYjw==
X-Gm-Message-State: AOAM532l5gDuty8QQa4hkWrngVDCyjUFhNsD9yo98eiiPv/zS+0ipFgi
 +fJYevSTRt27EnlfUoJlYDh0yA==
X-Received: by 2002:a17:90a:d3c2:: with SMTP id
 d2mr5404142pjw.202.1592508000427; 
 Thu, 18 Jun 2020 12:20:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id k14sm3207368pgn.94.2020.06.18.12.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 12:19:59 -0700 (PDT)
Subject: Re: [PATCH v7 14/42] target/arm: Add helper_probe_access
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-15-richard.henderson@linaro.org>
 <CAFEAcA9EJB8Oa5c7emh-cKMmZRUPa8rRvvvXsHUJWO51gUaDvA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <998a01bf-fb40-f075-fc08-747669c52b70@linaro.org>
Date: Thu, 18 Jun 2020 12:19:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9EJB8Oa5c7emh-cKMmZRUPa8rRvvvXsHUJWO51gUaDvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6QJkqIkhu5xC

On 6/18/20 6:33 AM, Peter Maydell wrote:
> On Wed, 3 Jun 2020 at 02:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Raise an exception if the given virtual memory is not accessible.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 0ee2ef403e..b032829194 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -232,6 +232,19 @@ static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
>>      tcg_gen_andi_i64(dst, src, ~MAKE_64BIT_MASK(56, 4));
>>  }
>>
>> +static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
>> +                             MMUAccessType acc, int log2_size)
>> +{
>> +    TCGv_i32 t_acc = tcg_const_i32(acc);
>> +    TCGv_i32 t_idx = tcg_const_i32(get_mem_index(s));
>> +    TCGv_i32 t_size = tcg_const_i32(1 << log2_size);
>> +
>> +    gen_helper_probe_access(cpu_env, ptr, t_acc, t_idx, t_size);
>> +    tcg_temp_free_i32(t_acc);
>> +    tcg_temp_free_i32(t_idx);
>> +    tcg_temp_free_i32(t_size);
>> +}
> 
> This isn't called from anywhere -- clang is probably going to
> complain about that.

Ah, yes.  I thought it would be helpful to split this patch, but I guess not.
I'll merge with the next patch where it's used.

r~
