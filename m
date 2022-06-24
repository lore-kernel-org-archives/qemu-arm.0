Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp297011lft;
        Fri, 24 Jun 2022 05:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usSvFvwkOZ7XBnmyVeWOr1F2x3/s+/cR6FDqC2vc9q2NQ6HtQGXLwS92iJrC1t34KlW5FQ
X-Received: by 2002:a05:6214:4118:b0:470:6a8a:6ca6 with SMTP id kc24-20020a056214411800b004706a8a6ca6mr10592883qvb.124.1656075323876;
        Fri, 24 Jun 2022 05:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656075323; cv=none;
        d=google.com; s=arc-20160816;
        b=a0YMQTV2PI+CRkZKjq+wqq0xA6g6gV4r09MWaCwVxcALsm3GqN4q+3N7BMsZaJT3XZ
         UWohrDQBI7e6PyLyc01wwepjjtvCUPlYXLEzt4zGR5DhkSNT3auZBrV0TUfPL7yD77Xh
         Zk+2O4b7igEcsYNxz199DONZvO670Q5ontwj+TyEF7fva12Y8yrj6J+xf1d72wkQsEdh
         gwG48jnn7mgh5XMx3C64K0BNFDjXcPfX7bdO5g1lBlMR6DhwVHgxEBEDAQKvYshJJJk/
         HX1bXEFgepsTFZuUIsb5aT/YbQuMwXlszg9uV9FSp0KDKf0x7ORBGuzWpX1WjIrfHTR+
         T1Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vQlWdG5JIHIWW7qivUVgYsRVtF7mRlU/FVvCrQK6W6U=;
        b=aibqiNOlgtbiqFaLxzaMF++B4fGflirVsG1kWXTXRV1eWLe5khw+aNpgab2L/nSF83
         stbMzwhmjCiD2RA3kO/27CfVK4cUAWBIu3r8V3l9HNHy6G2DjnE32QiaWHeNXxQElDY7
         kkQKyik0Uz89qEyyyOWyZiDThJQPBVsHz2bWCurEy7B8oLNhXGdPNjO4fcDsmpowpDfD
         zfLe6P8mbFsYfoeEOFIUAvdsA29YIL9TGPnP0cYChGO9Cg7gB+88b1RrxVpN8O/+UDWd
         L4zV7y8FoAAL1OqzLv7U1S/w8n2V/KTzYtI8auPc7M1Ye/0Y9ZGH6HXvf9EZ0mxnDe95
         fonA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0n8TV8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3-20020a05622a020300b00304e4924793si1686402qtx.440.2022.06.24.05.55.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 05:55:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0n8TV8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4iqJ-00012d-Bu
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 08:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ipn-0000ys-3y
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 08:54:51 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:34563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ipl-00053m-Kx
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 08:54:50 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-318889e6a2cso23684187b3.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 05:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQlWdG5JIHIWW7qivUVgYsRVtF7mRlU/FVvCrQK6W6U=;
 b=u0n8TV8iSRx9NgHamWSmnuEsqXq1PuajMFOds3nh+dBUzDpC9VrJMEIVoFWla0Gakt
 8oW1vBRnph3DF8xIiep3/b9VbjXqvr+CNLq1Zqz44+IZbhvfMFbudmk+zq2pDN/Q0fvu
 tbWO6QFGAs+YhBZanMCUlPS8/ZwmEmw8iaAJOeZmTJlm+6PvqPzGzgk3QKWUYKf7CDPt
 5EUedFFcVyoO5vRIyFUycTPolPj/hcORtCcx8yxlbdPCj3OTzRRpbFl+ldslXlLP2kF6
 xsM39ev/7Ucq0SNWD63czqtF1ZZDJJ7pEmqlLnJ+gOaDGyPIdSbvLEz9QQfYsSr+Spzq
 h+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQlWdG5JIHIWW7qivUVgYsRVtF7mRlU/FVvCrQK6W6U=;
 b=kI/qrPXSScPjHEvl8jXGeR5lBkTAlNUj/8YhxLrSa53rwkSAoMfdflAxOP1p0ruE3e
 ahZ/r5zARn/oWHuIIETQz5OiiadQtoeZPfa91aGWw05eG3NApRJqGPwPRNCq9RNI5hj/
 7rY5GtuNW38PYFHJnYciU0+uV4WpLnhvj+2jhCQlPBHLLT3G7qzUkIm3ulmJm3AkG+yr
 6jd51Bwhql2reJJa3vwWfkHpsKRdb+Fq1/1D2PLzShVfnHW0YQCCNPgvUAKc6KD/rn/2
 UZrrpjFWCCJGJq0ypccYjCIaEbLL0ojRWIVWiraw+mctK2IHBPUAQyle0XYqoPrLyyx/
 1n2A==
X-Gm-Message-State: AJIora8VMFCykyIWv4YNXhneMhy3WEWUiy+7G5cwcbE0fmRtDZ05gOoa
 Fl/QeIBPBRFsQ24UmqGE2x+Dlwj9ano1q4L1l0OxxQ==
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr17341329ywd.347.1656075288682; Fri, 24
 Jun 2022 05:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-36-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 13:54:11 +0100
Message-ID: <CAFEAcA9n4th_DNLF_aNOAkYy0k7aCa+5MVdq_bz-uioth1T75w@mail.gmail.com>
Subject: Re: [PATCH v3 35/51] target/arm: Implement REVD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
X-TUID: yTQFi5BjJLIC

On Mon, 20 Jun 2022 at 19:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Again, commit message could note that this is an SVE insn that's
only present with SME implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
