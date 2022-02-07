Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp86830lfk;
        Mon, 7 Feb 2022 09:28:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwthZP2Js/6YDiGPZxxRLTGXKrmOxoZLST+mvM5hqiBcq0hXECY/jezE+kjrZQrktZ7atkz
X-Received: by 2002:a25:9d87:: with SMTP id v7mr743862ybp.657.1644254881238;
        Mon, 07 Feb 2022 09:28:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644254881; cv=none;
        d=google.com; s=arc-20160816;
        b=CaRs3jvETJB/eP6OTuyJtsjgw/6llO2pYVqeERR/G5YH+uYl0yQaNtDRC95HvIKKHN
         sGPtAnbJA/HawnRhv2qKVuqQ78Wi2gvFvFc27sD5IfzJl14MTNkz7yLFCq2TUEKfP0Su
         AlIJlTc6hPlzVZ2LE+cfyPd56H/iUlueTlA+V6tHsxu7Ifu7dLzqSVTFj4cnGJ1gWGZm
         l6ezmPvnqCug23NzXOGk9n7IZqgaGYsWJPfQftADIq/HVmQ/PsnmiglliC01UbNH7f2Z
         h45/grD8699v51T1dodKbI3fiY6ST3NB1RAgN8wM8BgRfQlF5vNIevbNeG2wAK8NMWOV
         zKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O3c7PgBM1oBMgj2kjKtzLExnknbz4TcFwcxE2Hx2Le4=;
        b=K3VluGOZRUjvG+/wW6tBL9NzbpsWgmjp7qh0N6GteDRLutMgS1HtquvjqBXCNJA1NN
         fmhAPyHcbS471cvdtcg8z0ZzRyKhwHIBam42n1ize5iXKAi05pG1mqT5yrcXcMf35hpP
         M4KGFAaP2xVKYnyP6A+VHTIJMBdEoAqYQSXH2UAthMSeSaZnnSj4RgYNUqzAn5LQPZ1v
         4lBUiAa3goXm+jz7Q1AENMz5e2QZk/lK+XgxfVaNOvuWuD/PVJnkaY3FTh7LcUxz3q9j
         tMHSHaj75Mx5gMF+AwSMmHuFqMdJLN5cd0gbGmePJh29oSkaOoimGLlFvhBsfDu3vBBt
         jCBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XlPyXQyK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d192si4551000ybh.761.2022.02.07.09.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 09:28:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XlPyXQyK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH7o0-0006IF-JD
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 12:28:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7n5-0006F3-AP
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:27:03 -0500
Received: from [2a00:1450:4864:20::336] (port=39468
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7n3-0006dH-B5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:27:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso14803927wmh.4
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 09:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O3c7PgBM1oBMgj2kjKtzLExnknbz4TcFwcxE2Hx2Le4=;
 b=XlPyXQyKleHur+pwSLI1qT8Rh033oAZ+GM8tSrRNd1epNxEq47Z6PP7I0fpNc+UCQM
 e1z4Nuh/jLlwaeCZ2mjpuOC4AlZECd0cQAa68R9Zkv9dEKPiz/q1EoOrowMbTtBcizGL
 +oRD64qp7b+QrHbXLPeS/xKYUHS/ICRdV9KGCVBCjYE7sE5/fzlHJHZjdN8uieFJ2l4P
 JOvuj0kmg5j5QURgmBt/9HqchEsDEUmFiS7PTKRJ+3SjzL2ag/6Ykepv2zknXm6gcsKw
 LCcyzKEG5hGDhIJML+/yOlQNLSJp0EMwC838zwdG4W+AUjkE218vXp0IwvIAg9OASmNQ
 Q/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O3c7PgBM1oBMgj2kjKtzLExnknbz4TcFwcxE2Hx2Le4=;
 b=LgyanO/QD6+TD/rEVONomsVzPw9JVqGGVPkCSRppV6oEg44ZNqOQqg7btzLIXbPzL7
 Q8a6qf2a7bkcUOTi1rXsxnyqQ32C3g5a+/OSnaXYaebwESxgs3RfoDwlDq2FlgFuKYbS
 +ui6FuWqUwc7kwvkSnCAa1tK0alY0MnOVvPF7rWcmhT/0BUQ+/eX/SAXpWk8jWiHpEid
 sP6rapwKP46OTDoTuxtFxJrLleEyJuDBBechIPzGB6ndWJqdW6Y3EXm2qm5DBryl+joV
 LVGrsUftg65Y1koMoIcEE2UbxfvPJtATrWi2+tidCfg7x559KnR0QQdQJom8PYxrgVFf
 MP6A==
X-Gm-Message-State: AOAM531jjdSakmhG3aPN6jEe7jFFy8veu9mZiyVVRgHirEUsaqSDGp7A
 9YVS3nr2qEkQ/hk08gxjdYsBPDW1o2e6ehAXDsRHIQ==
X-Received: by 2002:a1c:544d:: with SMTP id p13mr3734420wmi.37.1644254819914; 
 Mon, 07 Feb 2022 09:26:59 -0800 (PST)
MIME-Version: 1.0
References: <20220201192650.289584-1-git@rpls.de>
In-Reply-To: <20220201192650.289584-1-git@rpls.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 17:26:49 +0000
Message-ID: <CAFEAcA_Xu=Gh3O9ibYyqV9N_3-cjNb1UBTZcu+Cx_+TR1MDg=A@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/armv7m_systick: Update clock source before
 enabling timer
To: Richard Petri <git@rpls.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1AopdX+2NXYa

On Tue, 1 Feb 2022 at 19:28, Richard Petri <git@rpls.de> wrote:
>
> Starting the SysTick timer and changing the clock source a the same time
> will result in an error, if the previous clock period was zero. For exmaple,
> on the mps2-tz platforms, no refclk is present. Right after reset, the
> configured ptimer period is zero, and trying to enabling it will turn it off
> right away. E.g., code running on the platform setting
>
>     SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;
>
> should change the clock source and enable the timer on real hardware, but
> resulted in an error in qemu.
>
> Signed-off-by: Richard Petri <git@rpls.de>



Applied to target-arm.next, thanks.

-- PMM
