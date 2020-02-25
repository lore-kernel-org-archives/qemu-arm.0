Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1707874lfg;
        Tue, 25 Feb 2020 05:49:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3K7LJgm0ql8/GJK6LlOZfh17Kky98/8beFxl2ExECPpVKjxQoWroe+5MSB12YycEPrplc
X-Received: by 2002:a05:620a:1586:: with SMTP id d6mr58046101qkk.234.1582638557272;
        Tue, 25 Feb 2020 05:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582638557; cv=none;
        d=google.com; s=arc-20160816;
        b=BFgp39jEB+AcbdGJVQJVjpFQA0tA8I8z2TW7mFsjMmA1TLWBiOpjHQqZ+42dM7aL4Z
         3cl3USfCVGiunRHH7Kt2ytFOSboEL7hKjG6gHUY7uqPs7OGoGn81g3ZdxXcc+PBmtggF
         Fo+hJSRcgHE//Q0aF+w74eor4C5Ct4zkv844m0L/b9QJwR+9e56Y2E/QPnUIMVuVGIp3
         SyrPZQxlMR0VbtIH+RmKN4CNecm+uL1ypIwSmYS9OesZ+XngEA4P33OTsQ/NlGugpOO7
         Bj9QBJ7HitvczFE3w6i5qHl0GjhV0NgmvyRFnC+taLc41LVWshaR6Sd4HyfjGxdiIb32
         CvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L+h6FndeHZ0z/+mTP+fkgUNIqtivlDuVFNytp9MZnm0=;
        b=u/FSb3euSFRG2AP4WSrhtuwspivPytWeDfX3wX/T0xcZDALxWqi07wxNkyc2Fm1/9y
         jK74zs5mWVa83HMycuW9zDjSTEgE7IvGh2slwsFwd31FDG6stJ9d9+8qeewl9czZfsxq
         5zl/d+QIaXMyuA/vU8MkhY6xwZDR9Od22gwcxB+N44Fmhept7DbtfC4oV0vHFJr91OTh
         guU9c4T8RjNfw4Hla79FGON9aBanB1QAxCP0NQWNh2+9sQF1Z36pHPG5nK9prXxD4bQR
         N5NMRTXbLOHHtnF71OhEi7YbsNwboSXnBd3Tw7cxZ0I1q5CNnh7QBodC16my3fS18lRP
         wELQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gr4tsRla;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21si7381388qtn.245.2020.02.25.05.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 05:49:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gr4tsRla;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6aaK-00085W-NN
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 08:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6aEw-0004wG-OQ
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:27:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6aEu-0007Lk-Kd
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:27:10 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45397)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6aEt-0007LK-U5
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:27:08 -0500
Received: by mail-oi1-x243.google.com with SMTP id v19so12495396oic.12
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 05:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L+h6FndeHZ0z/+mTP+fkgUNIqtivlDuVFNytp9MZnm0=;
 b=Gr4tsRla+EzQPetOwGKNFOFVL1nHKdk1UGKX7hMIIwPWfVvmrI2Xh248tq+UC7RFIX
 4+4Hvfz0mzrWXsGSUMdix7yyFzgYsQkSQmoq0u/sAZF2C5t7EUWSNysxMw1Zka6pmh5Q
 yMDaaMCcItGH7OI0lcdBLDTZpUr2EpNiNh7tAlcYOE1ec/RxdCftV9rgGfkOo43umNlp
 oubJqTO0ew77bmlJQratM7ALnYR0SFfKuAxqYycAv4sfu+rLtJu0dT2ddbJHkjtEaEXE
 C6yMfu1FTVdOjbbvtmaSEJydOdKgBkqT3Xm3c9LfE6EDnY7oQYMJj4YGNsW1x4Th9gv6
 Wsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L+h6FndeHZ0z/+mTP+fkgUNIqtivlDuVFNytp9MZnm0=;
 b=VpVfAHDqHcfipLQmqD87exegwwLMpmM3RwFLlhA/lvwepCMZUeDaUDBXFpnytDMoL7
 lC1kd91vOrV+hZqLgx/Qo+0uoSiSJqLUWrDHer05jECGhzfutx1/2POoC9aEEfx38X4u
 PCNauFIJUtgy+mtTVGBiBhW1UeZXpE/WY1WbPUIiNFhg8C97GFJEAe/KMJFt5/SrkApP
 6giPMf2ITtL1ra5kwvB/8qEkh50lHISUWaFiE5QCIOGXtPv7LcROoCqLeOTOlFO7kgwo
 tRiZnkFgN0fbAMkTLAB4oPQZhNJ5qpaLffNeSVOwAJqIJRmXHx0jjwFxxIsMWeVyFnnG
 AJfQ==
X-Gm-Message-State: APjAAAVrfcoqky3sVHboWIlabacnf4XZOHP673t8Krk9vsysMciLw7Dh
 KjM1vpSjoANFu1TG2EEtKsGTJCH27sGpnyxalXquhw==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr3689565oiy.170.1582637226920; 
 Tue, 25 Feb 2020 05:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-12-richard.henderson@linaro.org>
In-Reply-To: <20200224222232.13807-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 13:26:55 +0000
Message-ID: <CAFEAcA8MBdGAh3PptJBNE=m25CuYMJjfkiUBhGQ=6Yh-bEaBrg@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] target/arm: Move VLLDM and VLSTM to vfp.decode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-TUID: wMvV5i1S9LIy

On Mon, 24 Feb 2020 at 22:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that we no longer have an early check for ARM_FEATURE_VFP,
> we can use the proper ISA check in trans_VLLDM_VLSTM.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix !secure (pmm)
> ---
>  target/arm/vfp.decode          |  2 ++
>  target/arm/translate-vfp.inc.c | 39 +++++++++++++++++++++++++
>  target/arm/translate.c         | 53 ++++++----------------------------
>  3 files changed, 50 insertions(+), 44 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
