Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2160383ejf;
        Mon, 26 Feb 2024 08:24:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWLQF7JbV8t2290/CbCzkpgl8tRD/rBoj80A2VcPo3gehgf50ZQW4e1BhTPjjaL7qQGy7/JYKsD1E9g1AMAqiv/iDL1s7QE
X-Google-Smtp-Source: AGHT+IHSGvY2yxJF2Y4HdORFHgDC8IQ1rrEl0Nfjpz/3xlDgv+dTdDCNky6CogHegb2WHL/fb2H6
X-Received: by 2002:a05:6871:5c9:b0:21e:8af9:eecf with SMTP id v9-20020a05687105c900b0021e8af9eecfmr7469678oan.47.1708964652463;
        Mon, 26 Feb 2024 08:24:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964652; cv=none;
        d=google.com; s=arc-20160816;
        b=tLgudQfiIYVinxqiVmppzrV7zw4t+TO/9vPPdu5iIZyuQ8h0n1cjmj8+L+G/2cLPfB
         2tI26SrCCbTCytNYKR4UrnVRHUBC4RMMdV9xIhRm7l9s8HW7aq0siH7Tmr3zvEvyQhcw
         Tg2wI7IdPgZajm7mcaVWPaGGdebJBY1xFGhG+qjKUGFxHEA90gyJIzexd3e7xAfYa0VG
         VCGX/4Q7fSv4BJjhD4gnXTOvyeeBBV/dwgGEe5jQ5+iiLxer/+WABP7S/WCiAWh1f98j
         R5KQmzJcOzBvcWL6ON+WgMC+LeRFXeMLrVgtwQsoqyaQVQPg/nErcG3hUstHJkkkfW5m
         7IMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BOf/GIBLFelQSVjCVJ++neGthLgtVbIJKZTQ7M74zO8=;
        fh=Nh+APVD3f+xEWf151l1cprldC0GI/ShULkudm1GclG0=;
        b=N+hAa3lkYuAbNpjHTHHzX7LIzUTY8ESrgvtO4Hn2/IXu+rkkVeb7LZKYWyd7/NhgPQ
         4Lqu7GcWqcMK7OE0qw/wNKVSyG520wHEC1LR7j1eb6gOeopj2EOPHjbyGOiFr7J9RxfO
         JE3uLZQEMrotB4PR4FAasoPaj5G6NBYLoGR+UV+5J0n+mCP4JZt9Ms+eFksJ2czKVt26
         vEH0KzuGFCKrEohFhRSN6qKXo6AzuOqqc2itLhb/Br8cPk1F1cJp7RuS2xdRcliuEp8Z
         9MEpQUeoXbOoPkthsAKHsY4/Ucl1vzBWV5foeJw5U1yBAz2iHjz1paAz82bRVKNCWPZu
         wPvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x+zrHqad;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a05620a084d00b00785d846cf6asi5196025qku.393.2024.02.26.08.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:24:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x+zrHqad;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1redls-0001j2-UU; Mon, 26 Feb 2024 11:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redlp-0001Yi-JA
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 11:24:01 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redlm-0001Cu-U3
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 11:24:00 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso4534520a12.0
 for <qemu-devel@nongnu.org>; Mon, 26 Feb 2024 08:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964637; x=1709569437; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BOf/GIBLFelQSVjCVJ++neGthLgtVbIJKZTQ7M74zO8=;
 b=x+zrHqadEHsaCuKq0JWP6acDSfBsTV1A+S07WzBne2FF8DfHhAmdFIQpYijxuyQuM9
 Ou6nd9cXh9UBBFxOyARQNnGB7Nc92FPTzQbjDG73kO1Y5k8KkSPjzOSmyekeeSWeMc0E
 KUHtbDfI35+B+PVJFXq1EREy5Qbhde8GsFN3viuZPoEXS8eEixeXk/Fhp4B59uPT3XzH
 gxJVqPH8M4CZdXvYUMbN5VlV3Bn6tEiDeDa8et3D6EGMrqYNx20RNn+GOqMLCKJxoD7n
 z5PjnEUTN024QSbeTwmR+GGWpTu+1q7YIbu/5HLF8DovpEO8M1TZIMpzN5+OZLfDX50C
 +bKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964637; x=1709569437;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BOf/GIBLFelQSVjCVJ++neGthLgtVbIJKZTQ7M74zO8=;
 b=roP+jP4Xde/crDvzUL+1Xza8WWQYyHmh9pQIqHASaIj+49u5zFeTnvOdgoUlftJaaN
 Wwk/Hbvnb0vUYGgr6D1/fEbni/45gcwWm9PB0w2Azt63neyHq+mJwQDa/kuqqyhescPz
 EpQPuNqT9BXM1mmWOCGYGYtLe+BE2y2d0Lt3JhXJQGdRFMopKLAdmMu6foLFKRMrHTl7
 rPxEFFzj9VierSViYuka393UImUWU3P5TqH319QFaTifIjIb2OMXehZOCEyMEg+LqNib
 wex+LJzevqLm5/iEaBWh8B4GAhMvsmd5xhTdPk5i8bQyzJGGJq9BK3IJoYKfOiUtthWh
 sQTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVikNAoNurI8kggarJg7eblgY0rEdKkYhzSe6Pr+qChfTVL3BT4vqpalB25zIECIi/sLzgxP/QbChNpYjRveLZ7lhZqwwo=
X-Gm-Message-State: AOJu0YwappMLThivxOT6YleUMDZsuQmlVL5+plgXwPreNFZWQn7dtVoX
 aVrgyE3sAkUl7oSXVwBaWnJru/2I4nqc204WYl5lQLt5pzc8dwdiLMYe1PDWgJWpup77UQpc+Sf
 BNYobpwlHARiV/G4IaYt7Xkm+7YLeqIIt+8iWKA==
X-Received: by 2002:a05:6402:b2d:b0:564:151c:747a with SMTP id
 bo13-20020a0564020b2d00b00564151c747amr4857172edb.27.1708964636858; Mon, 26
 Feb 2024 08:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-35-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-35-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:23:46 +0000
Message-ID: <CAFEAcA8Y3ayWaAcwzXYO_2zL+fjf8Jen34RtScUepm_SmKgLHw@mail.gmail.com>
Subject: Re: [PATCH v6 34/41] Add mailbox tests tags. Part 2
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pMqnd1o8WEud

On Mon, 26 Feb 2024 at 00:05, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mailbox.h | 152 ++++++++++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
