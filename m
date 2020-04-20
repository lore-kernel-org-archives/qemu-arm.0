Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3597832lfm;
        Mon, 20 Apr 2020 02:04:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypJEU/CN7kGXbI5IhZdlstTLulGYgQyMp4Z5FLkwi9MRQpO85a+xP5PCqfp9a+Ev59MNvgqO
X-Received: by 2002:a37:ac10:: with SMTP id e16mr14022358qkm.97.1587373465691;
        Mon, 20 Apr 2020 02:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587373465; cv=none;
        d=google.com; s=arc-20160816;
        b=JVhmuTHgWKvFp2wf4ZbfjaE2OTRpJ+tne8FE+cd9ObGMQ3UNe6DkO4ibyYKsELO7gL
         iw2QvbOGKgcBrpZ4w7em6WJoGHAJShiXUsDATRsYjBRoPVUSqcj166KuUFCHRfl+Rm9m
         pxcOjJ45G2BPdaq/i3abXbDzAMLQlkGZoKfK18m5F5kyIcGUoNr3ikPUoPxOeYNJ+tvM
         KTN+MtbJae7WV6xtur5AQk0Wr2KYTW5WmjcIfmaoHQdIMIckdPoB3qNhabTyWEK1q5+g
         byf2jjVmXGpZg6B1C4int4o/v7nHxU0Izb68hKb77M+4VTRST1GxTT/uRSsuPJAlNsT2
         dAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEWtSFhrdXnNaDGlrw6fFEIcRZRyA0vza2uKJTdSmOk=;
        b=BwrJCU2uPrWmM185uzTsU5Xku5w36SvCIthkQh5plBFYy4ArT223Iey7XAEnZ/w+A4
         kuuvrmjiYmCWV1GrTh37ZRHZYDpOZxxXN3xHu3NkdJErPUlG88NdOSViY/dOJnUoKyyJ
         DrB3NaiimzSVL390Zn+sWFss4CkNrvqhgjPMHeNdf8vgfVll6MMwx2FLYDEtYQ4jqlr8
         O6fLjt/vjMr1CFbk5jOBhXxolYL2CwWj3daqqP1J/fAYKpK/IDaMTZjhMTAVRJ6tI3x0
         KTuIzXQOPf3Q48gUNOpzYvg2lgHXWkIAHGUvpGaadQT8Ji54B884zdww1LCm5NBpjQch
         FMfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qvDW9uja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l27si59016qve.86.2020.04.20.02.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 02:04:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qvDW9uja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQSLp-000124-06
	for alex.bennee@linaro.org; Mon, 20 Apr 2020 05:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQSLc-0000yU-Pj
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 05:04:13 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQSLb-0007ou-KJ
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 05:04:12 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36803)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQSLb-0007nj-7w
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 05:04:11 -0400
Received: by mail-ot1-x343.google.com with SMTP id b13so7434676oti.3
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2020 02:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YEWtSFhrdXnNaDGlrw6fFEIcRZRyA0vza2uKJTdSmOk=;
 b=qvDW9ujadIXOneCKqaMl9awocChxQkx0htfBA3v8NR6BX8ZZb4pWrMsjXyDKEcIATr
 eLWzc+753p7Dhh86HJlZncYeNmXtst8jXBaK6K7M2v6N9QyifdVlmZIj8D77u6xnT7dz
 7pryKXY1/MhDJQOc9ws8Sjv4QNvZG/dkUygHezFupBuX3v3N84QrljrBbJYi12Ma26jA
 tFXgi5sZ3a1vMXq4STa1F5a+8veR9v5md/l01sNQUCfoymVPLO3g/sbAcd7bg3+myAIo
 MAySzHceWrvpNw65Mo5lra5AhgZscE1nw1u1bQjUawKUZSk0UleEXSZ7sP4jXJ+oXrMQ
 +zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YEWtSFhrdXnNaDGlrw6fFEIcRZRyA0vza2uKJTdSmOk=;
 b=YQF2RLa6uA4SJ6COb6dFU5+Dxi07HMWJP3X5CrCF1FKu+GQHUHdcTTR2U16Zbk8dQW
 Nj0XD07ZFLqSV/TAGABqFLEVYW4dFlin+iPi+9miPJsGiFqlV1lRuI3ABIYgnoIiUwAc
 ck2FEKPKiHuL6GN4PDEkL4fTNR8w7M9m1ZNpfdKGmnQiCFfwpG5ZrWhL52bJymYiEY0E
 iALIsY7cXGj9zFsQFx8kKaqVsXKd7AitMVJYfYt5OtLL83qPiUBU4MUJQITTaeGqY1Hd
 k8XgoVT0sr93DxSw5SVp1S/rjdeh+j1ALeVxfBySaVw2ft6CL/UJDYVtbJP6+k+Rk3B9
 jh0g==
X-Gm-Message-State: AGi0PuaWegsD+aBy7g9qaVuOLTgqcf3hvWxdoh3DKr9f8hzD6788Owc8
 Uw4LC64RamA7+9zn6SniFhUaF+y6jKF9q15qqHNlrw==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr8693289otj.91.1587373449624; 
 Mon, 20 Apr 2020 02:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200417171736.441607-1-rfried.dev@gmail.com>
In-Reply-To: <20200417171736.441607-1-rfried.dev@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Apr 2020 10:03:58 +0100
Message-ID: <CAFEAcA8brVNH4i_psLN3fdqSrw9Nuza9OU-f6cv5b-XDdwQaaQ@mail.gmail.com>
Subject: Re: [PATCH v2] Cadence: gem: fix wraparound in 64bit descriptors
To: Ramon Fried <rfried.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /YESSjrIUoH1

On Fri, 17 Apr 2020 at 18:17, Ramon Fried <rfried.dev@gmail.com> wrote:
>
> Wraparound of TX descriptor cyclic buffer only updated
> the low 32 bits of the descriptor.
> Fix that by checking if we're working with 64bit descriptors.
>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
> v2: Fix indention problem.
>
>  hw/net/cadence_gem.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)



Applied to target-arm.next for 5.1, thanks.

-- PMM
