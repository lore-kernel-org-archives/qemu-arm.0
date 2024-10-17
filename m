Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp225037njb;
        Thu, 17 Oct 2024 07:29:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdzm3gr98LKZdw0S8mYqmzv/E/WkNdNzHlhAXeK6XhNFAsyOOJu0NjYoE2nzpr9yA3UKEEDRwJAfK7VA==@linaro.org
X-Google-Smtp-Source: AGHT+IE2MoYeEEjHkdn/vfhju13gXF4gUV00uZvXiT7pgtfSA5CwuFezAWHI0B0/uhgvUuqpMQbn
X-Received: by 2002:a05:620a:14f:b0:7b1:45be:2e98 with SMTP id af79cd13be357-7b14d4ed73amr479675885a.10.1729175385828;
        Thu, 17 Oct 2024 07:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729175385; cv=none;
        d=google.com; s=arc-20240605;
        b=aQdhfEnEaHiQxpw7gbYKYag0+tULg/9MnYr8Zx2D2XayDgYfxp2/FCmAtObh3G6XKB
         OjcZgrJtnuWcdmG/5KeLQ7lH24zGo6CLSMkYRYutvcuIt1rvBNTS5kMV8FZF8UUgZes2
         RXlYvwjYl5Cr4h7D3Q+0e2Q5yzmn2l2QrJO89hNduVwSIqA3QdhzXzKacl6QHsQbU7bw
         4X1BoDulXmY6lV35C3dlYA+8xQQK3SWEeMCgNyCozgBqIwNnM86TpKMbQLq9BEJurArH
         Til85VFX53bCnbjr/cw30rCmmcMDH4Xn98+B7AqPfMudnyprqHXiSKQ4jO/uNKns/8ps
         Lz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eFOX/syYZtwFsFH68uKcljYWd2x+NpIGFddXxltWQT4=;
        fh=7maRKT9LqA3BpFqdS1gogBg4HezHCYNrwe6cprQTJjI=;
        b=S6+yT/FUcL8bT2w5T+pUpmvk0Yx6nw33d+BNxG3EhSDYnTbZ1VFX7SK1XmM60JV0DL
         hmPpQGBYhjAXY2eOk9eBAhTzQ77Cyp9vNt0R07S6rtn2x0QZ0LreegsC9O8D4VrgFg+Y
         0dVSlqvo7fxBF+MDJlfsI3PHnQQAyBajenrIGzeMriKVqtL3n8pRDjw12pSUfVDEbVzN
         A6yj0T4OCJ1l2lqTd48KGKh2uL0IjFuTV0ETyCx9qIDqgj1ErBWxx2w2K9IUByU4jaSC
         Yt8mO6rlghHFos02AGPNyHerMGeMt6P8wtu7xXPDM4DedmsUuahI6rYJtg1BMRb9kHzP
         4NsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WHED6oxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1363d77bbsi625029185a.280.2024.10.17.07.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 07:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WHED6oxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1RVB-0004U0-RC; Thu, 17 Oct 2024 10:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1RV8-0004TS-0T
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 10:29:18 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1RV6-0003QA-Cg
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 10:29:17 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so1840317a12.0
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2024 07:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729175354; x=1729780154; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eFOX/syYZtwFsFH68uKcljYWd2x+NpIGFddXxltWQT4=;
 b=WHED6oxLn4Xhi3XTN40wkTNSqR9gDD/RwNRGYDH2lpjbH5oEuF1Ti5wQqcWHE+ECO2
 8G9rmv3KAtRti9XOqAr0IqAxqiKSiRby93Eza+XR+dsH4AmUeBIRHnDGenTj1RIVpHRq
 kU7SHTw1s6OC3zLv7f522cwQI5XCSCJhiitrgVN9kz7Jhd+zbgjGfMVk7OMRjurndxkY
 weHBhRhbjWL68hJHfxYf9uXC0Zn7XDAiNIDgoJjjUSxOQLbUdIBLqXCHYPhfGoc2e31l
 o+DowfALngPNNQzsawAJtbELSS3SUfgq4Q1mT+CH7uI3O2jF8RWwHiPCon7mYgjPbYVG
 wKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729175354; x=1729780154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eFOX/syYZtwFsFH68uKcljYWd2x+NpIGFddXxltWQT4=;
 b=n15N+VU2medlCJ8X/pL5FYy0XvI+xrU+A25kb2h9vQQXyl5KPLWRBBF8XL4anyUQxX
 EqAGzG+JCBCXkeOELiYKjpSt8ivFjnr+S50/p6V+pM5bzfWeDsjUUT5OMaLrBqALUBwF
 otAdehZDOeLzp4lfC2Iilmu2VF4848TTY0XxCm8SLluXQ2KQGuHYoLWXvj+sQRUgRZOJ
 NlS5Py/ZPdGIdtPfgGQTMo6pTK409IbDwV7YyOpM3wxm4TNjrhgqVdb1A+ZvgkE3nO4y
 r9wLrAsR/dC7lZ0JnHGF05sdBv/QnGXjH/5KGG7XgPvvERmx4xWy5s9fkvxvSB5fu6Qh
 l2Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtsuY6N4ZPttEFSoBasBeIAXwJKFlX60hVaWR5WIl8IKo55wqCk2tbrbMMbcEvjBVtmaCSwe3/cw==@nongnu.org
X-Gm-Message-State: AOJu0YxWKY1DOTo6kYc9T52ht6Qcai8tOmumK6A08wHoV6/88IX2upah
 vAM/66Bvo1BUrDBqEC18W/H5H7VeoB662rvR+mKjFCVbHns7NX2W/2xeCBhCQ9fzyk98VI4u321
 YDqidxdkJBK+JQs/+Vqaz+zZxXYqON217omWpUQ==
X-Received: by 2002:a05:6402:4404:b0:5c8:d9b8:9325 with SMTP id
 4fb4d7f45d1cf-5c9a5a1c1aamr4631517a12.5.1729175354260; Thu, 17 Oct 2024
 07:29:14 -0700 (PDT)
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
In-Reply-To: <c354e331-39c4-4520-9a69-b62a8ecdddbc@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2024 15:29:02 +0100
Message-ID: <CAFEAcA-NreDmpCoFgrTJ5dEto5jQbjRg1eCfqg9Ns8VwQ9-Qzw@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: Xgqkjd5SfZip

On Thu, 17 Oct 2024 at 15:12, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/17/24 05:42, Peter Maydell wrote:
> > On Tue, 15 Oct 2024 at 19:12, Guenter Roeck <linux@roeck-us.net> wrote:
> >> Please let me know if https://github.com/groeck/linux-test-downloads.git
> >> meets your needs. For now I added 'collie'. I'll add more after it is
> >> in a state that is useful for you.
> >
> > Yes, that's great, exactly what we need. I've put together a QEMU
> > 'functional test' case that downloads the collie rootfs and image
> > and checks that they boot. (I'll send the patches for that out
> > in a bit.)
> >
> > (I've coded the test case to pull the binaries for a specific
> > git revision of that repo rather than always-from-head, so
> > we're testing always the same thing against head-of-QEMU.)
> >
>
> Sounds good. I now also added information for sx1, so you should
> be able to use that as well. Please let me know if you need any
> others.

I think sx1 and collie are all we need currently.

By the way, it looks to me like QEMU has a regression
somewhere where we can't boot that sx1 test for the SD
card version -- it hangs during kernel boot waiting for
the MMC card. (An elderly QEMU binary I have boots OK.)
I'm looking into what's happened there.

-- PMM
