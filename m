Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3663862ejc;
        Tue, 29 Aug 2023 06:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYQXLWZYkun31bh3LPVBMQKqObTHONrE7smnok2r3DaJx8J7HRQwv43c/SOtOCcMOU3o9L
X-Received: by 2002:a05:620a:29d5:b0:76f:ac3:806f with SMTP id s21-20020a05620a29d500b0076f0ac3806fmr3208963qkp.13.1693315699259;
        Tue, 29 Aug 2023 06:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693315699; cv=none;
        d=google.com; s=arc-20160816;
        b=VqwHt9aAXmF138bZb8oG3KzEWYq6JaayDe/xb0IqeCk+yRNezuDopA4kaXuIe/OPAT
         lhj0q6gScTHwhqh2Ztna7oeUxCNaWJI5ZK6+P4e6mLSf3zq/nF0XRgAh9StyLzoPREQN
         l0p9BcnE0SgKxlx4jEd601K6ocgeIhhonslnwRY58TtyJvzwSc3zGYI+EMqlCuPo7+GI
         E84bpkXBjISI2UHEZvFMhSDHvrAoY5LIgrbw7EHTDCc1S4Dx2OuPNqXVgBI3i0jgu0A9
         2f/hxhYheHE/OnTmXTaUPf3jJyIdRQY8YlZ6B1Y35Mp1XWYpqJRWPEfNEjyoB3IjRBPt
         G5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hdCr/xaknJMc1L+y1DfMYs+q0IfAPJxqGX0jNCojQXk=;
        fh=KN15t2ypiO1BgVdQTfcSGbN7T6gS88c/uIatLiZkeQQ=;
        b=VEXmUxivwRU50e+JcORHEckBI9+4Yeg0ejYevAkLF4AUJOyAE2RPc7Xshhmftd1UX9
         EtgU+UN/jH8e1gKGNQBEY5/iqux2DfnUq0uAAcIe4wISEYFIONHqSM9A81YvjRJ6d0Bb
         vF9r0KW3J6ydpvTI5tUXdzJ0a5OX3zeQ+u9lJvujJFCXW17KrXP3d4y/WDWRkuAFqkFL
         o3X56bpd3PFZC6eB0vQTO3rzKbKc3bLZThXow+shym9eQ1szYYD3SSC+mBw0A/CTkDsO
         HkilvFDKfLAS80XY78Zgg4jKmUS9XF8tTxQDpIwirkY7dVwv2CaU0fNoT6WBWgeoQjJz
         et9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X4NywOJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05620a44d100b0076db4951e4dsi4024966qkp.735.2023.08.29.06.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 06:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X4NywOJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qaylO-0003fJ-Jo; Tue, 29 Aug 2023 09:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qaylF-0003eQ-AJ
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 09:28:02 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qayl2-0005lg-Td
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 09:27:54 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52a1132b685so6137952a12.1
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693315667; x=1693920467;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hdCr/xaknJMc1L+y1DfMYs+q0IfAPJxqGX0jNCojQXk=;
 b=X4NywOJrFgNOwjuz3ZYkxVcwkJV+C6witG6qysDkcHQn8Ceq4t0v+nEft6ylM0DAPv
 tERO/+d18hpG6AwqqPIa6ZK4J++ZEMkOPPoPXOPSgs5tIl6MvVzv+Lj+7RDeaAaMJbPi
 sOkabyA4WyGJoGeTL63aUiMvqoh4Q+0iM5faNF5pylooFsXIAxbHt7lpV1YBaoqC0+zL
 UFFrCFO8yCerp2HFP6ImQm9uCkpbgwI6kWeQk2bIFnz0BwksMOAPYS82o8zQ704wyOQU
 0BeZOHEEMbXfbaVJ1SF1yAdUInBlXD0oQPEELMUKWp0qcuCdLmve7m743++ff36Df3XD
 qPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693315667; x=1693920467;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hdCr/xaknJMc1L+y1DfMYs+q0IfAPJxqGX0jNCojQXk=;
 b=iK+KrZQAc7pf2Sw0k8lKnGm4PkcKGHM7AQ/Ju/XALN/rA+fCDoKfHOBsSQ+ApAIJ0O
 RTgGOMlhxXkfZRQWpEP/6/uHFELMI45VEX20J+RflrU5kOeFiI3oVp1vnZoWv7PVfaLJ
 Ls4sD1j5nT+LrRuhC5wAHd0Gx3cd8wXe9bsSiAgU4YvGV/CLrRfqfmhshh8PCKR/Hllr
 qOTPW1uMy+x/tjyyD6k2CptZd2hnyLBkKy5hNNZiwrSbrDwPoDqqMg7oMqJNsMduRhxW
 XeHCiqkVg8uIQF5/Wj6altY6SvBLQ8/tujhDre1h7E2t9y45E9fXY5jG6w42PKG4PmB4
 ADDg==
X-Gm-Message-State: AOJu0Yyp2zEiP9bSZbA1buq8oqd3lLamimtbfrJTqj/UhRr+XFHl0d17
 J8ETsCb/87mW0dog3Ez7X/bMcD6C1dWE0slRuo/2Xw==
X-Received: by 2002:aa7:c741:0:b0:525:73dd:4f71 with SMTP id
 c1-20020aa7c741000000b0052573dd4f71mr21510042eds.14.1693315667300; Tue, 29
 Aug 2023 06:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692964891.git.jcd@tribudubois.net>
 <d579043fbd4e4b490370783fda43fc02c8e9be75.1692964892.git.jcd@tribudubois.net>
In-Reply-To: <d579043fbd4e4b490370783fda43fc02c8e9be75.1692964892.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 14:27:36 +0100
Message-ID: <CAFEAcA8fnJSJ=xauxDv_GA0hHqtbt-ZfcX-g72ThiK-azRX6zQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] Refactor i.MX6UL processor code
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: r2/f3cRRa8G4

On Fri, 25 Aug 2023 at 13:22, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> * Add Addr and size definition for most i.MX6UL devices in i.MX6UL header file.
> * Use those newly defined named constants whenever possible.
> * Standardize the way we init a familly of unimplemented devices
>   - SAI
>   - PWM
>   - CAN
> * Add/rework few comments
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
