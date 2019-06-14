Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1290673wrg;
        Fri, 14 Jun 2019 12:04:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy65ER60unQjEI8ZyazjV95D+Ob9lJyJgP9EJ0HXqmHzdq2XlYDCRG2teST/IofOOKH6mDh
X-Received: by 2002:a37:9d1:: with SMTP id 200mr29249900qkj.306.1560539097508;
        Fri, 14 Jun 2019 12:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560539097; cv=none;
        d=google.com; s=arc-20160816;
        b=j1D54eGHBYieAWqp4lE8UefIKw+iDh9ZVLBUcXSd6RkZu8jsskhtaJtDAA1JSEfl6A
         qtyOxDkqXiPp5tBHH7DiskYU+Qrbq10BqwDBOrzyn7lv3ROHXXRYGfB/8aw5E+Osirsk
         MGSO6e+9O+CBQ/LVwNOWyHjCwIYUqaYSSFNbyqp2uZ9qhx1gaTfszncddSOUEDxrAqQc
         uzfVXbDTmdKWpz0IsFloCC2GmWZvWMypjVIy+XaUa0JJ7zI5yItVMVKO9yReYx/pCND6
         QG38SdDAm3bfwc1msN4nCDIFhZQlENUAK2492BkfKQjrW6cUALfZSKLisCG2PZAWUYaL
         qlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aXyj3HlAs6XieE1lzfqUgpGcYF+8UXTk6niz6BWcjJI=;
        b=ZCNLUwbgcV+DCRI/Nmb5Hq1UA/q/nFL9nsUEKR9Cbk1zUCY/K20ivhVDjVuyNe6nRW
         TYC2OJtDv0PZrI7XPUyKlXNxctlp7lKYKKxnr4p9J7j8lbtufZhbnwKPv3ikI/m6tqMq
         yhhrsfLUByHYKSVrIudRz6BId2A0xZ7AMOBG/k7f3DCxbsds9RS6Xq38Y1vfSanpSWkK
         C6Kt4UXKipGhJjZm4rygePNpLZLh8IuoKMOjKDuUXrEK6tcyMwwlnIXrw3HWwaUiGicu
         fQTdL4OtBbFBXroiJ7sW9XJlZnu1iTi3P0O3s/frZjvrQ668q8X4xWxidi2BUjy1GrpR
         izqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NztWyKqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s54si2419070qts.122.2019.06.14.12.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 12:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NztWyKqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54416 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbrVQ-0002B1-Rc
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 15:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40975)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbqNi-0007Dm-Rr
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 13:52:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbqNg-0007ET-11
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 13:52:54 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36894)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbqNe-00072s-5c
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 13:52:50 -0400
Received: by mail-ot1-x344.google.com with SMTP id s20so3458440otp.4
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2019 10:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aXyj3HlAs6XieE1lzfqUgpGcYF+8UXTk6niz6BWcjJI=;
 b=NztWyKqEBb/Niuvpsf0BaEySXYaI/YXSSMoGNhhTkJH8kxyzobFZB+l7HgDGtAlyDH
 WfnP6veRuT/aiRUjPiEL77v0NyUnbddxqO9J6NjK+lajpn9ijUIl8A8ALcbyG37NvAGO
 yTJaSSqAkiooIZYO5YjtzK7EW/7pCjgiy9xat1KwfACbO4PpRK70ATuAsvTlwvQhoPWw
 NFjAPfSs2XV94CXgSPKMD716GSKrDlx7PlHOFYI5dHz/REaVny4nUtViSHamyfY5kpFK
 WPVdrX6pJyvbz4+T/4EQB7FjXS/ZfKcLycnE3SbGNsMc4KnjZ4fmW57VubSxF+UD7wV2
 eYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXyj3HlAs6XieE1lzfqUgpGcYF+8UXTk6niz6BWcjJI=;
 b=H0yelaV0OkHEtn5CPL8UC/oYPeTz1Aq5nnaQlYIwHepEAJSRIluOU2l4+5y2+jQkE/
 zcpDf1RwP2OsvNqNv4ONszy8XUTRASu5/O+Y0rU6USWT4O4A9o3eQTody39lXCEmt3wE
 1RPYk3WiEXCotDfncl2p/hfvZ4WcIaqj5y+M8uKpVR8M2YNZI2X6kWVnirdd/TU/TkVo
 dKBIOWNutixF2kBbiiovKWs/4KJl6QSRhVX3ttz80UXnjWXsc5DN1/R1fypRYYUB5EeJ
 heUmiNqlQFmtv+tfwPdXC2dXxwlcKmAOioFTUN9gK/2KvMb4IMTqWMpyDsaDjZN/r8Xh
 hJLQ==
X-Gm-Message-State: APjAAAUQb47i/5Gm13WLubeOE+Ugi3V5uz60kIlUGWlkk9HQPmwwBEWp
 ESk4oHwD00aPxBKrohhreGtZxyaIEnAfP5BUz51Qsg==
X-Received: by 2002:a9d:d17:: with SMTP id 23mr47560156oti.221.1560534755345; 
 Fri, 14 Jun 2019 10:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190614104457.24703-1-peter.maydell@linaro.org>
 <20190614104457.24703-3-peter.maydell@linaro.org>
 <ab0b9cf8-98d2-1901-a8f7-259d6426f833@linaro.org>
In-Reply-To: <ab0b9cf8-98d2-1901-a8f7-259d6426f833@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jun 2019 18:52:24 +0100
Message-ID: <CAFEAcA8CkvThgBXrSJw=O4BWBBDi0yXcF1T8fgytB53AshExXQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Only implement doubles if
 the FPU supports them
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
X-TUID: Meh5PwGzvyG/

On Fri, 14 Jun 2019 at 18:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/14/19 3:44 AM, Peter Maydell wrote:
> > @@ -173,6 +173,11 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
> >          ((a->vm | a->vn | a->vd) & 0x10)) {
> >          return false;
> >      }
> > +
> > +    if (dp && !dc_isar_feature(aa32_fpdp, s)) {
> > +        return false;
> > +    }
>
> Would it be cleaner to define something like
>
> static bool vfp_dp_enabled(DisasContext *s, int regmask)
> {
>     if (!dc_isar_feature(aa32_fpdp, s)) {
>         /* All double-precision disabled.  */
>         return false;
>     }
>     if (!dc_isar_feature(aa32_fp_d32, s) && (regmask & 0x10)) {
>         /* D16-D31 do not exist.  */
>         return false;
>     }
>     return true;
> }
>
> Then use
>
>     if (dp && !vfp_dp_enabled(s, a->vm | a->vn | a->vd))
>
> ?

It would be less code, but I don't think the "are we using
a register than doesn't exist" and the "do we have dp support"
checks are really related, and splitting the "OR the register
numbers together" from the "test the top bit" makes that
part look rather less clear I think.

thanks
-- PMM
