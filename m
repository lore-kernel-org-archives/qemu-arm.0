Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp412686dyc;
        Thu, 3 Jul 2025 02:34:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQ/runWYn9irLnhvETLB2qFR9eU4YHEkuKMaUX3E52C38NUN9VUs1UH/iQYDfTsu5BTwDqPYfeKWkEqw==@linaro.org
X-Google-Smtp-Source: AGHT+IGPmpydgbKWbA40fy8tIAipzYXhAkX/p5LQ3cdFC3H4Nq31LYvvk1NQhWyekXAbRXEs8kkg
X-Received: by 2002:a05:620a:261d:b0:7d4:64f5:3c98 with SMTP id af79cd13be357-7d5d1c685bamr332971285a.15.1751535288807;
        Thu, 03 Jul 2025 02:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751535288; cv=none;
        d=google.com; s=arc-20240605;
        b=b07O3EgZTjT9UG023Dw1haSDoaFqosF0OVmd2ojt0UPIyaiM3RCQwU9eiLQOUTRPG4
         dgDHfRmDfaYaDIzBCbBKRJEb1p2EloILIdzaXn7ZYCCfHsPWkmygfHS/SDjoZaOGSTFN
         JH8E/VIf5UmsEU15Cz7T7U9k+AQxSIw9drohTyTwqTQcOjydYqIWf1E8eJR3+hT125en
         ZwQinfb1a8aL8o71eBrR1uAZDqbJwcAHHsDfzFr11FTqxVsjTXJSUwN3ZnAtaqkJ/rvL
         Rb6vE9I9g9onEXd3DbEnEA2XKpMA+qg/XgmTRpkq3JAr1pwrdm5us+OXiiLeY5ZtCQy0
         2JnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7ild05BJyJV7piMfK/sm9VUr1D7Yv5vwaABxOwmxVXk=;
        fh=EhjjFkbrdf+SRs8xv77ncUs6UlR1o/lsvJC5d5e4a28=;
        b=P3WYZVJhp2WN9qeSXBUvYfgROkTICOtJdcjnytwUa98f0QhT8AXsEO+/pj6d06SqQw
         7qGJbnPHgOqEuVpWs7ED09Xaok8mgRk5gNZigGBC9N4k7VPSPN51DK6E/5qCSC6PQtox
         dUoRpMnFxKOh5Ij8NXpLDRM7zYAC+b/jfOAPOCdNCh/AWJ2QlA1TUSaY+8vm//MB2CsK
         KSdzqLu9QwHSL0lzJMQ+1/1USxAsnirbX/Jw6sb/QE2kyn/RznVRfhFTDIkZqwrTtFTI
         VWjjSYIWsjuKO5ksbdY2Z2OPd+r453E/xUoDexmCfcbSQRwxVPCnlRHwWpy41o3Zutho
         7O1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rm4h3pqg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d4431930e2si1355606485a.64.2025.07.03.02.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:34:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rm4h3pqg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXGL5-000199-HM; Thu, 03 Jul 2025 05:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGKm-0000s9-M3
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:34:26 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGKk-0001Og-52
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:34:24 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e7dc89108bfso6851140276.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751535259; x=1752140059; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7ild05BJyJV7piMfK/sm9VUr1D7Yv5vwaABxOwmxVXk=;
 b=rm4h3pqgLcjT0WsXS7ERdt3d2dh1HwB6HdlEC85OHZZ8v0uw2TExroeGwzQcRSxxYF
 3wOtJ0lyl7GjnxWF9QTK7me9qzImCbyxxVHU8tAjvoA73HcxJ2zSOImTdbo2q7z5tPZV
 rmnPRp24JG8OXHOT/DH30MxpivEOa5DwvK3GwMYuwtTdX3BhOVsAitk+bkLKHjXv3qpC
 rar4gGTLqo8VylHXjdtF4wj9dpQ+rNu5iDthquRAl/ACrp/CfsPHbh2xQcDsD1CVifZh
 AXOeuh03O9IEXIh2Rk+XNQUfTQxW/jCJYAwNXot+OkQG0XrMVsBDbACBktL7pVS7S+3J
 OnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751535259; x=1752140059;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ild05BJyJV7piMfK/sm9VUr1D7Yv5vwaABxOwmxVXk=;
 b=VhDS8Bwp5Ks6y5PX21LwDtSjAA/7C+BxEJW6OMfcrZ48d2Kaql2fWDde5sHJp3GKg+
 N0IhmiJOREj7bxQwannktODJ7NsRrdxj7+Vyc+PEo2feHXxHOLKXEz2gmr++ClXWbtqF
 w0XtezDD6jie4VoUgBYGIYaIGC64NQ1H9bnfmuEAmOC2Ok4QimQASbnAFr4FLyyErlaP
 pTCMDmj4rAhd3KASj0PeORE9owslDZAMcKo4P8cC40XeTu384jIul6JPFe0I/q/ujOGS
 DR+rnntcMiyqlnVIqmACVo63DGBQOpisMMDH2A3ndiFHZ5uqSDel5B9kQUK6OacQ3Uey
 aVRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPMgVvHlmAdA0flS/i/jdtMJCXJO/RfqFCnNnwTQYXQURsO70fVcwVrS72iqRY0FW/87hekcf8bg==@nongnu.org
X-Gm-Message-State: AOJu0YzkgVEgFJEeGXnfNIHPvZ8nh7qd202bva0VCNCLCwqWL9ta6T9i
 VWQAx0LaHu/DBuyf1zyjVjtJITZDuss/w2rz0D5tqu0Kih7CSlMR8/by3g1MVKNBIIjkMHI6qGn
 jZSJoYsOK4cc5O2k5S3ngY6Gi6tm8aQAwL85sdd9fkw==
X-Gm-Gg: ASbGncttEtW5lqcQM0x6JjG14RlDbULy9dVbeKWKViDdonAcOErjAeqXr1kxRquV19g
 iaQsRp2YYyyhdcA7uoq5kg15L3Q+Va3Uf4GmEgjZ2K6hZVN+AjtN042pi9pM/zURpBBk/tJlhgu
 SqoWyvtWIXjzqbc19cpsgYD85WvhHp2Q+NXv6nAycmGoLKrjCncOL1g34=
X-Received: by 2002:a05:690c:6601:b0:70e:26ef:95eb with SMTP id
 00721157ae682-7165a320362mr27659007b3.5.1751535259074; Thu, 03 Jul 2025
 02:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-26-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:34:06 +0100
X-Gm-Features: Ac12FXxEF6yunYWp0iXImMNf_PkPNbmQAi7TAdEvbdNTeGy89N2bBMtk5KKZqAs
Message-ID: <CAFEAcA99rix7vxcOyBzW-4W8ETBSF=Sw-b8bHWBKY94VJSxUVw@mail.gmail.com>
Subject: Re: [PATCH v3 25/97] target/arm: Add helper_gvec{_ah}_bfmlsl{_nx}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 2cg8dBmNp8Js

On Wed, 2 Jul 2025 at 13:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper.h     |  8 +++++
>  target/arm/tcg/vec_helper.c | 58 ++++++++++++++++++++++++++++---------
>  2 files changed, 53 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
