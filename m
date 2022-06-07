Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2213759lfb;
        Tue, 7 Jun 2022 08:48:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwriN6LRf47L/6Usxf7m+x1iQKPFiMYy/Wsbz9puMhtOS2gsYp0y46YVXGHGtVd2xAOFOZp
X-Received: by 2002:a05:620a:298a:b0:6a3:973c:47f with SMTP id r10-20020a05620a298a00b006a3973c047fmr19693435qkp.487.1654616914894;
        Tue, 07 Jun 2022 08:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654616914; cv=none;
        d=google.com; s=arc-20160816;
        b=S4VFtDR3JcXPHDHBnkUlMDoR54KoiP19yaoV4b1mqN5W4d/3GHwD4+mpECQwz+SBSn
         mcPLXGNf8I9LUl9R9esCHDg179MI1diAaFXy4FlKJZkBzc4+K0z2mLBMesvnJkxkOZcm
         4Mg4chYeLWV7m/hc2QoThfFHEAN1/3a2JfVE59KP8SvN/SMerJh+a2mU55hEfHUwvElO
         QGyAhN+jKmQqyUjgmXCvna9w/y7yNM8KsNyShnZfe6UNRwFJMeKXgvk4AD16b18zQwri
         DSIRhIdpyaCyGf285g5xhviRJA3bdJyM/9M11Y0gjqCo6qXXuwnxI57EVy3xi+rlibuY
         q9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ELgD2Mhd/a+B1m8JwJsho8kj7v7oEMoUGbxF6wuegQo=;
        b=aBXgGnKiIrSE469Kg8koJ141R1SO9fKIYGHngbTkwCoB4wpYLjd5xFYbHOAqlvG5MB
         CBeW3MbwJUR6bigudttbRCJ7O4x88gWHTM8FLELaZiA3wTk9UxYTfMpZ72IEl5BuKvX3
         h8SyenijC5JhIUAnez1HBInUUv/tX35M8CXN2QHbpMDLjjyh7YCuDCLZ2F2QiUhLV+lP
         VINIzW9sL98JcEayoidJNRTj3KJcd4nHES4TbtdNfHjQHclN4LXXa8/GG1NxHkKKjkld
         ua1J3riIaiCEOZ8PL3keahUcOFKT0eO151/9Estx3g60ReToKXRmy/5Yt4zPZT1OuT6A
         ItDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D2eMUj/1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a05620a244a00b006a639923654si11751404qkn.4.2022.06.07.08.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 08:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D2eMUj/1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nybRa-0003hn-EJ
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 11:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nybRI-0003gC-LX
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 11:48:17 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:43858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nybRH-0001SQ-68
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 11:48:16 -0400
Received: by mail-yb1-xb32.google.com with SMTP id l204so31812191ybf.10
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELgD2Mhd/a+B1m8JwJsho8kj7v7oEMoUGbxF6wuegQo=;
 b=D2eMUj/1Z30FiA4Kwa808BEor1lV6ZzIRltd1cqZUQ3gcGhL+QS0PZJw1J0PPF7Ude
 3Jn95qwmardMbCEVboqyGg6RpXDJLUUlhLdhmzjQvrUbcB6NCM7lNN4AbauujzJ7i5FL
 cruy8lOiB0sWwNjIzrgU/m7CPRinoiQxU1SRQuKsMspWtHpXRZvIwa6rXG7Em8Ca1c+L
 dk7TXbhM59d/QVRcZt4JQ1Jr4IQBlYXZd7zpZt7A8wmxrHRn4rRhL4Gs+O8c0DngofWt
 hDVngWG2WV8ZE1uVQv+b7bEy0ubJ/aXZ2jcPfhy84Q+CFkozGdRvAdr0QI2lF/HcRrRF
 dA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELgD2Mhd/a+B1m8JwJsho8kj7v7oEMoUGbxF6wuegQo=;
 b=33yzL05ich7mfhUosqpIzQ+M6vyxJogGU59xiF4jYsndcANXgeuek9llivAwXCaHgJ
 NsjxM/5m+o9Bbx3twUz47RZihC/PQ0lVx1RCcL04WsVJwJtard4mPE+Nwv2O3AlHNCgJ
 BFfNOr3zZ0sVYyLRa3jwk8PWFIOLOmyJ+J4z8BKRFjaal/PGoJCPe6BFTxRjuFrANgre
 NYQJ7JtHsmslwWQm8NfSXkD9X1+RQ/OYpv7xitXHkh7HTudgcXkdeF40TrVUlCPOjzkK
 TS7D5EThglKnDb9e1pfTJaewkf2lQZT6IT9+skWGyHH6XNyK5xCwzvy+hNzA6K4mSVnT
 hNJA==
X-Gm-Message-State: AOAM532ugAHDEPW6jbEH/6ELwkJd4vUIOH6RNBEXO6msQR/xLOASQKMT
 RILmU73sTWO7x2PjWmt/Z9sWUQyVmxodWkWtafc2dg==
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr30371551ybr.193.1654616893818; 
 Tue, 07 Jun 2022 08:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220604040607.269301-1-richard.henderson@linaro.org>
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 16:48:02 +0100
Message-ID: <CAFEAcA-UGK8eN-YND4s-jvCBY1jgZtMUMJwf6m6F+HdAk4QjnA@mail.gmail.com>
Subject: Re: [PATCH 00/28] target/arm: Split out ptw.c from helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zz6JuBi52wBg

On Sat, 4 Jun 2022 at 05:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The object here is to move 2500 lines out of helper.c.  Yay!
>



Applied to target-arm.next, thanks.

-- PMM
