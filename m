Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2959879wrs;
        Sun, 25 Aug 2019 09:37:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3e2aGS1K/+rgz3NwqjNy6w/SMFNoH6PpXoUC8KabBt+wIufFjIPwBL10rmvn0Szy1CTAo
X-Received: by 2002:aa7:d397:: with SMTP id x23mr14344431edq.11.1566751021915;
        Sun, 25 Aug 2019 09:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566751021; cv=none;
        d=google.com; s=arc-20160816;
        b=prn6+GI480+/XI7bQBzHoPaB+rRvV4J/wNnNRsYCwApDRk8w+ZgJhOgkI0qUp26Ppi
         jGD/ZZPxz8lKAJ+aSlNg5+rYJhoCyMs/Chhh2plIRwEw+nlSBz60j6/PgOAGvXNrSgBr
         X2QhjdgHIbZm63B2XXQW1wVkOLvVuGN+1g2LkqZpWCl6+Y8Vv97p3FdVlBe31/YrgWUk
         8GnPbDSavjHlowA/RP9c+oYvsyp3wXbq6c6V6xAxvBSZ9Oy/+Eg91Vqkw4TSfxvLbcYo
         ySiTBj2hwO2qNDAUWCWTjPKlHV2+yhwqfflHI/4kh980jeOTMd6KnnC0PI2UIKtqMUEy
         2/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1AEENBvaWT9CwODvTcq2LteBC3Mws8Ok8F6MJ4Glzd8=;
        b=Udlzlc8WnEjkJREe5nGEReETY7IPYBqBDycwDY+HK44sOJFIrETvY+9ZQMwkGX0mVx
         LtW7wEihor6l6aes5fyswdvtvdHe81J7X7P+hnHNbGUwIYdisfqg2/ECXaz0d5JeuTxX
         qAxfq2y+Z3NAN+O21kHTF0oh9bwx730BdgkoUh4vAHRopJ3RXLGyJjZN/OHGC+De/N74
         Vz4JEcSoPH9Cs0XJId7nFsjL2B+46f0yjixy47uad/LbY8+5L1NAHtQHp/79gIuo0ABK
         x5P71o+89dUC49unycK3MfkQaJAzmKNK8Pq/3fgJGP5lvi7a6qGzOgF5+Yx3mI5k/lr1
         Ddzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Raa55hsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si5391100edc.40.2019.08.25.09.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 09:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Raa55hsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1vVk-0006UA-Sc
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 12:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vVX-0006SR-MN
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vVV-0003BR-Qn
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:36:47 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41292)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1vVV-0003BH-LY
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:36:45 -0400
Received: by mail-oi1-x244.google.com with SMTP id p127so1822587oic.8
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1AEENBvaWT9CwODvTcq2LteBC3Mws8Ok8F6MJ4Glzd8=;
 b=Raa55hsm2WBh+rTjzdlgWIJl6nlJQ6inc0steHf0tkGKEP/YtndhPYm0W8YNXJ7OBF
 bXN4lDjLu5iFwO3ywF4aV7L4VbU42j5Me3NtZubaxPCs2hKUXRR55dunIiUHrgoQEksK
 rMdO2Ff4jQacQzpdjwubCJlzYhJsje6DsAAyt9w9SMthJLNomw2Mk6MyU7S5pn5qP/KQ
 GrtSKdcZEuI5wUF3NuKEVpsZ3ORkyaQilm/GV6KZNKdXJZDElqcRva/lpA2QATD4c/IE
 IE4C3ycaUrWaeIixX7y7HDEUGZw9Ji6PxNS5lgkzXrO9Mq9gImttkcqrjX5ymLhhvJBS
 EY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1AEENBvaWT9CwODvTcq2LteBC3Mws8Ok8F6MJ4Glzd8=;
 b=FmIdUNxY4gkOETqcZxEM4neBjI00Zy9Y7UIFzLSW7SZ4mbQjRhSQcr45PTS9SNBLy1
 NJCud+qTcsQ7UGQFEWP87QDBZnUac6jw+RaobSGgjM0aCB7KtE7YGV6ZrqNTCWmXks2h
 NetqU5nuZOxMvNlmMGmCk3H1wWABG2bAd9rImdVT6U9WNqTCUnGZIeypgzo/rFKAYMcJ
 gRgKU0D5bN8NBSQT5Swaa+vLoj+kfVLEZPpWfF1jUi/DZStEJiCnFJcULYjndH6Xpcol
 Whl5Vz6s21k7qnbVwyhw7wZEpNushOLD357blFvDEVgs0PWUPsTzFwIqXyeNVCLX9nl0
 tolw==
X-Gm-Message-State: APjAAAUO4epd8TuytKxadf8yd0/14Bc+0LtaU8r37CUJqNEdFfOgXNWp
 UYf6aXfY1GLHkbsA/ZuM+ykJvtYc46m8Vtaw8g4idA==
X-Received: by 2002:aca:4a57:: with SMTP id x84mr9859819oia.170.1566751005023; 
 Sun, 25 Aug 2019 09:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-44-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 17:36:33 +0100
Message-ID: <CAFEAcA8SVkXO2hhP2ALkOAQ4+o9EmUvKV+Ja4djaaumGK6LnYw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v2 43/68] target/arm: Simplify disas_arm_insn
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
X-TUID: 6JLxo0bnpUE2

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fold away all of the cases that now just goto illegal_op,
> because all of their internal bits are now in decodetree.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 69 ++++++++++--------------------------------
>  1 file changed, 16 insertions(+), 53 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
