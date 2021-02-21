Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1011240lfc;
        Sun, 21 Feb 2021 05:36:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoMPcrKZYykJGKT4Oy84BIl9xsAONXeHPr5OlhCcaOAurhC1PE+mxjUXyj4jISh4EvoxCo
X-Received: by 2002:a02:1909:: with SMTP id b9mr11730564jab.141.1613914599725;
        Sun, 21 Feb 2021 05:36:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613914599; cv=none;
        d=google.com; s=arc-20160816;
        b=FzLBoHErFlNixNyVTYYs+b3tr7IqmpiT+1TUCiKA8fvEVUnxjY4imopGxObU4Fx530
         zjvvclTxqhZM+dMtA309L6U1gWgtCaWwFfOTaX4RC4qBDp6NDSNlPj7JU/q7jguBuCKl
         uYayaBj4rPLaeTqKP5MsAeJZE8xhihDtuAK3LHwq1GI7bsqDMXlZ5m771MCZJ8SC9EQj
         4JHxgYSpwfMFW3xyk/dQs7TN4oscZ7cVwnxV1pHXbANyBt7yqebaXHwzZN2958u97ghe
         AARmOAQgtfZ84KlhIwwfoWpHTqLojjuwMyb+A8wLkUKAtfhOxSAjsOV8oWhV3NhqMPpO
         9k+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ju2Gh6n0ew2AK80HWk9mSXJ9DuDeA7+Kr59s88BldaU=;
        b=rJhQEVuZv/xJeikZkACKpskvAurFLILDEfDu/fDLSIvGWOS2BO76lPmC8aACvO6kCQ
         odL4u9uWyvqgUVZJ6oa59zgg8XCN4UkawAUtO/6ZAjYOg0vwhojkj70UbIdfuCMcSrPQ
         r1l4v2OuTaKphct1HpzMnveLGt+0mEYKW+7cqiHDJuI1Dc+rtrnPGe+forGJVut+V8hB
         4pJy6CCOFWCsxxvKL4dAn3c2fTdor1lKZDrs43w/amdlS7psSPHLg/bCvnevRlNXJz/m
         09IBZH2ON6L/6laCGuamMADGKBzzvpJIlUxfK7mXOh/V4EZcY3rAy6o1QfdFjiNZ+rt1
         og7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U1SLwtk+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si1609125ioz.63.2021.02.21.05.36.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Feb 2021 05:36:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U1SLwtk+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDoud-00047M-15
	for alex.bennee@linaro.org; Sun, 21 Feb 2021 08:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDot0-0003Qa-DD; Sun, 21 Feb 2021 08:34:58 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDosy-0001jA-Sh; Sun, 21 Feb 2021 08:34:58 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v14so16206084wro.7;
 Sun, 21 Feb 2021 05:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ju2Gh6n0ew2AK80HWk9mSXJ9DuDeA7+Kr59s88BldaU=;
 b=U1SLwtk+9/K3b+KoycxBepCUB3nG8h3AiNs0To7+/T7rSr+DcECKrCtStjGZEK0x0C
 fPOULP7XUvDu/2GWzabCQ1870IIkJnSBEg83mvCDIEnVwUtioNyaFYhDsUufbZ4UKdsh
 /TOc5PY1XFiFNPAu1+nRkvnuUHnzqaf25d9CFHZbmbciIFWltgk62whywBnZdtLRpncW
 QOir+HF2eVnWy00qLgTP1otNVq1IlfDdPQykdy9Wqlg49X9wiTX7uUo9hDFeCbbUsRsb
 KaDhQF0rEgaYIAttlZjctOO9IaKKTRb30rvWcNVrATlmIDfGoYxPYNM/BF8hfgWA3KF4
 8YfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ju2Gh6n0ew2AK80HWk9mSXJ9DuDeA7+Kr59s88BldaU=;
 b=rL6Hw60pgbSOFutYkxvi4AgY0ETZbDCjuHm6M1hgBqX46fZz/ta4IKsB4BrjUibYBd
 8+2MAbK5eftjRaAexZMpoMGkjVLH7nc8JiiEFfenAYQvA5u6PW7ukWXeHV1ktf5dM50A
 gkMlPiPClJ4oDtM5L6LPMBvIMHqF0DLPKK3vv8WeHpy7S8+MYIlpmLYC9hZTM7SfhBdf
 jLaV/T0U+1UmJgC5Zv2Gx8TDGCPJs3hxxwAW76UlbA3cFFnGR8KN3+wbyG4p5lU9pHaZ
 9hX3E/MUH/fTS2u01b5uS/cW49mMT+X06I6oQCBP6rPgBcZBur1lGfu6ZweQ4pFVx+I+
 zSkA==
X-Gm-Message-State: AOAM530IC2ivvxOX5HraA92EKwYKLrSJNLdwvESZFik47j+FSw+y2Yu2
 JeenZv4hbgdQSDhzSy3fhOQ6AIgS2Yc=
X-Received: by 2002:adf:dd42:: with SMTP id u2mr17537450wrm.309.1613914493809; 
 Sun, 21 Feb 2021 05:34:53 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm22350467wmb.33.2021.02.21.05.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 05:34:53 -0800 (PST)
Subject: Re: [PATCH 22/44] hw/arm/armsse: Add a define for number of IRQs used
 by the SSE itself
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-23-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d1086b4a-4681-7f52-cf59-4819343d8625@amsat.org>
Date: Sun, 21 Feb 2021 14:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: JVAsFfKmmVHq

On 2/19/21 3:45 PM, Peter Maydell wrote:
> The SSE uses 32 interrupts for its own devices, and then passes through
> its expansion IRQ inputs to the CPU's interrupts 33 and upward.
> Add a define for the number of IRQs the SSE uses for itself, instead
> of hardcoding 32.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h | 5 ++++-
>  hw/arm/armsse.c         | 4 ++--
>  2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
