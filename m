Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1713887lfm;
        Thu, 16 Apr 2020 04:50:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ/4gVELAC9fNQNnozKfaXcSim2JhJfXHyHW79JcjUfNwCU8NoezUf6zdw30/GHu9LyQ6ys
X-Received: by 2002:aed:3ec2:: with SMTP id o2mr21285610qtf.334.1587037857869;
        Thu, 16 Apr 2020 04:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587037857; cv=none;
        d=google.com; s=arc-20160816;
        b=VBLkRBUS8cRiDUExBGQ8HZQvsaDAENPmzYXxy82FN251qTYnVxWz72a9rsMVdQivPv
         ZErlu42jg0kco9VLnKwE2es79ywRw/EGOoXT/aZbmP+eUXGWAMlJL3euad+5xKxuGN02
         WhXXU+7ir9IS7ubH0tYzURDMalrURMoSeYBpC+yDYmXKU514Gn7QVLCtnx5lxHby37iE
         9S1PL7Y4TwDtLZMTiya5CC7G6IFSJxbMbeSbrTBjWdGOPKwKz67eTJ3E2SY2CJ+hc/7p
         Qdu456uHX/sUVdi/xUuAD/7gFPOjAm1u9Brs3ImnGVQT4ipOWpMUUsdASWASje1pHJdb
         Ps+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LKuKZtmCFBBOmi/nYr8sqZGUnzBbIaXVXTkItTpLj8A=;
        b=06ZVbijuimemC5TJ2jmMcUQ8yxuA9o2ITLC1uFBo5m1jzLkAHNXXMFeL0ji1DbU6A/
         qBblYYPODH2z4oM9PX9TOt2gnOFL8QRLSYxTA3MuS9mKdDgS9/7440y1OKHs/1Hf27QC
         7og1D3UoS6rJ0XH1YHRbRCT8yDjILpV88JGO4NxsP9XcP2JhGL0huXVw5tUnD4z1kLYw
         qeD5qVe0ErtVqHI6v0c9k+8+171PAZq1qqKolWyMLOkg0qBzs3C5UthMFhScnMYmCIg2
         jDO+sd0NFMB5PG09vpWyByWAgvMhy39ntDpsyXil9Zpc52q7snMp0x6YNFOPU6B38XJ9
         OD+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oigkThx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v27si4563346qth.270.2020.04.16.04.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 04:50:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oigkThx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP32n-0006bi-Aq
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 07:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47045)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP32c-0006au-F6
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 07:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP32a-0004kE-E7
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 07:50:46 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:41426
 helo=mail-oo1-xc41.google.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP32Y-0004jG-Pv
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 07:50:43 -0400
Received: by mail-oo1-xc41.google.com with SMTP id t3so583058oou.8
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LKuKZtmCFBBOmi/nYr8sqZGUnzBbIaXVXTkItTpLj8A=;
 b=oigkThx6KdQRyopIMQrInSKMs4GtZogaiLtjPtYL2f8MqEsn54NxZdO+f6NYn6wkCl
 lP8OwypkRNAynRyQjKF8MqbQEiZwcY0rN4F5Kr1KSDZ/pMikaeFdQOMnbyNlxtWCPgTv
 yPpsy9e1N4irqpEepX6TksKDQa7taGJA6W5RQiDoVuggglywclnrQ9BrcAfqmPFs3GpN
 rjzvGWycnQOmv5ytRGaFAE5tRw1CX/Jw/uATfm/mp0TSZDHQn1Lq3wdUPLdiuPLg5yLd
 gU2DMDnHucQ1irM2bFKeHHo13RY3J2tDzB3Gc/0bd4/asPv/eZ69EQDwsMNo51zQHh5U
 zUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LKuKZtmCFBBOmi/nYr8sqZGUnzBbIaXVXTkItTpLj8A=;
 b=tBBp4oEusPT6bheMtKt0ue/+NjKnGrhzdWQHjidh+94EXoMchSIQn7dZvs9NNkcKIY
 PC3ompo6otNOguKQASCZhAoEedxpIrrCj5fX0V31sXxEw1d0JQriHiSexf2HvXAIBiBC
 GJY37DmTN3z9amehxHQvB94V7IPChx4g22BfZYFNDS10swQ7E5twffGEpH4cKeazif3i
 rgg0O/ue6ChXUAK9CzkaKNyqik4W/FE9dbaNFbJU/N+Elzfw2Sd7GicsyDa33qyQIeVa
 PH3BlqF1wgKS5td+Z3W2+MaJ2aYfgVt9bN1wLW9tVR+wTR0OXBU7DpiCwnX227G57Pk1
 z0QA==
X-Gm-Message-State: AGi0PubLT79BENYZWEsPC/50N3Y9b43TdNUZddRJyrVefQ5obvtGgcGM
 qKu+iJvTTlq+d7v1f5oKt6WFRka+cLiMIlyaaGxn2g==
X-Received: by 2002:a4a:be89:: with SMTP id o9mr19951207oop.20.1587037841852; 
 Thu, 16 Apr 2020 04:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-2-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 12:50:30 +0100
Message-ID: <CAFEAcA_Y_9Pp2fRq-AScsZmbdDmAQgw4fJMLERmp9PJqD5UMHg@mail.gmail.com>
Subject: Re: [PATCH 01/16] accel/tcg: Add block comment for probe_access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
X-TUID: cEBVu4YbO6XV

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
