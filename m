Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1487622lfc;
        Mon, 8 Feb 2021 12:49:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4zMtQkxh+n8w3AaTl+J2lLt+4Vemqw+lqNum4hfPV/L1S+M9188bQNsKpJqGSOHLuw44J
X-Received: by 2002:a25:ce4c:: with SMTP id x73mr26740466ybe.301.1612817343068;
        Mon, 08 Feb 2021 12:49:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612817343; cv=none;
        d=google.com; s=arc-20160816;
        b=yWL33dZIaR7M31GFpwsRobhXOJF+Gp3C24dOSbwjATZLv+GdDxS2twL2mA/a60wf4a
         dmrYyRm5atkzF2aNTlku4C/1lkBt7gJc6YfU6wRLzmGKo0cjBM1wmZrlNQ4rei4jXpQg
         6fJK/FDVupct0ZoGaGKHWoyafvCu1lp3IObNFtzzNpkACmT46VK6S0GBvqyfLKXyNKMo
         CVVT7Q1A4lMaR3jtvHVeOcvu12NwQaS9NMtggkjpY7Nq7ZSnrSuHFFK/tTRW0J1vAfBg
         3I0DASS8kz7zKhuyPFRCc8LCZolDZd71P8Db/dpXrazkIQZ7JhVyjUK97aYIFs35TWeS
         m31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aYJ8lgQqYZE2jCinuZNaFz28hLtPE8lqU4MDMluz9+U=;
        b=nqkxevRpEvfnWDAniA/dGzcgQ6FnM839JTMdXGGACBbOx7ARJS/HJRT4jH9JEYlP5G
         FLtepCONJm6kc/ldu6DI1NDw0tfDBF7EglfbWv4iM54SU6Ft4vNUx+ecsYOina2LreFO
         aUPElXoXKaM+cANs4waURgk/FCao2WnCrRRB+4fy11yiHML4uvkvCuxirfTZvHrhPx9F
         tacIFkE+tJ7jKNDP1MxTPVZdEfZX8b03np3Y7VKyyWmpjFZne8xuY8JYF3Ip95pJj/CQ
         Jeh+hKhNmPKDHqDwnCF34HMg3oITH+RV4QBXZQeFjLkg9XUGsy8hpm9FZYXx/WW6tF3W
         WZcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K6rNmRDe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q202si19178017ybg.286.2021.02.08.12.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 12:49:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K6rNmRDe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9DSw-0006y5-EU
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 15:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99l6-0002m1-1u
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 11:51:32 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99l2-0007nL-52
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 11:51:31 -0500
Received: by mail-ej1-x635.google.com with SMTP id f14so25929793ejc.8
 for <qemu-arm@nongnu.org>; Mon, 08 Feb 2021 08:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aYJ8lgQqYZE2jCinuZNaFz28hLtPE8lqU4MDMluz9+U=;
 b=K6rNmRDeoQTt8khmec/otP4/vvG/ktfYPifViSB1UvCy2AmU/i7Njo6ijMbQXMkCHS
 cJ2tKXJK0SudaMAV5S3of4p/lBDMDB4IFhIgnFiPaKjNeDoaFXfaHkUkHnPEvmfxJHIT
 MoEq+v6HIFMMOfFTBSm/K5rRU+o6xmJEHRoqwpdMQyTbH/tnAgZ9sxq4HuBhSlcigwVw
 /t2smOfiStOxGsuT8T8aGCUzBxxt2AiYxFPS+zCm3Xtk7wQ2OSQHLHQ5wsoVO63KLApp
 E7/lqUrld0wKpK0ez22XODnO3FqOlpYvCWQ3PvBgs76fAPNXZHLgy0vDuXdJGAKnyqTN
 Vqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aYJ8lgQqYZE2jCinuZNaFz28hLtPE8lqU4MDMluz9+U=;
 b=fIbfcrJd6HN47toY08BYtsC1qHFb9wMSDqvkc5Any4CxIKTCYM1ZQELSqzEiOfOTWE
 ED4U2C5kF+D3VEwwkAyI3oTlaXeAkOw5ikFbhApgCb/pBGB3GwTJty+ds3oaI3IdgagI
 daE/maJx6fiEPwdXSx2s6Ky18oicPFPaH/A5tGbETO97cFGO8TVKcNklvNKODrdIhTZX
 64tdYkKWrxIAQSPJWGNPEBF2r9tcKmA6eVokhNXYlHujpOgZe1NtdqjmmMS+wyy1o/uY
 FfDMj7KFxUv1onAv9YDYbqBTs9T2XIpRCiyqGjxPK7/9bcOWUePcumVxDKuTxqkhedh+
 9i5A==
X-Gm-Message-State: AOAM530Am+tZbTZIYB2xxliMRxzSGkuyPsQTKIOiwSkPtHtRNUa4RLOM
 dtXyssoEH8SPhrBhe2ORnIRddqrXG0BacUSBYSOyJg==
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr17865811eji.407.1612803086731; 
 Mon, 08 Feb 2021 08:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <20210129005845.416272-5-wuhaotsh@google.com>
In-Reply-To: <20210129005845.416272-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:51:15 +0000
Message-ID: <CAFEAcA8vOsGq4ef2ZwqiqZt7XLTJ0Zky8+-5NP6TjAKwbcByJA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] hw/arm: Add I2C sensors and EEPROM for GSJ machine
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yKpIASvGx77G

On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> Add AT24 EEPROM and temperature sensors for GSJ machine.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  default-configs/devices/arm-softmmu.mak |  1 +
>  hw/arm/npcm7xx_boards.c                 | 27 +++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 0500156a0c..d9805dd539 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -7,6 +7,7 @@ CONFIG_ARM_V7M=y
>  # CONFIG_TEST_DEVICES=n
>
>  CONFIG_ARM_VIRT=y
> +CONFIG_AT24C=y
>  CONFIG_CUBIEBOARD=y
>  CONFIG_EXYNOS4=y
>  CONFIG_HIGHBANK=y

Rather than adding this here, you should "select AT24C" in
the "config NPCM7XX' section of hw/arm/Kconfig.

> +    /* TODO: Add addtional i2c devices. */

"additional"

> +}

thanks
-- PMM
