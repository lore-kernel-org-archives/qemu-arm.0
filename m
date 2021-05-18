Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp486118lfm;
        Tue, 18 May 2021 07:53:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWZfGv9qqLEdFjare+t6eMzpjXd0jnX9mANeGH2uSrqtPx8y48jj4d09eWJXT/HRxX9syf
X-Received: by 2002:a02:b78c:: with SMTP id f12mr5932883jam.7.1621349614655;
        Tue, 18 May 2021 07:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621349614; cv=none;
        d=google.com; s=arc-20160816;
        b=k2NnZZ+Ywr62NiVuqb3N34D3/vt4HtDCzz3cV3xJvIizhVPcmbBV9zHjofRuZEo+PC
         GDI6j2VjngMsgBTg0N715JzQ3ZmyH+w9IMs6y3FKDVV6EYrBfaLJVeoJpFehFjdfVHRj
         fqakcsZtGv12UGXMPgCW5IAmd52UFQDPBzCfTTWo/05uWdiyoQk3fYf49vKbAGr66pf2
         ikiZLM98i7ZoLKVkIaMa7EIgZZa+yOuXaARxXjcjiNCOVFS6h/SgmwE/jcSccWvAGu5K
         gn4jY80aMI92kbKyB/P6DkRlcohXtMO4jr1ffw96UOQi89MjBCzUKL+75JvOU0gxVKYd
         2n8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XOnY3p1R2+ocbA+FlRdz8pr6+rkik4VqTVqjvSrhmfw=;
        b=pVRFwsbg1dt8Y62jZkr7n7+IviImO7uD8Q4R0Wmtdd3HDSeE0ZhRI48MUsqXAbYqbt
         Qzn3bzLg8Cv6OjrtwsbGbQ8osC7BZuJP4+c90p0Juwz9eK1gQRIlb0QqPKT9vSDbCCaA
         s7xPbERPXbIXcUU+j7VtdOdGKiZqHuMapIYlsQaTFIvWUwhPKPo7k7/2mpvF1rjL5EvM
         +fYD8Q06cTAI8DAEhpcv/vatdlVYWVepINHsJ0lMjO85630Gr+cLQyrPJ9Cq0iE4NeOK
         qEtzufWfKws69yNJmq8o3rmhYLVfKknxsno7nI97vHiIlY7FxpjRdRnwW4v0DrG8kblr
         2PPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hzQgMDxB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si21220935ils.113.2021.05.18.07.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 07:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hzQgMDxB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj16E-0005L3-0N
	for alex.bennee@linaro.org; Tue, 18 May 2021 10:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj10k-0005gB-PS
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:47:54 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj10g-0004QC-Fq
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:47:54 -0400
Received: by mail-ua1-x930.google.com with SMTP id z14so2216139uan.7
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XOnY3p1R2+ocbA+FlRdz8pr6+rkik4VqTVqjvSrhmfw=;
 b=hzQgMDxBfSBBM3d6mOcVLUGTLukugnW972pq+ir1fW6LHxumkBRg2dcJuUTHsZSX4+
 p7eqh1OBPjATl9ProFtsMv4gyNDHjTiK7KYABz6Zezy4GVJWasglqneqSdTxHKDFOPqq
 zfdyRLgP0qMXzJy16RsvLtWhlKyNBg+aNPOLIy7oFgBjBNYbcBpTH3klNqryj9cAnQ4K
 ZmXzbNCVIl6usC9CWRufltZ0FdVuhOoyHnZeGU82De00K2XH9exF15B8Rka1JnWs+0EY
 yrGOOjDejWlebXtzZoOLoZZk5TAhXrsYQbkiYTh5yWARsYj9xGVu5HJTyl4aDafTILfm
 lK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XOnY3p1R2+ocbA+FlRdz8pr6+rkik4VqTVqjvSrhmfw=;
 b=IftpQsZeiGVN5AiNBbn5l9Bz8TUyzkreoLQVQozGBEwMY6cOifqWPbRwVwS1oQly9P
 hWCAwuoLZklMnf8MCyAVcbI2N3Qbz0EXEnFfMy35wsqti2eWGbON1vxwP7qpeXnPUamQ
 cTdqqGNFdkvwM8moyGZfX5hzd6CxEUI8Oxij8217Xf/7SutPF9JGqxmUdeJnWJ9Sqbep
 xkRYZVBIU/8z1mMfmlZ3u33B8AL69vbGeMEJHD7PkgnQkfcrrtVOWA8ZDmGSvFMBVx16
 /CXjwMT2Vnd3HAXIlklMysLQHM5PEeUoVBlwarlT5kU3l508OUngQs/wUy7FbibekAJk
 Myyw==
X-Gm-Message-State: AOAM533zC1rudWBB1AX8FoAw2w1+8nm5Ock16ZR3uv2W1WFzHrc6SkAt
 yyV2+Pz6xR8fEvrlSuPAtYC1MVWJpi5vFGkw
X-Received: by 2002:ab0:3b06:: with SMTP id n6mr6891758uaw.6.1621349269385;
 Tue, 18 May 2021 07:47:49 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id r12sm2871439uao.6.2021.05.18.07.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 07:47:49 -0700 (PDT)
Subject: Re: [PATCH v1 11/11] target/arm: Enable BFloat16 extensions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-12-richard.henderson@linaro.org>
 <CAFEAcA_YZe6xMfMFek-KEh8j3zO-AiquM3epyFET3R6XPDAjkQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0882a45d-8c02-93fb-2dff-abdc7f7c6b95@linaro.org>
Date: Tue, 18 May 2021 09:47:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_YZe6xMfMFek-KEh8j3zO-AiquM3epyFET3R6XPDAjkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x930.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: XLFHmVATbMPw

On 5/18/21 7:47 AM, Peter Maydell wrote:
>> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
>> index 046e476f65..b2463cf109 100644
>> --- a/target/arm/cpu_tcg.c
>> +++ b/target/arm/cpu_tcg.c
>> @@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
>>           t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
>>           t = FIELD_DP32(t, ID_ISAR6, SB, 1);
>>           t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
>> +        t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
>>           cpu->isar.id_isar6 = t;
>>
>>           t = cpu->isar.mvfr1;
> 
> Same query as with SVE: do we need to clear these in the "!has_vfp"
> and "!has_neon" handling code in arm_cpu_realizefn() ?

I *think* we want to clear ID_ISAR6 only when !has_vfp && !has_neon, as 
FEAT_AA32BF16 should still be usable to the other one.  Which also means adding 
the NEON/VFP check you suggested.


r~
