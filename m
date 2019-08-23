Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp697619wrs;
        Fri, 23 Aug 2019 08:10:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3REc3jFyAMEX8ZVuWVqqAL7kjT/SOp4wFvWRv65MsqAhe3J58ByrxAUJnAfGuaK51eSvX
X-Received: by 2002:a50:fc12:: with SMTP id i18mr5152587edr.23.1566573000360;
        Fri, 23 Aug 2019 08:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566573000; cv=none;
        d=google.com; s=arc-20160816;
        b=qvwC4dttuCn6tADaSNiKXJMgMrI+GzLj1G5eWZrA0Mq1Zo1ZvcuJ4wyWXDL+sW1Sqv
         NtHjwBMFWP+hQ+4bTHg8IhD+EQRnh/GMg8deHMn+p5wRx0zv5wtOF/s4+4+9+1dsJqMr
         35c5zuljfkUESvzFgs6TQvIBwMLgTHz69l/jzKaFzjYJMjmOBhQTfnMSM94aZf9uRUOP
         bgNwDVG2cqNIlfVEO0gu+NLytUideXhuS7qX1OT6I41aC6MEEfijiCW7ESoDbk/clp76
         z3NQ+Ik2Y4WNE9G5bolT3tf2VLud4d0BQaR6Wi31lxMyvlz06X/DUI67FBkO/al4CLJ9
         5gZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S9BWm8rALYi1vE1HhrquHz4J4gBYtALXVa0h9Tsi0uk=;
        b=iA6oifjm+Wm+djnpm+CdeOakGyyqTwlwqQIJiMo5GLNyY5KvYUTtrJ7sOZQxm40KHg
         QsNN7Su/TIGxpgQiaoDTB59/c632ohrSOcR9U+9dxBQCmlKUE0jyOKB0citx9Ru5L0G9
         EPmgFUIjkXKQ6nix/lBinsdYSd3W6wj5ykeh1Zm7DCrja1qH4RTEI6BwmzADzxB7Xj/x
         qm8lRPh4CAF7AAl5853CfZFkRuo4F0QCohOsZmnUqMqqr1rYLXccHg6FexzTr+hCqPyo
         SAEAZurgwehllknz+XmWvp+d7apzLMbtxEd7vNA20JEVdKQUz8Ftq2F/YGajYBSrVET9
         qrTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DjR//lLJ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g29si2080075eda.13.2019.08.23.08.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 08:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DjR//lLJ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1BCR-0006ZB-Eo
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 11:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1AxF-0006C1-V8
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:54:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1AxC-0008VE-Hq
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:54:16 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40777)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1AxC-0008Ux-Bb
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:54:14 -0400
Received: by mail-oi1-x241.google.com with SMTP id h21so7200360oie.7
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S9BWm8rALYi1vE1HhrquHz4J4gBYtALXVa0h9Tsi0uk=;
 b=DjR//lLJwOiOMeHMk8xSdZJbZFEM7Bxaw1/Hvsmc3dDyw1d6SMGRzfmgD/FZTFGP8J
 RU3GkRsWCS8naajUENGqwyJ5aoFoBBnRgQaY5ci0xl6hbzSpKQsK026E63EPun3XC05l
 bF9JyW17rYHGCoa5RVB4YnFShdp4fNFHAP8sYKys7dnggxGCB45BRIgfO3XkpRnuib1L
 n3EqJTYZV6wm+OmDqjj/AG+WHCx7yHsCwFvKcIV1ko4lM4+kGhEtQWhMBZbZZ1V/sAP4
 H4ebatXU1lwrtZYVYIhG6ddJy4QnNrNKjNfsK1jfp69WdYog+iUM2Qwe4198RQwM2npG
 vtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S9BWm8rALYi1vE1HhrquHz4J4gBYtALXVa0h9Tsi0uk=;
 b=s7qjrZjotcZMGBJpwfnZzTMaIaI2qenixXagUekVi42CuO0sA19SD3ey2ezsAKOtmB
 R39wcqdT15sXhAL6Q61i0YdHtJfhl7ZU6HvjHIBEESJ/9OLgWi1xk7Pshd9NfUK+h1q0
 HIrHNDwBF1Q/dCQqdLZbZ2A6Gf7njxvmbqofe7eUGs77YqxaxK5BTll3lBwUermdlvmh
 r7I+dHZ6dcZt92eSRA8/bAx0JXZUSYtsqTlVkYimOISJcqhYu3rvsv8RMNcHNhhe65zz
 cJ/HnSFGFF13lHD2gl1POlzl0p4G5HM+1jHuLdPK18u+PPFzQT4xZVEdvaXr4ehLsXgO
 xQhA==
X-Gm-Message-State: APjAAAW+H5QrhC0EXv/7j/83GVPujDONoEa1Dqj6UJM1ChHMHQVmeeUN
 1BVrqsAAdJHlhP6R6qCIa6H2g6iM35m+zkvgAZGu24K9
X-Received: by 2002:aca:4a57:: with SMTP id x84mr3488992oia.170.1566572053734; 
 Fri, 23 Aug 2019 07:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-21-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 15:54:03 +0100
Message-ID: <CAFEAcA85Ojy2u_G6frO_KL-kmTVCfpcOxsW5CCuKr=eKPcm+KQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v2 20/68] target/arm: Convert load/store
 (register, immediate, literal)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kuiMN+OVvPgk

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 797 ++++++++++++++++++-----------------------
>  target/arm/a32.decode  | 120 +++++++
>  target/arm/t32.decode  | 141 ++++++++
>  3 files changed, 615 insertions(+), 443 deletions(-)

This one is brutal to review. I got through review of all the
decode file patterns but got bogged down when I started looking
at the .c file changes... I might come back to it alter.

thanks
-- PMM
