Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp945822njb;
        Fri, 6 Dec 2024 07:52:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsH0WrFXlwkowDSqiq3ScZ0Cee9+guGI1ER948TPzlRLnNl7aKRNdJ2fcJ1JO3LnhjE0EuZ8p8tRvYAw==@linaro.org
X-Google-Smtp-Source: AGHT+IE8E9IxM68Dg/gcRtSwaox940yB6KsyLTLwJmEU3lUJQ5/QV5Z0AYMlF5kWniFwVu08hdH4
X-Received: by 2002:a05:620a:4549:b0:7b1:b252:4381 with SMTP id af79cd13be357-7b6bcaf1c95mr632122385a.37.1733500378594;
        Fri, 06 Dec 2024 07:52:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733500378; cv=none;
        d=google.com; s=arc-20240605;
        b=UpFNd/4eEag2DQMunPBz1IY2+vuwAl6gNKv4L9FfQPnGS3xAzfIKK7EtCYe5XHo9up
         Q3wFy+1sMl/n7qEoPX+KOj5Jefhfn0yogeimvmVxLuVevpW3W5vlPptObgmhM9TtwaiT
         sSLjbCf3KHWdXt3G4uapLXvGFaU79ASLGe2uLfzY4YmlBlukc0ocvDYv5DNrGXMy6NQs
         6hnfiGmLVe1qzIrHkJjzLxomolJx/O4n9ucrkKIsG4VD76qDdVp5IqB+qhYlGAAcnlqW
         frwoF4kxfsP2vr90iMalWLN53csVg8JNBPSWQ1MxEmzssxeOCm86IAqKM+Q5HGlS+MAo
         8j5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Zz7FLpt0j08lcOYcHYv1ZI1YtjEZIrrGwQIAc8ph0D4=;
        fh=EpYC1LwaxirzYLKH3GhHc4dzvlfFoJdveXhyYm6SQ9g=;
        b=GFkuvHdH7vgZ7R9weY9CqNiL+8rcvTil7Pc5PU3bzilUZu7McoMSqNWRuJYwuoR7CI
         ghpjJGSAQDSsJ+nFQ5OCQ9tQ/C7+BJa8pFb/BaaR0oqUU8sH0THDEVy2dXT/OQOAuP+e
         fRs/BFLe7OnRuJ7mzOwE0tDCQrggpB/f0g4j7TmIKtCLDHZ4woOiqaDQln5A3T64XagT
         gk8cwcAyaABk7UopThr29AwX6MgcTAVdrp6OHEfUD5pRyyCZ2rwTLnpWhogE1J2NQDVE
         5dcuanKi9o6oZx1WIxMW4/kOFvSiVaV9kpw5Tcr4S0WdMr/7x82mXM6fMT5Tt/yWvX8U
         MTWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sxkc6WeH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da67f0c1si46069316d6.95.2024.12.06.07.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:52:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sxkc6WeH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJad7-0000yn-WA; Fri, 06 Dec 2024 10:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJacv-0000y5-Jr
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:52:23 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJacu-0005BL-7s
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:52:21 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so751022a12.3
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733500337; x=1734105137; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zz7FLpt0j08lcOYcHYv1ZI1YtjEZIrrGwQIAc8ph0D4=;
 b=sxkc6WeH/77dp679H8/mCzmBKkXAkT6BgPbcL/vUFWPjnVnPYM6FY1tx2KEwlrYLRc
 T8OAQL5SohrO//bPdd07S123yVxCgogtSokvGce2XO10296SZLaJSLECag6JvaldVLFC
 I4TuQPCK9i65F/axUCsq4VqOct0eKiy/cjI1p2ZOEgE6WF/zdF6luPoOpzDCDVHk62W0
 jVLktGN5LK4gQiwqvJrD9o66Sq/NaUCFXQq1QfK7/UmGOlBnAES9CtELq+glvVepqnpV
 KWa3T9loPyL8Bhn5AbtzqRyU7LbvHKiyyGVLH9QTMy3vxfYPeQR0cRiA47O6Fk13fP8J
 jUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733500337; x=1734105137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zz7FLpt0j08lcOYcHYv1ZI1YtjEZIrrGwQIAc8ph0D4=;
 b=JNLPC0TgHGAEZwPWS20DkaOI/rsHU6yn9TWroTp0QaSZ6RyEBugG6TPtObVihCdO9/
 p7XDyv4ZgpR7oImEMh4Af5btt5O0Cdkd0LVgRJ7YsPT3bSFXXVnC8hOA7SIwuOClkvcB
 jUaA+Pf59cyODrw8E3OWT/+rcaBlIU36qiCARZb9jOqwS5jeQCAxvL/EfRRU1G0YP0Ms
 E7R8oTYQrat4OgTcQWn30F4fNBxMkYEzHfIwf5wZ7qP1jafyCFAJXsTDZnxubH9LUjaX
 /cKEOD2qSLyihjDpWX0QzI9qgo1BE4MQbJrt9xrJNTrDqoZ01A4CyADuqBHdNCYjRZfw
 +u+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlOnyzBn5DPiFM2a1DK8Rm6OGogTO+zPsYBosAAFSzg0MjMgATlU+yi/T2/weyyY9H+WY8+6zF0A==@nongnu.org
X-Gm-Message-State: AOJu0Yzmx9VF+dMOei1fuLwEnS4NHVMoPI1akX7aVewOJ8FgDpYTxI2R
 5DOfGXbNxyn/2oni6QeWaZqNzKKlC2kd6bquiUCsokllyjw7+sNeh5FkXMEQdEOQYN6PYG4K4PQ
 S4f2ul4+o6PMuhfJ0DdEIughwek5brEj/ErDkeQ==
X-Gm-Gg: ASbGncsAliU9NnVgcb7OHzOLdXOiCbuILHzHqHJnn9GoKv9MCwcBUdCo4pxHlAi8mpj
 Rc7G2oMhmojywvoSiEvXSB5c6qahNv3uu
X-Received: by 2002:a05:6402:2742:b0:5d2:723c:810f with SMTP id
 4fb4d7f45d1cf-5d3be783193mr4440217a12.30.1733500337087; Fri, 06 Dec 2024
 07:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-52-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-52-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 15:52:06 +0000
Message-ID: <CAFEAcA-h3wbZChEZ=EuEA7ScM-EF3CQnmkx5fODuc6y=7W_eqA@mail.gmail.com>
Subject: Re: [PATCH 51/67] target/arm: Convert SHLL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: MW9uFpk+qKIs

On Sun, 1 Dec 2024 at 15:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 75 +++++++++++++++++-----------------
>  target/arm/tcg/a64.decode      |  2 +
>  2 files changed, 40 insertions(+), 37 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
