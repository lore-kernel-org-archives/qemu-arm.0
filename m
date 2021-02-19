Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8956359lfc;
        Fri, 19 Feb 2021 03:58:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwR2S07R5KilOL862DJATgIOLjvfZkxVrWAPy6l9AO/8ebsLyVw2ttUOlXlwQ0oJiIjLwmj
X-Received: by 2002:a25:3345:: with SMTP id z66mr13328026ybz.466.1613735920231;
        Fri, 19 Feb 2021 03:58:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613735920; cv=none;
        d=google.com; s=arc-20160816;
        b=aKVSDbyffxfAbH9iqWa252Nps5SAQK6HL/le9Z+/ZZyt7ZmRV84pCaBZs3Mk5NBSOC
         jPnUua+dEJK/DxSImIdK4alxUVhSO4MVfqlnTKjBDKzGdy25yuwHyDMAzPpn8UnerNka
         vy3Uf1kUHn9ZWkvlvp49l+XquOdq6ZZu44NGF6hByKUWJbM7ghsFqjWwiBOBbcLkPYCo
         63mS4CkxxureEZbnVg3+/5DE4AK1muWWSnNSDM2V8S1yX40u3+WbQWyqupKT6rFclxUp
         pbB6FYYnp2VQALOL/SEdsNHJ9bJiGzYqlBAi+Ng5hjwCI+HPmXDIuFoN9vfZ8W/R2E0e
         JIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xHaDW7wT168LocZWMMhdbYT9YI6SMJn2It6tA9XuCxA=;
        b=uGZ/u4DofPmqCRrx19ARsDjyr4BIySzlyZORmPPgT7seYMCUfPSLalQLz+iavyY/GK
         KW2VUP0U6BVuWlb1/cyjjCkmABtUVb4XSVkoUiAgPN1R/DHMHT2axkJqbMXUIvUgElqX
         IshnE1X0zRCiFkH50edN68vhIsF3Go+RiYhtie57kcje7PBOPD/FT+zQVgVl8S/T1hfO
         6+O+yP91hoRHFKwE2DPdk1Xp666zspJw5MLklRWNwhwy7E/SyTr0p42vgcQ80xcPxy47
         LPI5XPVG1e6n1MLugB1dMOiK6rhUNseAXRuIYY8xUmJ7cT+23883QJy4VCHiXTqMwZP6
         fOEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z52qYzaC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si8521483ybg.443.2021.02.19.03.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 03:58:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z52qYzaC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD4Qh-0000F8-IO
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 06:58:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD4QV-00006v-UJ
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:58:27 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD4QT-0008AC-0F
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:58:27 -0500
Received: by mail-ed1-x529.google.com with SMTP id d2so9408732edq.10
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 03:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xHaDW7wT168LocZWMMhdbYT9YI6SMJn2It6tA9XuCxA=;
 b=z52qYzaCUFH/xrItP18F+r1k8sC1CpGa7/ZwFw1TD742qzvBahNB/nyyobJenrN3bZ
 GMoCxkwJUZc6nXEjydfusV3CctVpBzlpa5O8P08p4gQmNbdABCM5Jy0d3t+0lnWTx4Pg
 975ai7PbaXvoscM3YoCe8dwUeOV5e9Uj/RYYFqNu/JEzwomS2iyccQJ7S3EDdK7ZWlLP
 az6QsHEASTUBXxw10aLrezlSG+VWjRXYrkEwR0CtFTIyRjs1UkGQNJlAtrQqYhydoLP4
 UAW8enZiNAozktdmHKM6aE7fdl+XZqWbavJB204xM/vZDe7zbTQkgZTXhwpt+/uf/h/r
 T7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xHaDW7wT168LocZWMMhdbYT9YI6SMJn2It6tA9XuCxA=;
 b=GIjnIw8gwGoL9kgmjKa3DBL/w3sjflovfu/sb+e2y4hDyEXlgKnXNIf8ueVeu8hc1k
 a6xz1y5eEhSsNnWljzmipTrdmhNfq2q5WNep4EJxKMzEw/iD727ViO+C4BIsUNE68ckW
 gueg1h5b6GZWZIR25yK0QtHJmVtxmNS5n4EYK4ompCAilPARrZbZrbiMEdUnc9Wbk+Ob
 ucdTQx9f/JH52tCv/w3sk8JlJwE/Vi5uJhccbuAWo98ZpOt9BpyNamvSYbKtiB2F7loB
 KbmrfHZuSvVqozLhDfS797dVpOakIl3qqD+ICpSDwaJa04cfyihx9SXXckW0fq9qF3Yk
 MOeA==
X-Gm-Message-State: AOAM531JszmxBXAmu7VaM2FAhCADkBa2qqgIBAKdOHaciv4QCY8uRY++
 Be15bZfYMbe0+4VUMSBCXLy4vv3oxdjFJQ4yxROP1A==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr8586919edd.100.1613735903486; 
 Fri, 19 Feb 2021 03:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20210219115123.1938686-1-f4bug@amsat.org>
In-Reply-To: <20210219115123.1938686-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 11:58:12 +0000
Message-ID: <CAFEAcA_9nuCvVrhDZo=RQoFngpY=ZrJCOw9NQx9A9GF_BmgN+w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xlnx-zynqmp: Remove obsolete 'has_rpu' property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O+2wjP0XVo5p

On Fri, 19 Feb 2021 at 11:51, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We hint the 'has_rpu' property is no longer required since commit
> 6908ec448b4 ("xlnx-zynqmp: Properly support the smp command line
> option") which was released in QEMU v2.11.0.
>
> 3 years later we feel safe enough to remove it without using the
> usual deprecation policy.

This device is marked user_creatable =3D false, so the only thing
that could be setting the property is the board code that creates
the device. So the property is not user-facing and we can remove it
without going through the deprecation process.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
(maybe noting the above in the commit message).

thanks
-- PMM
