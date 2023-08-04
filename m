Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1805502ejb;
        Fri, 4 Aug 2023 07:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoqNsfVF/f9LEdt/dkqvLoNu+sg3saAk8No6yYUlK7FoBpEBNxC/SMvjpfkNXBQ4sDw8YC
X-Received: by 2002:ae9:f80f:0:b0:767:8e6:f46f with SMTP id x15-20020ae9f80f000000b0076708e6f46fmr1974459qkh.19.1691160905123;
        Fri, 04 Aug 2023 07:55:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691160905; cv=none;
        d=google.com; s=arc-20160816;
        b=Ihl61x8wCs4h3Wb+JsNs1woimAD4mg2BfM/8OVJafXLYfg4G4T9A8q7TF/nFayF92g
         S7lrAEIY9cZFYPhRqUEXJnQZVntI2O4syFZmVNDNIxPQ6FeYdmk3ZIrI/kDS31DLr6Zf
         LAlXyE+RThkvaNLYfQOS9SYPfQufxEc30dNT6kUPhOJOpMuF2VBiHcZlQ1/k4FV2MNBp
         AUNO2FMQ+N7vEJJ5OPPwYP2c+pg7cuJFF1a3xowDiQt6o01CsOecbENxGuV6i2MmFSbx
         9UBqTXTMzPWpcKqFACJHWPMHDlSlJBPfbgNbdJ7Mz5uvGKcV2zDZ0Eo26vT3GtAloUEH
         PpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jPHfZt3MN46WF3a6MB/7JD/PHP6kpkxjqgn7p5QL9HE=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=Hic212MTJGkfAgoD+7sjxuAJ+xDP//AHMppJZQaXYexEWO4L3EkdHng7FEV8HnGJrL
         en/u3wpMKcXJJkoS/dFvm4O2Ck9E+Hfi/5BFHNalVGyCmqlj0U1k4tLOW0frISfPSj7c
         zBB3GTnve+TVp4eTf3+tSGebcIGORo0QvLDp5sLPL9UuQCrFouYxK82jV6dSdQQm5A/K
         UGmjhemI6YLkPdjrQZvBpaSaz6qYVjU5VvCMnRGYFpJ1F6JNyUPV85RkdORUDN5f73VK
         TekBCz+b9cQVonyeq5MaP7Rd7b+NbucYZ9zSy9UbpqkNWEiWoXd5i+lGxabTl7xp93LM
         7BvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dqVu0wIo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs8-20020a05620a470800b0076cd3e63a6dsi1306850qkb.208.2023.08.04.07.55.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 07:55:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dqVu0wIo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRwCN-0006xT-Jy; Fri, 04 Aug 2023 10:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRwCM-0006wY-Bs
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:54:38 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRwCK-00017c-0J
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:54:38 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5230f8da574so2278090a12.3
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691160874; x=1691765674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jPHfZt3MN46WF3a6MB/7JD/PHP6kpkxjqgn7p5QL9HE=;
 b=dqVu0wIo1jjKDwR/VzPPdPo8dSRq9bPEIegiy6DFXb3Wqr1PZzNNQT4Md+ylrR3DA+
 7+6RdaPWAmyf0ZJyjnfBj4kq2MskHvCmyk9M1hQASW/kOAf2YmQHlB5Lo22TKuCFTN7t
 XsKk83YlyJsIGYgvFXnqP6+xlUJTN0dGqz/bJJ0e1nj9XUw/lxOH8o05awjPvYgCzzTz
 r67ez0nzG1qwXwmTxppcqQgLcir5/u8V5QeyIgk+JUyH0V6nDMTaIOjXSMSdQspQZGBA
 CO4pgRlAyIGoQoEizsr96pXnwwK5JbNGj1Hf55wO8axyQcZupSN5Z06xz3eYD8Dndw1G
 y8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691160874; x=1691765674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jPHfZt3MN46WF3a6MB/7JD/PHP6kpkxjqgn7p5QL9HE=;
 b=ZzL2TzzL40ibzbgrfeQ65ie4wDM1GNEj0oKoEF+GfGxwPFicSDMaLarzhn9x6JohLH
 7Htue/PgRZA02vgUF6MGgYJlYjdPPneUYQ2GlSH0nRvaslTrpLfsO4gdDJ0gEkhtXP4E
 MLDV6Yex+8Uq5jL4SwRYH7vvtCBj2vpgn205xXdB35CBxsVfDutkdDpaYvkkesooQKZJ
 UAysV4q1uWVfWTK3jdG95r6TnbnrZzrnmA1/OmQQKr0pWAM/KzNVJ4SuYNwvMzdnRBv3
 +C1Ow2u6aQn8n44tNbEoXDuicBoRA0CW0wAcxhZIUm39a/nqWTNV1CkBl4OYuGrknlpl
 LXtw==
X-Gm-Message-State: AOJu0Yxud/P95GXLUzdaQkbqd6O2I6hRpN2MS4/uFO1zgVGy6f2B/Ygp
 Pn0JDyGepcUTh+ZLwV3e1+moCW/Aox+spEtcifMjzA==
X-Received: by 2002:aa7:c446:0:b0:523:102f:3cdd with SMTP id
 n6-20020aa7c446000000b00523102f3cddmr1862242edr.19.1691160874445; Fri, 04 Aug
 2023 07:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-35-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-35-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 15:54:23 +0100
Message-ID: <CAFEAcA9zx6wPwWNMedj_R4=aMfm=uYMg4JSd_h95tZ-qRiJVtg@mail.gmail.com>
Subject: Re: [PATCH 34/44] Add Rpi4b boot tests
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: z3K/rjd6ddVh

On Wed, 26 Jul 2023 at 15:23, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/avocado/boot_linux_console.py | 92 +++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
