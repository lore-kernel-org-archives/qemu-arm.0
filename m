Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp397334eje;
        Tue, 13 Feb 2024 13:28:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVijdXeax6vUK7uPAJl2/d9Cx1c88yH8XJMMdHh+ok3HDceY5i4fuNPPQcpXCbSQorv+AEyOy9pP6UNxV0xk8BGQk5Kr7pO
X-Google-Smtp-Source: AGHT+IHtf0kKdK6KmOZF8liXTcOiCOkkH6XThjjrrrOdhnnq2INL46OZMbP91MZq9gHjSuIlxUOV
X-Received: by 2002:a05:620a:c84:b0:785:d9b4:ad4a with SMTP id q4-20020a05620a0c8400b00785d9b4ad4amr793758qki.4.1707859681011;
        Tue, 13 Feb 2024 13:28:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707859680; cv=none;
        d=google.com; s=arc-20160816;
        b=hrrmz/myfFrrO0a06emvaDtxaq0yM0F/00kJAmBTql/PqR3DcaAc4LuGbupOVGUl6C
         x7x95XyHPfxmlFzkRMy0SAe6NSOVFa2z5qFAswWWr+uzGhxOdVigfaMz5mI3kCMfpcoY
         G23q/MkGpfuq8gH/Q8CAPkxnrCAYDdY5s8urfkKDcu+W772nqz03cvuFyNuAejZwwMBl
         rWrpoLbGZF91/bywDUMzLPxG5+rg0saIhyadbtcPAj0K56CPlg+u7CpK5t/AQxy5zU1f
         RmL5Cggnpimeajt9LrB7lVjJvVXpnGBYu+juyDGLQFsSeiJcEFmXZcet3Lzrxe2zDkMS
         mVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=DlHB/C070gQJYtZKeDqoDoUjH6sfS2fU7WC1adPgbS0=;
        fh=L479KsxpZJCW9hkcoknxpJ7nUHImzJZvBR41zwzsrS0=;
        b=BE/cy/rL9eZ4DSLsc8VXwQKoryi13X9Y95NmwXwm0sGu3apQobpQ6VwI6voXfdGle/
         KgIJGR9BLXsF4eETYinZ2uMvQ5bAGQLmJnQqGxPnrXrtIAkihSHJo2oCOKp/vqivaIRV
         WAILSSRf++VsuQSxpz9XXuN5kFi9IwOk7yny/+ZiMdLmCvfXUoo2dUDRTRofaRRhLLmQ
         Le7tH5ZUB/sqTy/PXZMIwMgGFxTqwwz/1s36KwdabKxyf4vasSBzoR58PQIW2jC3CKL4
         EB4u2Pj9dhQLq0E2N0yd7j2lKS8zCc0abmTZgmRFS3b62NtJVvHWUaJ1m7+soEqmcAE1
         mMUw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oiWznPyM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCUu/aJr9YGwRKPT7YKLNJ+8daF0C8eNP+u1ORO0vjt7P45GILkLY5wanl7xBRdM87nc7jf17+Hj+QzG7kcZbOvAE8cplStF
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020a05620a0ced00b007856fcf3292si8509348qkj.77.2024.02.13.13.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 13:28:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oiWznPyM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ra0JR-0003ci-J3; Tue, 13 Feb 2024 16:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus.walleij@linaro.org>)
 id 1ra0JP-0003aN-V0
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 16:27:31 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <linus.walleij@linaro.org>)
 id 1ra0JN-0000IC-Cy
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 16:27:31 -0500
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso1271536276.0
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 13:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707859648; x=1708464448; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DlHB/C070gQJYtZKeDqoDoUjH6sfS2fU7WC1adPgbS0=;
 b=oiWznPyMTjnq353rR0exH09Jmfeg6D9LbKSqIBGCvaqjdQyw7cnSOSLasAFpJVWftz
 YmvrqgKbxZCPCqP/ZOkweH7R/aNHj2y675LTXEbfEXID+kz5gQ0uuyFx1ejn4tQRq7Hr
 k7jTVKbhJcXwnOY0/xnkv9XMoDikVIIMo0UNAuIsAiwI2p9Cls8MWd0EdfMBZUhZxNuw
 q2jfIddiFguznM8/jDRp2XplxZxBqiBCmdAv0Gw9c1PaDP/UHyY41SGcWtFpiBDuipSn
 0Is9ak/0GoSDfu8cJw/48R1c4BFedDCEmGkrUzftJxWcE5fnp0k8sFPNnhZWODDDoY0Q
 VeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707859648; x=1708464448;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DlHB/C070gQJYtZKeDqoDoUjH6sfS2fU7WC1adPgbS0=;
 b=ikVr+qBpJgyb1KHlXnLJ7Pm1cmIzuo5waMxWWQ9tsMhyIT3SlsNGVXZXejqVy/npdA
 ogTWYzxO4Qs+6/PVY9WpHpE05z0YhCpafTtUqAlwwxEI18f7PjhK1lJjJaweaMOuKI9q
 N3RCMyaKhAZv8RCBNaQnHAU1RoFC0/3oaQCsDoHhmmjPY+TlrcVu/r7jHAQ6aArR5d3T
 dgksyicyCRiNB7gWVhmeEbj+02jCxLC40wmN6DN1jZoDMrrkG/SWV4bhRJYxTG4vb6ZP
 TWCvUHvQUW0HXUMVmAuXu1EyL+aT1qNtTUp/TEPSEBBUy8NDprStoVVkqjppg9/80q07
 C1mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUsBTabocekfljvod/YGdtM8bVixKWc/+p57AVm/1/Dda+FOLt+xEISPVjq/fi+/Xdfr6Hq43ASutba0pg0H+3aqnY
X-Gm-Message-State: AOJu0YxBzppeZAXjk7X5gc/tBYxmNdLyuNUb104TywGsDbxEB4ft9Y82
 /YySmVwo2v0KOrsiUndOHsp+xJwvZywsF5dVUREw71p6MyiHFOkQrHjf7QiaoA6ShtdG5QApVTn
 SNmpsuTEZOLyrws9Uz3uLTKApzpXHVVNhTSM/JiDmlmWeMy3A0ylsYQ==
X-Received: by 2002:a5b:54a:0:b0:dc6:cd76:5ddf with SMTP id
 r10-20020a5b054a000000b00dc6cd765ddfmr468191ybp.39.1707859321685; Tue, 13 Feb
 2024 13:22:01 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
In-Reply-To: <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 22:21:50 +0100
Message-ID: <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Arnd Bergmann <arnd@arndb.de>, paul.eggleton@linux.intel.com, 
 Andrea Adami <andrea.adami@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Linux-OMAP <linux-omap@vger.kernel.org>, Daniel Mack <daniel@zonque.org>, 
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Stefan Lehner <stefan-lehner@aon.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=linus.walleij@linaro.org; helo=mail-yb1-xb31.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: t3T1ELBObshB

On Tue, Feb 13, 2024 at 9:12=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote:
> > On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:
> >> On Mon, 12 Feb 2024 at 14:36, Guenter Roeck <linux@roeck-us.net> wrote=
:
> >> > On 2/12/24 04:32, Peter Maydell wrote:

> >> > > The one SA1110 machine:
> >> > >
> >> > > collie               Sharp SL-5500 (Collie) PDA (SA-1110)
> >> > >
> >> > I do test collie.
>
> Adding Linus Walleij and Stefan Lehner to Cc, as they were
> interested in modernizing sa1100 back in 2022. If they
> are still interested in that, they might want to keep collie
> support.

I'm not personally interested in the Collie, I have a SA1100 hardware
but not that one.

> Surprisingly, at the time I removed unused old board files,
> there was a lot more interest in sa1100 than in the newer
> pxa platform, which I guess wasn't as appealing for
> retrocomputing yet.

Andrea Adami and Dmitry Eremin-Solenikov did the work in 2017 to
modernize it a bit, and Russell helped out. I was under the impression
that they only used real hardware though!

The Collie is popular because it is/was easy to get hold of and
easy to hack. PXA was in candybar phones (right?) which
are just veritable fortresses and really hard to hack so that is why
there is no interest (except for the occasional hyperfocused Harald
Welte), so those are a bit like the iPhones: you *can* boot something
custom on them, but it won't be easy or quick, and not as fun and
rewarding.

The thriving world of PostmarketOS only exist because Google was
clever to realize devices should have a developer mode.

Yours,
Linus Walleij
