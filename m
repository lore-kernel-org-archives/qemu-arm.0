Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp687173lfm;
        Thu, 27 May 2021 13:18:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzqFFBe5siTVqP/8sit4ya/xMOGPJWpyv3yBgFcSuNLgpB1ia+HwAdXjAlY3HTtoIaZuF7
X-Received: by 2002:a02:a312:: with SMTP id q18mr5116142jai.24.1622146707541;
        Thu, 27 May 2021 13:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622146707; cv=none;
        d=google.com; s=arc-20160816;
        b=KA+r6QsEDTW9SeEqS81LFoKktBOEEAAqZJw1DxmCKU9xhYlcUj0L04PQUO4+fMrE+O
         MEVzS41/+0l4h9KrFrkXd28xEqXEXQhkMOEFGSwkJhJZuFndkgeooalafplmgW3qnsg+
         1Bz05k/Yhhqizfs4WkcFnmXpzmaWpgu6cZxCTzOUE6uZwHKdcZOJ3J6R9oWTwfbisXPs
         zcOJGOeAmyLgtaqlWZU5MxkpIYgy99Gl0iCU9MpNGggWK5C9Etpz2CUhRihQ5WY0wGyj
         2WHZ21LS3ksE4BG5FUckxKLjDfyfWTZ9uqtjwXJSKjzipGhdS6jeKbEjlrgK+pRQzG4P
         HjZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MhuMNG8mvLywvLE3IdvlHxgSTicfdRTnmILuv8ThzF8=;
        b=Y/MS1syHYutDI/FSDdci5c4ibdA5DSa84W0qHs0MrVdP2/92Ff384Q7LFFuKOZ7vqT
         jrTL8/Gk8HmPZOltixuXF4y3h5fBoMdh038sOmGwichlx0y8FUt8o/V0uWYVOs0Hz4dq
         RLkiRZokv8zQSeKdR6JSGJkHXw/eC8GnnQAhdl4W3uQKELBFWbVcK0Ap+RVa9nkG88Oy
         n2Yq0geBSTZf6ryBm9u+btv7i99LRJj7PeBRWgjom3CYLO9MgSfkl62WWhLJlmSJWGNs
         DubWpsUWhZLGCzvK7NkQf64Q5dXC8RDlVAXCHVHjoosXoJEr9uimek3cg88zE0CO4Nv0
         cUuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XxAerePp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si3864961jav.104.2021.05.27.13.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 13:18:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XxAerePp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmMSY-0002mK-UC
	for alex.bennee@linaro.org; Thu, 27 May 2021 16:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmMSQ-0002l6-Oy
 for qemu-arm@nongnu.org; Thu, 27 May 2021 16:18:18 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmMSM-0002je-5w
 for qemu-arm@nongnu.org; Thu, 27 May 2021 16:18:18 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b7so551306plg.0
 for <qemu-arm@nongnu.org>; Thu, 27 May 2021 13:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MhuMNG8mvLywvLE3IdvlHxgSTicfdRTnmILuv8ThzF8=;
 b=XxAerePpVah38GQO01Cqug5tB065Dk1gPbzin/aFglh4+deLurCuL+mdZeYe7Yd3vq
 tgXhxuA9ds/RF/1YRhuGjjVunD8gvuwlLyW/rvTIfdPwWvHNSz1zNSbohcYAw5RKd5eT
 aZj2KUHEAKx7n8BQTGuY2hOQrmtGOdvjmfixnlqSGoINnqoVqmC8nvWJng+LlCl/Cex4
 q4gCKMuof4cJfiC7I8gXeDRv3HfUopQ9YBblBLTUlGBJQstACZEf6ZLjMMt5YstxBsc5
 DjwuQFNjOe4naPpHB3nuIp9JMM2CEn3+8cHElnSMKU8ZDVRJcHJ/sQgTdjZicdQCPPRm
 seng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MhuMNG8mvLywvLE3IdvlHxgSTicfdRTnmILuv8ThzF8=;
 b=AwdhcCKTJhZCIhTF/zlAj1C2c/5Q8hTuNLCQMdIi2/3iMTnBJOR27RQCSw0iPmniEx
 afQmLjse6KTzsVb9/zLJOz6k10Ikba9UWBxHKWLzwfOrShvlqmwIkGqQqYRno336yqtL
 fZoqPo9LRKPkima4woWSrWqk13x5zP8jDCjm2W3Uw27GepLrp+9uDcsQcNb9tuuddiMp
 7YtCHpVYAudAkVygwU1G2F3smQi8qQbWuCBS2mTmBioegbmzozDU89/q2jbsWLxTW4t1
 14bkqCJAYcu0jYcxDkJy+loqe9EYH/vENWQyGtMxsHStNwqr+7WJPiUtR5Z8WFOYq668
 32wg==
X-Gm-Message-State: AOAM531yfhlbIg2SImc35D+cpnqOMgdjvpDl00C4jwW2fjZ2RUuHYonA
 M3uUXHVD0xOGiZL/4NNPrFGkow==
X-Received: by 2002:a17:90a:950c:: with SMTP id
 t12mr272173pjo.135.1622146692711; 
 Thu, 27 May 2021 13:18:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 204sm2606611pfy.56.2021.05.27.13.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 13:18:12 -0700 (PDT)
Subject: Re: [PATCH] arm: Consistently use "Cortex-Axx", not "Cortex Axx"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210527095152.10968-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5736a85e-05d6-5e67-646f-78b71651fe3a@linaro.org>
Date: Thu, 27 May 2021 13:18:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527095152.10968-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Azv++p+Eai9k

On 5/27/21 2:51 AM, Peter Maydell wrote:
> The official punctuation for Arm CPU names uses a hyphen, like
> "Cortex-A9". We mostly follow this, but in a few places usage
> without the hyphen has crept in. Fix those so we consistently
> use the same way of writing the CPU name.
> 
> This commit was created with:
>    git grep -z -l 'Cortex ' | xargs -0 sed -i 's/Cortex /Cortex-/'
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
