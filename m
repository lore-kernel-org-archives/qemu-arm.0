Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3992573wrp;
        Tue, 24 Sep 2019 07:37:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwe5O8B1pmg1yG18RaSMOVwB7YqQGz6ecDHM034yQSEr45tzhO07rNBUTAHQr765Du8MTDz
X-Received: by 2002:a05:620a:130e:: with SMTP id o14mr2639344qkj.127.1569335829730;
        Tue, 24 Sep 2019 07:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569335829; cv=none;
        d=google.com; s=arc-20160816;
        b=pCai5YDUPQOgnHbPdzv2MCHzZr1kqbauhFH4IJGNj8w52JsXdrQpFi34364CSx/vjr
         8ra7GhkGzMbA+yPUALGLFr6tf2fEPslfmWiIx5gwqoy3EjVQ59GGR4XgM0sLPfcB1JcT
         eVdr53S5Vta91g8JcL5E8zy+QiLyW2apnWZIfxNftAKgpchTNRgzDcSuzXdDuOid+G6o
         xM1KsQGasVwL9OflyFgDOZ94noQZ41FTSaGLcB8k28MIXEq7zfoyeJdFZ/ppNp412qKh
         sGCTFz8+RJPLcEb3i9s5KUYQExfA50q+tOhOUBu3cTACZYfSNdxGFAQ4yZZzXH3jmIe9
         V5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Mhd/FJiamKV8bgwxvhSM1XmfViMLPDMRpLbPk1h8UFQ=;
        b=EuVpJ/6pCqxUgjRwCCock0msOBYctUQioUqxok6RnHp0o5S46sX0BTBWIJdkmcnJ0s
         MgeCT96Vf9bcgTU4HpP9Sr2Ue0ZNPkbTTEKWXLt4YvIgWljgMA28ge+wGLxUl/CyUz/w
         lrXQ6enSYQdF3gV9eBuzPfQ2Y7QLXxizzqBXAHBAh8UxLjrZmdx4MQgkHQkpKClHY1Yd
         iIdpIJj4bjz1twLdJHpHY2qXfZnVwZpiM0Ue2vaao4axiPiGW+2r69+Yk1RgJTbhgZP+
         Kh9+GhfixqWQDGY/W6eqn4KICDJ6xdl5ymnv+tdXR2m79C6T40un6K+GPZ8EWwFIeRZY
         /gSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j4yagwqX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si1366538qtg.373.2019.09.24.07.37.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 07:37:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j4yagwqX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iClwC-0004bb-E2
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 10:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38254)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCla9-0001Ka-6V
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:14:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCla7-00006p-SX
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:14:20 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:42276)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCla7-00006F-LV
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:14:19 -0400
Received: by mail-oi1-x244.google.com with SMTP id i185so1748321oif.9
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mhd/FJiamKV8bgwxvhSM1XmfViMLPDMRpLbPk1h8UFQ=;
 b=j4yagwqXqS6lcOkOx5LSGKWlLY7JFtE0BSiUDKdT/0FUEo1UqAlkUOmbTGRRCzlYQd
 0tH7T1+Gffnwm7zqlAzsr8aoQsWIMlsiFYsW1Ii58h7uXiPoElHc8mwCXHRugHNH4eim
 fI38tAv+rKuucYWaAa1KAfpC80eYWTfqeF2a6kOcA4zNzKhAWp7b9ULGsPrDeEdPMAd5
 dVToJBdinNNvbzgJkJOM+NNBgeN5Aw6o+4mNwuvXHZjbmiFDC4ifq2As5wVh0MHO8rRW
 BEtnDgNNrNoOozizNFmaIQBn1OZngb016lQmCXLeudMN6LAdO4KTi2/Hi/juPoAoFAY4
 z+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mhd/FJiamKV8bgwxvhSM1XmfViMLPDMRpLbPk1h8UFQ=;
 b=dEOmwlRM1EBsj7WULPAob3dIO/FPdk2C7crygiY+Kjf8K0Dwv74T58Y6sYG10FSnau
 u+BP3qr/GxXYdQsMEpUBBXFW9BWKyZSBPs/rQriqFS5VjLeTpwjP7+zjwtfb/f9ecJCo
 iojkV1Axs0yOGslAON+8CYMq8e8fD8QZ2nM6CQMzvYnoKzrbI42mr+Y8GHB4+7DN7JHu
 IN6ea8yy9ujIaNI5EAavmIGcS3TX9PwPJ8G4PY7X5crxYOZ6BmnhFWU4pJ8hQFkoxxem
 kHYow3R6clWlqTdcc7BUJCzm//vXZptFO2DLf4KZG+oaEh3A+Kptp85k/gIPltCQmZ9n
 QKXw==
X-Gm-Message-State: APjAAAXt3HfcI5iBJ/HMEtssabjMdBFasEYR/BbaTqO6Op3QO+uqlEb4
 WP5n6cH2Iky0Cg2ddGEsRCG38B8DnnhjvBzv/qftng==
X-Received: by 2002:aca:50d8:: with SMTP id e207mr255616oib.48.1569334458739; 
 Tue, 24 Sep 2019 07:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190924141228.25009-1-philmd@redhat.com>
In-Reply-To: <20190924141228.25009-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Sep 2019 15:14:07 +0100
Message-ID: <CAFEAcA9a-OdpzLgqeO+iRTr3PNYxGZ+ECX_GVOQD0NLNk8OynA@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/pl031: Add warning "do not use as model to
 implement a RTC"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gppMWzuRtHw2

On Tue, 24 Sep 2019 at 15:12, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Peter said we should "not use the pl031 as a good model of how
> to do an RTC, it has some definite flaws."
> Add this information to the PL031 header for other developers.

Lots of our code is less than great. I'm not sure this
specific case really justifies blazoning it in a comment header
at the top of the file... (If you do want to put in a comment,
being more specific about exactly what the problems are would
be better.)

thanks
-- PMM
