Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp814235ejx;
        Wed, 9 Nov 2022 21:45:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4956GQ3DCCfK0+ZLC1mGh7F+CeJOP9m7G1VQZ7ohzvz5rmeK05tfBavCMRWJIIW+Q4WbFk
X-Received: by 2002:a37:516:0:b0:6fa:e36a:3870 with SMTP id 22-20020a370516000000b006fae36a3870mr620129qkf.52.1668059102288;
        Wed, 09 Nov 2022 21:45:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668059102; cv=none;
        d=google.com; s=arc-20160816;
        b=Oj3TebesJ6MH8BXy+hP7b6j+NecmzgpYvGNr23aySlZBTg98biStLZJtMa/7/gssZF
         yAIcHeE3ULDss9b+y7TvA2TobuLfZWZnFRlCkMJa+gi3eU7ytmn/R0LLDTYGjL1rJd8e
         GKfKVc4V8awcj7qqzy5+ywX5s0lK/e+w8AyQ7Tn13CVBnqGPqk0XXTD8jHQbkV4PJmZT
         +Y++o53/94b4BogUJsD8MNRpmUJ7z/NSl/rleh7r0CCECX5gsTPafX8ocZuAMDNQ9xmN
         96OyYucYPuIEMGy/TdN804DQ1tU5HpzEatNOYjrYXWGwlYd6oEAhiBRKqAsdRceug84y
         1jAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=QNa6LIfLiz4YfalJHxTzZ5HDO6DWf6I0joCsVY5xBF0=;
        b=zzWfIRnAbdJvJp6LqfUxZ8DtP8IKi5Cv+R9lOee4YsMLTMMmaxfunSPli/OhRlSNn3
         0MK+JYrSFMDfnKfSkQcpcFMe2sEltSSV/voenDzXGWTXFizw8+oT0RHcKMCkRi7bs12W
         o3CO+0DNLBrL7wV3/2XjGZ1Jooq00fBDcDCdEwKOFKnPKbqOrBm9DM68qw5Fk2gyGNom
         jxFLR0UuSbaf0OvOy4T4im4dNQucbe+5TfrZkVKh/S3BrTpwVcL1i/3wGJHep3QEf9YG
         LLSiCLsv2IWcBUO0XrcqXVRvRyaxToI6QPLaOSL1s/2qPpXHABIeJNf6f6P5zOQFgIK4
         ovbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQlMhyRW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a0562140e4a00b004ad7b54d9c1si9984067qvc.11.2022.11.09.21.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 21:45:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQlMhyRW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ot0Mt-0005ic-1A; Thu, 10 Nov 2022 00:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Mo-0005cv-OV
 for qemu-arm@nongnu.org; Thu, 10 Nov 2022 00:44:46 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Mn-0004xR-9g
 for qemu-arm@nongnu.org; Thu, 10 Nov 2022 00:44:46 -0500
Received: by mail-pg1-x52f.google.com with SMTP id e129so768761pgc.9
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 21:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QNa6LIfLiz4YfalJHxTzZ5HDO6DWf6I0joCsVY5xBF0=;
 b=IQlMhyRWxp/Ndc3NnkUTjXXW12knKqn7ePN7z5pSZxX5TChG7FIqRuSXCHifyPmNIP
 FjEfnsFQt0LuJHzbXwodEJunGCdyn9UsvKxD4onNctkAjSaFMjC7ngRokwNeKkJH1L2m
 tesJFS3HsgNknLe0QFSSTnx/DHhpx+EdjEVrKNpX5t6npS3SEvVgreCJe3nYV1wSELgT
 SwfW1/m2ogDwz8EyzWGndIff8GXPJENGRsu9x/lFehV3tJ/flxwD1pC4j9gwDbwZZK3+
 CEXnF74HS30wRDMpD2hbk565Egn6wC2EEs1sb9BNjSgojwtrXWq9SNosrKXU3z96zOOV
 ZmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QNa6LIfLiz4YfalJHxTzZ5HDO6DWf6I0joCsVY5xBF0=;
 b=02PMBEMlLaq2jaVanAsZrRkKjnCclxvgPrQGTiSJv9ffNvA9eAo5bLncj8GsqZ68YV
 vuyoULxIMbZEMss0Fr/jWRPLybnCBvOzqDu3DR6zsY9kqbrnccaDezAPPdD85nfunkaF
 pDX8QGboSewuzLtxz86Wo6R0Z/51Esjt80uvDpRsPxvXVXFENFudzgdPQw9jMmKenwwa
 YqDSvnpJIndvuLj45G2pMsRZyycUXEX/PBC5kMW52HwPql+xi2opus0n9pg9tnGkttOE
 LVTWCupBygpLh/e/dl7xan1dQ3GmwhsP5a3WdRfd155CpPgRu2/Gxe1PlAMsBYbGlqaQ
 GQRw==
X-Gm-Message-State: ACrzQf2z2jsHMW0ompk238pcKZOmIzXomvBY06pH1ILHR3CChZJi9kFm
 uzVSfMlsR/v/9XkyT7SV491nnA==
X-Received: by 2002:a63:251:0:b0:46e:9da8:1f93 with SMTP id
 78-20020a630251000000b0046e9da81f93mr53948309pgc.490.1668059083484; 
 Wed, 09 Nov 2022 21:44:43 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 v2-20020aa799c2000000b00561dcfa700asm9220358pfi.107.2022.11.09.21.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:44:42 -0800 (PST)
Message-ID: <cb81eead-0913-b454-803d-882c24cb6322@linaro.org>
Date: Thu, 10 Nov 2022 16:44:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 9/9] hw/intc: Convert TYPE_KVM_ARM_ITS to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MVT/XKdj1B/d

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_KVM_ARM_ITS device to 3-phase reset.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its_kvm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
