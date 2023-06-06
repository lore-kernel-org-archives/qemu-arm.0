Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3353435ejb;
        Tue, 6 Jun 2023 02:12:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hlvsl4Ob71kjYLP9Xg1S6LxNTOIOIFAg1UkD+GpvsJL+/zDPrvQKXEvmGiioCu+pX1OGM
X-Received: by 2002:a05:6214:2343:b0:628:c4c8:4afb with SMTP id hu3-20020a056214234300b00628c4c84afbmr1428008qvb.60.1686042772742;
        Tue, 06 Jun 2023 02:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686042772; cv=none;
        d=google.com; s=arc-20160816;
        b=iovUVHQD92rlbaXFjBLoPmIBR8MhfOURjnCNiU2zbUgZxhO1zUKf4tMkc0D2WWAxGb
         YF4eqINdep6lL/1ZrrGONFaxdXuQNGMngMhJI12tHjI/S9ceZMThvnOcnn1P7goopfj5
         yZME+MPAak6B1a3bMBYairj8I9hp1RcqRaD+JGKxsJFF/7GDMAWniCYOlRiE3QQZ136r
         QbOFlnFdOssIqq3+X8ncTwkPeYAgKZP9fiUgKXJQkEao4Ac8MnDZTqtnXddczoU0TW2x
         FcV9WKSw0RNHULOeac0Q90Dfy637DlC5ORv2/Ajra7mbQ2Adw3Ru1z2O71DH+iZktRE3
         FAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tiDar866s5TmhG9pWDLr5zJtOzWKJD+/fn0PL+KID9Y=;
        b=sxA9wOozGaRIKEAHGyZOKbWEpZ3s6yyCDMQTugRGKUNLiItbv/YLyOMyOmUqer5LlQ
         z8QLVxG1QQxZ7/gP+pfCFpCbSVwhOqWKDZlT1ythtXPmwcuPYHRPiGAYgs+WALlXzPFR
         qccEmBXAHpsz+AiTpYFlqdTrVw20hhXN5CsIUxnIuYqy6IpWsX1hyQIA/j8lVcI9Tibm
         zi17qSmWYmBIVmzoxwmHTYKrPachRygutRQQDKMHdQqfg2hPhyvQbY9xwGTGTDUtGYPX
         0RW93eksozjrcMU0EkxuRmiNctiKwhd4t5EQnrT7vXtmNk0WAmENv9i3EdQyjQQFv9jU
         8wCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgVA6iYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11-20020ad45c6b000000b00624d4b91560si5941661qvh.395.2023.06.06.02.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 02:12:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgVA6iYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Sjl-0000ML-5r; Tue, 06 Jun 2023 05:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6Sji-0000M1-U3
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 05:12:19 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6Sjg-0001YT-W7
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 05:12:18 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51456392cbbso14301269a12.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 02:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686042735; x=1688634735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tiDar866s5TmhG9pWDLr5zJtOzWKJD+/fn0PL+KID9Y=;
 b=JgVA6iYRhpft0dcw1/ePERj9NoEnL3boWnbkBeHzk+c3KKmTSsb0uuaHjk4o0GI1JO
 rI8jjEijuy4h9vAqz/gyWSAq8CWMf6o8yiRxI6f+a4Qfc9PNli+J3fRKtvXts4vX6rbO
 oioZiM/4RUglFs+BJD5ELNmyOgNnZe/A71JGU9Fel9UPuQPZ0nsK9eOYBRQX6nyQle7d
 YLKzfnUkeI9pG9zSruNrB+wz+jp4ehkJhuRd9Mi4Nu9EmMvCn5FzGcldGcZCSM9lqzMt
 l9onEuMzAmQBrvvEM2y+hh1YKav6J84vGTlGgQcOhgfeXsj/yIS2vE1PKQaaNRNbgFkf
 KWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686042735; x=1688634735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tiDar866s5TmhG9pWDLr5zJtOzWKJD+/fn0PL+KID9Y=;
 b=NG2Nyojekd/gGWU8p/qKKcZvDYmXk5N2U97J0XNHJ1CPKDE9RPInRagT3/nx3TOJgT
 yNFNgQKgfY600wsD3WuAL4H+aWgsih++6+hc7NfXK2dnJlCVZ5P2AOOJlXbBT4EAQyLP
 0n93OZnKfI58TrG1WJ9IaK80kE453v+TsaGV/F16+GM2McPjNR1LEmRYVK1Pg8bDBtZk
 aFT4pq4xphuI1lZwWqeAyMAFy+93UIFwIOpnNtv2F2kXN8ORSoP82u0RyXMBtTjgmCcU
 ArR7+8b82fYSgKF8uZv6VxcIV2/n8tjEv9k7YxqjkFydYxUzvpr3Ra/mXE8IyIccM+Ia
 fxrQ==
X-Gm-Message-State: AC+VfDxd8Bu9I+s0vw+DiFN+6lE4+FLtOOM2C6hlx4CCfCcpVzdbvkuF
 Qd/xEQKCxBtYiWOpJRlDE/Pvbi3vRUzioK0o/KMfWA==
X-Received: by 2002:a05:6402:50ce:b0:510:e8dc:f2a7 with SMTP id
 h14-20020a05640250ce00b00510e8dcf2a7mr12623692edb.7.1686042734711; Tue, 06
 Jun 2023 02:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <MAZPR01MB65775A1B6CFC1C1BD52A86BDE94DA@MAZPR01MB6577.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAZPR01MB65775A1B6CFC1C1BD52A86BDE94DA@MAZPR01MB6577.INDPRD01.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jun 2023 10:11:40 +0100
Message-ID: <CAFEAcA-sP5KMc3Tn9euZViMZHohEwUE_9eRaYSYnOKvDaG8gAw@mail.gmail.com>
Subject: Re: Need help getting QEMU to run QNX ifs.bin for Raspberry Pi on QMEU
To: Ahmed Elsaka <Ahmed.Elsaka@kpit.com>
Cc: "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: sN/rB5PSe+dY

On Tue, 6 Jun 2023 at 02:07, Ahmed Elsaka <Ahmed.Elsaka@kpit.com> wrote:
> i am trying to run QNX ifs.bin for raspberry pi on qmeu but it is not working :
>
> what i actually did :
>
> installed qemu-system-aarch64
> downloaded ifs-rpi4.bin file from qnx sw center 3- using the follwoing command to run this "ifs-rpi4.bin" (image file system on qemu) using the following command :
>
> qemu-system-aarch64 -M virt -m 2048 -smp 4 -cpu cortex-a72 -kernel ifs-rpi4.bin -nographic

This cannot work. In general, Arm boards are not the same
as each other, and a binary built to work on one board
(raspberry pi 4) will not boot on another. QEMU doesn't
currently have any emulation of the rpi4 so you can't run
the rpi4 QNX image on it.

> I also tried to use board which is supported by qemu like
> "mcimx6ul-evk Freescale i.MX6UL Evaluation Kit (Cortex-A7)"
> but i still facing the same issue.

This has a bit more chance of working if both QNX and
QEMU support the board model. Here you are probably
running into the problem that QEMU does not emulate
the i.MX6's "boot off an sd card image" process. You
probably will need to pick apart whatever disk image
the QNX build gave you to find the actual guest binary.
(If you're lucky somebody else will have done this before.)
You might also run into issues if QNX tries to prod some
devices on the SoC that QEMU doesn't have emulation of.

thanks
-- PMM
