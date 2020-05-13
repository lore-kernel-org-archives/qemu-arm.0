Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp554932lfb;
        Wed, 13 May 2020 09:52:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtJle820NxSCpQYkKYjdkuoUA784RrtTbX2GdYzQ18pR/OdHf8fOOzFoCqleKMsay3WIVs
X-Received: by 2002:ac8:bc8:: with SMTP id p8mr7354qti.135.1589388752058;
        Wed, 13 May 2020 09:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589388752; cv=none;
        d=google.com; s=arc-20160816;
        b=Ax09eKtWc4EaEdn3mlh5bormxhBtEh7RxsvjtGci0bzGKMWqMHxfy2pqqYftm+zBKK
         fRNNVUSo1Kzvd/fEcot1A93A5mo6A+LqDJ7/4a+b/e+fN5+6cOLkl0hy8N73dssQ7hPw
         he8S37MVuFPZT7XfJ7YyGPAiSrsxkj1MlwSNSQymjYW60uvNZzQUB3sYs96M9o/9pJAs
         vjPZMJzhHkg606+x6gTNEayXHrq5uDiT+pEE1JyWexwebJCD4clm1PcSGkb9O4m/TGow
         Kl5Yeu2n1YeYx03ofe6J0KhXR7E0jidTIb8PGEx0ExtFlSYQ4iz13Gu8CS7u7bD50Z6X
         dw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4R17WLsAupXwoxhqSQuPWUiWLVbwDfRFsUEigytzd8k=;
        b=nrJZrd7VvhfL1vDSHZ4S496PcOmLt9q8Xbt50P3WGfHQx0s9k/E9DRODQV9Qd/01VN
         0XZd45Jd/T3YaVs4oFCagkDg91Xq/3LMkoE+49dBQhovSbOe8tkpzNnVqrWKZphQC0RQ
         qPnuWRb1PCH98Ru+/ixf94hjIdh2Zs5ouGtGiiZTaRa47ueMlIBn5RbkAa0YKQzoYflk
         NoVSxgftYvMLeqz4sqcETS2NXnfLUIlNfn+vFN8kWhPQzHruDDiSBGSkK4Nwiix+aZjL
         +GW4n/aQXOqaUf1Um0yv5CA5cY1W1tgjU6TreSOrcSKFP7ZqafMnS9PjtgVzPcqjXQqD
         hu+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiQcDfjV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i187si6375qke.284.2020.05.13.09.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 09:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiQcDfjV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYucR-0006Uw-A4
	for alex.bennee@linaro.org; Wed, 13 May 2020 12:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYuYs-0000Qd-4Z
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:48:50 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:34886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYuYq-0006ks-G5
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:48:49 -0400
Received: by mail-pj1-x1044.google.com with SMTP id ms17so11244416pjb.0
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 09:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4R17WLsAupXwoxhqSQuPWUiWLVbwDfRFsUEigytzd8k=;
 b=GiQcDfjVuOel5cDZxXLWTcz6CP67VXPmjZ9AuNOeWuQXOI+7HH0f5psvedn0gPbADQ
 wiGeKK70TuPSzLe1SIFkTfUW7R3Kjc5xc03Ky/8Z3soM9g7tQBGDRk5TnxQ87Y4yf5KA
 rgHfG91sPz4lY91CAVn803TKS0ORBJTvgen4DauYilXN2pl2jwkTVj2huXE4xhdFM1bw
 cYHpHVlCQZACe6l4AkOzEbX7Tbscg8kJMMsJmRiLzSEzW83QhQbDsCpjpsj5/IA4EK8X
 k3ex/qv3fU8bshFciN2LTO6RNS480hLWqFPIHIlbUSBlEtjyjVwTFvF7tkLv3xByLXzL
 v7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4R17WLsAupXwoxhqSQuPWUiWLVbwDfRFsUEigytzd8k=;
 b=Iti1eh2o9LBKffm+lPo0LLpzMMyEaAzmrQk2uMotV0jebYQLCp34ERjsJGurhyrTQ1
 FJlkpZWsJRPp60TRwcaiIsFzuDQYOsJOsftXtfLqzGSeQX74KlKqVcCLLD3p8YgjptPm
 diOY5NDzt0I3YMWC0pGOwqt0S5gXxqJz1QTvLViPsg90Gp8ZqPficy443hNqbQVF7BIW
 KTEkkYEihmgoGW+7rXCTnypf2HfZa8o80K+tdkr1v1MyfR994XKOFk9mw09I+gzfQP85
 BIGgpk4gybn3hb6rXpoYP+6wi0Jv1aqhGKt6aUzmadXSiE7bi3iSzTRJ5mfMfRoWX9nY
 r8Wg==
X-Gm-Message-State: AGi0PuayJ2HuabSIW1O79ZATPkOwr5qAVORwo8xtfwzNDVttHSvcjXce
 tfivxK6qP0crJ7DalFQvBbQhYxwKEuY=
X-Received: by 2002:a17:90a:d307:: with SMTP id
 p7mr35828872pju.207.1589388526238; 
 Wed, 13 May 2020 09:48:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x13sm69233pfq.154.2020.05.13.09.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 09:48:45 -0700 (PDT)
Subject: Re: [PATCH v2 05/17] target/arm: Convert Neon VABA/VABD 3-reg-same to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200512163904.10918-1-peter.maydell@linaro.org>
 <20200512163904.10918-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <924ca8be-6e93-f3d8-1ed8-67f1e74bdedb@linaro.org>
Date: Wed, 13 May 2020 09:48:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512163904.10918-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1XbAzlD4ufdl

On 5/12/20 9:38 AM, Peter Maydell wrote:
> Convert the Neon VABA and VABD insns in the 3-reg-same group to
> decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  6 ++++++
>  target/arm/translate-neon.inc.c |  4 ++++
>  target/arm/translate.c          | 22 ++--------------------
>  3 files changed, 12 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
