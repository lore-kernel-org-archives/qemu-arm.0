Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6529390lfg;
        Thu, 4 Mar 2021 11:49:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXxEwGKfi3ykBBPyVUOzhRHM3lDhxt8OVWcEvskWVwWW2fcGC2eoGg7YfXmZhKtjYaBT06
X-Received: by 2002:a92:60a:: with SMTP id x10mr5320077ilg.262.1614887357186;
        Thu, 04 Mar 2021 11:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614887357; cv=none;
        d=google.com; s=arc-20160816;
        b=F+38++3mCo3fksNMFBEW/2elrZ3bfm7r0T8QIweQHrU8GfbbYwnKa90OfVPJwr4ADj
         rk3W6SAL2qgaJb+fYuwFnGPO4HD0qEb8yFyx87T++t/hT6UQ/AjcX0sl5naPksrPcZxX
         fT/UCK6Vu8LJ2TcxmvOlFMjFzIkApwa5hrEO+cjapk3JqCzuLgSe7sY0bNo5/mDezOjK
         XnKVxm4yMRwFhvTdnCAa3PfxvKlcz24/HbXgkNOOYfz4VVNUv9c7+MjQJpsbQL1aZfRj
         UnGzvF8Ck1qf36DcG/Kia1vzKfpQBQWOxrN9WXDvjHVTyC3TqF96/n/LEV3jrcPBfrMS
         QZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Zi1PB3ue2D1l/bFagYQyHyEOo+RinjYI3uWBgOKVZps=;
        b=fyu3VQCxndkKGxjkNfNzrigHQCVXXspl2+HeXlYu+1EqskQWouOdIEbHFJUKGfoxou
         0J8Y7Xyg4wts4MY1empHWBYKVyrtyjOF68znrhRBJ6r5dQfF7emvlllczpCYZ14Am83h
         9JBbH80MLNwzxj7/A24cS18FPPycHc5QRuvJNFX3sCfXxcaBHWdBQghyxpmHAJTwdfQ+
         m6a5N0zgPsFK9s4iHm1aRIfCzd57qWyZZhXJSGFQkkdrgDMCE89oRC6sKthDV7K0PlIj
         owPn2u/2xCtJyE72PGPQrwSqkKEzeKddPI54QNx96AqTKGirpyK4DDOYA7Ehxm3qve+5
         tNSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIgMLSoW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si78564ilo.27.2021.03.04.11.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 11:49:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIgMLSoW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHtyG-0003qx-FI
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 14:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHty7-0003p8-2U
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:49:07 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHty5-0002Bw-32
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:49:06 -0500
Received: by mail-pg1-x534.google.com with SMTP id e6so19583770pgk.5
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 11:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Zi1PB3ue2D1l/bFagYQyHyEOo+RinjYI3uWBgOKVZps=;
 b=ZIgMLSoWG1B75dBsBWD9d0JGypd0l+72tBdPZ5IXxqfu9XcaVGehJ/5R0HMyWylqlN
 GecBQX2yF9yzi6Ww8f3H3eCW5knDdSGDxUq8zd+kO13YEpx6h1CQGITkJ8MkptIOj2SA
 JnPNYi6dOSDHleCOn3wVDqXMrETsMf9U14tFRMBkuPAb8IKrV1tTF5svXurJZSK8uchw
 HLzCkJlLKTsJWKmhJg3ZvL/CZj51mX81KDSksPi6WvCBS2Av7kWHi5UWnMf/1E8OCSTz
 Alj3UbkcWbfYIA4A3TznYMJ+fcI3+uIhl0QLQ6zJT3wfRrUuCpUuEDgWWxdLV90lNygC
 hzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zi1PB3ue2D1l/bFagYQyHyEOo+RinjYI3uWBgOKVZps=;
 b=t0eXIjAS0+YseHYDuQ5NAq5Ca8ewnrD37B71Bie1YyKd5OhcR8XV+umqZjBa0SZbXm
 VtleaCgwFOxtLABc3lweY49N25HCjLVPWlB6VYlycN11lA3zcnLY0tXHwgFOXU/L1mBf
 EpcBEJgePgcD7ZuOXSl2eMcONdF4+A6X/GRHR+U7XoPBh20bccNpwEZStav19MWnB1kM
 90omiZIRvn8k9EXxkbffOUJSUaEZCOUeLOgPDx84sMVeKLEy1yvKyMnvNAIDmgVYemcw
 MPzBwP43US772HfwumFxfLQbjkndAr3LwU/8znmhaWCpFaUzV4UvLHqWNo1kfuQVcuBz
 JjZg==
X-Gm-Message-State: AOAM532JsDCl2gTGy9Mq9vAkIrwvkE/g1cwPgDimsP5+vCKACw2xvwhl
 AMkCyCJ3bqR+NbP13ksvl0egbA==
X-Received: by 2002:a05:6a00:2345:b029:1ee:481d:4179 with SMTP id
 j5-20020a056a002345b02901ee481d4179mr5326631pfj.42.1614887342985; 
 Thu, 04 Mar 2021 11:49:02 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z29sm193551pfr.114.2021.03.04.11.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:49:02 -0800 (PST)
Subject: Re: [PATCH 16/44] hw/misc/iotkit-sysctl: Implement dummy version of
 SSE-300 PWRCTRL register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d46c632-6c37-0a2f-3807-116c435052c5@linaro.org>
Date: Thu, 4 Mar 2021 11:49:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
X-TUID: kRwrZXf+TAjj

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE-300 has a new PWRCTRL register at offset 0x1fc (previously
> reserved). This register controls accessibility of some registers
> in the Power Policy Units (PPUs). Since QEMU doesn't implement
> the PPUs, we don't need to implement any real behaviour for this
> register, so we just handle the UNLOCK bit which controls whether
> writes to the register itself are permitted and otherwise make it
> be reads-as-written.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
