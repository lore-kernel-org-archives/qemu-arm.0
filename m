Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1266357lfp;
        Mon, 18 Jul 2022 05:13:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sIlpwtGhvBLYZmC1nZKHUuTb3QVyUSkMnpMnxVzp76U3xV0eSx/LrYhYLfs5fM7aoSJKy3
X-Received: by 2002:a05:620a:4725:b0:6b5:f6a9:950e with SMTP id bs37-20020a05620a472500b006b5f6a9950emr633187qkb.464.1658146392255;
        Mon, 18 Jul 2022 05:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658146392; cv=none;
        d=google.com; s=arc-20160816;
        b=WaylgloqnykI4KspNF1D1PoOwHb5XpScCxi7KXGDldLqV4iuW7oCIZxppaQIQcvwAO
         jYIl+CxolvcwiOfvMpqkZQaDgK+vdGvycqsInsFZdgCm1ZP24n6TmL2B3shXot1ECWZJ
         qN4RaZFnS3DzQEoDlF4vBLc3R9xwGaZ/n3JbQltjofE0U4oV0IGYcgEoUhKxqpQ+l29x
         fSEYg+oA7yRNxmn4tNrW3FTylb2d636T9hHNkyFE+WZRTB+HHw8fhuFzM9mg4ny+y8Qr
         dHdilCAgwS1suTEwOz4or42n606G32kp8ykp5Mnpy4DjotAhw0veHrqUgGorh1JCU7XZ
         08KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0bEvq4JZ2l4t0TpcPn060hVTc5d5n0yzJI79z4Fhha8=;
        b=Xg8rcXVJ9MnPcfruqksw02p0nKGqZ9vbxVu5GqCixLZqfifs4v6cAOvX2k2t8JW9ov
         ro6fGur/JSHvUI1w6zu6dyVtZlG3FVOs2o4qFQJjLeAfRGGUQGuIxFtd+oFAO6++91zg
         +ZmxIEhSGMzZaiR9o0qLGj9gFyRffC28NO0ZDA5+155+6XW8F9HM4SGNGrxIw4g0Kfde
         XByB/uBNvu85xMq2CFWhiVlEQIMef9gRFqz5vIi59Pr12i9bDibLeRnxnIti84Ghu24+
         MV25Jb6rpalz2U4Xo2GlTWwJFYYCPINAq+feeSdG+7DKiAu79ZiXn0z4zxsgEwfhlY5g
         rnYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T4+twIJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020a375403000000b006b253209181si4827315qkb.169.2022.07.18.05.13.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 05:13:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T4+twIJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDPcd-000390-P4
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 08:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPax-0000lU-Br
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 08:11:27 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:41592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPav-0000Mi-UQ
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 08:11:27 -0400
Received: by mail-yb1-xb29.google.com with SMTP id 6so20362855ybc.8
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0bEvq4JZ2l4t0TpcPn060hVTc5d5n0yzJI79z4Fhha8=;
 b=T4+twIJbuIS9giIRbxP0Y7zXZznjys6mzyJLSEJ7EnmMJx6pLE968YOPzTN3NTkLFL
 Z8PXBsFZwprQlh/D0xCRwLBa9LepyY1idM3+oEpW09tBMVAmdyxWYBdBp2KEvsIxC2UH
 bOLE4Gza/F0r3f1EgR+5WsYwe19edZCUAWLnygOs/ehnRDAaha2JxwO0JQkLBZw1x8xa
 aKqtPaflcUykFYLL1+vXJzRvEkoG3Qj1LKdAFVj4pJxxtb3ViX2ho4+GxpbhYMqP639z
 7ElX7y36EjWEwdnu0iqgjlDtonXAfRJZ5emPg0799eS7XYBc2zytsUl5hM/UsmH0eufp
 7peA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0bEvq4JZ2l4t0TpcPn060hVTc5d5n0yzJI79z4Fhha8=;
 b=SPCNxfIkNFH/S8H9ZKdPzcW5Sgtv6qIn1/FKGwKtDkIcPtQ17leggyaog/SFBTsx0N
 FuN2MhVsgJzsygBcZSZES49isy33dfTmJw2vVhS7ELuW/BVxoPmlGqjakYJmQ0tFymEj
 4M414NDB9QvVBnHTKqSLwzeScHpTYW/OoNloQzV4+9V+IXoTC+VRbgixGSJm9M186Uxd
 ZxmaDDjUtSmWx0byn7qSf6hF30p4jilIqG+3spaRz1/YsbilNBDjNG2T+CyfWnWqYIfJ
 CBXUVFRVIHD/Nq0tADCmrJQzwsjasEG7dDn6/19o2KkYA7fs83Q/AilERqneMmld4HQX
 pK4A==
X-Gm-Message-State: AJIora8LM8LnzCz0+Fy+mFjkpBF1sUKpPnYvFtlxm2j+8cEjC3RLDd5F
 +ri+uS7ACtcAlAEdl2q0ElLqs9+I0FK6vbZ9aA+CFg==
X-Received: by 2002:a25:2f58:0:b0:66e:cf9a:6a2 with SMTP id
 v85-20020a252f58000000b0066ecf9a06a2mr29033649ybv.193.1658146280004; Mon, 18
 Jul 2022 05:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-30-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 13:11:09 +0100
Message-ID: <CAFEAcA9x-2eX3U-xfUyhnFmp-MZAuEtAmjs5NqLi+PkvZGhzTg@mail.gmail.com>
Subject: Re: [RISU PATCH v4 29/29] aarch64: Trivial SME test
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 5fpwO4uN/2m6

On Fri, 8 Jul 2022 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  test_sme_aarch64.s | 55 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 test_sme_aarch64.s
>
> diff --git a/test_sme_aarch64.s b/test_sme_aarch64.s
> new file mode 100644
> index 0000000..a5ef909
> --- /dev/null
> +++ b/test_sme_aarch64.s
> @@ -0,0 +1,55 @@
> +       .arch_extension sme

Can we have the usual copyright-and-license comment at the
top of the file, please?

thanks
-- PMM
