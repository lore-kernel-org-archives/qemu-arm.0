Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65868108B8EE
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 10:30:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3X6n-0007Do-G9; Fri, 20 Mar 2026 06:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3X6g-0007BA-Td
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 06:29:31 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3X6f-0008TS-E0
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 06:29:30 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64ad019bbd4so357378d50.0
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 03:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774002568; cv=none;
 d=google.com; s=arc-20240605;
 b=QZeykY6W6m6mG5LI3k7iYiptnyvPEFeOwmIItYQgx474KUqVxlU+2n2arqZg4L8KKR
 3qXQsgH4rsHgNJf30fbqMzLQ0I5oP7Ks9ZeNC69bQs8+Hh4sFC0WcjJwWhcZnu4au1U6
 Hbiri1sGh8PcAth+Q5Nl76tDeJXOeOtMBFXaMAwRiSDviIIo6o6XRuVn4q+OuN/6BfqR
 EUw0Cuk22E2msJKG79zMy+KU7rB8zXPt5jQlw/xwJKbV1KNYbKm1opBVuUnNEImlViAp
 2hcL4s/ILXfk4He815tEW1r3I9LaDC87uXuf+pynKLp0tKYN43nO92GEt25XIb1ldmnU
 YHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9W5HfoALTZvI/z2dioIQcLeYU4oaAhQRPEE3+6K5zq8=;
 fh=DbUqAkZJYo2bI2TuONPrJFHfDhbFBFGCKtdEJ67AhBw=;
 b=Uth7fZB3GW0YaPZHqok9Cs4UZ2C1DFlpByFY5x8bO69sqb4ZKxzLJa4ppBYaprUTiD
 3YMXpFa3p0myVHkK+cVznwxuyv5kxOnmY5oNWzBHfPwiwsWEntBDvl8KucxZZND7TiQI
 c/U1A/HrhhNFbCjNQmmfXxQgil2jtrR2bTwLwW/SgpvjaKAS11CyYL+4nKhjZCl17mez
 LzaD6VbwI6IEla+2uIlXKG7JMWMZ39/Gs1DJ9X2gSZpAtK1+RJqxWv/ehwIe9sZZg4mT
 8CcQF0y+9b9VMH3XPxBDA29ytHpxQWL3Q/7WKcpDDoJ3Zmc16NSPWj6isSAAbAc/xsov
 PPdg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774002568; x=1774607368; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9W5HfoALTZvI/z2dioIQcLeYU4oaAhQRPEE3+6K5zq8=;
 b=MK2Cz/tMWT+o7VLVesijwKxHij1nvaBXjGlNeY4vkuc1BlhtwsvsLRLiqCcJvjroMV
 uDcBlQjAGCLK4Ez2DbElNQNxrkLmiwYIExbhXoUD0Er31SvNN7KqWk9Jo4bx4gX0eIEs
 yPl2eSK9K//vK+3bgdlZySPBOMjbwN1qHKTgxgG7wt3nZ5DgYW4aP/lGOXXZXmDGbXq7
 wSGzfmZlDp/y0naIiMfM0KRhPZrbD/IHgeaP4MOJeoegE3VQ24gMC8r+3PFDnDtIBo3a
 jtDzjCZKn+S58BCOtV2wio7Kuh40A82s3eifvYniSztHGXZnx9BdUfjLS/Lc8Hx4lG1O
 bJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774002568; x=1774607368;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9W5HfoALTZvI/z2dioIQcLeYU4oaAhQRPEE3+6K5zq8=;
 b=AAsa5qmDWc1b+e0T3fxmqFaL9i2vDBZ66KQBD/iZkvSqOdfQLQEZFe7VgDMg2NBZw0
 i79+LJdYrUbtf/WaCwj0bZF5yn1qur9D2qmy2PWkzUctnZ9o2ibTXolQ4vHr3CWCQL5t
 UbjO09N4PG+ms52PjVjXOa8QOdMGAc4mp0JNbBV30IJ9zYFcGUTSiO7+h/3Y0nt26nVA
 SGTxOaspqJM3oCX8TB0BMX2CYCgM7/YROLslrIHWIvEhUq40BFT78iMAU0+7xwjY6g40
 w9ORT6jMxWM56AsfKfIiJ+1vOsjWHgUMQFfLQv+fyTp7dHYzOn7h0ot2isQW/mFtBoxP
 wY9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZw1rJvqNcWk14asIXnCi2NzNFTPauplcG+ISaBWbYzmGZoret+65OKGX6PdJn9F2xn+DcitbHQg==@nongnu.org
X-Gm-Message-State: AOJu0Yykok2YBgZIzG9MRwGUmD3UAy3Iipm3v+qsxn8TnXmTRHa4ASyW
 /wJF7GCKUAkIOPC042AGSudfcA0G7++HpXTb8hEvAGbPD2or/qgLGvfJspcqbl5C63TeZd9fItS
 x4IG2+wIjgJk8sidWsBa2SPfSvoou3fXqyENa0w0vyg==
X-Gm-Gg: ATEYQzx2BlVnp9X6YA15NrXXVRpSp+lWElhRmz57TmyBNcCRJSczN0njTlZ2NrREcMf
 SOT78Dyq39t1lJIfmcicf5OoLeKc49nSpJHkrGnIgMwLDeHzbSCJ17pZMm35yjD+zqvir7Jc69t
 mzZh06wEg3Mn4lOUOhZZhGtrJPBoBzpLfcr1IF5ckbx5YbcJMb+5WA+j8UWkTzCFa+a8E0AwaJv
 lmxIRBxO4QQBdQ+e3BE4SQPGnPyjZSjxOByKhbNBrC1xG5P4TnXPGGS5MpHM+8p6QnfCvbTRbtO
 0z+zU7qsjom7xXkAbxcM6DnJ22ajNv9x8Zcgbu9qxvdo0M4x1Vrh0QFaQPdT9GWcSx0=
X-Received: by 2002:a53:c60f:0:b0:64d:bcbc:7c64 with SMTP id
 956f58d0204a3-64eaa6c2305mr2030429d50.25.1774002568178; Fri, 20 Mar 2026
 03:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260314221529.47841-1-mohamed@unpredictable.fr>
In-Reply-To: <20260314221529.47841-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Mar 2026 10:29:16 +0000
X-Gm-Features: AaiRm50dx1Dvn3v8UzNUVdG5yeIS1g18De0N4ljaxgde168BW5Q_eAU70eOF08w
Message-ID: <CAFEAcA9u7xueFKn8Q_qy34YJ7bjHBmkXKbtmo5_UcwvdiKOJMw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] whpx: arm: set of small fixes for QEMU 11.0
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, 14 Mar 2026 at 22:15, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Localised fixes for QEMU 11.0:
>
> - fixes for -cpu host, including an ID_AA64MMFR2_EL1/ID_AA64MMFR3_EL1 mixup
> - add EC_DATAABORT assert for WHvRunVpExitReasonGpaIntercept/UnmappedGpa
>
> This one doesn't functionally change anything today, but is good to have and is a single-line change.
>
> - fix Hyper-V enlightenments
>
> AccessVpRegs turns out to be necessary too. Linux doesn't check for its presence and panics in an Hyper-V arm64
> configuration without it exposed.
>
> Fixing a mistake in not following the QEMU code style and having had AccessHypercallRegs included twice at the
> same time. Also add some more privileges because it looks like guests don't check for presence of each one
> systematically...
>
> - SME support shipped in Hyper-V now
>
> So remove a code comment. Another one-liner.


Applied to target-arm.next with commit message adjustments
as discussed, thanks.

-- PMM

