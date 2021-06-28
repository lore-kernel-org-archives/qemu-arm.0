Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4109501lfg;
        Mon, 28 Jun 2021 08:36:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4RAlLANZk080u6BoZTcFUPjgpyOBzJi6Vhv3SaL4hvkcPr0QPmmQI3lErtlhhnfwh+wNp
X-Received: by 2002:a05:6102:141:: with SMTP id a1mr18809950vsr.13.1624894595970;
        Mon, 28 Jun 2021 08:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624894595; cv=none;
        d=google.com; s=arc-20160816;
        b=eMb8G8245u9eRA3oBNR2Esh8I4A7FPQCkEMx0grihfUKld8SwCbPWKJe2a6M19xJpO
         OxkvswhKNxIgWOshHIVAFfHkW6KQMviq9DIZ0r7WFiZCyuOayw/BO99mDRDXLGV9aqAO
         bk+iP7kCx5XmmgOqPH4PfWXwLVCOlCHWFNo6lE25oPKg/sL8yWwzQUgOk60nHwTQ+mVP
         TrVybnAcVKG+WKZQuMEwLlmrZmyCLqi7Vq5MJf3MlJ2GTbfUlkHF2uKkiMQYKD1yqkeb
         tyUrkQhRQZwmyC18OTWwETlKnrnd5GS5JETwv2Rel1R9EMC18WuKzRxUREVMTLH0FND3
         gNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7jlagpo4AUlheQevVqLvJ85BvUN14xq4gkanarUnJ1E=;
        b=aBbUhqv8MqrPaKroxjHXe/Cig7JJxtvqoXB+LNBiHN1+stvz+UUPqlArGTMGoiOcFP
         N+kH9pEalY9DkOuJzNKXuFVV1DmjicXmPWTqQ99uBy2c7bm4QYXkpY8XNdaxesd/+UyJ
         2poa7q6A3sAkQmdG8Ayh+4OLGTtjCLdaJu213a8GezfwNXV4zSm+dQ0+EARYd2EiUD7W
         Rk4rvkbVajxMyGorMCoCm5BYLC6Vx+9gfgmQQgoG0UUpfWBdHKJxy3q+sdgMPTY6kIN+
         EIBmT1WG8dlGtDIke8g9Q0KIBO/DJuVnoeMEhVhCGbD2ABanLH4w0lN8keiKlOIhTa2V
         IagQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pnxuqiiL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x130si8609384vke.89.2021.06.28.08.36.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 08:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pnxuqiiL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxtJL-00033e-9o
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 11:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtIz-0002ns-22
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:36:13 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtIx-000610-El
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:36:12 -0400
Received: by mail-pf1-x42a.google.com with SMTP id j24so383762pfi.12
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7jlagpo4AUlheQevVqLvJ85BvUN14xq4gkanarUnJ1E=;
 b=pnxuqiiL7eF/HvmFOSHbVKUrGfi2LRr7FAdKLt93XeNvKsaXwir74A9CaEuieQmqlx
 PmyVSJH/FPgVjULEs2tNHS2Pa/dHSaPwCQ9Czp+nphWqNDamB9wOXstIhqtoRoXrLhk8
 WfY7L1vWHMgYcUhgTiixnJXPHtHpsApdvRMUDTCF4dcCqgoxeQCYxMLFeK8011+YJUqT
 esDofIN5aIDhNNe2N9USj4XMjMa2JIOYLXyHoQ7LC44tCQKlR3Rmcsu4oW2UO+qrZwRI
 3ud7Xu4LlDhlWG13jNpbjLkykDdOZq3PLdJ8NxcNioLLeYcWJdlNHIl+1U4oDxv4d5Gw
 QKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7jlagpo4AUlheQevVqLvJ85BvUN14xq4gkanarUnJ1E=;
 b=NGNVUHqGuYVSYOMEAYbctHwMKSqx3SnfsDuAp7/A9i5yWUuLwKYgXfe0INv0PlTiOL
 pcB9OyfkQGRhfjusiEa9+Vw0+pcgVCs8IEBFoj4XNBRJgTj02JIsLKrCuuW+GX3up8LJ
 EUxMBPiTLKtcNgM4OPNelQWzZW/HjbG4peUjmUfSWPk4E6s6K/EyOLDV6hyvLFcjTItx
 6YWJwvKy33YpHKObtNh9ODT/RuJZ0q7Bl2O9h3EO50qppGO7FYcYsJlO9sxDUojLM/PS
 HNvG+lGU+E5FpeJwD7b705WsN8MDoOgEr8fsz6/kcM55ky/s7JuTJ7SBF8Ek1RGKeLIJ
 nYoQ==
X-Gm-Message-State: AOAM532gHZqbZW2q1x1XBRO+ogd3KhvDOWylAYXsAVkKvRzlmIAgePRZ
 C3po7AADvu6c2pYDA8hW9wkV5A==
X-Received: by 2002:a65:454b:: with SMTP id x11mr23927515pgr.48.1624894569997; 
 Mon, 28 Jun 2021 08:36:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m5sm5158598pgv.24.2021.06.28.08.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:36:09 -0700 (PDT)
Subject: Re: [PATCH 04/18] target/arm: Use asimd_imm_const for A64 decode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5a8318b3-ee48-927d-4a41-06b78c77ee7f@linaro.org>
Date: Mon, 28 Jun 2021 08:36:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-TUID: m4/hldu0JZdx

On 6/28/21 6:58 AM, Peter Maydell wrote:
> The A64 AdvSIMD modified-immediate grouping uses almost the same
> constant encoding that A32 Neon does; reuse asimd_imm_const() (to
> which we add the AArch64-specific case for cmode 15 op 1) instead of
> reimplementing it all.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.h     |  3 +-
>   target/arm/translate-a64.c | 86 ++++----------------------------------
>   target/arm/translate.c     | 17 +++++++-
>   3 files changed, 24 insertions(+), 82 deletions(-)

I'm a little surprised that the fp16 case didn't move as well, but either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
