Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1407599ejc;
        Fri, 3 Mar 2023 10:46:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+6AnHOw7a0VBkCxZpoEU1d7mJX3OGqulOAHAYGLYy04Efb+VBPtbciN07fhW/xCop7cMba
X-Received: by 2002:ac8:5b08:0:b0:3bd:140c:91f7 with SMTP id m8-20020ac85b08000000b003bd140c91f7mr4305215qtw.40.1677869180800;
        Fri, 03 Mar 2023 10:46:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869180; cv=none;
        d=google.com; s=arc-20160816;
        b=qryEWrT2PnZvyUiuUarwWs8HtAsK1A8K1me/Rz0AY3x+PG0glcFwKZwBxccCmvhsum
         BaK5LapmJ983XfbbBgTVlqSUxF93Q7HqBbGp1ghEsyAZQ2vDnOISwFddTPRvLGp01g9D
         z+b4VP+mqWekvd0fvU4cvv9wWuaBu08UX5TUoZ7LEhhEQ46A2h8Tbx7Mm5/pMP23+ppH
         kS6gRf81rEcdCurowFQSudL+g40njGoeGzEbKwszQD3hXb6HGON5zPFjhhak42Sy2RZ8
         LtB0UCorcmCmDaTGITgDEV9IkTHrx0EoxDszjg2Teocyljd3T2iAXtJJ102cWrttdI7h
         hkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QaA0GgfQE3v+jgTFbm+2hJo3CTuezX2gi8MsDE+jjYE=;
        b=Nl3cCU96AJF1AHjPtCZMUB5/ac5VIzwhDvnlG6TkVXfK2n1NOOL8C9eMjCH/fjThy5
         A2qE+6+V+ZGfi0juFYO0IO8YdOvD7tkxAO6voaKAPOphW7hpjeFxD9CIEvzPnu8qyBzQ
         rlveCH+qiDWLm9lkxX0+XYGPd77zPfpQ7gBOiIJ5MBJVhp1nxDKovPO0yBqRqepfrMOG
         JpSt4jg4uV2u4DV0ylWFzae2+1q9WQKKZoxMOqdcCCYyxKj1n5cb9URrroidMjOLsGVJ
         LQV7XzuzdBTV+lfvJ8Q0oeYIEkX5n9rbzGU6t/oQt6iwP4sj7s3MHjAcYn8GeTwPwNI0
         GgTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nnB82iG5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020ac85e11000000b003bd16a51812si2550406qtx.46.2023.03.03.10.46.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:46:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nnB82iG5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYAPu-00046d-JC; Fri, 03 Mar 2023 13:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAPs-00045d-ES
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:46:04 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAPp-0000au-Q3
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:46:03 -0500
Received: by mail-pf1-x429.google.com with SMTP id bd34so2188323pfb.3
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QaA0GgfQE3v+jgTFbm+2hJo3CTuezX2gi8MsDE+jjYE=;
 b=nnB82iG5KcoA6OfvAkdZbKudLIqu/Fuu9xkDKCABDjAthlm5noNemYkaUWHZoHZvKp
 CwELsSDVIoLUcCktPd5okUNV/i69VpDAuAJHuB8L8j05IF8veexYd1CztKxOgDDt+WOR
 /yfPGe3cYrSx/0x2u6LiNVGfW2L87NVAOoL/MPgdFWQ9oTDnbKqEuot6nkAAzaLXt3X2
 T56ovc3Z5Wl/S1F/Ski7v14FpNJ+eONsj++imVziT8xhDF/ZrNd+kSyhBndhD/eQwkXG
 bBUdNWV4ixkYaEbRzs3GNaKRPrGB3Xj1qi/BUb6oxK9nHQyx/XYfXbyLHr8AUTob2srh
 Uh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QaA0GgfQE3v+jgTFbm+2hJo3CTuezX2gi8MsDE+jjYE=;
 b=zzaSJT/pDF5xK3tz3X4R6rCtEokncVF3OJMmwtDjRs2T5oRKkB/+YpW/zz13ZUY+/1
 4OUvpYAW0hWChpCWihCM/OCzmLziXj+2KCzHfEPaotxUKxDVAlGX204+hMqrUK7J44j6
 9kw626km8pAhv5dRkbyfReDmNYjmNFwiEPL5LMNaXkRPFeixiPW+TgBlt46x9iJ0jD9B
 Lf0QRn5sDdwkutjfA7BINfUmxvaeUHiN+uVHXWa/VXrPEC9oj3kBijie8kebEIUwzF9D
 fFVSfl2k7r7mVKSaVAbb6jw1HXFMdL8jliICALofH64b86z61tiapONOEQmK+RYp1Kh/
 nkqg==
X-Gm-Message-State: AO0yUKV9sMoXEhrGYWRwrOXxw1fBYBS4ykz+Z8sODY/go8zTD0YDQQn6
 99Ng9yzT/8Kfn9IBwiZKXoCzKBeLFJAu/JBRY97L4g==
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr827958pgb.9.1677869160248; Fri, 03 Mar
 2023 10:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-21-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:45:48 +0000
Message-ID: <CAFEAcA_tGP3qAxCwK0p9C_EzGu=T1XAnWYhQq-gqqpekfztxNw@mail.gmail.com>
Subject: Re: [PATCH v2 20/76] target/avr: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: hmXIwytqaAsf

On Mon, 27 Feb 2023 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/translate.c | 228 -----------------------------------------
>  1 file changed, 228 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
