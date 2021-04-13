Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5055777lfr;
        Tue, 13 Apr 2021 10:02:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIkpz1HrJo4bHvlFkbY4L7wT7b9M6C2WMyLkHT4ZYYf6bRpU2KRC+LHQ4ZusBDv6UUIH5e
X-Received: by 2002:a92:511:: with SMTP id q17mr24409976ile.189.1618333369477;
        Tue, 13 Apr 2021 10:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618333369; cv=none;
        d=google.com; s=arc-20160816;
        b=udw4jV7M2u1IK4SCPdBHs98QiqbWLJSR/UxFL4Oq5Dr6dbsY4Lg2XA67JqvV2ICC7y
         ecTPPW3NHYczBM+tD936M6Fw8i44vpDnlnA5dyFAe0R3ck51RjmsxtCPf7kqNA/Iv1PG
         Yydq3H+/eN094FyCuF0zJ5kPUuQlKSC9zuuX2VOw6+1dtddVj56hVD2RCIEbXVOH1TGi
         C6TQYqxhL7GsN50W/bu9lLks0tATnnTWr2WthExm/xgUuBKPuNYusVx1EYE1GZ0kSwdP
         4CrfgKCzTBOBKrZX4x5q/mexnBMGQ2Mlv0mkbQJZkxzcPEx3ybYlrZ8sLvmw6v9NM87n
         48qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ih1T0fRaTCvkRLs3dTQZ3qrFLUqLYYsPB2ChvWFapl4=;
        b=shSDiZjc89RvKRsNAS2ejs4mwTIEu1geOMWeZ0ZI6aidLVIEREq4huWoLqg8YvyLHl
         9igy7FK2bKMKdEA1gtSq5WkhHx5z3WyW3PStk8pLDcQqTCj/9Kwdr8kuXd8Eha4HZPvP
         Lipz5Dp+vJm2utfU00DZ/QdKg4IInjAEQUOYljyUmAgMzV6gPuvlTvPiQL4O+FupdeIX
         2ZLub86HEuD//DYCDKng+RKI/A6bD9b3I51qGaVS17KkB7imkOIoYuzSGwnQ8IXcZSbZ
         HUOn2aiPdAQSJBzFyeOdGsQiddx3Zd7+ZTYsEaZatExRGfnIOVuL2OcNwZUgJMGOBgCC
         XZ1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dRG84Eef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si14526831ilv.74.2021.04.13.10.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 10:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dRG84Eef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWMR6-0008Jc-PY
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 13:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMQw-0008Fc-M8; Tue, 13 Apr 2021 13:02:38 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMQv-0007Cz-AS; Tue, 13 Apr 2021 13:02:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id r7so5176934wrm.1;
 Tue, 13 Apr 2021 10:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ih1T0fRaTCvkRLs3dTQZ3qrFLUqLYYsPB2ChvWFapl4=;
 b=dRG84Eefo3pHKU2NwvuzWhkROloj23nTPSwmjKnqgmy+IXgYN/bz0bUe+p6P7ZegEM
 jaoEpiSs7dDU+V7mMlfeUYRpxbswv7zl0aKr5LZsf7X5TeNKg7nW/zdPG0MT3OkPA3mX
 NX6NGRPXS6mmzT+VPmeZgWA8+DL5lysQBafVPnMITycIkrCElJ5zGeGoxA6SRu4pQKXi
 jkpAzOMgrpRhtHSkNc3Jn1dBhcUsR7AXoXk8XEsa7OWb5V3OZY171BtP12Z8Gx1vWl+2
 f5RwfxpTlzMNE9NQ1ur4kF3a+SPuyeA8JJvGywVeqlStn55d4RRDcf/AopnnaZPgjTkQ
 yZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ih1T0fRaTCvkRLs3dTQZ3qrFLUqLYYsPB2ChvWFapl4=;
 b=Oyc2OJZaPBz9KroDIoVCksmRFKQfml6vxqnY6IQQv1NEue+IuNiZj1g/fOTwslbqh7
 GPXxHUczMfROgEP8Fl4c9vLqjKlosjoiZspai9zdQZ0ARkNtcOpZT49Llfvfb6tYfaTR
 JXI+HPk2i2wkG9ZH/qGZjIl09xL24KIftp1Obc8/OgZnE3v0qGFDhz4wuGzt2M5kzVmE
 s6y2cSpkkkza3fSyHtvA4RLnjSS8dJQEFjlBiVbVFqmv8EjnyF0P1OHTqJf9vNEnelIe
 /bmrbJZN7tq+lCCLCjx4NAIRRJyeSHtcmYIqB0R3UQDWGyWaKdLFnpybdElfC6k1XE7a
 x+FA==
X-Gm-Message-State: AOAM53228Zt7F8X5E/dMgSljRtRF5eUrYyvH6yZgB4+L5bwRQ6n3a7bk
 jNmfn+QxKIjfloOevGhWO3XnuVsvGwY=
X-Received: by 2002:adf:fb42:: with SMTP id c2mr38391624wrs.83.1618333355132; 
 Tue, 13 Apr 2021 10:02:35 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b206sm2978816wmc.15.2021.04.13.10.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 10:02:34 -0700 (PDT)
Subject: Re: [PATCH 08/13] target/arm: Make translate-vfp.c.inc its own
 compilation unit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <32810f82-48a0-fd3f-dfe7-6b43901853f4@amsat.org>
Date: Tue, 13 Apr 2021 19:02:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: nFjsd8kYWK+j

On 4/13/21 6:07 PM, Peter Maydell wrote:
> Switch translate-vfp.c.inc from being #included into translate.c
> to being its own compilation unit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a32.h                          |  2 ++
>  target/arm/{translate-vfp.c.inc => translate-vfp.c} | 12 +++++++-----
>  target/arm/translate.c                              |  3 +--
>  target/arm/meson.build                              |  5 +++--
>  4 files changed, 13 insertions(+), 9 deletions(-)
>  rename target/arm/{translate-vfp.c.inc => translate-vfp.c} (99%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
