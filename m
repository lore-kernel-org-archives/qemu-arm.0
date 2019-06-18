Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3546580wrg;
        Tue, 18 Jun 2019 03:31:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy0oV5iBGIquqIM3XVZVnZWuwiwQBFZSXAeanAi+cEsfRn+y18S9qIrfCRuG+daDlUrY+D4
X-Received: by 2002:a17:906:6d2:: with SMTP id v18mr413950ejb.279.1560853890249;
        Tue, 18 Jun 2019 03:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560853890; cv=none;
        d=google.com; s=arc-20160816;
        b=OtRxyKJaRr/RZQKSMvQy3Na1OrcEADKtbb/ezUVpz5HEJUfptx/Y2YeXCNjSOB5HgT
         KRrbnQkLzOzyG1rUJQG17W/cXGUFu+qFMdurO/jTYnesyOz4JEaVq8zl6vUxTvU6dtjf
         aNwqwvA4hwluTLdXwDoHuoumkreYgODYDira8KFH0OuOKx5ywCXojoUwA8jPfNR6wor2
         eDQVViF+OXnrsJh4ngxu7+BcYGAVM5EPvaSGq1fiugyrazBhC+vNXrPw7mo38f2eQMz+
         CxZ9e8f5DF8iK6ctiM9mvt3CliY0OFIkNYZlRpVc1vnAwbwApWBUf2nHFjRLcLcgC7YR
         AYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5+63sKQjEWxDjNPavIZp3aBHTo9bsItjTwBV7ypFB5c=;
        b=mUudaXtAMWrc19funIRAzWCeU/DbbFElZssoefOEhy9OToxlRzjrOym5YtHtA9fU4w
         YnG/GnvsguFKmrB/xu0VEdsfP9bANFM+2Yu/CoCJpt1u/+GICvkhMvEft1eTSLndq7sR
         t11dbaidfuHnge4rt4swzAS5dsN/eROikpDKsstmZvlhmR66rb/FdkrpB5QNOhZ1r4YK
         lybefzImv5XUKgHKc5NRcGTjsexP8A4RAW6dNsnh3v6BFe5d6EgRMXnMn8siffcqnrsF
         3OApGomChwizVmftnls4sKYapASqPoV60M7xoIlfu4r1YzxswALX1XUTfdG1F3T+QG7K
         lgdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oy33dy9a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w58si11871904edw.316.2019.06.18.03.31.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 03:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oy33dy9a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdBOj-0008GB-CB
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 06:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hdBOa-0008FZ-Nx
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 06:31:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hdBOZ-0005fX-OR
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 06:31:20 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37048)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hdBOZ-0005dP-Fs
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 06:31:19 -0400
Received: by mail-ot1-x342.google.com with SMTP id s20so13693623otp.4
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 03:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+63sKQjEWxDjNPavIZp3aBHTo9bsItjTwBV7ypFB5c=;
 b=Oy33dy9aGOljFxXjebAJ1Vit+1bMCPAMIkbnvrGsb8QiDN1sqZ1uqswDxM4aMOahmh
 G3rSARVjlqEGmgAF3Fw0dEJS3TX5+jHKeFSdNgi2UtYOCaRTCggZx4/VntpZ8xUFhy3f
 xIQrLsq+uD0kDG74vc7AzvsSR/7+Nj898tnqdA5wM6+rmf8a2ugGVz/9fnacwxo7igQa
 XlXtXMHSyMx06dWlcIbYxwh5DPykAo2sLqOBTHwF3AHxF6/LfdMy3BPneIXR0xT0i6ZY
 P7uS2f6xZ/aXq/q4M4K00LCujA2PWjWy627BP/ZCbkIbxwmeJaDR1aWGG7oiVkAmFMTH
 7CQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+63sKQjEWxDjNPavIZp3aBHTo9bsItjTwBV7ypFB5c=;
 b=eKEDR5lwrhmSoL/4838y4He08hfvtp6m3fyD44yOewVwZmuQovgOpOhQ7rKIGxsNNW
 og951D0W4E25hCukWYadactQVjZ24yO1OsX68WI8M8fb555WbIV7mERbFIvsspxaMt03
 uqzVCvB9WuxP0MmHNFZNLr8cVvx+a3Hj1weIJlrxnK3lH6SIhB4AYoEgzxOeQVNFKwji
 YbQP2n1QafpvoXocLWu/cg1f3GctEwirh1nmyuEC8MZgFTwqpb9h3snfkLTQBLPKaJSr
 /sLj0rSlE2uATvh1LbVEGnGUqA4SbVis2QqPpmaBtDxmatvDXmetC8gPsWGtzJm5yRJh
 Bqiw==
X-Gm-Message-State: APjAAAVY324WqWQ2Cji5VXebbWj1EyyBNco/JW+A/UBRF/REGov6rcLj
 i83gxUoxFzG46Kr7LDogKFBA2s0+/Heaf6NVpYfMoA==
X-Received: by 2002:a9d:d17:: with SMTP id 23mr62381100oti.221.1560853877464; 
 Tue, 18 Jun 2019 03:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190617175317.27557-1-peter.maydell@linaro.org>
 <20190617175317.27557-2-peter.maydell@linaro.org>
 <38277bbe-b942-337e-4a7c-dac3ad3a60b5@linaro.org>
In-Reply-To: <38277bbe-b942-337e-4a7c-dac3ad3a60b5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 11:31:05 +0100
Message-ID: <CAFEAcA9P=5=+Z9-+FXVAB=j=3d7XO3QhWYVGvMZd=-_YdPr6aQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/6] target/arm: NS BusFault on
 vector table fetch escalates to NS HardFault
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
X-TUID: zXGTsmzzpHWe

On Mon, 17 Jun 2019 at 20:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/17/19 10:53 AM, Peter Maydell wrote:
> > +     * The HardFault is Secure if BFHFNMINS is 0 (meaning that all HFs are
> > +     * secure); otherwise it targets the same security state as the
> > +     * underlying exception.
> >       */
> > -    exc_secure = targets_secure ||
> > -        !(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK);
> > +    if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
> > +        exc_secure = false;
> > +    }
>
> exc_secure = true, surely?

Yep, good catch. I got it right in the comment text :-)

thanks
-- PMM
