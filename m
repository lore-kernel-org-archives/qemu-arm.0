Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp235540lfq;
        Wed, 16 Dec 2020 02:59:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/LEPiavuxLXyxwG4tZDmgZERvrp4uMYmZrNhXSJL7B4xwkz+EbyLC60hRYLNRPrpxEUje
X-Received: by 2002:a25:2e4c:: with SMTP id b12mr16028858ybn.308.1608116352636;
        Wed, 16 Dec 2020 02:59:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608116352; cv=none;
        d=google.com; s=arc-20160816;
        b=qib0CboFhmfFllZZC2OSVZkA1/3wERiWX9v9rDuOaWf3c6BrEqzoSmaJ5wAD0VcZu/
         RFnJF6yfUHTuRX1qhMXg5EWqitMfHxpl+iYp9y6a1EVEWE/JclGdPY6TnBEHIKpN7uPK
         xPH1jNUtyjuyefjWuKyINP8jVLvithEEDyOIiqhotug6yWkNLMy1vIM7aFhq4opGvoEb
         7yX4pAByQYjlpqMtWag1ZSoQ0JxqdkJUnDURvbToJ7JFvaZtwSAFIT2LjvFpkG7fp3t2
         hcN2+52kVrfWVlPBjOC+DH6URgpguWrqbLM7RAsSMG2FKvia7hA6BZOvQIyNeXj/umO5
         Bj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ywYYqpNnKzLrKfioks2xl5oARygd3HOOPt6ZNGW3Qh8=;
        b=PXtUWQy/BFO3RZgyBmJV/ig8LuuV2Y2LBu31AFvFmDpEzsuPmImHZo5wpU5RbQZjUD
         vFSfRqAMwJl8c/OoGS2bQDpLQLIxxqm7KTem25FFSKA0bPB1EPIkSOnf9T/JFJoRSJx/
         RKs17SEaYUg2pWF+gh6YpQ4c7kIjmlxpFRsyBH2RTZ2yvyyV26WHL9vZzxEsujvWY7/7
         rKacldWdbyTL1mgUSNadgreaPxFs1kFa9bv5lUVx9fvmoPcCpvub0WXSwgjtCVMiV3cJ
         8d8SJrwo3ccKbN4kPOlH73RkVgQHvx3J13GBdhkSTNiim9yJ983+nwLqSFqZqYKZ0/sc
         mvzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BCPUYX7R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si1018794ybo.106.2020.12.16.02.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 02:59:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BCPUYX7R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpUWW-000085-2v
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 05:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpUUq-0006YM-6j
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:57:28 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpUUo-0000AT-Bc
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:57:27 -0500
Received: by mail-ej1-x633.google.com with SMTP id n26so32040644eju.6
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 02:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ywYYqpNnKzLrKfioks2xl5oARygd3HOOPt6ZNGW3Qh8=;
 b=BCPUYX7RuPb039IHsUEIHa8VLdkhhVn30qtDMaWKeTbzwWf7PmF0WZYMSWoSCFhrAE
 N2Mi0wx6/lxA3whjWDAqIWsv67/a+Z0gRSn7wr1gHg7+UEHdrjIRgfIgqYOrzAp1NRYe
 CIa3x9TacsaGP18LQNjzLF90idtnGOcxIqNOFzbYszSHZsYVHB25fk2cezUvfXudoAmn
 eSLmbN/plFcMn3VftWoxF6J2bwvTm/oAt/f1+uLNeq8vVfzr08JChdVIfIVyJdFHvjuJ
 sJULXImxTGKZ0997glr8xp2aHjb+aGjaZflxxZvT33FzzUSR7asuX23M/QEhsU9vs+LV
 wZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ywYYqpNnKzLrKfioks2xl5oARygd3HOOPt6ZNGW3Qh8=;
 b=JGYrNL3//Oi/2NxLntMp0CMNSl6xh8xdtYEJVJmlSBUlWJsiQSKnk3v3Z9s2465Ao4
 Cd2BhzEk+C6xYxp+axZ84ycDRXl1K5xzHNXIQWhd58QzV503ik0OwJ3FUQEwdqONhtto
 ZUeg4C1xZm7t5UOnUbowAQ2KZcYD1Tzhfqz8etF1ROmAcxrMHFxwSFrT26y3R0mpwdpT
 sG5AiJSG9rtP2xZbPmvev2AJnRvoTfxwp3yf/xeTLIlWaJZBZpY8NEzz8WIo0ReYpHJh
 nISPcbyEFEwhsoE/gIe/nZuSI2icVLkDuIhdJklgiDNAmaAMX6uVYlLpXv4/0/ovqGPI
 t/Qg==
X-Gm-Message-State: AOAM532C4SsyvZx/eIVs73fMUJa1S7KvTDaOz3DD0nrxA3Y2hGtIOkME
 mRAtc+pelmKfyLn8hXVYNtPRbLP4yfA0fm01DE50Rw==
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr30848294eja.250.1608116244802; 
 Wed, 16 Dec 2020 02:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20201214202329.26765-1-rebecca@nuviainc.com>
 <20201214202329.26765-4-rebecca@nuviainc.com>
 <8f35d417-753e-5949-aedb-bea3b68b66a9@linaro.org>
In-Reply-To: <8f35d417-753e-5949-aedb-bea3b68b66a9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Dec 2020 10:57:13 +0000
Message-ID: <CAFEAcA-vyws-cb5Qomvc_RFrCz0oLNefBhmk11yG35FBOv4=dQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Rebecca Cran <rebecca@nuviainc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m+vwWR1UOK7M

On Tue, 15 Dec 2020 at 21:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Though it's slightly annoying that F.c has
> renamed all of the extensions.

It's in a good cause, which is to say it avoids the previous
irritating ambiguity where you had some duplication between
v8.x-Foo and v8.y-Foo that meant "Foo" alone wasn't a unique
identifier for the extension.

thanks
-- PMM
