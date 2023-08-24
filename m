Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp795945ejc;
        Thu, 24 Aug 2023 08:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlC0dlsNhvOY24z8TDHWJQprdADQVMGMOKR502tQju+DOuvRWdvdHOM+r28b4xVf3/4heH
X-Received: by 2002:a05:620a:f04:b0:76c:8e13:75f0 with SMTP id v4-20020a05620a0f0400b0076c8e1375f0mr20833581qkl.5.1692892155910;
        Thu, 24 Aug 2023 08:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692892155; cv=none;
        d=google.com; s=arc-20160816;
        b=z+5+1K/OgL8fwiTL5xiUWl4WnhgmzMM/MkAbdCeEXsXUWOotfpWaFiL633/QHTCl6F
         iQQYi1i9X9JksYVrJFRbMGdtNecuwWHZiRgrvUZ6S6uqKCOH2V7FDG1A0UdVbIpqTW4c
         HIw5HK7bl6IUuAkN5bqkjw5XmpBTT80rphgqIj+l48mJ6YFBosJZd31gUkcccmC1yK+l
         1FCB7DRnjAfJ2PumdTQ1d+trDN3c/2X18iIOmK2FiI6SHlQaF2RVqfM5eTpQ81j0pLtj
         NyOiPT3oiSaAK4Iaje4fnJ7EAzpMwVPouqiNt0YDgiNvb/8RzelxdxrCyOWZMaH/IOUu
         zIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UDq8Dezpxvvt9e6JOVCWELUDSTQyD4yuLBza0seT8Uw=;
        fh=fQSWUkMuRxigFAyrwqJDZVDXvGgDP9IGeNAJ2g03mw8=;
        b=r+rgwSzD6GQ8pJA/0WXQ9R12FOJA8KUbQ5PAaF3gi+fRmenKM+uMAD8FYHPCTWJCTI
         2f62bhq3h2+JVvoDsQ3iVeC/9H3Z9XRt2hquTDh+pG1X29a3Q2GdhdhccDpvffxbxU9G
         GQVpRMeroko3ZQ9dDlt8kJO6mwJZw4v+zFit7mkNuB6b/YCJXfxNcaYgl+cA44vjp3oy
         0+HApVGynt4kJI/dDgk2eHMZ/m1kFB3JLprLPpZbJ1o7ntQjypmhbH+OJfjmw7KXzH4q
         ky56D7bLbHCc5IHxyRhBCl3plH3wCqDdh2l1N2DMnB2d7DxZPjwt7NyiVnNjfHCEmrdQ
         Roag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YclajRul;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de13-20020a05620a370d00b0076daf00095dsi3578718qkb.747.2023.08.24.08.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 08:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YclajRul;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qZCZx-0007M1-3L; Thu, 24 Aug 2023 11:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZCZu-0007Lp-FF
 for qemu-devel@nongnu.org; Thu, 24 Aug 2023 11:48:58 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZCZs-0006nM-C8
 for qemu-devel@nongnu.org; Thu, 24 Aug 2023 11:48:58 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5298e43bb67so82018a12.1
 for <qemu-devel@nongnu.org>; Thu, 24 Aug 2023 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692892135; x=1693496935;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UDq8Dezpxvvt9e6JOVCWELUDSTQyD4yuLBza0seT8Uw=;
 b=YclajRul6Wh7+jpqtflCtYYsCLv8mOWWY5CdkXv2axuzW/1XDH/XdYTQmf2vK3gl1+
 oEJ4mfXLK1OrQCXaCGDaKOC/BTnIwJtXcH+cfR6x/zz2f7RzKRKEIBC0qNGyhgRD0KGK
 Hl0TXBiI/HkXFyS4XiULmEH1S+XRq4H/7UKMEH6rXC8aOeD7hS/4qKev6rswG8fpphzU
 MHnpF+M+KL+fhvPQ+COIlumfVEfw6RI0utwuOaTV2IsCxyltAsUX5xWSv4PtZYH7Xmey
 4i5CarlcK4caGx/z9RLZ6h3RudcDxrQUezRqEkA8kEgBbW/KkyOMxW5MDSwSzOHTNpVq
 bSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692892135; x=1693496935;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UDq8Dezpxvvt9e6JOVCWELUDSTQyD4yuLBza0seT8Uw=;
 b=d49Qu3CUt0aPSEuyWDML3d6hyWyDz4RaE1ymzYIqDrp1+6koZZ1Qzu4v0NoTfnEWLv
 +7vTaU7mfGws7y94ConUr+iYdbdl7x0Ns31E7xFFCoAS4k+ndAn/ywdvz7S2L4khKser
 xJKlfLfDFbTMJLhmPomOakJl76DtTnz/MQFL5to/V8PzG46ljLWuVmDYoM/Jl70GgoWD
 X3krRbs8NAdQjF9rK1aqC/Sr1ShKZU3QS8Z/MN/wanAzNLj+kW2ZAUJZYfPL1FMtSdtq
 3FlsvQ0zRSbgtHeeeK9No4ZBaYQhvvA6Gec27fYAiLO1A2pf6AHpVwoQaChH589GpWua
 qsNA==
X-Gm-Message-State: AOJu0YwJiKXFglpxF48/yCe/PSDgCpVaBbQXAO3bfmuG40PjrkUv2tXD
 FlMXAES5t9xldGTX46mrJu18LBiXsB7pPboXK+7rJ8FkleKJqElE
X-Received: by 2002:aa7:d952:0:b0:528:9284:61c6 with SMTP id
 l18-20020aa7d952000000b00528928461c6mr20105992eds.0.1692892134855; Thu, 24
 Aug 2023 08:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230811214031.171020-1-richard.henderson@linaro.org>
 <20230811214031.171020-6-richard.henderson@linaro.org>
In-Reply-To: <20230811214031.171020-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Aug 2023 16:48:44 +0100
Message-ID: <CAFEAcA-VYouvS2+wCbuS3YtTawPRW1OkXHQrxaa7xF23bVknXg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] target/arm: Introduce make_ccsidr64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XkWZrWXm7Jzi

On Fri, 11 Aug 2023 at 22:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not hard-code the constants for Neoverse V1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/cpu64.c | 48 ++++++++++++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 16 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
