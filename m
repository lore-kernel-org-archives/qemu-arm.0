Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp650726lfq;
        Sat, 9 Apr 2022 13:40:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWsjaikvGMlozgjqO9Si6rMdPsbUGcobZ3I7Kvbu19hNh+Ay5wneXpR2rGvNormF9WOM60
X-Received: by 2002:ac8:5756:0:b0:2e1:e06a:72b6 with SMTP id 22-20020ac85756000000b002e1e06a72b6mr20817073qtx.234.1649536830152;
        Sat, 09 Apr 2022 13:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649536830; cv=none;
        d=google.com; s=arc-20160816;
        b=07VXFtFmNu4lIZlZ/k9DbjDf/D9Mfl390r6I8VtVUXdYVArNKElkK29qqkNUYzV4Uw
         SR1mrThvu3gCjDpWlKz77cI8wmcdEO32kOwIcGO/nefAq63IUNvplUBOvljUkZJ6YiBS
         vmqBvo6/8afFL+PfYGSRAKwuXvgbyezEW4FMVf/FQSXs3rJnJMAPYV8vCZT/+OjlTs4q
         iobhxvk6uH1CdQ0Gopg0yzeH8aoyW4QwW/dFeQWBmjjG0fFxwSFHOimFy+4aki5V7QNs
         vH1gIQ9g3uz4x448eI+2p/r4XlS+tk/bClqtzL9JtXbgwiVcn0CkRx23QCG+0e6c7WZl
         Yxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=A/jw9NQe8qwKLqVBXPT/ndO+16/ObXPyZz4yOTt7Lsg=;
        b=reyJ1v9ZL2/eWH7bNDxX/eWqlPUfW67Ww5//EmCTFs2YcC74N4ccG5BmcG2gFKGjo/
         f7GdToivmG8RXn+OfSovrOqXbY8XlrHPqxUJy6KarBawM/cxheHv1sihhteB1auHQw2+
         WBNFVNQ0LMBpO5N2tTZNVUwBggvjw07/GQMvA1SQ6vprv4usw8lgONWYEVQ0cwURNbLZ
         7kWohF303XoxPxnzrdeI/w61/j6KJCVniK70D3FgUOG8sHDyCZmQkSXJySUjrPtqtUXN
         zE+yAna+q2qYTmqPKuHNGIxu58IFR7T2eQQ9rbZP1ZaN0NuepBqRCwFgGH+Ur4c2u559
         uEaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baeWlD3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020a05620a40d100b00699aa23df95si2824878qko.489.2022.04.09.13.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 13:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baeWlD3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndHsj-0007f2-Ko
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 16:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHsO-0007bZ-H4
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:40:08 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHsM-0003vy-Os
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:40:08 -0400
Received: by mail-pj1-x102b.google.com with SMTP id md4so3379851pjb.4
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 13:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=A/jw9NQe8qwKLqVBXPT/ndO+16/ObXPyZz4yOTt7Lsg=;
 b=baeWlD3SAA4Mt6ZyG4jphMLS1pvKVrFSYaSkPwArmWM2FM1Q3YqN7gkWAv5CE77wUe
 uFJn5kWTnZW6pnun71pxVJJah4vX+HTSNJpn9XB4KD0U8GALhIwlEyfxKKnFDQzLJiix
 d2pSpV4/mcVphS1MLR0idMSEDr8rFlFMJPRieqxgaIqfkcIb3Ng7TabA+EHN9rZiT7dp
 2i3FqCbHCuKT4Py20xCtU7bPuWsuUcW3+xIfz3CCsvlX4tou3/Cl1hnbxIuJCU2MpA+U
 ykmgbcEcEWHaMd3M41hWLO1o6lVvGhkbRmacTg/20RRdyoWs05wdLsdxK4OY5NUEV5pr
 gKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A/jw9NQe8qwKLqVBXPT/ndO+16/ObXPyZz4yOTt7Lsg=;
 b=k/G8CvzautJOX5pu+O7UF6BtFMYfLM8Ym7GgiqQwcAuYgbYQdJeZp43Iwo4CnmfcbK
 ov1XuP19ZOZRw83f9Q+EEju/abGTnrIgz4Mi/9o/VbYXLRnb5qdQb84cHQ0DK7O/uARX
 PVHJQECZEKgFmbH4r+F6+XIRh5TTjsOvPPZxvKkiksEwpqFfpCkXeMOAn6hC4t3ExCya
 Wn98pqLHZnarWFmSUaFbsHSQ0qWduXSt9+zY9cNYvNDIHmRd/j/Gc4eL1yuAbZVWT1Gf
 4LDKFdiDm5F9joeg6sOlU4MUGnjqL0KPO0VfnJvn2yfgrNVyNj0EGA9vocu9embZKKRL
 rrwg==
X-Gm-Message-State: AOAM531bULW6DgIiAkt1HWHqS3Je9Rj49MDb8J8GkcPQDrTzO/OZN5rV
 RBAlunllC2HgxAgyMmxbsIHRpQ==
X-Received: by 2002:a17:90b:4f4d:b0:1c7:5324:c6a0 with SMTP id
 pj13-20020a17090b4f4d00b001c75324c6a0mr28823644pjb.160.1649536805483; 
 Sat, 09 Apr 2022 13:40:05 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 b4-20020aa78104000000b00505accf8070sm688079pfi.112.2022.04.09.13.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:40:05 -0700 (PDT)
Message-ID: <cf2ca913-1f8a-adc4-c7f0-ae2aaf94811a@linaro.org>
Date: Sat, 9 Apr 2022 13:40:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 35/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_vinvall()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KoEjIqmmzB41

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the gicv3_redist_vinvall() function (previously left as a
> stub).  This function handles the work of a VINVALL command: it must
> invalidate any cached information associated with a specific vCPU.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
