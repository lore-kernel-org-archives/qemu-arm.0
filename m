Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3980277lfa;
        Mon, 19 Oct 2020 08:42:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWfQOyvON4b/sD5QrI4baYzj4CG3w/61/CNdE/IzhYQRXcIUljNBhXqJeSpaiAcch7hDtq
X-Received: by 2002:a25:328a:: with SMTP id y132mr394134yby.306.1603122121739;
        Mon, 19 Oct 2020 08:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603122121; cv=none;
        d=google.com; s=arc-20160816;
        b=BISon6doD6ZQeGPCGY3yrlKn8Q9unepWTsBEqoqBHQ6ei/b+6Sl6SIuYjhMbN0N3c7
         v21CfLqrh3o/2PzbHRryHzum0R0SGG9F6Uc+FqT7O+8MoBdxd4vNgb6M/4+NteWXC8fE
         bDn4e2niOATV+6EOBrSoIwKDO0eTDwOLka0BJXNqmhhLdWJju3472eJw+hpQjSdDDDwF
         H4pRSnz9T2FIWe32elNELMCtoNNUyfNDjRjekFl896WTvZP+DfPE8dI7fuMUI8c4ekVY
         vO3KNMkqACKXlv4weV+jL7YMlUZ0DxF1zidebNFAmi2u6KTmCSjo8Z4TGs14OPmxXS8g
         MgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zUJJLuLH2B8vD9jiO5n3naJXQx6TK1Lz+NHOhom511Y=;
        b=Mp7aOltYjVu4p+m/J9bmMyovuuQGz84SbSYlS8wBDEHD7gAr6tTCqfj/itPPGPpnwX
         5i1XmxQGG2xbPyDTCmzCVesBwH0hTBwQJKK4ROFVm4Jxm5lCxEMXRFmAJK78kUEq8H3d
         v0P/MuVRCv8a9Bs5cX/pp7GGdjBjxlbtf0vJgrp1adQfF+lLJcCs7FXMebrJlDP1/DEX
         zRmSkT/CrdMK7elzbiBFqW93cMAg48MeaTIhPsJabhjXHWdHnJfMvve03SM8Tt4QZpPr
         8JR5HYeaOUQHM6fCigUd63JIAY+iI9zi3ETZifRhRRljVKcMkIj8i05tUkiDRq8CUB+Y
         crnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aV+YIUyQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s63si301514ybb.335.2020.10.19.08.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aV+YIUyQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUXIP-0000wP-69
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUXGX-0007qf-CI
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 11:40:05 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUXGV-0006Hp-5N
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 11:40:05 -0400
Received: by mail-pf1-x444.google.com with SMTP id 144so173677pfb.4
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zUJJLuLH2B8vD9jiO5n3naJXQx6TK1Lz+NHOhom511Y=;
 b=aV+YIUyQHsUGDZMW7DuIia2rKfJpH1B6DLVQMWgRX2SpOwnW8kczQtOzDKFo95Z7Dz
 yyz/1ViIsc6WNt7sZfAFFALDuxPhzx+oarGiobKg9Vcf3Lzv6DQYBP6wcaz0iC1jPfw4
 SjgBQisZ2G0ZCIrooX4y04E7wvU9GUTYURgPzCc0VhFd/fUF55jPQzkUWQepZiINZFSe
 lHYKkOEisaC5gIkjBpGAY07kJCIrAPKRl3hb2JSM7rZ4rGppuXbd1Yoq1VirQStffMjO
 1BUcpG1FcqWfu0bzBRKnLxkHOTkc5e59SHYLY7LXkU7Am3+Bj2DFRhOm/LTzywMpNs/p
 PZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zUJJLuLH2B8vD9jiO5n3naJXQx6TK1Lz+NHOhom511Y=;
 b=BJu93fh8+z2nbcsrBf3AMwZpq8XGZ+J/oCAvxjIhafkXdK/8MEF62HmqG75VWM7RjZ
 v2iNdDJaPcTutcK5e3rO6Kvm1p5ulXiewqawEuoAhV8ZLGzNg6PD4V/jXVxK5WQEfDqO
 5pvNNGee4NuE2fJ0PN4XLEzlNU05Nxfg8KBsauPq2IbIKdocQsvxonb02p8TelP40J4T
 cjAH/2XxTJ7bIQzf0DYlRWTYtFc7RJI/KcWTrHX5qw4w3RnoJC57v4UKqngHH27FgyS8
 dEJd8g1PCnAqGg2aBJwjwqbxEYv/eMEgpWVuyAG4iWKCAvI7PTeaCJj+ybDSrROgYzeV
 rzMw==
X-Gm-Message-State: AOAM532P2ZdNnVRmFztQDwZstuuwy+PrvZu1RUKpvT+2+II07g8SpWsJ
 y+LqALIDpwwhRiiF1CrjY8Y1SpId7HOIkw==
X-Received: by 2002:a62:7657:0:b029:152:4d66:dcb with SMTP id
 r84-20020a6276570000b02901524d660dcbmr182491pfc.74.1603122001215; 
 Mon, 19 Oct 2020 08:40:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id q2sm185475pfu.193.2020.10.19.08.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 08:40:00 -0700 (PDT)
Subject: Re: [PATCH v2 07/10] target/arm: Implement v8.1M low-overhead-loop
 instructions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201019151301.2046-1-peter.maydell@linaro.org>
 <20201019151301.2046-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <862c3804-bcff-eac6-805e-150d4df643cf@linaro.org>
Date: Mon, 19 Oct 2020 08:39:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019151301.2046-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GQZjwWZzGv6Q

On 10/19/20 8:12 AM, Peter Maydell wrote:
> v8.1M's "low-overhead-loop" extension has three instructions
> for looping:
>  * DLS (start of a do-loop)
>  * WLS (start of a while-loop)
>  * LE (end of a loop)
> 
> The loop-start instructions are both simple operations to start a
> loop whose iteration count (if any) is in LR.  The loop-end
> instruction handles "decrement iteration count and jump back to loop
> start"; it also caches the information about the branch back to the
> start of the loop to improve performance of the branch on subsequent
> iterations.
> 
> As with the branch-future instructions, the architecture permits an
> implementation to discard the LO_BRANCH_INFO cache at any time, and
> QEMU takes the IMPDEF option to never set it in the first place
> (equivalent to discarding it immediately), because for us a "real"
> implementation would be unnecessary complexity.
> 
> (This implementation only provides the simple looping constructs; the
> vector extension MVE (Helium) adds some extra variants to handle
> looping across vectors.  We'll add those later when we implement
> MVE.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/t32.decode  |  8 ++++
>  target/arm/translate.c | 93 +++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 99 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

