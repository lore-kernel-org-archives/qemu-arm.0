Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp681756lfg;
        Thu, 13 May 2021 10:12:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymIff8hthtala4hac4idrIcTAmFCAUQKn1XcNeEhfocsa1mQABuuUFO8Rxh+gEb4lqqMVu
X-Received: by 2002:a5d:8481:: with SMTP id t1mr32341975iom.39.1620925936847;
        Thu, 13 May 2021 10:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620925936; cv=none;
        d=google.com; s=arc-20160816;
        b=V2/qH9OYE+jkBjK2ycVzIUYe6swVYR9OZoeaO7tkSE9LRL8kFsGpdD8uKHaH+/D6oE
         Myy9xuodBIlmtcor4rZgd33k7+Qae/bRY1bzJaP3Zr3CLcjkmvqqm+7Sk2502p9ecfIY
         /gqklLGMUH3bUyYVetrBE+oQl1/ssB2hMEfmTRAaeOv5kwGbL4qahLredTdYq3AWZ4QR
         H6TlizYNq4ILpqCg4ix1Hrpta1T3AxiFly9n590DZQOyMFQGpRy2+HGIsYI8JrlJJ+Yu
         vEFYKzvlGUd/QBbySrKQCl48fr0IwInoZfoYgsI6h7rBGdj9U343LxOMjjSSMLo/UxV5
         Fn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8uX56FiX1L5CrIfT/e/dPdgQeW7UnI68JO4fWOWOgc=;
        b=rX6bxvjgp94Ifg1eRIPTfpLWOodX8mI2/1NWPNREEYL9MRY4WSf/wxxsZlQ7vVGxv3
         lNcY6SHPX8u8EJKrkP0bdANFzRiBf3cJzJmVZC3w+4bEMN16qaaQhYclrU1zWylvGiAN
         t1Za2hErHncv323Lid3+qbFmIAO0gt9Ny2UAddaAqZ//CcPQ6Dtkmnb/ikbag43fvRfy
         9urMNIHJdiFY+wtqorhH0KOYgToxQIkdEykIHO6p5VO+w6BcFEbSm/8wFwZtIgyvu9uw
         g0bsuz1WwfnJ9EB79gekbyNDYQnvipKN06TQorYt/JkQNAdzExwUgOn0A/OhSbYyxCHT
         sXVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qUBT5KFE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si4998640jak.13.2021.05.13.10.12.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 10:12:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qUBT5KFE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhEsg-0004MB-LJ
	for alex.bennee@linaro.org; Thu, 13 May 2021 13:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEqX-0002WP-Gr
 for qemu-arm@nongnu.org; Thu, 13 May 2021 13:10:01 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEqS-0001Jc-C0
 for qemu-arm@nongnu.org; Thu, 13 May 2021 13:10:01 -0400
Received: by mail-ed1-x533.google.com with SMTP id s6so31731205edu.10
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a8uX56FiX1L5CrIfT/e/dPdgQeW7UnI68JO4fWOWOgc=;
 b=qUBT5KFEoavFTK18wRqh/pW2wWMjeBbDiZAGD/z4HJVPqw8hBAHp18MVZ1So2/N556
 4w3FimgWqTzvAjIRtelJeXc14J3SBkUYi8IWNBmr5O3GeUSl4Ryo8lyR0yCQ6ha4JexT
 uUDk7CPPxQZHkF1sq9jzsedg0vXwfqKjv/eGupzRtRakf4f2S/sdQEQDhpESNUphi5iW
 2HNBV+thCKSmJKaN1z/6mElU4eZjE/Z9s+QMjKw7cxU8CjydG36hCyCes3tkpNETyQQn
 pmGQLAboNH4d9PfX50ZSSryvTLem6mwuXTBuxUTfK/20cVfkcK1qJ5ldrl57VP1K2bZw
 jerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a8uX56FiX1L5CrIfT/e/dPdgQeW7UnI68JO4fWOWOgc=;
 b=nWBDle0HG2vBtJkPY8pAU0JIovm77UNVuJRfacuMn/T+z14PmDtHSUriVhxKA5VPQp
 XRLsXrCp7SXmSI4OL5pXvoHtlFvHWf7UJVtFyO9E44Z7YHj8l90hmLW1Wi9pDz5DKqhV
 H4bCZKGR8ZdinH9bbetPKwivwY8PlLzd0EBm/K3Pixegvx41VtFavT8Z0kVWr0iOtTRc
 jY02INUcJV09ol14XuDrC9EK6GTg8C6vx7a0OKsR7uCG2Er2jskyuHgXq0wM8qOcXtDt
 7qgTi9v7nsO2sXZIgh89lbU85vfPzTZ/egCl70QsdWPi893PAjsI5RO37vxCXEdkx9Gu
 5WPQ==
X-Gm-Message-State: AOAM530cyToLCNxRB+ktTmSypypxkF6FXHaGpn8y0CYdZlRh3Pck1omT
 EFX9vGsGTI7HxViXw3eaGZ1oJQokQNbDbFvzQhpCkA==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr50856853edd.251.1620925794115; 
 Thu, 13 May 2021 10:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-75-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-75-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 18:09:42 +0100
Message-ID: <CAFEAcA8j4XeXu9fPxQdJfy2i-37QR+e84t7J1=ZhtnpqhxY8iw@mail.gmail.com>
Subject: Re: [PATCH v6 74/82] target/arm: Implement aarch64 SUDOT, USDOT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Vqtn6EPUMpq

On Fri, 30 Apr 2021 at 22:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |  5 +++++
>  target/arm/translate-a64.c | 25 +++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
