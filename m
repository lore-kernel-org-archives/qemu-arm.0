Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4891902lfa;
        Tue, 8 Jun 2021 16:39:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy54OPmXrf6NUUg/Z3TMKXHeaoltSOdAPfwg6iH0oOMua0v0aO/Fbi2/zgm9CaA8dk70Hcc
X-Received: by 2002:a9d:7f14:: with SMTP id j20mr10205474otq.156.1623195573742;
        Tue, 08 Jun 2021 16:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623195573; cv=none;
        d=google.com; s=arc-20160816;
        b=cPX+TYmtzuVIRzwUT3pYY4SrLsc1EyAx4Hw9HdmrsjaechnPZBgvPwtenJFrvBLuyT
         V8c7uRjqouKLGnfY8eTCyt5193QZ19v6YgzXVEf72CZDjkyvsyUauAscosYzf1z3MYjF
         9ictJ1H1wTmRsoUpvV7ZtBXVtL7J6G4cyec3fCcPP5Y02IIaxYZ7xGkQZCN3M2XUwR1H
         BEP2LwIV3hQBuykomw78iUpEztZbVwxklGdoNVi6L+DgHcOi8+eeZw8YyiMPx3uDeFBX
         Ax9p6S+qmY2EQMEVva0bUv+Nj9gUDhbnvJYP1byTNA9Yk6ei/vLh/fA58hmPgTYYJmIr
         FR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wc/TXXKv8O4I34WBHZwTU4ZQp4GgnH8XcB+M/gqFy9s=;
        b=idIIusZDuPpppu/wCbVhp+Otk5ACLWEIOPAuLXEepl3EstzEAlwucTq99q7RjOFXqj
         epsdop1GxWAGbu5kO/fHNz3wJayhG3ykUGCRVAXZ6/Jcd2270X9cCrqcHUuOyi7F+CnJ
         9+Qd98DGt9Qxk+qttpdtueGWaEOEs2IsRvb0wobNT7kdIihvdlbBmBcm7p8uMJ1Hg+aG
         9l3ifoqL1k3SjA4HbKila/FiLctPbgjI4TvZhqOuChwonO47L1u3hbVHGGfthLfPTRJk
         W+f8T7klZzYfHiSz/V8UMwL+VyAHroHV8uAWJeFAM0AkWQ0tfYf0/ukXsWmZlFveYxTe
         vpyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xHgcQF4p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u26si14254398otq.221.2021.06.08.16.39.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 16:39:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xHgcQF4p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqlJl-0006Tu-0f
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 19:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlJO-0006Sd-WD
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:39:11 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlJN-0004mn-N3
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:39:10 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 27so17871543pgy.3
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=wc/TXXKv8O4I34WBHZwTU4ZQp4GgnH8XcB+M/gqFy9s=;
 b=xHgcQF4px3DxZ4v1rI2SaYGDgqO5RHZ5+7ikgfeRB6o/OX/6rhKywV7yOWxn30alIs
 AdiNk5AOkTZ74+O9BBNErYpEswhBcl+G5Mcw7O7J34MtHX6k++vrSe97QSWi0pgyL6BO
 kk4Ou4h3nmtGvKbXaw3XXT3Ljz0Xq3oatKLRsQJ25Y0LYs9yjXuY1NF/2FaV2lBsBPe2
 pX80JFyVdT2gGdK7VUO3Vd+LqrDMTwtnZpxPDAxqZn9CI9IqQ+Jjf+FEDAD60pnwUcTO
 TCiskTwLUErFKWANACL8j8u1hB0AQxGW9KpppmeZY41cNCXfqz4XzaGUB+rOSfvsFBcH
 QIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wc/TXXKv8O4I34WBHZwTU4ZQp4GgnH8XcB+M/gqFy9s=;
 b=AwNhcWqnhZTK4UzI58EVa95E8M16UQwZ/Nli7sxAkbp6OVwPuOxm7YOGZuBz26I1bH
 cXTp4FWz250VB6skl58SobYpkHfc0XF7mrRd2mCvGkRf1qigcozboE3xN+Z9rM8fK3KS
 N7FqzhJL9TrzfWm1/FgDgUx+OHvIB3dBbU1+u0R0lOLAKc0+wvhphKwJ/JWinP1qbGEJ
 PwZrECj2Ea65pf1dZ5SP4rVXqCEEFAcCFaCLEgMDraOccqkHsU5DdYrimcFD6HA1CGrd
 wbEhHQw+7tzum6wi0S5tDmAnCdsP1hpMcaA5YA6xLnuE1nDBh0KPSzIndztmjor5JT37
 YPmg==
X-Gm-Message-State: AOAM5338nyVzN6jS7W/EDeEJdM9Bk94YE2GgUIKMf1XACdd6U0cupASm
 WHnHQwBVo2RYJKMCgkE04TRo2w==
X-Received: by 2002:a62:b502:0:b029:2ec:a539:e29b with SMTP id
 y2-20020a62b5020000b02902eca539e29bmr2414487pfe.37.1623195547883; 
 Tue, 08 Jun 2021 16:39:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a25sm11728268pff.54.2021.06.08.16.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:39:07 -0700 (PDT)
Subject: Re: [PATCH 26/55] target/arm: Implement MVE VABD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d17018d7-6803-9a6c-8d41-c2c50da68cdf@linaro.org>
Date: Tue, 8 Jun 2021 16:39:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: msex4QBkAJ7F

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VABD insn.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 7 +++++++
>   target/arm/mve.decode      | 3 +++
>   target/arm/mve_helper.c    | 5 +++++
>   target/arm/translate-mve.c | 2 ++
>   4 files changed, 17 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
