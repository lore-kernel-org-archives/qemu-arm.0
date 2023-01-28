Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1548438ejc;
        Fri, 27 Jan 2023 17:14:05 -0800 (PST)
X-Google-Smtp-Source: AK7set+HPow0K7Ya8fSBTW1VgyntoxPV2xSl1DqTltS5sAClAInsKomwAxomO81ADEAaedGwFfn1
X-Received: by 2002:a05:622a:1788:b0:3a7:f552:fd60 with SMTP id s8-20020a05622a178800b003a7f552fd60mr1609980qtk.41.1674868445022;
        Fri, 27 Jan 2023 17:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674868445; cv=none;
        d=google.com; s=arc-20160816;
        b=bW5kUV059RnN1FBqrM22Td1k9PpXyyVPLZkSb83++uQ2Gq0DO//5xC2ryL8qiGsLiZ
         YHMH/hG1XTzaUH4wZdAJUDihpNHKM4bYW6MxWT2wgF85jvMlWcUprwDUa52+Tqa1oqgd
         saJym/JsJc4hc5pukZZhImlWuCZqHOfrbmrPV8+fHYHeqCUAmdl98wj2aOzjAB6oX0Ni
         dymg7WJN46+Y2COaaNrnDz/BZSxEp+ZPyNUnmp5F3LHMzq48UV9PWS1Rd0rIzzPRP/qk
         qf+pVt5z4gbkPIQCUUm4K3vY3o+VKV4j3BfttrXaCBmW+p/g6M8cs+3rKNbB0AGmW9ny
         6BWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=sb1hIBNVIe3rR0re9Y21qriETaRXzVhWU8UoYxIBuUc=;
        b=PjheaWtPo6e2VLYByf/Jtn+2JaD9UVzOXwyZz0XDYRMlLMVY16HdWaZsP9Pqa4agNA
         tMzE1nV6FWBHpSWyCphJGixDr1e5ubzhIxqN3T5OdrmfeV9Q/nJgmtrM7ZYw22e9mIX4
         SGzceL6KWBTbDKQ2fHiCxsFjgVW8pBGsdS+P0yWujgc3owod7tvHth/37LmepOREYqxw
         qszJUaDUqMCsSP/Ui6dYE41B7d9gN4ESUyTUdqbBzYD2WKAvtvu4AoChTE+oJXXdgjey
         qm5cVNo4aAo/7Oc0rzkVjb6exOaB7g0UVhO8NUS1zcevlDkxnnzy4XM37CQiLDLdj1vP
         Z9Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WNSMuSCk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020ac8410b000000b0035a89595940si3075485qtl.19.2023.01.27.17.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 17:14:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WNSMuSCk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLZmw-0005WE-Ff; Fri, 27 Jan 2023 20:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZms-0005Vv-IE
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:13:46 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZmq-0008L1-Um
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:13:46 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so10348113pjq.0
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 17:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sb1hIBNVIe3rR0re9Y21qriETaRXzVhWU8UoYxIBuUc=;
 b=WNSMuSCkD2nh3c9pLsLRHmkVbL4YaEd57Zy8TLYT6tyBUTNyrsUw8NLj3oG3eSQQFY
 vNOZHCXjNmqAREDyqF2O9qWRpxdexSRjjHYSgpqige5QcnWDSpPEPPSDOQgEIZ2lFNKf
 R25sHytjDq3RHdR/w2Ewi7fBfLYRQvu9M4PYXiv+C+zjkNq5ig+sEdEfr+Fi4IC6ouDE
 Ri0pa/3tDwdr9ZLfevT5qCM1W4y+Tvt138FfV6rqaOud+EbBoVeUqqc5o7zUavLdGQpy
 hlLTfxiNvHQor4W9G6IsxyMSddA4TEF+KMah49EvUQKKTwX82zgLY42l2tUli8fU5kJM
 8wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sb1hIBNVIe3rR0re9Y21qriETaRXzVhWU8UoYxIBuUc=;
 b=A8ehCrQeOF9eVzyPp27hhwhpfN0JLe4juSs9lGVgOpgTnZX3onfwHgdtu/up4SfB4o
 49dEK3TggFYQLqTA8as4WCwno55kW9fVBdZGJqj+I9FVtGJH+QiU5Tj3JDNTsLSGtgB8
 BsBBT0M3jJJq6j52U5AOsHeJrHQkYA3HA+QLgf0wLdj83byGxm4ljbNRfpPdz6rccvX5
 q0siSDQwu44YHF/KLe4G1l3Y1jkkQHG81G5ygcj1b64nsw/EgEHF5qd4poSpU/EvBPa5
 ry8Q8VGpjbYYAyTQ54SxJ7OyxB/nvAuSxv+RkWVgvLEhXbkkKftkLhALRXSpAeTTpnmF
 zPDA==
X-Gm-Message-State: AO0yUKV4tLEVMF5V6DR+gDsPfioQDSEZBLTtRR2bWkNxdOlrG7f4+hiT
 0MIbZBMgnK79IylpiaXIoCIQmw==
X-Received: by 2002:a05:6a20:144d:b0:b8:65b8:a37 with SMTP id
 a13-20020a056a20144d00b000b865b80a37mr883794pzi.53.1674868423460; 
 Fri, 27 Jan 2023 17:13:43 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 l71-20020a63884a000000b004e28be19d1csm377471pgd.32.2023.01.27.17.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:13:42 -0800 (PST)
Message-ID: <b093f644-9ebf-75e2-081e-b5887f95ed5d@linaro.org>
Date: Fri, 27 Jan 2023 15:13:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/23] target/arm: Move do_coproc_insn() syndrome
 calculation earlier
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: CGPszpVVvJOz

On 1/27/23 07:54, Peter Maydell wrote:
> Rearrange the code in do_coproc_insn() so that we calculate the
> syndrome value for a potential trap early; we're about to add a
> second check that wants this value earlier than where it is currently
> determined.
> 
> (Specifically, a trap to EL2 because of HSTR_EL2 should take
> priority over an UNDEF to EL1, even when the UNDEF is because
> the register does not exist at all or because its ri->access
> bits non-configurably fail the access. So the check we put in
> for HSTR_EL2 trapping at EL1 (which needs the syndrome) is
> going to have to be done before the check "is the ARMCPRegInfo
> pointer NULL".)
> 
> This commit is just code motion; the change to HSTR_EL2
> handling that will use the 'syndrome' variable is in a
> subsequent commit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.c | 83 +++++++++++++++++++++---------------------
>   1 file changed, 41 insertions(+), 42 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
