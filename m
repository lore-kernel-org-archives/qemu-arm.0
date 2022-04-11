Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1588252lfq;
        Mon, 11 Apr 2022 05:34:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1oqpFka4DzYf2OLUIepnZjuC26iUzEfVskHhXEbXtkqRIf/iSJQfRiXM7Kgxpff0wSS9r
X-Received: by 2002:ac8:138b:0:b0:2ed:f18:c232 with SMTP id h11-20020ac8138b000000b002ed0f18c232mr8900754qtj.460.1649680474061;
        Mon, 11 Apr 2022 05:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649680474; cv=none;
        d=google.com; s=arc-20160816;
        b=fig1y9oZ68Q8st793Lfyfe8orZVThgzA14wYV//zoN1Ychhy23d/ScW3Bg8TAVY4HK
         5HyX/TUtOxXjlSDOGMv8d5Jn4PHj0W6ZC9k2Ogm+NZNk3LJx/XkP2+A6EzmIACXlqPvQ
         S1Dig5G8kVGpyQS8w0atRNwVTfx3IIt/ACFzUyJrGDOo+UDlIOEdqV9bTXEo82cbQ9UR
         UVfIO/djPGAx+KRYC8wLXR+5lInBZlazfxM/tB4KiE6HersdnukVaWCCOQOiBS7UUGQh
         CRtx1TBbnZUWNs0FPYCb779/LvBsAVgImibSGo2sBFPB30EXmtOHzqD0kVEpmXrZ+L5Z
         f3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KS+w8cok9Q6yeri/4aVrtyvTlbCrt0U4UPAg5qXJuMw=;
        b=Sqp9iD+sJbVEAp97VQ6k6v+FdEgtUqkz3PN+M9j2GBaKOPQFxtQQBnD//beb8Yi3jH
         M40jDA9j5pJwEJYaGN7pTkKcqSdlMFgkoC85HLCafBlryaj+64rkLO6RsNLjPU1rPBfQ
         WL77u6jsbW9sCztuVCDPO283iiEBGw9L9z0O174akSSpahNtsbBVJiD3ZxU//CbT2kSm
         pwAoeIFUmyJib4rg90Z+p3sqAX4M6JY53kg0bc0ewuGskfpi9Q3Z4WuUbQJUrnjIQvD7
         +Jl9UgPZRlzkiENtADOgkClzCN5EaN5nTTC+5mP0kQPf5zlREAMQeuWRqLuqL+dlejz9
         74bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iZyHYu4N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js9-20020a0562142aa900b00440e46a7bb1si4168269qvb.79.2022.04.11.05.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 05:34:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iZyHYu4N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndtFZ-0004FL-Hl
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 08:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtF9-0004F3-Nm
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:34:09 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtF8-0005Rj-4G
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:34:07 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id x200so3473176ybe.13
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 05:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KS+w8cok9Q6yeri/4aVrtyvTlbCrt0U4UPAg5qXJuMw=;
 b=iZyHYu4Ne6vZ7oF4mMRyD2Wc4J/2IMz1teP7QrO4a4HzeI5ll8NEMUQ+DJ8Xt5LbRo
 urtTrvkk8RwexGTaeYpfckcRrOPp/iM2/UEJrVoSb4Vf0NPCLgJYx5ED2QZdAitp4Owr
 qHdfoZQLYUXXWP93M6BDkIhtT24lVKqhQwoLwEtgje6Tjd2DvG3GG1Wuym+vENfdHJmk
 hHV3Y2+e7wHiy2kavKVc7X0zu6+Arc5FT95w1XoJyxL66cGqOUZqMo2mKunT9KwCYJjx
 mtteJDwdAkIoUlh7qsncrARh52jTwpHkHc6aTcz9zzSsSaIxueRa28EtWsvHTmbqsjOf
 FnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KS+w8cok9Q6yeri/4aVrtyvTlbCrt0U4UPAg5qXJuMw=;
 b=mL4Dwx6+KzabwfK+ho61GBlHl1yFA84+egb6/drxJGjINM8pNISjwjQpTYukPjwk6Z
 g7I0QvaEzIFuhOfFC1BmA1kwa1lCX8QSQoaln1H2lTWMe5p5F3fiF2Z8mupEV0yaai9R
 wU25l4wMIfTxjYECd9b1ubfzaJRPS534LAD/AKfulllVVwjJY1AnnPHiSB+GxtfE1aAF
 QAWGtXXVwkuz+1xsg5PXyGxiU4DaVE68HAgoTwSifY8Q+ZShzIs1J4KbRXC7JVssd8MQ
 AVU/qlL5iCKUeSwKtTgrbu5duh/o5MBPRHeaqO5cVlP9oWXazNC3CHd9A+IaLykrxbRG
 /uVA==
X-Gm-Message-State: AOAM530TQFfVKLldrmLOn2sxyHbikeJRg/+CZbqDo07tK7LsLX8KUiOc
 r82q3Mh/3lH1Xgf+DC4KgrHaa2og7pw/LdsatnB3hQ==
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr21728473ybu.140.1649680445032; Mon, 11
 Apr 2022 05:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-2-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:33:54 +0100
Message-ID: <CAFEAcA8QhsNhyvFVSmDA6XJ4rHN9ubohvT_wK42SAne8XDVn4Q@mail.gmail.com>
Subject: Re: [PATCH 01/16] target/arm: Add isar predicates for FEAT_Debugv8p2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IkEHKMI/Imat

On Sat, 9 Apr 2022 at 01:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
