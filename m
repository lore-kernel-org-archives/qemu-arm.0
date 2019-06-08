Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1553096wrg;
        Sat, 8 Jun 2019 12:46:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5VQk0nMqliJccxh3KZg7ZMjwLDMg5vJWNCYCWdk0Sd4A60JJn8ZuuqSbPPw2MoDHyiuta
X-Received: by 2002:ac8:d8:: with SMTP id d24mr22540965qtg.284.1560023176368;
        Sat, 08 Jun 2019 12:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560023176; cv=none;
        d=google.com; s=arc-20160816;
        b=vYm9qFLGC0z8maCN3MA118GAqL0oPeu5WGoQjp8W4GVjBEymMUo6GjP09PueCbUhdz
         W+eODMtuA3Ga43vxZKZ5NmzPYTZNzf+XBEmiRRXkn0KCbPT6UYJE9Y1F1oofvplsCbi9
         elStKBUr6mSCfNpVdgEqwwc5yh5CnEPq2RrzQpl719gOkXV4We93yPVs6MLgfo8HooM4
         eLnBgoPiHr8cqLCNxS8fGMC29lICGisou1tRj1pJr2LlVgLjF5brEDrTdMyMOSx2QPjG
         QvYUqajwr+sCHiu7X3iZWmvd+CeuPcOF18BXpjzirDqaVnI7ucQk+Rh3RL82HdpWvZKh
         TZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=A1K3P8+lwQg9GnL4poFXfzJhb6UKj7dyfAgmEsm8cNw=;
        b=UMSuMLslOdXbu2inoDSxjzDhmPniLIq7WTJpX2rMGxUyaYGixNlLooSIy5VWBersbp
         pNmhNTOMeiV/5Gg6IUP0GWNWhZBoyo8ZV0lFrgVb3ocD+qB1TB15W8h2USKAjRe8ecNt
         2IZihQAgIo4/kfNgYPhz6h8RKlKjO8/t2fbLIprYu7t9rM9YhnDfn4/JOxCSDa5UWhdV
         vYKcJd6+uF+6Cc+HXhDAyI0oSXIpRxkyaRk6jacWZbDBiNCNhLZ7g68v7qfhuXSWgZ5w
         oB9pZHzajadJrJbOtkjQxIWgE3UT7NbsE+7hyhMwyb0JVkLm+hyH/v9w9nafwPNm8Vx6
         q6sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="xvF/nMyz";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q126si3897966qka.170.2019.06.08.12.46.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:46:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="xvF/nMyz";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhI7-00059V-US
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38549)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3I-0000qq-B3
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3A-0000SI-Do
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:30:54 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38787)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh2w-00008H-RY
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:30:39 -0400
Received: by mail-oi1-x242.google.com with SMTP id v186so3710782oie.5
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A1K3P8+lwQg9GnL4poFXfzJhb6UKj7dyfAgmEsm8cNw=;
 b=xvF/nMyz9xxJWcpPKcBi5Z9eZ//qSwq6gySK7WZuoQIjrHd+g6MYgsXlqRldetOrVI
 vtvRD9bG5FzvJKtbKwqP66LZ/GnRs3Tfvq9aip1fNzkD8ON0oJ5kODzyGDSLGl2OHcxU
 d1Md9rEdo7CtX8QEBzIVF8q1SMdItdG5dWPTgRSJWoPLBdiYbAYq/Tn3/+t/s2sgloHy
 P3cgiyZe3qybSEhPoApf7KdDCr47LYmlGBBDLqYSFA3+K5vtMCyR8ZDF+/lTqoGS6xmU
 hVvusG0iaapq2WzJuycxoffWZ5ZktZHZiNxsMySyJltX9GaoNqwxS8s/dVp/do0zzsge
 sxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A1K3P8+lwQg9GnL4poFXfzJhb6UKj7dyfAgmEsm8cNw=;
 b=ZzPAauRIuaKVKa3Ujd0v7A8UWTy8xznLtRCuraUSmaa3ZRgvTMlkXmM2pF4h7Ek9t7
 V/ER+bc9YWUiloKxyO8gxi0oxUhOkQc9pUYCVsVFF/UbIjLY4G7RNLRV/HUtPvqgqH7u
 SQql6xoKB8QgqlbIiT6OJMJgEftIv7IKThC8CVuSbO8Eg372p/cLI2HM0aDW6tW+6mQ5
 X5xMA2I2tj1CsmygPxJ2zB8ZkzlLQgsM9FAGDKiHFYQOBdlGZHerboKGBiw/Cx2geW5r
 uCHB96/Q0nwRbMsd1PsBdlQwvF4/eGwwwm8w5YxPT4y3r+T3aSWnZ0hwAirk9yx0E2D5
 8/Wg==
X-Gm-Message-State: APjAAAWDhkrAhR46VN5RU9dppshgaCMpLB4VBbOaTj79M0ohCaAeTCx4
 rVkuEwWV6KX4wLC1fl3F110jMT2p86oHTg==
X-Received: by 2002:aca:4b96:: with SMTP id y144mr7741107oia.34.1560022222462; 
 Sat, 08 Jun 2019 12:30:22 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id t30sm905786otb.50.2019.06.08.12.30.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:30:21 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-37-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c4468fe2-061b-35a6-b425-d37b22dcb18b@linaro.org>
Date: Sat, 8 Jun 2019 14:11:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH 36/42] target/arm: Convert VFP round insns
 to decodetree
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
X-TUID: O1jtyVbEtcsh

On 6/6/19 12:46 PM, Peter Maydell wrote:
> Convert the VFP round-to-integer instructions VRINTR, VRINTZ and
> VRINTX to decodetree.
> 
> These instructions were only introduced as part of the "VFP misc"
> additions in v8A, so we check this. The old decoder's implementation
> was incorrectly providing them even for v7A CPUs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 163 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c         |  45 +--------
>  target/arm/vfp.decode          |  15 +++
>  3 files changed, 179 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
