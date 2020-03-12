Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp550433lfc;
        Thu, 12 Mar 2020 05:08:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu70FpNtLZbsLNA0Dn7YerR8YuCHWTVvCWL7y2bQA4Tae/w8TumzDE2VuodRz4y2LQ4jnM9
X-Received: by 2002:a37:490:: with SMTP id 138mr7411636qke.378.1584014891462;
        Thu, 12 Mar 2020 05:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584014890; cv=none;
        d=google.com; s=arc-20160816;
        b=sBQv3EYrZ9VeAu3QnFDqD2zeG5TUKc8prlQvcjabhR5o1Hmqb18zQ7IJNpkUwYBPVc
         zW5nc7pCIEuZijAze7gFhHgmYh9tmWC/aaAwtn/ruV8z30guvJRaHEgcExFDzUcUgbqj
         SJUs/jHrmAp+/OsXUIDq9DJy6yLu7KCxo73qqUritnKvVb9YYJ3mr7uQKz8w3FFErWlH
         Qb4Y9FAlc8jXnmoU2em17jh341S15WWIGeyF+fArFMXdGmP15xg0+VOQEqKOp3IKqOY9
         pt/TedB1XAZUw4Am9uwoTQUFWz2W2/apamhfsFbqqjWQZCYFUN9kLgiPJgrCvo2Xxihs
         U/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tHYrDMVb220UMVs2+9QuEEQTPM5/i9JloyJzmFNIQgI=;
        b=a+k98ih7ovGb0+NfzKJVye8r/WnIbLZjFKZAUFApa4LpmyoxQybQfd1x9MS8RjDHj+
         4B/Wbhf6aMBrTP+seNl10F1Nq+K21lOE7jpJs4MvebtKdKlzrdY93Y/LYbG1t/yk1Dl/
         5DxY7FP+vfAevPhBZO2SAEt+eVh5+kpAsXcfaRxuksCa1/ro2Su6KHX0e+Qr88iPilwQ
         PA7pX4//1VKEddY1ZWzvmDqHh9t/7h1u8zjc8twS3WkDJtn6wkFt60DgsACUVj+lMfXL
         ok6CPpgjYMwiCJXVl7BSeJLObrkcIx15hinXI9CNk7ODYVGpY00oW0LB62iXao5uzYYL
         ff3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fjakDQc2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z27si2290180qtj.146.2020.03.12.05.08.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 05:08:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fjakDQc2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCMdF-0007qq-VN
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 08:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMd8-0007qU-28
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 08:08:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMd6-0002HM-Qx
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 08:08:01 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42749)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCMd6-0002Fd-Ld
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 08:08:00 -0400
Received: by mail-ot1-x341.google.com with SMTP id 66so5871738otd.9
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2020 05:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tHYrDMVb220UMVs2+9QuEEQTPM5/i9JloyJzmFNIQgI=;
 b=fjakDQc20ZQMd+HcIKxZMjZqbpggBR59F/RSRfpRF8nyxdnm1FeiiQypmSgrSJ5FwZ
 g88vsFAOuLs8DRTlRKVdW4o0/PKgZv3z5bZsZ9KimtDWzbmp2vLA5Md6e35v9mKiShQT
 n547vdbuz0gfnn/LNLZ9LaXpeQZ3e6+zoSKRsF20MTm4DkbgITmBMjCHkoP7FBsyCSwj
 Ac1Nj2dudpCnmYQPWkiQqaVS3RmGG+y/Z6nnb70xpIwiLrb+annXBpwRaogQaiGU8WNl
 6frzStqbhn5NKz/uBDY4AVLRpFT154ca0sAd02yP9j1uezy/i1AmsmUH5FlzEvGRiDEQ
 jTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tHYrDMVb220UMVs2+9QuEEQTPM5/i9JloyJzmFNIQgI=;
 b=R0rpdSbFuGiDxzrNquDJt80jYmxAR0h8rCNvqaS2v+cdwqT0D8lGAA6CgFGuwivcPO
 0ol6n3+xLOlj9giLrjikHOq4J1WnnfDFdE1bTWN9ykusJdZsC+Vo8XlRYPneHAPxA5Fw
 S28S4Nvortg2yFGIXLTeftN1cV01C4++rAaQ7un+HqbrjgV8D7f3zABogQRlYKQp25qi
 C7YZKOXv4+vW9VsvsQ7x7dFm4Y6iYyUgXyUU07933sKsd/M5xjqbYGeWrMFfkK1r9p8o
 3YZgG9x5w+BDKZ/kVFWMrO7wwyMtpefkfEbkdmfJnx7gECe7QVDA0Bhs17w899q6Yvq4
 fIjg==
X-Gm-Message-State: ANhLgQ3Rj7lTSFEKnmcoJ2tSxpiGQWwUB0ImcLVHKsCoem09u7Z9WqV8
 XRbuM3io69N1oofwl6xS7A7AQVaTBSIPSJPK8KVbHQ==
X-Received: by 2002:a4a:9d08:: with SMTP id w8mr3732955ooj.64.1584014879606;
 Thu, 12 Mar 2020 05:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <158387822543.945.6014167629593674326@39012742ff91>
 <d07cc722-247b-4976-dd3b-00e3bdd5c808@roeck-us.net>
In-Reply-To: <d07cc722-247b-4976-dd3b-00e3bdd5c808@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 12:07:48 +0000
Message-ID: <CAFEAcA-uXmQGV2n6WJ9_rv1cbZPj2MQ4LWVk0TOdXYj3jnwyrw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Wire up USB controllers in i.MX6 emulations
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Jean-Christophe DUBOIS <jcd@tribudubois.net>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aS/hlcDwgCTm

On Tue, 10 Mar 2020 at 22:54, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 3/10/20 3:10 PM, no-reply@patchew.org wrote:
> > Patchew URL: https://patchew.org/QEMU/20200310210434.31544-1-linux@roeck-us.net/
> >
> >
> >
> > Hi,
> >
> > This series failed the asan build test. Please find the testing commands and
> > their output below. If you have Docker installed, you can probably reproduce it
> > locally.
> >
>
> I have no clue what this log tries to tell me. On the plus side (well, kind of),
> it looks like other patch series experience the same problem, so my working
> assumption is that this is either a test infrastructure problem, or that it is
> caused by some other patch which already made it into qemu.

Yeah, it's an existing problem in master (one of our tests fails for
some reason on this one config in patchew, but we haven't yet been
able to debug why). We'll either turn off the patchew config again
or disable the test.

thanks
-- PMM
