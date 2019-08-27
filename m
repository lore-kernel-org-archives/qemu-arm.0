Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4995601wrs;
        Tue, 27 Aug 2019 02:36:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxF+ZyUAChi0Bd5smiuGi0pGQPsA/qCN4/J6WiOk8PUZgFIVZpV2tBTPNy8Vw69jgBYcEIF
X-Received: by 2002:a05:6402:1285:: with SMTP id w5mr23481600edv.36.1566898565762;
        Tue, 27 Aug 2019 02:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566898565; cv=none;
        d=google.com; s=arc-20160816;
        b=BqpUSGJSOQklNeU4G7KaVSgUQj6dWjP9hfU97pYoGkANye8rAF9MY2OLHUcIPRDFAA
         VqVhfzGZpxLRUH8O4nbA4rlGZmoliKkXvlEDBXLwmi2wUDlbTGAwI3WnKMhhdQFYLDhu
         8fQYSmK/i+ai+1QVbVMamqG1ugD+D3/y0pKApPFJWm/zBjKMweJ+hGRw4I0jd71QqIyi
         Te+3qWKxM1B8h2h5l1JRYpAuaLK9TiuBp/ZqlMRucpMe4V/MIrSoGj+7oQI0afrGjW1/
         Gyh+EP6ubayPK4SeQ97ci0GYVgfdrxTwmtbPIU1J3DxD38n8y2nR5Sla+E3pGK+2OCHe
         MZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TO1fpXR52tpiFBbHwXUbh6JkTBfsaP57UT07kD4OE8c=;
        b=BNTZY2j/JjDD+b8ANJeBcSp+LOslAkJoq/4SSDmFYTnCSD0ko6LzHw/NMy0uyyTqIU
         5YpbKwvR5mNYf6PtMj/ZVHzzbmONbavZnwBGj0SgQQj6/x/iNqJlG5idgrfTtq060Ssa
         pwM7AK8Qv/OkF/zQt7a730JudB9QlMD3VVJEiK46eH+N+S+m4rKwjvIOENQnAclp+zE0
         K2M8SToWkXJ+Kuzd6Akody45y0WH1+d8RfS+V7sJ/H6WhBm/9+Ii8YsUlZqjyD2cRFp4
         C0L6v16UWKtROGVHOHgu+zSNRd6WHMJVDVikJRsUGJ5SKPT5Hq9qWeqb1dtor69JUbSq
         QkZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dd7VtJUS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30si9050691edm.309.2019.08.27.02.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 02:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dd7VtJUS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2XtU-0008K5-T4
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 05:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Xsh-0007nP-VM
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:35:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Xsg-0003Wq-VG
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:35:15 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43000)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2Xsg-0003WC-Np
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:35:14 -0400
Received: by mail-oi1-x243.google.com with SMTP id o6so14407160oic.9
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 02:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TO1fpXR52tpiFBbHwXUbh6JkTBfsaP57UT07kD4OE8c=;
 b=dd7VtJUSq26Q6gc41K58Fyu4SEqCDxxew0AjxvOnS/ijiw43MyhT19Zo4ee0DhxuBJ
 VfEKn0a0A2H5J116Ay242aMS5muwuLgvCsD8+ZYKZNBqNTwoijuX9I8gmztj0oZGJHM1
 Y7ZcGTaknWKkTQRb0LlacNBm54YY4+kZWXt0oDW6Wn3paaH6ZVyICLpwcRcXyjXii7/Z
 LJT98yS2pJ6878Dp7j6K8wS886+CPfvJOr9jg/zZ7v/op0HVZ36iZa36lJKAPA/TlgAf
 yEUqNz92QbVmdIr+CQOVRsmAsWrJA4ee+6MYO0z95IsY9j688MBo+rmGDmuQ3BZgEMqE
 HZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TO1fpXR52tpiFBbHwXUbh6JkTBfsaP57UT07kD4OE8c=;
 b=g3Dneikz/QJCqqG4QhSR4SpwpaZNjqJ737h9tDscUaXQ8jVdxpjz7DIhwL0oyvTEoi
 Y3EOZ8e29lG+kJR919suJQZOXqR3PuSXXiqndLslMQNrdddmipT4Gv9LUMXi2AnRU6YV
 yx56lnKFs/nPmM9cP5PI2MeVQZZkYV4dDJDw105sw7kLL5DxoKv+8F/Wb9Ah5oN5R8ca
 bgAhaYt+E78NfssWYLgbk5GpLU84wCEvDP1X1npDuvRs5YP40j+S/Rw7fOffkLCQi2Ej
 Zs/VosZJdzsO305oOtcCHnlrYaBiS2V7YDe6WlBe8pPribNx+Pq13oc33dtttjY7h8od
 XgTQ==
X-Gm-Message-State: APjAAAW1lQY6wEi8LP4K+rCBPAIoqHRXpRWatdDY+hNOsWCwyK/mhIRf
 U+kl0QGsrI6jvsQ+OSOB2e00G1gcDm20ZK0ykTq3Xg==
X-Received: by 2002:aca:50cb:: with SMTP id e194mr14344054oib.48.1566898513845; 
 Tue, 27 Aug 2019 02:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-68-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-68-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 10:35:02 +0100
Message-ID: <CAFEAcA96kJ0bozeqiBeCzQ9X4pXkaJZJMK=xeEyWiDa8XzsurA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v2 67/68] target/arm: Clean up
 disas_thumb_insn
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
X-TUID: dIVynjHFTaos

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that everything is converted, remove the rest of
> the legacy decode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 27 ++-------------------------
>  1 file changed, 2 insertions(+), 25 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
