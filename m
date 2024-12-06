Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp919470njb;
        Fri, 6 Dec 2024 07:15:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVyNdSceaoN7hawvdlQUnyOE2dMzMzcRe+eHKq/Fx3nIJNoIniTn1UEx0Ce0HPa86qPMuOLtrykXjopkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHlQBMT+cpTk7ISVRdU2p/yN7vqCAYdv7LdJaWX9Um0gQTH/OEp/H9+WDLpzjAagOeELnQc
X-Received: by 2002:a05:600c:1986:b0:431:60d0:9088 with SMTP id 5b1f17b1804b1-434ddeb5ab8mr31069515e9.13.1733498159374;
        Fri, 06 Dec 2024 07:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733498159; cv=none;
        d=google.com; s=arc-20240605;
        b=hxJBGJO8xHfOUJ3RtfExYLWtcBYzNwHLcyIrkBmGF7LXkn2KbGoKPTKNC+tzsiLoWu
         u59aKVSl/CEnrHFvi28U1SlULIihMjYn4Ls98u40Tcn6OMuFi+OLg3r3EauMKNTJoUBV
         cHXkrNYH3d0zJ1/KNYTBq4mcMA6JYi/Kngx6oYO0xx+G2rbndOC55aZqYLHLajsDeE/b
         GbRNQ/MXyqGuf4Up+VMazXlPxJlU0L94Zyoen/v5a+KZZYDmJitzaRRtzGNdiIEXEckv
         UbxLlwDooGwki4rHdPmai1alZt4ntODyWy7K4Mn/ofqmxQBtJuNu5z4L+pg2PcYA/uuJ
         yVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OSskhXuAt9jvxpfHFLEHi0ULAghIKMwNcZeQP8GAvo0=;
        fh=T9W1XI1JbB8IvoXCXc+4CfvXj3tcGM+2/jRI4b8IjMM=;
        b=WoLLwZ25UFz4tRIHkvPrSipsG1Z7yUflNVqRU4uZ3BMwGnHjhP+Cy3l6kogdGkO24j
         ISGEklL9A/Q/h12RZMT2dZ4M2AX5EMcRpO0SgI/VuCrvlAPm2HUQ1TfSR4M/gGz7repM
         0PVdiKZCqHUFACjGG5oFJmV+GwLsQpctM3HoGveUoYLCXAALjmZ58FNpWg4wEqCDsTd0
         BbCtsAzHgrfK0uJpi55gVDJKL9ZKthL5B0QnX7VdA5J+BstrR1DLBMlFE7DzNu99rX4D
         l5ESCX1VIR5tVHCtWlO8LK1HG91HEE1gEX5RgZb15gk0mJ6KoI7hSg8av4ABDmX4BYEC
         eCJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K3nx3LPt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38622b348b5si2090719f8f.847.2024.12.06.07.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K3nx3LPt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJa3Y-0000PF-NP; Fri, 06 Dec 2024 10:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJa3X-0000Og-2U
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:15:47 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJa3V-0004Dh-4q
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:15:46 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30037784fceso6366291fa.2
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733498143; x=1734102943; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OSskhXuAt9jvxpfHFLEHi0ULAghIKMwNcZeQP8GAvo0=;
 b=K3nx3LPt+kgwTlwQdkZX2c04kEIqJz3oO1I7+87vzGFGRmwaFCxzyARd8bFYPyXF1S
 o961EAAdZifJzdRAiTpGK2dpjSZ7hkmyaB9DD2jc3GWimqcGzxUJ3vv3KlqWkHIQ+ZT/
 aoCWOLKU5fkI9p1NiYxJ3XAOvEjdUtPWvBz2aOS29iWrRMDmR0yReM/z5alH4cTln9wW
 OInIEdcniNFeU3WkqVJ4KcLLFydqbo+Cf1U5Hg9xXaZHU/UBMPCJivXF5V0hygllqW67
 4Wwz4e40kZcRmMkq91TkLnXE5/dPtZgfL8OQKUjC5oCbqzvES1JukY/B80M1U9XH4zSl
 meow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733498143; x=1734102943;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OSskhXuAt9jvxpfHFLEHi0ULAghIKMwNcZeQP8GAvo0=;
 b=jhvOO0pF1YE8LJviofo35aNQaoP+zgJWJK9t1CsgYXKKTX/z6SpplfoIXy0C6nEbCn
 l0XS0RiUj/7oyWXLGmCUFwt2SPH4D13hXjVHtBopuCLfaIw1XWraddsX9ujHG2CTbtPy
 4tMdEUXXhdM2gT0dTHwDb2Jr7GJ4boSmn0lNeoU0C8JNevbIALgDZmnOaiavcsONepG/
 p4MNcE+igFJbVfWK8f3ueBzVozXoiy4pdMx0UZU7LtEDCRcM+jTUme9EeYBFp02+v1ct
 vtk+iuF2IyUNReeud3+zFrO1zYMA9dbObtT2fZg9wrCbgScg90eogVEuf3CsLuxjhgX+
 PzWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx33vAaDHEw4ny3ix/IHFQoyN7E3HOq4J2jOzVyCv93HdXqVo/6O/shRTwVjfZjJZLPPPA28SKxA==@nongnu.org
X-Gm-Message-State: AOJu0YzDA4ZUmeFd9QP/YwbJRHQz60ACKlcqktb2CSrI9dmnU7aYFgEQ
 eM6HhBhCjXuaKnhG7qKAAhTMTpjlJ/TKz2wI5m1ZzCUrvV1FGhRh579QEHAbaNnzzclubQGWED5
 AmxCxuPV8x7Lb1dTMKj7tat4ED763eQ2awELTFA==
X-Gm-Gg: ASbGnctTfMQ//1p8ZtHYHxV1jildDFNU8J5nMNTaBfEHYUe6VgrkJcKNd7ufrkAm8wQ
 Cl4PCHFKG9D8oBGOE+LFu0+g2FNORvgq8
X-Received: by 2002:a2e:be8c:0:b0:300:1f9a:6132 with SMTP id
 38308e7fff4ca-3002fc9f31cmr25085631fa.28.1733498143115; Fri, 06 Dec 2024
 07:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-47-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 15:15:31 +0000
Message-ID: <CAFEAcA8+qoBfSxyzsF+156p2Um9tKfBqmx-_T+J08ChZwXfOsA@mail.gmail.com>
Subject: Re: [PATCH 46/67] target/arm: Remove helper_neon_{add,sub}l_u{16,32}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22c.google.com
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
X-TUID: CBNzROoERiqk

On Sun, 1 Dec 2024 at 15:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These have generic equivalents: tcg_gen_vec_{add,sub}{16,32}_i64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
