Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1538189lfb;
        Fri, 23 Apr 2021 10:16:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRdHoIS1yXvC7TKbMokFZLOgJA/AU86l7G73V18P8l6QsRamR80FiFt6Jfx2Me7O5uX7Q0
X-Received: by 2002:a5e:d61a:: with SMTP id w26mr4212295iom.52.1619198162933;
        Fri, 23 Apr 2021 10:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619198162; cv=none;
        d=google.com; s=arc-20160816;
        b=syIOt9UihW8grPI8RNem7PK3xPCuLPjid1SKLjwpHNjTbBYaIFIw3C6gceeXhUppY+
         12KDxdqeAGwiPxol0TCiBdulKYHiI0JriCtzZsq/xHw6X9Q+hZHsyDXhq4GYaycuBs9v
         Kb+pdHPEvNckAA/AyN16kqqakoHhG8G9YSij7P9m7JKS4PjqDYmxkVm3I21qqEDAYSdw
         k6ZrLwZCa6Fj9WBQfmqAH6E24edfCMOdvh1I9r1lCnkrCOJ19IOjuOdKd7zoDFJQyizJ
         we8yQTsYmgQqyqd4YosOvPBeoZ+rGf+zlBi7ssqCsL9aH8WycwEHBbPOo8LXRi4lug6L
         ZVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6kjTWKvEBdq0vRGdTVFI8/y3ux4Q63HE5UFdN1Y93Q=;
        b=prEQGrln20uJpe2MgOt8zPo7xglNhciEYqDJ1rHyRIUlTsfV8c2fXapVoH7OVvop31
         jALzNXWklMsB2jfaTOXcZKKF11Q72cGlqT+htWgnWb7bJcv1j8On7gFQD0ERhBXEdrqp
         c4GH2EWl29vSufb8GY80lqXVTMiotpWDj96ijW1fZDj3ePr3T+rPh+tJrkWxSiDZrn/e
         mIOsVfKxaOd4Dlu3fxZ1YhzFGa00Di6swd6YTS4RT1GixFkVUO3qTM4GhhwYw40Z/e6i
         ZUGkHDGhb6kye/oN57sZxBxiOLglA2uAPNIlUzn3xX3WwPzD4MtUywKttWqiqmrVeYXq
         qtag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SULlEsRv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18si6113243jaq.62.2021.04.23.10.16.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Apr 2021 10:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SULlEsRv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZzPO-0000ms-8M
	for alex.bennee@linaro.org; Fri, 23 Apr 2021 13:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzOz-0000he-Jj
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 13:15:38 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzOq-0004dT-FE
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 13:15:37 -0400
Received: by mail-ej1-x62e.google.com with SMTP id sd23so66277752ejb.12
 for <qemu-arm@nongnu.org>; Fri, 23 Apr 2021 10:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6kjTWKvEBdq0vRGdTVFI8/y3ux4Q63HE5UFdN1Y93Q=;
 b=SULlEsRvarZNc+roUhUj3c/vB2RLhmvEh8+8cIaZXG6hfvKDj6tPeiDq08xMWmIEfu
 iNxJgpOQb5wogKBpXcC25kuTwMDX4++ihtfmMy6yuaWt0nvBPyIoiheta0k+n39NeeaY
 3n1MnV2HLGddHUPFVlCHHhvDN4FLFzoS2Hoem88bZcmT2MjZfFClBqx03zGVl3N+8Ws1
 ymfE9oPW8AMtobEENx+qhJZZEypmRnxn7vvxzrzOPSnoRTk8W2uX8k6Cnvl3ZAE0cqM8
 fHEeYlGaXKYfEOg8stFOiQ9FQidLENnMbbR34c16qLWeEhX8xbWh1iZWjZRNe/+S+TeW
 Vwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6kjTWKvEBdq0vRGdTVFI8/y3ux4Q63HE5UFdN1Y93Q=;
 b=PEBbyYo0/mcE9touC0VprBItapUKc02t8BK+FkQ+4P6EZoDUbtYOQ0ILVofAtiX+e9
 mIuA6NZrdzpPILjIEL/h67+K4MAlzUwKG5OAYNIylRrArKT8Nwwbn1ASPILqn1x6Scua
 oftfReVBDcJHAL6FMTObA/xdLLuw20vRI8TcIsukSsmGtb+PxEs+GfuCXMD/5aI3Uuzb
 r4rOUFdbXn5dJrXL9CffiYl3oYPptpqBzbHyHuunaBxTmpKbwNeYJ58eV3imStK8unn+
 7xdIank1bYrCipok/igJ/cPrkMDcs0275zXY1ve2QqkN4MtFCual+VKz2LRkEakqdF5b
 KOsw==
X-Gm-Message-State: AOAM532vK+z0i/U3eCKYPBNfUiitsPpJC5eQW6gFci671tHmHTKjhfqR
 aSxtnAYcYjQfHw26zUUsuYvwWwwF0vEfCmrsQUQ4vw==
X-Received: by 2002:a17:907:9852:: with SMTP id
 jj18mr5285329ejc.382.1619198127022; 
 Fri, 23 Apr 2021 10:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165413.338259-1-richard.henderson@linaro.org>
 <20210423165413.338259-2-richard.henderson@linaro.org>
In-Reply-To: <20210423165413.338259-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 18:14:31 +0100
Message-ID: <CAFEAcA_YCY9fxMugvr4uLMv6bUbo=CS4YN0c7SKASMZT_Jowyw@mail.gmail.com>
Subject: Re: [PATCH 1/4] linux-user/arm: Split out emulate_arm_fpa11
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rZfy1yOcaB54

On Fri, 23 Apr 2021 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pull out the fpa11 emulation to a helper function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 153 +++++++++++++++++++++++---------------
>  1 file changed, 94 insertions(+), 59 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
