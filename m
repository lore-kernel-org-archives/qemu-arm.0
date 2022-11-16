Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp416273ejx;
        Wed, 16 Nov 2022 05:17:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5TjrB1Mfd496DPNxxc+LUFBsmchderBP6Hf17i4XwPY/gKpIwia8UTwgHv19BRKXir+xsg
X-Received: by 2002:a05:622a:489b:b0:3a5:2033:18a1 with SMTP id fc27-20020a05622a489b00b003a5203318a1mr21020768qtb.149.1668604639292;
        Wed, 16 Nov 2022 05:17:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668604639; cv=none;
        d=google.com; s=arc-20160816;
        b=e+RwkP/W/hZ7BAUQXWN2W0ot0KrSWLbcG8DfDTtjwp9fwW0q3+IdS77iFfVmcicIaM
         UW2+7GAJ1eb43NhAnr5TmC1Xx7HF6Jf7NLyjjqwVI5JeZj7IJL/4fDeQCZHfs08Rs0Pi
         CV6L1wTjVqdoRNJC3iMYZqq0qjk/EkaPiAJsN8NX68MuCpwFIjDEM1rikmQzhF2eUn1P
         jI+E4qzOoj9pb5Pqncc+cLJmuaNg7r+3rg9YATljf7Ec0QgKBcn88XU8lUGVRI0zhsAT
         VgO/931wftlCE5z5E3iKOOSqXfnvS+R5ZcpnnlYAvE3QQwX8Eb39TalMafrKPd9+QUiG
         h9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xu28lO4QIE+TLFhOU8ekeNoat5ZVAGAMjjQLvhkqAZk=;
        b=S2KwSULHT3SeyWCIEvvE7PSQu/34OX8lHuYhDmp5oyT3fa1TF3j/pCiAla//gcbaI2
         0n20mOoJ17jDMx43xoU19dD9gTre/XO5XdxEc1kV/ZrR4HBVPel6CXSkD9a/+OSX2oBr
         fvf5QI9pW/o5vXntNvPm+kuwv/drquH0S84JR3+IIMwlX40ynSWlIHqOLy61RooqpjYJ
         VSJNmffKCNPjv5luUV8ZUcpN3Bb7kqMXDKZzTvmQ4a/2e+tM0eDAE5kOoD3eGbq3Fo9S
         9n2THSlf0r5acWKKtCoeFuY+QCvSgpByPGJyPxKmbLvDviHsand0LAaM3lnnYNEd+Ni4
         8eww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S0GyCJcC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b184-20020a3799c1000000b006eebc5cf8c5si8650933qke.743.2022.11.16.05.17.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Nov 2022 05:17:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S0GyCJcC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ovIHx-0001PC-WE; Wed, 16 Nov 2022 08:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovIHw-0001Mq-Nm
 for qemu-arm@nongnu.org; Wed, 16 Nov 2022 08:17:12 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovIHv-00079s-42
 for qemu-arm@nongnu.org; Wed, 16 Nov 2022 08:17:12 -0500
Received: by mail-pl1-x636.google.com with SMTP id j12so16391193plj.5
 for <qemu-arm@nongnu.org>; Wed, 16 Nov 2022 05:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xu28lO4QIE+TLFhOU8ekeNoat5ZVAGAMjjQLvhkqAZk=;
 b=S0GyCJcCtysMXrxw38VVzEqQ+2bAi1nZj7aOIN0WF1uU58EpCuzfuKW9s3NdrB9G+L
 8wEzLSJuQELrGwP3zChNlzDNqFNba6F4LcK6lU9CIqZ7DF1rOSXQA7HApCb5+VnFqC5w
 UtGa7DttHZnDHEY9tMwvIGYlSQ4CCLACtjgW0BpcsUBdVa1m0hpGS0BwK0VxdYv77vIb
 MM0rloQHQ/8YmIfW7MqBSN3l6vcCpZYncHUkqos/D/tlTtpztppBGuf1WfS1vfUj0aAC
 m5kV2hUYzmSYPJlWYQ8Ua09T4dFezpLy7XFXwUD1oQcJPP13uwCzPkzBcTBZPTZNaWyQ
 AUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xu28lO4QIE+TLFhOU8ekeNoat5ZVAGAMjjQLvhkqAZk=;
 b=v6LQpiFyMkmspH7HXxpwnj7Sm1Y3/SLeKXdE/hPHjhvZWfr35FDhJd/Ujcj0AuOz10
 c4b0nsCXDVNEYertvbWc62A9Yvi9ZQcb3P+v3HgCsZATxWbHEg0pmh+aRK6TzQFjq5R2
 Omh/qAit9E8/VcqnmbLiMPnM75BsKeyUXu9MCDmDVgpO0kx4+ShUP1tpmoJUrsogGCiC
 knTJpKDAeToly5KZ32suQYe7iWuhWJX6RTF0GaWV/IO+52co4jn7cYLoXoN7WBEbd4g0
 UH7/FnoHVfMQttTboi7OHPkZ5lbpoPfnSj1zp9VFOIjeA+VtPo8KkmyFYnBbvti8x8ed
 FN6g==
X-Gm-Message-State: ANoB5pn5yLRvmnT9drCIQRXDo1yaSixq9lWdkwhjScaSTh266J/vBuIX
 uMbUFpCET+tnqDKiCP85vJUv3nh25e2k+X90P2wv/A==
X-Received: by 2002:a17:90a:df03:b0:212:f169:140e with SMTP id
 gp3-20020a17090adf0300b00212f169140emr3570912pjb.215.1668604629392; Wed, 16
 Nov 2022 05:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-2-its@irrelevant.dk>
In-Reply-To: <20221116084312.35808-2-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Nov 2022 13:16:58 +0000
Message-ID: <CAFEAcA_4i_V49FLcm=x64bJh--Y4sNQgLJQZ-a2aXr7-si7rDw@mail.gmail.com>
Subject: Re: [PATCH maybe-7.2 1/3] hw/i2c: only schedule pending master when
 bus is idle
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, 
 Corey Minyard <cminyard@mvista.com>, Peter Delevoryas <peter@pjd.dev>,
 qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, Jeremy Kerr <jk@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: vbIUvr31Q1ML

On Wed, 16 Nov 2022 at 08:43, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> It is not given that the current master will release the bus after a
> transfer ends. Only schedule a pending master if the bus is idle.
>
> Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

If this is a bug fix we should consider for 7.2, you should
send it as a separate patch with a commit message that
describes the consequences of the bug (e.g. whether it
affects common workloads or if it's just an odd corner case).
As one patch in an otherwise RFC series it's going to get lost
otherwise.

thanks
-- PMM
