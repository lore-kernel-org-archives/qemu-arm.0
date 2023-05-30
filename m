Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2193094ejb;
        Tue, 30 May 2023 06:56:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ez2mZRxPlOZOQTdp5UmOfTw7PLOnw+Cr7hY+rUZ8x0ZnsZlPd0mMMWbBGvCmeceZuym5l
X-Received: by 2002:a05:622a:388:b0:3f6:bd82:c01b with SMTP id j8-20020a05622a038800b003f6bd82c01bmr1831502qtx.14.1685454968372;
        Tue, 30 May 2023 06:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685454968; cv=none;
        d=google.com; s=arc-20160816;
        b=HAnYgXSGjeHLaD2m/hN/425DDHqfYnWVLgJB5duCnq6ePHtC9MOSABaGMC4TceV+hd
         /8KwGFuA7cqkeIc1rCyi8Qwfx6kJU0zOsUl2PsU9daM0K/4+SZG6nCza+nIE41YUnMqO
         r1MLNP4g5fP1qJv7V9P2sH9GYFln7SPpHnyNV9QpXPcPrrMDbLSn4Hq6egstcsUSbIBh
         tKEPRO9wO44CHybcKP5I9MQ9nSQpI2jV9Brncekr6fbdDN8M1pfzMIsWQi+RgjBuBaK6
         bLU7nl/2pNDGoUj2eqdsK249S+lPmGY4cZWNqu5W5TlXtX8H3FacJ5+eWn3ZfrCpTjyf
         uOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=60unZDDwGfuvdk6dG9tDoSIcS216KxmEu9cvt5rLniQ=;
        b=hUszdbjx2PDpPBtnCdWKxAdbar5fHm8MLq+ERfVit6FJmYYG4bUbbGqgVqUZjLU/Pq
         xt+T0+q6wmd+4TcqSPnZ57oGXZ1cENfsNqw5cjE5YVwUHkj8E+XiZErNQ8Jkk7Ha9Qdd
         8CdUTwflqrhLwjjW34u1VoWaBOYEBw/c8wc/uh06a9A7cvdRyl+XVYI3ND4517CLYiCy
         FxLJmoB/L4vYEw3ZVGfThQQHx4JHX8sDEOqWaJUgm61mFYvjWJ8j8OJ6iBiifukFe+Bd
         xvDDiPqlFnEOVjhHgQSb9wq1OVVASl01F8IDEc7/A975m/wr9SNoNa4hBFTQfztyJ5Rf
         7HDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iy+lKUdg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u35-20020a05622a19a300b003e6332a70bbsi6704894qtc.512.2023.05.30.06.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 06:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iy+lKUdg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3zpV-0007WH-8S; Tue, 30 May 2023 09:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zpS-0007Vz-AI
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:56:02 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zpP-0002T0-5X
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:56:01 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2af318fa2b8so47208771fa.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685454957; x=1688046957;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=60unZDDwGfuvdk6dG9tDoSIcS216KxmEu9cvt5rLniQ=;
 b=iy+lKUdgNFeNBemU+idh+r9QkhNYOCYby9SLtR+CDyd5OLwbrfvIpRsFYXxCEX8uZU
 th98jfR9eL88O3+VobqUA+FJvFxkw3jE3RoWj/JoG1Pu+YgmRojSIvlxIm/JCQ0+/F26
 0kWEk5Yi09OGcDff0puqEgljPaDaqMpsnHWT+yYpL2JnmtB3qhrL/+kGzdhbglJsI3hk
 KZyTiKZ3FdqdTgTtmQG6FG64/hNb1t49VofPCRb60I/VZZwgRdgYZSUSvoxWM98KdjkK
 3fB8SPf8ae/+jRXoQ4zsCvfZfINkpBNcn5ejxCA2DFzKKgCZN4XrzC7Bwzd2Hpo2dm29
 rOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685454957; x=1688046957;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=60unZDDwGfuvdk6dG9tDoSIcS216KxmEu9cvt5rLniQ=;
 b=PQGyElomK3hLZWg37d3pE4xAq+TFkuphDY3HnxObbTpyoNQdL5n7+z42Gw4C+oO15M
 RbLCdLHXUyY3RV7yEa9Td4E6L23n8aYI60V1IFhtasdFzKfROKlCu2EosRT3DXpPUO1Q
 //IbCG+ZDrbQH0mEx6NEvzCf5+FxvoiDbI5pWZjC8vb4K5QaYTliRoZzHlysG+pIs6sx
 fxG4TIuyHQ8jTyOtUvF32WfoeQM10oo073B7i0ujVO1f7xWWJ8C7C2VVUzLuADJRyZyi
 yh8tC/4B6TfhueTGoLFZ/l9ZJWDGEeqhe/MtFayh1m0wetWCJjp8n6xWvmvDtrytQdgm
 dwOw==
X-Gm-Message-State: AC+VfDwrIn+ZqsiPrP5izZbRlCbX1thn/Vx/zuiY4CleaKPCxoF8Qqkw
 d+ANPuZ3MYMEihUXxs2XqjeIxV7YTkTyPCYBJu0l9g==
X-Received: by 2002:a2e:868e:0:b0:2af:1c91:d712 with SMTP id
 l14-20020a2e868e000000b002af1c91d712mr884174lji.39.1685454957414; Tue, 30 May
 2023 06:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-9-richard.henderson@linaro.org>
In-Reply-To: <20230526002334.1760495-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 14:55:46 +0100
Message-ID: <CAFEAcA8e9b3ivsyEK=knxrb1S24x8DYgynj2Htm3diWUOrUv=Q@mail.gmail.com>
Subject: Re: [PATCH v4 08/16] tcg/aarch64: Simplify constraints on qemu_ld/st
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x232.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1yv/KVMQlcaO

On Fri, 26 May 2023 at 01:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Adjust the softmmu tlb to use TMP[0-2], not any of the normally available
> registers.  Since we handle overlap betwen inputs and helper arguments,
> we can allow any allocatable reg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
