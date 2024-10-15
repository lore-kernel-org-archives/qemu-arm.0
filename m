Received: by 2002:a17:504:3c0d:b0:1be9:327d:8ee3 with SMTP id y13csp189608nji;
        Tue, 15 Oct 2024 10:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZYa6WvTmjWYWdPTOwF+NXkH/qvuZThVXfZrGUa3ilZzTC8yNCU73F62WiubltMQB/xfhXBKhM1YlXNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHr7B49G726tFjaguDwVJbL7824BpfoqfbJ0DK+IgDjyq+7G8T4/eGQU+N0lreugLNZAa/e
X-Received: by 2002:a0c:f413:0:b0:6cc:42d:bb6 with SMTP id 6a1803df08f44-6cc2b8cbac9mr17778946d6.16.1729013784845;
        Tue, 15 Oct 2024 10:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729013784; cv=none;
        d=google.com; s=arc-20240605;
        b=fKEGxZBvE74PIe9DjbLQJlma3URITc6bDwA42IN2c1KFF+v5we5QJkL3zLGt41ick0
         c4MlPGnobOy3+p5sow2D1TzST+CoX2WSgjrDo+M5LdirMVTu1D6B8Ox/ACnLgIyUOCWU
         R/Y2YYGSY2L3i5mrEAXq5/hDrXmE2IPVlN/+eqrG06r4oftvou61j0Jv9JdLLAvmMOD8
         98dea77/EIfMCqmYu+btwaCJunnjkCkbmAP84EIZ8rcj5SGVk+ER8SwffEVN9Yz+uPFv
         NLiOeP2N+TUDa5jvnKbd41Wr0Ym2lstvAZ3NdiVMNf9SeWPW5M0Tp4lnpEz1QSMfK30s
         uBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jWY7XzWZH9AEdLY2aHr1NP7a4yQuvuQNlf2nfUtAu00=;
        fh=9OtG+nPY38evXqZlrfvu3SmQVpbPFIc4th1y7V9WQ0s=;
        b=eKqvjh8q/ubvOgt6rg0MQbFciVnB5FAywQ0ivZsPOBz2VllbeaymAD2BkNkRTtHd5D
         3A2377RIW4ndy5I/ymciP8TdOvKjMhu3syRhDl3RT3ZMcZBJMVIfBYeW/0v8BYfDNeOx
         P2h5I+j8UvX4FReNeiae2guc1uZdNOhfEzqsX46mMyckXkK2KV5kZt5/UUFaDJQT+PS2
         71Sd/A5fDOj7qhOlGOsbc5hrAqcdozlnKoRtmVM6ABUGfr5DkYBHH9fld7XZrFwpsF+3
         38TpnIQXPzClFo+d0q68svBRcQqpJA4Wd3ZYEWOm5+CeYMYfZ1xrfCG/4sBSehAkJGch
         e1IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qKYsJFmv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cc22a2fc64si18662966d6.238.2024.10.15.10.36.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2024 10:36:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qKYsJFmv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0lSe-0007N2-2b; Tue, 15 Oct 2024 13:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0lSc-0007Mq-UD
 for qemu-arm@nongnu.org; Tue, 15 Oct 2024 13:35:54 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0lSa-0006dP-OO
 for qemu-arm@nongnu.org; Tue, 15 Oct 2024 13:35:54 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c937b5169cso117675a12.1
 for <qemu-arm@nongnu.org>; Tue, 15 Oct 2024 10:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729013751; x=1729618551; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jWY7XzWZH9AEdLY2aHr1NP7a4yQuvuQNlf2nfUtAu00=;
 b=qKYsJFmv8M6P/0g9djO6a5HXJiXsQJJXW5sJLuww8CSRjHusVCsEKGiFK61WvM40Ty
 0+3EQcEkv1rb042G1utQnlYsUoST4nG1HbOmSsN/ECeT3JBnQR3XqjZV9GpWKP8e9Wht
 gPxtaAvYluzLLOfi2RPcEPhSlxLpvy0uDQcwDBDyPrv1j7RqJueV4vDr6WcnBTbfFfqO
 m+hcbW9FjDoODHAJWfYHMs6ajz5/GP4/axf1x4aDtmVIRABZYOXUeQi8rD8f49EEcfKA
 2NI6IngRlg+JfU6HXb+KoBhWwBYpNE4JCQJChiGM/Bj27DoiUK6aBAXdAjOl+PdR0f8+
 yH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729013751; x=1729618551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jWY7XzWZH9AEdLY2aHr1NP7a4yQuvuQNlf2nfUtAu00=;
 b=Ltnn4qHd8I2Mcpp214sdHVxix07GwkT4A6Wwc2woHfIvkDnRwYoCwCM2eOBBZ99/M4
 0BHCrS2fTqa0XlJ7rZvVFwK+I9lXGWEHcZIxsje8Ay3W2mz5fuCzf/P69YMOLPX3BX35
 uXmYraOQZum0Yrc/JN12ZEzXmwUNWpHMEpkWJsxRWA3qmUD65OO5RikqV7+xZEny+Dh5
 0uicYeZzPC36y6oW1lueZ70sk8DLwIy4fr/GKFZCkN0FnZzr9ww+J1XHfexpDgRdcIXD
 4Z7fDv2fx7yfJhLjWUwLp/54vLlYGGbRzeCXumdeLkVechms/l3zd4Vg4yE4NeHssYSX
 70lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2JO+CZ8F9O1xtpf8B6xFOihQDs4D2ot50rc1sQI1a2Z4UTGB0QLyX+i1o54ufuFAg0ZiTrHm3+w==@nongnu.org
X-Gm-Message-State: AOJu0YxHK8QAiV+J5+JpnQ8qKycrjUBzle+Ybpkrr3Rc5flOFOXsmXGc
 Bhj4bPAef/rwCNkplh8SRk79o746kiZpaLoxWBzE9IttrHmEfQw+bjpxkJGIDK6MvAJtY/J4DVO
 wVhM1oVqRtC/BUsbJa4HPP7dA5MB56hVeXMH6Lg==
X-Received: by 2002:a05:6402:13c9:b0:5c9:46a7:527 with SMTP id
 4fb4d7f45d1cf-5c94759070dmr13772080a12.17.1729013750498; Tue, 15 Oct 2024
 10:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
 <CAFEAcA95QmpcsrgCj5uE-Ng8ahNir3MuVEHWBCvjb3UwBbOFRA@mail.gmail.com>
 <ec0e8a75-c59f-41b3-b559-43c057fca8fd@roeck-us.net>
In-Reply-To: <ec0e8a75-c59f-41b3-b559-43c057fca8fd@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Oct 2024 18:35:38 +0100
Message-ID: <CAFEAcA9AZS1dGaLG85zZE8U0d7AcrLgKXNbhxkCoP+PLmbFn2g@mail.gmail.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Guenter Roeck <linux@roeck-us.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>, 
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: uPko3pt2+3lg

On Tue, 15 Oct 2024 at 18:30, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/15/24 10:13, Peter Maydell wrote:
> > On Fri, 8 Mar 2024 at 15:41, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> Thanks to everybody for your input on this thread. My
> >> proposal is to drop from QEMU:
> >>   * all the PXA2xx machines
> >>   * all the OMAP2 machines
> >>   * the cheetah OMAP1 machine
> >>
> >> leaving (at least for now) sx1, sx1-v1, collie.
> >
> > This has now gone through. I'm now looking for test images
> > for these remaining boards, so we can keep them from breaking
> > when we do refactoring and code cleanup/modernization.
> > Specifically, I'm looking for:
> >   * QEMU command line
> >   * all the binary blobs that go with it (hosted somewhere that
> >     doesn't mind when our CI downloads all the images to run
> >     its tests...)
> >   * ideally, exercising the SD card interface if present
> >
> > Could the people who are still using/testing these boards
> > help here ?
> >
>
> You'll find everything at https://github.com/groeck/linux-build-test.git,
> but give me a couple of days and I'll create explicit information.

Yeah, I had a look at that but could only find the rootfs
and got a bit lost trying to figure out what the QEMU
commandline would end up being :-)

> Is it ok if I create a github repository specifically for this purpose,
> or does it have to be direct file downloads ?

A github repo should be OK -- I'm pretty sure we can download
from there (e.g. we already download some rootfs images from
your linux-build-test github repo).

> Note that my tests only boot from sd card for sx1. I also don't have
> tests for sx1-v1, only for sx1. I don't recall if I ever tried sx1-v1.

Looking at the QEMU machine model code they don't differ
much -- sx1-v1 has a bit less flash, and that's about it.

thanks
-- PMM
