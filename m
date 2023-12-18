Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp854705eji;
        Mon, 18 Dec 2023 07:06:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKjxp2suCF3W1K1844L5k7/otjIyoX7lp1IPxMEQJabKY6GmiK430AMfQrcqJl6cwpldNM
X-Received: by 2002:a5b:842:0:b0:db7:dacf:3fbb with SMTP id v2-20020a5b0842000000b00db7dacf3fbbmr8316034ybq.104.1702911972102;
        Mon, 18 Dec 2023 07:06:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911972; cv=none;
        d=google.com; s=arc-20160816;
        b=TwesBiJW7Ya6i++Auhgjsmv05csNq/BXk+UWVaRiYx7UojNg+4J1T9Pl9sKQ2WVrCC
         NgkzD2v3JVoNusY7UUXObGrsA1z2qQuCGPzwaSzpevwt87WqSoNs0mJLZiP73SoXTxEt
         fpA+Ydtbk++si7JZCteP5dEDtTxWuBPtOyFXCnNR7KQwC9BNjdMld/Dwmpw5FS10mM95
         1R2Y3MHWy4RqaJAtQ8svddE2H6ROYtZbNiumMrqbIOYXGLKoWwIsUaoNxa2UZN1P3AJW
         q+veDTZxIwwc0XeBlNgPrylpNCzM0jHf2R5PqIpqd0pNLVutw3okwQblBjZ+gm7bb4jx
         iCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LhwjoR/tWxGmpkzjzIicb0CMliaNwYjF8VhrxdPu3b0=;
        fh=auo070E/Mdhc6mhwv2UBoZ+01lxy+zviDJ6pob/+/Ws=;
        b=S87DIDwiiRAToOLdWeTZl7cTO+9kvfPMQI/goXArnQo8SMgfUofZbdb4F4vnehMqiu
         wEMp9dzAlaq7ck84U+1N+fyqmQoa6EOz3tzjRRHgrqxYeU8auA37E5i6vdVvdOLN5lWK
         QLNXwDRnp60ia7vaujugPJ2M+1h4wgVfQMQy/1dkbiwhd/qgF1apdW0R5pSJuUaJ21mN
         Jiet0Kv/N/v1knhQzubxS+3heOnXiFAJtNiiM+4eJ4EQr26+YLIYkCneY23DYc8ApW4d
         WCUlAHRBSCVBBDOhDm1GTyRXEY5CTa2NFh3P+3CuktCNtXI7e7fCeaz19zYBii3FvAbG
         kjPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dEVHuMkY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j189-20020a2555c6000000b00dbced8f38c3si4363157ybb.357.2023.12.18.07.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:06:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dEVHuMkY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFFBz-0001U4-23; Mon, 18 Dec 2023 10:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFFBx-00019J-93
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:06:01 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFFBv-0007sU-ON
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:06:01 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54cd2281ccbso3737948a12.2
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 07:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702911958; x=1703516758; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LhwjoR/tWxGmpkzjzIicb0CMliaNwYjF8VhrxdPu3b0=;
 b=dEVHuMkYkIQ0DcvHBNt/BO+vBisq4dcXW0eCn9PzPbuM3zbMNE/IkmhhYV9D4p2JZi
 eimfTQrSjK1re1Zta8Uc6o2/9Q7JEs7FAGMHnqJEoH45HqZiWlNPkJCFkLfEsGYJgeEU
 uF5EKtYh/4P1HiV3oHz0tLnRTj9ACV+hf+uJy2brnk8qNL0cF9s3xKKQ1ro8tcmbScIr
 8VlOyGprqkTIbo8m/ZaRnf7HZ4mcTdH1GPjRq6V3/+YZB/fFk89l7h3EDRtUDgjiTJ0x
 03aUykx+YJhaJCjgdgiCvG04LjQkOnHzSB6xH9tEevyH3DIS0ly2n+Mjtu4A7qVsaTtw
 n1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911958; x=1703516758;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LhwjoR/tWxGmpkzjzIicb0CMliaNwYjF8VhrxdPu3b0=;
 b=RqXRe4t8Qg4xsqxkJgBe1NJwOEgocUL1kWvQ41xPJoSr/fn/4hI86HHynshWPM/Q1V
 6hRDOZocpvtmZ10jbGPauKwKiVN/osr/fruEYpvirbZd2jOQTJkcrCmCyxaOikQX6sGb
 qPArjBVTvENLo43kcOL6JMmn/oeY9FUJ/ORq/XIL6AcY2t/+pPzX5+7DkTFcEh6XC1HO
 /Yas9egzQ2lc8Re+P8S3X91RwM4B6R9hykqsLIR7UBYLPsqVVk1lk2OjfGm+lgu0PvfE
 m6yZgq5hArbYnD2Tgy45I03v8PIpDXC+VjfGXeb3XLNfFHQplo1o3Q3jc3lDN7Ubddel
 mV9A==
X-Gm-Message-State: AOJu0Yw4ZJqpZoh6mCDe5l1R0hoqWKdYmtvpBD7kASabLt0knxPl7jnT
 E13VtIoCNjZDKGb7egEvqFoKJ4U0rVPjL7JH4XKg2w==
X-Received: by 2002:a50:ccd1:0:b0:551:656:d48b with SMTP id
 b17-20020a50ccd1000000b005510656d48bmr419283edj.71.1702911957751; Mon, 18 Dec
 2023 07:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20231215144652.4193815-2-jean-philippe@linaro.org>
In-Reply-To: <20231215144652.4193815-2-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 15:05:46 +0000
Message-ID: <CAFEAcA9-hDs_zG=jGXLbSgPkyX-AMUfAJLTk5end9neSPwyq1g@mail.gmail.com>
Subject: Re: [PATCH] target/arm/helper: Propagate MDCR_EL2.HPMN into PMCR_EL0.N
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lMYqLUKJdO5S

On Fri, 15 Dec 2023 at 15:16, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> MDCR_EL2.HPMN allows an hypervisor to limit the number of PMU counters
> available to EL1 and EL0 (to keep the others to itself). QEMU already
> implements this split correctly, except for PMCR_EL0.N reads: the number
> of counters read by EL1 or EL0 should be the one configured in
> MDCR_EL2.HPMN.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Applied to target-arm.next for 9.0, thanks. I've added a
Cc: qemu-stable@nongnu.org because it seems a fix worth
backporting.

-- PMM
