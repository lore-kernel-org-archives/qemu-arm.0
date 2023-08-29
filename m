Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3632649ejc;
        Tue, 29 Aug 2023 05:41:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMbQ7rmeAf+tvmz6LZ/Qt2mEYavMA+UXikGWru9ZeenkizyKsq0oGwe0fosFf4gxfubYOC
X-Received: by 2002:a05:622a:2cc:b0:410:3132:8265 with SMTP id a12-20020a05622a02cc00b0041031328265mr32524180qtx.10.1693312884697;
        Tue, 29 Aug 2023 05:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693312884; cv=none;
        d=google.com; s=arc-20160816;
        b=nrL7IfPw9bMjxdH3o8BDEqlA0xCWwoC8sXZ0SDsaiJ5SQjI/HPCM4jTfUZSg+y+zAP
         rONL/GSwY3GejndR7t0QwtuXPXZjQA7GMQeufSXxIdAMp/gaNlSsgP8t6lcBz7JX8isu
         o6AI4NvlLP6mPAkSp6plRY3ShIwbVzuX1NY3JL4lKv0bFpkAfHya5nOhXg43y0g2zNRt
         Yut1CYKKamV99vfGbIdp0j/zXcXcWDkXYRaFB4DQvzZx0Haszi9EfdBJh1fo8/DpPkoB
         V+yjEkODnXNp42CM1geVCgyY1wgx6yAcK3Cr1XEsA7E25VhxRWDlFNaKjUuG5LY+/E28
         Qz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=R2kcJgH4Pi/piMNHEaiNUxack+bGqcgJmnt4gQZK4Ag=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=Umi9brAarbMmFsPuEkIBA55FLbXp+lrut36X2nYD16yWCzF0xLT6xPbGHQKZKtyhze
         iCjq47x7xDfLXkY8N6Th0fcTtty2Ns1xrZ4iZ1nKFKOaCDs63lGqZJttXF1rdtAffPc0
         3xLpBGOwpcDBkB+hDc32cGFvrlMNFbwXUfYcwbYSgO1c1qRxqcgduckimvzAM3jIDbY+
         ZkPgXFnULceqy2VhJIMNF7UP/x+jIPVw2x3RZBa1C0nIPu+O85HuGP8sMx3gLomstwxy
         jnL5AmcY0KzFyV5h+4i/CBjtjQJq9x8L4z7pdDi8bPPoY3R0qWyOFgAyMVIItaguWwyo
         rU3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WNva7s1p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020a05622a165200b00403e5fdada3si6003074qtj.735.2023.08.29.05.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 05:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WNva7s1p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qay1w-0001pJ-H0; Tue, 29 Aug 2023 08:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qay1X-0001cC-HV
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 08:40:49 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qay1L-0001Id-7c
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 08:40:45 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-52bd9ddb741so79530a12.0
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 05:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693312833; x=1693917633;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R2kcJgH4Pi/piMNHEaiNUxack+bGqcgJmnt4gQZK4Ag=;
 b=WNva7s1pa+0HateKg0rIs8z/GepnYFxk4ecEWEjGqluA8UccXrM5SnIMkvKoBDKKId
 N933vV9aXDIy8wH+xdxuyNTjynauEt310nOxx9WEeAgR/gngsUnxn8gWaZb8EX3GbLrZ
 M1T590RfpaABdB53A4mac1nTk9wjIWcZVVS14mZxx01oy+YpTTKe57xcI5mP+Ba7H4/K
 cdJF4aeJXq2Rh6REaJMnjDOgaNH0h/CywRNm6fbhsYs9tFv6zZjuuB7T706A3O9z/mca
 cc2LO/uro52WPIPz75eiMQkp9d37PPZx1lPC6UnqpzztHK13QcaGpYzukPmtrvUmQA8E
 +5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693312833; x=1693917633;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R2kcJgH4Pi/piMNHEaiNUxack+bGqcgJmnt4gQZK4Ag=;
 b=ByZlcEnD+jF8BAcHVJFIlWPaBnfrJguORhS+vLLSjjKpmlAyWJMKub9/8zS5yumkoY
 UnuL27ped5EjThXy/iWu98zQV9A2kg++9Deyy19Xp9p1T7dzdcHLOUxaV3hWQZGCXpa1
 tddGMw5E4eQYMhBC3ejAwQECqWyrsOgjZGgNHt2IOB7LKk+Qhrh8UGurZJVkk4iPstxg
 Gmqb6JgZitfqSyK4XIPP0mfns6OP4pMLDpYBiO+irTOp3P0aVxga9HXyurmyClF0d0tj
 yGHA+qLp8YdPugvUwoOze3ORgGvTfqDJ3GRnGYpMLwfG3Ang6E+o8OoPwUY81mTLj5Es
 KPgQ==
X-Gm-Message-State: AOJu0YxkZXhxPZxac9GDjA+LEGt/n1G0hSDEyDiQvKSl5uib8Hnmkgkd
 U+ZvWAZ7CVQ14FBHVT3hAfbgtSlQ82pKgaKTzwz0MA==
X-Received: by 2002:aa7:df0e:0:b0:522:b112:6254 with SMTP id
 c14-20020aa7df0e000000b00522b1126254mr21255832edy.4.1693312833543; Tue, 29
 Aug 2023 05:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230811214031.171020-1-richard.henderson@linaro.org>
In-Reply-To: <20230811214031.171020-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 13:40:22 +0100
Message-ID: <CAFEAcA90ZDYLf8QRxoyoG5Q4m6UT2CpwV879SzaeubTv252SYw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] target/arm: Implement cortex-a710
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: azuBkQVyiE2z

On Fri, 11 Aug 2023 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is one of the first generation Armv9 cores, and gives us something
> concrete to test in that area.  Notably, it supports MTE.
>
> Changes for v2:
>   * Check GMBS during realize.
>   * Fix access checks for neoverse implementation registers.
>     Mostly just traps EL1/EL2 if EL2/EL3 enabled.
>   * Add make_ccsidr64 helper.
>   * Reduce MTE with no tag memory to MTE=1.
>   * Suppress FEAT_TRBE.
>   * Implement HPDS2 as a no-op.
>   * Rewrite a710 implementation registers; do try to share code with
>     neoverse, because the traps are different.  This of course solves
>     the renaming and renumbering issues too.
>

I've applied patches 1-7, 9 and 10 to target-arm.next.

thanks
-- PMM
