Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5273351ejc;
        Mon, 6 Mar 2023 16:21:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/SuXzsG0pualVp7dX+h0JvP64R5z/OK887V1oSwRfSmZmIClLXlOkDCKSAgso2RpTD4VSw
X-Received: by 2002:ad4:5de8:0:b0:56a:b623:9b09 with SMTP id jn8-20020ad45de8000000b0056ab6239b09mr19661675qvb.14.1678148513727;
        Mon, 06 Mar 2023 16:21:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678148513; cv=none;
        d=google.com; s=arc-20160816;
        b=goPYVuysnTO/d0zBSN+0qdn04oWvtRyW3jJ5wC+f8HnPmQovHXskyJHGIgimoaeIdM
         9iLUcijdQ28Dk+/wQX5upMVf+Sn67ljcqdLhxWlB6ZMXt3HM+9H7oNPhIErUMJr7e59A
         RnSVCo0CYs+JEMd+ABbzBtAThcjkqkwpSKSeGacXLpkXFF++tOv7mXhaGi9LKvzTRdz7
         EBuSXZbo+K4xzbFVZrDLTHo8/bNsqwBxiiZ/kRh2JlVJRjhn+0Pb6haR9e3AQ68bYzs1
         205PpnYFein1wMX8vAIMMVlb0ruanVkBG6el7TgoBcWMkzy2+Z5/Z0xgNj9S3jQ4InbQ
         EzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BEsMiPzWS0WXmpBRCRq7WQU3yu/bDa8rVhXrxITh8Lg=;
        b=1FRgFP6QCzPBMnWUsI8m3mNuZilGguj2BR14bTfoTgWXnNyJanEiRq4EbcdO7T1FKW
         JXdzmJM/+TJjRytUkblijP0FZ4zh00YMzoElTsB9dOV5bVr80aBgB7bYWYgiDoPob89r
         C+30cLB6Stv4HqKqnHKGA0/UmlUVAFOXvoLYgNypfLTkVRuAU/B2Y/zivW2kQFDkVzM+
         XrABb72WEebJW6kfvv+KuXycJxyFMMCDAHZf9VtwTPLuuY92aPM+L/28TQVCVez0Yjcu
         mRxlo/19n4JhWFkmBy0CvgxzA69EG9sGZLPuiUbf2jp58uEybaVLaDE9gttGMK00Jlq0
         3MgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxmdmZe9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20-20020a0ca9d4000000b0056edead6187si8352585qvb.127.2023.03.06.16.21.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 16:21:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxmdmZe9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZL5S-0000tx-M3; Mon, 06 Mar 2023 19:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL5R-0000tS-Ju
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:21:49 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL5Q-0005r8-0Y
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:21:49 -0500
Received: by mail-wr1-x436.google.com with SMTP id l25so10589607wrb.3
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 16:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678148506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BEsMiPzWS0WXmpBRCRq7WQU3yu/bDa8rVhXrxITh8Lg=;
 b=RxmdmZe9b2YFkamnd7IE7YYYCXBeiBxR3JWHPfDd1fjzvc5i8KLisc4z55BZd2KPg/
 5Qp4e2TWzLQh4RUUDAyGk+ClT/hgctOiXuKi4SQ1FA07G2s7W7LyfZKGoe8GC373FuYZ
 30le2V+4coDKsbvMCepGOA0nheFuNR0T+B2ZrFXI47wNhsHi0IT57Y/vlcYbayaKJ4in
 tFixkB+CxUeATcshUW8taVYFErFLpNy701enW/FA4WByLQuNln9MkxEgfQa1icwJUbEl
 fPDofAw+pkUEJoeQOW/q4yPsl9ryWCeBSATJmtkwiPZqIj/wWhH8E/pz1yMe/KVYoEmA
 WJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678148506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BEsMiPzWS0WXmpBRCRq7WQU3yu/bDa8rVhXrxITh8Lg=;
 b=PG2F3QzyapZOU8+lutJM4MtnUGGpy2kJs3XNXscX4BQsGZlqgEh0Ouqr8IlgQWV/gG
 Sa688FY7LPXvnGR1LJXbvFgfMKZGOlx8Xacn2SLDVZl1zJhdsoY5jD0peXAM1xbnfPhk
 S0nn2VH+PG6Q6KU/ISLJwUxPowhD8GL9JcfPFfKJOREFIQX7tXBPMXDiUhVTPJNWRNLg
 wnxG+NCm3hMoKSJnwqDVe2gpssNjQRk+Tf+FS1mVPDfnvHapBakdjucBSniCIaMOJJkE
 lvuaFJXkDOXVkxUTDhhQMNSWyzQHBXvHFRpz847GGkdMjF9TWrKBetFNfmSw15F/KPIt
 5muQ==
X-Gm-Message-State: AO0yUKWf62EELz3J5h0rb+GPbxsW6L4Vqb+I0Fh+huf59B5Tf5GdHToH
 sCbfh8n7u+P2Bf//rW/xrfd8WA==
X-Received: by 2002:a5d:678b:0:b0:2c5:5870:b589 with SMTP id
 v11-20020a5d678b000000b002c55870b589mr8382791wru.14.1678148506628; 
 Mon, 06 Mar 2023 16:21:46 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 o14-20020a5d408e000000b002bfd524255esm11101086wrp.43.2023.03.06.16.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:21:46 -0800 (PST)
Message-ID: <ba7b1ab9-0dca-1fab-e636-131ea3cee5bf@linaro.org>
Date: Tue, 7 Mar 2023 01:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 51/70] target/s390x: Avoid tcg_const_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-52-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-52-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: yBZcV2rv8J2R

On 27/2/23 06:42, Richard Henderson wrote:
> All uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Super-easy one!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

