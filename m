Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1418849ejb;
        Mon, 20 May 2024 05:50:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXsJ9KBSt7ErCUqv/jrhFWwemVeITrWML3UnB50aBCMx9VFDwCkVGq4oYnE7knu16nziP9YmfEHHvRS2gOtrp6mBb6TZjM
X-Google-Smtp-Source: AGHT+IH0bKFAuEtpefJe/eLNRr0vQog9VoPEgS5IFVenJwmW01ZweBXfD/S02M7UjAjvImfWzsVG
X-Received: by 2002:a05:620a:6088:b0:792:e559:700c with SMTP id af79cd13be357-792e5597a1bmr2432154985a.54.1716209451466;
        Mon, 20 May 2024 05:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716209451; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3NeIQ45b6csPwgbpmuPmLAlZUKC6tETmRa2xXcP9gFxFAuJKN5XCTzw9qrL141E0A
         am+vC/71jHeIoeGzCgThYXG85S9EPCAaTgTh0ZIRQsjXGLcpdDCg6n8B8Yy1k8M9Ezii
         XLe2Jj3vsRWIdK0zzeYGB5LBvzVoDTbGn5QxdKQL8VgFSwU1De2wY0TZjuE+IwMIvfdY
         WgsZvv2ADgQgRocDhRJFMqbw/X8BMXxgsPjE3Nu2XFQ0qWU0cr/3i8INKgyd2PrUjKQD
         wnTVQ/pqzwkojuiszkomxqEhGuaB4AnbivhmOW8z7OzfDkbDpd+E3eH0X+QKZx7LzWYp
         AobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+2ixQmw20dR9maTZtq6FPKPfJlf+1+8yLpTShmbUGfU=;
        fh=hbpmiNiRBF19CvwgdxZAVV2JPgaOXtvs/o4QKyEdMAs=;
        b=pqSUwqlxr++x3BiaULtVWY4qrUo0ogaDTVYThG2gv2FEMYR5m5I4lXA4GpY1VkwF9G
         rRa4+QnS72jczSF/7vXDfLNOtMFrG/p9zN0SGaRNqErgHEFvIiA4E/mq8vrmVkGNelSJ
         ZGo6oMqMuKmzJ7PDf3Z6uxW/TdrOMJbcmokGWqg9F6YZ4WTrNrS8TmECRuXXm7FrhaFT
         5+5xprCv7K9b6lPJ4BCpssO+7U3RPBfWUlUkbohXk2GBW5uGrEiJKlIW8/r3m87xS3uc
         GQUh9ShwmPsF2HlHfFX/whjO3lE1rcl9Q1YyiF2sYom/YBoMAFbrmZvnU4c1g02q603p
         vnNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FvUVKOZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7930082625fsi1102113985a.53.2024.05.20.05.50.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 05:50:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FvUVKOZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s92T1-0004BC-Sh; Mon, 20 May 2024 08:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s92T0-0004A3-0I
 for qemu-arm@nongnu.org; Mon, 20 May 2024 08:50:14 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s92Su-0003rH-SO
 for qemu-arm@nongnu.org; Mon, 20 May 2024 08:50:13 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-574ea5184abso8033146a12.3
 for <qemu-arm@nongnu.org>; Mon, 20 May 2024 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716209406; x=1716814206; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2ixQmw20dR9maTZtq6FPKPfJlf+1+8yLpTShmbUGfU=;
 b=FvUVKOZfvWv7Jkyv5bnLCXY7z5ZyKiSy6bcC1zko11VjjhnMqt0KQFD5MERE4wMufK
 J9e7M8jWCEiGyzoT1DXBZgw40Cjk1vu6XO4OOWEbDBkk5LjCAWi5AsF1+/6zOFF2+GEi
 sezj9gLCMWomfUgWwZvP1AaZvc4XH6EfnjMdGCTXEJMnpU+N75Sja5Z9bkwYWICK2Cky
 aCNqwcyrYA4XZ27p20TmkdQqbvkUQ+HWmuuWEZxrXsZfM1CEFYAKeJChh1myJPUdFvaV
 s3excVCB3TO9S0wkm4IWCoOJ+L+6dEuE3RSqPn20kQnWyjJVN73TmC7H6PExhovR+7Wl
 x0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716209406; x=1716814206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2ixQmw20dR9maTZtq6FPKPfJlf+1+8yLpTShmbUGfU=;
 b=oRh5v2x7JBzphtY8UOh0YN9rd99okmt53r1gxxasyKpqswifHVmNYG1wa3F/2syW3i
 /Yz8pIRxf9Px6V3s9DBSoSyOnN4zlDK4ibef0lBbCrflO3XjXCJSgn6p6IgjBW3VsI8V
 ahVug7aYY7cp+Y0UCf+L0q8oLBmA6iOsA6UU8tyNolahRCabMBDPUQnVq+A9me/fXbBV
 km1B7Xq66RAylrP2m63Cwz1KdMltRHWRw8Ujvu3q0NP5hwWL+oiodYU86CqUmfydbxke
 HAYkAtKF7Ets8Nr+CmYMko1SfovmHKB/LZso470k6ZXDfCsxnGgVB7FyBD75+KkOr2Xi
 bnUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNUt+3/Y/uQoh58ii8ncSAndjdfvlKOXUAYRwcnUk2VGZFkY25eyCab4uK8k8pLgBLHxG5E3zgXLRUUAXpGQcooPJp
X-Gm-Message-State: AOJu0YyU4izcVa9YrX+n+bQjjBjNN/Jzk4vZ8LmdZjtbnS/h/58Wmmoi
 0b1FoUu46KypEEGvAHkOWrDdvpVqXulvwv4HKbjOPie2UBXu+BR7nrDqLYutTA5MDRaaU6r4HdC
 +bzmTipP29OjUOyA2gcbjIm3jJZkGc62B/P3v6w==
X-Received: by 2002:a50:9fc9:0:b0:56e:24a5:587a with SMTP id
 4fb4d7f45d1cf-5734d5bec0fmr22990260a12.11.1716209405662; Mon, 20 May 2024
 05:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240508143513.44996-1-philmd@linaro.org>
In-Reply-To: <20240508143513.44996-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2024 13:49:53 +0100
Message-ID: <CAFEAcA-apsUZeNdpC9QfJm+Xqr8Z-LhfZXiv6YxcSXo2bKsocQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/input/tsc2005: Fix -Wchar-subscripts warning in
 tsc2005_txrx()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4anE5U+bDyGb

On Wed, 8 May 2024 at 15:35, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Check the function index is in range and use an unsigned
> variable to avoid the following warning with GCC 13.2.0:
>
>   [666/5358] Compiling C object libcommon.fa.p/hw_input_tsc2005.c.o
>   hw/input/tsc2005.c: In function 'tsc2005_timer_tick':
>   hw/input/tsc2005.c:416:26: warning: array subscript has type 'char' [-W=
char-subscripts]
>     416 |     s->dav |=3D mode_regs[s->function];
>         |                         ~^~~~~~~~~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> v2: Use Peter suggestion
> ---
>  hw/input/tsc2005.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
> index 941f163d36..8d35892c09 100644
> --- a/hw/input/tsc2005.c
> +++ b/hw/input/tsc2005.c
> @@ -406,6 +406,9 @@ uint32_t tsc2005_txrx(void *opaque, uint32_t value, i=
nt len)
>  static void tsc2005_timer_tick(void *opaque)
>  {
>      TSC2005State *s =3D opaque;
> +    unsigned int function =3D s->function;
> +
> +    assert(function < ARRAY_SIZE(mode_regs);

Missing ')' -- this doesn't compile ;-)


Applied to target-arm.next with the typo fixed, thanks.

-- PMM
