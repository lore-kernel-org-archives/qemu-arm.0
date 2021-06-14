Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2278187lff;
        Mon, 14 Jun 2021 13:04:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaUaYXVrtp92sopkEvstOD4tO9639fG+3BNUuNv5geV1O9NPJqThYP68V2Iobfs4Rp2hhG
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr20722196wrq.240.1623701047772;
        Mon, 14 Jun 2021 13:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623701047; cv=none;
        d=google.com; s=arc-20160816;
        b=xqiOkT/qcXN9kyEHu44GOh/CXKWdWWNv3IF3Y+p3b57l+8KyJ3tYDOIzrgF685QnBf
         pFrlRZUCWl507s2ATDRUf5rqbF/IayV4DOwb2HpXxMSvpx52lGl69lhkFZMg9+QIAGu3
         9BSfTSTjhDKx7SnztD0fjLERTg2nh88z2kiw0HEiYEKt43L7kwrd+GuaHITETsBx/5wz
         7HRMu1216Jwk505SrEP4JAv1XPI5Y8b71KoisnncJdZvd+cQGD1ihAWDYsCgquaF6PtU
         24nDc/HC1iHn9Btg8jOJItXGwAyIySQEi5Q5RQzmDmIw1PLUMC4Eq68VpTwLtlV3/cjp
         oF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4FbwJ92eOuOt2Ykki2atX+/r78wFL07JKaARVSVcQVE=;
        b=YJ0noQw6h5+GjGsgCAqnDOMZgVDMZZOeyUo2+XLDT6QTS+q0cs3AWgbJrQw0FCm5mk
         I35T7VuVGzmA64Qr/hmeW6EfoXy0m6J3cdgbNNORXJqwem0nB2CscydUtClhcEy4kwyT
         KdfceStc21Y3iXtZ2/n0oega8pLf0kS4s6WtPXddbM7mVoEdL/NUq7KDwCEuj/h3cqpO
         J5T71hff4VaIu9qTBL6ZBUJs0uMgFuzBuvSSC24NKwEMaFwgIWf+USxRl3YCI3QaKUNo
         +rZ0oBfeVA0h20+pUgPQAQQPwBYPpsQ8EZUnfMuQrUmzH6fQSlS9uM5tuhMIxbhJLMvN
         x8tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OFN9SjoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si594823wmc.168.2021.06.14.13.04.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 13:04:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OFN9SjoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lssoY-0004AK-Tg
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 16:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssoQ-00049o-2v
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:03:58 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssoO-00089F-Cq
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:03:57 -0400
Received: by mail-pf1-x430.google.com with SMTP id c12so11419617pfl.3
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 13:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4FbwJ92eOuOt2Ykki2atX+/r78wFL07JKaARVSVcQVE=;
 b=OFN9SjoZURE+Ef3jAX6f4TE6rkgW1vhfGhz+g9JKN9AbDp0kMIEOxrJ/+5rJS++seS
 JXWiZLmxT+8XGgPCsJcbK1kuRmU8YwzXQIRiTS1oYOd++vXmM8dfnOqpP0EVSaNqrLH0
 xy6jMIRx3HzEbJYecYbLsW39T3U+8xGlZNtn6zWLNtxnrwpfkniykvT6BVzBwh8H+Try
 Gwq4ynZY+0DSjmgn6DwphapO9pq6/uhAb6RH7xDeaxl71iHSYnhOB7EXiKL9S8rqYUdO
 w1d3wYp5ozSKLYB4pV+nsMCVTE4UB8TjpfF33xo7gOt8qR2JHAfAcZeXj/8IT33dp2Ff
 NiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4FbwJ92eOuOt2Ykki2atX+/r78wFL07JKaARVSVcQVE=;
 b=Dt+JamosbN6xJcpKhfYZ54eUzO6uEKI5ZQZveBYr3LNyF4LSrtAYHfj7qukA1ioLOT
 2yN4GrQygkywjplmwXPWMUrMAJqbwQg6RuR9kGG0npE0QGN6WwHk6+LBbnTtDUBp18ES
 RXDbO/iUQPR+Z8RH2oR6ARUDHDO9JAc0JdolQ9onHEJFAcIRkR0RqAOBBHViNsBnvm1n
 1es2s79AYE20iB84m0MLEmgOk1/sJy28HPIXpciEaPSEAPbgrktvAkpxy0vf3QnjMZW+
 cO0tL2p/UOTrd39nzukL5Z3Q2zjN2AY6VIwdN31WFIHVFS+7Gu6es8dVSHECObfmSs+1
 vh7w==
X-Gm-Message-State: AOAM530dtYqev7n31x1k/4IkImC5YEuiq4HUPvANFtCjFtWt1aTkIyWs
 psX2upVq5Vv497Ob4SnKNrANsQ==
X-Received: by 2002:a63:514b:: with SMTP id r11mr18712704pgl.437.1623701035091; 
 Mon, 14 Jun 2021 13:03:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ig1sm12910630pjb.27.2021.06.14.13.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 13:03:54 -0700 (PDT)
Subject: Re: [PATCH v2 17/57] target/arm: Implement MVE VREV16, VREV32, VREV64
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e2c3225-4c7d-59d9-9fe1-bf2de72ac8b7@linaro.org>
Date: Mon, 14 Jun 2021 13:03:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: vMM2uLCL6S/r

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the MVE instructions VREV16, VREV32 and VREV64.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  7 +++++++
>   target/arm/mve.decode      |  4 ++++
>   target/arm/mve_helper.c    |  7 +++++++
>   target/arm/translate-mve.c | 33 +++++++++++++++++++++++++++++++++
>   4 files changed, 51 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
