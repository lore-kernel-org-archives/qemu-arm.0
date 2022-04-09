Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp185616lfq;
        Fri, 8 Apr 2022 17:47:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6kk6/EtZvlsmdoQTDaCBuBEz7hLcHz6BCNwd8kgovck5BXQmoFQN2PXvvxlnVS5qgPI6y
X-Received: by 2002:a05:6214:1254:b0:444:33c6:6e6c with SMTP id q20-20020a056214125400b0044433c66e6cmr142345qvv.95.1649465258461;
        Fri, 08 Apr 2022 17:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649465258; cv=none;
        d=google.com; s=arc-20160816;
        b=BwFfuCELQW3Hz3dbbp+ecqOAbMYdnRa94QUCtcGe8XRCvsB4vIGKI4aosOCTEAtobz
         SGOiXgjl/5pR6dY2T469u/2paGKGD9mFwa+RZCQf6/r3rbAKSqBVW4gmULuW7H/qpC69
         9eNzXZ2Qmfc5WltJuX9qBqzERj6URcWFa9RbR2wKX8RNJF6KnpdacWOriI8kFtKESeF1
         Bja32blAoKFke5EW9dnHdrFdY/dCYrjdWKMEBtQF1jvd1xqfO//zxOGeNFhoZkuktoOv
         zj7xLgK3vKz+/qAlH/4Z01GXjf7Eac++7N6BnMal2w3S5USi6PtFRy6OU4Gh6pbO2Pw5
         jGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=a6z3gboc5asLYoB0lZPq4dxjjGk9sKhawWqFxRzxiFk=;
        b=WltWdDoqkD0i3l7pwYU83ReF2NP5XZ2NHTNYf/Q+E60bX1H/0DAgmBSXZp33CaiuCi
         v+OT8VomaMwNXMoGPryKzwFvfmBOy97CGCCtja8SLeFKmrB2cK3qB4sp2jex1bmE2JRY
         m5KSwUc76rHJjSaotjjfhacxHnadngR+tgkN7BoChLTgop+vaq3sWBzJgwEZTh0mATQb
         JFyImQ/N1qacKJZiLZ9NvM8SNGjYMAztCkMkITkBqbzidXWRZlNPid2JIybrN5FxDBTR
         wpKZZ13TPxva64sTFl5XDxfqcRU7MRZGX47PsSLLtEH5HAh254kaFVjvydNg+u9vsG4r
         gc6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U52Fz9EY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020ad45ba9000000b00440e46a7c98si1175961qvq.310.2022.04.08.17.47.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:47:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U52Fz9EY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nczGL-0001vP-W0
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nczG6-0001v0-Jz
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:47:22 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nczG4-0001H0-Tr
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:47:22 -0400
Received: by mail-pf1-x42c.google.com with SMTP id h19so9864124pfv.1
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a6z3gboc5asLYoB0lZPq4dxjjGk9sKhawWqFxRzxiFk=;
 b=U52Fz9EYU/zn3LPbz494iVkhwv6N8FAN65Cd8F2ZTjl/yEKstC0qb1rXz6XIj/oMkk
 AzPw7KbNJgSM73gcexBp2aozmuFSEAHP/HEM9nKzprgGHUcOhlyXOH2bqL2hmKSiEoSv
 bdrCVDpr13D3ZETTEQRnToxkIsHdxGhE3dv/GsGIB2NaJNrc73fEBb3Kfp/y/nCizraG
 PsEU4W7F0zGguGTUzIq3oNXiXt2ahQgT/8LSBpbryI5WFTkfIgzqHhu2jyC4G/1T5dgB
 YeThjKBZxo+VBRkOXKzB/K8/iXRHljr1afqRdjKR854M8DA60wa703nL7vTDyNrl1OxT
 joBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a6z3gboc5asLYoB0lZPq4dxjjGk9sKhawWqFxRzxiFk=;
 b=heO+wFrI5GcdRrwGYi3FdfIJJVkBNRQ9w2pj5CPwFoexLtXFty4bFRWvoCTWlIsvTN
 BB14wCipdTCxf5rbgvX6svivVAKwWXiXoVjJJ3Pbg8+NdNXV7u1ygPkzNz5bEqe1ypD6
 2qmLrdeWhkrjlNnyZsy893OYzthEf0YGDcmiprjOnFCsDaAg+Di/zzRhVs5FHMZ4TkQM
 ePPiJ2PX5/O2B6siRbsS1azTnQx2b+BU1UtnYJei5rgOeRu2tIpiyd0cjgHJUOZe7Lmj
 RCxMslfn1Ibgr4Rvzs4hIbCHiWz00wcOMNDercsHN4MnwwXfiJCPbWLxs50kA1C3CNzu
 55Rg==
X-Gm-Message-State: AOAM530tAjvmLay+fFhEyrpL5hR8+PN/iYYk6WsATJF2mzD9GNpscSXW
 KziNhLZ7I9t2lJGUD9sSXr0v1Q==
X-Received: by 2002:a65:63d9:0:b0:374:6b38:c6b3 with SMTP id
 n25-20020a6563d9000000b003746b38c6b3mr17855973pgv.195.1649465239368; 
 Fri, 08 Apr 2022 17:47:19 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a150200b001c9f1a7aafesm13055942pja.29.2022.04.08.17.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 17:47:18 -0700 (PDT)
Message-ID: <f1500122-80dc-e85a-d2e2-a3b397215bd7@linaro.org>
Date: Fri, 8 Apr 2022 17:47:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 12/41] hw/intc/arm_gicv3_its: Factor out CTE lookup
 sequence
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TxHsJiMT+Zo3

On 4/8/22 07:15, Peter Maydell wrote:
> Factor out the sequence of looking up a CTE from an ICID including
> the validity and error checks.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I think process_movi() in particular is now a lot cleaner
> to read with all the error-checking factored out.
> ---
>   hw/intc/arm_gicv3_its.c | 109 ++++++++++++++--------------------------
>   1 file changed, 39 insertions(+), 70 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
