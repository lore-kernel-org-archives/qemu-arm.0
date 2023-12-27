Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1198095ejc;
        Wed, 27 Dec 2023 14:26:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIBT3u3bsG7EHEOmh7x6vMZDUDvYUMGgOg5GfVJWj6vVK1laE6GMmKMuD0upXqdSr768QA
X-Received: by 2002:a05:620a:1b89:b0:781:72ad:97e3 with SMTP id dv9-20020a05620a1b8900b0078172ad97e3mr247252qkb.2.1703715968270;
        Wed, 27 Dec 2023 14:26:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703715968; cv=none;
        d=google.com; s=arc-20160816;
        b=hmjWdUYEuMQMUflCrmENpqmkp058VZpqhxqT/0740kI8mH/Ap2hnloAnwp/So6FeqF
         3dMpnqZAczbNJz+PdaIBM/1cr1GOTZQv2AaIFJgP0QUYs5bVhnOwyekc2nyaVEJToZj7
         jJF4aqqt7sn4TB96BmYtCFkMilYRKic/UjuF0wa7Q8C/nLy0mSCooRMngFYlbBkI5biu
         so7xGAGJz5j/HXs/7IWEiemBAYu6hHIASma4Jfk8jphaQ8mYZbLvdOfXcWk3I/B/D7lX
         Y35N8I3hEKIl6y8PLKxr4mXDkUUmeciTrjYaT+NO/dejfvYb25je2gMEf06fzJJ+HfGH
         wxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=AiGY0kPtwxFTxGkksWurGE880lO3T2ZhlpMNHkb3vJc=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=dSAnG1J31s8aCmfeA2sytaem2pxUW+5FfJmwyP6YpRN1rhkO/t2Ql9XrnP0zSEFOMP
         X2pRbfhNhkreFITMQYd9ocWmAP4MD/bue/lHIU1WX0rsO79dySP2eV52uYa9rltVhVNJ
         qZ1hFvbkTFKnMEo9jr0APWYhfeQ8nfQn7CILA1UKmRZonZjpiesDIdatMhgedyez2apS
         tcFwxmPNiZHOL2gYxEzMt7aATmtiFV5JTkRQo8G4Lwr/BBLTB/+kyVNFh59Qs0zPO7aR
         14LwpDzfvSmCDf35/cs3yhuJEEUpsGQjf9KofR2PMjaRSmEgDScXgKZf3YZogSBUCab9
         bhWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWJTWYWC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020a05620a25c900b0077d9473d5d1si16235931qko.255.2023.12.27.14.26.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:26:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWJTWYWC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIcLN-0001Jo-4j; Wed, 27 Dec 2023 17:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcLL-0001JU-U5
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:25:39 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcLK-0001qP-47
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:25:39 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-28bcc273833so4665660a91.1
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 14:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703715936; x=1704320736; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AiGY0kPtwxFTxGkksWurGE880lO3T2ZhlpMNHkb3vJc=;
 b=QWJTWYWC6YHmqgBMGYejCFwj2/unx7Zlgoq9rdMuIL+hkFgcLzfNh1CNs44mJWx4Yf
 T+blWVNHRmQ7xzMn4Zzu/MZpdfztZoMYXtl3DDrmjBtsDqOf/YPAEfUI8LtloPCBfJvT
 Hw67axy5BTwu31CN+eVEcUm7WFAuJwWAUcpTXSHCuUkXBawMX+dTbMzTwJw9uuJXjps2
 2oKvCXzKZtnVISnXo3uSH7gvfQ1imDw6AMJhE30+QY59qQOF4b3oUoubKqnaNaWv5K9y
 CEpgUy4yrw/FHRNzbmYu1ucAqYvo5pAVDHTAAuOh473y+37om5X415eDatsmdItfuAFZ
 KCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703715936; x=1704320736;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AiGY0kPtwxFTxGkksWurGE880lO3T2ZhlpMNHkb3vJc=;
 b=MLhARgDlDBemM+QWoOuvv2VuZt5ZLY1A5IGh0r71uy4DLrLNPC5VfdYYf393xjNgym
 W36CM7/NxzuNVpUepIAbMbc/0qLBXHVPIWVP981ly08yW+cucw0yPFK0aOjZiGyDnQD+
 P4QACpkSClOUUCOiLMzkxgr7+ob/Vu7AvKA9iBAH72s/YDtxfr+F/2uTY+bvPPsv9h2D
 4nOuipgiLl66wsABHcD7057U6g7TcEPI/hQF9cAc1xcAtJbH6gnuCgOCOI1DKwjG2NiS
 gtfOBf9qsL1Fhoax1ZQ5DWD0eP7RL1xp1eAEfFukT/8BkojyUQbIfKwPCOqNElT7i7yp
 VHWw==
X-Gm-Message-State: AOJu0YxlQsONCr1cUIfX03O4EZeQM40uthcnxmMxFQuVTDAOblP5+e44
 gVIGdmIoFwDHOCHXbhmTjHAfqtr9gPIxDw==
X-Received: by 2002:a17:90a:6b46:b0:28b:95f0:b6fa with SMTP id
 x6-20020a17090a6b4600b0028b95f0b6famr5311185pjl.28.1703715936559; 
 Wed, 27 Dec 2023 14:25:36 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 sm18-20020a17090b2e5200b002868abc0e6dsm17207121pjb.11.2023.12.27.14.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:25:36 -0800 (PST)
Message-ID: <994486ce-97d0-4194-94b3-2095aa4a1e11@linaro.org>
Date: Thu, 28 Dec 2023 09:25:30 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/35] target/arm: *_EL12 registers should UNDEF when
 HCR_EL2.E2H is 0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rjkUi7OKlof3

On 12/18/23 22:32, Peter Maydell wrote:
> The alias registers like SCTLR_EL12 only exist when HCR_EL2.E2H
> is 1; they should UNDEF otherwise. We weren't implementing this.
> Add an intercept of the accessfn for these aliases, and implement
> the UNDEF check.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h |  3 ++-
>   target/arm/helper.c | 16 ++++++++++++++++
>   2 files changed, 18 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
