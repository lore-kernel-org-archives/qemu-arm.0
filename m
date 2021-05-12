Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5055134lfg;
        Wed, 12 May 2021 07:22:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx04sN3LDlzTEqur+EfZuGmR9Xe3F1vW2Zcrc/ZffwezIYa2AJ5L3mbjPa1MJBACVk1G7Yg
X-Received: by 2002:a05:651c:382:: with SMTP id e2mr29299442ljp.502.1620829374374;
        Wed, 12 May 2021 07:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620829374; cv=none;
        d=google.com; s=arc-20160816;
        b=qypJ42/Yk27/yEgH4Kk6NrhP0gjtalrrfggh6VQcG1+Xm+mvKF+qn/MpwjkZGALoVu
         PMuNjCLtRYXJvbE40HtM+gr5vS/6XhvamGu5jBL6gOwEZdVIZMMH6QAF1WXHA5S+PLr+
         a8EuUC/npwsXcQ24wcUH8zmfQP0EE35jFrRkYrO3oaLeH8ezWNzjmDKQgn8wCKe01OOZ
         KBZgSfPqiGog42bh46bNrwT41OBZk2WqiUDtr059A74wJeqlsOwWpYmMV5XtabHUup5t
         IsVhW34ON7pw5V69SGcCgNiXNtqIVUF7zivWvFe7DB6hXAjeNzMjD5L/90PzKPppSGU1
         mCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dy2HiC5lXzrLOKnsHLf4EL1IOY5xst2mrGtyhWUaskI=;
        b=aAPd9FCbhUb810hEeQi4tUZZAjHClC6kl/AoZhQxajdZn/deI5xQzRSKcLjh9Zyvp2
         Y/NEQAonxebb7H2Lndbzfy8bCou/iDzPBnKaAzprexQ1dDbkc9M2F7xFDwckho/0kAWi
         QeUMgqVWcCp0YU+6WGmRE/oXnQH5C0SwJvdkGiUPnvXBjBJPGqoUjuz84El2t/ZbA0CW
         DNRJs9TZUAXUuzleDDbL71nd5iUxkEU3yIdYnADVJbf2kt9V0XdB8Cnts9nNo9khlrqw
         vJDyKQrp7zN5dNushBGPbxltPc0WwnbKmkNH/DUnPdbWBF8oenoVqc2nsocgHEgZ07ER
         cRsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FC5prL/J";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si24119873ljk.140.2021.05.12.07.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 07:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FC5prL/J";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgplF-00056K-3G
	for alex.bennee@linaro.org; Wed, 12 May 2021 10:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgpcl-000362-F2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:14:08 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgpcf-0002qJ-Tz
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:14:07 -0400
Received: by mail-ej1-x634.google.com with SMTP id n2so35213411ejy.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dy2HiC5lXzrLOKnsHLf4EL1IOY5xst2mrGtyhWUaskI=;
 b=FC5prL/J85qCxVFu+LG+rSRhXTLdA8K+WUnGYD0QM2Ql1wd+er8FBtGGPdvAkiJu5H
 P//Mr+YQyRk3Nqla7qdu2v8EiEqm/FiqZC6PVyMvcyghWdZBT9myib9xIMehPMsNaC/l
 CpMTdZysgEF6/GR9Pt+pM22P4BNFmlELz9H2gSZqurC+kAzyh2LZgnNNv/4GDWQlRvPW
 VBYOBWIFcz2v4n5aiINVZUY/dCzFbU7mq+1V+Sr6hlYRYVOZ6GsQak88e7zJuDUTqrgw
 78rvU9nmZ6vPOKgQnHitt+SIYwyhPbUNsVAyut2KEB3BwdhRRq3gsvek421UqRI3BXcu
 Yt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dy2HiC5lXzrLOKnsHLf4EL1IOY5xst2mrGtyhWUaskI=;
 b=lUQ6+x1dBZDKO9HwoClZkr80RrtHNh9yG7RC3sauLzZOsdz8SpB2yklv+4DqjK2mT1
 UrI32szA6/rIRo40OmW14yN98jIleVK5caOLK9ULQAy9GF+NzcAQCEfSUSTcbDQTzkpF
 nxrAEoBTgcxwsYzdURlwz/ETFCKeNX/amAWJyQMIb2WiqkxZdlb3Cgbsau7tOpw4WArJ
 oqyL4i3IKl/XxCJZ5Q7SmNCKny3lv3lcyisV9MvHoEjETa5v/bszzlIxuzfWwC426riU
 +j1yyNc/vryl/olKPhSL+T/x49SDqCswu6GLgLwOkF+oZsZX1fWiGjwXxgBkcITztDc5
 v0Yw==
X-Gm-Message-State: AOAM530QTOekZUeTQvDgikAdCNJntR+5laQa9fxrXCk5GcgY8/E3DOtK
 6BkgBZa+KI2kZtkuDfTSEDTL+j91nLv1w6vdpQQqEQ==
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr8479384ejb.482.1620828839764; 
 Wed, 12 May 2021 07:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-33-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 15:12:46 +0100
Message-ID: <CAFEAcA-44Aqth7CmLCyVxGtR1pOz-1ZKWa_cyXcnhdMu=wLnOw@mail.gmail.com>
Subject: Re: [PATCH v6 32/82] target/arm: Implement SVE2 bitwise ternary
 operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R0JiFwcxPMiF

On Fri, 30 Apr 2021 at 21:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |   6 ++
>  target/arm/sve.decode      |  12 +++
>  target/arm/sve_helper.c    |  50 +++++++++
>  target/arm/translate-sve.c | 213 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 281 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
