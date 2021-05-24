Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3708813lfm;
        Mon, 24 May 2021 09:36:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6AclorOsbbC3YX5ljh2trVmIntjUFi+CfNvRcPb2r1XJ/uawKMNu4uMu45CYxxahJuQwn
X-Received: by 2002:a67:fb18:: with SMTP id d24mr21859478vsr.20.1621874185964;
        Mon, 24 May 2021 09:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621874185; cv=none;
        d=google.com; s=arc-20160816;
        b=0yUYKYhoHMBlhb3sjurIO9bqu3f6iORdC6gFwvZLqSLzta/3yv1Bu+1ikIbjL6RsuT
         teHBoxDX+yllW9w51t8Tq8ol3YvsO4U2/otVeYFHOoy2wESHTkgid6paFl6iV4Ju16Vl
         bqs8DYuWIZFeoZLnSqf2+/g366sH4/XQD96GObtDVh0xTb5/l5x60ifpIvKGtOOLznSE
         mbV+x2eiS30VixeRvWDjJGYHB8EVWHlI0n4Wp3BMBwXXGE0eO6Sy31eOSrm98o5cK+Mj
         zl747MPvy6oSkBAZaUyfpHgnvzpC/rx6rJIR5X7m9rOBpZzql56a3say7yxUrvgcKX5H
         cbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fRi5X36RHUErtO13nRyRXrFDjHZNwyh4im/d3rVLcok=;
        b=rU65K3DMi+EfSiqVQmiTgG+AStuPxqFlCoXEKFpFSmm2aDo8jkcsz64unVEQf5cExw
         VvacnI+9E6A4mm63oxuVukqK67aXJqni06SD4Rn4xJi+3jUlDEoUcuKwOM+Dek4ukf+X
         kPWYRPkPDTCVhT87pd738Sm1JIXscgioAqq5nCsGLHNfYia4g97tX6+9slvD2MlHtwF+
         0jzCLsqncfrcD8pCEl11Tp66u4AuM6eL7RCZKVEKf9aHQFajXUS6gPbJ9rvV9CFfeVp3
         11yXhpC+BNN8sPscvaWcNk/45/n3lbvq4DXpkVJhlkapL/JuhW+Y3C3jCttmjm7AppCM
         LCGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rT3lzsz1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si2982296vso.293.2021.05.24.09.36.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 09:36:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rT3lzsz1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llDZ3-0004S8-Al
	for alex.bennee@linaro.org; Mon, 24 May 2021 12:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDU1-0001Rj-2L
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:31:13 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDTw-0000y6-Bb
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:31:12 -0400
Received: by mail-pg1-x532.google.com with SMTP id m190so20485050pga.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fRi5X36RHUErtO13nRyRXrFDjHZNwyh4im/d3rVLcok=;
 b=rT3lzsz1XpXo4jdwt+6nHREBlJ2af8fl/d9+e3DX9o+PWFEkSDaqZu/wu6OPSnyFK0
 1P+aMEMbEFwao7/Kl+5dhLGvyERhR93+2SGdqMV/nU8JA2U46EDL6xPOj2Yl2WzICuz6
 Q9vsjV+pQlRfwXzvkooRgmQVHjQgDnl78NrHpvXjmV9hvpx6CsZRCkRLpJk5Ol2C3vWD
 iD6BXHX/96nEcTWBaK/Yyecx2+MONLQwFTAmokSjk8qPyoWQPp7zhIro7PbqExH3Gpng
 b69r9D+An5nz5yeoogtgM1mTpfUkhqtw5qZARVr2ZpWZnGBUxdTuoc88z7woVoStHv4g
 xbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fRi5X36RHUErtO13nRyRXrFDjHZNwyh4im/d3rVLcok=;
 b=Ut5wWC0sE/pIDHrJS7bt+B93GpfFHSzdj4dhIaWQAjnNz9pwTOEUVV2+zxOKYQucxD
 dUp1s2n9LpW2QtVZGkn3K6TogZfDx7YGI5ibcpRP08oBSSzu1QTMCc0nOUl8XUIHuCLN
 ChiwGGUcf/Qzs4+/lLHrUftAVUAMzoILQRSR+7gs2zZZsl7rZmzXKaGr+5kdFCcrPCZy
 9N73zR8ilpzZjhWgFFZq9Uw1uIM4Jdi7nWN7oryuUTNJcA5cN9U4sJNl3xtke450MYf6
 b4Fpnm47S1FpNXe7hmiYglGB1E8pNwC8GIP0ygzY9jAwctFzqbj2mjjSL99RlfzD8KqM
 yFPg==
X-Gm-Message-State: AOAM53167Hk80Mzg4dnmFeZ6zWCsxuv2/HAX8Kv1lVy4JNx6C8jjWMlw
 AyQoEzYxKamOAOCGtkZKGSaGeJDlujM5LQ==
X-Received: by 2002:a63:1d2:: with SMTP id 201mr14370531pgb.3.1621873866561;
 Mon, 24 May 2021 09:31:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v18sm11900300pff.90.2021.05.24.09.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 09:31:05 -0700 (PDT)
Subject: Re: [PATCH 4/9] target/arm: Add MVE check to VMOV_reg_sp and
 VMOV_reg_dp
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <466a3b77-6cd5-f1ee-662a-f117cbc7377f@linaro.org>
Date: Mon, 24 May 2021 09:31:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
X-TUID: uqAHckaZ1lDy

On 5/20/21 8:28 AM, Peter Maydell wrote:
> Split out the handling of VMOV_reg_sp and VMOV_reg_dp so that we can
> permit the insns if either FP or MVE are present.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
