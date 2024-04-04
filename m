Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp294891eju;
        Thu, 4 Apr 2024 07:25:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7CNFcySRFqlBMbCcpHcNs5c9f7bZBdU79CazAiKvgO4TUMwTbJnFZXEuygMTagfVH9pVvKBuVzzD3nl0h0vyFZz2fvAB+
X-Google-Smtp-Source: AGHT+IHWkwWFw90Usi5OO9rvPEDbWlFpGmiVKf8oA2ESMX+29+SVnRmM9lKT0DH+5Q9RDRO0Irji
X-Received: by 2002:ac8:5750:0:b0:430:eef7:2780 with SMTP id 16-20020ac85750000000b00430eef72780mr2847134qtx.63.1712240736714;
        Thu, 04 Apr 2024 07:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712240736; cv=none;
        d=google.com; s=arc-20160816;
        b=FahMWshjpf2tJ7u68p0jfTvbZh/0TRih52G1JR34x9QehT5YuOYfGpmXSbH34skwIY
         0viEmn3O003vUtLk+ejZarCY+vSeDNTE3S0nv1ZVUbYcFykxo64tjj5AuAW1xsX288a9
         c5RNjGQeVhmEAn0VVkw75rldNEHwR5lBhF0/g8HHoC61HQKqlgYLeuZp8/WIH5QRbBsS
         XVWsIO/3uOaTFAnuQGs/oZjX0EPP3hVUZaIei2Lw4RxsTOnogtKuVvsVVD3apz/Lte3b
         X+zFESS0O7+2ICAadMoTvHFpjd9ITJD4bazkmbMTr7lCCXIYCmpJkt9OeXAQrWy2DbYc
         N2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c8ExWDHR6fUpIq8ES+mS5HgEhWRKo0jFGf4s3D+PgJI=;
        fh=nmGkMYP1FYNkZxc/6WJYHspEDzjh2c+YHO9B+Ow/uN8=;
        b=F11UX8CDsUnCW4FzD4xsYAdbAGQBvDOaettdk2ZiLiVjhJ+NonjHKnKoUe6/qh8n1n
         HPTQXYUNh5SXJqClnGyJmWnhnB25KvjFVPJPeCR94XQL4byW7pVorykBvZ1XH18IkxoN
         bHW0OX1lP2Hu/V13+bG2aBTfcP88AYILrj0M1sQB9dUPNt+AeHYKQ8FhnrVCqE51zHyW
         wxfDvfzhqGKev0fVxiy61RLkJEikaDka8cybh9ZZ7sx9uIzfMieUjGWuX02E5p5kzVmx
         OTtKExQDjU81Sm2OvdqKKeNwoXai/qVXEjpVtSqI5GhJ7CICKDeRWSRsa/oNevVcqkNY
         SuZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tCl7tGzq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a05622a04cc00b004315e360db1si16576083qtx.193.2024.04.04.07.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:25:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tCl7tGzq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsO1o-0003Yj-Rf; Thu, 04 Apr 2024 10:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsO1l-0003X1-1P
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:25:18 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsO1e-0005xX-W3
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:25:16 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e1e6e1d01so978125a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Apr 2024 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712240709; x=1712845509; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c8ExWDHR6fUpIq8ES+mS5HgEhWRKo0jFGf4s3D+PgJI=;
 b=tCl7tGzqd54fRY+H8denh7i6qrnK4fusDtNn2nSoRP2TA3Ay8pQRPqPlATJKcgBg/r
 XXkyMnZQBH0J5vk/F3SJz/lyxX+61Sv2qMnt81BowzwLkLrifYyLt9CGdogh2d7KK/o8
 pWJs+0q6K3/S+hMkfYHdFWuxvkdFkJSc382rzk41MzMq8dXXArTjhbQFUYN7jq+vJlxQ
 oSbLUrYlIO3pEw6OmbuQh1boMenTCUbUuMGmQyZaKAkbYBpSs5uWBx1/SdyTs2LBIJo1
 g4ZfbPjNpEzL3TNcyyREmMRZUDzcK0W1dhNr+F3GKucEGj7YENs8l3/sUvxAuMFnjDUn
 vLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712240709; x=1712845509;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c8ExWDHR6fUpIq8ES+mS5HgEhWRKo0jFGf4s3D+PgJI=;
 b=KSRnsiODLvzLCcuyJ1lvoSmCHkroGCRiXRqtUT4TtL9EsBNRCpw+B9KkMCZEETCtjG
 qKYyS0p0kQYEzILRks7XGrpyuhJWawT8cVIxFDPWN2WZ6JapUxIwfrR3mQVCOPT2smpL
 HPikaP7nI2rph6oW3Mlmys+2f5GZYnFvjy/sw1I9S0qOTeCMwU5Wdo2wQqIP2V9nZoiR
 Htv0eJqfuno/oRQtiIu3ERasQgLJN2nM1tYEydTx5Vx2uRcODPnhopNkrbi3OG6IrO5E
 1SDJWe0nxoY29qE86IipJeH2xsUiKDEHG6vKPfx4rOARcX06x0Pc3hmF9yv0YAuhMpmo
 tCXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKNFY3stu2LuBQUxINI7+izlIdUGYDrxtxR86oZgzAALjewTHZwIz8hIqVxHnicsSL+Ync4b+lpKvUevwDH0GHBra1
X-Gm-Message-State: AOJu0YwZK9K3ZWvqfO8J4yt6+N1j4d9avLpUsknU61vYcpkq9+TrTUb7
 1r+YhVLi2E5C077/Jj06QMsQ2Z6PCJ4Mn0Ca5OCMI+aq9QPHfZ3cDSjXKn4ufkszSPoMHpINMJy
 LtfLtH1IuqsDpCc1ftfye0HgbhlVjn2HM5ScPVA==
X-Received: by 2002:a50:cc82:0:b0:567:ff26:4bcb with SMTP id
 q2-20020a50cc82000000b00567ff264bcbmr1607896edi.30.1712240708718; Thu, 04 Apr
 2024 07:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-18-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-18-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:24:57 +0100
Message-ID: <CAFEAcA_2b3R4KMyiO_Pe1zH9xBsUFjUW64vL3xEwi6OZQ=Z3eA@mail.gmail.com>
Subject: Re: [PATCH v12 17/23] hw/intc/arm_gicv3: Add NMI handling CPU
 interface registers
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: z+CLzPSb6fai

On Wed, 3 Apr 2024 at 11:17, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Add the NMIAR CPU interface registers which deal with acknowledging NMI.
>
> When introduce NMI interrupt, there are some updates to the semantics for the
> register ICC_IAR1_EL1 and ICC_HPPIR1_EL1. For ICC_IAR1_EL1 register, it
> should return 1022 if the intid has non-maskable property. And for
> ICC_NMIAR1_EL1 register, it should return 1023 if the intid do not have
> non-maskable property. Howerever, these are not necessary for ICC_HPPIR1_EL1
> register.
>
> And the APR and RPR has NMI bits which should be handled correctly.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
