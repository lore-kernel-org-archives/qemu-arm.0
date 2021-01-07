Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp419885lfq;
        Thu, 7 Jan 2021 08:13:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSUVsRbCLDd8ZPRsvfr8JTG4pR0aKpK3Gg5ZxQ2zqLv9V2yl14VKJqJG4AO/8P7iUaA/Sp
X-Received: by 2002:a25:d788:: with SMTP id o130mr14015841ybg.245.1610036034555;
        Thu, 07 Jan 2021 08:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610036034; cv=none;
        d=google.com; s=arc-20160816;
        b=vhSr9RjNjH0qnBpGHNorjWXQB0ieFpy/aNo3NLKjnzZfwwv1hQy3ElgkJigfWnSaiT
         G+IFLKhbReVy7xho2xGdXsR5i2jWV9UW2sITsivBysZ58dWl/YQAXARg1j1xR6OUiyKp
         t0Iq22zXM51i+gMGRPjNxzWzjdks/R8JydZpYtnck72uhMeBI9QdBxSVnoMzsTSBtEm/
         K2E3L+xEwWI5IOv5FYEKnvLzwbrBUEzuddOjGxH5IbrGmDZcyJ1jD9eBzT3z5johMq4D
         lN8yy4Riu3oGXY8nzcvisUuJWrNpm3HBm7Q2EfpVj5RpZ3548bOo0IcpFDlIJRSlpCbF
         RfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
        b=J4NDumapvDkj16IweLOwNVixvO5u4sSfZq9r7/HdPbO4Yyw9Tuqabyp3uffdnsIF3M
         IKAl6QDzwBGVh5j0C+IcM6YhK7Aoh6/jvXsN+3zdLGz0XJjUlR8GQJZ0cs7xkzC/eYx4
         iO/Rz3k2POidM0OyrfhaxeQR/h+dmmFhkLZXScB1qCl3+O3UUr94nGAo9P3ymmWNcf+6
         ihY0KOdaCIDiVbd6i1Dro2uCrd7J5sjZrKhjNeN+lGsnoKAAjOgQvNug50UJJuG8cVFn
         rV+r0PmRUeXDpFDlgLrOrWnQCzJtAH4kdCHDRImZlj28fSztozxQgc5roY72N1QxA/fW
         MG4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RW126Fsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j188si6584005ybj.484.2021.01.07.08.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 08:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RW126Fsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxXv7-0002JZ-UE
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 11:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXsC-0007ri-TF
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:10:53 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXsA-0002TH-5q
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:10:52 -0500
Received: by mail-ed1-x534.google.com with SMTP id u19so8314319edx.2
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 08:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=RW126Fsi+SCWSE+DKdTJv9a364VbK60qNccEpBqnNolJIWtjkwQPZ4Y01hOFXdEGMT
 UpuAp7VGseL8oStpPfQ6FbwjPrhOalF5FoxjnFSuV4+3xMvoQtMU1yH6HeIEKVSVCvm4
 isYrwUneP6iuSSoSuKrGhfO5mscxewn/FhLaNDPh4hqN/TOZPkLscbngv6bC4IdInSGC
 LmOkp/Wlw94WO4GsHR4v1bSc4KWqsyP06C+HHTX1nqJe0ruJ1+M0yC1u4zD7goWWVfgf
 R9Sg1Uu8NU83LVL8QfbObC/FMTFv9DvAeRU5AonpcbbWuWME2R7u3nj9LFS6Q4yqJBaR
 iydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=pSmrULQv+yES+bHjhJJmIWT+dww+hZSJWwP5zf7u1bU1H+CHu5OstvXjcUCWV0K+Xw
 UscuAKGsBvbd6EjHiteQNIm0ULZJ4+tLekGdVBql3Zjuj8ORyzXLWR5csG9TqoqXqB5j
 PxD0Ml0irb2neXCe78ZAzHNKNgCUdFYo7+zfMInV4DbowMPwuUnCfXxZIQkcaQjIcxR/
 5NlLch+FJe536mZ3/RANklSz6a8v6IgHbLyYt17qRhpZQr9vHDfVc5LTNzZwS+loGu87
 jE0vXL+8zN8FAzxYecboxUVWDHeeLFi43GjuGFCwC/nHZic/Kv5R8iuM+1ZELI12LONu
 lMzQ==
X-Gm-Message-State: AOAM533DplaJG6P6IlGJqEYlmfCBZeqQYYRkw+eHnM4dml1BRBEj63gy
 ixIxXnUpqtBTlLk4Fwvj839TSkiUo9n36vV7urreog==
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2260531eds.146.1610035848887; 
 Thu, 07 Jan 2021 08:10:48 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-12-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:10:37 +0000
Message-ID: <CAFEAcA_tJ1ERy2bxhYUSZMWW=m4-XMvgoS27N_YFCsz+gb52jg@mail.gmail.com>
Subject: Re: [PATCH v2 11/24] target/arm: Enforce alignment for SRS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iCMDwAxloQR7

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
