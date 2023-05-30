Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2239889ejb;
        Tue, 30 May 2023 08:03:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7lxnOnCh22L+9lH3bRB3xgiL9Fo26vpaXH5XdevLLe7HGw2K3kuxumJuKW66VnTH+GQEze
X-Received: by 2002:ac8:5713:0:b0:3f5:1626:6a3d with SMTP id 19-20020ac85713000000b003f516266a3dmr2109161qtw.42.1685458990683;
        Tue, 30 May 2023 08:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685458990; cv=none;
        d=google.com; s=arc-20160816;
        b=FxzYdtv/fkEgSMYpOtG0GZxyLLAkwWevI2YUmU1Go/DJ8aZsrwSudIJfAGByZvG0vN
         8DLbqFeFtmiX1m/gGRfYqEYJbYEbiKTO0IuqUH20xxs0r9br6LxAamFrTy5MNh2WLrdw
         KyNPnBfBoqXx+40e3AqGE2H7tYD9jS7FFiU+tYEy4KGkCG/9uPvd+zcw2gRNhK9k20dZ
         ycjkWc11nDQla/V8gfxOloLExl92gczkMbBghjIyno1ChyAGrzWGc6jzJKyVC555lSiz
         nNQmhiYD953Oxiwj1tVbr2StQYbUuxzJi1+jLbNZvICk7yd2cG1HPGnph/N1h3LK27h3
         CFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WvRiAGwAXrcfflCp779qlTCaXnCRZ+XkL/ghHtaAr1M=;
        b=Z9KKKzRYwjrtW5U/w0qJZovkG/8T+Sh7e7RruQfvbfN/6PmGX4egp6kNebRW78M60n
         Np6mIWy7oSZTNwY1VMQ9lIGXg1gZ1SbXtPBMytgA//plQveyBMcP6JrMh00Bz6Hc16C7
         EEGs4U0p0AvxPa2vXbJnkAl635dNm0rxSEIJTPWBr9G2dNzprkQkJv07f2XIBZKyaoZj
         jPwTBh+FxlyreGWzug12RF/9h+8/aAP76NTMcYV72g2yVYTdp+9GiEfc8RxlD+AKvFQW
         +Cpa0ZylEZ4xNdky8JqlujJ1GxCsbD6OgLY8TGSJ9tYuqY8HwVW83/DkJkdQlLGuo/wu
         xpBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rLfJXhVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21-20020ac84e55000000b003ef4198357csi6618235qtw.744.2023.05.30.08.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 08:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rLfJXhVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q40s4-0002fY-70; Tue, 30 May 2023 11:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q40rb-0002Vx-Ab
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:02:22 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q40rX-0002wN-6X
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:02:18 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51493ec65d8so5757723a12.2
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685458931; x=1688050931;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WvRiAGwAXrcfflCp779qlTCaXnCRZ+XkL/ghHtaAr1M=;
 b=rLfJXhVL5WDRkoyAU9LUWewyv+B1crBGJyjlp8+ewtrFMM8wU6qJE9jO2v1wdMp3c7
 lTvIfIH1WGGCyVLxRG33GMLS+DKxUONlXVDIHItfCJdorjdq4zDnr08L1aVN19cHpW8q
 SJnHgQkkCxLbq4h6a1gDj42QnEBzL98E3IhdqtDm4cLxdJlyW0M99X9byUqLHOyPhnoU
 SVlDHISdgmhuH+CIZlJu90a4a6zbzWEmYlN6QAcMDodkt9NI1GH1R5/w2/N9GD5VNDNz
 xMYRM1+4iGzK21tgF67PGcN/wqEh0uTCRNvpVHoz+CGQOfACWOl5XtwfwLDJ7gmlKSLP
 lUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685458931; x=1688050931;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WvRiAGwAXrcfflCp779qlTCaXnCRZ+XkL/ghHtaAr1M=;
 b=GnoOJ6y1Pp/0zaEzCSzqiajJVtXG0fUh2jfIHJ8HFP2LoDgFP8tNESme0Qjy0gr9+r
 gnS0vaaNapd+Z6MaetxIR1XlHSN89qFRxCl6AJRWQPSu5T5u5dnv6fLOkL9ImKW9OHP1
 HhUF5EPI0PAnrNpgilgZtnpzWdfA33hbLf1nKSu0hGzzYp1HXX59Q+0yt7C4f6tT1F2x
 Pw/944icO1JAY4T5c5OqQCl4lGNSMFrDST3hy2R9WOLOgFS5QnG7tMT8z2rcTxv4aU5b
 0q3srg9gdxS/UBx8g4LTKSHqzDY3u9rlZXN6H8Gi+b0sjxf1ZkrnCueehuGAO+15kEkf
 aCwQ==
X-Gm-Message-State: AC+VfDx4ayQe8irGxmufu+iFHZ+h6YO6NZzFmnhXrTRXAApyBxEgEoSK
 t5rqXE6LQrIBkUsWzRUHBrfDTAioCvGHbNAsulF6pg==
X-Received: by 2002:a05:6402:642:b0:514:960e:6 with SMTP id
 u2-20020a056402064200b00514960e0006mr2017955edx.10.1685458931173; Tue, 30 May
 2023 08:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-6-richard.henderson@linaro.org>
In-Reply-To: <20230526002334.1760495-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 16:02:00 +0100
Message-ID: <CAFEAcA_bQFAqyS+9BTRZt5nEJZYThBRXuDCX1jfrgwLjybwxbA@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] tcg/i386: Support 128-bit load/store
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jGcQPv97H3mu

On Fri, 26 May 2023 at 01:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.h     |   4 +-
>  tcg/i386/tcg-target.c.inc | 191 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 190 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
