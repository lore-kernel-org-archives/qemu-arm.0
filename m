Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2959152wrs;
        Sun, 25 Aug 2019 09:35:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwaaOytsHdd09zr3B9SpKLxjj7wuwvJLPX2tsvFl3Y4RitlrDDCp9zlafzH40ZK+IPfPQEn
X-Received: by 2002:aed:3363:: with SMTP id u90mr14002139qtd.7.1566750959665;
        Sun, 25 Aug 2019 09:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566750959; cv=none;
        d=google.com; s=arc-20160816;
        b=cTiiUi1RuxnuMl9/cIIwyi4ryQdh21zjCSHiahkH/iFM5F880a1iCecJw9/TdQ5kEB
         yahl+ZgKgQA4JA8SHy3hWBsih9EFxZmeB1ZE5NJ+VS6OOMG09Nl3Bt9oQw/hVhe7y2qO
         6MrobgUJyJaInMFKn5piSmOXKdD7uMA4SWaXiEmeEPNouEjhZl4u53wRXgExtKDzMpxL
         M6Qwd+FGpEYjtbZCFlF/wPzRaePUHu1een03cA4io+KyuxP7ljyQyG+rHA4i8ZEd5DiU
         gyDb0Y3FzWR2MHGHnnPW6FHpEVUlk4bg9PcZ2Gz6m9fXISZHg1Gm2e7TBctpg/pqdK7D
         gfjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Inqz98WDCGQqQ9HeFDrdNH+ildqMiy0bHC1qqslO2WY=;
        b=Ku34u0ZZSJy+aMN6t/Jk4K0V3UzGojoldipuTmnAcdKbhFPEiDMSDa5alP6Sa97f1G
         9gEyZD8IxldGvKUE0zF0QrWgIG/Uha9sScz2GeunEL19/OqngDkVigIYDRAL19P/AQB+
         OO06e+mamhTZ/YeYkptWMn5O1sZKP/5iybGL9KUXcW/7iDpjB+321mlcZEDikDW4TbRN
         Q3nTBkehJcTaUSS3qjMhMQLqjAfO/sqAl0b1Xdc2i3j85oxflM+szRbscSQAzez8P4A1
         Y1aTM6c82WRxhqWaB5mqZvjJMfJG9FAhOfGReDrrhwMZXOtzyvr7g5sPGxedg9M9QetW
         XSTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eVS+UuOS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i56si6659363qvc.91.2019.08.25.09.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 09:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eVS+UuOS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1vUl-0005ia-2m
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 12:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35274)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vUG-0005gP-Al
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:35:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vUF-0002hU-FL
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:35:28 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37069)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1vUF-0002h5-B2
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:35:27 -0400
Received: by mail-oi1-x241.google.com with SMTP id b25so10458143oib.4
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 09:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Inqz98WDCGQqQ9HeFDrdNH+ildqMiy0bHC1qqslO2WY=;
 b=eVS+UuOSE3TypT8DWPlV2QimSXj1fnenT6nOju/x0ZDCf9xIHQEC+9UpsnMp7cW0NO
 S5JCaIzOOzmJXqjvSL9rHOq3cSjnRnAY67dC1YOjjijnLwqYLGvOiLAbeTCmRavJ4ipI
 3MYcXV3KttFR7JqNJjCSuGnL3VErivxiNYIuSGArI5g8zdgH7803MVLSEClHuWLX7yUc
 2ZcnerGaSGT1ZO+JjxaNK1KuIiszZqk1h1NFbWluY0dQLSfJtvh6WyjrwXMwWj3KF+7p
 PdT8++xg4m49jTB1KgX9plVqWpbC0iwSvwP0oxcboebVs7BZTheYWJlHqx1huiSW2HQt
 A43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Inqz98WDCGQqQ9HeFDrdNH+ildqMiy0bHC1qqslO2WY=;
 b=QGEJmKiwU2LKyUee7HcNTKbe/WsFbJFU9A0EFoSrDYZuy9q2avLNy90raIrzO7W0sc
 /1NJww6ycOiAQsnfBHnRP1A2rCCBAUQA9Fxy2AMH1Psgv9AevvDuzdSKL/ZUUkdWACAR
 Ji5r2BsmEasFKDQHnTe4+4vTeOw42Ylwa2MpQeckaRIiNRs7cB1mnR4hjVKw2TRE0gd5
 YI4BmA6sd0mFvdbfu5ILDhLRAODfKWIORewlulqgXR12rEskJRuA8fquxe7hGq4VQA0q
 o/WpSZWWYkq4YnNwkF3whnSSgJm+nb66gWiuyqZV7s17P8eWrUGivPXy2ySvquCfEJFW
 GcPw==
X-Gm-Message-State: APjAAAURrMZSiR6o0L6Rv//y3r3XOPLzyHRrri9kqcL/e6IjatiLP+NM
 gbs4FwjUDqShGuCd6/gMpEkiWvkBC8VwXA8De9/4GA==
X-Received: by 2002:aca:4b86:: with SMTP id y128mr9720370oia.163.1566750926468; 
 Sun, 25 Aug 2019 09:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-43-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 17:35:15 +0100
Message-ID: <CAFEAcA8EXDyTmr+0s_y6iBjobQf5+jSM+3SpzrFOzH3+V+Bsxg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v2 42/68] target/arm: Simplify
 disas_thumb2_insn
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
X-TUID: lxN7THAbyVfs

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fold away all of the cases that now just goto illegal_op,
> because all of their internal bits are now in decodetree.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
