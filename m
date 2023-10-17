Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3894291ejc;
        Tue, 17 Oct 2023 05:50:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj66LDG1RR53FKtae3uiGjEVp+ZcVD/M4xhaY2qROZ4cG6iIGXPethBt1cGaJh0vwtNnFX
X-Received: by 2002:a05:622a:1894:b0:412:2ed3:38ec with SMTP id v20-20020a05622a189400b004122ed338ecmr2486270qtc.18.1697547021188;
        Tue, 17 Oct 2023 05:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697547021; cv=none;
        d=google.com; s=arc-20160816;
        b=UgXg2eLyRu169rLyrdxJQCMTUGsSSDVbjkPoszWkjG/Pxbq6pgBEnmhSn+GE04/wcC
         Lbkm/pHu7JsRJ4GUO9AseDgUTQHV3RLmkp8KccLsCaYHTESJCacFGAIe8//kAINW3EmP
         YyQVULF+u+VMXQatQxA59kcYpqa8p5o1MLKWtIW4XxXH0aOOJChqt4dve8eKUgtI7NcP
         B8srJFjDuG7Zm1F57twv2y2s4gGOK2ElskI737VmZ8423TA2sKOIe5FScWexHOTDuTtc
         BBiYtNJV0DfgDIiPGZbbai9ZGK0LBKklGvFaoCeFInak/QRxbV6QQtgpnf5cWN7Htcgw
         t9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4M1fUvPCfisaD3RWNGdiZS6+mZTgMbjpos7AtuXfSfA=;
        fh=TfkJASJQZEi1u82yrjG4XvOEeKalzEvweFsBg5QB0FQ=;
        b=TxMg0wBIZsA1ZsSw0DHHh1lh86MW+5pvk79K1v+2jzrNMaCNRVAMiSWCCpRNV1aV8H
         bTeEjsI8Wt7PsmlQgyfy/os9JObnkZ0mIlC/7tg5IzmT8j8U3sekbhe3JBhC/l1Nc4Is
         MGC9P9nUrDFM7u0xIPHgGsa9cbNfWAbwD7DgIQ9jodWqqseLKJk9zrSotJuRxu4wIIFX
         47kRSkFzxYA//87pVZihwu5p0wv4UKpevcjj34/bClwj4wjf2Vj0Jm1mvVQ9FwiK8jqL
         F04RoCR8dyiNsY/5qd1oXnl+E6op++M3HpRzLIXPPs3PGAEuaD0jYxQsYvp0ttgVfvhi
         lkeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XZc0TFPG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22-20020ac85fd6000000b0041979a08b5esi1027979qta.726.2023.10.17.05.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 05:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XZc0TFPG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsjWY-0003G1-TC; Tue, 17 Oct 2023 08:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsjWW-0003EI-NF
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:50:13 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsjWS-0001iG-Nw
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:50:10 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53e16f076b3so10552202a12.0
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697547006; x=1698151806; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4M1fUvPCfisaD3RWNGdiZS6+mZTgMbjpos7AtuXfSfA=;
 b=XZc0TFPGSis536QuLeX176N+XjHyjMzIb3JC8jQ+5tNYZa4LdRKiLxyNQFcp3Q/qGN
 Xz8XxsozWJo3IEj0jsbGDCXrQKJQNADlvLoYLbbpK5PF+Qf8URDCykv1quxA4fHo4716
 JdjnZmW/M/DNYgmlalA/jr6L7LCXA1S2/yJPVGxSDD4NeTJx/YICquwZEgPrY7M+IEe9
 gE1A9VT4EgDcZGpu9k7XTvOI+C8FXhS0G7uvaelQPw+2LyxyCFMeoGOUs7iTZQOjePXJ
 30rqAnL0A9EQBM/bDYyBLT3MlXAUfzCW3F9DEEYqcVb5nT9CuiUB0sVGHFG+LTCX29jH
 3u/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697547006; x=1698151806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4M1fUvPCfisaD3RWNGdiZS6+mZTgMbjpos7AtuXfSfA=;
 b=VaZfs9MLPX2q0J6LlpWm2hCuCqkzJZlfG4un6XZuV9BrPmGT/YV2J+kKrvyeftDelk
 tBA+OojddzDEbZ7bNN1Bf6Znq2RMojSLC4TiS2jX4iTxsE4YKwvSALzW0K6jHM3oGt20
 hneim6IQoqyJu4NCMJk+lDIUgxqmFJXi+67NYZiTKYtpc6yl67t6Yf6S1S5Bm3mRIrnU
 baqz9pt+xM72Zcej4dEYP/L654XpEgF6pJkYN7Y01RKLHIVishVpRVtayNYW7U4cDRWA
 oPu5sIQyZLdfgb6nUs2uZCp8OGdiZIgKWYGPx4bXFRR+His6iib84bHicYHMxpsJW8A/
 gY/w==
X-Gm-Message-State: AOJu0Yz6nCFjL0pGYIk2DDBnG4I68Qf/cM1MBCxsSKr/Lu3gHQ7DmP9I
 dFDxrq2oemE9xJcgUjzVf5KiwsfyqB+2SinhmL5VYQ==
X-Received: by 2002:a17:907:7251:b0:9ae:577b:3832 with SMTP id
 ds17-20020a170907725100b009ae577b3832mr1779576ejc.24.1697547006331; Tue, 17
 Oct 2023 05:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231017122302.1692902-1-peter.maydell@linaro.org>
 <20231017122302.1692902-6-peter.maydell@linaro.org>
 <f85817c0-df0f-6e71-c5d4-61e6f2082a75@linaro.org>
In-Reply-To: <f85817c0-df0f-6e71-c5d4-61e6f2082a75@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 13:49:55 +0100
Message-ID: <CAFEAcA-8_YVm=cFGZ7yY3Nj4GCbz4UEGH9VX7fYOkpewBdm5XQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] hw/input/stellaris_input: Convert to qdev
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: 68boZIIbE0v8

On Tue, 17 Oct 2023 at 13:48, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 17/10/23 14:23, Peter Maydell wrote:
> > Convert the hw/input/stellaris_input device to qdev.
> >
> > The interface uses an array property for the board to specify the
> > keycodes to use, so the s->keycodes memory is now allocated by the
> > array-property machinery.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   include/hw/input/stellaris_gamepad.h | 25 +++++++++-
> >   hw/arm/stellaris.c                   | 26 +++++++---
> >   hw/input/stellaris_gamepad.c         | 73 +++++++++++++++++++--------=
-
> >   3 files changed, 92 insertions(+), 32 deletions(-)
>
>
> > +#define TYPE_STELLARIS_GAMEPAD "stellaris-gamepad"
> > +OBJECT_DECLARE_SIMPLE_TYPE(StellarisGamepad, STELLARIS_GAMEPAD)
> > +
> > +struct StellarisGamepad {
> > +    /*< private >*/
>
> Since commit 067109a11c ("docs/devel: mention the spacing requirement
> for QOM") we don't use these private/public comments anymore.

Oh, good. I never really understood the purpose of them.
We still have a lot of them in the codebase, though...

thanks
-- PMM
