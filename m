Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2638863ejc;
        Sat, 25 Feb 2023 01:22:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+cJlFEqtk4sKEjd084pNve2GAao9cgPwDXdJbPQ/Jmi2NBpcZHZEvHTPZ2PFqDSIgd5W1A
X-Received: by 2002:ac8:7d49:0:b0:3a7:ef31:a07b with SMTP id h9-20020ac87d49000000b003a7ef31a07bmr30172750qtb.11.1677316974890;
        Sat, 25 Feb 2023 01:22:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316974; cv=none;
        d=google.com; s=arc-20160816;
        b=olyRpBb3EEJHl69Mu9J1mg1drln7cp5HUeHb/TzljId+MVRedFyIhOCndTVMbrxy6n
         s7TQyhcIjxFE5BZ90yurnnwmJbicgf/d4ObYmFO8GqpfJzCmWA5iZb8i8JBi64PdTVnJ
         Yo4/L36R1EDfFgv/Orw2WN4D7LxDxABFca7aWzrcQWV33a41HB334vzVa0dydmpmUpEZ
         55dhBteq00RUPbp73zjnF6EAb1YsFB3gCD45B3MjLlHtpQ7CwSFRqI9Jhtv7K47jE5zx
         JHPyMf8Di/Bnuq8XV8nV4Yc2k4YeCxTPseLk2rMhUk/+iOo00VHrdN5rkwnhuIJHOP1n
         WPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Z9o8lSNDVgDzgK+zbye3s+P1topoY4svJSWTC0b8hC4=;
        b=VoPYwRPLw48miVjpUX9FVsTVXZYShoKMC11aam5hWIi0FNiOKBkozJSB7A7YCFPnj7
         xapPKdgDS42aoIYe+3Y+kpIo69gq2UN1s2XtBi0SU3PqBTkjjbwrRP4d/AB5MunMUmkJ
         o5SqJHjBmqRuYv6APBZE+Ic55drMs8T+vY8MHPraJrvfZAp3DTOBoaV5jUg56wlwf1qi
         Rn7qRlkzW4/DjSU85hp2bkfkc2Cjj2PWXw3zH60PLCP2ytclqDaAnanRc24qVuLsin/n
         Ff+j+eLpRt86b8SsHFAyzHWA53CWOOCJlhF+5DJwGJPCrHdfOiEaDoOceVuGiK2SzeFR
         srVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kmjKp1WH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05622a165100b003ba0207ca7fsi1540368qtj.709.2023.02.25.01.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:22:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kmjKp1WH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqgp-0006yi-Vp; Sat, 25 Feb 2023 04:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqgo-0006m6-Kr
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:17:58 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqgl-0002f3-Gu
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:17:58 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso5185339pjb.5
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Z9o8lSNDVgDzgK+zbye3s+P1topoY4svJSWTC0b8hC4=;
 b=kmjKp1WH/jLiioaCCjMJJAuhcz0xbnPp4hyDOgiQ3GXpLcCBpJXRdgK8okeBFwEFV3
 jhQXVCIWCh2pneNnf/gBZnNL1NAe3O+Q4JkCDNTe5yFHCnYKMZuZyZLH75jKVbKoyE/K
 dH4K8CG1l+UB4nxB0U/+B9LqrQcOXoFbsZIkZrK1VaK3F092HveWz5couWfFxnUU0dhe
 dqb56xs5KDNYQrGAOiOnhT/IcQYEti8lw7sA1PDme5yLB272vppiHUk/53xui235jGjm
 +FvrVbebvTyhACBlSnHDCYVD/kgQfU2ymyS0E5PtCtCyAi9+q3ExvawRbRXO74yhorm1
 Nplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9o8lSNDVgDzgK+zbye3s+P1topoY4svJSWTC0b8hC4=;
 b=O5xBVagkQcR3VF+rweV3X/zMLSS9D3FIkHO6UKO6753vlPAxgdPEwn/bmImblojDk8
 jfIvz30sdtZUyel0z+JVFgggvtkoOKz30CKdGG1CMqtT+BQAjqqdAPvAbQoERQQHoitq
 5iS8PbUIYntyF2G/x2Z0bZ638DpScbhm67m8xnbMu7DtPE22BqGSfzP2OIXFTQhSt3Ey
 jHRyrIU/ocdAktJCJ3QCWq/ibwWBTb4pQGnnmgY2elGt1s8M9X16RfvPVCHgeBpGFtzJ
 2Sh1CTHmwXEwzw9CkSve5bRrlK10krWzwC4EwrNOOgJiNAuWXkkdjgPWnFww66n93uuh
 TKaw==
X-Gm-Message-State: AO0yUKUyU1VQe+0EW01CDd15PyFnBNOzliZzkycIfFhx4ZCsKAOZihR0
 fMwwrA9zlurogoUzCOfkKvTqow==
X-Received: by 2002:a05:6a20:6909:b0:cc:f39:5094 with SMTP id
 q9-20020a056a20690900b000cc0f395094mr13291962pzj.30.1677316673704; 
 Sat, 25 Feb 2023 01:17:53 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 13-20020aa7910d000000b005a8173829d5sm828694pfh.66.2023.02.25.01.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 01:17:53 -0800 (PST)
Message-ID: <4f6f45fd-5f97-b7dd-ebc9-e2e72570c7d3@linaro.org>
Date: Fri, 24 Feb 2023 23:17:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 25/76] target/cris: Drop tcg_temp_free from C code
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-26-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230225091427.1817156-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: sSDtlDyqJOeZ

On 2/24/23 23:13, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hexagon/gen_tcg.h     | 29 ------------------
>   target/hexagon/gen_tcg_hvx.h | 15 ----------
>   target/hexagon/macros.h      |  7 -----
>   target/hexagon/genptr.c      | 58 ------------------------------------
>   target/hexagon/translate.c   |  7 -----
>   target/hexagon/README        |  5 ----
>   6 files changed, 121 deletions(-)

Bah.  s/cris/hexagon/ in $SUBJECT.


r~
