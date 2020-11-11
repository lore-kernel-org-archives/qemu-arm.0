Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp582033lfb;
        Wed, 11 Nov 2020 08:57:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzAUmOdaqrwADVUzWAqil4LJfquOa2LsdGiHlgAZh9kk+yrsAmD8ngCiGo5+dLKeFt0Ks2
X-Received: by 2002:a25:4943:: with SMTP id w64mr34663989yba.178.1605113821582;
        Wed, 11 Nov 2020 08:57:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605113821; cv=none;
        d=google.com; s=arc-20160816;
        b=pngnQtMKQjzIskYktViDJ2wtKEStLveW25+LdOIKPCatZyv7K3GFYfjt3ArdzKxtt5
         5m924jrJrjBdsTADu2q8by+G/bIMGi0jlv7Ji81bz2xvqrxR1OVai4o7Vq/UGWstXNgs
         2F5vjLxCORgERZcvokmQbaJQPbXyBKuK0drMMTRCInFQkBtaXuF7WPOLWJPFNLrtzuHj
         bEixOgdMkKppzVrqYCGELk7BwiIu0zN5n9Onz/jab7Pxh0Op6PyOHPt4Jb8ao41wKgWQ
         MqjfkG8Ca80cX/6QW8nDS3p8OVPLliJKPMojuxOW+hhsWByUUFa+4rgO4yDlf/9iVksi
         4gbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lVjodM7AR3am98ya72xxuuQfZRvObgabsayn5FTtiJ0=;
        b=MrJTWgrov4KxEE5amYwSi2PyVi3RXgj5tffCQPiu+9CeZT1WvwE/M99bA0JCloThMY
         bxKsaEOniZpS7SKel8D2Cy+iCd9vxF53JDDAqHUK1XE8cgGuX6JDaKh0qKKzgXPuD9QD
         2hxH/OA5aPrkDeOsKi6kDMlqLdnAhuklJSUuv1mHvO/4vcuMmQjkMdKnKU0SNYeUgVc1
         +RifIMAhJuYLj/TuQNW1FI9FsQKM/3O6Yl+a8zHRGMsk0wqoEIs+GYn239BgaXBfypLv
         WbzATV2AXTJLeyQmbSiQi7sPIibI9+EWMVZkK8/iaTOyUMJinNqF4c4wTGYsbOLSrJP8
         +Ftg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ySjhuej1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10si2216032ybh.231.2020.11.11.08.57.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 08:57:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ySjhuej1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kctQb-000649-0K
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 11:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kctQR-00061v-UL
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 11:56:51 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kctQQ-00052Z-0c
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 11:56:51 -0500
Received: by mail-ej1-x62b.google.com with SMTP id o21so3720867ejb.3
 for <qemu-arm@nongnu.org>; Wed, 11 Nov 2020 08:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lVjodM7AR3am98ya72xxuuQfZRvObgabsayn5FTtiJ0=;
 b=ySjhuej1oWd0m9O6TGHTZ2PS5I6eJYqTifEjLQHT6qpjhT6tQNFgqtVwC2Qj1MUhmL
 vIZD6nWgCbKPJW3E/o0219CjJ5mbzxmr06W3eCkN41B9kavLH+thfp3xzTcisOqjK1pn
 ceXuy38hbTOjGwLC5+JmRQV5H5hw9uQFdlpIdztHHGBIGkdNi1U9mbrV8sDhpfjcwyuf
 j0tGtpXf4JR6XwpbZsuSoX8409f5rsNEwJJT+kwc0x3QK67g9gE0Hb7NCqAA6MJzemwm
 gViq/YTZle+GK6ZFXaho5rkT8pBAbQBv64rF5OUedwdFnMIg6dgYdQBbfV3kpR0Q5seQ
 ZN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lVjodM7AR3am98ya72xxuuQfZRvObgabsayn5FTtiJ0=;
 b=ZEuzlmduMBj+4/JKp5QoAVqawHcUCBZ5Nb3ZihDGvJB183GNdfjHl1QO/TEs6heHLX
 LgknXUIPHqKVs9lM2JsWPIPbQA7ojXXtYgszhuZcUp4yLDREf45Pt7S4F3LR3WFvkXNq
 PSSe4qg3rzkDYqDpCwHq9RKyhlIz+M8wt3N0+wG2TTtAMej5pgwFKBf7G2OQmn/a3pOq
 zdlZp7IuSjzbnCpkWbUZaKeBxzHWHypDG1B7k+KTIDQXILH+CPOObKlzjA6v0/g9IiZU
 RyTGjMTUG6E/79FNkmAdFhstDvZemGxkx1mKfWqNeICdTSv45pcNTC239G1hTiWGeebP
 zjfw==
X-Gm-Message-State: AOAM533jJJbc+hkuYyc9x8G5izZzJkLAemAmgygCyUZ29uVy3Tr6Ed5B
 C5oDVmcjFWQGsyYMtUg+BbvFMxXPvn4s3No2UG+5Xw==
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr27475695ejr.56.1605113807744; 
 Wed, 11 Nov 2020 08:56:47 -0800 (PST)
MIME-Version: 1.0
References: <CAB+VpJkthrifUseJdx667T_UL=579ySZ=v6+aW8bWYBcsg08Wg@mail.gmail.com>
 <CAFEAcA_RCZfCjk2_KQ=_9fhz1O6A6Ev+GNAOTmGThnAHBaxs5w@mail.gmail.com>
 <CAB+VpJkQR0kd1MY8jnv+oCVKzGq1MJR15ed1tG-MO2-d3R41Vg@mail.gmail.com>
 <CAFEAcA_p8_WfVYtxAiDJS2P2Y622Xcb-k01AJzkqtBy776Co0g@mail.gmail.com>
 <CAB+VpJkXhLTbf-REe5PXO=m_wahEr1pJMaCNYyVA0MUYLhXq8Q@mail.gmail.com>
In-Reply-To: <CAB+VpJkXhLTbf-REe5PXO=m_wahEr1pJMaCNYyVA0MUYLhXq8Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 16:56:36 +0000
Message-ID: <CAFEAcA86DhK_Y46yHsn3TqVQ6rqkPWRvzZP0Q7zvUC0-mMaNQw@mail.gmail.com>
Subject: Re: Error while configuring Qemu
To: Rajan Singh <rbsingh1983@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CnaJlysecEvv

On Wed, 11 Nov 2020 at 16:52, Rajan Singh <rbsingh1983@gmail.com> wrote:
> I am noe using ubuntu20.4 and doing all these configuration.I am getting below error-
>
> ./meson.build:568:2: ERROR: Dependency "sdl2" not found, tried pkgconfig and config-tool

It says it can't find a dependency. Install it if you care
about SDL support, or don't pass --enable-sdl to configure
if you don't.

thanks
-- PMM
