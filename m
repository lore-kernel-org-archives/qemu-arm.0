Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1534826lfm;
        Thu, 18 Jun 2020 04:14:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/CzNNXydVDPoRmA5UrVjAoLKn1vLSVNAct6lKR/8DiS3hgkLrtYuCJ/u7KAIlbqhk6hkg
X-Received: by 2002:a5b:b89:: with SMTP id l9mr5467301ybq.82.1592478890183;
        Thu, 18 Jun 2020 04:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592478890; cv=none;
        d=google.com; s=arc-20160816;
        b=AowoZ0GYioxruArd+MF94Lw3LdAr0++qq84D0cQ7dJNnAJMSciuV0FoatKZ25dPuEf
         iYbKtRcY0ZmAF5G8Mtk3rk448lVVjnfEayBJjz8v+m8+Q6+v4HSBE/iiXnHMi2pPSOB8
         PSzDYyFTsFrbsctG2Ch4eVikrgJylw0tTDtoTeMtNCsHy/XfxZyCnSfEOb047hLbb3Z6
         Hpk+CYwPUnHj2mIt4YMsjApUSnYwyz7dx5HysMTYXbdYRD8xawsOOEgLz+idheHZUb7m
         bRGRtYU0vKNLmqeLfLYL7uLastdW2Yu+gW/fR1wdWaQXGTJUtN94rBORtPFLLwcVTtDP
         a3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0rXg20TJkXLtN3v1tJPX1FStPIBVLi+Tb1eX8kmdZwk=;
        b=otvJ+fyLFw7tUullHBTtK2ayKQd02pDkBvGvWsGwZrTJNOkssfhVmU7GIWSOSHvQTP
         IUWOCFrQxE80umbAwm9P3aSoS7HttOPL+t/DQ/xhC682FHNhkC18RkpOBfCVQTstxQ4C
         uV5OPOVvWjvyx/pCIHaWhADs1BAwOQq94XUuLi9lLBVuYcBFEnTP1SejxDnCoba/iwxy
         hn2e1yW0ohp2AhArHmg5MBrsterMxpxxUge/+si5SEc2wXuwCr0OrZNsiXW4u0twq4TO
         Bh4EJmr6LJSwq7xrprqbD1mgEyhz5DCPVtQsbD0qkqAobVwYZofuiRtIWxAIGm2MtVQO
         jj0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XbWoBlBv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si2243378ybj.375.2020.06.18.04.14.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 04:14:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XbWoBlBv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlsVN-0005Oq-Ig
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 07:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsVG-0005NH-Kf
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:14:42 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsVF-0006p1-2d
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:14:42 -0400
Received: by mail-oi1-x241.google.com with SMTP id d67so4702388oig.6
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 04:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rXg20TJkXLtN3v1tJPX1FStPIBVLi+Tb1eX8kmdZwk=;
 b=XbWoBlBvwZumdYCpNqG855vUHaeJeA781jEtYwgC4rBxfOrDntcAXItVv4Yf/wA8ZK
 d7E5DPGsi3c+ax6mt1M6NEfIrimdac7VMVUyL6n25QKOZYcs+HggP/cFIZOhn5Sjh+TV
 wP41t+SfoVYZAkFQR2Xf8t1DYG4ibqi0yGZ/0uDoxVVMENhA4kK8Xtxcc2BGVDURJSII
 8rF6PYeflCKfABRI4VcibOdnmrTD1DI9b86hsRB51ARFo8iPef+wQ/NP9gtTv/VGIIbZ
 aVOgNT8WZDstIAB9op+ngj+WOu7p6/TI4s4ubWEuz41w9ibYIX6GNLnlRT4Cq8LIINCi
 Qg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rXg20TJkXLtN3v1tJPX1FStPIBVLi+Tb1eX8kmdZwk=;
 b=VTihqwMR/M4vXePOcP+nXDagdOUqINNsAQ9HIa5eTF3lbhxeqwEpQ+e2r0cRV5A55g
 5uyFYedRlLCGqP9rYHVHpHza0knl62uH2ZH1HbaZh95H3+LxYh8JulhTbH8hi8Ccot2j
 CLX/tjOS7yKiTa+wvhMxbTU8RK45kTHJhlHq58PkTCyNwKY8U/t668jIPk+2wk6F5O1c
 tqERO+I9/sBKuqCXRU1j1UCFcd4dPmEmS8buer8L79W7tIdZgcl9omPuvnp+kGC672TX
 zblbGIEHujod/qNzf2tMIQR8rRMnVmmz2g1R9xIo7pOGuaZEUPtBrsr5ZC/2M4GIrptQ
 b0nA==
X-Gm-Message-State: AOAM531mqxwAo7aCf8qz6y/NBXArAJUT0QryJRXCVW+yd9u5xp1tz1tu
 G3MgosWKfp2TQ16MH4PE6NF927rQdb5DDcF4xSUSdw==
X-Received: by 2002:aca:568c:: with SMTP id k134mr2296910oib.48.1592478879798; 
 Thu, 18 Jun 2020 04:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-7-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 12:14:28 +0100
Message-ID: <CAFEAcA9mRAP+Zj_zY2Ub=VpL1Pwi+2iD6y_T=b7ctW7x6aHWCg@mail.gmail.com>
Subject: Re: [PATCH v7 06/42] target/arm: Add DISAS_UPDATE_NOCHAIN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0XuLcRP9ikh7

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add an option that writes back the PC, like DISAS_UPDATE_EXIT,
> but does not exit back to the main loop.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
