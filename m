Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp291390njb;
        Thu, 17 Oct 2024 09:08:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVFxNqJa+Q5bA5F0Liv+q1+Nn5B40axU4Ica6+VpCXgyDs2NxWwKSKa+r3fmZ0qzjDzH9LOUvYLfq2mg==@linaro.org
X-Google-Smtp-Source: AGHT+IHMvYJjUC3dQEQ8uRhhNaeDjSxc4bviEV7GfIFOLeeUjsTpzYHmdiWviJw6wuLERqMlLiIg
X-Received: by 2002:a05:620a:2992:b0:7ac:a077:6a3d with SMTP id af79cd13be357-7b11a34b07emr3145603285a.10.1729181315578;
        Thu, 17 Oct 2024 09:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729181315; cv=none;
        d=google.com; s=arc-20240605;
        b=BwPLqQaiNJKbtPdYmzh3OUIctrJB9P+q6sQKiYikjQ9MklUP0pO0zFGqLeW1OGnW/L
         sFpkg+omXPOMId3jLN36qPSgi389iMljE136E8eCrUW5y556DsfcSMRTlFpn5Lt71PHf
         erDotLncrZw448JQXK1bpJEuCwByHH6jgaO0nznyyyG5IoHmlqdo9icwXkRtOYU3EoBG
         FExX+6oDt09D8eIugK7wFLbWBQ/dSthOBl94z61ayEKy9t9Rb6ZYqaIc4cHKQWbIDtr0
         1HaQ8u1IQoWP70XtgpFlBsuPbBHhbalZBJjMEMDKXPLdXD4lwtfiMN2tnji7/RThDsXj
         s8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dRuk12QHv6ps7aNLPKYR+/znjdtbp5GFRMiK+/8rOSc=;
        fh=01XlHaKWs4mKJHyJ64HaU9/GaD+UMq+afn2/PJ5cFuI=;
        b=NIjrS75XTLe7BAvR8+6mql/uIc24OBya/L239uf/H4nXVzzObFJ/n4lR45BZZjtjh/
         uT87tKHY0FBGPgzVH2osH3rUviJBYrrT7eyIqPgZuX+LW3Gr/qOm4GQaggap1a/t9yhD
         Q1WnetpC4mvuBagRjOrl2Ch6JsiAYY1aObqmINEk6tHbiYGgulzjZW9tSsuumI3PgKsj
         ITmH1V8I6VQLIFN+i0ad9e6Jopkda8NtlT3o0gEu7ktE19cV61BG2y3+CCKRAsiw6v8B
         TrwmnYzzad9WDbGYipEaLF7VaHvAAWAHWP90SK7JGqnmMiilZN4dmZ7SECVAaRD3N0V3
         xvBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XoF6Xudv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b15545bca1si40568485a.369.2024.10.17.09.08.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 09:08:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XoF6Xudv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1T2g-0002Lp-0d; Thu, 17 Oct 2024 12:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1T2d-0002Ka-M9
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 12:07:59 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1T2b-0007Ds-O2
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 12:07:59 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c9150f9ed4so1386721a12.0
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2024 09:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729181275; x=1729786075; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dRuk12QHv6ps7aNLPKYR+/znjdtbp5GFRMiK+/8rOSc=;
 b=XoF6XudvlXNAC2P6Wu+8Is/cOa8A8XjYDjPDB17ENu2uWbR1MelRBQ9AXjya0DyoA0
 VKHEpbJDN9meUQKmph26OO8pJfzk51iDaLSMlo+0ex8H5Lzs3PNFXI09gCllsoV0JopF
 velUIf06eDd2ODsV63sL8S3nvtS29K4Oo3u6YBSaDOVNil/lMEwCDbyVOtlcAiRSE94O
 ubCxjHu6yW5hUtM3oZQP/O7AVTuhh6xDcDa4WME2EWNKAVq62T68RG4gX51Fy+R2dSKE
 FTd7Rd7gR5yJ5mEPbhl6H9jIdURxj5+7noiFhtueQJM3wJLNOd0hLQB5H5FC2m4Pu1b3
 becA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729181275; x=1729786075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dRuk12QHv6ps7aNLPKYR+/znjdtbp5GFRMiK+/8rOSc=;
 b=I5w9HrfTnFo0A8QTimCgkDJQYl6tGP44R6W1CGnD8BSsyIepMTJKbjE8NhgObtvF7V
 o2CfFEp4Bs5KDUWXxNfvPMtDaCjJfVnhUm+CdVGR7UMW18V/n+y5mTcvy43288YqeSDD
 lKBJ4GwME7wsiUC/CFmy9oC/1HZtLIFRiJOfOEdIQKbnlDGfmNqNM4PpT7mdRk1d279G
 mA/MZpMXLoKsagiMu14M8dwvZO8A3r9FR+MgndWpQgz2VHaltH/gLdgtQJqctCA8ukhh
 3Rjj3ZQwZub8mzt/nPPJMj819a2vozp4bJ408RYMLQ0iKAFoQlCR6wTTIQwGbGbrOMPh
 iOFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYI9xhqkvt3iAQhRiWsqYF16YjgVoQR0PnK+7NjOku0ICopa+1XKmGbdby7xshccgmBeBemKb4QA==@nongnu.org
X-Gm-Message-State: AOJu0YxwftunHpcv+HcD3OcKT2aR1YXg56kD8x7jScLR7YpTMhPt70uG
 +X56B9FKBzVJoewQEZYrDEbwTf4P0gM39YFPuqNn6/uctiEbvlN1+uaV2pWbaqorGlYgfH+RbNI
 PHfqykL6L4Q88rBKiN9yybdcCA7VGeCRkZY2Hbw==
X-Received: by 2002:a05:6402:350e:b0:5c9:5bcf:db95 with SMTP id
 4fb4d7f45d1cf-5c9950618a8mr6873634a12.16.1729181275258; Thu, 17 Oct 2024
 09:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
 <CAFEAcA95QmpcsrgCj5uE-Ng8ahNir3MuVEHWBCvjb3UwBbOFRA@mail.gmail.com>
 <ec0e8a75-c59f-41b3-b559-43c057fca8fd@roeck-us.net>
 <CAFEAcA9AZS1dGaLG85zZE8U0d7AcrLgKXNbhxkCoP+PLmbFn2g@mail.gmail.com>
 <cf7c8f57-22d5-4a40-bd87-0f15f5457d48@roeck-us.net>
 <CAFEAcA98=2OdT9ykg5ibDuVLtSXuq4g0PLmSbxkYmt1SyKe9iQ@mail.gmail.com>
 <c354e331-39c4-4520-9a69-b62a8ecdddbc@roeck-us.net>
 <CAFEAcA-NreDmpCoFgrTJ5dEto5jQbjRg1eCfqg9Ns8VwQ9-Qzw@mail.gmail.com>
 <2e8046a2-c229-4ed5-add1-d31f437325b9@roeck-us.net>
In-Reply-To: <2e8046a2-c229-4ed5-add1-d31f437325b9@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2024 17:07:43 +0100
Message-ID: <CAFEAcA9AfH7cTO8TYSh9E+FnYN8SbTLDkXW8W5Jwi9Kfcddr6g@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: a6J20lawxLNk

On Thu, 17 Oct 2024 at 16:29, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/17/24 07:29, Peter Maydell wrote:
> > On Thu, 17 Oct 2024 at 15:12, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 10/17/24 05:42, Peter Maydell wrote:
> >>> On Tue, 15 Oct 2024 at 19:12, Guenter Roeck <linux@roeck-us.net> wrote:
> >>>> Please let me know if https://github.com/groeck/linux-test-downloads.git
> >>>> meets your needs. For now I added 'collie'. I'll add more after it is
> >>>> in a state that is useful for you.
> >>>
> >>> Yes, that's great, exactly what we need. I've put together a QEMU
> >>> 'functional test' case that downloads the collie rootfs and image
> >>> and checks that they boot. (I'll send the patches for that out
> >>> in a bit.)
> >>>
> >>> (I've coded the test case to pull the binaries for a specific
> >>> git revision of that repo rather than always-from-head, so
> >>> we're testing always the same thing against head-of-QEMU.)
> >>>
> >>
> >> Sounds good. I now also added information for sx1, so you should
> >> be able to use that as well. Please let me know if you need any
> >> others.
> >
> > I think sx1 and collie are all we need currently.
> >
> > By the way, it looks to me like QEMU has a regression
> > somewhere where we can't boot that sx1 test for the SD
> > card version -- it hangs during kernel boot waiting for
> > the MMC card. (An elderly QEMU binary I have boots OK.)
> > I'm looking into what's happened there.
> >
>
> Yes, you are correct. I did a quick check; the problem started with v9.1.
> v9.0 boots fine.

It's an issue with commit 1ab08790bb75e4 -- when we did a refactor
of the SD card emulation we didn't notice that the omap mmc
controller was also using the sd_cmd_type_t enum and relied
on the values of that enum matching the meanings of the
different values of the controller's MMC_CMD register Type field.
I'm just testing a patch.

thanks
-- PMM
