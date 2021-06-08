Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4841603lfa;
        Tue, 8 Jun 2021 15:12:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQl9ZodioAAXrh2sO/Dfk5aX0VAURaqwpmdaTM1gquwppCMRvO2FWWoo5W20Uy+reuGN42
X-Received: by 2002:a67:ea07:: with SMTP id g7mr2521738vso.23.1623190363250;
        Tue, 08 Jun 2021 15:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623190363; cv=none;
        d=google.com; s=arc-20160816;
        b=j3KGDGSuIxHU/vZ/DuQ/aRxMH/cAtlbOk39EN+scDsy3z2VKWGFeIQbEKi7VomAtWE
         StwTTy8fDj7SoqFrmI0vUPXbStJ121y/ncPrx0N/TAhGb9AOBNAHe+rZThx2dx0sfbR8
         nWKfH1saGXqKDazaXbBPfi2xPl7s1YUmclTKs6bByqQKvF0I/IN31TkAhq3ZEA/g3swE
         wlLKNfpER0WKWjpoDM693vfxH8bHERf0JOXifpGdNZFP/MRSEUOTk5Mwf9sEhRzyx6Jt
         VnlCUTFqfl9t47zOGTdmwxQEPd0qpwAAeqD4+B/OiXNCOBbVYUTdU+eB8iXq7PHd9t0P
         RPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mXy3zQg48sc7EXxim3zi9xFmLMXrVuj9E4yRl4g9mhk=;
        b=IobbyhUW7q9tYKdNwKNOMqZBFc58dXA587r60R7f+HUBu16uHQjTcTiWn1uGmy9NMU
         vux8lGXzsGBTeFohbcR044UyCzbkNWGgbvPX9O0q20hcfbAeNa1Mcn9Fo6MHdBg1GgSx
         DmuEmPB8e1uM2Blni4atg1kyAnEarrrFy5/lnAQ2av3fJk7ETBsdvo58f1/e0FE8GNKW
         YQ5kKuYOZi+vzhYyDMKdqT54keNGdlK78xMPfWX7cgesOgzc5a4AqoCVJxCJ36GwhPAA
         415LkM9GzTo+gc4ch9MuiEPHUkZ6HN3uffmw9M7HeiWGp1lOMDv4YSQahr7+I0p9YEHs
         iUFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PEu34TXc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si7018071vke.46.2021.06.08.15.12.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 15:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PEu34TXc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqjxi-0002z7-6h
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 18:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjxQ-0002xi-Vj
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:12:25 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjxO-0003FA-Sk
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:12:24 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 d5-20020a17090ab305b02901675357c371so205812pjr.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 15:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mXy3zQg48sc7EXxim3zi9xFmLMXrVuj9E4yRl4g9mhk=;
 b=PEu34TXcFC9eiMteNUpNhNbp4xVAtUtmPsE3s9DhhPAr/Q9JxGSHTs7hwvMMxSBrfd
 M5C7tgiio5oBpqudXJFQBky/GETRmSS9wW7zPmuIOSMHT0xxrkjdDB8Y3e3uqT3ighuq
 JN2g4sSVRkUy39foTJrx2jR/F6Rv4VW1NjKIZkCrp/wwH3Vjp3GiznfbILO3iPSvVURt
 xJJHOBp9xhhtC/wfXA6SEdCjuO0VurS4NsKfwlIkqfIthlLcxUyh9HDH8dsPdSDweCtY
 GIkXdTtQBpZYxEiCXWiJlUGQizAOnXOi3Fwf3otMGqVi0TgQGrDyIEjR9Y24JQKNx1rA
 kdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mXy3zQg48sc7EXxim3zi9xFmLMXrVuj9E4yRl4g9mhk=;
 b=B11LtqTyDEe6qT/nCSm87RzLnusfg0K2hw2hsZExCM91mP4PQcEefAjbARL2mHZ5mG
 2/ZZPYTegFrtkABaFqhOgaLKKU5Xh92Fj0jOY+XnbihtuL4txoQ1HHCYtLRB3XVPijCv
 oCLTJexcvvAESRl53A5ZIDNMMGEIZirgdD3/khS3Yzik0X32rqzwaPYzqLUSxztZ/MFa
 6LEI5AXegc6M+DX9vgbMNzZF6pe159u5L/tCD/dCIyUKaWKp4m1iPAN/FGs7PfPLd1MH
 h7qa8P/ozPJoVjCoWOAHEfrFNLdP1pgVPb70uMRaPUz10BJqk9J+jYjsrr7On/HXucyv
 xZIw==
X-Gm-Message-State: AOAM531acO5y+dQAlWDDnB1CMyMRbTfgjaW7NMviI3jd8b85xH1LIah6
 7h+KL6+zlvDKEQDn+PCOytNqjQ==
X-Received: by 2002:a17:90a:1150:: with SMTP id
 d16mr28465718pje.180.1623190341417; 
 Tue, 08 Jun 2021 15:12:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j5sm10024446pgl.70.2021.06.08.15.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:12:21 -0700 (PDT)
Subject: Re: [PATCH 14/55] target/arm: Implement MVE VCLS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5df50c98-2296-6dee-fb24-8809f943d928@linaro.org>
Date: Tue, 8 Jun 2021 15:12:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: H2x2EzCc8zmG

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VCLS insn.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 4 ++++
>   target/arm/mve.decode      | 1 +
>   target/arm/mve_helper.c    | 7 +++++++
>   target/arm/translate-mve.c | 1 +
>   4 files changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
