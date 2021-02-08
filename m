Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1506453lfc;
        Mon, 8 Feb 2021 13:18:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6B3vfJ1+3q0EyHid2fRm4gfmUBz1GwQt/qFIkAIyHFoi6J1H2pi1bfMRN4EBi5JCV8k9c
X-Received: by 2002:a25:c285:: with SMTP id s127mr27998653ybf.383.1612819133378;
        Mon, 08 Feb 2021 13:18:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612819133; cv=none;
        d=google.com; s=arc-20160816;
        b=dn9tqc3U4aQVE275BTiOuaWflrl7ll2Ee2tTk/UF4Rap9zhz7cChLf11syTVel3j9k
         ncVX3Yom1e4FSLEuEEFS6bnF+5g7s30A21ZX4QYt+vw8TQ7jLm9YQW05JvtBuxcwsBo4
         LWWs9qAp0eUMVFJKCH+RBpZTsWFM9Yoq0KWLkMQMfIGWAeQEczluhoiNvks++0cAWCM+
         qIWc64V0NC5vTSwKqiQHsr2eFw771sx8FFLxoNdPyZ110z8PSC5ZNqjkjTzpTihZyGPP
         +DMAlfrhz3iZwczd7RqlMO+DKyq4DhlmqVcBYutXL5LQpWEQNo/+bLIZS7pgOWBHJYQN
         0emg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7YpNMf/vQgOhm8vShHXOBQ4/tqWujyxbJR+mfN+8T5k=;
        b=uGkc8R86JPdUpM9JeT+GB8nfE/saUyLLAy815bqEw0t49hRqExEnSQXMycbkKDvCNk
         /1vKEo2Rd6xcpiXRVuMSV2z0cM19V/YbZk43RBSwHc0qkes6/ZgGG68cT6HXBc7dbiv2
         m3VeNMo0cAhcLdyYb8KE6S/tH7yq2XqcSRD2kK1Zsyh5wkXACQ84DOpEcq8vMg9Xku6x
         B0phXBJLPJEtgDKR2AHqfAg+nyI+6M5H0MEJsSZCF7tm+tSooIQCI/5NJL1o8sLLRBnp
         451RUDwWLPPmtI73wbL/eiPKIgFz6jAmW8CvbVGGhj30BlrkdKG9bgBO9pw6Y4CykTeR
         AY/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VadEkwef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si19825843ybi.246.2021.02.08.13.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 13:18:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VadEkwef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9Dvo-0007Oo-Ir
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 16:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99i8-00017T-7S
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 11:48:28 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99i2-0006sP-40
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 11:48:26 -0500
Received: by mail-ej1-x62b.google.com with SMTP id l25so8638897eja.9
 for <qemu-arm@nongnu.org>; Mon, 08 Feb 2021 08:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7YpNMf/vQgOhm8vShHXOBQ4/tqWujyxbJR+mfN+8T5k=;
 b=VadEkwefAXoXGpiAozeJFlEBMXXdtukmEOVSVz+RtS2sHMtrUOGHPII3cAU8XrVKvx
 8FKsU3uu9ijdJBZsdmxxXiKRRg+f7tn92Jygog4pk8AvdOT/vG9tqht0htXnU3af0LQf
 6Wg3XB1hEXRZ6Dzglt78kismYKmJwZ4buA2+ASBw6UC2oFVLPZV8U0p1Qjz/AtEeUMZL
 zP/mDpOGQ/FOvzVVoJRtthlAXkb4nzLK+ocwNjunmreYUzd2vHeK8Ttu+/yzGt3jjMLV
 QzpVlNtSMTDWqZN1q/HHDd4qFbiyjsKS4BE1IfDEPDPMDGevE3y/QA9y6bmkLcNJBNbP
 Sc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7YpNMf/vQgOhm8vShHXOBQ4/tqWujyxbJR+mfN+8T5k=;
 b=SCA1iWcn6ogOGNHslanP9eYGesfRxMtVVJg8wZvQ4tG6NA3xsWJ+16xtDITQVeFVgW
 goe64xx554H5th9dBVVfvBjE9oH0uof57Shx2jHJNuPop8ZHtKSC3ANY9d1zH8e1/6C0
 vCdyQeKEQB3COWWQ9B4vMYtnWrNSqXj61EEoWAGi3DIPS9MhoAKlwCrLz6Wwj3nKKyfd
 AqKlTsvkzG6qaL97FWXaxm/H+2IdY6lcCoSVv/+0axvQOaqd7HUPgmsfkZ0NYZURc8lg
 ABtjl/x/q+XEmwbfQoeOXbBzaDmWJFsSdEHH1lMF8zrCmpquwunh15V0AHK38myYzRqx
 Cwjg==
X-Gm-Message-State: AOAM531O1c6h+HuWmA/92awlD8/Td3kiLMiVLjBzf2iiE1bSlHVWThdB
 7bPqwBKOVtpOWb939odm1opIL6L0UYkG2pGjOgWXjg==
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr13453618ejg.382.1612802900354; 
 Mon, 08 Feb 2021 08:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <20210129005845.416272-2-wuhaotsh@google.com>
In-Reply-To: <20210129005845.416272-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:48:08 +0000
Message-ID: <CAFEAcA-i7z1CMiHD1QMWHvdqta_ZtAWHJtjsaejUKfNg86zq5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] hw/arm: Remove GPIO from unimplemented NPCM7XX
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uRv1CzDcdNwZ

On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> NPCM7XX GPIO devices have been implemented in hw/gpio/npcm7xx-gpio.c. So
> we removed them from the unimplemented devices list.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu<wuhaotsh@google.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
