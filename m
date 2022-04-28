Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1648283lfu;
        Thu, 28 Apr 2022 04:16:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7sQuYJcZj05FMjiwECiHdl9Q7fg5zxtwtS5KjE9RdL4gBxYGQamkDzIP0Rd1H82k2jYGG
X-Received: by 2002:a0c:d80e:0:b0:456:31a1:fa52 with SMTP id h14-20020a0cd80e000000b0045631a1fa52mr16803361qvj.109.1651144613359;
        Thu, 28 Apr 2022 04:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651144613; cv=none;
        d=google.com; s=arc-20160816;
        b=H/LU03l5/xfLUUBy5sxaUxnFOB+/cqPRASgAUYXo00my8nQbRjgv23PiVIWxHKlglT
         RpT4ljvuFo5owWBNJb41IvQhoEmARU0JPpNJEpmRucJcHlxWDtTZUytDtBELkmVw62x/
         q1hDeryI4teB/Su4kY+GTxuS5khZYp+Xq1ASrkVxxW5LHigWxBa9zU9ZnziLftkmIlSW
         jFaQwzwC16wqBadw0JfUmSVw2aNjiSrkbV1bMhtqQ66VsYiJXB6rHRFWKKqTUA8tFRSt
         hbgnM+t0ASnZ+utvm98ZWXjnISfzsxnzFDWb8RgsZL6SUtHEz/horelDGZkeB28LsQvd
         patg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2yfXQGc2EWPL815xFesxzfcLi9l1t+7Oh2kedPs5GBs=;
        b=qzvlcxq7/cxg2Pk8iY/LMH4Ij20ee1O8cOHyBz7BMyXBq244bHWt1xw3ia8dCMw08g
         Vwji2r2aFZBpc5eGtbhLuVAjBfI/2112Y2LBWucANHfN3pIV22mwW68/E44YWpY1Q0xI
         YGSjAynLoUfp2Buh0tdD7kKACc+pqwvr1p2mbdqymZllG5drMJ63SqYReEJOazI1CTyV
         9ycTY2O9enfaHk0EloZiuOt6BZNg1hakp6nsUnbUJi8hAkz+NQVLym+5DmhmGDOGM5Oi
         8xiVVV7dptCAmjH9d2rU1G+brQeGLVDZnab1dcIUNwcjJ1/2p+QCb1UMprEy2h2G6iAr
         Fw/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IF7daEdd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020a0562141d2400b004467101e287si1635881qvd.551.2022.04.28.04.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IF7daEdd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk28i-00010K-S8
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1b6-0002q1-6H
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:42:08 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:38742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1b4-00013A-NZ
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:42:07 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id m128so8270818ybm.5
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2yfXQGc2EWPL815xFesxzfcLi9l1t+7Oh2kedPs5GBs=;
 b=IF7daEddXexwYhXnZyS/9RE1DF3x/1MYO6xvOebUDtluWujWNmqbW6Y7Y+s6+/jGrb
 V1ePzejED0EF/iBysKymOHwNTpDEjAOR5Rh1TldQcWxtIMboFSqndzdAuBFVtabtiyMG
 1mZW+V1Nu5COBJdcQ2mJWrDUiF259eQfm09LpKOhaGJbMqH2JgADMfzBdaFZUye65VWl
 PM82gPWNbFD5/XOqe7i0AP5DGGj2/bBjiqqo/0+Vp5xPpAXN/rZ4jy7D6Aceskwsn0M6
 qbjlPXUgd8a73IpZjOtoCobCALdt0cwlJbGW8kDEyPMxAdf34GLc3ZqKqPAK2OQGrB50
 1LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2yfXQGc2EWPL815xFesxzfcLi9l1t+7Oh2kedPs5GBs=;
 b=PumLbbikLhK8KlMKFG6kroLSl0z1kLSzpajDR7RFUXAOaVzJN7e9IzFSnk1QdvHcRs
 qFzLruAsSbGsJBO08uVoCVRhfkWH4uqasLIA+t8E4IubEAxRb02hprTLC0g+W7+91jA9
 V2tqJyga+6JTGZLLAr20r4Uhp6NtQ6t0JgcRQqJSxlGmCPggo98wgTOrVqOFOdhdLQ9a
 CXQTQXCo2wyK3ziVa3d/3v8JMNl6xBmJTxutL7b4H9r6u4Sbf34Bigdkl0N18SnpU4Ep
 icSN2NJ+jc1Yz/ibjxlTmtRDerI7PtOBi/3sU1yHsyd5OugizM2G42xygS5UMD2Za2B3
 oXDA==
X-Gm-Message-State: AOAM530xiQk8CFfNVXH4DQXiJxwOfV/7DLOLXCtC/62CavtED+dUwtZf
 /AMYLPHjWT+WqObSkV+WC4Y3ZW/aX0NGQlO8MMNazQ==
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr30014147ybs.85.1651142525648; Thu, 28
 Apr 2022 03:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-39-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:41:54 +0100
Message-ID: <CAFEAcA9EpCMLo9Y6=riQ=u8neaeYmUKGca=6FTW=b6OtuScU+A@mail.gmail.com>
Subject: Re: [PATCH 38/47] target/arm: Use tcg_constant in FCPY, CPY
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
X-TUID: p/dF95cg30gx

On Tue, 26 Apr 2022 at 18:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
