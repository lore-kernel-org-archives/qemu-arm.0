Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp661133njc;
        Tue, 25 Jun 2024 05:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJV4JT8bstI9VLOFFODUb6sC+hZMou47bMSIIqTnz4PCSzwOar1BnL9oU6MmBE998RwO+FZqGBOhPe5mCLzVpKvmm1v/pZ
X-Google-Smtp-Source: AGHT+IH//2DwRUE49gkoaz8+SxN7vPiedaTFepVT3KZK0fxuZNxLNVjBrQsTu5aXiZDRldBxUc/w
X-Received: by 2002:a05:620a:2989:b0:795:59ed:21e3 with SMTP id af79cd13be357-79bdec529d0mr1193775985a.3.1719319339692;
        Tue, 25 Jun 2024 05:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719319339; cv=none;
        d=google.com; s=arc-20160816;
        b=Qt/r2jD8XbK+bVJsT/ary6CSxwvcNw2ynPVYYKnHvRrW59K4Ara/7Ay+z/rusvBGRc
         gFIM6nV1IqPhDCYq6a610YftZpteCVC+jk7E8jPtnJ4TSbCy8XeDF7qMLfpnqQ6tMoum
         tZMvUe9Q1Ccqo+B2iX3rI8QPuc6bBKyx4xUsKTMg6e3gsVBCzSGXcqH83fSgOPoBj7Vr
         OnyEPFbqpvz/sj5b77CtQd7hlbkTCRk8k7UAWCs1AMK66Gv4jkZqIKt+bRByCA7Ic1Gb
         BnUNanrbQb18Yp7QUP1rFBDgVNKpjstEMmzqT6xRrxonZ9GCaSDV5QcIW5tzQKMm7NlO
         QgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7FMp89KlTT9yfOrJqLXt+rOuYxMVOMiwzcFBRkXFrPY=;
        fh=2A8drzHVf5MhxKRCuP4X+YukE4RJEA4C8viqbA+CoHA=;
        b=H0EE1lZnikNATVVjGa8ojQ2Rsi0tdztWajdk4K0laqmgOpIsHohvKeLyzvi9AZ9KDk
         01rh4hYQ7pgR4SH7f/OdQwg6xr4hvRP0PskmSHyK7GHPIqYl7utk1Hh3gYTcIruDFwsU
         V48FQtJlB3nX4hXCacad8nnAZ0mZ5aFjBNLOP/oiCDvf6z3PwyVJ2SOcASOONK3XRSyT
         aYHi91JhSR8hGAg/DRkSu/v1e3cMkX6HA3yTk9ih7QCLfV3xpzAuD2LUwGHF6ambSFS0
         nrymKZvMLwhj5AYytS23x6xYo442vNMg0eAFO18AftHTUn1JwsNdMxqysbZMQKRBD0Oe
         NZLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gx75oBCS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79c0ee14f87si39816685a.252.2024.06.25.05.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 05:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gx75oBCS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM5Uz-0005tq-6K; Tue, 25 Jun 2024 08:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5Uy-0005tV-EB
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:42:12 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5Uw-0002h6-Qe
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:42:11 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso6274680a12.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 05:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719319329; x=1719924129; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7FMp89KlTT9yfOrJqLXt+rOuYxMVOMiwzcFBRkXFrPY=;
 b=gx75oBCSyNpNgf+XaCccfDYWG9/Z6CvoClZZ7/M4Nv9FVL6F0L7qwmj0LZJ3/rYI94
 rq7FxUJtFuKRizGu2TwL+sZdIKjiUgYx0yHtMSm9d4BDKh6GCk4xRc1Tz7fZVd40qo3P
 uuua6h0zXnnMJNgZIW1KaRzvcm9rUdETwhhagzJob5ZApKQSv9uN17G1UvE5bFprMwFB
 aeFlsRO+/nhzDD0aD1eE/Tr+Bv8hOpXgnnOcboHR+kF38hm0wirQcZ4j7broX80CSA8a
 F3hHPOLG3wzvfab+l6u1ckG2Ruw+gLzpQ+iHriEy9QsGClfyLxLs7ox5661oFkpH9pAa
 VHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719319329; x=1719924129;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7FMp89KlTT9yfOrJqLXt+rOuYxMVOMiwzcFBRkXFrPY=;
 b=UmpYZyAXHWpnJlYHgpkjm9+t5otRG+yx8j+OCDN4fAM8s0iEJK6wLjmSyYMbHKXEf3
 FF7LKroPHEKNFlTvMLZXbw+gdWEmozDVd0jQhIQiijj2rglIZNdslSg3N6RGsJu2s6CG
 uNiHIt6/8jWfF5YGGkV7Ey/5M/A0rJaykjnZUYLeBak79qYK2Lm8CeBzG0ufycgDeF3S
 tbGESELyCJlFGRLmsZyZ78vleE/iB9mXWp2NWAitHTBHpBDRfLgXstjy4Y7NxxYEhpVJ
 /nsIxjN5nW+TyPDwPlQ8UCS/HfQIu5jR3+3mPQqlguYxzkXlhDX+3U24xAm5R4f5Mo8M
 5fEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2ypC5foXx6uJyG77DvvGRKzL76q4EgIwmsLUey0nRzcajAn30F2oTPMyr9xB9zpwHu56S3+STs5w6ZzlL24Ohp1ia
X-Gm-Message-State: AOJu0YwnfrAGQObiOXRgxv66xfyQqM6srRLlwb1ifWh1wSPemUNdYroY
 CuVjU6c3zTown4XQIkv1x8ittCDAw99gdfSJRhowQBSJi5dvDLjBhWaHwSUfMFfaUZH3Lye/H4x
 Dj/8t29djFp9qD8sOsleNYCXn8RF1lD5e3+kN7g==
X-Received: by 2002:a50:9b42:0:b0:57c:672b:ca34 with SMTP id
 4fb4d7f45d1cf-57d4bdcabacmr5176372a12.28.1719319329069; Tue, 25 Jun 2024
 05:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-12-richard.henderson@linaro.org>
In-Reply-To: <20240625050810.1475643-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 13:41:58 +0100
Message-ID: <CAFEAcA83F2OHrt36VSamzCgZ3DA_7m4mqTyvGoQ+Ffc=RBCwog@mail.gmail.com>
Subject: Re: [PATCH 11/13] target/arm: Convert FCADD to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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
X-TUID: pqRfm33PuoY2

On Tue, 25 Jun 2024 at 06:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  3 +++
>  target/arm/tcg/translate-a64.c | 33 ++++++++++-----------------------
>  2 files changed, 13 insertions(+), 23 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
