Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1872956lfm;
        Thu, 16 Apr 2020 07:22:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypIuaVwzE1+zUwq2xRpGC6o2Yva0QEwFsJaOkEonrwBjKndxgQr2mtgH4gfhlD79VIo84Ktp
X-Received: by 2002:ac8:6b86:: with SMTP id z6mr26040142qts.293.1587046933146;
        Thu, 16 Apr 2020 07:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587046933; cv=none;
        d=google.com; s=arc-20160816;
        b=MmxJqBDfQCzkYsUsp/eGYNoZlVB7hXwndfhwGgT1yAfkN8crJwIQmSvK8eRbyIgg3U
         UqpHlybaRk/QJ/zyQHgF4kkRMIlysKOlfHluHDxKMseCNGGKSNoWk+GBxxBirzMs6Gka
         glSiZ5o3BihJMqWd3ZGQ9ZajTZSfOHXtWewisKPadh3VzR7V4MYbMFjdbiL6BOxjgbQR
         G7kjmIHAvc5yi5fiVgWvfytkBbakZWkBglG+JFeURCNpkLo/Jx4FIKoMNqGLYTCdVQjc
         3VlwbuTEhjlhI8QdZ+bh5yuOwdRLfgEbwM3sOTeJXln4sJm6SWLpJ8RQdwPn4sNqJ+PM
         cmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WZ9gBOnZkR+w5AZji1QgSi2rpgUv4KYH+pVA6xYbRPA=;
        b=FNaVfYyLzFiba2phmQ6NCCLE4QVOJHBcmE9AYwtTknFzCFw0Ze5EENc74OxNdj73JA
         7NqWY55zRX8Q8BI6D1pCGWYdLW9V1VOoKp20uWxlVHzLUEfvRzngFQAJ99cxkaFFxCvF
         HKLke+1xKiPGjCheuKeBAT6sY2ECzfQtXP3eh8tpnRYUtxNLY+GGltpOOsTcRG1enHEE
         gcZI6DtuTX2MAzgSCWYVRoYZVwwX3PwTpa19kBXmJ9BpPVjAwSR3gTPLhmIr771UHi3N
         dK4LBsQl2Xyg8/JJs0hjp7Se61Z3/Xv29kHA8FOa8KJaIL0XYvLHn4yUOBZUSL6Xobbe
         Petg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WI2WvsMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 193si11603723qke.71.2020.04.16.07.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 07:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WI2WvsMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP5PA-0005gl-Ik
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 10:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5P2-0005f4-LS
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:22:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5P1-0007T2-MM
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:22:04 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42652)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5P1-0007Sf-EC
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:22:03 -0400
Received: by mail-oi1-x243.google.com with SMTP id d7so11641270oif.9
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WZ9gBOnZkR+w5AZji1QgSi2rpgUv4KYH+pVA6xYbRPA=;
 b=WI2WvsMKIE/aErhc1QKm7sAdGym79z1mHj2jzGOPH1rPw/wSjmVaUnIHakhymv8LM/
 hBunMPBXHuW4a30XGx/CBd3aV+3Cq+oVhIWVa2JgCbEkiviZQ19pDQDe3UQuTb3eAXiC
 Hyn5tNPM6XkqRMXY4zNBAEpBhgCku1lRWriLE/R81PjwozazFNDHRldt3QWZ3BHB+T77
 PQspwye5zaXNf6CqNMqGnHSiVS3fAqOV6iLAPtf7xrZ3A8wc/fpL7P7uecYM/uBHdyLe
 qN6cKxwXIGGReYTa4PzFYpNlK8wfzeglWIbfGJccu3985qWomvOt0XQkCSyXES1c46bQ
 CDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WZ9gBOnZkR+w5AZji1QgSi2rpgUv4KYH+pVA6xYbRPA=;
 b=Wd1PdEp8icdZTMf6Q1pOn4ml+yYOrdui644NKJedJmqod5xw/ek/oXkxJKDIvW2Qnb
 Cp3zWk4pTVc4VM+1d/JM2tEu3pqN6r/fhAhWCzZ+qlmUYvQkmfjwbGfD3K8iMle4EeAI
 k9sN9hRJD5EwzsrC5FcfueGAVGz+ZUoUqQOpg2b0V2NnDVncYHHnPg1fq9oikKly4BYA
 H5WNGqj2tqdM762fLebg5BlTr3wGLvNy1wQzXPN7+Ro8Eew5IAGpC7WDnyjehBaGlrmm
 L2LJVPASOyq08CrWilxlTlCXkrBtzgVfyt+SUpfcq4UblZRbXEjM84LxmZz0myQbFR7T
 LdMg==
X-Gm-Message-State: AGi0Pubasn4W5qI/PfnwqJPzy+Uv67M2xs69418opyInIKG3AaqfXNEK
 mIghYSxnBd5BUj9w0BW7xV8iAY53fNa8EXwtSp9p8iXFOLE=
X-Received: by 2002:aca:dc56:: with SMTP id t83mr2893971oig.48.1587046922400; 
 Thu, 16 Apr 2020 07:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-16-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:21:50 +0100
Message-ID: <CAFEAcA8hPAGSjKraTUQ99BwgROMA_BHcsUvJeCi=9vgeh04Msw@mail.gmail.com>
Subject: Re: [PATCH 15/16] target/arm: Reuse sve_probe_page for gather loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-TUID: l9WI6k1fH6PM

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 208 +++++++++++++++++++++-------------------
>  1 file changed, 109 insertions(+), 99 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
