Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp593554lfb;
        Thu, 9 Jun 2022 10:37:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLVPPYH9RZO53ZTtj9ekjVtKqqMFB0wuBQ9XiKXsub/1O5i94yMUAYz76BXBPsRSftTTkM
X-Received: by 2002:ac8:5ac8:0:b0:305:847:70e8 with SMTP id d8-20020ac85ac8000000b00305084770e8mr6537514qtd.120.1654796222732;
        Thu, 09 Jun 2022 10:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654796222; cv=none;
        d=google.com; s=arc-20160816;
        b=x5GTvOqhRWka9W0FKeIX1ShWd/M8fI05c4cJGuMJ0CVbfd7v1o1KUg9hoyb2zzZHOI
         oBFlGGeEncJlSKAxo+pDP+ckPSmxSCJ48S0EI4o5YmmT9yLjKisnVwV9LYq5sMM5/wEv
         UqJVfcgHzHqmQuZs/k1U39Is4lQNgkEGfo5dTedl0ycrH6R2UyzlXiPurlTV39Nhpk8h
         JeELXoEvlgfpY1uDFRAXdMJWFkcrpvlaJ8PQAJN+B5yCJObklhCKqffRRcdQ2vws1BFW
         lnsaQnp2TKuWimA87sSqiZwi0TfFaNMIuDz5qSGCWAmm5YqMBJak8tgQUX8LzSsGwR0+
         3HUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=A5AYgoCIZuweZdBNd7YVgGhy32HDQHHrgOjJeSFJHM8=;
        b=IANnmIx1gI9gMljBKTckHIZjs8xBhbXEVmRbjBdz/viANoFgj5EdvbNVSOeRXNZLiN
         9b/vbLrJACH2Q2nS2hGriJxbu7Lhq0RBmZvFQDan4pfIKyGg87Qm01C4M1Xk4qLZdxzp
         j592m/z60i8XYQwlp6FjDwbatIQLEFk3r3hQkDj/ywgSuTBmYt6Qqt3//dMWHzkEwrLD
         h2ECJtD4QS2+6viyWOglZZ+0ZtMsSSFEeGcyqMPIqPSdW0nylr7mjSyp05wdXROlo4/Z
         x3mtfiuPFjZQ+3dcTCIne1PLHUuH3eetRA3yZ+hQifT845fe+l2bJlgZr8Eyje0Gx55p
         V1Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XpR7lSs0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14-20020ac85e0e000000b0030515e3a706si675746qtx.465.2022.06.09.10.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 10:37:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XpR7lSs0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzM5e-0006aA-5q
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 13:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAY-0001uc-GJ
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:38:02 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:41105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAX-0004hd-0u
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:38:02 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-30ce6492a60so247090237b3.8
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A5AYgoCIZuweZdBNd7YVgGhy32HDQHHrgOjJeSFJHM8=;
 b=XpR7lSs0QNutGBZKV9812Nrp6furQLO7OxCOxCxRn6cSHrr+E0kptVyJIMSr5Olew4
 tPU8mUXPJdmsOpb3Oj7UYI9jxTNAfEYitJ6TBlpDmolQc6Z5Xf73hxjmsH/CosA8o6fC
 IoIh4ADiUOHXyWlghGlQPnrJ3cjMKpmUmfCM3NalU0Nv/ggDATWObpwTx9qJaYnh1bQe
 KHlF0cJXOy8SHrph+SXEDxDGXNEOjiCzjN37mw/8Xwqg3VaXufh5/WdpmkRsRqIWugyo
 cdC16hzX1sF38s++dVKJIRiNuSEMdrOV7MeK1N89HDu24Ndyhs1TkoREiHpHVuQn7Io1
 dTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A5AYgoCIZuweZdBNd7YVgGhy32HDQHHrgOjJeSFJHM8=;
 b=qjEymrbm1dHSffM3z/jzm2MXpWxxpDwCB+eeqxlVDmF4lCyfsgQI0e393Uw/Y86qa4
 /MSUgfdB7Vs56uXot9spwlvTiAgRdtwDrP8ZJZ9ZK7RC7bsD3BMIxkHGarINTKPmjq1r
 +zebkpqIW6M+BG7F+0c+msveW2HykT1Q4W3ZDl46km8sTHaEaVM9luZTG+oMiBGj4kP/
 RutYa7CLpfpP7MrpO5qvzgjH8YSkC3Dgq7qeSgm4ZqdzXqSbbOyqK87VyuXV2Feqwuvq
 Q0ft1ec1/EWkjQkU4esgsAhXId1kgvB6l3yqXvrtPBvFnKlZj5SWStPcKwVzctxYSk2z
 DDhw==
X-Gm-Message-State: AOAM532/G2IvczAXKU0RRntqNsKSRuL6BZy7EFkuxnFnTtthtn0jJAdS
 vEuW8eFIp3aY/y9FxHUnOSGP6J2m5FzuTfkNq+vhUA==
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr43414203ywb.10.1654792680368; Thu, 09
 Jun 2022 09:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-18-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:37:50 +0100
Message-ID: <CAFEAcA-wYmz8x90Vr9bdhSBEJiOL8du+qdu=N+0pe6nOyE_y4Q@mail.gmail.com>
Subject: Re: [PATCH v2 17/25] target/arm: Rename gen_exception to
 gen_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ufwEY/oud4Ax

On Tue, 7 Jun 2022 at 03:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
