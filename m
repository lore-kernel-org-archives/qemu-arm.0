Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1200045ejc;
        Wed, 27 Dec 2023 14:31:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEq2+Bsnfe5zsSS7/XkG72x+xBenLxzbuhzUkK+v40hvOIlA6z40ouVeFDtBwo3yWXXiZw7
X-Received: by 2002:ac8:58c8:0:b0:427:974c:d4a6 with SMTP id u8-20020ac858c8000000b00427974cd4a6mr14853273qta.56.1703716319585;
        Wed, 27 Dec 2023 14:31:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703716319; cv=none;
        d=google.com; s=arc-20160816;
        b=yKesZP4ePztYiEej+NbCDN+BK3oqcrxIzVy/tJwsbLcemWyEvHPtQhbYAZ4tv6sPrs
         cC7hLL1wzUnLH5UzkczRCNVAAl1NhgXzyeiC4yz2jICFuLWlayrRPBNGWi8ODUUOwObh
         ae2Y+72CoVZOfR7u7kbvKndMaobvHe40gq1uXq08cQDe1U3qFX8cMfGRlveC1eCaDjsy
         YlRwA4ZHxe8y+epA4ICBD6So0OvA8FnPq1WHFgjs+1q9W+f2iCTf7xFRAr4W11tJdOmD
         Wk2dE1MK0F5aYohuK3IIhQLeC0EN5Fc6bnXw0f5UOj/RSyAw3LATBoA+WaDWpySOt5ch
         XPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=FsZGIWeG2hw9IGXz2FNwqsrVLiylnT9+GDPK4wVWU2E=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=dprstu3OjcwS/oV0UHiFtJdOztYhbfjzwaHweVX9JQSNljCtHo6SS3p2+WDtMIetHy
         722tTy3iwM0DE71nSvKUvIXdUsjp+ITa5ptaUuqRLsq3inb4eHRLO8X/qzMXyIu6fkp9
         9qwObW8yC4KAC9AvlOlQcSQAhtEZBfeOHg5KwIu8X6bkvtyQhT2qo39Mcunx+HTkFSBY
         bsHiulrqBesSsVgdhkzj/wvj80czlsqbYszpjjNQsnyWOqjOpJvtZ3cE8PSemgjg+4Nz
         Nx+d80evEsZ28TjVoETaczfQx2Cf7jHF2Cto32EqxFYU+LFcgAudgSo30z61amYonVX1
         /ghA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yk74IZJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17-20020ac87e91000000b004279ad1ba32si14247588qtj.9.2023.12.27.14.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:31:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yk74IZJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIcR7-0002fl-Ii; Wed, 27 Dec 2023 17:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcR4-0002eq-VA
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:31:35 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcR3-0003RH-F3
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:31:34 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d420aaa2abso15922435ad.3
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 14:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703716291; x=1704321091; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FsZGIWeG2hw9IGXz2FNwqsrVLiylnT9+GDPK4wVWU2E=;
 b=yk74IZJ3ib/Qvpu/VdRMLnhmltu92O+dSr0kJ4GkLSaQSRuR1xzPrp1cqpu25fNLVh
 LYcWAsj582RHjwklldvsYaHxnIxnBkgSfoEl7Zi1gzPzictOP+tQb3T+Ul2Q3evOOibE
 Lt9DMB4erUejRSnUKtnq+spbpaTJg7lxLwOwN2iryrZmeiINTjkVyDvMLSDhNMkZcgIU
 FwHQdqnE5zNPRRiLlPOPYWg9bSzrPFQM0+1uq0GbXK9oinfuvowFO96UvpCXZLyEyUHf
 R7ReGrlt3RZ0fihOPa9nbtkvRX2YU/atvG3JvlZ+ybkpl1GqPl++NeO34c9fuef7G76Q
 0mNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703716291; x=1704321091;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FsZGIWeG2hw9IGXz2FNwqsrVLiylnT9+GDPK4wVWU2E=;
 b=KbRsgjm/hGq+7S1/hiJULSisZcEXAHT0irAF+bphZu3UWWbCsBk8VcP4ibws8CE+HS
 rkh2tvnY8nQp5GbwV9ThiwiC/cPCdRjH7afHCfY3WivszAnpucOi2sbdqklknAsFIXug
 fBMr/GT08PVxInpOL9C87XkJFPievws83xYo1sqJgaN4oRwRh6FLB14tGLVhUKIF/ltl
 pLyVIqr9SpObygJ7nRmTxfocgWWRluvxHHcgzj2vQTu3i0JzRE/QSy8LbEHJye9kS1QG
 ZVV+ne7/m4ClV8xuOXPqYGUR1oUIJ5MBFqTniclO87szd3iZd7nv8vHMVX1dz3vj0x+G
 BG0Q==
X-Gm-Message-State: AOJu0Yxg9RCyWqb+/Wt9uC+hGyH3hLq7YKRdDlJU50o26Go8d6djC1AD
 mOEkhgNvqJqWSpUyWMGNab/LNlK/EVxVc5/NqeCN1yPYGfZ13A==
X-Received: by 2002:a17:902:6e08:b0:1d4:6de3:15a7 with SMTP id
 u8-20020a1709026e0800b001d46de315a7mr1467142plk.110.1703716291603; 
 Wed, 27 Dec 2023 14:31:31 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902e9cc00b001d473e4f451sm3618340plk.201.2023.12.27.14.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:31:31 -0800 (PST)
Message-ID: <69462f3b-8129-4c83-9c1e-4fba96f2dfa9@linaro.org>
Date: Thu, 28 Dec 2023 09:31:26 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/35] target/arm: Make EL2 cpreg accessfns safe for
 FEAT_NV EL1 accesses
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /jONl4lg3Qhk

On 12/18/23 22:32, Peter Maydell wrote:
> FEAT_NV and FEAT_NV2 will allow EL1 to attempt to access cpregs that
> only exist at EL2. This means we're going to want to run their
> accessfns when the CPU is at EL1. In almost all cases, the behaviour
> we want is "the accessfn returns OK if at EL1".
> 
> Mostly the accessfn already does the right thing; in a few cases we
> need to explicitly check that the EL is not 1 before applying various
> trap controls, or split out an accessfn used both for an _EL1 and an
> _EL2 register into two so we can handle the FEAT_NV case correctly
> for the _EL2 register.
> 
> There are two registers where we want the accessfn to trap for
> a FEAT_NV EL1 access: VSTTBR_EL2 and VSTCR_EL2 should UNDEF
> an access from NonSecure EL1, not trap to EL2 under FEAT_NV.
> The way we have written sel2_access() already results in this
> behaviour.
> 
> We can identify the registers we care about here because they
> all have opc1 == 4 or 5.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/debug_helper.c | 12 +++++++-
>   target/arm/helper.c       | 65 ++++++++++++++++++++++++++++++++++-----
>   2 files changed, 69 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
