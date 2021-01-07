Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp480639lfq;
        Thu, 7 Jan 2021 09:36:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6F5eI/izXBwyF9ZEvPn9H0WlaqZqgjKZ7QKmKWvg6X1hfbOZ+W0Vu3WGPlBcd27B8GCn0
X-Received: by 2002:a25:5f06:: with SMTP id t6mr13139894ybb.136.1610041010395;
        Thu, 07 Jan 2021 09:36:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610041010; cv=none;
        d=google.com; s=arc-20160816;
        b=sM1/M8OE1NNvvUP944TMz3Fw4JMVnzOkNGPslBZjNF0Fz9itTt4wSM4A5AzAfNMArZ
         FuQVZ0LA8ILhA+8skrHquTeuYQrzgNkWlX0TfgjObmOZnRueGL+JsdpfTYJGabsbFs0M
         kEaijx9vnSzjKFSFPNxmt7OnH3GXXA/qJxd/e2/f/9dMbf55K470YDckYKfuVqeoJppD
         26iCn7VUa37/eIOtStHAjlpGJyrzC4xthyKql/oWErMxEn3xYDxj0tpjMSwJzhunXp9s
         g6Gre68hOwWp3XJ+EJ/RX5FakL9ThGEGAkrmFyRZ+NQl6jPKIyRYm4/ailXUxHdSAC9d
         bZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yuOB9tqQjb61ZPMnnWLNy4JELHe6K52csDplIZjXnCE=;
        b=t6pEydptct60cAdVqikG9QerOL+m/NquoKORDXkzW+SdaXaUAGNBiMe62j8ZovfaAQ
         /Gwlf+/PZJ/Oyz3aBOipZS8VGjroAFDq1nlEmOeA3ncXmqaaiiT9UOkh4UTfJxA6f/nO
         lEJ30/DyohVMm/O4o2tkhO3Yck6G5QcclRWzmMd+iL3n7mfUZrxI7b0vuVZ0fp3QpIP8
         +zdj0ysUeR13i1adrDQOXazO/CQP+bBjZMf+M6veGiEhbh9tKqUlVq0nAWbXMNyQuIL3
         YghREqTfOskomdsqVNQFus4XfTVnF7wSgHZo9Q7doyXZJtf9vgzeDgKxuQC395T0itXC
         zTOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R1b7J6ni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k69si6933256ybk.312.2021.01.07.09.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 09:36:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R1b7J6ni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxZDN-0001cF-EJ
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 12:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZCm-0001ZF-RF
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:36:12 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZCj-0001ua-Rz
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:36:12 -0500
Received: by mail-ej1-x634.google.com with SMTP id b9so10915313ejy.0
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 09:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yuOB9tqQjb61ZPMnnWLNy4JELHe6K52csDplIZjXnCE=;
 b=R1b7J6ni4WQoh/8iEOLNJrfmEygVtqIdBzurjHHscwtL/q0hbunA4dezsDzTNA++zJ
 pucQ+jEpil84zvhdZbV0P9uuJk0T1aKCS3cMve2LexBF4NOEwv3NQCiHZiqNuFl1DX2U
 5IRXu01CvuI4fA+kb374FKwCDfp8qoD1MNV7IduJLReBuqp2s1OFmCMNxdcB3ZlAVZAT
 CctJPWbeIbQwJP9a0c9B4xaiJa8SCJubqZafShH2uJrJyu4EIr6lVMFiicWvsxxkmWeN
 RHSbtEf8EqqTCBLEhA5JvB4RYcU2X5MrtkIIwtqSVj7Ul/AsRrt1jHEqTHUtfJPUkPmT
 FT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yuOB9tqQjb61ZPMnnWLNy4JELHe6K52csDplIZjXnCE=;
 b=rrGOoumkGCd6BxQegf5j5gF35wh0g8jqOfj7r4mX4QhBXQsFRkLIZ53L4iZ/phg9NY
 Qyp4GCDLhez2Bli3YVit+ILPW9tWZYkKoqYmBQs/qelFWlelZAM0sDdz/YIEpK3neqq7
 /pxRH90oKaVCz9mWhJRFKGvp40C3ODk8uHafGUCnro1ErHNLrmup/bx1g+Y027Fu3Eei
 K8GD/AgUpcy+MeneLh7pttxpE9JQKAcytNfHS3H1VeSbfkn3eUyWLVlMDaxbr9nDfKN3
 Rt6i8PkBZWzF3GsWeDYk9j/XqCbrCEVauE9klolU36768HdQjCpFg//btTMNSTAYyWst
 hiUA==
X-Gm-Message-State: AOAM531Q+Qh1y+Twhgr0aubnrUKe+jdqoGgbm0LNcfLXz2vidCF2M3lW
 zcx/1lM/TUL4b68fAL/9x2q80dxFVH+hPVnw26HS4A==
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6994606ejf.407.1610040968058; 
 Thu, 07 Jan 2021 09:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-22-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:35:56 +0000
Message-ID: <CAFEAcA8j-SHEA00ev9P5spUEz=gKB=bxxj_M+gsPR+RzisZm1Q@mail.gmail.com>
Subject: Re: [PATCH v2 21/24] target/arm: Enforce alignment for aa64 vector
 LDn/STn (multiple)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rshN4j9IBTHf

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
