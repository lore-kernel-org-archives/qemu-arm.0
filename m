Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp18451ejf;
        Fri, 19 Aug 2022 19:37:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6lN0a68XrblrPOrqtV14LvEZuzVxEvQIJDAi2JXWM021BZ+6JBITLOoaTX2CGVsPM+u4Fl
X-Received: by 2002:a37:b483:0:b0:6b5:8688:5299 with SMTP id d125-20020a37b483000000b006b586885299mr6933984qkf.147.1660963065240;
        Fri, 19 Aug 2022 19:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660963065; cv=none;
        d=google.com; s=arc-20160816;
        b=JBWS7/Ifl72j5hxiQUfdUKC4CWEmke+9GKq8xzDANaFEa/UQq0lOSVTL1heJ15WdkV
         vGqiOuSD4iL9i6ldYQEKtDGkseFiWGz8nrOuexhUMb2UKZkcbas3YA0qySuAENOfG950
         Xd/N1cdUpfuWPGlf3j2NCVLL8c36W7Iv+BsjsyTxJwtoGWTUCU2EVwrFy6P0AwvaWNeL
         iQqsRlVYao++mrYF+NemxFn2V0p6MpJlkn0RaAiFlhAeLIgJOvEZpDjo+8YWuLLz9H5f
         ybwKN/FKutkQg9ZVOXeo9JCv5K3qzuDFvtLcJAB7WbunYqLN+dumVL8thdIHDasIUrR6
         lXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=34xPuFrlEP+JXa7JZN4iRJAnoS1o2sXCYjTzW4qOFPw=;
        b=d1dNFrq02XTXmjNoSaudUGTKoAsXag8vc+DFFHeMghjlwrJtuGnm5qy4DSEG1y6Twi
         gaNVA1cmups6jtEMjQxpt6WMhJsKxmBCtUUqTmO+6fx0vtivnvDWqT2JIRt6wbH56oV5
         HDvsspnx4Lw8E5goPe5kuGc8gvQuj7vrqVw+5+Sz6Y7i0MqkXQce9Byny4EHd1awxR3z
         2KuGgh/d1prjz/6wQfq77PyEre0KAGExEx69LKsXslKSX6vEeBvI6ceQIFz9yHsxK0Af
         ZAUALuV1ywTgaTA5h2qHQk9bNWz4B5aZ3eQoMM1NLwYqxOzOs/EgElqCKQsvfN303JEX
         t2RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zs2x6qMD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1-20020ac848c1000000b0031ef2311c6csi2285668qtr.724.2022.08.19.19.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 19:37:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zs2x6qMD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oPEMq-0006Jy-PQ
	for alex.bennee@linaro.org; Fri, 19 Aug 2022 22:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPEMI-0006Jg-W7
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 22:37:11 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPEMG-0007kj-Do
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 22:37:10 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y4so5532813plb.2
 for <qemu-arm@nongnu.org>; Fri, 19 Aug 2022 19:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=34xPuFrlEP+JXa7JZN4iRJAnoS1o2sXCYjTzW4qOFPw=;
 b=zs2x6qMDerZFafuhf0dh63vzcYNan0wGW11PD4SHeNYJm55+sQn/hgAU/Tmw052uMG
 n75WQX5KkLF4bj/wRcltmhup0FTj1g0ZYes+dxlFdRbMbSqgv96CMZzGspNx/gEe1YO4
 I1kLW0U7yWv8AQ39TCTiwYZZhHg4AHxgEUcmIrmK5dWUc5hXIDhUjVYAeMNRU4UTI87J
 36GrWYQj/von/lXYkuAvJFBdOebjPG+RrVuMczSyb+7BoaSU4Umb2zUqrm8B357tt7F1
 koqAK66hudf1mSd/7vrOdohO83JPGY5F8AfpM7gvGs6a2sbnR4rx5aT4WKeGy9FX6PcA
 vxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=34xPuFrlEP+JXa7JZN4iRJAnoS1o2sXCYjTzW4qOFPw=;
 b=QOQ6AVy7eQxuL6qFmOn96MWIsC5OXjBX59xGHsQgmhFQDQunnig+kbBVJs1XHQe82A
 WovmuselGZ6MuF+Y7zkV6t1e08TeTSE87CXSw/DAzFhOQO+9FwTd4FBTx+EbKxnFfn4o
 i9tGV18K4tNORCzBkcGBHp/t3Y3sr5wx5bJMOb6950FR7UuooZEyzfKBf692zzFvnHXL
 NmYKkAEv1zh13fnXlqEKrUOPX9c/XgSd+gBhWYrCbV+4ZItcGa7QDoOVPO2pT+syJsFl
 oahLjhOGfYLpxgl+dHRBNuDvy2GtbslUx68hbmAi6CA39BNFGVZxwoLhPVDqAbv2QJ8H
 GOtg==
X-Gm-Message-State: ACgBeo030LUt/YvkDlCacUVD7DbXoewCZJ34855M0UqJhAoT3vJRiH1c
 S2+jZrS8D5k2AiRLuCOMLhGKvQ==
X-Received: by 2002:a17:902:ef45:b0:170:8b19:4e0f with SMTP id
 e5-20020a170902ef4500b001708b194e0fmr10426904plx.120.1660963026615; 
 Fri, 19 Aug 2022 19:37:06 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb?
 ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
 by smtp.gmail.com with ESMTPSA id
 e126-20020a621e84000000b00535d094d6ecsm3902435pfe.108.2022.08.19.19.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 19:37:05 -0700 (PDT)
Message-ID: <669d1687-3ffa-0616-a623-239f479ba717@linaro.org>
Date: Fri, 19 Aug 2022 19:37:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] target/arm: Make cpregs 0, c0, c{3-15}, {0-7}
 correctly RAZ in v8
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: rufppUhNixab

On 8/19/22 04:00, Peter Maydell wrote:
> In the AArch32 ID register scheme, coprocessor registers with
> encoding cp15, 0, c0, c{0-7}, {0-7} are all in the space covered by
> what in v6 and v7 was called the "CPUID scheme", and are supposed to
> RAZ if they're not allocated to a specific ID register.  For our
> pre-v8 CPUs we get this right, because the regdefs in
> id_pre_v8_midr_cp_reginfo[] cover these RAZ requirements.  However
> for v8 we failed to put in the necessary patterns to cover this, so
> we end up UNDEFing on everything we didn't have an ID register for.
> This is a problem because in Armv8 some encodings in 0, c0, c3, {0-7}
> are now being used for new ID registers, and guests might thus start
> trying to read them.  (We already have one of these: ID_PFR2.)
> 
> For v8 CPUs, we already have regdefs for 0, c0, c{0-2}, {0-7} (that
> is, the space is completely allocated with no reserved spaces).  Add
> entries to v8_idregs[] covering 0, c0, c3, {0-7}:
>   * c3, {0-2} is the reserved AArch32 space corresponding to the
>     AArch64 MVFR[012]_EL1
>   * c3, {3,5,6,7} are reserved RAZ for both AArch32 and AArch64
>     (in fact some of these are given defined meanings in Armv8.6,
>     but we don't implement them yet)
>   * c3, 4 is ID_PFR2 (already defined)
> 
> We then programmatically add RAZ patterns for AArch32 for
> 0, c0, c{4..15}, {0-7}:
>   * c4-c7 are unused, and not shared with AArch64 (these
>     are the encodings corresponding to where the AArch64
>     specific ID registers live in the system register space)
>   * c8-c15 weren't required to RAZ in v6/v7, but v8 extends
>     the AArch32 reserved-should-RAZ space to cover these;
>     the equivalent area of the AArch64 sysreg space is not
>     defined as must-RAZ
> 
> Note that the architecture allows some registers in this space
> to return an UNKNOWN value; we always return 0.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 65 +++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 60 insertions(+), 5 deletions(-)

This is the thing at the top of H.a page G7-8990, yeah?

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
