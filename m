Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4795435lfg;
        Wed, 12 May 2021 01:58:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuTNNh0YifaKVttbQedGQEuR6tw/NfP5i5MT48CGEnWDGZdSALycmR9xfN/id0ZIKmjQR/
X-Received: by 2002:a37:a7d2:: with SMTP id q201mr31969396qke.16.1620809896800;
        Wed, 12 May 2021 01:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620809896; cv=none;
        d=google.com; s=arc-20160816;
        b=u22Fn/3EQwW7/3UEdxK1jbwTO/64mKl5yu71kYfpgClqdW5y7+cgf6J6wSpvyxMY9+
         VcKxggrRddqO5oboUgnk56vrQQXToyD9YCfvAW4zZ6FhTmohrXXs4n45Ixu+PMCjBooZ
         VdIa87iFPsJlg+Hb/tO5yvyRuWuNpe7A0TnE3qrZ3LLHu/gnxcMJuEbj3oBaMezSR/AA
         +4jRl4EsVr94K/DBPtKHL740VR9GzjGrM4ldrg3rhN3UpynLIVntIFtyu1m1aVQ1Hwxn
         KDPXd9k7F57NYmxpBNbuxaVMs1850/V5C3NdoWib5QtDk/xK7scGzAi7NMYOdNUxy0cd
         XqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sRcP/Vr7jiBZEYSlpBcsH05hcZkV9UAvG+ayAT2oX2Y=;
        b=gze4TDE3NM1cKlrA4TxuhSGKr6gl63WPI8bq9fScj4d9OLJsSxBx4UDxdMs+sGeKva
         neZWIpn92ui2Lvyowb5zIUd0azfV5GAG27HDvCPmIKJTcq/nGdva41Q2HmAVnby0mcwx
         ODZmHbY3HMoQHOV5f96NU9mh+L62BBZM7C3QlEI2vZtVBhtZm/rfFhbJsNtTLenGwftW
         RWkIU4nRD7BOk3zB7r88TIhiP6HnSclQjw7+HxRmpGWYwtvXXQl6Y2GHXLf2WCf9G+1S
         v4Gx3pzKR5MUMccwiR6wkRHlhNlodDNxJ0NlfnpH0saUSfdgLWe8rBSTNlrRPhJh1Kpa
         Y13Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bC2lXGY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si16558541qkp.64.2021.05.12.01.58.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 01:58:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bC2lXGY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgkh6-00084x-60
	for alex.bennee@linaro.org; Wed, 12 May 2021 04:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkgO-0006qb-Nk
 for qemu-arm@nongnu.org; Wed, 12 May 2021 04:57:32 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkgM-00046H-8U
 for qemu-arm@nongnu.org; Wed, 12 May 2021 04:57:32 -0400
Received: by mail-ej1-x632.google.com with SMTP id w3so33868168ejc.4
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sRcP/Vr7jiBZEYSlpBcsH05hcZkV9UAvG+ayAT2oX2Y=;
 b=bC2lXGY7RI7L59gz8HHGCwLvGEc14UW7+59vIPskJXMMQs8NWY15cPwJVjFW0Ws0/g
 XPuwlogmuceoYjzDC264uWbczMEYWPq9QlOWM+V5WagtytnYkAKljwQPwcdFQoB9vjZH
 akO6BJHT5k65IBAGycArhJ2XBM50u3R3nM0d7k/M7AiiyKUQ1vwEaKFhv8qnbo6rElkG
 Uz4BTdGgcXjlASwA/8VNXESmH7KclYnokM+nJvrKacVtUbQ4XKuYLclOD45b/lTHE+JL
 NFpT9lUhr31O/rksp+O9fyz3fF+g8HvNvAXvN8dpltXY0B7/mDTJxsMqPVII70wOBx1w
 H+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sRcP/Vr7jiBZEYSlpBcsH05hcZkV9UAvG+ayAT2oX2Y=;
 b=EtYKfWEHJMfTmSSvyp8UKXD9Pawh/k55JVCxM5aC/dIviv4yqjaUxCWMb3asrAHKY0
 kod77aPAakuAfZsEKa8cD1btkI+2fU33zi+7zWVVebKmLMgQPEGthAcplurRXu9K3QRC
 ZePXuZSCrPNiwU6amN4KLFptFhug2cBEOfKZvuJ7nFzGiqMgDAu/USXQUoTqpkPT7f2M
 wiJr7PjV+sZMWL3UxO2xtgJ2dsbvEvL4bjtuZSx15t5S3HJzi0ZnVC2b8CT1oWKPplbt
 RH0aN6S6k7rZrhBb9PChpGJrJ2jC+rP2U/7mNphIBqwGLo5qMez0YdkRTEGuEmJTPRK+
 paeA==
X-Gm-Message-State: AOAM531Za6eXqOwdBThsp6wqcgh+dL+eO1VUIezx8pHs37OT9pqEakQP
 VHk1AD1TxrN2O/D2KJwyZ9FBYNQ6o4dFRYsC99pRyJ1pElg=
X-Received: by 2002:a17:906:11cc:: with SMTP id
 o12mr36820263eja.85.1620809848739; 
 Wed, 12 May 2021 01:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-29-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 09:56:15 +0100
Message-ID: <CAFEAcA9ktK+i61m_XsMOfdxtOicRbGexY21Pqurx4K=hkCAB2A@mail.gmail.com>
Subject: Re: [PATCH v6 28/82] target/arm: Implement SVE2 UQSHRN, UQRSHRN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TGw6HE8p+XWQ

On Fri, 30 Apr 2021 at 21:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 16 +++++++
>  target/arm/sve.decode      |  4 ++
>  target/arm/sve_helper.c    | 24 ++++++++++
>  target/arm/translate-sve.c | 93 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 137 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
