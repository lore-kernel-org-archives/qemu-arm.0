Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1542035wrg;
        Sat, 8 Jun 2019 12:28:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQMtwLPu+ohAP9hQzTA1FzIcSXjUcEzp9wkPQKrMajxmFHMZrnRW2u2ho22OXZ9tZfoXgs
X-Received: by 2002:ac8:2fb7:: with SMTP id l52mr30178036qta.93.1560022083348;
        Sat, 08 Jun 2019 12:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022083; cv=none;
        d=google.com; s=arc-20160816;
        b=TR8XOyLGOU8eTIpIQ/Tl8T1zJo1v/MF4Xez8+W2Xte3uOdFl6Jr6mTzxMRFtjTFpai
         m6IILnWQvDiILRMk3oKufNlE77OXAGgRPi50pauTgSQ9ntpIQofffPbMyABDQH9WhSJJ
         +wBtZjGnNGesDL5TJ6ocpTNcimpGgpGlZFi+aKyI02VJd/FS/g8T67wKj5DT+9MPCfQv
         DtT2GU4FPnaJqC0d/ikN8Hpo/rAH7IC8JIRoNOuRx7VDpcS/GWoxAsWQ0NBaFBmQK4FB
         1es+eGhTjJHM+ad9kCz9taddqqFCoy/tRzghRPrV4G1/2JFsu9QfjUClB/+l+CctTfKI
         nx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=8+qR5hrKNFyfTAUe6zUMuy3pWxXBLdmu7Z0bNi5nxMI=;
        b=F2fm4o3UBrzOTT+jtbgufBCrexZI80QVzyq+prlXB7tMjgulx/Ez2Kaus4bkkC07c7
         /1CB2KWNmzC+jQQnfMsydktek5fg4tQtpH5N6PSNVCpXHp1Hwzq8ORT/kdPoEmvi3gMg
         6LbyM1jHxJ7KTWiKLin1aJLI+No37p8JuGqwS4HadqNilBYAvsyvTePVEvboRWhGesnI
         A/W7GWbu4x7Mlyz5ACqsNDnb358aWz1b7eoEVixAe2cf9eMNfeG5leRHQbc+oxLgvQkt
         HC5LZmF6eEkg1FXQSUAybddpaOczwO/oXniU5OpZgkL2aLugkPlSCK8gH7B4VCBuB7Bo
         mIXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=moFs+xYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o24si115120qtm.127.2019.06.08.12.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=moFs+xYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZh0U-0005db-Tx
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37117)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0A-0005cK-Ef
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:27:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh09-0006FT-9p
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:27:42 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35734)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh09-0006DJ-2o
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:27:41 -0400
Received: by mail-ot1-x343.google.com with SMTP id j19so4925005otq.2
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8+qR5hrKNFyfTAUe6zUMuy3pWxXBLdmu7Z0bNi5nxMI=;
 b=moFs+xYhU4BfDqYjNp+STrrif9k/Yu2oRQgNNJAIhYj2SoOf0NkIhFFO7Lqzi0DNgU
 lyvXxDauvXDOweM1GOOtqWUKNzxpXXKGbDZkfzsjpjo9doR9o7LCtGWNl1qP5ZJ+gcAk
 zes6Ur+Gpp7MMNi+Dg5p9lfQmcerj8zokLnMotyHLw6oHr2QE/U9h1z1Yyd+hcZuKbbd
 OfjUpKre21XvYFDjFavPEe00WzVt+lwDKe/+8hNm1vINCuT+x1p3P/nhAE8zddJHL/Zn
 Lt8qC/wpsVyl8rL+8wPnAQVsF6DYVXBtSDDF9D2x/34HaCgTU1kuALMr2J/Bhph3tAfV
 HjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8+qR5hrKNFyfTAUe6zUMuy3pWxXBLdmu7Z0bNi5nxMI=;
 b=VKFK/7AyBFKkxexENkTrigSUiqBzFnsEeUR9xWrPajwZ41sPpV+yU5JqQn8WEPpst0
 z91xG2fnW8St03oHE0q++zGN56ipk5MDVVtTu16CbP4d4YSGuee05aAA8bbJtScLA5v4
 hNjo71qBzJEizEAz7cbfMvFcEEZD1DDENFx3VUpo0t4k01X55S7vzQ4BeilCgoOu8Gi/
 UASF8y9yWz7ETnSsob+fcjTuzENimqtRQqUyW8dp/OSuj1WPnxXPAx/uiPv8bmlS7OMp
 eOkxvGNX3TBpy//JVLvQhcrwStXONqeIIg+JsO+6OgiOWSQOKthjz64W8jm5uw906P+Q
 qPGQ==
X-Gm-Message-State: APjAAAWBtf5ps7d6l5k26EO8ki4HjSbn17XsCDHxf5Mry5or1JkRYz2E
 I5DsF0f5WTClA0Lj/wDcq1vgWg==
X-Received: by 2002:a9d:6b83:: with SMTP id b3mr24090129otq.82.1560022058310; 
 Sat, 08 Jun 2019 12:27:38 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id 37sm2561246oti.45.2019.06.08.12.27.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:27:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6a63b1c7-dcbf-02fd-058d-dcd8d2113cb1@linaro.org>
Date: Sat, 8 Jun 2019 13:21:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 19/42] target/arm: Convert VFP VMLS to
 decodetree
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
X-TUID: t3+/VAw0vn21

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VFP VMLS instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 38 ++++++++++++++++++++++++++++++++++
>  target/arm/translate.c         |  8 +------
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 44 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


