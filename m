Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3889088wrg;
        Tue, 18 Jun 2019 08:58:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzn1CqhNY8yVKhynzNVbLiJyJ42QFXPf8eQiBMMrr3YxZQ2rdEAlaWZbRuB8LZTt9i2Wutp
X-Received: by 2002:aed:222d:: with SMTP id n42mr21042590qtc.144.1560873534712;
        Tue, 18 Jun 2019 08:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560873534; cv=none;
        d=google.com; s=arc-20160816;
        b=LPb/LQqtrMAN3JT08i9KS86Js9S/4WrPZQcWE4P3GwTcHhRLltcHS6xmbpDDjp/n1z
         mGXzf7Iy9nMobFOOC8dJl40zu3TTOvvY3SaEhjXgX61HebUaBLoZs8pjZsrOAU7rC2Qz
         ehDESyEtX1G35Ou/y+ABMhh6X1duCnByfGGJ4iIGwv8W42MhgzdOT4l6T6TgO881DB0s
         ANtoNJNjMybSurYymXoJ0yxTOx4LIuUlMqkkhQt8Y75uKESRbMfeKwtVEcTHm2+8cqKr
         fagHgdPFnoeVYRKOBDR97KHPjpQ0wJ0OjJbA24XS8taW+GFDJplqfIdCZ16Wr9uUECWJ
         1HhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5CM2l+0mD9tyQ0ZlijD1jvdtcyKrRsOsYT2OndT2Y20=;
        b=VdiAdGB3/lOq5LG8iC3nX4R8L5Bafz75ykxfJXsdrqcRq5Xoa2RadPHOnMENMaFgWr
         K2VkY30lrnXw/A9qJDcNJMzOQeqRG9nwit/8PzhDFXEsOyI09tQt2Qr4d5FnNXo0E4yZ
         csOvMe37HIy4EXezgetzvR1hnGUxO0A+sGNloikziM5sCRrzy2WOVqs0INGyJTbCE8aJ
         iYhUAGFjGXmxB+552WPWUaZLuscbjQGuVIqJXtmzbTSAt0UNirlcbLaaZi5QbHXhtOz1
         BclI03xcfNGAghpks10xicN092y4wQNiVq6etTQqVpbyU74AubllVz7DzbC50A4zLdRI
         PZUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YpU71m5o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si10040275qvh.140.2019.06.18.08.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 08:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YpU71m5o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdGVa-0003zL-8X
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 11:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41943)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hdFOL-00010u-7L
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:47:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hdFOA-0000cV-Bs
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:47:21 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hdFOA-0000a7-1P
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:47:10 -0400
Received: by mail-ot1-x341.google.com with SMTP id r6so15067488oti.3
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 07:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5CM2l+0mD9tyQ0ZlijD1jvdtcyKrRsOsYT2OndT2Y20=;
 b=YpU71m5o43TJNxtBJ6bOQnJhsnD4VViaczgKKYzhS1zSO6Wyrkci13fVBAEsXjjXLo
 yHF3n8klMa6SKVRwSJEAOneyHyuPQPK4X/JTpttKcrzXe9YXGPfthqgTgdZqg6G7SvdM
 mJvlULZh4+7VYgC3VWtRGi8nE4Ue3T355ClL0bBZSsvx0h6IBBat3GGpVoKY9WAO8rGq
 AbxLc3+h4X8nDK1ELSFnX9dxjeh2S9WlOIGnlUTLgpBg6cSz4WaErXLflcmqqox/+Mob
 xWDtU/tgzrmvOpnS7MpiXbkxJurZk+88v35jKqZVPSv+U9FqExmamDrRGfqIL5QXKuXq
 5pEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5CM2l+0mD9tyQ0ZlijD1jvdtcyKrRsOsYT2OndT2Y20=;
 b=gQ2mRA0YdqvPzrOmZNUv2i3Uq1hM2kCNaE1qp7kc7mftrXv08mq9BBZl2aNNqBTh9Z
 81jLQYBBNWtStQvSGObEo3NWoPXCqRvaUnlZquF0TFT479dDe1Vqbp0YBRhH/TIrw8f/
 kfLeb+2eF/Fkl6w1VA2Fcv6/IlEAEcTMkczyL14HsrOeKlC1awbUjRM90lpGCQF4iu3Q
 jm0CICO/+Sspb8nPj2SPONQ5UpXCar75v9XxchlOJ3aNdHTi0kpOaYOlXpnNGP8soQaI
 DQpZemktKYsIjWrazc240DMUzKDBBVau+LISfPc/HViM1WD1IzjPsI5oSYBo4nhC3nHZ
 eZjQ==
X-Gm-Message-State: APjAAAVFJei4aPvYGMq64ZJ5LV038oQyPaILg4+gAwqxMADF0wFzPEVy
 E8/OJsFpidDpZETdeSlmJbUwInlsrNUA8e23mHsSgA==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr5564260oti.91.1560869227248; 
 Tue, 18 Jun 2019 07:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190617160130.3207-1-peter.maydell@linaro.org>
 <ee659698-d2fb-8fd1-dc73-baa7b63a94ba@linaro.org>
In-Reply-To: <ee659698-d2fb-8fd1-dc73-baa7b63a94ba@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 15:46:56 +0100
Message-ID: <CAFEAcA_ZJhhWrV1bKfXhTOAmv4kmmoRg-GmqY_ST-Jf4Uf9Ntw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH] target/arm: Check for dp support for dp
 VFM, not sp
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
X-TUID: N7OJncuqSBEN

On Mon, 17 Jun 2019 at 20:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/17/19 9:01 AM, Peter Maydell wrote:
> > In commit 1120827fa182f0e7622 we accidentally put the
> > "UNDEF unless FPU has double-precision support" check in
> > the single-precision VFM function. Put it in the dp
> > function where it belongs.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > I just merged the pullreq with 1120827fa182f0e7622 an hour
> > ago and then I spotted this bug in it...
> >
> >  target/arm/translate-vfp.inc.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> Oops.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to master, given it was a silly regression.

-- PMM
