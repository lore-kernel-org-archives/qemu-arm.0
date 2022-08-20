Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp18876ejf;
        Fri, 19 Aug 2022 19:39:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5mNSJvrxtG2DYML7HZ9qtbUhdfUKNbHOMKu5lYwN2TH3+X+T30PDdPgmYqm8iM64elLZVY
X-Received: by 2002:a05:620a:4549:b0:6bb:bcd5:bebd with SMTP id u9-20020a05620a454900b006bbbcd5bebdmr6265247qkp.281.1660963159810;
        Fri, 19 Aug 2022 19:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660963159; cv=none;
        d=google.com; s=arc-20160816;
        b=FTPwHEV62BqNHiZ4UEI1VNYEkQZHt2gFFWqddtQGKUT3z0cWahNPFe4Valfce+fqxY
         tQfmm/ibvBUeygg923CaOnuIt4nuue/in51VcCjFTVBL1UGE8Iz3JdUsD96+RSKPEgFP
         fOpdOi5x2/vuEkbZ7K2dAgd1l2SzsTuY6ulwCqK1fs1J1ctrW+6FgDiKUI85OOPB0I3L
         halKeZFWTq/sB3W3LcuMG0H+yzK21vEB6kXyo6mpcX+nSVPCW7w4rAnxfHU08xVkvt9Y
         VIGHelWYzJSkxGYau5/4NMLResMv1hps9jww+Svbba2hoaCKvi77ASrpDbKwY/06cGuu
         cjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=fQra0MFLZqbH/4r0jsa1LeNiiDvseybCcRo1WtJMJ/o=;
        b=rFdqlCaj2f/6ku3YsyJ7tjqkvneBMgGS0KvwnuwVAy1GaNzqQtDwuNHfU6aAROC0tz
         45kTwq5FQrhqDM88+kYfueDq3CI+J8pN6rr2R494pmPAGZYTz4CVqKumeSnOzyP9bT1Z
         F07tpDXqAwaCI4PSOk831FN9HdNCrJOyU/wxebj7aTqT+lT5aepTpp1nAxyG2jZgtMUX
         OJdsN0FpmkQAv8gRewYLQ5QL+sehMYGFjofCG2Zy2cjHU44JPaJA8UhzRaRGXl7X8aj8
         3H4vFJSDJjE5bh9jArKCxQA5pxm3umI4U/Pv6qOUQLOR2N3AnBGepH0RTk7fEtE1fI2f
         zTjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x/wWwg1J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020a05620a431000b006bbeb2f49bfsi593520qko.377.2022.08.19.19.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 19:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x/wWwg1J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oPEON-0000kh-9w
	for alex.bennee@linaro.org; Fri, 19 Aug 2022 22:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPEO9-0000hU-34
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 22:39:05 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPEO7-0007rA-Gd
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 22:39:04 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso6430796pjr.3
 for <qemu-arm@nongnu.org>; Fri, 19 Aug 2022 19:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=fQra0MFLZqbH/4r0jsa1LeNiiDvseybCcRo1WtJMJ/o=;
 b=x/wWwg1JZvyRdRmG+GiXD9LhDhXsB24wFbtQ26kFerbBXoGtxe585svyRPRPHjvVG9
 4bst4g0kvOt5oZ1LB+sYnMKCAD3dnIzl75Nxn0RbUzbi1aidREFT1OoQdsbnqIDr2Kxz
 awOx851BWBmAbT09Plw89cPzKv3iglxlmxPDicueNl33BLP3VWuhgFwMUbrnzeWUrQk0
 mlXCNbgsmLNy0ZRYB878AGSdWr23QSJ1Qz3jhdsKWm6a5CwTDSiZd9Dp7sZFWINWemAT
 aybdWih2KM87Dcw6EPVC2sFftDRBtSzCKSFP2lcYWnF8zvzYRKt7FMNZKN4nGYM+FAvO
 J1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=fQra0MFLZqbH/4r0jsa1LeNiiDvseybCcRo1WtJMJ/o=;
 b=5cUE5xWhsaF57vEXxJbZx2mJox6sSGkoiD5BLMBnZa8PBiOt/jbiPg/ZduLFqhKYPf
 USL7otSZFkOHky+Tyx/gQIKNpAueK8vE74Wk8ujuI5KSGbVIs7JrD/FwMCsiaQcQdvQE
 gRG+TrCcNiqWwVzoObBl/n/vJ2NNgB/JWXKF6duS3sE7N3O4V+LvYgepx0s/tbtBPB/8
 hMLIr4EA9SekvA0iT1ybGlSvuqbiR/lsfQE5Qf3+8RmP2yYSYP+IYwPfvRONbmGAScig
 te1YTeHtnFfNewkFJ5HRJevSQLEBwWTDMs/rC7eIQxDkO5wY8r1f+kyXG5P3ogBOsWAa
 uKkQ==
X-Gm-Message-State: ACgBeo2mn1S3rQIEsjFGl6q9bHAiQc8kjSkxLxX3IKHGRgjrEw/syAS/
 P8octxgJlK+assWXW80XGp9uSg==
X-Received: by 2002:a17:90a:1b66:b0:1fa:bbb5:8a5 with SMTP id
 q93-20020a17090a1b6600b001fabbb508a5mr11429561pjq.216.1660963142151; 
 Fri, 19 Aug 2022 19:39:02 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb?
 ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a63ba47000000b0040caab35e5bsm224284pgu.89.2022.08.19.19.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 19:39:01 -0700 (PDT)
Message-ID: <8c7a0416-fab9-3fbb-ab66-9a2753eae4e9@linaro.org>
Date: Fri, 19 Aug 2022 19:38:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] target/arm: Implement ID_MMFR5
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dhur3ydkwciN

On 8/19/22 04:00, Peter Maydell wrote:
> In Armv8.6 a new AArch32 ID register ID_MMFR5 is defined.
> Implement this; we want to be able to use it to report to
> the guest that we implement FEAT_ETS.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    | 1 +
>   target/arm/helper.c | 4 ++--
>   target/arm/kvm64.c  | 2 ++
>   3 files changed, 5 i

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
