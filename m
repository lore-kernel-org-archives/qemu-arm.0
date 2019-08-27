Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5007526wrs;
        Tue, 27 Aug 2019 02:49:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz8tJRGq4UpJVEbv2qADALo6CClxwKQ6Q7J2jkoInErthyO3vpV/Xof24qsJDpsoQ9Q9Ioq
X-Received: by 2002:a0c:e64e:: with SMTP id c14mr17008185qvn.117.1566899369340;
        Tue, 27 Aug 2019 02:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566899369; cv=none;
        d=google.com; s=arc-20160816;
        b=yXUopNJske/d4jyrhWK9uKA4/pN1+we8HMK6coR0j5k09lmDC359qyxxCf6QoPPHLg
         nCWRk4tK/Zy29ZmU8oT5ONup3ExHcuOda1WcIVKOC/S81r6lkbSZyKKM8kcTYEFJHXs9
         zaU8zoajfZeWA4ngdp93rm0oP1rOei1BqIAYgx6KPVhfOmb7gqZ/S0LM7bbqJcLjx8RI
         n/ak0Txl9SglMquP60fxPSwigTMYunGyuc23sAOBbDqqoi7JU+/zBUGz3eDD772LwWyJ
         As49kKANMcalGOfAW5kf46Rzf1PpKFVKTgaB/ltd98/Alw3oZSMEjkFPDS2dWUhadB/x
         XT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+LxfYnczmfkVOCS9NuTth/9LmeNCAq8MFuY9y9ur+xk=;
        b=Jp58MSmMDuD/kb0cmm6mxhKW/cNtq17BUsHrAaj7IkHa8ZErbwR3zAXeSJkV0rE4Vv
         uXw174CXDYCVMaKdAmulj2PzU6bQ38aSaxFjrk4G19n/rBGSIY2ihWYOnJsxkOqrlF7p
         UnsRQwLtDYI/YsQFtBeSdmr51luZSrdYPN2p+OdkwOf7fXQSEKleF2EWWixiEfzQl+O/
         WyqCOk4DAUBqwkTRTF3WaJ8+ADYNqUaqEF2mM2FhSD6xEvecxXkj/akBrwaY0vMOapCh
         beGeZ9XFt4jNSvqJSNOK5/I3vadKvOCvBU7gxmQ0p8nlwwnd/rtpWY8y3zEfAY3M3q9F
         yODQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=erydJuso;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si9692028qtb.285.2019.08.27.02.49.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 02:49:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=erydJuso;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Y6S-0002m5-SF
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 05:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Y4f-0001hB-6A
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:47:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Y4d-0008VL-Od
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:47:36 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36319)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2Y4d-0008UT-49
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:47:35 -0400
Received: by mail-ot1-x342.google.com with SMTP id k18so18092865otr.3
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+LxfYnczmfkVOCS9NuTth/9LmeNCAq8MFuY9y9ur+xk=;
 b=erydJusoO6985uD5RjWiqmYc7Q+Ac6wPZgOdvNFuKDUO2FX28OYxI/3xPlhmBdyDzF
 1QEc9VczyfaudlmYni6qhwn1YrM3sts3wt+w+acePl8aB3Cm2J5KU0UIrUOalUNvlW3H
 XEua1TMz1OBhoIIpTUQ4iqvvRGfuWmwEB6Fhdqw0w+8Sd2AuiiY3xmIkEn9cFkGWHLJN
 FpPaOTI+A60ceR9yxyGIdzyJ+/xII0lY543DJLfIyWWTmC9yYyuTFUIRopH0Hvghnm04
 /UxNiETkOIfCwGHE2uSSX0ed8+Qp28vWg+h4PCPnL2ER7Q3CiqfNsjgsv4RUZb6fdij/
 ZAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+LxfYnczmfkVOCS9NuTth/9LmeNCAq8MFuY9y9ur+xk=;
 b=YnafgoozGbg5TA13laH1y3Cu+0gMvJ0dtAC+aVre3CnHxMOb61y0DiyhxVfjjvQ2vK
 bkqH61tHLwWfMNioYrnY3pbPbMJOmBJ+RloUk8FWjFhqAyid3lqbKIWEuHfMkqNDvBcV
 hKNbKvmWgZOLJHv9ms6OSsMiVentArHPIGIqI4AKfFPkzgaWokm0P8g1ADY7fuIXbTsv
 ymaQp6CHcIJ7KbDnyhfyO9Talnztx/6vtOzJYpOzVro11yYmzlMbPRg1MyNJf8bKMeVC
 n9Z27yEHxUnZlG9MO65/CX0TPtpL8WpG5MV6BUADcxVknd7PXNP6xfu4SaR/dkpsqeBa
 EPog==
X-Gm-Message-State: APjAAAXfGdwMCC0fIfdhS9a4EB3e72jGsqTU20U7Pbn3lEb0MPyOOXB9
 VgJeEOwNQH6jsJNl0HVtAjbaV1sXO2dd5m5hWJZUGg==
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr2500729oti.91.1566899253393; 
 Tue, 27 Aug 2019 02:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <1566898915-3129-1-git-send-email-gengdongjiu@huawei.com>
In-Reply-To: <1566898915-3129-1-git-send-email-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 10:47:22 +0100
Message-ID: <CAFEAcA-QunKkEW1BUXrEZVt+QP_Wc=dd0JJpnE+ypkPrca9TXw@mail.gmail.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH] hw/arm/boot: Load the Non Linux initrd to
 the memory
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LO79+joa+gMz

On Tue, 27 Aug 2019 at 10:42, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
> Except support linux operation system, qemu also supports other
> operation system which is non linux, such as microkernel system.
>
> But now Qemu only load linux initrd, so change it to load both
> linux and Non-linux initrd Image.

We currently support two methods of booting:
 (1) using the boot protocol defined by the Linux kernel
     (which includes how to find the DTB, initrd, what the
     secondary CPUs do, and so on)
 (2) you're a 'bare-metal' image, in which case you get
     complete control of all the CPUs at once in the same
     way the hardware does. Raw hardware doesn't provide
     initrd files, and nor does QEMU.

This patch seems to be trying to introduce a third hybrid
thing. Is there a specification for whatever this boot
protocol is? How many guest OSes use it? Are they common?

If you want an initrd, you can always wrap your guest OS in
a shim which complies with the Linux kernel boot protocol.
I think that would be a better approach than this patch.

thanks
-- PMM
